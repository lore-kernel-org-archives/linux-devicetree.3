Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E3A391838
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786422; cv=none; b=RUPhCgMW6HOe+p9OdavTyHA2Aasn7pj5zJcI2skHRTNOm5U4A4RACnlxnizy6eOvQMRBmaFCMTj03sHinRD1IA6G+F5cIukQGKd/pNTYSJMhcggzHRnAiHX7UugZaPQ/4YoNqmzDZuzBTpSjsF8sOwTutriYS5uHeDO3PpZk2rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786422; c=relaxed/simple;
	bh=VY96qEXZhtVww9lNu7+kBb5wFv8N2xYEO4RIzLsho0k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eo8kb1wgtQ5fuJluk9kIMD8L/1PXuODTW4t4wN5A5UYxjf2qFIEyyINd0k2cS+g/uWFF9WoGq/50Gd8fH39drTNIwu2lFw4FYY1M1ByC1cxn1UzI4Bx0excmM7rXuqirS9lYkNFzLf/iAgnWjZjWp9cLfEbpRUzsYSJArZJVz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VURE5NCU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VURE5NCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D761F0089B;
	Mon, 12 Oct 2026 06:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786421;
	bh=MEWlDdyST+UxKy7UjTJOZ356KGwfArfkNc9AZ1s+3Dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VURE5NCUMdpjjxfQUxVOjueFfxYAwc+qjqoi9OIpTDLJlV/JhrVlPfAFP4KWObGkz
	 xyztrfb/qnN5AFL+3MQ1bbftcTebHq8MM3BRh+WiFqtFshBPCkb8nhXwzdGxuD6cJR
	 e0EdXIwfZbJSPVLJGyx0oQXygsdXh6vZhlgIy2kQfQZMwQ6atGq9BmupuaSc5ISSDQ
	 +KBIC8FD6kgj7hQ1PHQdF/4eRRc6HZelPdYsri3YIWeOdqqk6Yes1pf5ewhSrwhcw/
	 7jBQOfx18tQJ6M0hgL+VbEDzAoVhbD0YbydwIRSTuSZWHO+XkE1mBTRR3tXwLogLNH
	 Es76CCLYhRr2w==
Message-ID: <sashiko-outbox-167734@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: talos: Add Talos Lyra EVK SoM
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruchira Revdekar" <ruchira.revdekar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 06:27:00 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: incorrect vqmmc-supply regulator mapped for removable sdhc_=
2 slot
--

commit bc866a802f7bd7dd47f8f7f1b6cd6d40693036e4
Author: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform

Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
Lyra EVK SoM is a compact compute module integrating the QCS615 SoC,
PMIC, and essential connectivity, designed to mount on carrier boards.

> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm6=
4/boot/dts/qcom/talos-lyra-evk-som.dtsi
> new file mode 100644
> index 0000000000000..15124572186a2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> @@ -0,0 +1,251 @@
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
Will this configuration prevent standard removable SD cards from initializi=
ng?

Standard removable SD cards require 3.3V for initialization, but the
vqmmc-supply for sdhc_2 is bound to the fixed 1.8V vreg_s4a.

This mismatch typically causes regulator_set_voltage() to fail during MMC
core initialization, breaking SD card support. Should this use the unused
vreg_l2a instead, since it is configured with a 1.65V to 3.10V range?

> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-talos-lyra=
-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com?part=3D2
