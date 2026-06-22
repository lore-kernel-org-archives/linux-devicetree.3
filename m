Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7A83B14A1
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133651; cv=none; b=t4+DKJhfJWdvXLBA8zvs7zvPWcT8ZMVC7Ie1sU5GVGi+y8Qt5g/Kf4WK38niBlibdKYcuSex6EmfFLfG8RqI98Y/3PnKx1UuaTIs9OKycnhNl4eP67TpKZ5/gXlV8LWnDzDHJ6zbxrMc/yItamOpXsv+hxfTw4eoN6pltB4yvD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133651; c=relaxed/simple;
	bh=1etyWsaiUeb9zM/M27udCVQPp+0lo8G8Gomb4RFTGHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gfervDFRaZLJbvblFjA/QWd03c0hVBWum9gu55M9zQUdVFwxSZxXXa/nJdUvsoR2CcAafU/NNx0O5T8GFO3CVBtjNiUkVbtFJg7yzy9zVghBi0mJOPdIqqghP5iRKOfvluizKazByNtLNcDs1D3UdOt4KBuMcjWgaiXbMOZe/rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-697ce8cfe65so282711a12.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133647; x=1782738447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZq4bH2MyvWfP84B8pnnxe0yT9Gu/blfmP5NcpwNQ1A=;
        b=FGAXGU79HUqZ+CYjQiv+l8fsqQyu5wDFGC/kYN2NpjeOQD4yDK+RO/9k2VYuchITTF
         dK+qeUSFiOJNvlT+7ynKTBZFRZHrdyIfp+I/3xCiNpJI3/UYF2/BHqRNpCz8n+i3aGBF
         YL2dBx4JNdoKD/R0/yFtGys3xaWIayg1K2VtCJeU/XtHjJupf6mgu3zBzUz5G3X7UeyO
         MfMif7MEcFSOZCRmCvV7qG1+oCoF19b252RusPFjg9GDrR4yeB4jaOjphFAOu5G7/5NX
         FAqGm1fo8UNnlF3WYZcmWHFF2/3vMnJG4ZR1zSLrFcNLOcPCl+W4oi7Mrzm8qFhFmg3v
         iWfg==
X-Forwarded-Encrypted: i=1; AFNElJ9b8K7GRonhBnaXYBPulJYxaUQeo/RpMEskjkU7jXIzCbpLM6Wwc3szRon8V/QLPmFWPNNwlsp5Dggk@vger.kernel.org
X-Gm-Message-State: AOJu0YwYVvr4MKWI5RIgp0/XRzdrIp7aVGBcoUiVLBqfudfEwBRefwyz
	PNR+L+4swZAlLNLeNieVTD2RriNQTbfDsUvWtAKh4GpxGKqTeuixDiYlczgpiPNq9yI=
X-Gm-Gg: AfdE7cnwupcXRL1tt3uIGVOFjyOQC8bYnQ3mz5qQ7Um1YgQ29A6iIXQIAURfKzF/EBw
	kOgK4ZREhIDo0hOXCiFFROH8Wco8snFfYuayzdvcnX/9K0BKw6fu6u5pn+Tq00jhcSoDxcpi35w
	RiL2m1ZxB7Ad6hgquCVOTNni8Fj+/l1Dp7+xK0vqShnDiWonp8n/0seCGTKWp/1VAYs2OLEdG+x
	zA9HoZopd3SSYFve4a2Ms2GDPHbdNYQ1NTd2u1RWsMh3kwTGFau5SEh/MQTNrECxB5cowhdzPom
	B/P+6+pSt76JQIWaZbkEFqjem8OSIAbdZyUnInsBg5OcQkBbmsA3evDFBguMPJu7GJRya4ZwR9m
	fxrDSzEu+n6GIdUeROfdpgH/68mQnYyIAWH1dGtob8LfIzG9xYReRqQAdr9OISLy/T73VNKOAAq
	QcfRbNYPoHdc2Jxd7UVgIThdFbGVSHXPxuklXxsK0HTwf+YA0edUdMazEUCIC1
