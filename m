Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705299;
	b=nFjJyE0Ch9R6MlISAP1Naoqht8m9P23zDv0Ad1FrhmbE8mz/wLdCcb6Wp8rpUvMSjitI
	 ksmRRugaUQ/3fgxKA/HAkKFUWTQD6qxD9NOhigb5oDMTLDF5hZcIFofj+X0AeW+vEKg3A
	 wb+DCk+DH5T8OqnYCCOuEXEoTFFN1wlNpGJ5Ey/MRDI9XZkULn76ZhzkqGF/0FIZMxTZ1
	 h9RGAfLvJ+AItriClRYL0AanajSeHgNseh77j1W2QrX7Qxro96SzfaXiWsD0iUQGKGdzU
	 xgJ+VIy8p9WJ3ntlaa666SMBxYX/rZexyqe0JkxHfuH2tyaBwNGVWdjRRyM4Wbbyrjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705299;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JZWJ6bw6E70B3IAwkqKHc+4bTFox2bqIK9rtzLE1ddM=;
	b=sX+YcHrbPmn3fAh4G1HzpMKc8rYBCqPqcX0eIwuGzaTU9ziVYc7/dbQeSIVMIfVBfNuA
	 QBKicXjM+a7QP8phIADXsgNX3cQZCRy1AD6GVUTPeCS5EHjAWCZSkwtk08AD73ppTs72b
	 Ztwvd0R9qBFTeyQk8vUuwMRouAnxgz3aiFxNz0Aca4pX7voyuMEJ0oGoUkjT4V+xZxvow
	 clKMkY1m5e0bbPMEIc2YdzZw1bhvLUp9jNas7cy0x6WxvCXqgc4qkPpPaHRaIiKLKM0Et
	 TxTE+IPNH7+yMA9ZDdguHueiRd29yocBIyrx9DNOCoO9JeKv0jG2wGdNV6BPm3IVENQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAcSSnqs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2460C606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAcSSnqs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7BA1F01828;
	Thu, 22 Oct 2026 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705298;
	bh=JZWJ6bw6E70B3IAwkqKHc+4bTFox2bqIK9rtzLE1ddM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CAcSSnqsZ3zWtrp9TpjaWnRlGxx+Cfi7DkG9LvGnFKPzoK1yLpTO9EjWgShugybuk
	 Ag0ZMKGB3WmUL0GGPCZFZXDg8GHpBry3uipSqQIHhxczfgspr+XwpOCKSNBTs+A+EM
	 WmpeeRKYfPNCRdEwNWCS5QP2bYgJ2vL1V+TItFSefpLtxk6lMhJL5HyYSst/0cgxLB
	 pQOZzRfvkocKKFcdV6qYFAwgdRz1c88CetvM9lLh0n4mMl5D/UOzRVWu8CrvSyJkVb
	 15OH5zfXay+41HIMfurg/mn8tMlIqd6j8/xydkBDkOEP1bRg5Wk8du8Orq1KOYMqj8
	 I0vmLyA5wuCwQ==
Message-ID: <sashiko-outbox-182063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Motorola Moto G10
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael McAllister" <me@michaelmcallister.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <9d30c98a7eb0e57b09f239e8276f6d84422d9fd4.1792703903.git.me@michaelmcallister.org>
References: <cover.1792703903.git.me@michaelmcallister.org>
 <9d30c98a7eb0e57b09f239e8276f6d84422d9fd4.1792703903.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 21:41:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: capri simple-framebuffer missing display clocks =
and GDSC
- [Medium] arm64: dts: qcom: sm4250-motorola-capri: wcn3950-bt never powers=
 off in qca_power_off()
--

commit af8b8ef25e8fb618354806c36e99ddefd993ffb6
Author: Michael McAllister <me@michaelmcallister.org>

arm64: dts: qcom: Add Motorola Moto G10

This patch adds an initial device tree for the Motorola Moto G10 (capri)
smartphone, enabling storage, usb type-c, buttons, graphics, wireless,
bluetooth, and a simple-framebuffer display node.

> diff --git a/arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts b/arch/ar=
m64/boot/dts/qcom/sm4250-motorola-capri.dts
> new file mode 100644
> index 0000000000000..b079f0cdc800b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts
> @@ -0,0 +1,452 @@
[ ... ]
> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		stdout-path =3D "display0";
> +
> +		framebuffer0: framebuffer@5c000000 {
> +			compatible =3D "simple-framebuffer";
> +			reg =3D <0 0x5c000000 0 (720 * 1600 * 4)>;
> +			display =3D <&mdss>;
> +			format =3D "a8r8g8b8";
> +			height =3D <1600>;
> +			stride =3D <(720 * 4)>;
> +			vddio-supply =3D <&vreg_l9a>;
> +			width =3D <720>;
> +		};
> +	};

