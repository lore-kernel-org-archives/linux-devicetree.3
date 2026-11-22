Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374845;
	b=TDaRjJg7Y+pqXWs5LHqg7Gi1bxEHVxBSeZM9SwXt6LdGKmkJ0IyDOOrBfRBt/qku7A4L
	 EgHw+itUFioUthgrDIJEXo962zOT1C4oeuaFpqCmLBQmC+Ars5ostdhM9tsJKYXjZyYnL
	 Op7RVPiwDmhrTm8r/cZwtuYMzSzc+46HtRZql+pGsj2D0OBjLLnN9vA91Ety+1U6gF/2i
	 jh66Dyq0fQ+gSBTJXDUQ2EyXLsPeYjK/NO7rnCQFbm8QgfTg8eVIj4bM/uXb8Yz/ofyCr
	 MlMyay32NSdJMdzu3uaxSWeViMBVe7S1Af4CsssevJOYyjkp+6vjgYYdh+HtPH8HqOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374845;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oJCpNKT9GyWep7EMIWYZZI0sBMK9lKyIiBv4x0ocW74=;
	b=3Qhl2Zm0QGSlg98kw/OcbHBklXFQHTUvapq0PTrz4NCL5KhPrf9O/bCGhMhoVjC7jChO
	 18uvdx4LSGiTv/gK+J2R6BuJNMV8Z8Onlo6844zDkbABo+0kMZ7m6WfsiwKcLieXAw/jM
	 3Q/3xwTDQcH3tvBk/tv50+YcCZAT+GoZcwq7M7B1ZDqXu8LXUwPtCH5V7/RBQuhazEEuS
	 3MkTGVEPNP7Syc9loaWRFKT/Om7wcyj2Knj1dLjahxxfM6YDmBhZQnpf8BZTPxejZY7Ie
	 O2Kutpe+uAio1l5kiE7lNyccfqK4iOmtUxYcMy/lyZb7AhN7KIubSCTAc1aE5T1HOSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdltQdb3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0073606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdltQdb3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8831F000CA;
	Sun, 22 Nov 2026 19:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374844;
	bh=oJCpNKT9GyWep7EMIWYZZI0sBMK9lKyIiBv4x0ocW74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HdltQdb3eTdUg7U2Rwf/MEdzWapd0bq1shcLNvEx6hqatG7a0oGJZINap2Kmnk9TD
	 2jY68i1u0Cq3HskEFW8xQpReYNhU03232owj9kXCa5gFslqhID1ZYSDV37QGWg882a
	 DpInN8FiOlhPafot4AjpFFjlHxqwYoQVVciN20wyTtLY8e1tpHLmO8BDCsZz15hKNM
	 CkW5EtR3kvPMe/I7xs8eL1wreym05mfSomhsJpmMIdjiSw9C1/5qrgXZ1GMUx+7Q1e
	 BOYFOaahEeh2zWbzXfUiuXVHRO8DdXbXdwooxzrAiQmV+OfTWGUwb9WQlQkJCYPWfe
	 DOBZMbXbs9V9A==
Message-ID: <sashiko-outbox-228235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxim Storetvedt" <mstoretv@cern.ch>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122184337.6551-4-mstoretv@cern.ch>
References: <20261122184337.6551-1-mstoretv@cern.ch>
 <20261122184337.6551-4-mstoretv@cern.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 19:14:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential
issues to consider:
- [High] arm64: dts: qcom: swapped vdda-phy and vdda-pll supplies on USB
  QMP PHYs
- [High] arm64: dts: qcom: missing required QREF and refgen supplies on
  tcsr node
- [Medium] arm64: dts: qcom: missing required input regulator supplies
  on wcn7850-pmu
- [Medium] arm64: dts: qcom: perst-gpios and wake-gpios placed on pcie4
  host bridge
- [Medium] arm64: dts: qcom: conflicting bias and invalid input-enable
  on edp0_hpd
