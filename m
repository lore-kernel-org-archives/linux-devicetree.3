Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E5B480958
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998299; cv=none; b=VRYDDFS7fEGWKqHmYIexp+jTof45jA9fYW5/mPbPf7oGqVD5SxFSObvw2W3kJQCvpUZH8FrcevTZNzdiwgX2luysDVpitERXdAEJ2yFdLcNW4QiylyIuKqgQCX48XwJEk4A4OvvUedW2j7ksNqj8MHbJ0ybKMSnV1RUjNqxrCOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998299; c=relaxed/simple;
	bh=ajnOZwCq/PnZN7aH7cLkkTdAAF7vLV6z6+ahVx1kXwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXtsgk4HNALH6zLQv+lPMM8jmdR2zAP6rgme7fz7c/uzVy5Xi/6KPj1O4ZkksttJAA22iBKZl68Wi1xOGwtcYmhnNu0fOAsMhCjFTXSTQSEd38NzFmnANTEDRqK97KQEBn3GV3/FPhacHO8OzKsCL3CtpG6AL9AGY6p2X6vBZcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so4090917e87.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998293; x=1778603093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhE1GPrxyKAsw37Q2fShYI5FmXFiAGB5BC0k4Zz9C/U=;
        b=pNLPSjx25ffu8ru9kOyPjAo6gonTslgyxCM01naaNIQLosKDOsM8KxXThTm9HCVnQ+
         bYtDaHpB6Pm7MfYJFHnNc+MB22LKJhrwji+aThZZ009axvSJ3z6OWmALUg6vALuRHcR9
         y5c5ID9bFIIvNg5rt7OJyOWkj962nFsBC/XgMjmzw5cnv7XFuZD4ZX/HbQR9J3Ry37oD
         e62z0XJi14gdseZW23/XoTqUmeAAliCk63r6YyQhbeuPFMKGAJt1uVxqWhxzmu0t5NdF
         AMLpMAQ7w+e4OOtlJUrNO09LF6soHTu6YAIiG79esz00WNdAU8e2u7r63vquOInjSYa7
         CtAQ==
X-Forwarded-Encrypted: i=1; AFNElJ84oSct15vnET590GFHrSgPUH9BeXvvpPgTlKEnwLO23huGC38AGpyMh16MF+1hmKZUVtFiqjvvg881@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WFE33sSsKqiUbC9u4DT7C3bVwg+rIrqZQWXDAwbUkoghqlZX
	2hmZ5ZkA3w2Ej2Ln4Ost3daZnAWtvWd+orwJaKRXMWr+bHNkzM1VDPdjAmTnETZy
X-Gm-Gg: AeBDiesjB0IDEseabzTK9Zn97kImW5MGdPI67JIvqpZUrD84dK7GrW872DlElRIVyLc
	dCb6YBQHHcDUlvAkC9WVcN+U67iLZ5AJFUM88mNGQp68lgGA8RekFOv8omlTfaHNygbjINcbwp2
	KkG0VKFIWUBw/yDfnIXP37Eo0yAgdc0SJ/xePU2uUke41agv++p6Rjj2Cjr9BOF/U7v0HoT7CXi
	wu1pu64hZu/qjwCV5Z2QIvLNTi1Fmx9oCH0wYEJaLq6VFq7/g2GkfBcITbbPgUjOFMjJK+Dg1Ac
	8I9Am2bs3euHiUr5vvMa6fHkMoD3FhhY/qhW6otD5cCADHUAWmNpy946FYNMfUYz5b4ob/OHOsc
	2d173FSU6aXZzgPTmDczIDfu8dem+KhwA8eWQdVuT90p21VmuGHB1Cp1beds2wXEZEWNvEJOEvi
	q/mMlc4eGNQgN31Qzza1966Sn0P/EBYil/0QdAeEJvRqNYUF/Iil0a04+PCCFm/nFBEUbftrcuX
	/1k
X-Received: by 2002:a05:6512:1193:b0:5a8:74c3:5d9b with SMTP id 2adb3069b0e04-5a874c35f1emr2921659e87.0.1777998293115;
        Tue, 05 May 2026 09:24:53 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8616598c0sm3616218e87.83.2026.05.05.09.24.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:24:52 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso56803901fa.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+GDjmUqyMwbweMEoCJ+yOM44WV4u9sPwRWqKQeSp6QM4JT3BtOLpruByvDec2YeuyWKmAgy7ElSZDe@vger.kernel.org
X-Received: by 2002:a2e:bc88:0:b0:393:940e:d5eb with SMTP id
 38308e7fff4ca-393940edd6bmr44531191fa.3.1777998292458; Tue, 05 May 2026
 09:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com> <afoRe6DI4GJIVtg4@shepard> <20260505182017.10d71c11@ryzen.lan>
In-Reply-To: <20260505182017.10d71c11@ryzen.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 May 2026 00:24:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v666gCJiMpeWKpANHPufCp-nVJvdky+Gj87zUagvcrwTiw@mail.gmail.com>
X-Gm-Features: AVHnY4J2M27F_ij2YPG2EBXpDPE1R3Ey_Ifi-Xq3Eypf1d-qnvtALFOdRCX5tAU
Message-ID: <CAGb2v666gCJiMpeWKpANHPufCp-nVJvdky+Gj87zUagvcrwTiw@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 12:20=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 5 May 2026 17:49:15 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> Hi Paul,
>
> > On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> > > Add the clocks driving some core system related subsystems of the SoC=
:
> > > the "CE" crypto engine, the high speed timers, the DRAM and the assoc=
iated
> > > MBUS clock, and the PCIe clock.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++=
++
> > >  1 file changed, 135 insertions(+)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index 17a4ffc0b7f52..c59f3f789d052 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> >
> > [...]
> >
> > > +static const struct clk_parent_data hstimer_parents[] =3D {
> > > +   { .fw_name =3D "hosc" },
> > > +   { .fw_name =3D "iosc" },
> > > +   { .fw_name =3D "losc" },
> > > +   { .hw =3D &pll_periph0_200M_clk.hw },
> > > +};
> > > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > > +                                  hstimer_parents, 0x730,
> > > +                                  0, 0,    /* M */
> >
> > I was looking at the A523 ccu code and see lots of
> > SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.
> >
> > Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_G=
ATE
> > instead? It would surely be less confusing.
> >
> > One difference would be that the ops end up as ccu_div_ops instead of
> > ccu_mp_ops. Do you need ccu_mp_ops for some reason?
>
> Yes, please double check that (as it *is* confusing), but to me it
> looks like the CCU_M_ version has just a pure divider, whereas in
> CCU_MP_ the P is a *shift*, and the M a divider. Those timer clocks just
> feature a shift, which I don't think we have seen before?

We now have SUNXI_CCU_P_DATA_WITH_MUX_GATE() which was recently added by
me exactly for the timer clocks in the MCU CCU [1].


ChenYu

[1] https://lore.kernel.org/all/20250911174710.3149589-5-wens@kernel.org/
