Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9332931CE
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100667; cv=none; b=Ag2KavBTa3A8mz7yH0i3sDUeNVjtBumD7dQd1SSIN4gWn7Np8scXFuILFB6c1F1Za8sxrvRqzp6ZywNd7b8Dogzqyg+0FHk0X5iAETezO8XZSwEV17plGyXuzX7VY1eej8b9pBVN4vpNOtoMcx9FjOuzyn+Yzbz3HMhefdiKiaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100667; c=relaxed/simple;
	bh=0RkbC0rM24sneMOpxA4CQJmyxD0lICSBq6fLF3Afbvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=giH/a6/6+1j2oU4sR8INKjT5BZCTeMCUQ6P4wILs1oXw+ldmTQianwPjUiWQ4XIY9sEbv6xgmvAbwbzxkKqYjWQ4Gz6ctaZ0xqLGEf4/jDB/25WZdMjcU6cQkBtYFlvJ1ZQGdD8StocNH8XOG8ItWQ6AOwr83dS//FbCKEDpQNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hz/eNX/4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hz/eNX/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547BE1F000E9;
	Wed, 15 Jul 2026 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100660;
	bh=QReh1O5u2bovzbGXFRRogyP8tL8I5PK5yYF1XRHoWpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hz/eNX/4TAfN/llRNOWAt/ie8k6W6C5UZSSCx8jZziBOJn6fQY5dXY7MVfbelYmuT
	 8aBjPC1PdcleyCZfikQdxGMDRfSsZpYHw+RwD0nl7C7p3Jtu9A2PqVPZEd5N0+np6l
	 LcBlSeJf5QNr/wBCun3lUOlLU5Jn7mJGUlx1lAJ7mrSdReZeKpyoxjgHnGuNJ/Bkrj
	 R8ngx3bjM2f7DSUfJADWrLcswfiRznRhKUKOUy132SRkb/KJhFOgRKdJRtRN7+cy8z
	 9tdaJdeTfG6aIy45fAVP/EtvQE3ts00FgZKOPQt9sFLH+4HgqV2SGbFTrufaHtjAfo
	 ZBrAT2G//ZxIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq5210: Add nodes for
 multiple peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260715-08-dts-v2-1-b060b68e0256@oss.qualcomm.com>
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
 <20260715-08-dts-v2-1-b060b68e0256@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:30:59 +0000
Message-Id: <20260715073100.547BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing `phys` and `phy-names` properties in the PCIe root control=
ler nodes.
- [High] The `gcc` node is missing the `#interconnect-cells =3D <1>;` prope=
rty.
- [High] The `gcc` clock-controller node is missing the reference to the `s=
sphy_0` USB3 pipe clock provider.
- [Medium] Missing `cooling-maps` in `cpu1-thermal` zone.
- [Medium] Undocumented compatible strings and missing schema updates.
- [Low] Missing interconnect dt-bindings header file causes build failure.
--

--- Patch [1]: [PATCH v2 1/2] arm64: dts: qcom: ipq5210: Add nodes for mult=
iple peripherals ---
commit 86962855e3cf6145af313fddfdeed7cd398a2a13
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals

Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
can enable the hardware they use.

Add nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal zones.
Also describe the CPU OPP table and CPU cooling cells needed for CPU
frequency scaling and thermal throttling.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 2cdc10529c489..8fc8673ef6763 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -4,7 +4,9 @@
>   */
> =20
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,apss-ipq.h>
>  #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
> +#include <dt-bindings/interconnect/qcom,ipq5210.h>

[Severity: Low]
Will this cause a build failure? This patch includes
dt-bindings/interconnect/qcom,ipq5210.h, but it doesn't appear this header
exists in the tree yet.

