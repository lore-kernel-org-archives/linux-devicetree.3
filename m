Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600E4E379C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647282; cv=none; b=ITE80gxY6xnKcg6XiR0Rfz5ox+hGwvGl4DJ9tlhYezsWP07e+nG0LetZaIrTr/3S6ie8fGP8brOOOUVgqvq7F7rQEB1hSvzV13rPNVdfXcwxqj3oi4MDdX/D4NB+Wmcha9UHZjnvL25zU+egjgmcRzslQbIe5EDJAeTiMjq+IwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647282; c=relaxed/simple;
	bh=bzktRmn0nU4asdpfpvG3bhybYFgulxg7coHQIjXcIs4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LFaI5EwfpZX2SG6zyMJP0yV7YVg3wj1iWXbbeDXuTcBHSL3joWdRZJpvu+1kAiEleP+S3baW+z0XfWC8Y5LiXTrcGGx+Lj8wHGVVinhIWg+NYhVZYjuQutDPCxbpO7LqyARKpAx6PeBxXJYP8neHMkby9j0mWjIBh0R94IgAGHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXjdMcTt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXjdMcTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8801F00A3E;
	Tue, 21 Jul 2026 15:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784647280;
	bh=reRgFh6MVAp/7exhM5dZH+YG5LzW9472oGrYZOvbMrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXjdMcTtO236wz9OhAdiWSxsAq/QX23GraM2npRXK8jhzKQKLBkK7ndkq40KECWxW
	 U/QcfF841PuiGGv2S1deIjPa8mHRTTHVVwoFEIRWF4SDM7i1fDs9yIs+M9JDZE29Zt
	 rfNlA0TarFrLjP4I3EFcOAo/Chjljjf1+v3Q5ztHFvrXsWYsXa187WpImWfVKo5pUS
	 zRVfGYyv30pMi2he11+wW8PD7Z7k0z8HgbooBGjMzG7k1NcJniX9ia0KLx8Rj600HF
	 uV5J5tjUZ0lUA+T7Z2YnFFZ4cr4EWj0pU5hNmloVUO0rlg43A7aukrGum4ODkLy5EQ
	 PY5rQftj12fZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
Reply-To: sashiko-reviews@lists.linux.dev
To: code_0002@163.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721150740.300-1-code_0002@163.com>
References: <20260721145822.1278-1-code_0002@163.com>
 <20260721150740.300-1-code_0002@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:21:19 +0000
Message-Id: <20260721152120.4A8801F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Invalid clock reparenting for dual DSI synchronization.
- [High] Using `GPIO_OPEN_DRAIN` does not bypass gpiolib's exclusive access=
 check for shared reset lines.
- [High] Severe overvoltage risk by configuring a 0.7V-named regulator to 1=
.9V.
- [Medium] Asymmetric speaker assignment breaks stereo audio routing.
- [Medium] Unnecessary memory allocation for non-existent modem RMTFS.
- [Low] Use of undocumented and downstream DT bindings.
--

--- Patch [1]: [PATCH v5] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (=
sheng) ---
commit 84985aa6cc3ea47e6961c9fece55de9d4418b9fc
Author: map220v <map220v300@gmail.com>

arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)

Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.

> v4: address Sashiko AI review comments
> - Add GPIO_OPEN_DRAIN to shared cs35l43 reset-gpios to avoid -EBUSY

[Severity: High]
Will this still result in -EBUSY errors for 5 out of the 6 speaker
amplifiers?=20

