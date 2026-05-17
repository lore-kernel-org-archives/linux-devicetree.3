Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34FB248893
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779025591; cv=none; b=sZcGTuVv+2a0xforGI6Bc8gP268Gqwl6IHYPwrezcO6QyrWcJ6dX8giiJIaL+SCQSwqLjCa5AepfKQP5QYI4ghAA2IHyPbwzU/QU08XZxWqBVWgCMbZ2fQ4SNyKmOTjpzhAAveoEt/YJKtDszGgyykSn2eBOaZOkhJyrv6qAP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779025591; c=relaxed/simple;
	bh=Mes1xx7FwvIHbFkHH2IXV3c19Dbw2xUwI0IjC1B3Rx8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MvEbFMVXW+rhJf7zUK1O0kR9QCfVKzEM5HpRNaZalq2AqdgORviQywX70D08RgSj/EC3WMtfA7mbHoaAXaBgzlsThGZNosAjE55MC77rAdRlw80mHp2n5AIUs1YrJmBt6Dacs8pexP7+RDktp+vPk7lL2wTC1Ori/tHHKTcYcbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQFeSA8K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQFeSA8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961CDC2BCB0;
	Sun, 17 May 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779025590;
	bh=Mes1xx7FwvIHbFkHH2IXV3c19Dbw2xUwI0IjC1B3Rx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gQFeSA8K9W4Loe+FV89UIcNnQy4oRUHs5Jskr7esh8luNIvmGSdAPUvpa/jmlCy/X
	 vQTmOfuzP9ksWRmzl0JVyY2YAAGpEghKBA4HuatzCUb9oRHThecnHGKXjkooCg39Gc
	 1YzbvZRlLUId87yaE6Bs/3eZoJGF3E1DI68btV+liUqPc5um+0JyITpX8JV//mPPnm
	 aRhKARyPV9f6HpwbWuh/Ff3BT7CmDLu2ZSBf2PmF5eJGOF9ryQeOmqa3aMmt/DATVU
	 cAxwuzyQjk+b8tbViLxTKfalmVy03XLlHYjXtCqfBYqFhsz3Zpl1NXk2kKX8ZIzZnM
	 a6GIId9ozEhPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add basic devicetree for
 Ayaneo Pocket DS gaming console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260517-pocketds-v3-3-d5910c801756@gmail.com>
References: <20260517-pocketds-v3-3-d5910c801756@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 13:46:29 +0000
Message-Id: <20260517134630.961CDC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Unresolved references to non-existent nodes `&panel0_in` and `=
&panel1_in`.
- [High] DisplayPort is not correctly routed to the USB-C connector.
- [High] Missing PCI bridge properties in `pcie@0` root port node.
- [High] Missing `pinctrl-1` sleep state for the `pwm-fan`.
- [High] Thermal zones omit `cooling-maps` to bind the PWM fan and use inco=
rrect trip types.
- [Medium] Empty `panel@0` node lacks a `compatible` string.
- [Low] Undocumented custom DT property `rocknix-u-boot-dt-id`.
--

commit d78e5e056b91e897429aec4c3dcd17b82685dc92
Author: Teguh Sobirin <teguh@sobir.in>

arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

Add initial Device Tree for the Ayaneo Pocket DS gaming console based
on the Qualcomm QCS8550 platform.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/=
arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> new file mode 100644
> index 0000000000000..416399a4179b4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> @@ -0,0 +1,1883 @@
> +// SPDX-License-Identifier: BSD-3-Clause

[ ... ]

> +/ {
> +	model =3D "AYANEO Pocket DS";
> +	compatible =3D "ayaneo,pocketds", "qcom,qcs8550", "qcom,sm8550";
> +	rocknix-u-boot-dt-id =3D "u-boot-pocket-ds";

This isn't a bug, but is this a documented standard property?
Using custom properties may trigger dtbs_check warnings.

> +
> +	aliases {

[ ... ]

> +	pmic-glink {
> +		compatible =3D "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		orientation-gpios =3D <&tlmm 11 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible =3D "usb-c-connector";
> +
> +			reg =3D <0>;
> +
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint =3D <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint =3D <&redriver_ss_out>;
> +					};
> +				};
> +			};

The commit message mentions "DisplayPort is muxed over the USB-C connector".
Is the graph topology missing the DP Alt Mode port (port@2) for the
usb-c-connector?

> +		};
> +	};
> +
> +	pwm_fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +
> +		pinctrl-0 =3D <&fan_pwm_active>, <&fan_int>;
> +		pinctrl-names =3D "default", "sleep";

Does this missing pinctrl-1 property cause the pinctrl core to fail when
transitioning to sleep state?

> +
> +		fan-supply =3D <&vdd_fan_5v0>;

[ ... ]

> +&cpu7_top_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		cpu7_top_fan0: trip-point2 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};

Should active cooling devices like fans use type =3D "active" instead of
"passive"?

Also, are cooling-maps subnodes needed to bind these trip points to the
pwm_fan cooling device? Without them, the thermal framework might not
automatically engage the fan.

> +
> +		cpu7_top_fan1: trip-point3 {

[ ... ]

> +&mdss_dp0_out {
> +	remote-endpoint =3D <&panel0_in>;
> +
> +	data-lanes =3D <0 1 2 3>;
> +};

Are these endpoints defined anywhere? The commit message mentions display
panel support is deferred, but compiling this might result in a reference
to a non-existent node.

Also, should DisplayPort be routed to the USB QMP PHY's DisplayPort input
instead of a standalone panel, given it is muxed over the USB-C connector?

> +
> +&mdss_dsi0 {
> +	vdda-supply =3D <&vreg_l3e_1p2>;
> +
> +	status =3D "okay";
> +
> +	display_panel: panel@0 {
> +		reg =3D <0>;
> +
> +		pinctrl-0 =3D <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 =3D <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names =3D "default", "sleep";
> +	};

Since display panel support is deferred, should this node be removed for no=
w,
or at least include a compatible string to prevent dtbs_check errors?

> +};
> +
> +&mdss_dsi0_phy {

[ ... ]

> +&mdss_dsi1_out {
> +	remote-endpoint =3D <&panel1_in>;
> +	data-lanes =3D <0 1 2 3>;
> +};

Will this also cause a compilation failure due to referencing a non-existent
node, as panel support is deferred?

> +
> +&mdss_dsi1_phy {

[ ... ]

> +&pcie1 {
> +	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 =3D <&pcie1_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +
> +	pcie@0 {
> +		/* Renesas =CE=BCPD720201 PCIe USB3.0 HOST CONTROLLER */
> +		usb-controller@0 {
> +			compatible =3D "pci1912,0014";
> +			reg =3D <0x10000 0x0 0x0 0x0 0x0>;

Does the pcie@0 bridge node need #address-cells =3D <3>, #size-cells =3D <2=
>, and
a reg property so the child's reg can be properly parsed by the PCI subsyst=
em?

> +
> +			avdd33-supply =3D <&upd720201_avdd33_reg>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-pocketds-v=
3-0-d5910c801756@gmail.com?part=3D3
