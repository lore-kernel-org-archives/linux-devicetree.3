Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895198;
	b=WEVtbXA13shBifoti85T7oR9iyucJL37sKipInSUdeiuCX8YLbC2uu6Ja5vzhXwk8d+z
	 vhIA9pWdDGdWDgy1/n1Z9GcWPBWASCcKyY2qBkJ72+uRGwvZxwoSwivxDNQTsuLAG01zo
	 lI1Xg5HSUjEPfnjMBe8rxqhzrT/WRz434Togd37w+X6dRWVjGZ96qqATEzG7F9tfJH/n5
	 oSuZxQkWlO2kqIFVx2F9ro3hyHRFnUF7/qtRPP3OTMo88tym8U0Nf/ZjQO4QovNCn68Hy
	 RgfGI0urL8tLOrnoCFe0kwj/sZwdLui/VSK/HG1adWR3RuTppZcqEXL7WQX8+H+ywBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895198;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=teswEI4UKJVl8bmt8a0rq4l6YqA35zCJmKNWoGkQGFM=;
	b=GVIJbSzBdx/m/SU8ynJU15isyLFDL0+weGFzl6ipm3GZ1NiPeFxsPJWc2XtvE70PaPSh
	 ToZ5/U0ZwtIg4luQ6UkkBKNUFnGiQj9yyhnudTXLF9QPfvXVHv6DRs21jULRn3yewXGtv
	 dK2NWym5yGHYLbSHR4Weum33tUncgkK37SpP1p6/gQzsWVj8mNs8wBQSgmUevOqxQEmYB
	 OlamPOiMT2LEs+TkiyHcK/wdCIGZDQynzvYkKSoBt0IdJNWrhwYehOvusXs1TyQe/ijdN
	 bKmmon7s5ti2BIg/qFg9Ham+6qLgPRhAubiMJaUa98DKexOpvSmqbdW8Ss4bqpCR8Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dm23NK9q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0164606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dm23NK9q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302F41F00919;
	Thu,  5 Nov 2026 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895197;
	bh=teswEI4UKJVl8bmt8a0rq4l6YqA35zCJmKNWoGkQGFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dm23NK9qKhSXXqUO/cmRHz3siCuNUJuaSTp8kkdLtgKA0rxkxWbLHhZ0494Z9oTVf
	 AMCXM98dleccoF6VyOw4PXT+3H7HuO6iTXVLgmubirCQ2UB/5Pw08EUB5uzlIBuP3X
	 JFGmoI9qtMF8wMafadwPfv9/F2HQ0CAOV/WyuyW+xJLhp/uyNuh03qTtVaZ41pCxOb
	 5HV2ikj5OlI/G+jGcnLEB2pVuWG7cne4DJtp/hgDKRCUuLNqnY2i+9QeOce97KcTj4
	 LXxB/v58kM1nF2WB3goXQ2YvVSfSkk0ZvjpcF4fI2lXqNaxT6/iGT60+vhu+XLZ/Z4
	 ADr/mZekbYCOg==
Message-ID: <sashiko-outbox-199451@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/7] dt-bindings: iio: imu: icm42600: Add ICM-42670-P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-b4-inv_icm42370p-v8-2-b44eb96020b6@axis.com>
References: <20261105-b4-inv_icm42370p-v8-0-b44eb96020b6@axis.com>
 <20261105-b4-inv_icm42370p-v8-2-b44eb96020b6@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:13:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: imu: commit title names ICM-42670-P instead of IC=
M-42370-P
--

commit ee05c3444a8f259324760f6fbb66f8234e85b9e5
Author: Kanak Shilledar <kanak.shilledar@axis.com>

dt-bindings: iio: imu: icm42600: Add ICM-42670-P

This commit adds the TDK InvenSense ICM-42370-P 3-axis accelerometer to the
invensense,icm42600 Devicetree binding schema and updates the binding
description accordingly.

>     dt-bindings: iio: imu: icm42600: Add ICM-42670-P
>    =20
>     TDK Invensense, ICM-42370-P is a 3-axis accelerometer. The device can
>     support I2C, SPI and I3C. This device only has an accelerometer and
>     lacks gyroscope and it has very similar properties as that of the
>     icm42607/p the gyroscope feature is controlled via the driver dependi=
ng
>     on the device. Add this device to the existing dt-binding and update =
the
>     description to match the devices.
>    =20
>     Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-4=
2370-p
>     Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
>
> diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm4260=
0.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> index 8d16421c6f82e..7c5f42f384672 100644
> --- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> @@ -11,10 +11,11 @@ maintainers:
> =20
>  description: |
>    6-axis MotionTracking device that combines a 3-axis gyroscope and a 3-=
axis
> -  accelerometer.
> +  accelerometer. Some devices such as the Invensense, ICM-42370-P only h=
as a
> +  3-axis accelerometer.
> =20
>    It has a configurable host interface that supports I3C, I2C and SPI se=
rial
> -  communication, features a 2kB FIFO and 2 programmable interrupts with
> +  communication, features up to 2.25kB FIFO and 2 programmable interrupt=
s with
>    ultra-low-power wake-on-motion support to minimize system power consum=
ption.
> =20
>    Other industry-leading features include InvenSense on-chip APEX Motion
> @@ -28,6 +29,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - invensense,icm42370p
>            - invensense,icm42600
>            - invensense,icm42602
>            - invensense,icm42605

[Severity: Low]
This isn't a bug, but should the commit subject reference ICM-42370-P inste=
ad
of ICM-42670-P?

Both the commit message body and the changes to description and
properties.compatible in
Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml add
invensense,icm42370p (ICM-42370-P) rather than ICM-42670-P.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-b4-inv_icm=
42370p-v8-0-b44eb96020b6@axis.com?part=3D2
