Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728833;
	b=Mz1FQ3nM1XFlh0rgJZs3KHOkVqncwwHUYf7oNqjgIRezNoCq2plElSWkxMVTgESubU14
	 sVzMXzqcgjOcodLQGvR3KcH614URFhzbdHDb2VXU6qXtQ/tIZtd8nri4KGbuJ4lsskpXb
	 yrrilGeF6YoyShzl4l4hImkSE3AAiR6B7wFJVXhep1DgIsTKOw365DUZsBIX5HGr40rEm
	 +RedhyXF77u0/XS0j+p+4GKkyrhx2pINQPqylCLS5E5F0isTtD09g3+o5PzS+qEq1tewZ
	 wNxwKEj+o5iZ9xl2oOYddQzrdEfltHsW8n8O48vJqOI9MhAQ8j/4/BKfOwKN4IJl+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728833;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QaisxT3Fa6hlWE5Ty6mdpOvqQQNuxHko9RuFnaPX8Uo=;
	b=1cq3Be1FuWFLVVV1sZ7iayuyj5VAXtgIrzGESRlnlUXDW5SklfjhCkuQ7q8nucDxug04
	 3jblgc3pKMXEecUHWCDh9GJSxzOQusX6XA5cdq/BzxdQfUSiOMRYVk0UvuY+JOBX71uqR
	 aplD/tRWSHCD/cix+JyTe6epeCN+C0nB3HhXgCKE7VpXiX1glLrS3hDWlyD3lKe7GbNIU
	 QzDH//4U1FOuJ4eF31EYr1/xbYfNCvwt+0O0KulPFUGzIUqFjQUf8j487BqvgoAWh0i09
	 /9hP0Iz+BoSnm4H6/1nMpV4WQYb0K6Ulp1sfQnV08f8mz8g4dQjsztwdgcCn/7eR6tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GP7DE6/C";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A842A606A332
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GP7DE6/C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCC81F000C7
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794728833;
	bh=QaisxT3Fa6hlWE5Ty6mdpOvqQQNuxHko9RuFnaPX8Uo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=GP7DE6/CjY6SuY3E5TbRAELLva9fICVpIb+6kgFm7k/KXSQg7l/v1GBCv0gppFPZ1
	 J814d3yyA3srLyRSw5E/S6IE2Cc10eqDYsyEHrz/cHa03IaYvYt52z5QJ3IVCYnx2L
	 jjxsStj/VfZG+vnp3Q7i1pQOpVCLWO1xJoUJKvXIIRBXDxruxvmRE1LJwg4NjbdUWG
	 k5Mv8wZK6FofW4tXwpBk5Aazc3VuXhN65cfdrqxluWuejr5eOIyQyh5fdYT1wAneI7
	 DeJNMlEORUoR/h+OSHjN6z/6IMRv+rPwf/zQYyUuj7hLsPh55w+EKI34q40H/+unQR
	 QBtQaNsiYtExQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so31713211fa.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:47:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEFCQh8V93Lj1MOah9s9rBuVmb+o0jZwFXlK43SQ0td1Vo4+CGyeibBb/u/yuOXTV5NNucs4+klIOSx@vger.kernel.org
X-Gm-Message-State: APuU4Z/LY/ucsb/n4NPs6BwS6brA/oH/nQlr6tbyCcz32AplRmpouuhZ
	b7mRUkntK1W5ODDJmUS+Illo+S8ghQkrwsxo964GIymZQdvfXUZ//dQdXSZBfjGSKiRfCaaTazh
	9oUM1tTxhv7wncQySdqwse2AYlgBbJa0=
X-Received: by 2002:a05:651c:e18:b0:3ab:185f:575d with SMTP id
 38308e7fff4ca-3ae2b4bada8mr16065201fa.4.1794728829847; Sat, 14 Nov 2026
 23:47:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me> <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 15:46:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66t+PuaBsANs4wEuH8rGs9zyT7GpviSkoRE3jdPKE_GFw@mail.gmail.com>
X-Gm-Features: AclHuK8xqthT2mk78Qu4LiOErq4MI1hrWtnj6E-DaIslpwgy2sOPNhpmEiJiSYo
Message-ID: <CAGb2v66t+PuaBsANs4wEuH8rGs9zyT7GpviSkoRE3jdPKE_GFw@mail.gmail.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
To: gaohan@iscas.ac.cn
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:32=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> > =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via =
B4 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >
> > > Add myself as maintainer for the V861 bindings, clock and pin control
> > > drivers and device trees.
> >
> > I think traditionally sunxi do not add maintainers for specific SoCs.
> >
> > Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> > item instead.
>
> Usually no entries are added at all.

If you do want to help out and review, please add yourself as the
reviewer instead (since you aren't the one taking the patches).

ChenYu

> >
> > Thanks,
> > Icenowy
> >
> > >
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > ---
> > >  MAINTAINERS | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 93abbb315065..dfc300dc1eb2 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -24031,6 +24031,18 @@ F: drivers/irqchip/irq-riscv-intc.c
> > >  F: include/linux/irqchip/riscv-aplic.h
> > >  F: include/linux/irqchip/riscv-imsic.h
> > >
> > > +RISC-V ALLWINNER V861 SoC SUPPORT
> > > +M: Han Gao <gaohan@iscas.ac.cn>
> > > +L: linux-riscv@lists.infradead.org
> > > +L: linux-sunxi@lists.linux.dev
> > > +S: Maintained
> > > +F: Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > > v861-ccu.yaml
> > > +F: arch/riscv/boot/dts/allwinner/sun252i-v861*
> > > +F: drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > > +F: drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > > +F: include/dt-bindings/clock/sun252i-v861*.h
> > > +F: include/dt-bindings/reset/sun252i-v861*.h
> > > +
> > >  RISC-V ANDES SoC Support
> > >  M: Ben Zong-You Xie <ben717@andestech.com>
> > >  S: Maintained
> >
> >
>
>
>
>
>
