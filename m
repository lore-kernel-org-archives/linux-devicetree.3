Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA626CE32
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 03:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790997758; cv=none; b=NKYzk+u5yVlumm87qVTj65eCXFODJ9gfnQIYKsgyV1vrW9ir7SVMjQhayVkykE2bfC2UERW0ZXr6PzuO3eZfneksWlNc9KWWrfIkEz5iJI4nBPPOd9EDbxNz7cAIZv0lUX4samCHrFdyGzQgaRrO+/hTZ7319F5kZ3Gq9TTnngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790997758; c=relaxed/simple;
	bh=V+ZDvfS4Lk+4z/Ak5Z+7gkMOqiznyasQoayKVlAnUPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mMloLTkT5JVaD3ZaLzGDJOXw36aj7dbUzSmtgM/UtJ5H/gbZ7NMKsYG2TurUhoh7dQj9/v4iqLxhOwIf/Kf795tzguYq1Mbfc6xfWNfnINn9pr93Ec4kCGooxbusK8orVho1CqFMsA6hp4IFzJU3wNUU11Ya1iasfaylLjBUqew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LP66Oe2l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LP66Oe2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604EE1F000FF;
	Sat,  3 Oct 2026 03:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790997756;
	bh=EP7E1etbmbXCWkaG/mUP1Rr2jtYhV8xPQuM6X0GDUM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LP66Oe2ljUk0zpDG33XyDZosWF7jof8xRLmgwQ0vaxQHt+D4g0hhDdgANDi8TZYcl
	 Wbo7YaFnvpwzBcBWt94djRa7pKjpR8G+nh/Exn3MSk6P4vrrUSVqbCZMIo1tve+cWf
	 GETTCrP4c2QTOCOqZDXS5C3RzohPMDSBZLTxU1cECxR3Ynhqggttlv+/otqDqpGIUT
	 cg9Ca3V/Przj+OwYGmkg+3hF+RXv355cWkqrqehPKPI3MFQ6jGP+QGUR28FWWmfsIC
	 LhEoKUnu9M1k9LAI9YaWe2xdMRI6UxbmjGHo1MwPBeL+vMbnuQI34kpG9uFQm/ZG/f
	 2Fumxuv1EvQDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card
 be powered down
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 03:22:35 +0000
Message-Id: <20261003032236.604EE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: amlogic: SD card backpowering due to unpowered VMMC with powe=
red VQMMC
--

commit 4f4437abf57138f198c4057f670c6a5c23c3af61
Author: Igor Velkov <iav@iav.lv>

arm64: dts: amlogic: meson-sm1-odroid: let the SD card be powered down

This commit drops the regulator-always-on property from the SD card's VMMC
supply (tflash_vdd) to allow it to be powered down during a warm reboot.

Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODR=
OID-C4")

> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm=
64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index e6f02d738a21f..7dbc75bfaea25 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -38,7 +38,6 @@ tflash_vdd: regulator-tflash-vdd {
>  		gpio =3D <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
>  		enable-active-high;
>  		regulator-boot-on;
> -		regulator-always-on;
>  	};
> =20
>  	tf_io: gpio-regulator-tf-io {

[Severity: High]
Does removing regulator-always-on from tflash_vdd cause the SD card to be
backpowered during shutdown or warm reboot?

Looking at the sd_emmc_b node, tf_io is configured as the vqmmc-supply
alongside tflash_vdd:

&sd_emmc_b {
	...
	vmmc-supply =3D <&tflash_vdd>;
	vqmmc-supply =3D <&tf_io>;
};

However, the tf_io node still retains its regulator-always-on property:

	tf_io: gpio-regulator-tf-io {
		...
		enable-active-high;
		regulator-boot-on;
		regulator-always-on;
	};

When mmc_power_off() disables VMMC (tflash_vdd), VMMC will drop to 0V.
Because tf_io is always-on, the regulator core will ignore the request to
disable VQMMC.

Can this leave the I/O lines driven while the core power is removed, leading
to an unpowered VMMC with a powered VQMMC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-hc4-sd-pow=
er-off-v1-1-f7ffba01b348@iav.lv?part=3D1
