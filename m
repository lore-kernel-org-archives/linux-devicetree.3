Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419201;
	b=JeihauOJZP49jCO8u89PESgYaha+b1eNzxR677PYCEEWrJ3hEXohkBEnBBDUFO0i30LA
	 mBCB5zOXt+zUqVfuHQoyRhgFrgWR9e2LZ4xm9x/p4wPkmBOS/xDBJzwBJLcZ4TpjesvBM
	 qiDPNIRWG/EYG0CX6QGNwzOoFNzNmjlnotEzslzEbr0u4xwSmnARGPgn9X7HfNh5ry/X1
	 yyLh7YfUK/bHztUUEgepm4ysSmWkTEwMRy+gFP0toLMPu3KK2qUvMIeofIWh9zA4MtEZ9
	 uM/4F+nco/CS6Xr2eGORGOLijFTJWaePBeLemiILG7Rp+sdt9XIbSA5D0RbU2qJk4ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/zDRrtRYzSl8MEHv93CCWehj+SoAFGvhXcnUZTFFX1k=;
	b=Vwzbh2FJfrc0KHHiSizSYh/c0nRm7fZblSHdWkigs6UlDSRQpWQSO5sV0eXLqK0lwDeJ
	 al0/BtH0OVDsmHGvnwQulp1iNx0rZMryUJqfQqlocTxvI4MhwxrVd90cuuwG6iVYuNvK5
	 NnFGrnEH+mj0woVH6lQsMXILZ5EqaUDHAvPQAIXcG555QSrFARg3HswF5mUrkSO2rz7VD
	 DGUHVsvtUg6kS7S337UENK0vu86UqdOUQOihfIwkgEA/bzqJJEtmrZ5I84orWjsM7Cfay
	 1It2g/xeo2NBf0vnXjNnUEzRIuq7mEEyNOenDZjDc3PNcgnGiwYZS5Jlln+9e/5uSbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGGCROo4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4058F606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGGCROo4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2B81F000C1;
	Sat, 31 Oct 2026 04:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793419201;
	bh=/zDRrtRYzSl8MEHv93CCWehj+SoAFGvhXcnUZTFFX1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGGCROo4vNqyjW2mmAoJ6ltrkWjQM7mWUj5F99GYdN/rW1B6uY+JTrDBTFDliJK1+
	 tc/XpHg2BmJFwgJG2i3dAYx17lb/cA1/jk8SmPnIqXcdGL8b9ntLX51nDqO2B+MA6l
	 5uldczq8OngcgZ07NPVlzR7O5ngnNE0oxjEFnC9yDhjXCtTW08GuKdOeG+UlQcfrAS
	 BBo+6cFa02VPcRzVi+dFBrZJJKbz7/x9iicOePiOerCNod/HLR6vnfP4GjrMRjI+Wr
	 H8rmuZg89zRvJmw53hawENYoJt6x1xdK+VQ2bjWAScX0TdVyGowqSYxPyy/2SZSE7+
	 i6uoLvwaUhgPw==
Message-ID: <sashiko-outbox-191739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750-lenovo-elden: describe
 the WL2868C regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261031034300.272730-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031034300.272730-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 04:00:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: sm8750-lenovo-elden enables i2c10 with qupv3_2 d=
isabled
- [Medium] arm64: dts: qcom: undocumented camera compatibles and incomplete=
 sensor nodes
- [Low] arm64: dts: qcom: sm8750.dtsi CCI bus 1 disablement, missing pinctr=
l, and order
- [Low] arm64: dts: qcom: binding schema, SoC dtsi, and board dts mixed in =
one patch
--

commit 10e91e61ae688a3f035a983ab75359c04de72cc1
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators

This commit adds the device tree for the Lenovo Legion Y700 Gen4 (TB322FC)
tablet, describing the board clocks, WL2868C camera PMIC regulators on
i2c10, and camera sensor and lens nodes on the CCI buses, along with the
SM8750 CCI controller nodes and board compatible string.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862d..41d5e65c4eea5 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1168,6 +1168,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - lenovo,elden
>                - qcom,sm8750-mtp
>                - qcom,sm8750-qrd
>            - const: qcom,sm8750

