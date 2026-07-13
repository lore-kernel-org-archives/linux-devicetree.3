Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252F35A387
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941065; cv=none; b=tQ5LCpagToR+6yB4zbBIZU6gSXeV7raUb9uopAcnRtwXhcBRkVaZBHvKRqGdPQzu3fw8BMo74D2d7y4/5WUnUtatjGf5xyOtkTWT8hW+kCHRHuOLD7kDQW5gsFRnYQA3Il6C6IJNuHsG4XEnCtOklgTYVNw7J1+6aYBqXNIS6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941065; c=relaxed/simple;
	bh=EGXB8yeRUQ2J3HxM+M5MB8tUDKfhobvzBsKP0GAaj8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rcr3AoB+KWCNis6+r6XvkwP90dbRkfm1MP7Fvk10ZW7Pvmnn0OMccMkSJU6KS6Pr3vzAGvPoIhjF5793ze/dzidLb//jx3rB8nHWnMGg/MMqT2k4Y/GK3mHRgbNGoo8aU9bi6vL2xfrcwdlouFH+QN/4J9vnqE37Y+jQpgWI9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alJrUFVk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alJrUFVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177231F000E9;
	Mon, 13 Jul 2026 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783941064;
	bh=I6TgTscz1ajlxOShBQNvYClMe1K2o+viguudEWs7jp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=alJrUFVkUvMC8xZax1roK9AXSwzZPj2JAq8ZwwXBGGuCRxWHWjpPtlyf1glkiMDVG
	 4yzAZot461xTQS/ma2HU5JS3Gz9QE7iYAB+Ie+RA/29V6QrQ5iB8dkx0vj7mrA1Mpa
	 HrZ1Lgk0azI1vzzOgt7QgZ/PiZ182uCLNifeysZmfMZs+7CN6D2jmua8Q3HtqCQXeW
	 2GHVhM9Dz1kw0W0Bfja9OD/YYW57q7kamp0g0mtk6/cn8u93f/xeslG+VpXsuIMBVw
	 ++1Zqv8g1z9FkrKDz4HfruBWmjdPwgKm2I6OY1cQxD6CWRFNAgzCSkBU0is5ELogKN
	 kpqHFfU9wsFpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] ARM: dts: mstar: ssd201htv2: Add SD card supply
 regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Palmer" <daniel@thingy.jp>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260713105950.1346962-9-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
 <20260713105950.1346962-9-daniel@thingy.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:11:03 +0000
Message-Id: <20260713111104.177231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The fixed regulator node `reg_sd_vdd` is missing the `enable-act=
ive-high;` property, causing the GPIO subsystem to silently override the po=
larity to active-low despite the `GPIO_ACTIVE_HIGH` flag.
--

--- Patch [8]: [PATCH 8/8] ARM: dts: mstar: ssd201htv2: Add SD card supply =
regulator ---
commit 54af4e7814b68ef5327152ebd2b9e1372991e4d5
Author: Daniel Palmer <daniel@0x0f.com>

ARM: dts: mstar: ssd201htv2: Add SD card supply regulator

Add the fixed regulator that supplies the SD card slot on the ssd201htv2.

> diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201h=
tv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.d=
ts
> index 5d81641414a21..9f0ce16a08748 100644
> --- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts
> +++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts
[ ... ]
> @@ -18,6 +20,14 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	reg_sd_vdd: regulator-sd-vdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "sd_vdd";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio SSD20XD_GPIO_GPIO0 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Is the enable-active-high; property missing here?

For regulator-fixed nodes, the GPIO subsystem applies a legacy quirk in
drivers/gpio/gpiolib-of.c:of_gpio_set_polarity_by_property() where the
absence of enable-active-high forces an active-low override. This ignores
the GPIO_ACTIVE_HIGH flag.

Will this cause the regulator framework to drive the GPIO low instead of
high, failing to power the SD card on this board?

> +	};
>  };
> =20
>  &pm_uart {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713105950.1346=
962-1-daniel@thingy.jp?part=3D8