>  #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
> =20
>  / {

[ ... ]

> @@ -130,6 +178,170 @@ soc@0 {
>  		dma-ranges =3D <0 0 0 0 0x10 0>;
>  		ranges =3D <0 0 0 0 0x10 0>;
> =20

[ ... ]

> +		tsens: thermal-sensor@4a9000 {
> +			compatible =3D "qcom,ipq5210-tsens", "qcom,ipq5332-tsens";

[Severity: Medium]
Does this compatible string setup violate the qcom-tsens.yaml schema? The
schema restricts "qcom,ipq5332-tsens" within an enum block that prohibits
fallbacks, which causes dtbs_check to fail unconditionally here.
Additionally, qcom,ipq5210-tsens appears to be undocumented.

> +			reg =3D <0x0 0x004a9000 0x0 0x1000>,
> +			      <0x0 0x004a8000 0x0 0x1000>;

[ ... ]

> @@ -146,8 +358,8 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x0 0x01800000 0x0 0x40000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <0>,
>  				 <0>;

[Severity: High]
Should the 5th item in this clocks array be updated to <&ssphy_0>? The
gcc-ipq5210 driver defines the USB3 PHY pipe clock source at parent index 4
(DT_USB3_PHY0_CC_PIPE_CLK). Leaving this as <0> will leave the pipe clock
without a parent and could break SuperSpeed USB operation.

>  			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <1>;

[Severity: High]
Is #interconnect-cells =3D <1>; missing here? The pcie0 and pcie1 nodes dec=
lare
gcc as an interconnect provider. The generic OF interconnect parsing will f=
ail
during the PCIe controller probe without this property.

>  		};
> =20

[ ... ]

> @@ -243,6 +538,24 @@ watchdog@b017000 {
>  			clocks =3D <&sleep_clk>;
>  		};
> =20
> +		apcs_glb: mailbox@b111000 {
> +			compatible =3D "qcom,ipq5210-apcs-apps-global",
> +				     "qcom,ipq6018-apcs-apps-global";
> +			reg =3D <0x0 0x0b111000 0x0 0x1000>;
> +			#clock-cells =3D <1>;
> +			clocks =3D <&a53pll>, <&xo_board>, <&gcc GPLL0>;
> +			clock-names =3D "pll", "xo", "gpll0";
> +			#mbox-cells =3D <1>;
> +		};
> +
> +		a53pll: clock@b116000 {
> +			compatible =3D "qcom,ipq5210-a53pll";

[Severity: Medium]
Is this compatible string documented in the YAML bindings? It appears to be
missing, which will cause dtbs_check to fail.

> +			reg =3D <0x0 0x0b116000 0x0 0x1000>;
> +			#clock-cells =3D <0>;
> +			clocks =3D <&xo_board>;
> +			clock-names =3D "xo";
> +		};
> +

[ ... ]

> +		pcie1: pcie@50000000 {
> +			compatible =3D "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";

[ ... ]

> +			pcie1_port0: pcie@0 {
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +				phys =3D <&pcie1_phy>;

[Severity: High]
Will the QCOM PCIe host controller driver find the PHY here? The driver uses
devm_phy_optional_get(dev, "pciephy") on the root PCIe device node. With the
phys property nested inside the child pcie@0 port node and lacking the
phy-names =3D "pciephy" property, the PHY initialization will silently fail.

Should phys and phy-names be moved up to the parent pcie1 node?

> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie0: pcie@70000000 {
> +			compatible =3D "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";

[ ... ]

> +			pcie0_port0: pcie@0 {
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +				phys =3D <&pcie0_phy>;

[Severity: High]
Similar to pcie1, should this phys property be moved to the parent pcie0
node and accompanied by phy-names =3D "pciephy"? The PCIe interface won't
initialize its physical layer correctly otherwise.

> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +			};
> +		};
> +	};
> +
> +	thermal_zones: thermal-zones {

[ ... ]

> +		cpu1-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens 15>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature =3D <120000>;
> +					hysteresis =3D <9000>;
> +					type =3D "critical";
> +				};
> +
> +				cpu-passive {
> +					temperature =3D <110000>;
> +					hysteresis =3D <9000>;
> +					type =3D "passive";
> +				};

[Severity: Medium]
Is there a cooling-maps block missing for this passive trip point? If heat
is localized to CPU1, the thermal framework will reach this 110C trip point
but take no action to throttle the CPU because there are no cooling devices
mapped to it.

> +			};
> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-08-dts-v2-=
0-b060b68e0256@oss.qualcomm.com?part=3D1