[Severity: Low]
This isn't a bug, but per Documentation/devicetree/bindings/submitting-patc=
hes.rst,
should the Documentation/devicetree/bindings/arm/qcom.yaml binding change,
the arch/arm64/boot/dts/qcom/sm8750.dtsi SoC additions, and the new
arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts board file be split into
separate patches?

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 0000000000000..7bbc1986a87e6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> @@ -0,0 +1,202 @@

[ ... ]

> +&cci0_i2c0 {
> +	clock-frequency =3D <400000>;
> +
> +	rear_lens: lens@c {
> +		compatible =3D "giantec,gt9764";
> +		reg =3D <0x0c>;
> +		vddio-supply =3D <&camera_ldo7>;
> +		vdd-supply =3D <&camera_ldo5>;
> +		giantec,aac-mode =3D <0x40>;
> +		giantec,aac-timing =3D <0x7c>;
> +		settling-time-us =3D <7000>;
> +	};
> +
> +	rear_camera: camera@56 {
> +		compatible =3D "samsung,s5kjns";
> +		reg =3D <0x56>;
> +		clocks =3D <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
> +		assigned-clocks =3D <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +		power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +		reset-gpios =3D <&tlmm 11 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&rear_camera_default>;
> +		dovdd-supply =3D <&camera_ldo7>;
> +		dvdd-supply =3D <&camera_ldo1>;
> +		avdd-supply =3D <&camera_ldo4>;
> +		lens-focus =3D <&rear_lens>;
> +		orientation =3D <1>;
> +		rotation =3D <90>;
> +	};
> +};
> +
> +&cci1 {
> +	status =3D "okay";
> +};
> +
> +&cci1_i2c0 {
> +	clock-frequency =3D <400000>;
> +
> +	front_camera: camera@31 {
> +		compatible =3D "galaxycore,gc08a8";
> +		reg =3D <0x31>;
> +		clocks =3D <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +		power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +		reset-gpios =3D <&tlmm 7 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&front_camera_default>;
> +		dovdd-supply =3D <&camera_ldo7>;
> +		dvdd-supply =3D <&camera_ldo2>;
> +		avdd-supply =3D <&camera_ldo3>;
> +		orientation =3D <0>;
> +		rotation =3D <270>;
> +	};
> +};

[Severity: Medium]
Will these camera and lens nodes pass dtbs_check?

In sm8750-lenovo-elden.dts, rear_lens (lens@c) uses compatible =3D
"giantec,gt9764" with vddio-supply, giantec,aac-mode, giantec,aac-timing, a=
nd
settling-time-us, rear_camera (camera@56) uses compatible =3D "samsung,s5kj=
ns",
and front_camera (camera@31) uses compatible =3D "galaxycore,gc08a8". None =
of
these compatible strings or vendor properties are documented under
Documentation/devicetree/bindings/, and no in-tree driver currently binds to
them to consume the WL2868C regulator supplies.

In addition, both camera@56 and camera@31 omit the required CSI port endpoi=
nt
nodes and attach the SoC internal power-domains =3D <&camcc
CAM_CC_TITAN_TOP_GDSC> to external I2C camera sensors. Should these nodes be
deferred until their DT bindings and CSI endpoints are documented?

