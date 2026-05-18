Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AAB3F8EC5
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103859; cv=none; b=KkFT04tetcJJ5+1WbpPx1g+Hx/SkaiHxLyLSglFVYDoOr2U9uUIlohDE6Nuxv8PZQFcrejqUzj0Qs/1ZDLYG/zwh83x9NpXpY48j+XHSpxkALGFMbds9BuzC5u6/bR4eF5GHWfNAwr4t4Wwu7QriKJfrkOkSy3y7CJ2Gk5zjIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103859; c=relaxed/simple;
	bh=xX5bWMH2DpFoRI9ZEdvEg0voz2v3bRVWF50n4zG+dlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mXS+WJKZoZab1PyZkdBnTvnoeCvPMsnSk6Qq+TBSWpZob2yzkHaOhsdkxnjtR/xzQy7k2clCuHI+uzm3/X0zoQ0Fj5tsL8dhcAh0YKgUDN+Hd2OWJnRDH2kGRHHadEjj83g6bsDVJl+IQuAHn2QDyr9s5I4tfPhsSIAmTmFQsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBrnnq/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBrnnq/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE78C2BCB8;
	Mon, 18 May 2026 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779103858;
	bh=xX5bWMH2DpFoRI9ZEdvEg0voz2v3bRVWF50n4zG+dlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CBrnnq/F7jzV6BqQNSLNox6DQrxiKpbuBIycBgxDIA2Ra/ZNq1l9B5YbG41dYzwSW
	 5TUSWa/XQx1sAqL6iqYOaxyk7dII94InDAIP+Mn4OcTMRmM+K94VJ/KOHMvEnwb0a0
	 sF47pIhhEfAB5Oc85wnTDB2alNJO7ROQXhLeYv7CEmX8qYIXrWH7VPD/h+Pi7C/LIg
	 DRK0L0oTyUbs4hbKoKALmRKL0Sibjpk5RmQIXcJBTtwp/J0p/dlteihrXeKmTXnmNc
	 rHGA2Oc4bUCmx59hnHpai8YI9eYZPC/I3EOIwW1IM1SiGZMURVkRFrEr/eYruboHWy
	 YiHebJwF9yxwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajit Singh" <blfizzyy@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260518110435.16262-4-blfizzyy@gmail.com>
References: <20260518110435.16262-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:30:57 +0000
Message-Id: <20260518113058.8BE78C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `camera-thermal` zone references a non-existent thermal sensor=
 index.
- [High] The `pm8350c_temp_alarm` node polls the wrong PMIC's die temperatu=
re.
- [Medium] The `sdhc_1` eMMC node is missing the `bus-width` property, fall=
ing back to 1-bit mode.
- [Low] Peripheral regulators bypass power management by omitting consumers=
, and the Type-C regulator is completely unpowered.
- [Low] Regulator naming typo for the PCIe1 3.3V supply.
--

commit a197cbbff2c551bcef5dc82c20f61017dc75d278
Author: Ajit Singh <blfizzyy@gmail.com>

arm64: dts: qcom: Add Vicharak Axon Mini

Add DTS for the Vicharak Axon Mini board based on the Qualcomm
QCS6490 SoC. This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0
host, PCIe, support along with regulators.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/ar=
ch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
> new file mode 100644
> index 0000000000000..538485e342ed4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

[ ... ]

> +	thermal-zones {
> +		camera-thermal {
> +			polling-delay-passive =3D <0>;
> +
> +			thermal-sensors =3D <&pmk8350_adc_tm 2>;

The &pmk8350_adc_tm node only defines subnodes for reg =3D <0>, reg =3D <1>=
, and
reg =3D <3>.

Does this missing sensor index 2 cause the thermal framework to fail to look
up the sensor and bind the camera thermal zone?

[ ... ]

> +	vcc_5v0_typec0: regulator-vcc-5v0-typec0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_5v0_typec0";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc_5v0>;
> +
> +		gpio =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vcc5v0_typec0_en>;
> +	};

Since this regulator lacks both regulator-always-on and a consumer node that
would request it, will this regulator ever be enabled?

Additionally, do regulators like vcc_pcie0_dsi_3v3 and vcc_pcie1_3v3 bypass
runtime power management by relying on regulator-always-on instead of being
linked to their consumers?

[ ... ]

> +	vcc_pcie1_3v3: regulator-vcc-pcie1-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_pcie_3v3";

This isn't a bug, but the regulator-name omits the index '1' compared to its
node name.

[ ... ]

> +&pm8350c_temp_alarm {
> +	io-channels =3D <&pmk8350_vadc PMK8350_ADC7_DIE_TEMP>;
> +	io-channel-names =3D "thermal";
> +};

Does reading PMK8350_ADC7_DIE_TEMP cause the pm8350c_temp_alarm to track the
primary PMK8350 PMIC's temperature instead of its own PM8350C PMIC?

[ ... ]

> +&sdhc_1 {
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +
> +	vmmc-supply =3D <&vreg_bob_3p296>;
> +	vqmmc-supply =3D <&vreg_l19b_1p8>;
> +
> +	status =3D "okay";
> +};

Does this node fall back to a 1-bit bus width without an explicitly defined
bus-width property, degrading eMMC performance?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518110435.1626=
2-1-blfizzyy@gmail.com?part=3D3
