Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E737B022
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781727470; cv=pass; b=sbZlnEnHCesuvuaEytHFJgdh5r+wZOe2CV55XvTw5KhPLbmIBus98eEOZyKu+toJkYhCFdu2coXz2VLYwd8fZjrZJ8hcBF+zAD2FInvF87rQHRAY6CxDWAo/glS5oNw5cStk8mF3GbgX2aJAKY9l/SPMi/xQykqP/XpWKbOT+us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781727470; c=relaxed/simple;
	bh=Q9Tg5HXtBgjaBlJcgN82i6LPP5PISH66DDdSazi6cU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANRiIFhA4T9gw64aRCSN7CarInI8lFdeezFguzlwXZOR2Lrzg+aP/VdR+27/xxQL8wj7IFC56DWw7GIv9vnrcSoV3cVymCOH+rnEfOhmBblH64xug2ftRVGN6emPiPzCaGKidT9hZ2ymMisdQKWLaIsDRYlx2XDaMoGmmeCFdLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCn5o+MH; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCn5o+MH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so194287f8f.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781727466; cv=none;
        d=google.com; s=arc-20240605;
        b=OSM8lm1COwY+eoNMaYJBhf9v3CMS/fuLxHQ6hNibb/W/lql+1Xiam05AeGhYRWurqR
         jCG81eUVe1Bg8jne3TuXpIXCvXWg5OfnYF7+2icI9KorhR09oum4OmOK72POT5qGO9Vz
         CYWklytQeD16R1L8eo7X8uUKOg+TS0fT+d600eZV0P8smnAzjJ92JQ36pQUzoqcutlX/
         rXeIPHERajce6VIRnRyozh0j5PYNtZaLy9hQnWFg/q/rTC7WbZvAytZzEY2Xie4jWu33
         iIo5upgCkSu9yYEBwFnHCcgWSRGWt+xjnWuNh0uirGex7TG4jn67xnrgVRKOviomB6Cu
         PjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        fh=dmzfzQ7F4dFHbTC+HZhzhtYbA5w6MDjTH8LS2k6rd/U=;
        b=CYS/XjbxptVvP2A91Ph7u6YBK4yycDclx2ClEgu32s3op/bQfe2YDG6/ZxB0f1cXJ8
         ZMo9ajwRUKgeAD71ggVWhqTH4c4+hzcUd9t7h1l+XgjiErP91DIacaOZ2ic6Dt2sRpsx
         ndnVQ3r+KsQ4/A1IQvUe7b0a9bHnaCS+wZHeYcnwU9Z7QBUrD5e2PSaonP8/F8lmDjHo
         tM3U2yN9rEuCovQlrp36qcNdYsvyP61Kgee3byIO2ByQrlmiH0mzNQn+UusV8fns6EVL
         gDQeGnc56XCOOqr7lbeIpL94lRDprJl1HTlbexrpjF0iB7tP4rkLfLo5+tsbPs9FnKHj
         kdQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781727466; x=1782332266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        b=rCn5o+MH6S/4HWuqYm4hJHfhmmTGZN6OpcAuGGIcW9ZFhkonUtPh+hufxTVhUxeICK
         iVqOxP3xUf8gn05TMnwP95gnoJsnvulceVBZlI8G1eJLIZuYHU2jBqnxlS2cbc4pM19J
         P20RAENfZT7JPUlpanxvIOInd9MSMcXhDV1BpV2pFcgo//snA9Zx29PaU/FVVlvy2+lt
         rUyJWEiNu5ipEhlgfSlnvRgdKD9J9Rt/kEeTLJrMgUepf79VWousmIu9m4w5yKkqYMOu
         GG1WUHQzaLFdvHi74A+COu6xdH7fLXCI3/x8Hgmwfd+aiNHeKQ2NoyJ/SQT1e81sq7sO
         QJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781727466; x=1782332266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        b=kNzVbpjFkS3ND5Dqd9ju9plXF27jxIe9ld5bPnJYFIdPvShm2WpgohzTTB+4Ndm11h
         2X17xEJMirFTSRNr0tTULW4Sq9XpfTHYPdsKw0/NZNOGQiwdbPl+eQen0kRv+bXjmcuR
         vDJ6fTUEaYQ9XVkPVutFd5XG1Zs55q1O0SDDHhpbPL0S4BaKe4xIcrrbCHtwhrfMFAdl
         QGYcZ3MV9omySOo/wxxLmJ0Dag/GHO6CF+PPxr6au8vLWTI3gmNQ/IkjOjze6lp+tr11
         cKsIGOesXt+yV9+BevQuLTVMBiMyfVZnzPXB1kwWi7XmCMmDyEScmiJOu3PiSAAxuLZS
         zfpA==