> +
> +&i2c10 {
> +	status =3D "okay";
> +
> +	pmic@2f {
> +		compatible =3D "willsemi,wl2868c";
> +		reg =3D <0x2f>;

[Severity: High]
Can i2c10 and pmic@2f ever probe on this board when qupv3_2 and gpi_dma2 are
still disabled?

In arch/arm64/boot/dts/qcom/sm8750.dtsi, i2c10 (i2c@888000) is a child of
qupv3_2 (geniqup@8c0000) and uses DMA channels from gpi_dma2
(dma-controller@800000), both of which default to status =3D "disabled":

arch/arm64/boot/dts/qcom/sm8750.dtsi:
		gpi_dma2: dma-controller@800000 {
			compatible =3D "qcom,sm8750-gpi-dma", "qcom,sm6350-gpi-dma";
			...
			status =3D "disabled";
		};

		qupv3_2: geniqup@8c0000 {
			compatible =3D "qcom,geni-se-qup";
			...
			status =3D "disabled";
			...
			i2c10: i2c@888000 {
				...
				dmas =3D <&gpi_dma2 0 2 QCOM_GPI_I2C>,
				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
				dma-names =3D "tx", "rx";
				status =3D "disabled";
			};
		};

Child serial engines under a qcom,geni-se-qup node are only populated when
geni_se_probe() in drivers/soc/qcom/qcom-geni-se.c binds to an enabled
geniqup parent device, sets the wrapper drvdata, and calls
devm_of_platform_populate(dev):

drivers/soc/qcom/qcom-geni-se.c:geni_se_probe() {
	...
	dev_set_drvdata(dev, wrapper);
	dev_dbg(dev, "GENI SE Driver probed\n");
	return devm_of_platform_populate(dev);
}

Furthermore, geni_i2c_probe() -> setup_gpi_dma() in
drivers/i2c/busses/i2c-qcom-geni.c requires the parent wrapper drvdata and
gpi_dma2 channels when operating in GPI DMA mode. Because
sm8750-lenovo-elden.dts enables &i2c10 without enabling &qupv3_2 or
&gpi_dma2, qupv3_2 is skipped during device population, i2c10 is never
instantiated, and wl2868c_probe() never runs to register camera_ldo1 through
camera_ldo7. Should &qupv3_2 and &gpi_dma2 also be enabled in
sm8750-lenovo-elden.dts?

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index dd738d13df8e0..60b8f2fb5a350 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3512,6 +3512,72 @@ camcc: clock-controller@ade0000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		cci0: cci@ac7b000 {
> +			compatible =3D "qcom,sm8750-cci", "qcom,msm8996-cci";
> +			reg =3D <0x0 0x0ac7b000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names =3D "ahb", "cci";
> +			assigned-clocks =3D <&camcc CAM_CC_CCI_0_CLK>;
> +			assigned-clock-rates =3D <37500000>;
> +			pinctrl-0 =3D <&cci0_0_default>;
> +			pinctrl-1 =3D <&cci0_0_sleep>;
> +			pinctrl-names =3D "default", "sleep";
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg =3D <0>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				status =3D "disabled";
> +				reg =3D <1>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac7c000 {
> +			compatible =3D "qcom,sm8750-cci", "qcom,msm8996-cci";
> +			reg =3D <0x0 0x0ac7c000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names =3D "ahb", "cci";
> +			assigned-clocks =3D <&camcc CAM_CC_CCI_1_CLK>;
> +			assigned-clock-rates =3D <37500000>;
> +			pinctrl-0 =3D <&cci1_0_default>;
> +			pinctrl-1 =3D <&cci1_0_sleep>;
> +			pinctrl-names =3D "default", "sleep";
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg =3D <0>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				status =3D "disabled";
> +				reg =3D <1>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};

[ ... ]

> @@ -4090,6 +4156,52 @@ qup_uart15_default: qup-uart15-default-state {
>  				bias-pull-up;
>  			};
> =20
> +			cci0_0_default: cci0-0-default-state {
> +				sda-pins {
> +					pins =3D "gpio113";
> +					function =3D "cci_i2c_sda";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};

[Severity: Low]
Is there a reason cci0_i2c1 and cci1_i2c1 are marked status =3D "disabled" =
in
sm8750.dtsi while cci0_i2c0 and cci1_i2c0 are left enabled, and bus 1 pinct=
rl
states (cci0_1 on gpio115/gpio116 and cci1_1 on gpio119/gpio120 in
drivers/pinctrl/qcom/pinctrl-sm8750.c) are omitted?

In drivers/i2c/busses/i2c-qcom-cci.c, cci_probe() iterates over child buses
with for_each_available_child_of_node_scoped(dev->of_node, child), and other
Qualcomm SoC dtsi files (such as sm8550.dtsi and sm8650.dtsi) leave both
i2c-bus@0 and i2c-bus@1 available with both bus pinctrl states defined while
the parent cci node is disabled. In addition, SM8750 has a third CCI
controller (CAM_CC_CCI_2_CLK in drivers/clk/qcom/camcc-sm8750.c and cci2 pi=
ns
in drivers/pinctrl/qcom/pinctrl-sm8750.c), whereas the commit message states
that the SoC has two CCI I2C controllers.

Also, in sm8750.dtsi, should cci0@ac7b000 and cci1@ac7c000 be placed in
unit-address order after videocc@aaf0000 rather than after mdss@ae00000,
dispcc@af00000, and camcc@ade0000, and should the cci0_0 and cci1_0 pinctrl
nodes in &tlmm be placed alphabetically before hub_i2c0_data_clk rather than
after qup_uart15_default?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031034300.2727=
30-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3
