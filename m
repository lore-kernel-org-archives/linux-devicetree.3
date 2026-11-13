Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607833;
	b=y5dxyVERnHMqizQI8skABQ5B63EADBFGAOmg2KzH4gdzneWkGVP9keTVIny2SBF2vF/w
	 CFzpJXmda8CMsqcMGH0GNRf1syAOwwEHSYXTFPWYbCsWuLqrRDJ2MRbucvyDhm0qmE2Vy
	 kFVqzEfAeALfH9qdyDWFi57nAR/vth49cIpMEjvCgLfX53IV0rb3DP49nMUAvDayAu3Cv
	 RcHVGJlUKUkeoOQifsWRh7/RekRSiYvcU5YqU3kh2akvow0u2SKEecHRuCwi3UEwRiWMq
	 HJYQbt/sfvcLio4SMC/wx5ZOvwUNjkpfXGSpAW3L8W+i2EoA/L/1m88nluFzx4IWNSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607833;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sDlqYJLQQM+p9BRAv8bFvbc4TUrRowCyCorcyyMe1OE=;
	b=2GCe1tNg3e4TYPt6zUKr4pa3YE6qKBdMUCWksctBQe0WFXSD8r5K/fsAo3qc1C8ybhFJ
	 UbM2ecxre7kM9IOXYC15rnQnk8f22LLLpo5yoyyyLJGHTrJV3ZW4TStc+UN0FISJ88kU2
	 4DcxyHAT3ZRObV/c930yfjvGptvoPnqEipTRGlyACL4YTpnk9Wyvz7+Vxoe69qTjbwAAD
	 su0iDep2x868x7KgHVLpVDuUP4Qg8K/iI1MSN+F/6cP/s3JqDVxK+grPRJN6YK8B0b8Ui
	 NEOX38SiMvYTjrkanPc6gAh1jVl2pdNIQ+1v5p+olJ4Nhgu3YB5RhwYuXwufj70czvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gKKtV+lr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D998606A33B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gKKtV+lr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0441F000C4;
	Fri, 13 Nov 2026 22:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794607833;
	bh=sDlqYJLQQM+p9BRAv8bFvbc4TUrRowCyCorcyyMe1OE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gKKtV+lrRXeybWCoeOQ7jC2XvXW3AccvLi/Z/ZYXpOrHu9lnwV4/f84YXa3rpqEy3
	 jg6UfDd36uHDOCuHgUmj6NN9pTAReD9jF6y3ympg2L3sqNojKaIU/8TTYUJnCYvB1N
	 uITU9amnDzGfSu9CGzTc3ps6g1Vb2+NA0jlIn8GUj5MRExS/ssQJm/C79QSPAuGr5o
	 0Pw4v+or7IhjQ7l47QchPFazThfTxCfdnjPHm+vL6l69O01LdGVq7AxsbfCLymm8TG
	 egQ/GU+awVzTJvgAoIpej+YVWDBuxRfnMZjTHLc58AC0fpEdgEm5qn92QDRDezLLU1
	 jh/dyHoz5NINg==
Message-ID: <sashiko-outbox-213776@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add ASUS Vivobook S16 S3607QA
 (X1P42100)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113214424.220241-3-ingo.kubbilun@gmail.com>
References: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
 <20261113214424.220241-3-ingo.kubbilun@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 22:10:32 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] arm64: dts: qcom: missing x1p42100-asus-vivobook-s16-el2.dtb
  target in Makefile
- [Medium] arm64: dts: qcom: vivobook-s16: missing regulator-always-on
  on vreg_l15b_1p8
- [Low] arm64: dts: qcom: use of deprecated firmware-name property in
  wifi@0 node
- [Low] arm64: dts: qcom: SoC CPU thermal zones overridden via path refs
  in board DTS
- [Low] arm64: dts: qcom: misplaced WCN comment and unsorted nodes in
  vivobook-s16
- [Low] arm64: dts: qcom: x1p42100-asus-vivobook-s16: unused i2c1 and
  qupv3_2 enabled
--

commit 104a00c9fa1edca7f449af5c0a4e3e5e2801e6a7
Author: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>

arm64: dts: qcom: add ASUS Vivobook S16 S3607QA (X1P42100)

This commit adds the device tree for the ASUS Vivobook S16 S3607QA laptop
based on the Qualcomm Snapdragon X X1P42100 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 88230c4e00ea9..11cd956c082a5 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -509,6 +509,7 @@ x1e80100-qcp-el2-dtbs	:=3D x1e80100-qcp.dtb x1-el2.dt=
bo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
>  x1p42100-asus-vivobook-s15-el2-dtbs	:=3D x1p42100-asus-vivobook-s15.dtb =
x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D x1p42100-asus-vivobook-s15.dtb x1p42100-asu=
s-vivobook-s15-el2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D x1p42100-asus-vivobook-s16.dtb
>  x1p42100-asus-zenbook-a14-el2-dtbs	:=3D x1p42100-asus-zenbook-a14.dtb x1=
-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D x1p42100-asus-zenbook-a14.dtb x1p42100-asus=
-zenbook-a14-el2.dtb
>  x1p42100-asus-zenbook-a14-lcd-el2-dtbs	:=3D x1p42100-asus-zenbook-a14-lc=
d.dtb x1-el2.dtbo

