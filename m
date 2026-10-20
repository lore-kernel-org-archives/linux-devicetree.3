Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492105;
	b=VLctNLrP+FKH1mumOMPN7HGzSpC2nT4p6OrcYiTaRVeEx+kxx5u0VFQ+ppZDdcv/EAcJ
	 d0AiIj9Zbeg1Zq/c3JK6oLp/fguTwkfKgewi9WolMfb2y3GbXgbd+Ki1P3ZeFyS1/sfjk
	 W/L9jIYUlj3QvH6AW48z1LVMH2dSA+SMczUkwiTOogk0pjrFTK1UgBKd9lNBLuxG99FYt
	 NOM5hJE/2yh8YO3GlaFblD0UUEp3MhmU91xKKGrAD0xPQ8w5vYrE9FSaC9GhzXoGzurbu
	 ktHjKVOZuu1jknBmqBkEc6sOOQJ/III65mUbHDK/A7zwvYgWn/oEnrYZnWFfv2VGN8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492105;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U3iPd6RBsT0mulVagKq7lWmttU5Fcouay6LNuRK75/k=;
	b=uOt+iqO96e22dxz18KypQrQDT8jQqQPO1LwWPh+F1TGKLtvcjunq+XbzLvgiuaZ7lvlu
	 f2i0J6G9mBZF7zW5eoHCmoHGmCbv9Vd2IfMgMCMkrQPiRinRcTPJSoFkcYRsGB1cEpVbX
	 659x7LaKycPOnwlaHMbqMpzAhUWthXT6ybuZlNZIsf33YuBSjrtHZo8i0XE4d9uhuXtUu
	 liG74D46+oHrankq8B1OZSw0CuOQrcAyJ639XmnAtDQqHEAVczokB2isMDbnP0oOD+Jh6
	 +5zgKQf2M/lOnEkjMJ7utBdSFLwmEE51a6GZdJgxqQH86U1fypAl+/kfPb1+VEj/tSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kJWcEwWs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A55606A326
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kJWcEwWs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B075E1F000C5;
	Tue, 20 Oct 2026 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492105;
	bh=U3iPd6RBsT0mulVagKq7lWmttU5Fcouay6LNuRK75/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kJWcEwWsjXyljaJVb0qEKWT8XwI3SAwvd02RxxaQZraOkX+D2WCCn3GXFie1UOUMV
	 HuOxlZoFytg9YoXNw6Sfov143GcA69TCYEMlPM0T9NqRKgPlFZesbqXzmkPA/yLm6y
	 vipBElXvaYQXlBXIeFSqF5/lMz+sm4lpBUDtrIwr3UN5WjYCPzGGnaA4djXYE4rz7d
	 Zrl0OZdrg1yoOT5hUNHb8Mfk6lVwefjj3i9z7lws7Am/0zzD4lgX55w7M3HQ8erBp/
	 rhi6bsbAtzekWUUAiubBWIMEjRu08ujmyDe888BI17VIJ2fG+r38zyHIBT8DRB04JJ
	 cZUBw5izls7gA==
Message-ID: <sashiko-outbox-178837@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: Add Draco EVK SoM
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikishan Thawre" <gopikishan.thawre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-2-dcabe94f1074@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-2-dcabe94f1074@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:28:24 +0000
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
- [Medium] arm64: dts: qcom: lemans-draco-evk-som: swapped USB QMP PHY supp=
lies
--

commit 8560cf8c07ec29ddb7e6a2feb1b5ebde75e47b48
Author: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add Draco EVK SoM platform

This commit introduces the device tree for the SA8775P/QCS9100-based LeMans
Draco EVK SoM, configuring RPMH regulators, remoteproc instances, UFS, USB,
GPU, and video processing unit nodes.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi b/arch/ar=
m64/boot/dts/qcom/lemans-draco-evk-som.dtsi
> new file mode 100644
> index 0000000000000..6b7971bcdc934
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi
> @@ -0,0 +1,401 @@

[ ... ]

> +&ufs_mem_phy {
> +	vdda-phy-supply =3D <&vreg_l4a>;
> +	vdda-pll-supply =3D <&vreg_l1c>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_0 {
> +	status =3D "okay";
> +};
> +
> +&usb_0_hsphy {
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +	vdda18-supply =3D <&vreg_l6c>;
> +	vdda33-supply =3D <&vreg_l9a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_0_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l1c>;
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1 {
> +	dr_mode =3D "host";
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +	vdda18-supply =3D <&vreg_l6c>;
> +	vdda33-supply =3D <&vreg_l9a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l1c>;
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Are vdda-phy-supply and vdda-pll-supply swapped in both usb_0_qmpphy and
usb_1_qmpphy?

Earlier in this file, vreg_l7a is configured as the 0.72V-0.95V rail and
vreg_l1c is configured as the 1.14V-1.26V rail:

    vreg_l7a: ldo7 {
        regulator-name =3D "vreg_l7a";
        regulator-min-microvolt =3D <720000>;
        regulator-max-microvolt =3D <950000>;
        ...
    };

    vreg_l1c: ldo1 {
        regulator-name =3D "vreg_l1c";
        regulator-min-microvolt =3D <1140000>;
        regulator-max-microvolt =3D <1260000>;
        ...
    };

On SA8775P/QCS9100 QMP PHYs, vdda-phy-supply is the lower-voltage (~0.88V)
core supply and vdda-pll-supply is the higher-voltage (~1.2V) PLL supply
(matching ufs_mem_phy above, as well as the fix for other LeMans boards in
commit 932113c3c778 ("arm64: dts: qcom: lemans: Fix swapped USB QMP PHY
vdda-phy/vdda-pll supplies")).

In drivers/phy/qualcomm/phy-qcom-qmp-usb.c, qmp_phy_vreg_l[] specifies
different initial loads for the two supplies:

    static const struct regulator_bulk_data qmp_phy_vreg_l[] =3D {
        { .supply =3D "vdda-phy", .init_load_uA =3D 21800, },
        { .supply =3D "vdda-pll", .init_load_uA =3D 36000, },
    };

Because both vreg_l7a and vreg_l1c set regulator-allow-set-load, having the=
se
supplies swapped causes the PHY driver to vote the 21.8 mA PHY load onto the
1.2V PLL rail (vreg_l1c) and the 36 mA PLL load onto the 0.88V PHY core rail
(vreg_l7a).

Should both usb_0_qmpphy and usb_1_qmpphy use vdda-phy-supply =3D <&vreg_l7=
a>
and vdda-pll-supply =3D <&vreg_l1c> instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-lemans-dra=
co-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com?part=3D2
