Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCD91B652E
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508271; cv=none; b=fqd+x7ORPj5hFAwLIarSwJ581yTiVuNAAFaOl6+ZJSbxPXWLd6QV4tpSJDmOMcPH8X6lXXxZ1lfvnqzRc63ut2GL1wqgFvM/fOQcDDnB+WGXy4SIFqnf/KAY79mkelWUjTsb/bIMsZ6xjjB76fhgGDl3lPDvYexzbzounl7so9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508271; c=relaxed/simple;
	bh=Rr7oIkJMqoANrUyFJHTJ9WmZggW42pt3zwU9Y2fxNls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NpobStfCT7S/qC2DmMY+sVWJ1sr/hTzWT5Mle0mn9fwrY1k0gQojXRpuWhBk+5pb1iVpb8LQ+z50Zy0KFoKq1f9j9Kn1+/7j37NQ+4C5sJ0BbHxRS8pMEutLtx5JDO4dK+pzkrQ+GPjM1328qOohr8epSZi6Ecippmz8x+e8ovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bt/E+ad7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bt/E+ad7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A191F00A3D;
	Fri,  4 Sep 2026 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788508269;
	bh=hn/20i+sqKnZ3iw6xa2eLidfypu9e7du0XwHLRbFgx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bt/E+ad7swlV4wzsRznbWXfQ0COBLJNw+NFTkVqNKT/bX1TMc3aloWH33NNVtQ8OA
	 7sBST+vVl0eGTMh7dadN5RUS6ut/442YaXyBYATp6SYa+TLV/ZiXdHq92r0JzmMqAQ
	 M/7jluDv1pDy5jo2RLHQ6pba5x7YAVbvlacO2vq6QBXng+5kRtmZZYnUDwRnP6ZiI8
	 /vWNLksgm0Acdy8COTmRrYHZjd9F2o85uEXWoLNTPvHG9Q03lQp0O/CKsXRU5xzbaV
	 rY+x+afOa1ANwNfGhHMgwLHTFY+tzNl8Eq4VA/elJTRDYHLyWqM8sl7AKnP8buwD6N
	 TLo8KlQIGYVgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260904-rpi-tryboot-v4-1-fdee8bc53ff7@linutronix.de>
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
 <20260904-rpi-tryboot-v4-1-fdee8bc53ff7@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:51:08 +0000
Message-Id: <20260904075109.17A191F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch claims to reorder the `rpi_firmware_property_tag` enum=
 by tag values but introduces a new sorting error by moving higher values i=
mmediately before lower ones.
--

commit 5b5e3e4d76c8fceb817f997acacf1b16bf561c0e
Author: Gregor Herburger <gregor.herburger@linutronix.de>

firmware: raspberrypi: reorder rpi_firmware_property_tag enum

This patch reorders the tags in the rpi_firmware_property_tag enum to
sort them by their tag values. It claims no functional change is intended.

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
> =20

[Severity: Medium]
The commit message mentions that the enum is being ordered by tag values,
but does this actually break the ordering for these values?

The new placement moves RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF (0x0004801f)
and RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF (0x00048020) immediately before
RPI_FIRMWARE_VCHIQ_INIT (0x00048010) in rpi_firmware_property_tag.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-rpi-tryboo=
t-v4-0-fdee8bc53ff7@linutronix.de?part=3D1
