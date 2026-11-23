Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433634;
	b=cW90ep60amq/h/GT/zN76C1B/jTlkOlDKOcwphLWvLmqUUpEolYjfnkNqcvsHSGlS5rw
	 GPdNlsWzSm5Tx54Ov0VkvTIlsL55XKMnFb5lNI1B0cJUB3Nl/a6wY226ZWta7BvbxHg4p
	 xFmHh6qxrNDE9PIW8ATGKXpvLOp6ksAJh1tzWkOmy054glm7K7osJiHQ5Hyp+v6pp9RTe
	 TDo7zvD+uRii5jBvxlZPkc7i0qLDBjm5Y5q3iHjDBsVXkG07OwsofufYZFImxOfnlYSSj
	 tcsJ9Xbxj16z9X3UDmTVM0zDvv94IYm6oDDhvbhuG95ijB9FLl/sFuDVLc9Qe+VX73w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433634;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hwTobTkBKm2/JiwiYi2htTTLwpWNDT0Iwb6zrj1effc=;
	b=PZTHICa2hlpppl4MXJ/YeaYWkl7BITq30eziO1h1jbu9fP/WzAAr7kOTMUtuzfecKAs+
	 1S4A+MXHRzW72A23zCbrzkJ6J/wOv74OVwAJTcYm6gf4hNO4IQ3gCk9ryRhGStBrENSvE
	 keF+tSOlztL1iJ6eKs+m5IHRCtQ+nevUtlJFBsrHKixkGpJbAp8gkh+PhHoQS2p2uYUoF
	 StSrmoyH2R3PWXLlmFRZSMdG0bLpR2f/+Ot9t20bxUn+l/jDeu2BMt/LKwmmJhUK0X4Ix
	 tDYD9UUOCSobo+2R9ChqaYv2yWhPbnmqtCq288E6DKWEi4CXgDlJYh39q3ewG7wG5CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F14sZ5ih;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DD5606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F14sZ5ih
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702C71F000D1
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433633;
	bh=hwTobTkBKm2/JiwiYi2htTTLwpWNDT0Iwb6zrj1effc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=F14sZ5ihiSJcWYxHWXyA0XiJs3VZapM4gtxOv6f/78F22yc/zW94Pe+rIceK5uiQN
	 rN4vxdPjMMyLaTkeVfu+6xo0dfJ+WOpuacTaL4RBIkvsIZQjOu2V3Shk9FxH4Eb0h9
	 zM55HI9U2oCZop0+xtrhlkfvq2SR0fDNU9jENSHnvKbmmyM/MmX8kH9MTgwd5u34qg
	 908tlanZCWRgXMEdez/va9HaUALagWY5NhhKO54WUiiLhS9qpkNa7QBt4eryDHMu51
	 /Xs3wt7iWWXS6/OeXZeVt1EO2w1Vvic1+0yPI8IAZ/mGTmboaUfmvlxXnHgwfcCWCe
	 eo021p1gITiOw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ad5529ae64so22838451fa.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:33:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEvMEQOhnKYCWySX34UfMpUJqmh/3b+kVRuMpCPiJ1lvQb1L6U/hlBgVIdvJCT+VF4MmIhK2k22ADUh@vger.kernel.org
X-Gm-Message-State: APuU4Z9LkP04smSJHDp8FYfXBZ+vyJOQiNau3Cx8ucs2UZxGWAjUo7YZ
	CiQNdIctW028ettlQnj6Po+oGqkg2v+ET+YDXmFMCjrR5VTBT4HFvDvc5cBuZ1DHi+XEuu84ASM
	/tmvALn5FkIb2EmLUFIAsnFlNPWKDRZo=
X-Received: by 2002:a05:651c:2214:b0:3ac:e24f:aa11 with SMTP id
 38308e7fff4ca-3ae7f9978cemr32522291fa.7.1795433631887; Mon, 23 Nov 2026
 03:33:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com> <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 19:33:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v67+kz8kdz1FBX+dn8oifOkQie6hv4FZ2Fw9VHZUvzAcSg@mail.gmail.com>
X-Gm-Features: Aa3M54rCROWHf9umhZr72KzYmEmJvMkYMlPSpk2XNjS86lerVQ17v5gLjZWKnw8
Message-ID: <CAGb2v67+kz8kdz1FBX+dn8oifOkQie6hv4FZ2Fw9VHZUvzAcSg@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 7:16=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:
>
> On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> > There seem to be 3 revisions of A7Z. Which one are you targeting? Or ar=
e
> > there no differences as far as the OS is concerned?
>
> I'm targeting V1.11, which is the board I have and tested.
>
> I compared the published schematics. V1.10 differs from V1.11 in two
> places relevant to this DT:
>
> On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
> separate SY8089 step-down regulator at 2.4 V for both.

This is pretty much invisible to the OS though, unless it is toggle-able.

> V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
> which V1.10 doesn't have.

I think this is more of a fix, but again, mostly invisible to the OS.
The only possible difference would be that you could disable the internal
pull-up. But leaving it on shouldn't be an issue either.

> So the power supplies and card-detect configuration would need changes
> for V1.10.
>
> From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
> LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
> CSI connector and a backlight driver, none of which are described here.
>
> Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
> DT for V1.10 if needed, or splitting the revision-specific parts now?

From what you mentioned it's not a big deal. For the new connectors
on V2.00, we're still a very long way from that, and it could just
be a separate .dts file with the new bits, and include the v1.1x one
as its base.

> I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
> changes to this DT, including removing the MMC alias and revisiting the
> regulator descriptions and constraints. I'll wait for Enzo's v5, test on
> my V1.11 board and send a v2 with those changes and the LED patch
> squashed into the board DT, as Krzysztof requested.

Sure.


Thanks
ChenYu

> [1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/
>
> Thanks,
> Vinicius
>