- [Medium] arm64: dts: qcom: regulator-always-on on eDP supplies blocks
  power cycle
- [Medium] arm64: dts: qcom: missing dp2 link-frequencies and 2-lane cap
  on dp0/dp1
- [Low] arm64: dts: qcom: unreferenced eusb5_repeater node on i2c5
- [Low] arm64: dts: qcom: undocumented panel compatibles in Galaxy Book4
  Edge DTS
- [Low] arm64: dts: qcom: duplicate USB overrides, unused nodes, and
  unsorted Makefile
--

commit d8fc3a638460db0faa7ace6cf5fae6502026e75f
Author: Maxim Storetvedt <mstoretv@cern.ch>

arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees

This commit adds a shared devicetree include and board devicetrees for the
14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.

> diff --git a/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi b=
/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
> new file mode 100644
> index 0000000000000..450b9086fbbe7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
[ ... ]
> +	vreg_octa_vdd: regulator-octa-vdd {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_OCTA_VDD";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +
> +		gpio =3D <&tlmm 111 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&octa_vdd_en>;
> +		pinctrl-names =3D "default";
> +
> +		startup-delay-us =3D <1000>;
> +		regulator-enable-ramp-delay =3D <1000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_display_vdd: regulator-display-vdd {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_DISPLAY_VDD";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 120 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&display_vdd_en>;
> +		pinctrl-names =3D "default";
> +
> +		startup-delay-us =3D <400000>;
> +		regulator-enable-ramp-delay =3D <400000>;
> +
> +		vin-supply =3D <&vreg_octa_vdd>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_EDP_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 70 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 =3D <&edp_reg_en>;
> +		pinctrl-names =3D "default";
> +
> +		startup-delay-us =3D <1000>;
> +		regulator-enable-ramp-delay =3D <1000>;
> +
> +		vin-supply =3D <&vreg_display_vdd>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

[Severity: Medium]
Does setting regulator-always-on on vreg_edp_3p3, vreg_display_vdd, and
vreg_octa_vdd prevent the eDP panel from power-cycling across blank or
suspend?

Both board files bind &panel to the samsung,atna33xc20 driver with
power-supply =3D <&vreg_edp_3p3>.  When atana33xc20_disable() drops
enable-gpios (EL_ON3), the panel hardware requires a full power cycle via
regulator_disable() in atana33xc20_unprepare() -> atana33xc20_suspend()
before the next enable, or the backlight does not turn back on.  With
regulator-always-on set on this supply chain, _regulator_disable() skips
disabling the GPIO regulators.

[ ... ]

> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_WCN_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 214 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&wcn_sw_en>;
> +		pinctrl-names =3D "default";
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
[ ... ]
> +	wcn7850-pmu {
> +		compatible =3D "qcom,wcn7850-pmu";
> +
> +		wlan-enable-gpios =3D <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios =3D <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 =3D <&wcn_wlan_bt_en>;
> +		pinctrl-names =3D "default";

[Severity: Medium]
Are the required input supplies missing on wcn7850-pmu?

The qcom,wcn7850-pmu binding requires vdd-supply, vddio-supply,
vddaon-supply, vdddig-supply, vddrfa1p2-supply, and vddrfa1p8-supply.
Without them, dtbs_check fails, vreg_wcn_3p3 is left unreferenced, and
pwrseq_qcom_wcn_probe() falls back to dummy regulators instead of managing
the WCN7850 input rails.

[ ... ]

> +&i2c5 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	eusb5_repeater: redriver@43 {
> +		compatible =3D "nxp,ptn3222";
> +		reg =3D <0x43>;
> +		#phy-cells =3D <0>;
> +
> +		vdd3v3-supply =3D <&vreg_l13b_3p0>;
> +		vdd1v8-supply =3D <&vreg_l4b_1p8>;
> +
> +		reset-gpios =3D <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 =3D <&eusb5_reset_n>;
> +		pinctrl-names =3D "default";
> +	};
> +};

[Severity: Low]
Is eusb5_repeater (along with eusb5_reset_n) intentionally left without a
consumer?  No USB HS PHY references <&eusb5_repeater> in this dtsi or
either board file, and on the 14-inch model i2c5 is enabled solely for
this unreferenced repeater node.

[ ... ]

> +&mdss_dp0 {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes =3D <0 1>;
> +	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810000=
0000>;
> +};
> +
> +&mdss_dp1 {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp1_out {
> +	data-lanes =3D <0 1>;
> +	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810000=
0000>;
> +};
> +
> +&mdss_dp2 {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp2_out {
> +	data-lanes =3D <0 1 2 3>;
> +};

[Severity: Medium]
Should mdss_dp2_out specify link-frequencies, and should mdss_dp0_out and
mdss_dp1_out keep the 4 data-lanes from hamoa.dtsi?

Without link-frequencies on mdss_dp2_out, msm_dp_link_parse_dt() falls
back to DP_LINK_RATE_HBR2 (5.4 Gbps) instead of HBR3 (8.1 Gbps) on the
link feeding the RTD2171 HDMI bridge (and data-lanes =3D <0 1 2 3> is
already set in hamoa.dtsi).  Conversely, overriding data-lanes to <0 1> on
mdss_dp0_out and mdss_dp1_out caps max_dp_lanes to 2 in
msm_dp_link_parse_dt(), preventing 4-lane DisplayPort Altmode on both
USB-C ports.

[ ... ]

> +&pcie4 {
> +	perst-gpios =3D <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 =3D <&pcie4_default>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply =3D <&vreg_l3i_0p8>;
> +	vdda-pll-supply =3D <&vreg_l3e_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie4_port0 {
> +	wifi@0 {

[Severity: Medium]
Should perst-gpios and wake-gpios on &pcie4 be moved to &pcie4_port0 as
reset-gpios and wake-gpios?

Because hamoa.dtsi defines the pcie4_port0 Root Port child node, keeping
perst-gpios on the host bridge triggers a boot warning in
qcom_pcie_parse_perst() ("Reusing PERST# from Root Complex node. DT needs
to be fixed!"), and pci_configure_of_wake_gpio() looks up wake-gpios on
the Root Port node (&pcie4_port0) rather than &pcie4.

[ ... ]

> +&swr2 {
> +	status =3D "okay";
> +
> +	/* WCD9385 TX */
> +	wcd_tx: codec@0,3 {
> +		compatible =3D "sdw20217010d00";
> +		reg =3D <0 3>;
> +		qcom,tx-port-mapping =3D <2 2 3 4>;
> +	};
> +};
> +
> +&tlmm {

[Severity: High]
Is the &tcsr override missing its required QREF and refgen regulator
supplies?

Per qcom,x1e80100-tcsr.yaml and commit d9d07e230c45 ("arm64: dts: qcom:
hamoa/purwa: Add QREF regulator supplies"), &tcsr requires all 18
vdda-qref* and vdda-refgen* supply properties.  Without them, dtbs_check
reports 18 missing required properties, qcom_clk_ref_register() falls back
to dummy regulators, and QREF LDOs with no other consumer (such as
vreg_l1d_0p8 powering repeater/receiver 4 for TCSR_USB4_1_CLKREF_EN on
usb_1_ss1_qmpphy, and vreg_l3c_0p8 on the 14-inch SKU) are never enabled
and get turned off as unused at late init.

[ ... ]

> +	edp0_hpd_default: edp0-hpd-default-state {
> +		pins =3D "gpio119";
> +		function =3D "edp0_hot";
> +		bias-pull-down;
> +		input-enable;
> +		drive-strength =3D <2>;
> +	};

[Severity: Medium]
As reported by Antheas Kapenekakis on v8 [1], redefining edp0_hpd_default
here merges bias-pull-down with the bias-disable property already defined
in hamoa.dtsi, leaving both mutually exclusive bias properties in the
compiled DTB, and adds input-enable which is disallowed by
qcom,tlmm-common.yaml.  Can this override in &tlmm be dropped so &mdss_dp3
uses the edp0_hpd_default definition from hamoa.dtsi directly?

[ ... ]

> +&usb_1_ss0 {
> +	status =3D "okay";
> +};
> +
> +&usb_1_ss0_hsphy {
> +	vdd-supply =3D <&vreg_l3j_0p8>;
> +	vdda12-supply =3D <&vreg_l2j_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l1j_0p8>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_ss0 {
> +	dr_mode =3D "host";
> +};
> +
> +&usb_1_ss0_dwc3_hs {
> +	remote-endpoint =3D <&pmic_glink_ss0_hs_in>;
> +};
> +
> +&usb_1_ss0_qmpphy_out {
> +	remote-endpoint =3D <&pmic_glink_ss0_ss_in>;
> +};
> +
> +&usb_1_ss1 {
> +	status =3D "okay";
> +};
> +
> +&usb_1_ss1_hsphy {
> +	vdd-supply =3D <&vreg_l3j_0p8>;
> +	vdda12-supply =3D <&vreg_l2j_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l2d_0p9>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_ss1 {
> +	dr_mode =3D "host";
> +};
> +
> +&usb_1_ss1_dwc3_hs {
> +	remote-endpoint =3D <&pmic_glink_ss1_hs_in>;
> +};
> +
> +&usb_1_ss1_qmpphy_out {
> +	remote-endpoint =3D <&pmic_glink_ss1_ss_in>;
> +};
> +
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l2d_0p9>;

[Severity: High]
Are vdda-phy-supply and vdda-pll-supply swapped on usb_1_ss0_qmpphy,
usb_1_ss1_qmpphy, and usb_1_ss2_qmpphy (as well as usb_mp_qmpphy0 in
x1e84100-samsung-galaxy-book4-edge-16.dts)?

On Hamoa QMP PHYs (compare mdss_dp3_phy, pcie4_phy, ufs_mem_phy, and
commit 4458dcd38295 ("arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY
vdda-phy/vdda-pll supplies")), vdda-phy-supply is the ~0.88V/0.9V rail
(vreg_l1j_0p8, vreg_l2d_0p9, or vreg_l3c_0p8) and vdda-pll-supply is the
1.2V rail (vreg_l2j_1p2 or vreg_l3e_1p2).  The QMP PHY drivers apply
different load votes to each rail (21800 uA on vdda-phy vs 36000 uA on
vdda-pll), so swapping them sets the wrong load constraints on the backing
LDOs.

[Severity: Low]
This isn't a bug, but &usb_1_ss0 and &usb_1_ss1 are each opened twice
here instead of combining status =3D "okay" and dr_mode =3D "host" into a
single override block per node.  Also, in this .dtsi, /dts-v1/; and the
root model/compatible properties are redundant with the top-level .dts
files, &camcc status =3D "okay" is redundant with hamoa.dtsi, and the new
DTB entries in arch/arm64/boot/dts/qcom/Makefile are appended after the
x1p* targets instead of in alphabetical order after x1e80100-qcp.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-=
14.dts b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
> new file mode 100644
> index 0000000000000..333a69a8a459b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
[ ... ]
> +&panel {
> +	compatible =3D "samsung,atna40cu07", "samsung,atna33xc20";
> +};

[Severity: Low]
Are the panel compatible strings samsung,atna40cu07 (here) and
samsung,atna60cl07 (in x1e84100-samsung-galaxy-book4-edge-16.dts)
documented in Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml?
Without binding entries for them, dtbs_check fails schema validation on
both targets.

[1] https://lore.kernel.org/r/CAGwozwEgiynMJ=3DDBcuyLR+1CdDuW=3DaV1td9Cx-k8=
=3D4SDn159nw@mail.gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122184337.6551=
-1-mstoretv@cern.ch?part=3D3
