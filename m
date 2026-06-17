Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376F38F954
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729142; cv=pass; b=UWtDuhmmeOS72IM2aTHwd1S76RYbp1eTeSnU2FWNBWTKMBaLSX2ofmAte+yI2025je+Niv4yKNRvLBoAHlrmY7EEH2qtpYfo/yyxqtlFPYRIGfnqUOCSE2czhBj71pKmmJvUHekPRxjaU6Nd7esRXtInejKQJQJ1AiRCybUpRn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729142; c=relaxed/simple;
	bh=8a/iR0PgeZPtVkzSIzBEbGfKE8M5iGI/7dK+r7riu/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcCFeF0yidLErHkRU11U5LyDqvBhsFDVNmJssoaVJRGT74ivCnTXfaOARFfXS3W48F6pBPbF+jl8GET4RR8dfblQCAKp48JXw3Zymmmbg0ReUPhTJptLDw6CDefqOhY1HTGtAdnj2DnKNaKJkBqu+ymcU/v1lR4JzR+IhLsw93Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT7t0EGd; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT7t0EGd"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4629051c946so144105f8f.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781729139; cv=none;
        d=google.com; s=arc-20240605;
        b=ZGyQ9dLAAXER/3paJUKHCEUw0ykqHA1BEOTon0el1G7DNpdhxKi7/RRXJRgFwzvHT7
         x6ANHUSYyqYfKJVNm2YXrMT9MrDGuHxJn7BnfiBkK512esKyU0lazxEcocp4Ze2c5KYf
         d78tGXV3oLjRCC8q0M5e/3kE26Tpd6Bg/gmFtVVtSXAhEdsKievOIDyjasp/6ui5AbwF
         enee956EjLoi4Hhl4zT2+0fREaScFrxtlGORrtpZU0OR8UxQPtN42MMKGhzzKMKvNH0e
         BpSRtw4scmyLLg9fF9CtYGlXlYntRjOMDlF7phn/qKkBeThVOlae/Mn+9Mjjfmf+VfwD
         xneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        fh=HBNXRSjAL8P0iTyVCiIOjfvkMAjt9+FJp+jT4V9lhdM=;
        b=fr8mlek2YRQQJUxjcRaW7umtx5jXP9liC5NZXhJ3h9O8nFoJke8IEjs/Sm+ricaQ0y
         L+BxWbyYESX46pSd9A3PHQM/FR3vXKLEJwjXPs1WKNC7p0Ucxt48eelQqxz1aAxTGxid
         6aLVLrUf0mVwj9rCwuIF+dPEpNapOmjGm5MptsiA+30ErGa6m2wEooLMuqgewhQ6FbQR
         ARSrIyg0i2BEa4EBzUKW6vtBdJwVS5R6jt/qSCCd9nJtLDD8g/8Nh0lajKPstTWDIsQn
         BlJ0QRY8gc2VbiYi9oQhjfC4MbQZvLQ7LynxQ2y2v+e/15D0JZhZs1h5DwhEnF5uP60g
         6kmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781729139; x=1782333939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        b=DT7t0EGddQ6oq5WJ7ix/vWnJ7EGtcz6PvZmYmAXQKsabmw79lUMDNz5YfwKw5LLT9Y
         UH742BBlzFH3EZ2CxXyqIqjl4uEaq1v19Uhwh6olsl2PClKPSOuiBDvYirFPgxo8Nev/
         L1WnJkdp6lTyLN4Z404c0VZUkh+pp5Wfx4Swtuj0l9KFpbt7CEJz4+st0yBw9PT69Mcb
         uWz6cvL8n8hcWmU06fjEWv2gl5Tvavgnl+f3cji8fFH05wtagvLsMwSD3B9UqXcZIH42
         14XdGM1JMQ7pHQukxnZ5bREgzhMK7tWLqn6wz32dQE5eCEOTABbedjtw30DZSjMKxrGv
         5Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781729139; x=1782333939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        b=lWLnv/wmsKAm23guZEpbGPcdFBQrc6BT2QjqAJhG2PPfSwf6gOc6lKSPReh2NND9LT
         eQ1d/bUKlMXYBczJ8pzGsnJ54m72tnVf+QMBpAAr8smQJMQuGq4lDMWZOPUhr5JYL9aK
         bBOa78NwHq8JOShB745CcjdW2+QEUqUfp5/P4/4Thx5msViAk08qrlmAJfOjnz09o0hb
         dD7QoLtwfl14sWwNHK4JHj9bhN5qE0JWfibBl7wlVikGy8Gj4Dua6YjKBKed2M5Tnjq6
         JXxM92nl3p9pYwAlVGIhU9lJM5cwoj6MOeo8fG53kDJu13NZuTBOU8HSlXnTt7U6TuhM
         Nd/w==
