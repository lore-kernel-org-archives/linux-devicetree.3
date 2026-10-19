Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F0489894
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397312; cv=none; b=ZAPZCHB3oD1Kt6xWmUkReHphNMfdS4yzYvHI7/zsmtj/SpcEOdSsybSXDPZqAYCn5sQNx9n7Z9bd15dETJCNZ4t0fDVugGEv9DS6htiyx4GnbWSylAUhCYTb1xsCDOhnHF3aF5MxZR2SMgwUxan6PPJzTppXolE/VHc7oxoxFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397312; c=relaxed/simple;
	bh=eoi5LEcN5iz9C1ccIdSTVkQgfItbjvHxoVn+HQpxCjs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Cxsg12PwsnaAuU9R255e6QHQRe//NKeI/6zlXfU9NwOKI89Oy3BJXiDpOhsA0AJbaLjiNbNAserbfgG/UIrPCJ2Xou3T/tLJaXeY+avJIcyFcJhGx15VYAxCODA/xkchIBzHN7Uzq5naB6X2TX6Fo2xm3bQstA0FvlC1yGxGFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLHfdnm+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLHfdnm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597851F000C4;
	Mon, 19 Oct 2026 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792397310;
	bh=L8rK/1NtqDlWJcJglHCwjkVpPEJUJLr26ph69qg3Qm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OLHfdnm+jcOt5qRc8zWyP6nhBvzhB9PSL1Ek8QR3KBvkD/Znsk2q8OZVOX0wIGZ7U
	 s9/21WDCrwHXFItjdNAUqPHrDh8PzBDnnzSHi+3rw6A7Ixvqa/MNlm8jOpkY8fSzlk
	 NskNYpdc9/YaMxhYmjxsyvzITP+8Q3dFG+vsa+Lu2kz5P1H9msQEVHT6LjZucyR4cX
	 O4jCnRFfRyIDwfO9bun3pNJeOBoWcU/T0VG1vxsZFEVe45jfX54Hwa9mhlKCp2K477
	 roMcUoeb7nquKMfdEg8XAaD629EYDKjJSFoyPy15hXqlYzA1ART8ezeThZCeXm3jQJ
	 BfGGdLN/ENOmg==
Message-ID: <sashiko-outbox-176776@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xincheng Ji" <jixincheng@ultrarisc.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-ultrarisc-dts-v4-7-3979747cda2e@ultrarisc.com>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
 <20261019-ultrarisc-dts-v4-7-3979747cda2e@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 08:08:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] riscv: dts: ultrarisc: deprecated LED label overrides color and =
function
--

commit b602c792a6efba56c2935012c89e05f8d6efaf40
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add Milk-V Titan board device tree

This commit adds the device tree and pinctrl definitions for the Milk-V
Titan ITX motherboard based on the UltraRISC DP1000 SoC.

Link: https://milkv.io/docs/titan/overview

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/=
riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> new file mode 100644
> index 0000000000000..59edd8157221a
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> @@ -0,0 +1,203 @@

[ ... ]

> +&ethernet {
> +	phy-handle =3D <&phy0>;
> +	/*
> +	 * The PCB does not add RGMII TX or RX clock delays. The DP1000
> +	 * integration adds fixed delays in both directions.
> +	 */
> +	phy-mode =3D "rgmii-id";
> +
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy0: phy@0 {
> +			reg =3D <0>;
> +
> +			leds {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				led@1 {
> +					label =3D "eth-link";
> +					reg =3D <1>;
> +					color =3D <LED_COLOR_ID_YELLOW>;
> +					function =3D LED_FUNCTION_INDICATOR;
> +					default-state =3D "keep";
> +					linux,default-trigger =3D "netdev";
> +				};
> +
> +				led@2 {
> +					label =3D "eth-activity";
> +					reg =3D <2>;
> +					color =3D <LED_COLOR_ID_GREEN>;
> +					function =3D LED_FUNCTION_ACTIVITY;
> +					default-state =3D "keep";
> +					linux,default-trigger =3D "netdev";
> +				};
> +			};
> +		};
> +	};
> +};

[Severity: Medium]
Should the label properties be dropped from led@1 and led@2 here?

When the PHY driver probes phy0, the call chain:

  of_phy_leds() ->
    of_phy_led() ->
      devm_led_classdev_register_ext() ->
        led_classdev_register_ext() ->
          led_compose_name() ->
            led_parse_fwnode_props()

checks for the deprecated label property first in
drivers/leds/led-core.c:led_parse_fwnode_props():

	if (fwnode_property_present(fwnode, "label")) {
		ret =3D fwnode_property_read_string(fwnode, "label", &props->label);
		if (ret)
			dev_err(dev, "Error parsing 'label' property (%d)\n", ret);
		return;
	}

Because led_parse_fwnode_props() returns early when label is present, the
color and function properties on led@1 and led@2 are never parsed and are
completely ignored at runtime.

In addition, Documentation/devicetree/bindings/leds/common.yaml deprecates
label for new bindings in favor of color and function.

Would it make sense to remove label from both nodes so that the LED core
uses color and function to compose the standard LED names?

=E5=AE=8C=E7=BE=8E!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-ultrarisc-=
dts-v4-0-3979747cda2e@ultrarisc.com?part=3D7