[Severity: Medium]
Should this also define x1p42100-asus-vivobook-s16-el2-dtbs and add
x1p42100-asus-vivobook-s16-el2.dtb like the other X1 targets?  Without
the composite rule, x1p42100-asus-vivobook-s16-el2.dtb is not built and
the base DTB is not compiled with symbols for applying x1-el2.dtbo when
booting at EL2.

> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts b/ar=
ch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts
> new file mode 100644
> index 0000000000000..7dc4f4bd94e5c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts

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
> +	};
> +
> +	/*
> +	 * TLMM 116/117 (BT/WLAN enable) are listed in ACPI BTH0 and QPPX.
> +	 * WCN_3P3 switch on TLMM 214 is not visible in ACPI; it is the same
> +	 * on every ASUS X1 design in mainline (S15, Zenbook A14).
> +	 */
> +	us_euro_mux_ctrl: mux-controller {
> +		compatible =3D "gpio-mux";
> +		pinctrl-0 =3D <&us_euro_hs_sel>;
> +		pinctrl-names =3D "default";
> +		mux-supply =3D <&vreg_l16b_2p5>;
> +		#mux-control-cells =3D <0>;
> +		mux-gpios =3D <&tlmm 68 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: Low]
This isn't a bug, but the comment about the WCN GPIOs (TLMM 116/117 and
TLMM 214) is attached to mux-controller instead of wcn6855-pmu.
Also, mux-controller in the root node (and us-euro-hs-sel-state and
wcd-reset-n-active-state in &tlmm below) are out of alphabetical order.

[ ... ]

> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name =3D "vreg_l15b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};

[Severity: Medium]
Should vreg_l15b_1p8 have regulator-always-on, matching vreg_l12b_1p2
above and other X1 laptops (see commit 06c8fc3e132c ("arm64: dts: qcom:
x1-dell-thena: mark l12b and l15b always-on"))?

Unlike on the Vivobook S15 where wcn7850-pmu also consumes vreg_l15b_1p8,
wcn6855-pmu here uses vreg_wcn_1p9, leaving only the audio codecs
(wcd938x, left_spkr and right_spkr) as consumers in DT.  If the audio
codec drivers defer probe or are unbound, the regulator framework will
disable vreg_l15b_1p8 and cut power to shared board components not
modeled in DT.

[ ... ]

> +&i2c1 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +};

[Severity: Low]
Should &i2c1 (and &qupv3_2 below) be left disabled since neither has any
child devices enabled on this board?  Enabling &i2c1 causes
geni_i2c_probe() to mux gpio4 and gpio5 to qup0_se1, vote for QUP0
interconnect bandwidth, and initialize an unused I2C controller.

[ ... ]

> +&pcie4_port0 {
> +	reset-gpios =3D <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +	/* ACPI PCI4.RP1.WLTM; WCN6855 (FastConnect 6900, Wi-Fi 6E) */
> +	wifi@0 {
> +		compatible =3D "pci17cb,1103";
> +		reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		/*
> +		 * NFA765 module (Windows BDF: bdwlan_wcn685x_2p1_nfa765a_*).
> +		 * Use the NFA765 firmware build from linux-firmware
> +		 * (ath11k/WCN6855/hw2.1/nfa765/{amss,m3}.bin); the default
> +		 * WLAN.HSP.1.1-03125 LITE build crashes after BDF download.
> +		 */
> +		firmware-name =3D "nfa765";

[Severity: Low]
Commit adce4fa49961 ("dt-bindings: net: wireless: ath11k-pci: deprecate
'firmware-name' property") deprecated firmware-name on pci17cb,1103 nodes
in favor of ath11k_core_usecase_firmware_table in
drivers/net/wireless/ath/ath11k/core.c (introduced in commit c386a2b10689
("wifi: ath11k: add usecase firmware handling based on device
compatible")).  Should "asus,vivobook-s16-s3607qa" be added to
ath11k_core_usecase_firmware_table instead of using firmware-name here?

[ ... ]

> +/*
> + * CPU thermal throttling. hamoa.dtsi only has 115 C critical trips for =
the
> + * CPU zones, so under sustained load (e.g. make -j8) the SoC ran into t=
he
> + * hardware/EC protection and powered off abruptly. Add a passive trip at
> + * 90 C that lets the thermal core reduce the cluster frequency (scmi-cp=
ufreq
> + * cooling devices), like the GPU zones already do at 95 C.
> + */
> +&{/thermal-zones/cpu0-0-top-thermal} {
> +	polling-delay-passive =3D <250>;
> +
> +	trips {
> +		cpu0_0_top_alert: cpu-alert {
> +			temperature =3D <90000>;
> +			hysteresis =3D <2000>;
> +			type =3D "passive";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map0 {
> +			trip =3D <&cpu0_0_top_alert>;
> +			cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};

[Severity: Low]
Both the TSENS sensors and the SCMI cpufreq cooling devices are
SoC-internal components defined in hamoa.dtsi, where commit 06eadce93697
("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for
CPU") dropped the SoC passive trips.  If TSENS-based passive cooling is
needed across Purwa/Hamoa boards, should this live in the SoC DTSI (or use
&thermal_zones / phandle labels) instead of repeating 20
&{/thermal-zones/...} path overrides in the board DTS?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113214424.2202=
41-1-ingo.kubbilun@gmail.com?part=3D2
