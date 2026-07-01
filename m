Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52D2D9484
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887714; cv=none; b=kclA4k1cpDJU6eks1RyBZQpVdPhiRf2ORl6SAhU+deXXbtntQJiQBuHZq1CKo1Og3GyIRpfLsA1wW6pLtD5TpjmKNlSPSluE84EqiHmbxzD5r/sau0VCyQuNq4dJasJYIx1VsLQHzE7l/PKR3uWAzGM3BwriYaAiMK0wuFcknLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887714; c=relaxed/simple;
	bh=phkQeCkpMHLvse7pqp7Zp0UmrS7Sji/5tV3gzvqAMtQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BZy/vob5O543GWGtrqF3jQ9Kv1+T4CxtxruzcfdsL8ZvnWiZMDfJMsvwJlbby2UV9I3jvhlxOMUZycpxuYEwuCzrWg/LU6QDkHsDuyEYoMMqyq3gnVwda6QxOg0LHXL7g6R3dwsKMg7rWAAWMLQY1uvWec+ltFZu3+YmKFkBLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApXsL/LU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApXsL/LU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED051F000E9;
	Wed,  1 Jul 2026 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782887712;
	bh=jMORKeTVs9xXgttD9qy7d+vxJAebkT3/HdRp3dJndpQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ApXsL/LU4iDuRqoUBTltQxtqAiu4/xcBtPDwzb6S/zs15xDD+7z5RrwLlEz0KMLcJ
	 tnWfN9apvhK8gePi2eCzmFO6kEGb2zfry/rNmC1dUjNGnKnPLLjjKzZm9Bz8Cd5UWz
	 oM6rPMu/p68D83Hldc42TgzPJv7iCEQ5Q4uAR/NknXmNFBGWH2S94ws81g9AvCQ+Cj
	 BK6QaLPK0mxhEzaf6QLTgt6poKEsAfHudG7NqftArS5B3jxr2vOk9Fdu1+Sd7fFCRW
	 oymqHSMRNw3FYOukv8DNX9Kt0vYQjfXmMLFsT9wSKL/s4TvYf0z2mUaDJeSPM45Gok
	 OUd/qPpRzo3gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Reply-To: sashiko-reviews@lists.linux.dev
To: lizhi2@eswincomputing.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630063445.1226-1-lizhi2@eswincomputing.com>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 06:35:12 +0000
Message-Id: <20260701063512.9ED051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Contradictory RGMII delay configuration using `phy-mode =3D "rgmii=
-id"` causes double TX delay and violates RGMII timing specifications.
- [Medium] Hardware behavioral workaround or instance-specific configuratio=
n encoded into a compatible string.
- [Low] Invalid unit-address for the `hsp` simple-pm-bus node.
- [Low] Indentation style violation (mixing tabs and spaces).
--

commit bfe37dac7b1890539f4db41b461affd87be42ea4
Author: Zhi Li <lizhi2@eswincomputing.com>

riscv: dts: eswin: eic7700-hifive-premier-p550: enable Ethernet controller

Enable the on-board Gigabit Ethernet controller on the HiFive Premier P550
development board. This patch is included only to provide the DTS context f=
or
reviewing the binding and driver changes.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 131ed1fc6b2ed..9d37bafdd1b2e 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
[ ... ]
> +	vcc_1v8: regulator-1v8 {
> +		 compatible =3D "regulator-fixed";
> +		 regulator-name =3D "vcc1v8";

[Severity: Low]
Are there space characters being used for indentation here after the tabs?
The kernel standard requires strict 8-character tab indentation.

> +		 regulator-always-on;
> +		 regulator-boot-on;
> +		 regulator-min-microvolt =3D <1800000>;
> +		 regulator-max-microvolt =3D <1800000>;
> +	 };
> +};
[ ... ]
> +&gmac0 {
> +	phy-handle =3D <&gmac0_phy0>;
> +	phy-mode =3D "rgmii-id";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpio106>;
> +	rx-internal-delay-ps =3D <20>;
> +	tx-internal-delay-ps =3D <100>;

[Severity: High]
Does this configuration cause a double TX delay?

The phy-mode is set to rgmii-id, which tells the PHY to add both TX and RX
delays. However, the MAC is additionally configured with a
tx-internal-delay-ps. At Gigabit speeds, this excessive TX skew could
corrupt the data stream.

Could the phy-mode be set to rgmii-rxid if the MAC already provides the
TX delay?

> +	status =3D "okay";
> +};
[ ... ]
> +&gmac1 {
> +	phy-handle =3D <&gmac1_phy0>;
> +	/*
> +	 * The MAC silicon unconditionally introduces an ~2 ns TX clock-to-data
> +	 * skew (MAC-side TX internal delay). The PHY provides the standard
> +	 * ~2 ns RX internal delay. The driver additionally inverts the RX
> +	 * clock at 1000 Mb/s to correct a silicon RX sampling timing issue.
> +	 * phy-mode is "rgmii-id": TX delay from the MAC silicon, RX delay
> +	 * from the PHY.
> +	 */
> +	phy-mode =3D "rgmii-id";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpio111>;
> +	rx-internal-delay-ps =3D <200>;
> +	tx-internal-delay-ps =3D <2200>;

[Severity: High]
Is the comment regarding rgmii-id accurate for Linux?

The comment mentions that rgmii-id means TX delay from the MAC and RX delay
from the PHY. In Linux, rgmii-id tells the PHY to add both delays, which wi=
ll
lead to double TX delays when combined with the MAC-side delay.

Would this result in packet loss or connection failures?

> +	status =3D "okay";
> +};
[ ... ]
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index c3ed93008bca1..041ecc5cb0077 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
[ ... ]
> +		hsp: bus@0 {
> +			compatible =3D "simple-pm-bus";
> +			ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;

[Severity: Low]
Does the unit address bus@0 match the ranges property?

According to the Devicetree Specification, when a node has a ranges property
but no reg property, the unit-address should match the first child address.
Could this be changed to bus@50400000 to prevent dtc compiler warnings?

> +			clocks =3D <&clk 171>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
[ ... ]
> +			gmac1: ethernet@50410000 {
> +				compatible =3D "eswin,eic7700-qos-eth-clk-inversion",
> +					     "snps,dwmac-5.20";

[Severity: Medium]
Will this compatible string be rejected by the Devicetree maintainers?

It appears to encode a software workaround for clock inversion rather than
describing the hardware block itself. Instance-specific configurations usua=
lly
need to be handled via dedicated boolean properties.

> +				reg =3D <0x0 0x50410000 0x0 0x10000>;
> +				interrupts =3D <70>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630063123.1118=
-1-lizhi2@eswincomputing.com?part=3D6
