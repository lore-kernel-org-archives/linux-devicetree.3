Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07404372049
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097607; cv=none; b=cM11fLxmdjaVzSctTvAsAifSLOjHNBXCO+cXDSfUtMyc4n+fs7Qq3ezf8mM2IqS6rHy93DfoBc5yCPYMSS27es4qetEuLor0FcRsO+Chg3AB6cUznqlug8wWyPjLCef5Htk8p1lsbGG9mI6gcybRPfMdjAXsTpQYYoVhOmZMqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097607; c=relaxed/simple;
	bh=djlflqW34i2wECU4MvXaQH5qJ2jPy972iv5zGS0Cc6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z38iV/L1zHykeOBkQfJfOlSdqDJ0/C3Rf2CZ3RtJzWNufSBekNVy3vOnRybMMpFlU0UM+ocENl+Nmt5DZSTGavN8Y1BfYldvYedPN26otHvdB7dQ/q6txdNO/ATj3gBJ7rMulWxDBPnNKaeZ842hae20cATJ7i+AAQQxh5UIiZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Re5QTsHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Re5QTsHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6DF1F000E9;
	Sun, 26 Jul 2026 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785097605;
	bh=B1YxlU8BBhOK6tQiTrcIR71UmCeieT44RHJV42wXvEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Re5QTsHscXaEo3zTxJRozbHVTBo5BG4n7qZ+HVNea0byAUc5JsNMPbBZlQG4LiN6Q
	 sD5s6qY2rM5fjoPgp/H0qjIiFD+lRtC2ane08vrn2tAa74d83XrjqhVdpg++P2WOke
	 0HWqC0KKJXIcwnMTUYxpCrnHo6dLdMiFBHSoDqGYL756BLYemQcy4eBgB4SYhR06FJ
	 cWlJ/dy4F67RYWniufiHOO6vg45Ey5xIveDu1PJ1UOeNXwIcm2jvbIbOCmSbrhhW9n
	 NHd3zRxqkZqRMnAPLjzKa+Y7OSbgN1iYryAbDavKfFRqs+ddyHR/ceeUDmNch7OTsD
	 4W40QiSfEgtxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260726201647.264108-4-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
 <20260726201647.264108-4-robazzalberto@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 20:26:44 +0000
Message-Id: <20260726202645.3B6DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Pin multiplexing conflict on GPIOX_16 between the Wi-Fi SDIO power=
 sequence reset and the 32.768kHz PWM clock.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: amlogic: add support for Orbbec Z=
ora P1 ---
commit 4c25c22b59ef54a3b08d02aab848d6f6aa6af1ef
Author: Alberto Robazza <robazzalberto@gmail.com>

arm64: dts: amlogic: add support for Orbbec Zora P1

This commit adds device tree support for the Orbbec Zora P1 board, an A311D
based device. It builds upon the ODROID-N2 device tree, adding specific GPIO
wiring for Wi-Fi and Bluetooth over SDIO and UART_A. It also includes the
board's compatible string and LED configurations.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/ar=
m64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
[ ... ]
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		clocks =3D <&wifi32k>;
> +		clock-names =3D "ext_clock";
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible =3D "pwm-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768>;
> +		pwms =3D <&pwm_ef 0 30518 0>;
> +	};
[ ... ]
> +&pwm_ef {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&pwm_e_pins>;

[Severity: High]
Will this create a pin multiplexing conflict on GPIOX_16?

The sdio_pwrseq node claims GPIOX_16 as a standard GPIO for the reset-gpios
line. However, the pwm_ef node requests the pwm_e_pins pinctrl group. On the
Amlogic G12B platform, pwm_e_pins maps exactly to GPIOX_16.

Since a single physical pin cannot concurrently output a 32kHz PWM clock si=
gnal
and function as a static GPIO reset signal for the Wi-Fi module, will the
pinctrl subsystem fail one of the requests and prevent the Wi-Fi module from
initializing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726201647.2641=
08-1-robazzalberto@gmail.com?part=3D3