[Severity: High]
Will the display stay powered and clocked after late_initcall cleanup when
booting with this simple-framebuffer node?

In arch/arm64/boot/dts/qcom/sm6115.dtsi, mdss is disabled by default while
both gcc and dispcc are enabled:

arch/arm64/boot/dts/qcom/sm6115.dtsi:
		dispcc: clock-controller@5f00000 {
			compatible =3D "qcom,sm6115-dispcc";
			...
		};

Because mdss is disabled and simple-framebuffer does not claim clocks or
power domains through the display =3D <&mdss> phandle, nothing claims
gcc_disp_hf_axi_clk in drivers/clk/qcom/gcc-sm6115.c or the display clocks
and mdss_gdsc power domain registered by disp_cc_sm6115_probe() in
drivers/clk/qcom/dispcc-sm6115.c:

drivers/clk/qcom/gcc-sm6115.c:
static struct clk_branch gcc_disp_hf_axi_clk =3D {
	.halt_reg =3D 0x17020,
	.halt_check =3D BRANCH_HALT,
	...
};

drivers/clk/qcom/dispcc-sm6115.c:
static struct gdsc mdss_gdsc =3D {
	.gdscr =3D 0x3000,
	.pd =3D {
		.name =3D "mdss_gdsc",
	},
	.pwrsts =3D PWRSTS_OFF_ON,
	.flags =3D HW_CTRL,
};

When clk_disable_unused() and pm_genpd_poweroff_unused() run during boot,
won't they disable gcc_disp_hf_axi_clk, the dispcc branch clocks, and
mdss_gdsc, shutting down the active display scanout and stdout-path console?

For comparison, arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts keeps
gcc_disp_hf_axi_clk enabled in framebuffer0 and disables dispcc until the
panel driver is wired up:

arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts:
		framebuffer0: framebuffer@5c000000 {
			...
			clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>;
		};
...
&dispcc {
	/* Prevent simplefb from dying until we wire panel driver */
	status =3D "disabled";
};

Should framebuffer0 reference gcc_disp_hf_axi_clk (and either disable dispcc
or claim the dispcc clocks and mdss_gdsc) here as well?

[ ... ]
> +&uart3 {
> +	interrupts-extended =3D <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
> +	pinctrl-0 =3D <&bt_uart_default>;
> +	pinctrl-1 =3D <&bt_uart_sleep>;
> +	pinctrl-names =3D "default", "sleep";
> +
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "qcom,wcn3950-bt";
> +		max-speed =3D <3000000>;
> +		vddch0-supply =3D <&vreg_l23a>;
> +		vddio-supply =3D <&vreg_l9a>;
> +		vddrf-supply =3D <&vreg_l17a>;
> +		vddxo-supply =3D <&vreg_l16a>;
> +	};
> +};

[Severity: Medium]
Can the bluetooth controller power off cleanly on this board when using
qcom,wcn3950-bt with direct regulator supplies instead of a power sequencer?

In drivers/bluetooth/hci_qca.c, qca_serdev_probe() falls back to direct
regulator control via qca_init_regulators() when devm_pwrseq_get() does not
find a bluetooth power sequencer. While qca_power_on() and
qca_regulator_init() handle the wcn3950 soc_type, both switch statements in
qca_power_off() and the cleanup check in qca_serdev_remove() omit it:

drivers/bluetooth/hci_qca.c:qca_power_off() {
	switch (soc_type) {
	case QCA_WCN3988:
	case QCA_WCN3990:
	case QCA_WCN3991:
	case QCA_WCN3998:
		host_set_baudrate(hu, 2400);
		qca_send_power_pulse(hu, false);
		break;
	default:
		break;
	}

	if (power && power->pwrseq) {
		pwrseq_disable(power->pwrseq);
		set_bit(QCA_BT_OFF, &qca->flags);
		return;
	}

	switch (soc_type) {
	case QCA_WCN3988:
	case QCA_WCN3990:
	case QCA_WCN3991:
	case QCA_WCN3998:
		qca_regulator_disable(qcadev);
		break;
	...
}

drivers/bluetooth/hci_qca.c:qca_serdev_remove() {
	switch (qcadev->btsoc_type) {
	case QCA_WCN3988:
	case QCA_WCN3990:
	case QCA_WCN3991:
	case QCA_WCN3998:
	case QCA_WCN6750:
	case QCA_WCN6855:
	case QCA_WCN7850:
		if (power->vregs_on)
			qca_power_off(&qcadev->serdev_hu);
		break;
	default:
		break;
	}
}

Without a power-sequencer node (or wcn3950 handling in qca_power_off() and
qca_serdev_remove()), won't powering off bluetooth or unbinding the serdev
driver skip both qca_send_power_pulse(hu, false) and
qca_regulator_disable(qcadev), leaving vddch0, vddio, vddrf, and vddxo
permanently enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792703903.gi=
t.me@michaelmcallister.org?part=3D2
