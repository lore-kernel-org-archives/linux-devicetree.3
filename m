Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819923;
	b=zKSGi+/UUgkZ/xGZK+nSTWIRWwwuru7csbMGBh901w1KHfs+dJyY8THp0uyGQz3mwoxl
	 bHN0oo0VZ6KbWt8h+tCVz0bg1v71gQzCCyEVN/gj/5U+ebI+7IBHyRaSVsUY1om4LFkmb
	 Z//2KGYEsEIH7eiGYwXyt/v8nNCplv6sGTGEwDTGP7fZgYYIo5voCgvkb0P/5iXV9+DwG
	 p/2+/ex2um/1tj6j9GifzPk4ulIYqH51K5+f5q0rm4H4gcD0Au/tW6OuzJ+D5PcE+jElT
	 QxMFsUmF75YkeX5NXg696L/NG609/Ft7iiRXu4E0raPOjuHib22T+AuFD3jAu5NHynQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819923;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aE4tuo7feoS3hM+8ek+e2YvkeowbHGlStVZlpn45dro=;
	b=KNtcszal1y7D6hfuziUiLFlXS6jh2Y1Mz51UFIVj+MxtMSgTLKDFnzwO1zAL41VBOEq4
	 7xsXq0Z8VEr94n8YVhyH8rwlJhrPjw56FQkzXbz5tspTUDWOvIyjsF9Z1C1lfME5tkWxG
	 ljAolYJyJxIvGOpGmgM7QVd6NQZH2B8k+kOHlKgJjW3vLOUkZrJd7t0S1wzmAIH096v5a
	 cYz4kWkzsmGcEGbXYgdRxK823SIZhkZP1uuaXmQTQQQnTCJ1FY+PwmICJOgQ8ueziLt0X
	 byl7wmBJFABGZx2Dm4x1+W4LVFrtLskowiy3OcAWB5OYitephuuuGupoDLS9smqgZxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrC063fD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126FA6082BC0
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrC063fD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2161F00A15;
	Wed,  4 Nov 2026 19:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819922;
	bh=aE4tuo7feoS3hM+8ek+e2YvkeowbHGlStVZlpn45dro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TrC063fD7p/+VmVR3AKWpi5LRJ2aXVQQYUG85WjhTNWojTNNQwQA5lQqrREWjuqJ7
	 Huvtn9ltHyWWaXoVYp9VhFnX1/nihZWF8IpCqhCVGV/sevCI/3HrVnRXKhdAL5D7Gg
	 2An+vxvQ8x6a/q7KTTXgdc2cVpctJZVqiyJrnURhs+xV0GKbLUXDoQ7baGgnDRDbRL
	 1v0UZdqP2kE8vpo69vu9NcNXGdBFE/VIFqoe1Rqdbd3R65NzeGNGuESQ1dVLjynXSC
	 mYNiNwt3vhjmRS7e8b5FHfUyzkUqWKumyu6Dzaxz+JtjaxCS6B7Q3Z9ht3f5RuU1WO
	 4uTEBSUySB2Pw==
Message-ID: <sashiko-outbox-197933@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G
Reply-To: sashiko-reviews@lists.linux.dev
To: "Asdlerto Korry" <korryasdlerto@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com>
References: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
 <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 19:18:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: sm7325-samsung-m52xq: missing status okay on qup=
v3_id_0
- [High] arm64: dts: qcom: sm7325-samsung-m52xq: overlapping adsp_mem reser=
ved memory
- [High] arm64: dts: qcom: sm7325-samsung-m52xq: wrong WCN6750 bluetooth RF=
A supplies
- [High] arm64: dts: qcom: sm7325-samsung-m52xq: wrong IRQ trigger type on =
nfc@27
- [Low] arm64: dts: qcom: sm7325-samsung-m52xq: conflicting reg and memory-=
region on fb
--

commit 25a93cb2dad726fce008e0298f37e0192577485b
Author: Asdlerto Korry <korryasdlerto@gmail.com>

arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G

This commit adds the initial device tree for the SM7325-based Samsung Galaxy
M52 5G (samsung,m52xq) smartphone.

> diff --git a/arch/arm64/boot/dts/qcom/sm7325-samsung-m52xq.dts b/arch/arm=
64/boot/dts/qcom/sm7325-samsung-m52xq.dts
> new file mode 100644
> index 0000000000000..5ba9623df6c40
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7325-samsung-m52xq.dts
> @@ -0,0 +1,828 @@

[ ... ]

