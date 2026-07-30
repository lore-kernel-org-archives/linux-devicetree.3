Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94863CA5A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409461; cv=none; b=U3r+4lSw7Mm0xWXdcoexq0R3lKXU1okG4AeUE4smcAAjuhd0BTQ+/r5QocC+Tv7zdsX+fZRXM7u0Sv5obY8w4n/LBneiUkIys3rdjkCpeO6/ZzPTbe70rPFdu7Vul+XdMtdf2FFaTVOL1KRZ1aoQ0GrdnrSd8XhuA2DmhEX8ETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409461; c=relaxed/simple;
	bh=LWDpXLvJG073GemkWSCWG6yFKT+wsAy2nO93vfs0tAI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T4ICSvW7YrydtQpFS3wy8Bee6BVIdndQwfwLLSaU/P1cFW4byeKVJpOJT22L+OAVzcIlmnkK27wZhDAnQQZIWlnjF6EQIWj15z1Igc5sjp0rLFSg3HG4WG53L0XJFkGJu/lcX+VAPzZxvi+j0pJITSwuRGJC2a3ANy+O01/12m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQLoQaZc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQLoQaZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71041F000E9;
	Thu, 30 Jul 2026 11:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785409458;
	bh=uqsCgEhqmumRsADAjiHksUzjoiu3rTVG7trMxskxAJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mQLoQaZcw3xPBvKetox31gl2dNJZCutSSAokCeDQtbkBTgnZmlEWnZ6bIQh2nWCoN
	 yOzOOVaWrTxmt2p8yw1u3hQp0pgOzNUBJtKoUCtKMwKYspHSf+A0eOXG6mEmReG8YR
	 cS5ANzKOCYtyOLwAlOfJJFd6Oxi320OZvv2hEgJXnyvgpXepBbNxUxdbpR+lzHKk0/
	 sXoBu7Y99VHx/xYjbGcy79auVbBoFZ9YbcGPXQurO2Y35Xc6PAE6HTwsC9bv3EG8z6
	 3R6Jas/Y28cZlvkrLcqMp6mmC2wu6mypiYz5fyLrQ+jvZnGBFEr+120aR9RpWxQrlI
	 665kSb4oAYcaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 1/4] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-rpi-tryboot-v3-1-849c001d67f8@linutronix.de>
References: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
 <20260730-rpi-tryboot-v3-1-849c001d67f8@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 11:04:17 +0000
Message-Id: <20260730110417.B71041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit claims to reorder all enum tags by their integer valu=
es, but incorrectly places `RPI_FIRMWARE_VCHIQ_INIT` out of order relative =
to the newly moved tags.
--

--- Patch [1]: [PATCH RESEND v3 1/4] firmware: raspberrypi: reorder rpi_fir=
mware_property_tag enum ---
commit 6dfb35594a9bcc2cc5fa3006d5257b66c4f03b4a
Author: Gregor Herburger <gregor.herburger@linutronix.de>

firmware: raspberrypi: reorder rpi_firmware_property_tag enum

This commit attempts to reorder the tags in the rpi_firmware_property_tag
enum by their integer values to correct previously out-of-order additions.

> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm=
2835/raspberrypi-firmware.h
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

[Severity: Medium]
The commit message states the intent is to reorder the tags by their numeri=
cal
values, but does this final arrangement still leave them unsorted?=20

The relocated tags RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF (0x0004801f) and=20
RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF (0x00048020) are now placed right=
=20
before RPI_FIRMWARE_VCHIQ_INIT (0x00048010).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-rpi-tryboo=
t-v3-0-849c001d67f8@linutronix.de?part=3D1
