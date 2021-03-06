from django.shortcuts import render
from django.views.generic import TemplateView

from probarser.analysis import Analysis
from probarser.forms import InputForm
from probarser.processing import Processing


# Create your views here.
class HomeView(TemplateView):
    template_name = 'probarser/home.html'
    analyzer = Analysis()

    def get(self, request):
        form = InputForm()
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = InputForm(request.POST)
        if form.is_valid():
            query = Processing(form.cleaned_data["text"], self.analyzer)
            output_data = query.process(form.cleaned_data["text"])
            stanford_draws = query.draw_trees(output_data, 'stanford', 0)
            bikel_draws = query.draw_trees(output_data, 'bikel', 1)
            args = {'form' : form, 'tagging' : query.input_text, 'pos' : 'PoS Tagging',
                    'stanford' : 'Stanford Parser', 'bikel' : 'Bikel Parser',
                    'stanford_trees' : zip(output_data[0], stanford_draws),
                    'bikel_trees' : zip(output_data[1], bikel_draws),
                    'precision' : output_data[2], 'recall' : output_data[3], 'score' : output_data[4]
                    }
            return render(request, self.template_name, args)