X-Forwarded-Encrypted: i=1; AFNElJ/LWMSmNJA6X1m48iC4Qd9SPQdU/O2sj6y8HUsGBtPFWqMvaFn7gO7+xjJCJx425vwQAPPB3/d0Q00C@vger.kernel.org
X-Gm-Message-State: AOJu0YybXy/G/ZboipUsHDiCaRgGGLqNysagWZ8IEiWLwNd3ingxd+TF
	W9JReIg+Dpl1On72amNT/XwjN4FjkQEv59YAN2gSoGn3CyQpKkOIYaMR9gLsxKHTLH7ElursXix
	y30JKI/LtPNY8Qxu+ipOt1+XE7Ndx1PI=
X-Gm-Gg: AfdE7cnxBRhg6xVs63GM0ZxGg73cP+9t8+yU59rtH4S79qmqT6DoJhR0FqfJmLzvy0N
	WJrrZXJfTeyz5wd31h/b4zhO7zWFmZiviZIA0u9n815llqk5aE2e/SGvCb8b+qB9RWBfwLHKd8u
	e7HSsur/2IM8Xx2f7jhLNadJvN+6OPJwwxjPglgVBiSAG34x6Qv201FXX6nb3sQhucwjL9p6WxA
	pdt3kvBaDY6uwNS064aJeiw/KSh6bOqefujHXPug1RzXdIPfwgrIna8vFKAzbXeeN7r4iTQGsAb
	D4C3uZgu+zuzwFPGN2w64GvPv9/6vrYS2wrpPF58u7yID2D8hazir72nV7I=
X-Received: by 2002:a05:6000:4712:b0:460:11a7:f82e with SMTP id
 ffacd0b85a97d-463968566c6mr1731610f8f.8.1781729139388; Wed, 17 Jun 2026
 13:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
In-Reply-To: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:45:13 +0100
X-Gm-Features: AVVi8Cdkf1jVo4kO3gd7API00mVvh1fcU6060AgvOUxLid7Szzq8x4Qi-iPfzo0
Message-ID: <CA+V-a8t9b-xi-bfBs-rp8eZOS+TM8OVLVy44S19fPFZjRKT3Lg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation
 math into a library
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

On Wed, Jun 17, 2026 at 11:05=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the common PLL and divider parameter calculation logic from the
> > core rzv2h-cpg driver into a standalone library file.
> >
> > Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
> > rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
> > rzv2h_cpg_get_pll_divs_pars().
> >
> > Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
> > driver as wrappers that call into the new library helper endpoints.
> > These wrappers are maintained for this cycle because they are actively
> > referenced by the DSI driver; they will be safely removed in a subseque=
nt
> > cycle once the DSI driver is updated to use the new APIs from the libra=
ry,
> > preventing cross-subsystem build breakages.
> >
> > This restructuring allows other Renesas SoC clock drivers, such as the
> > upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
> > divider mathematical logic, to share the iterative calculation helper
> > infrastructure without duplication.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const s=
truct rzv2h_pll_limits *limits
> >  }
> >  #endif
> >
> > +#ifdef CONFIG_CLK_RZV2H_CPG_LIB
> > +bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> > +                           struct rzv2h_pll_pars *pars, u64 freq_milli=
hz);
> > +
> > +bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits=
,
> > +                                struct rzv2h_pll_div_pars *pars,
> > +                                const u8 *table, u8 table_size, u64 fr=
eq_millihz);
> > +#else
> > +static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limit=
s *limits,
> > +                                         struct rzv2h_pll_pars *pars,
> > +                                         u64 freq_millihz)
> > +{
> > +       return false;
> > +}
> > +
> > +static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_=
limits *limits,
> > +                                              struct rzv2h_pll_div_par=
s *pars,
> > +                                              const u8 *table, u8 tabl=
e_size,
> > +                                              u64 freq_millihz)
> > +{
> > +       return false;
> > +}
> > +#endif
> >  #endif
>
> What about just dropping the old functions, and adding two simple
> compatibility defines in the header file:
>
>     #define rzv2h_get_pll_pars rzv2h_cpg_get_pll_pars
>     #define rzv2h_get_pll_divs_pars rzv2h_cpg_get_pll_divs_pars
>
Thats neat!

> That way there is less code to change in the next phase.
>
Agreed.

Cheers,
Prabhakar

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
>
