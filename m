Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0D2457E64
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935111; cv=none; b=A8z2fzQhjO4wJ5Zpev42QIAfu1pDNNgPRlcw65OmO7pcFi942229KAmXeGhOlXpxSCzVlTZNHPBsAxYCri4PMWwN8fNUhkY5WiCsH+9gfCFuMsX9dBpweFEWa+zRhgmVdPhsgz/EtJAIrH/Q9DyMT6frrw5kysJOAt8mTxwXo8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935111; c=relaxed/simple;
	bh=4sp4VcgJMxhd3M4TsgU26n6YJKkprmo97iOmIWwwJ8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QHW/fw6FG+AYAMPvGHAI6auDsl7RrQX/bU3Pfb2ck2KbdP+7dNB9VxnulR8/O28KaJjxrDk2hG+pLl2sg+4YqpJnk7JnZs7HWF2z1bTo+csNF5C+qfkaEKgUbmG1B9rS95EvZWZjhdG7xLfBKi+sm+qWbYtXXDzsaddgeBaiQdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JR05qLsh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JR05qLsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC8C1F00893;
	Fri,  2 Oct 2026 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935109;
	bh=ukQ2DDkkzPz+khjbTsQEOYENM1vHzJhPvNEqOK/dUgs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JR05qLshA6MJloVCvQaHfiaMlKq5H4IELuD2p/4SvUv8rLZAP06mvQecUoGBEiPGa
	 EFpkJMntGPvk+iODXEb2EHcsp6nMWzoPDgHL3Fgw1p/qCMZj60TpfOS/DsF90dze0m
	 035XmiAXsSASuIGgCMJ2p7uIGUDrXF1F9cAF2c+of1H0DTgZoxIZlQcu+GgWX1nOn/
	 67eI+isUpEtayE+Z86IwckKd3oW8bfTQYzP+E8unj+ZD0tn7OUiXpw+Zo7LAN7saV5
	 2i+M9YslF6KkZZuLRBvDeUkgpyKri5evAQCo6A142Rsziafxuerp9HoEFRQC0g2Zo4
	 qgLQNU4CvbmJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002-rpi-tryboot-v5-1-6294c131e583@linutronix.de>
References: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
 <20261002-rpi-tryboot-v5-1-6294c131e583@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:58:28 +0000
Message-Id: <20261002095829.5FC8C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] misc: incomplete enum reordering contradicts commit intent
--

commit ef2bb95b7d295f4ec53aefb9f615706dd192ce98
Author: Gregor Herburger <gregor.herburger@linutronix.de>

firmware: raspberrypi: reorder rpi_firmware_property_tag enum

The enum was once ordered by tag values. The later added tags were added
in a different order. Reorder the tags again.

No functional change intended.

> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm=
2835/raspberrypi-firmware.h
> index 975bef529854a..8ad1cdbf5e9f5 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h

[ ... ]

> @@ -125,10 +125,10 @@ enum rpi_firmware_property_tag {
>  	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_OFFSET =3D         0x00048009,
>  	RPI_FIRMWARE_FRAMEBUFFER_SET_OVERSCAN =3D               0x0004800a,
>  	RPI_FIRMWARE_FRAMEBUFFER_SET_PALETTE =3D                0x0004800b,
> -	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =3D               0x0004801f,
> -	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =3D            0x00048020,
>  	RPI_FIRMWARE_FRAMEBUFFER_SET_VSYNC =3D                  0x0004800e,
>  	RPI_FIRMWARE_FRAMEBUFFER_SET_BACKLIGHT =3D              0x0004800f,
> +	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =3D               0x0004801f,
> +	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =3D            0x00048020,
> =20
>  	RPI_FIRMWARE_VCHIQ_INIT =3D                             0x00048010,

[Severity: Low]
Does this actually leave the enum unsorted? 0x0004801f and 0x00048020 are
now placed immediately before 0x00048010, which appears to contradict the
commit message's intent to reorder the tags by their values.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-rpi-tryboo=
t-v5-0-6294c131e583@linutronix.de?part=3D1
