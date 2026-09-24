Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5192E975E
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241410; cv=none; b=n/roVRx2lb2IlWF4Qhq1h3V4PAERZG2d0I+LYpu22DwFsLKJxIwqqgeRoe7yD9Y2z2JUUkEwGm/p9ZjrSk7FxljgRlz1Agvz6kT4GHL1dVsK/TpnZX4aRCf1d+8cv4KlebprmpTXuwicx5AoI5X6CSAZrG/D+feP2W+WHkJ88I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241410; c=relaxed/simple;
	bh=3SvfY0uZk5zjkmzkBwkIy11DFww5gFnXlhqQTnlwgdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FlIjgap0DCUHVaWjrK93r0InLLLmEaTPgu9BRs7z+Z++l4oy15qQR7gdnorhs6doWD8c68QGKzKJKkVnFvhbC45ydMNK61c5EdJp8Jhv6MWfYUskPhuVatOLOuR0Dp/ELhuoRSE8zRCGr0DjvuhTdXycGAgcCCrQo97i8E+Ln/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfvBPQpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfvBPQpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18F91F000FF;
	Thu, 24 Sep 2026 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790241407;
	bh=F2o5QZ393GwJwCz8dCZMlDAxyUvBzNTSDRTaEoaq7tI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OfvBPQpRso6Y1dnDosLsrjE19IdU2TjhJDW0mqXR0wljQK+n6frV12sEvJpiyHTYH
	 G4mWd4nbq9BxKw/j+EmOLENOTZJKPOSQrwdraFQ42oDmuNM8Gvm5uvTrnKzZcbw/Dh
	 +q2eelXhUbayhF79kVLLvJE82jzrVTFhZkpcR8TmMFGCE4N5p021T1KeHUErEKbjoE
	 tw7wKlDN4hhUl4+mtWta8uVcEScVOZTasoZ/8V/xdupppgcGFnE4Liw3vvJ1puUhDp
	 fEbviFgBJfFZjl0SzFuicTqOarHMggRy6br9CzOqbFgAmdh0OL551MlAP9ZnoZa51z
	 v5JLppAJQvy/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/7] ARM: tegra: lg-x3: Add flash LEDs controller
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924090608.28734-6-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
 <20260924090608.28734-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 09:16:47 +0000
Message-Id: <20260924091647.A18F91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: hw misrepresentation of single flash LED as multiple nodes
--

commit 1c030c2896d9a641e8c683129fc55fbf9766228a
Author: Svyatoslav Ryhel <clamor95@gmail.com>
ARM: tegra: lg-x3: Add flash LEDs controller node

This commit adds a device tree node for the ti lm3559 controller used for
flash leds on the tegra30 lg-x3 device. It configures the controller and
sets up two separate child nodes to represent the flash.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index 74583eb07aa84..14d4f992222c6 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
[ ... ]
> @@ -1267,6 +1268,35 @@ m24c08: eeprom@50 {
[ ... ]
> +		led-controller@53 {
> +			compatible =3D "ti,lm3559";
> +			reg =3D <0x53>;
[ ... ]
> +			/* single flash led is on 2 lines */
> +			lm3559_led0: led@0 {
> +				reg =3D <0>;
> +
> +				flash-max-microamp =3D <393750>;
> +				led-max-microamp =3D <140625>;
> +			};
> +
> +			lm3559_led1: led@1 {
> +				reg =3D <1>;

[Severity: Medium]
Does this configuration incorrectly define a single physical led as two
independent led devices?

The comment indicates the single flash led is on two lines, but splitting it
into two separate nodes exposes two distinct video4linux2 subdevices. Device
trees generally describe hardware topology rather than driver limitations.

Should this be modeled as a single node using a property like
led-sources =3D <0 1>? Even if the current driver lacks support for the
led-sources property, duplicating child nodes to work around driver
limitations is considered a device tree anti-pattern.

> +
> +				flash-max-microamp =3D <393750>;
> +				led-max-microamp =3D <140625>;
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924090608.2873=
4-1-clamor95@gmail.com?part=3D5
