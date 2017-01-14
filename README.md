# Seneca Cave Challenge

This repo houses my solution to the Seneca Systems cave challenge.

The solution script was submitted by the following bash command:

```bash
curl -d "{ \"token\": \"5ezbxcT8KATNwcBxwr298j\", \"language\":\"ruby\", \"instructions\": \"The solver script takes 1 argument, path to a file containing the encoded challenge string. Run with: \`ruby ./seneca-challenge.rb path/to/challnges_string\`\", \"script\": \"IyEvdXNyL2Jpbi9lbnYgcnVieQpyZXF1aXJlICJqc29uIgpyZXF1aXJlICJi\nYXNlNjQiCgpjbGFzcyBUaWxlCiAgU1RBUlRfVElMRSA9ID9zCiAgUElDS0FY\nRSA9ID9wCiAgUE9JTlQgPSAvWzEtOV0vCiAgTU9WRVMgPSB7IAogICAgbDog\neyB4OiAtMSwgeTogMCB9LAogICAgcjogeyB4OiAxLCB5OiAwIH0sCiAgICB1\nOiB7IHg6IDAsIHk6IC0xIH0sCiAgICBkOiB7IHg6IDAsIHk6IDEgfQogIH0K\nICBhdHRyX3JlYWRlciA6eCwgOnksIDptb3ZlCiAgCiAgZGVmIGluaXRpYWxp\nemUoeCwgeSwgZmFjZTogU1RBUlRfVElMRSwgbW92ZTogbmlsKQogICAgQHgs\nIEB5ID0geCwgeQogICAgQGZhY2UsIEBtb3ZlID0gZmFjZSwgbW92ZQogIGVu\nZAoKICBkZWYgc2NvcmUKICAgIEBmYWNlID1+IFBPSU5UID8gQGZhY2UudG9f\naSA6IDAKICBlbmQKCiAgZGVmIHJlYWNoYWJsZV9uZWlnaGJvcnMoZ3JpZCwg\ndywgaCwgdmlzaXRlZCA9IFtdKQogICAgTU9WRVMubWFwIGRvIHwobW92ZSwg\nb2Zmc2V0cyl8CiAgICAgIHgyLCB5MiA9IHggKyBvZmZzZXRzWzp4XSwgeSAr\nIG9mZnNldHNbOnldCiAgICAgIG5leHQgaWYgY29sbGlzaW9uPyB4MiwgeTIs\nIHcsIGgsIHZpc2l0ZWQKICAgICAgVGlsZS5uZXcgeDIsIHkyLCBmYWNlOiBn\ncmlkW3kyXVt4Ml0sIG1vdmU6IG1vdmUKICAgIGVuZC5jb21wYWN0CiAgZW5k\nCgogIGRlZiBpbj8oeCwgeSkKICAgIEB4ID09IHggJiYgQHkgPT0geQogIGVu\nZAoKICBkZWYgaGFzX3BpY2theGU/CiAgICBAZmFjZSA9PSBQSUNLQVhFCiAg\nZW5kCgogIHByaXZhdGUKCiAgZGVmIGNvbGxpc2lvbj8oeCwgeSwgdywgaCwg\ndmlzaXRlZCkKICAgIHdpdGhpbl9ib3VuZHMgPSAoMC4udykuaW5jbHVkZT8o\neCkgJiYgKDAuLmgpLmluY2x1ZGU/KHkpCiAgICAhd2l0aGluX2JvdW5kcyB8\nfCB2aXNpdGVkLmFueT8geyB8dGlsZXwgdGlsZS5pbj8geCwgeSB9CiAgZW5k\nCmVuZAoKY2xhc3MgQ2F2ZSAKICBhdHRyX3JlYWRlciA6d2lkdGgsIDpoZWln\naHQKCiAgZGVmIGluaXRpYWxpemUoZ3JpZCwgbWF4X21vdmVzKQogICAgQGdy\naWQsIEBtYXhfbW92ZXMgPSBncmlkLCBtYXhfbW92ZXMKICAgIEBtb3Zlcywg\nQG11bHRpcGxpZXIsIEBzY29yZSA9IFtdLCAxLCAwCiAgICBAd2lkdGgsIEBo\nZWlnaHQgPSBAZ3JpZC5maXJzdC5zaXplLCBAZ3JpZC5zaXplCiAgICBAY3Vy\ncmVudF90aWxlID0gVGlsZS5uZXcgc3RhcnRfdGlsZV9pbmRleCwgc3RhcnRf\ncm93X2luZGV4CiAgICBAdmlzaXRlZCA9IFtAY3VycmVudF90aWxlXQogIGVu\nZAoKICBkZWYgc29sdmUKICAgIEB0aWxlcyA9IEBjdXJyZW50X3RpbGUucmVh\nY2hhYmxlX25laWdoYm9ycyBAZ3JpZCwgQHdpZHRoLCBAaGVpZ2h0LCBAdmlz\naXRlZAogICAgcmV0dXJuIHNvbHV0aW9uIGlmIEB0aWxlcy5ub25lPwoKICAg\nIEB2aXNpdGVkIDw8IEBjdXJyZW50X3RpbGUgPSBiZXN0X3RpbGUKICAgIEBt\nb3ZlcyA8PCBAY3VycmVudF90aWxlLm1vdmUKICAgIEBtdWx0aXBsaWVyICs9\nIDEgaWYgQGN1cnJlbnRfdGlsZS5oYXNfcGlja2F4ZT8KICAgIEBzY29yZSAr\nPSBAbXVsdGlwbGllciAqIEBjdXJyZW50X3RpbGUuc2NvcmUKCiAgICBAbW92\nZXMuc2l6ZSA9PSBAbWF4X21vdmVzID8gc29sdXRpb24gOiBzb2x2ZQogIGVu\nZAoKICBwcml2YXRlCgogIGRlZiBzb2x1dGlvbgogICAgeyBtb3ZlczogQG1v\ndmVzLmpvaW4sIHNjb3JlOiBAc2NvcmUgfQogIGVuZAoKICBkZWYgYmVzdF90\naWxlCiAgICBAdGlsZXMuZmluZCAmOmhhc19waWNrYXhlPyBvciBAdGlsZXMu\nbWF4X2J5ICY6c2NvcmUKICBlbmQKCiAgZGVmIHN0YXJ0X3RpbGVfaW5kZXgK\nICAgIEBncmlkW3N0YXJ0X3Jvd19pbmRleF0uaW5kZXggVGlsZTo6U1RBUlRf\nVElMRQogIGVuZAoKICBkZWYgc3RhcnRfcm93X2luZGV4CiAgICBAZ3JpZC5p\nbmRleCB7IHxyb3d8IHJvdy5pbmNsdWRlPyBUaWxlOjpTVEFSVF9USUxFIH0K\nICBlbmQKZW5kCgpjbGFzcyBTcGVsdW5rZXIKICBkZWYgc29sdmUoY2hhbGxl\nbmdlcykKICAgIEBzb2x1dGlvbnMgPSBjaGFsbGVuZ2VzLm1hcCBkbyB8Y2hh\nbGxlbmdlfAogICAgICBncmlkID0gcGFyc2VfbGF5b3V0IGNoYWxsZW5nZS5m\nZXRjaCAibGF5b3V0IgogICAgICBjYXZlID0gQ2F2ZS5uZXcgZ3JpZCwgY2hh\nbGxlbmdlLmZldGNoKCJtb3ZlcyIpCiAgICAgIGNhdmUuc29sdmUKICAgIGVu\nZAogICAgeyBzY29yZTogc3VtX3Njb3Jlcywgc29sdXRpb25zOiBsaXN0X3Nv\nbHV0aW9ucyB9CiAgZW5kCgogIHByaXZhdGUKCiAgZGVmIHN1bV9zY29yZXMK\nICAgIEBzb2x1dGlvbnMuaW5qZWN0KDApIHsgfGEsIHN8IGEgKyBzWzpzY29y\nZV0gfQogIGVuZAoKICBkZWYgbGlzdF9zb2x1dGlvbnMKICAgIEBzb2x1dGlv\nbnMubWFwe3xzfHNbOm1vdmVzXX0uam9pbigiLCIpCiAgZW5kCgogIGRlZiBw\nYXJzZV9sYXlvdXQobGF5b3V0KQogICAgbGF5b3V0LnNwbGl0KD8sKS5tYXAg\nJjpjaGFycwogIGVuZAplbmQKCmlmICQwID09IF9fRklMRV9fCiAgU1RERVJS\nLnB1dHMgIm1pc3NpbmcgYXJndW1lbnQgRklMRU5BTUUiIGFuZCBleGl0IDEg\naWYgQVJHVlswXS5uaWw/CiAgZW5jb2RlZCA9IEZpbGUucmVhZCBBUkdWWzBd\nCiAgY2hhbGxlbmdlcyA9IEpTT04ucGFyc2UgQmFzZTY0LmRlY29kZTY0ICIj\ne2VuY29kZWR9IgogIHB1dHMgU3BlbHVua2VyLm5ldy5zb2x2ZSBjaGFsbGVu\nZ2VzCmVuZA==\n\", \"solution\": \"dlluurrul,drdldrrruu,rrrrrrrruluulldr,lulldldldldllluullllulul,ddddrurrurrrrrdldlldrddrurrddllld,rruuldllluurulurrurrullulullulllluulldldll,ulluurrulluuuululldddrurddlllulullurrrullulldldllululdlddldllluululllddlllullddr,luuluurrdrrrull,uurrrulllulluurrullulullllllulldlullddlllldlulldllldllldll,dldlluluuuuruurrddrrdrrruruuuuurrrurrrdlddldlldluurul,ruulululuulldldrdlldldrdrrdlldluu,lddrrrddrddlddrurrrrrurruuuurrrdddrrddlldlullldldllllllldldldldddldlluuurrulllllluluulullldrdrrdlldllluullluldlluuulluldlldllddllllllululdllllu,urrrrrrururrrururrdrdllldllldlddlldlddrrrrurrruurrrururrurru,rdrdlllulldldlululuulullldlllluuurrdldrruurrullurrrrrruululdldlllllllllllddldllldllluururdrrrululuuurullullulllldluulluluurrdrdrrrurrdldlll,ulllllluulldllulllldldldlllllldlllulllululdluuuruulurrrdrrurdddllldrrrdruruluurrulullllulllluuuuuurruulluuruuluuruluurrrddldrrdlddrddrdllull,rruruuldlluldlulluluuruuululddrdllluuldllulddddrurrdddlldrdldllllulllldlllullullururruurruulluuluurrdrdldrrrdldrrrrruuuluulllurrrurdrdldrrdldrdddldllur\" }" http://seneca-mining-challenge.herokuapp.com/attempts/finish
```