X-Forwarded-Encrypted: i=1; AFNElJ/i+XZMcrT+Du1faubKtFtdq+rYozYfXjQGvFtmdwaDmECXivqGzGnd6LsMzhh512micbcnNbLWnust@vger.kernel.org
X-Gm-Message-State: AOJu0YxFg5hMcr/pFxZK2BLDMfJYv+3hWIfQqZ8p5dUC028/KGmDpVXy
	R25W+aaqCWhZDymmEb/860YflhliaA0i489iUr3xEAwkpmfDUuX9+oPx6IZqIdmtxkh6tyBH2dy
	7U02QPWBlAfPxsObQuNfOuYOBLda1psE=
X-Gm-Gg: AfdE7ck5gulJ85ccGpYfvSYUNOHC2kmCzaFwRae/sTMBaUNlVNEwAjG5RpscIxc9EKE
	MMPrVbj47ab9+OVLDScAcX3pmioZhtQqTNojyE83K7D0DcY94/7DwbnRmYaHPkCK7nxUus6C8Yv
	nZ2izq97fOuACHKlWatQtTujqrfHAL9FKpZmkVQAxd0lVr6vt8V2jNJITA4Zpa5rh8S3e7Z/Mbh
	dtJMShR9ljmwI+Fx/xvz64e/NHStrkyNJHfawdBjVJLeZUSkxJuYxSA6P8PY5EOjJ1WiBd4BbQp
	EhCHiSC2RxtmrMHyFgYKRJaUxii1wn0P+bvy2txa9JVSMBSIqxk165acEBDloU8kUoZdcg==
X-Received: by 2002:a05:6000:608:b0:460:64e8:2553 with SMTP id
 ffacd0b85a97d-463ab7024c1mr1161137f8f.4.1781727465727; Wed, 17 Jun 2026
 13:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
In-Reply-To: <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:17:19 +0100
X-Gm-Features: AVVi8CcvqvFDB97cccuGqXXMZPwXSO4sA5oZyLX7YfroXbBiGEnNUoByjqYmvPY
Message-ID: <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jun 17, 2026 at 10:48=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce a per-SoC PLL reference input frequency parameter to avoid
> > relying on a hardcoded 24MHz constant during PLL configuration math.
> >
> > Add an input_fref member to struct rzv2h_pll_limits. In the core
> > calculation helper rzv2h_get_pll_pars(), derive the base input clock
> > rate from limits->input_fref, utilizing the conditional ternary operato=
r
> > to fall back to 24MHz if the struct field is left uninitialized (0), an=
d
> > drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
> >
> > This abstraction permits the reuse of the common PLL divider logic on
> > newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL referen=
ce
> > clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> > disrupting existing platforms.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * various parameters used to configure a PLL. These limits ensure
> >   * the PLL operates within valid and stable ranges.
> >   *
> > + * @input_fref: Reference input frequency to the PLL (in MHz). If set
>
> "in Hz", as pointed out by Sashiko.
>
Agreed.

> > + * to 0, a default value of 24MHz is used.
> > + *
I'll also replace `24MHz` to `24000000 Hz`.

Cheers,
Prabhakar

> >   * @fout: Output frequency range (in MHz)
> >   * @fout.min: Minimum allowed output frequency
> >   * @fout.max: Maximum allowed output frequency
> > @@ -78,6 +81,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * @k.max: Maximum delta-sigma value
> >   */
> >  struct rzv2h_pll_limits {
> > +       u32 input_fref;
> > +
> >         struct {
> >                 u32 min;
> >                 u32 max;
>
> The rest LGTM, so with the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
