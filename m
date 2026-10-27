Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101988;
	b=n1oBFKMkBCLNV0lm/rXKCmm60i2KgRF5Ytj8gGHEcahCDV/TPgn5BdaUqpoLmUKxmPfQ
	 ncvuiX9EWhqZzi4NFRwTKsjlTCDOZrhiafYt0L2ATxzDPdbq6RCudgrN91/XaJDybuDWs
	 nhzq0teMkxpXk5V1FJcTiBOYJJeE8pMhr403u/1fUUSxJTzpRDGX5bRTjXdxCihtWa2W+
	 kTIgYClIfMxkZ3p2XoJSkiudHHudRJcSsIl+FsUgSbkuvgUDThNfLybtDa/BKwMGSrOAO
	 CG1Q51TkpMBkzIHDKBDvaPMTy7X7BcOADR9qz7pWW5n+ndOE8bRnc2LowEaP3wvBNGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101988;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HCZ//DNUxVf4aS4cm+C2gfkol2jWqhxy9JcY/HzW+Go=;
	b=wAGjQCv8T1+F3HONQTEoyXNneC7Mv92Yi5V3QiSgjelAWNpwtS3XPw43B7XEp87wrsTm
	 k9BQB3J+0ZKjAsAhJp+vOVlHj2GCHN90mVLVfYI7nMq9XbGKfh+scmwFmnlFqCvfBKDzt
	 RmbTetwqtiLRmAaAAW9g7yA1dYCnRFzKjM97rrdap1ak9nE36pdJZtFvBxPsKUxSEVRkU
	 Vso7/uWUnWEsc6UCGQ022Zm8BQ//8DtIIDtQDoHD5aRrdSy8nJ4Nz/Z9HXkDnLVjTvzmN
	 kryxbutl15mIIdrsKpgzYqHebU/3z3kqRcsPXYNQKPpW+iypzr6z19++DCtqufHQzCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQHzcWTC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FB0606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQHzcWTC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1471F01829;
	Tue, 27 Oct 2026 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101988;
	bh=HCZ//DNUxVf4aS4cm+C2gfkol2jWqhxy9JcY/HzW+Go=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQHzcWTCD7R8PTR2S4mT8D6jDnkGomiIYSifW0r8JO9u5HV+oILmbnhxCsJsXImhv
	 KodgR2CrKx/H6TCsJD0B4+KBTV4/jm9eWbW7JgbwRJfODK3h0LfdQnGiUg1h2sHZl4
	 xSq3T86jI5lWU72WQOlEUirNL0pPdcqUV1CJdb6gnmZ2eSgCLBcmAAZtpYIvNpR5cE
	 9akSan6PbNyXDjkKgu5Xq3lyGRC2MxToHE96cmH3FOD5Ou4G+8FhQI9XqA3ow4yBrH
	 iW3cxcDUbDmB1kSTeiRT+MGyMAYPDiTxr4N/OpxSgM9Mb79ZVp27WGtkIUAYDVp2DO
	 HG26iypbmQp7Q==
Message-ID: <sashiko-outbox-186481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: talos: Add Talos Lyra EVK SoM
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruchira Revdekar" <ruchira.revdekar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com>
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
 <20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:53:07 +0000
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
- [Medium] arm64: dts: qcom: talos-lyra-evk-som: wrong vqmmc-supply on sdhc=
_2 breaks 3.3V/UHS-I
--

commit 9f59ab084ac5176f461f2df3b23f3bc182845992
Author: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform

This commit introduces the initial device tree for the QCS615-based Talos L=
yra
EVK SoM platform, including definitions for CPU, memory, PMIC regulators, U=
FS
and SD/MMC storage, QUPv3, remoteprocs, and GPU.

> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm6=
4/boot/dts/qcom/talos-lyra-evk-som.dtsi
> new file mode 100644
> index 0000000000000..7d9a084719067
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> @@ -0,0 +1,281 @@

[ ... ]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id =3D "a";
> +
> +		vreg_s4a: smps4 {
> +			regulator-name =3D "vreg_s4a";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1829000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};

[ ... ]

> +		vreg_l2a: ldo2 {
> +			regulator-name =3D "vreg_l2a";
> +			regulator-min-microvolt =3D <1650000>;
> +			regulator-max-microvolt =3D <3100000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};

[ ... ]

> +&sdhc_2 {
> +	pinctrl-0 =3D <&sdc2_state_on>;
> +	pinctrl-1 =3D <&sdc2_state_off>;
> +	pinctrl-names =3D "default", "sleep";
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&tlmm 99 GPIO_ACTIVE_LOW>;
> +	vmmc-supply =3D <&vreg_l10a>;
> +	vqmmc-supply =3D <&vreg_s4a>;

[Severity: Medium]
Should sdhc_2 use vreg_l2a instead of vreg_s4a for vqmmc-supply?

Here, vreg_s4a is constrained to 1.8V-1.829V, while sdhc_2 is the removable=
 SD
card controller. When sdhci_msm_set_regulator_caps() in
drivers/mmc/host/sdhci-msm.c and sdhci_setup_host() in
drivers/mmc/host/sdhci.c check vqmmc, they see that 2.7V-3.6V is unsupporte=
d:

drivers/mmc/host/sdhci-msm.c:sdhci_msm_set_regulator_caps()
	if (!IS_ERR(mmc->supply.vqmmc)) {
		if (regulator_is_supported_voltage(supply, 1700000, 1950000))
			caps |=3D CORE_1_8V_SUPPORT;
		if (regulator_is_supported_voltage(supply, 2700000, 3600000))
			caps |=3D CORE_3_0V_SUPPORT;

drivers/mmc/host/sdhci.c:sdhci_setup_host()
		if (!regulator_is_supported_voltage(mmc->supply.vqmmc, 2700000,
						    3600000))
			host->flags &=3D ~SDHCI_SIGNALING_330;

Because CORE_3_0V_SUPPORT is not set and SDHCI_SIGNALING_330 is cleared,
initial 3.3V SD signaling in mmc_power_up() ->
mmc_set_initial_signal_voltage() -> sdhci_msm_start_signal_voltage_switch()
fails with -EINVAL, breaking 3.3V initial I/O signaling and UHS-I voltage
switching.

Meanwhile, vreg_l2a (ldo2, 1.65V-3.1V) is defined in this file with no
consumers, similar to the issue on QCS615 Ride fixed in commit 4614628bea86
("arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply for UHS-I mode").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-talos-lyra=
-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com?part=3D2