Adding GPIO_OPEN_DRAIN is an electrical configuration and does not instruct
gpiolib to bypass exclusive access checks.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts b/arch/arm6=
4/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts
[ ... ]
> +	reserved-memory {
[ ... ]
> +		rmtfs_mem: rmtfs-region@ccd00000 {
> +			compatible =3D "qcom,rmtfs-mem";
> +			reg =3D <0x0 0xccd00000 0x0 0x280000>;
> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +		};

[Severity: Medium]
Is this reserved memory region necessary?=20

The commit message notes the device lacks a modem, but this node allocates
memory for client-id 1, which strictly maps to the MPSS remote file system
client.

[ ... ]
> +	regulators-5 {
> +		compatible =3D "qcom,pm8550vs-rpmh-regulators";
[ ... ]
> +		vreg_s3g_0p7: smps3 {
> +			regulator-name =3D "vreg_s3g_0p7";
> +			regulator-min-microvolt =3D <600000>;
> +			regulator-max-microvolt =3D <1900000>; //2004000

[Severity: High]
Could this create an overvoltage risk for other hardware relying on a 0.7V
rail?=20

The regulator node name implies a nominally 0.7V rail, but it allows up to
1.9V. If this is a dedicated 1.8V rail, should the node be renamed to
reflect the hardware reality and prevent unsafe reuse?

> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
[ ... ]
> +&i2c5 {
> +	clock-frequency =3D <1000000>;
> +	status =3D "okay";
> +
> +	cs35l43_trl: cs35l43@40 {
> +		compatible =3D "cirrus,cs35l43";
> +		reg =3D <0x40>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <98 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&tlmm 90 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

[Severity: High]
Does this properly bypass gpiolib's exclusive access check for shared
reset lines?=20

Setting GPIO_OPEN_DRAIN alone does not bypass exclusive access, so devices
probing after the first one might still receive -EBUSY.

> +		#sound-dai-cells =3D <0>;
[ ... ]
> +&i2c8 {
> +	clock-frequency =3D <1000000>;
> +	status =3D "okay";
> +
> +	cs35l43_blh: cs35l43@40 {
> +		compatible =3D "cirrus,cs35l43";
> +		reg =3D <0x40>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&tlmm 90 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "BLH";
> +		cirrus,dsp-part-name =3D "blh-cs35l43";

[Severity: Medium]
Does this asymmetric speaker assignment break stereo audio routing?=20

There are left-side tweeter nodes defined (TLH and BLH) but no right-side
high speakers, which seems to create an asymmetric 4-left / 2-right topolog=
y.

> +		cirrus,vpbr-thld =3D <8>;
[ ... ]
> +&mdss_dsi0 {
> +	vdda-supply =3D <&vreg_l3e_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +	qcom,master-dsi;
> +	status =3D "okay";
> +
> +	display_panel: panel@0 {
> +		compatible =3D "xiaomi,sheng-nt36532e", "novatek,nt36532e";
> +		reg =3D <0>;
> +
> +		pinctrl-0 =3D <&sde_dsi_active>;
> +		pinctrl-1 =3D <&sde_dsi_suspend>;
> +		pinctrl-names =3D "default", "sleep";
> +
> +		vddio-supply =3D <&vreg_s3g_0p7>;

[Severity: High]
Is it safe to assign a nominally 0.7V regulator to the display panel's
vddio-supply here? This usage forces the voltage to the higher 1.9V limit.

> +		avdd-supply =3D <&bl_vddpos_5p8>;
[ ... ]
> +&mdss_dsi1 {
> +	vdda-supply =3D <&vreg_l3e_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clocks =3D <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
> +	assigned-clock-parents =3D <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;

[Severity: High]
Will this clock reparenting fail during probe and break dual display
initialization?=20

DSI PHY PLL output clocks are fixed to their local PLLs and do not have
configurable parents. Shouldn't the consumer dispcc clocks be parented to
the master PHY's outputs to properly sync dual DSI?

> +	status =3D "okay";
> +};
[ ... ]
> +&spi4 {
> +	status =3D "okay";
> +
> +	touchscreen@0 {
> +		compatible =3D "novatek,NVT-ts-spi";
> +		reg =3D <0>;
> +
> +		spi-max-frequency =3D <19200000>;
> +		novatek,irq-gpio =3D <&tlmm 25 GPIO_ACTIVE_LOW>;

[Severity: Low]
Will these undocumented downstream compatibles and properties fail dtbs_che=
ck
and prevent standard upstream drivers from binding?

> +
> +		panel =3D <&display_panel>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721150740.300-=
1-code_0002@163.com?part=3D1