> +/* The following reserved memory regions have different addresses or siz=
es */
> +/delete-node/ &adsp_mem;
> +/delete-node/ &rmtfs_mem;
> +
> +/ {
> +	model =3D "Samsung Galaxy M52 5G";
> +	compatible =3D "samsung,m52xq", "qcom,sm7325";
> +	chassis-type =3D "handset";
> +
> +	aliases {
> +		serial1 =3D &uart7;
> +	};
> +
> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@e1000000 {
> +			compatible =3D "simple-framebuffer";
> +			reg =3D <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
> +			width =3D <1080>;
> +			height =3D <2400>;
> +			stride =3D <(1080 * 4)>;
> +			format =3D "a8r8g8b8";
> +			memory-region =3D <&splash_mem>;

[Severity: Low]
Should one of reg or memory-region be dropped from framebuffer0?

Both simplefb_get_memory_of() in drivers/gpu/drm/sysfb/simpledrm.c and
simplefb_parse_dt() in drivers/video/fbdev/simplefb.c check whether reg is
present when memory-region is specified, emit a runtime warning preferring
memory-region over reg, and use the 0x2300000-byte splash_mem resource
instead of the (1080 * 2400 * 4)-byte reg property.

[ ... ]

> +	reserved-memory {
> +		cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
> +			reg =3D <0x0 0x81800000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: adsp@86700000 {
> +			reg =3D <0x0 0x86700000 0x0 0x4800000>;
> +			no-map;
> +		};
> +
> +		/* Mainline video_mem is downstream cvp_mem */
> +		real_video_mem: video@8ad00000 {
> +			reg =3D <0x0 0x8ad00000 0x0 0x500000>;
> +			no-map;
> +		};

[Severity: High]
Does adsp_mem overlap with cdsp_mem and real_video_mem here?

In arch/arm64/boot/dts/qcom/kodiak.dtsi (included via sm7325.dtsi), cdsp_mem
is defined at 0x88f00000..0x8ad00000:

arch/arm64/boot/dts/qcom/kodiak.dtsi:
		cdsp_mem: cdsp@88f00000 {
			reg =3D <0x0 0x88f00000 0x0 0x1e00000>;
			no-map;
		};

Because cdsp_mem is not removed with /delete-node/ &cdsp_mem;, defining
adsp_mem at 0x86700000 with size 0x4800000 (0x86700000..0x8af00000) covers
the entire cdsp_mem range and also overlaps the first 0x200000 bytes of
real_video_mem (0x8ad00000..0x8b200000), which triggers overlap errors in
fdt_scan_reserved_mem_late() -> __rmem_check_for_overlap() during boot.

Also, &venus below does not set memory-region =3D <&real_video_mem>, so
venus continues using video_mem (0x8b200000) from kodiak.dtsi while
real_video_mem remains unreferenced.

[ ... ]

> +&i2c9 {
> +	clock-frequency =3D <100000>;
> +
> +	status =3D "okay";
> +
> +	nfc@27 {
> +		compatible =3D "samsung,s3fwrn5-i2c";
> +		reg =3D <0x27>;
> +
> +		interrupts-extended =3D <&tlmm 41 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Should nfc@27 use IRQ_TYPE_EDGE_RISING instead of IRQ_TYPE_LEVEL_HIGH?

In drivers/nfc/s3fwrn5/i2c.c, s3fwrn5_i2c_probe() and s3fwrn5_i2c_set_mode()
set phy->irq_skip =3D true on startup and power/mode transitions, and reque=
st
a threaded IRQ with IRQF_ONESHOT. When the interrupt line asserts while
phy->irq_skip is true (or mode is S3FWRN5_MODE_COLD),
s3fwrn5_i2c_irq_thread_fn() returns IRQ_HANDLED without reading I2C to
clear the interrupt source:

drivers/nfc/s3fwrn5/i2c.c:s3fwrn5_i2c_irq_thread_fn() {
	...
	if (phy->irq_skip)
		goto out;
	...
out:
	mutex_unlock(&phy->common.mutex);

	return IRQ_HANDLED;
}

With IRQ_TYPE_LEVEL_HIGH, the line remains asserted and immediately
re-triggers in an endless IRQ loop as soon as the oneshot handler finishes.

[ ... ]

> +&qupv3_id_1 {
> +	status =3D "okay";
> +};

[Severity: High]
Is &qupv3_id_0 missing status =3D "okay" here?

In arch/arm64/boot/dts/qcom/kodiak.dtsi, uart7 (serial@99c000) is a child of
qupv3_id_0 (geniqup@9c0000), which has status =3D "disabled" by default.
Because geni_se_probe() in drivers/soc/qcom/qcom-geni-se.c only populates
child devices for enabled QUP wrapper nodes, leaving qupv3_id_0 disabled
prevents uart7 and its child bluetooth node from ever being populated or
probed.

[ ... ]

> +	bluetooth: bluetooth {
> +		compatible =3D "qcom,wcn6750-bt";
> +
> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&sw_ctrl_default>;
> +		pinctrl-names =3D "default";
> +
> +		enable-gpios =3D <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios =3D <&tlmm 86 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply =3D <&vreg_l19b_1p8>;
> +		vddaon-supply =3D <&vreg_s7b_0p972>;
> +		vddbtcxmx-supply =3D <&vreg_s7b_0p972>;
> +		vddrfacmn-supply =3D <&vreg_s7b_0p972>;
> +		vddrfa0p8-supply =3D <&vreg_s7b_0p972>;
> +		vddrfa1p7-supply =3D <&vreg_s1b_1p872>;
> +		vddrfa1p2-supply =3D <&vreg_s7b_0p972>;
> +		vddrfa2p2-supply =3D <&vreg_s8b_1p272>;
> +		vddasd-supply =3D <&vreg_l11c_2p8>;

[Severity: High]
Are vddrfa1p2-supply and vddrfa2p2-supply connected to the wrong regulators
here?

vddrfa1p2-supply is connected to vreg_s7b_0p972 (0.535V..1.12V) and
vddrfa2p2-supply is connected to vreg_s8b_1p272 (1.2V..1.5V), while
vreg_s1c_2p19 (2.19V..2.21V) defined in regulators-1 is left completely
unused. When qca_soc_data_wcn6750 probes in drivers/bluetooth/hci_qca.c, the
2.19V SMPS1C rail for the 2.2V RFA supply will never be enabled and will be
turned off as unused. Should vddrfa1p2-supply be <&vreg_s8b_1p272> and
vddrfa2p2-supply be <&vreg_s1c_2p19>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-m52xq-dts-=
v1-0-b198f02912ff@gmail.com?part=3D2
