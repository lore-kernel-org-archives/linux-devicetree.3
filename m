Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ABC3D34A5
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670706; cv=pass; b=rmQGwfEiMrdLcCjnNFXMqz1eRe4adQ1uDkaNU07D7NwTptcYUX1z2JpQEMOCt+277N5oi9vWk3ze1EZ0HVLfnOoc6RX+HRDvQ1E8bM50l4ghHH+PLyfZoHTKBw7SadKJfvRU/DHbWD+NkCjV05HvzGamcK3QgTj67gUOQCAd7Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670706; c=relaxed/simple;
	bh=V99FgU+T9GXepKQjZbwcvobP8EXHRxrvdmdHmWGWLss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHff4cIpSG9nEW3KspP1LrJXfNEXtReJN9Y/SCjOhsDGIscIAoV2prOIToChNVf83I+3UVQ97CUReoLTfqEyo2hYJfwQhGRtp9D9BLFWqJz74k/O2C18mIOKZy0vpOn9frd83fc7s8mgIj9WcRjJiXSlGwbxFfeBo4gaDxoMpgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDEG+Jds; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDEG+Jds"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so4531856a12.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 07:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780670700; cv=none;
        d=google.com; s=arc-20240605;
        b=WYRDGjeaHXVHl4ZSz8Wx0d4fhd6rEnz9BWwM5peDUTAoF2BKK6UWidDU8oAL5EZFI7
         2PUaBsTowDVztCt2gvDG+CpXP94tFR6UzNJ4Bxl546MGTdI1ZGo9rdkyryIEBxRcQQfn
         BLlQQjcnO1Lpwx6wDzypNux3tZd5OMHQi6Fg1nbQxCnmE/fgw7K5s2Hwsv/35tAg9uHh
         g6QWIuWixw6WEF6hi+gPngAKbxoP43X2FO4CTWSr+vHNslTaDiX8Uua3hik2oW1t0XuI
         Vw5ojFI0ILSFPiKtNqwyYlyttUdTEMY6YTTQb9Z98tM7xmxHbIfZCIpTpTSSH6FOA1t4
         BxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        fh=oydrPjxhXqfUmc1lurfYOkPpyJdKKHxN5STldbc2cKM=;
        b=VkcQ1ykUsCEdYI7g0f+S4PipGa9jEkNfmEeNr1n17D+SBh8HJQGHUiSvbmUZ0KlfLT
         FOeFR1C1JNwCb2aJn7p9pc6FiXMvNZQUVG0p7NjFEp781pt3vveYI9MDZ7eWHIWFImGY
         Z3fGxYH3Hl58iRTHEoyPm4QxSQAi9Q+BTOUxQpXIuZJjtJx1S2FJMsedQ+Sh4uVt5m2o
         vdX7GV8ynfDhyY2lbsecpFFmkLtxIVGYAeGS5wenQLNLoJRZjkFR5sYYE1+YV86W451Z
         6BN3TIUGu3OtQ1UNh9fhUvFcf86yymvratPma8R65hMSJrwHovavbfqvSrQQZgHZ6iJV
         00fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780670700; x=1781275500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        b=QDEG+JdsCi/nGhsGKHWrmakZCAAAKH94mJTgHAZsugCteBQLJ25F//75ar+srWpCPd
         4A44v/U3CUW6nqTQRd/qKB+M+kFmeYbE9+nlRqymKwDmadGXMH6dBGJmZdWsAmVxrAT7
         KQDiapY7mTQSL0SPpNNwC/gfnu5wSLuXrg8ImJufJh/kr6HXBKRo/DFW97P7T+zTTvvH
         TkDi9uk8k2lvgiv36m4CuHV0WEy+hy7MPDtcbXT2e8UbponLrOXhgjoSA2oV1gzmuamT
         4TGt6CiJV/ngqyzr6vxhrNQYyd/D0/IeX/v+xbt9Emomtg/Slf1iJYdzIdejRULLkKiu
         rlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670700; x=1781275500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        b=c25eKTt42G8UnKpAisSM/b7xQuu0HMqd5jmJJ1sbnm1Wk8oJWssPGU+nL2/ThpEq5s
         d8mHDho4lxeEHX8OVW/QPNrbjM0/J12O2EiK+O/vLMoBKf6GnwweB3yHYgVkzs6QQmTY
         D5xbUS/XI3whvzoBWZLRzL1kPLoVLqXuZLVXh/65/PdCsQOhxrn+PiR2xzsxh6Fxj3MI
         nJqUfIqNSBYitq92Fo8pBjhmRpxwL0vOMcuWkeehh+vlKR3gIhhs3Z3A3D2BzbOcII1n
         Gy+3UUS8Z0HHVCmE0AUgdzq4jw/W6drctiJuGZ7WAd9P4GaxnEfFLmHxIGgdgaF9phey
         iN4w==
