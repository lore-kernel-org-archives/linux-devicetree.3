Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7635F162
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935069; cv=none; b=GceO5VdwSd83DPXCVX9ZDfDn23m/ow38EVpl60Kv5DIztzA2reCUi5s/J9wzxsQ4nuMAW3XHgTISktsFsMevFzqhL/OZXakvFKqdlz/wis91lltl0pduJCxEiNIazGMRQTGNchGWxgqOyVaNWctKJI+o0ld/ixx6h9XKTc4T8Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935069; c=relaxed/simple;
	bh=R+XcBSRoP20MzE8feaSuon/vSzllgPgL9VyElrAn9G8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p/lbwKTbYCmo5w/8wAUuFH61rvr6659Wkoj0Y19ya6vUUvJ/BwBJQYZURr+DrcgAmbtWLjAgojt/UsVx5fCGHZfvSK4NO3OQLWdRELtbFVqzjul4n66qOah67iFAK+yiMgaZHfHz1EfSdJE45wv5yBhM3BItSRMbeYSklkX+Pig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cew2cAt5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cew2cAt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D391F00A3A;
	Wed,  9 Sep 2026 06:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788935067;
	bh=YLXPMs+HnNw3P3hEYeHq9sM2OCN6AKw74caev15BHEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cew2cAt5YYatzVrQfAA3BhQ1Ka44yRN9SUdyqquF+fyP6lBn/RsaSwS4vThnS4YxG
	 NLywEcavRgNlgiKChRyh+Fe9Wa9ocTEfX1maZcmk2sh0qfT5OFHYbs5P3oBKM/X10s
	 Q8SnnE0FO0REMo0BZO9hbJQAyrKIf4q38VDd8UXatvz0coBij+TBjLNCqoBDFBCNOs
	 kyXcf5NCDF1A02E4oBHE43qOVgLPNU2pxNpLKMm1rNwXEwOkdb7Bd3Evge4j2xxSSt
	 qLrZGtgHowIh0unah8bwWWeQd9W020cai2rJyAK3W4YcSAu+J3zRZGn37mvUS50JwA
	 Xi095e6WovfBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH PRELIMINARY 5/5] arm64: dts: qcom: shikra-iqs-evk:
 enable both Ethernet ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-shikra_ethernet_dts-v1-5-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-5-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:24:26 +0000
Message-Id: <20260909062427.29D391F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The custom `vdda-2p5-supply` property is not supported by the DP83=
867 PHY driver or the kernel's MDIO/PHY core, causing the fixed regulators =
(`rgmii-phy0-pwr` and `rgmii-phy1-pwr`) to never be enabled. As their pinct=
rl states explicitly drive the GPIOs low, the PHYs will remain permanently =
unpowered and Ethernet will fail to function.
--

commit 6a680ac089e27638d63a04a13237e86b52add97e
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

arm64: dts: qcom: shikra-iqs-evk: enable both Ethernet ports
   =20
Enable ethernet0 and ethernet1 on the IQS EVK with their respective
TI DP83867 RGMII PHYs. Both PHYs are powered by GPIO-controlled 2.5V
regulators.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-iqs-evk.dts
> index 727809430fd15..049feb5b4d965 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -21,6 +21,78 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	rgmii_phy0_supply: regulator-rgmii-phy0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "rgmii-phy0-pwr";
> +		regulator-min-microvolt =3D <2500000>;
> +		regulator-max-microvolt =3D <2500000>;
> +		gpio =3D <&tlmm 66 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 =3D <&rgmii_phy0_pwr_default>;
> +		pinctrl-names =3D "default";
> +	};

[Severity: High]
Does this regulator rely on the PHY driver to enable it? It lacks the
regulator-always-on property and is configured to default off via its pinct=
rl
state (output-low below). If it is not enabled by a driver, it will remain
disabled.

[ ... ]

> +&ethernet0 {
> +	phy-handle =3D <&rgmii_phy0>;
> +	phy-mode =3D "rgmii-id";
> +
> +	pinctrl-0 =3D <&ethernet0_default>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		rgmii_phy0: ethernet-phy@7 {
> +			compatible =3D "ethernet-phy-id2000.a231";
> +			reg =3D <0x7>;
> +			reset-gpios =3D <&tlmm 135 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <50000>;
> +			vdda-2p5-supply =3D <&rgmii_phy0_supply>;

[Severity: High]
Is the vdda-2p5-supply property supported by the DP83867 PHY driver or the
kernel's MDIO/PHY core?

If this custom property is silently ignored by the kernel, the fixed regula=
tor
above will never be enabled. Combined with the pinctrl state explicitly dri=
ving
the GPIO low during boot, won't this leave the PHY permanently unpowered and
cause the Ethernet interface to fail?

[ ... ]

> +&tlmm {
> +	rgmii_phy0_pwr_default: rgmii-phy0-pwr-default-state {
> +		pins =3D "gpio66";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-low;
> +	};

[Severity: High]
This explicitly drives the regulator GPIO low (off) when the pinctrl state =
is
applied during boot, actively disabling power. Since the regulator isn't
re-enabled later due to the unsupported supply property above, does this le=
ave
the PHY unpowered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-shikra_eth=
ernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com?part=3D5
