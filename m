Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727926;
	b=sb3xSm3oJ94J1oOLVSGZHAlA7mLuN3W2lAuXmDVEKeGdpeAwKHuTHdlZjW2FcgZXntUm
	 w2H2sRyyHve66YS4nHaGky4HjakN8KzXkiacjayxWSbhgH9Wc8L3IIybBmBXp1TE1uk47
	 HBmCOMD8wIJOGr1/BGKkZg8FCs4/Z/ECH+kjCtMWCTmSxQDA/K6bUAGjuoAHMH/V9e1aj
	 3CG8uObr1y94hOjbRKofrVbZzctuRmpvXP6D0ug+b1jyGoLeCm2NYiYioajNhhll2aIo8
	 y0ETV7Vrpg3NTOi2HD7XBb970qBOAQKqnz+8OkD1F7KicYllq1xhxkW6/W5zkSD9lXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
	b=F90whwpqtgs0g/wZsZwW4WrOFEpelVoN14Vs+Ooxi8x9i7rdTbNtKMIuNyq5tjcbmh23
	 YtGHF/l92btIRuP7kjH+qArJxwD/+19eYmZ06gRioACv8Plv+5njknrCja601o7wnbTSU
	 P0e+ePs3jEYxAABRmV4/09Brv35mMNn1yk6N1dv21HLAzQcZnSlC7FJy1eDJ8Jon8h2Ls
	 1gikcM3f3EPIVaSv4R4aIONtpPT7TeQz6pD6GTPDtYER05JoWqdPyQe3v38xVmjxRoiR4
	 U0yad4jnClESTCVJrrlyERLzInnwZPQ6vIwXRoT+mYSu+7Dcr/JdSSJ/1PYUNieDxaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE9606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28AE9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so18278605e9.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727924; x=1795332724; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=zGLp07qNJvhQ6+u0soNSdE4zISfLgteQxFDtiLB3+MHdU5R8cLNayQpDOu9z6E8HsN
         cokgnkhAr/wayCMP5a5YNMbrz8W4SjZLOU5BRZvRdWywNx6ylkAud+eGM9IO9xu5mMW7
         vNaai9gq6sOgHH/Plv7KLPJqtlQ7SNQhP8MwbOsiVY9oebQhNkQHqvTKMcZy20gw6VyG
         k7ZCwjq9cWqbqhlBhjXQDv7h88lCfGgbi6MypmIx2cT/mMVK282PdLi8Wwi9Md6f2p2U
         0P0GPJt+gXIMzGs33ytfrKjlEGV7t0Pg95zZC84eG54l5hQ2KUyeWmzxrEwtZdsEBCOn
         OqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727924; x=1795332724;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=fXNRaJMhdakRSJ/m/P9q1us46eKuktBU+2gcnf7Eawe3hGPoLdEETN/ulxXM5EOTGG
         eP1t2nO/Wnz4Ff4fo9Jd5HaKKQKnZpAu9+o5MPnylgLLpPT79LgFdXMpOSugPmXGkXM0
         ByCh5dHus+oeNCafSFspmuXLxJIrCH2AixQohv36XC1HwuewJ6ww2nlEwZZxrWOtxiKd
         xeBJJz4nRJ8xi0w5LqgYkMt7R25PwIRe/5J1PE2Bqnr/0T/I2o+C8iKk4vdQzTzLrtz9
         f8KknZ1+9zmoqJgiwPncGQL/9d5mjX8N8xRK0hO9reeaQhuvfpOWpTEjgZ6jrGPik1kf
         FOTg==
X-Forwarded-Encrypted: i=1; AL+hErE4UhOR29ZUNgrb50YdCnBPWsQuzhYsNPCRvLCt8rgt9rn1/9KD60R+f9TkohSG4xr5kO+3feSQUpYz@vger.kernel.org
X-Gm-Message-State: APuU4Z9MmYON8KQ5pxIrJazUZa/udDbdLRB+baE9mMzoLo4pX/2JCkmT
	qoLbxjwIG+45B943WjM1UiXAvd2o5HF2unFjX46e4Ac0yn6BmAMBhNOg
X-Gm-Gg: AYBFou2JQg41Lyo32j0N6Kx7GLaCL0YpoOjewrt3azwDrzMfGeZU8uVMfcOY4+YET30
	YDHZCc+9GpFBcbu9mFq2xhi7jLiEaoZaEeA7VWEmxZPsWnz36NJQ5+4+nSOkPgtmOPbDIR4ecLZ
	S9S5TUh5baimV44bhApdEs7J70H/E1zkdlMwSUmdP5y0zSCXWqJqTmqW7PdJEAVgv/aYvzHpLUZ
	Ygq3mqVAwntVWxiaX4Pa+8UZQVC1dTM6uxhuw4HIcKRIzik7c0Y2u1QshiKgx4GTwesRMH0+DyO
	wP24F8dP2pxFdccq5HQIxxj2o54wksJ04BZxn4hZYDjMoBi4fqyLJLgSm1C67NDOBeIrG7J0Xue
	CNVHXVbbYb8uNoLZkCRjtlMzYR3OUWnqPQvR0jzJlsTxa82J4Z6flH3UBuSLJer0jdcmvN7OBj0
	4UFJSLfPlAYBnY5X4qb6+3zVm0BabAsC2JLITEZlSdfPLlQH2QZb8csznnztJrJA61RGiE1h/h3
	doJNA7cY9Wai4hrEJg8zS0E1qgi34WTnncEc8OmiuqSWKo/jRGGonKELqhcXgHTYxoIs8U0IlLp
	e4+bQFTohQIJSYq7yba9Z3nin947k+VCN2j05Sm9e05UIitebBuTNzAppB2Z6owtE0PLll7s0oy
	ZVKG+H7po/KkRI+16J6ObYBNe7338BmvDKeZVMHLs/aE+pnDhkaHXwDusRg7F+qOC4Cx2AQ7TYA
	PEakXCVHng1oW/sbxoOgCQU6BR2m12E3DCoUwJH8IQ+q22eaapyeV+XFbSJWSqGpLmSxo9Vkp84
	rc1M1hMz9V/NZ0nqlcCQv1NDguNnQVsKoo0UWvjiCeV5JI=
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr146703185e9.21.1794727924403;
        Sat, 14 Nov 2026 23:32:04 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm183982925e9.2.2026.11.14.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:32:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject:
 Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
Date: Sun, 15 Nov 2026 08:32:01 +0100
Message-ID: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via B4=
 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > From: Han Gao <gaohan@iscas.ac.cn>
> >=20
> > Add myself as maintainer for the V861 bindings, clock and pin control
> > drivers and device trees.
>=20
> I think traditionally sunxi do not add maintainers for specific SoCs.
>=20
> Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> item instead.

Usually no entries are added at all.

Best regards,
Jernej

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  MAINTAINERS | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..dfc300dc1eb2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> >  F:	include/linux/irqchip/riscv-aplic.h
> >  F:	include/linux/irqchip/riscv-imsic.h
> > =20
> > +RISC-V ALLWINNER V861 SoC SUPPORT
> > +M:	Han Gao <gaohan@iscas.ac.cn>
> > +L:	linux-riscv@lists.infradead.org
> > +L:	linux-sunxi@lists.linux.dev
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > v861-ccu.yaml
> > +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> > +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > +F:	include/dt-bindings/clock/sun252i-v861*.h
> > +F:	include/dt-bindings/reset/sun252i-v861*.h
> > +
> >  RISC-V ANDES SoC Support
> >  M:	Ben Zong-You Xie <ben717@andestech.com>
> >  S:	Maintained
>=20
>=20




