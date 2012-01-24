# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.
_rbtest_with_rake() {
  if [ -f $1 ]; then
    case `echo $1 | cut -f 2 -d '/'` in
      unit)
        task='test:units'
        ;;
      functional)
        task='test:functionals'
        ;;
      integration)
        task='test:integration'
        ;;
      *)
        task='test'
        ;;
    esac
    bundle exec rake $task TEST=$1
  else
    bundle exec rake test
  fi
}
eval "function rbtest () { _rbtest_with_rake \$@}"
