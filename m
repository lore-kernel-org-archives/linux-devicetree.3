Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517639;
	b=wAm3E4z+fMvzwr6y9ygJVEcnoISjEp+TXoK5WyTGjT2qPgzxhBdls0jnK77QRTtIt03S
	 +++tPBmLAbT+RbrSM9uVV+d1ybCweTN+8r9zF6Arda71rjj/c75KxhGiHmy5vx+PmIdI8
	 90h/HRimW8pKaYA4cYrBVIKzpuXx0WWY3l/tWwfIS3pUb5HLUV+clEULEA8T/dN0FLRm7
	 ZKotk6IALA5NhPRZHXYYpUzKmFWessNLaYSdP7bXi2miYcNxp/+XdvLwr+mbxbNAJK+k/
	 hFRmwVtfdlONtCTdiYkG0Ya40p5eGrXj9Bu/DpTh7grKukKwbTbqCuuVziSOCsWP+ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/h8cpqs2o5rNrbiR92iVgBD++EoQTuHcC3DMI2G1WjE=;
	b=KJY5Fn07NyA72zgrlIsEaS50LHbulzj9aBcIUB4Q7tYAHck9lxK4Mta4tU/QU4XPrjVS
	 mcBAI067YQDOTBqDLOalxbfG0NQr7Hg7Guaaon5w1kTOt7935hOL2hwoafIZWaLN2LW0t
	 Iz7XRu7yDcfWLaTEdndS0qXrTSvLAKRFiam0KMky6bE/1KnL2yr2wttUHUrhTDHpa0ULJ
	 GS9/yt9T9hn24TwqMsHVg/OWSMWnMI14cjm0z3wHhIh+zUkyrMmFfXEECtKbTZ5blEKaL
	 1SinM3EEH1p01nCD6yxAG6jJVY7Z5P7QP7jFj30grCMdmjLIvp+A48dV/JLDbT8Z5Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pu7DWYlT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B1F606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pu7DWYlT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A911F000D8;
	Tue, 24 Nov 2026 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517639;
	bh=/h8cpqs2o5rNrbiR92iVgBD++EoQTuHcC3DMI2G1WjE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pu7DWYlTCHOaGhkPyeLaEKrcdXitMi1vqTH3YkMWOUsLcr31jEM0fpZWk6dji2Atu
	 q38DhrrKMHblsYSnOmiiLR0MVqGnM19h1kgALHsPubDAn56JMc2bTECXckGOMwazSV
	 gYSMCwFgX334xh2Z/h02RqiMcbBANSmvbRg+KhxNx3PJrlN/O8C4iZkZWv3xAH+Knt
	 B0ODgZE1EA+VULVZnWhz5h67/JszV347F9sYwgbop7GETTFP9SV7KNOmoCyTAYf1Fl
	 6Xf8+FSne92C9sTDJDD1vuuWf5UR7CPZsj7KRObkhRBpKe12t78P3xwRcbRhRt1gnt
	 ZnhALxMswdWTQ==
Message-ID: <sashiko-outbox-230988@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikishan Thawre" <gopikishan.thawre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-2-dbfc15cd0883@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-2-dbfc15cd0883@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:53:58 +0000
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
- [Medium] arm64: dts: qcom: lemans-draco-som: swapped USB QMP PHY vdda
  supplies
--

commit 30af12fb06221792ec3a7b21c3ae221d9ecdfd10
Author: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform

This commit adds the initial device tree include for the SA8775P/QCS9100-ba=
sed
LeMans Draco EVK SoM platform.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/=
boot/dts/qcom/lemans-draco-som.dtsi
> new file mode 100644
> index 0000000000000..1001b6b81c312
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
> @@ -0,0 +1,421 @@

[ ... ]

> +		vreg_l7a: ldo7 {
> +			regulator-name =3D "vreg_l7a";
> +			regulator-min-microvolt =3D <720000>;
> +			regulator-max-microvolt =3D <950000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};

[ ... ]

> +	regulators-1 {
> +		compatible =3D "qcom,pmm8654au-rpmh-regulators";
> +		qcom,pmic-id =3D "c";
> +
> +		vreg_l1c: ldo1 {
> +			regulator-name =3D "vreg_l1c";
> +			regulator-min-microvolt =3D <1140000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};

[ ... ]

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
Are vdda-phy-supply and vdda-pll-supply swapped on usb_0_qmpphy and
usb_1_qmpphy?

vreg_l7a is the 0.88V rail and vreg_l1c is the 1.2V rail.  On SA8775P QMP
PHYs, vdda-phy-supply takes the ~0.88V rail and vdda-pll-supply takes the
1.2V rail (as configured on ufs_mem_phy above), so having them swapped
associates each supply with the wrong rail and applies the QMP USB PHY
driver's 21.8 mA and 36 mA load votes to the wrong LDOs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-lemans-dra=
co-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com?part=3D2
