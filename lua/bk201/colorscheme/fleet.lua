local status_ok, fleet = pcall(require, "fleet-theme");

if not status_ok then
  print("unable to load fleet-theme");
  return
end

fleet.setup({
  overrides = {
    background = "NONE"
  }
});