X-Received: by 2002:a17:907:c0c:b0:bf5:2395:8d5b with SMTP id a640c23a62f3a-c097d1b48bemr797372466b.47.1782133647254;
        Mon, 22 Jun 2026 06:07:27 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e4192sm357326366b.44.2026.06.22.06.07.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:07:26 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-697764213d6so3873724a12.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8WYyip4ErUhRjVCG5EKE49NsUjDG7uQXx8S5aY7K31Qv4fSBUFCRnDSotCFzj0OCNyR/9k70Zo9+kf@vger.kernel.org
X-Received: by 2002:a05:6402:5386:b0:691:b158:b416 with SMTP id
 4fb4d7f45d1cf-696dde5eb11mr6568890a12.6.1782133645683; Mon, 22 Jun 2026
 06:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618183334.F10DD1F000E9@smtp.kernel.org>
In-Reply-To: <20260618183334.F10DD1F000E9@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:07:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKuzYPm-3XyMUZCM6K+GpQPE=JgDJdQiaPtwyYR7cYWw@mail.gmail.com>
X-Gm-Features: AVVi8CelaUC9eVEsVaVP0hR5s-RRU3sKR6olPCsBX6FF2PRrYumOZ-b82ZBXojk
Message-ID: <CAMuHMdUKuzYPm-3XyMUZCM6K+GpQPE=JgDJdQiaPtwyYR7cYWw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: sashiko-reviews@lists.linux.dev
Cc: Prabhakar <prabhakar.csengg@gmail.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun 2026 at 14:11, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Silent 32-bit unsigned integer overflow and zero-extension corru=
pts PLL calculations when 'p.k' is negative on 32-bit architectures.
> --
>
> commit 68e2983ee9a6e8d870b293872442cdc2bc7b3e74
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculat=
ions
>
> Introduce a per-SoC PLL reference input frequency parameter to avoid
> relying on a hardcoded 24MHz constant during PLL configuration math.
>
> > diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2=
h-cpg.c
> > index e271c04cee34f..fff89f2bdc0b2 100644
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> [ ... ]
>
> > @@ -335,9 +335,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limi=
ts *limits,
> >                                       continue;
> >
> >                               /* PLL_M component of (output * 65536 * P=
LL_P) */
> > -                             output =3D mul_u32_u32(p.m * 65536, RZ_V2=
H_OSC_CLK_IN_MEGA);
> > +                             output =3D mul_u32_u32(p.m * 65536, input=
_fref);
> >                               /* PLL_K component of (output * 65536 * P=
LL_P) */
> > -                             output +=3D p.k * RZ_V2H_OSC_CLK_IN_MEGA;
> > +                             output +=3D p.k * input_fref;
> [Severity: High]
> This is a pre-existing issue, but does this multiplication safely handle
> negative values of p.k on 32-bit architectures?
>
> Since p.k is a signed 16-bit integer (with limits->k.min allowed to be -3=
2768)
> and input_fref is a 32-bit unsigned long, C promotion rules on 32-bit bui=
lds
> will convert p.k to a 32-bit unsigned integer before the multiplication.
>
> If p.k is negative, the resulting 32-bit unsigned modulo value will be
> zero-extended when added to the 64-bit output variable. This would incorr=
ectly
> add over 4 billion to the output frequency rather than subtracting the
> intended fraction, which could severely break the PLL parameter search.

Good point!
Although this driver is only used on 64-bit platforms, the code might
still be used as an example, and copied for use on a 32-bit platform.

> Could p.k be cast to s64 before the multiplication to prevent this unsign=
ed
> overflow and ensure proper sign-extension into the 64-bit output?
>
> >                               /* Make it in mHz */
> >                               output *=3D MILLI;
> >                               output =3D DIV_U64_ROUND_CLOSEST(output, =
65536 * p.p * divider);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618181949.30=
36280-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