X-Forwarded-Encrypted: i=1; AFNElJ8e2ANY9TUy/8fSj5PJkmQC9FqvQZ6WFLKqZstFGiY3c+1DB4LL6MMhy/FAs+PUUisnqnTafPJHw+9I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1rYvipMfjscBMVac4DcVUSYh7cjaKH83BynqbJZmdjbvry2/Y
	nSP/m26TlLiYWV/KsqBGqajp7sY18u7dSZwzqaYN5euV9goeUOCE43cBMFUD58n/2B80g2rvDoA
	oHxgWDlC8895cKrSfKNYKS0O/ViR6K+M=
X-Gm-Gg: Acq92OHkmMMi2ZPT6P/pnUZ6LlOK5vg8n/U8IfZryanvgnJS7+jVli70pQNUzBWg/Ao
	y2Iq3vm1q2NsXtPULjr63JVjfk1JkC3+DK/Yub0nNA/k5elUb9Ky7yHacP5lZUcTmRXEZN1YGxc
	ee59DZg/MdvZpDivFPajPmnyRGWQf2vUpAsIXBKXgs6TsYm+p7FL0NhMJVbq/QM8vHNjigGbvsn
	GwI+1YS1qelxwW0kV9U539HEgaFiMXt4wTc9C1AH2kMrT5cguaM4PXzwfCSXFTmDIG2d9j7QzQF
	iec5y2ivM/ojhJlwvHp+dsAp+ErwbPcPXxliuc579EmHwg10z6rJZIWEmz1GFNqbTY7mLL/O0zX
	mlJQ=
X-Received: by 2002:a17:907:972a:b0:bdb:5c26:d499 with SMTP id
 a640c23a62f3a-bf3a8a06e97mr148149566b.22.1780670700008; Fri, 05 Jun 2026
 07:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
In-Reply-To: <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Jun 2026 15:44:32 +0100
X-Gm-Features: AVVi8CcZWc8NSzDAQ_aVku7QXQXrcmHdaazPbFgpm7kgo3ZnjYI1QxUBkTayMTw
Message-ID: <CA+V-a8uYEOB2DcOjQ63hLDW-vYxGLTpphvDXyAwV3g1-GrHhgA@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jun 5, 2026 at 2:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Use a per-SoC PLL reference input frequency for PLL parameter
> > calculations instead of relying on the hardcoded 24MHz constant.
> >
> > Add an input_fref field to struct rzv2h_pll_limits and derive the PLL
> > reference frequency from it in rzv2h_get_pll_pars(). Fall back to the
> > existing 24MHz value when no SoC-specific input is provided.
> >
> > This allows the existing PLL divider calculation logic to be reused
> > unchanged on SoCs such as RZ/T2H, which use a 48MHz PLL reference
> > input instead of the 24MHz reference used on RZ/V2H(P), while keeping
> > current RZ/V2H(P) behaviour intact.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -242,6 +242,7 @@ struct rzv2h_plldsi_div_clk {
> >  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> >                         struct rzv2h_pll_pars *pars, u64 freq_millihz)
> >  {
> > +       unsigned long input_fref =3D limits->input_fref ?: RZ_V2H_OSC_C=
LK_IN_MEGA;
> >         u64 fout_min_millihz =3D mul_u32_u32(limits->fout.min, MILLI);
> >         u64 fout_max_millihz =3D mul_u32_u32(limits->fout.max, MILLI);
> >         struct rzv2h_pll_pars p, best;
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -53,6 +53,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * various parameters used to configure a PLL. These limits ensure
> >   * the PLL operates within valid and stable ranges.
> >   *
> > + * @input_fref: Reference input frequency to the PLL (in MHz)
>
> Iff there is a default, it should be documented here?
>
Agreed.

> > + *
> >   * @fout: Output frequency range (in MHz)
> >   * @fout.min: Minimum allowed output frequency
> >   * @fout.max: Maximum allowed output frequency
> > @@ -78,6 +80,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * @k.max: Maximum delta-sigma value
> >   */
> >  struct rzv2h_pll_limits {
> > +       u32 input_fref;
> > +
> >         struct {
> >                 u32 min;
> >                 u32 max;
> > @@ -156,6 +160,7 @@ struct rzv2h_pll_div_pars {
> >
> >  #define RZV2H_CPG_PLL_DSI_LIMITS(name)                                =
 \
> >         static const struct rzv2h_pll_limits (name) =3D {              =
   \
> > +               .input_fref =3D 24 * MEGA,                             =
   \
>
> Why add this if 24 * MEGA is the default value anyway?
> Why not do the same for the two similar RZ/G3E macros?
> Perhaps the default handling and the RZ_V2H_OSC_CLK_IN_MEGA macro
> should just be dropped?
>
Agreed. I will drop this change and get rid of RZ_V2H_OSC_CLK_IN_MEGA mcro.

Cheers,
Prabhakar

> >                 .fout =3D { .min =3D 25 * MEGA, .max =3D 375 * MEGA }, =
       \
> >                 .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA =
},     \
> >                 .m =3D { .min =3D 64, .max =3D 533 },                  =
       \
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
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
