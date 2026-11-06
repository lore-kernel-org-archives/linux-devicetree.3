Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946549;
	b=cyBrgU626sTj6Y+hTbYl1v89MuiQQ+gYrWok1J6zS73j+rtPVtXYAlsh4qATYpk3jrUZ
	 CCqrz0LaYsOlb11KgQJOMUHkrMNUL8qObq8RaEO8kP/4RyNtEbFo5DtZBD8WPq9OjeIC/
	 my1U0J/Sce38iYooJ1mA8q4QTmBD91ozARVy2D6OnXY11t/9kcisPBTMiDPahOiZUJs8s
	 KcSJghli6VfGrFuY6Jx0ROqd7Up+gMaNeM7WDAUZsDMDYIMQvhJZgoftXv3T8ycOspR4p
	 ienQVUUM64jrCJreDFq7cCKgp1cttWsggUSTTMoN26+btBTfU6Zqf0a4jO4/ynWoJ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946549;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sM9v1s4AH4CM2NVTpb874B8DblZK+W6MCBtfaX6BM2Y=;
	b=4vQanifiRl1Y1eBVTj82nI9p85qxpPfhfOzVSCmx6qaWhbBmSVEsFkiw3Iklq+3YXvMR
	 FhWfa6BHQ4JEammoIHnndKM+6npQMK5Qu3NrrlkDifuoilbZKaJbnsF2ve6AUnxIFsCm8
	 Z80EQ5DuDrRE+iTFccprlcKiNWsy/c6m8cR+P2wL7IQ+PyQElJcsCvdmV9Z9iz/qGIj43
	 p6M909lBmHvnhRDZ1CFHvgja03FEJNq2F5AI36FpAR5lEvRA8i2ixxBvLGw3jfdLVmdkr
	 KRw49m11ZnzmU7QYroLo7lpl457PC2QPv6mgjPCN+Xejhlzm7txU3V4PW/95//1BmwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KwyGn1Ya;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC36D606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KwyGn1Ya
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296551F0089F;
	Fri,  6 Nov 2026 06:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946548;
	bh=sM9v1s4AH4CM2NVTpb874B8DblZK+W6MCBtfaX6BM2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KwyGn1YaUTcWxXYxeI2hoC2D3yPR/ygaJRb1CuhTaBF2nZfNK7eF6Phy+Hszg75Ya
	 IzfLZYKd/vaPuOzoqHGM5cv2D031nzt6cWVISep3bDhw8kauNWGuiqajew9mmEm3Mh
	 pxanW1whGs/4w84jGWcvja44JHB8z1u99qhQ7GgELHfLTc9+HeTtHcQr0TmkYHVG00
	 n6PnyQsHL+dlrpqJWOTdzFGhZ+O+i/pl+HbR5G4hbzUO80YJ/Qi1gpxaOl5QstPX71
	 8o8AoPsRZYLC0eOzKJK4rr50nNLMpUd5tKbhqsTQJtGRKlfEk/mL+1sKJxxJcRtQwF
	 uEYm+Bw1imcsg==
Message-ID: <sashiko-outbox-200895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: rockchip: enable SD UHS-I on
 Firefly-RK3399
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106061835.1316-1-yaozhonguwl@gmail.com>
References: <20261106061835.1316-1-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 06:29:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: rockchip: vcc_sdio 3.0V cap on rk3399-firefly
  logs KERN_ERR
--

commit 7bc8a98bc2811aebd6d7fda8a2601a2bbf060220
Author: Yaozhong Li <yaozhonguwl@gmail.com>

arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399

This commit adds the vcc_sd regulator for the SD card slot on
Firefly-RK3399, updates the power supply assignments for sdio0 and
sdmmc, and enables SD UHS-I SDR104 on sdmmc.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64=
/boot/dts/rockchip/rk3399-firefly.dts
> index 0568dfa140b32..03858a472d124 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -233,6 +233,19 @@ vcc5v0_typec: regulator-vcc5v0-typec {
>  		vin-supply =3D <&vcc_sys>;
>  	};
> =20
> +	vcc_sd: regulator-vcc-sd {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vcc_sd_en>;
> +		regulator-name =3D "vcc_sd";
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vcc3v3_sys>;
> +	};
> +
>  	vcc_sys: regulator-vcc-sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_sys";

[ ... ]

> @@ -804,6 +823,9 @@ &sdmmc {
>  	max-frequency =3D <150000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc_sd>;
> +	vqmmc-supply =3D <&vcc_sdio>;
>  	status =3D "okay";
>  };

[Severity: Medium]
Should vcc_sdio's regulator-max-microvolt be raised to 3300000 to match
vcc_sd?

In this file, vcc_sdio is capped at 3.0V:

arch/arm64/boot/dts/rockchip/rk3399-firefly.dts:
	vcc_sdio: LDO_REG4 {
		regulator-name =3D "vcc_sdio";
		regulator-always-on;
		regulator-boot-on;
		regulator-min-microvolt =3D <1800000>;
		regulator-max-microvolt =3D <3000000>;

Because vcc_sd is 3.3V, mmc_power_up() -> mmc_set_initial_signal_voltage()
-> mmc_regulator_set_vqmmc() calls regulator_set_voltage_triplet(vcc_sdio,
3000000, 3300000, 3600000) for 3.3V signaling.  The first attempt in
regulator_set_voltage_triplet() requests 3300000..3600000 uV, which
regulator_check_voltage() clamps to vcc_sdio's 3000000 uV maximum and
rejects with:

  vcc_sdio: unsupportable voltage range: 3300000-3000000uV

before falling back to 3.0V and leaving the IO supply at 3.0V while the
card supply is at 3.3V.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106061835.1316=
-1-yaozhonguwl@gmail.com?part=3D1
