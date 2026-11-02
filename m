Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632495;
	b=unJxf0Psp8Yj+odNeUEuBcvXnGVCbdYDDWtS18/rNAWASJkU1N/pPEnsVZW9L2jy0Knn
	 Wn1gDp4qk7JH0zWhziV0dqu8L9BTBiQPoxgj3oEc5DSO7n2BLDs9AxjCGJ//Lb6FGTWfL
	 HM9HMXV7O0l9xbsKGnMOv9sgw/aejlUVqbfi0jmsjPHlQLiFSJG/xM6FM3JS5iKWM2TY5
	 jC5yKCERh4g3+k4ETLGlKNADHJ23ZBzuD8LuICckqV+Dgsy15khW3w7VQpQc2lGWV4d09
	 DfI2iFDW7xZarkiZ1q/yGbGo05Jk/QI3itigLqfXPXQuYqnN9hAbN1oJkd64GJQIvyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632495;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k4O0io8dJgP8AKHU+idYb7uuBzceudvaBdwtE6m6ReI=;
	b=Lpjz4GWZ7MM7AeHN9Xxc5YIa/ZSAKApasSD5H3za3p/GkVNMK8wdUpOjP+6wOJsNrhtT
	 mzwNWDe5AQlYgE3kiSrxqc/SUGDQ8C2emnp1HaCInAyAF4MjhcwBO7DsDc30IO3rM1RRM
	 3N8Zq2O4IUspFL2ULjX5tBF7DduiX+Wve381tH1x+rL1M4Dv/zXcmP2WhtaHIC1Fp13q/
	 FvUm7S+sCdmWw1Cr7qYt837W5fPaqWeXh5tp9M7qq+uNgoUU0teX9Az3OXUYGqDEwxHU2
	 xqZa1ZC7iwSruVPtzaGn7lols369pGDzUGkUN+7RYZBW2LR0iaicM/h/Hu5GuduTpoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLPzbRl0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A286079043
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLPzbRl0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A891F00A17;
	Mon,  2 Nov 2026 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632495;
	bh=k4O0io8dJgP8AKHU+idYb7uuBzceudvaBdwtE6m6ReI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PLPzbRl0MkNsjEvPMWfZpuzz58HQZtr6KnSmvCXg88Rs+j2JghcxOnnk18YDlkgkr
	 TNhRpKFvxnGTMOxsfzr9YWNwaBNizQ13kjcXnCmDpz/ms/VvP5TCnlfzdeXYgHzCoX
	 hFI1dtxBKRV4AegzTjuY/nQx2J5HQj6sLEKXhN6a8R/QASSt7/RE/dsgIIaLxHCH3r
	 bOZ6ioaaUWzBhQQaze2xC/BLxNfSFT56T/oEXM9ebY+9IfVrcFsqmOlLO/NIyeT3Ze
	 Xw0TQuL+NNPB0DnLCAhbXHuUjWxqtt3fnqHE3kGhR04aACGeS1dKusGq2Atuj1vWOw
	 kZWPYscQy95GA==
Message-ID: <sashiko-outbox-193645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-quarkpi-ca2-v11-2-eb246076a82f@163.com>
References: <20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com>
 <20261102-quarkpi-ca2-v11-2-eb246076a82f@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:14:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: rockchip: unsorted nodes and missing blank lines in qua=
rkpi-ca2
--

commit 994e70f88ca26a3876389bdd486ca82fe1479b19
Author: Bob Hui <bg9oxa@163.com>

arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

This commit adds the device tree for the ALIENTEK QuarkPi-CA2, an RK3588S
based card computer.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..c7889f729191d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

[ ... ]

> +	aliases {
> +		ethernet0 =3D &gmac1;
> +		mmc0 =3D &sdhci;
> +		mmc1 =3D &sdmmc;
> +	};
> +	analog_sound: analog-sound {
> +		compatible =3D "simple-audio-card";

[ ... ]

> +		simple-audio-card,routing =3D
> +			"Headphones", "LOUT1",
> +			"Headphones", "ROUT1",
> +			"Headphones", "Headphone Power OUTL",
> +			"Headphones", "Headphone Power OUTR",
> +			"Headphone Power INL", "LOUT1",
> +			"Headphone Power INR", "ROUT1",
> +			"LINPUT1", "Headset Mic",
> +			"RINPUT1", "Headset Mic";
> +		sound_cpu: simple-audio-card,cpu {
> +			sound-dai =3D <&i2s0_8ch>;
> +		};
> +
> +		sound_codec: simple-audio-card,codec {
> +			sound-dai =3D <&es8388>;
> +			system-clock-frequency =3D <12288000>;
> +		};
> +	};
> +
> +	hp_amp: audio-amplifier {
> +		compatible =3D "simple-audio-amplifier";
> +		sound-name-prefix =3D "Headphone Power";
> +		enable-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial2:1500000n8";
> +	};
> +	hdmi0-con {
> +		compatible =3D "hdmi-connector";

[ ... ]

> +	headset_keys: headset-keys {
> +		compatible =3D "adc-keys";
> +		io-channels =3D <&saradc 3>;
> +		io-channel-names =3D "buttons";
> +		keyup-threshold-microvolt =3D <1800000>;
> +		poll-interval =3D <100>;
> +
> +		button-play-pause {
> +			label =3D "play pause";
> +			linux,code =3D <KEY_PLAYPAUSE>;
> +			press-threshold-microvolt =3D <2000>;
> +		};
> +	};
> +	ir_receiver: ir-receiver {
> +		compatible =3D "gpio-ir-receiver";

[ ... ]

> +&pinctrl {
> +	headphone {
> +		hp_con: hp-con {
> +			rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +		hp_det: hp-det {
> +			rockchip,pins =3D <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +	ir {
> +		ir_receiver_pin: ir-receiver-pin {
> +			rockchip,pins =3D <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	leds {
> +		work_led_pin: work-led-pin {
> +			rockchip,pins =3D <1 RK_PD7 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +
> +	pcie {
> +		pcie2x1l2_perstn: pcie2x1l2-perstn {
> +			rockchip,pins =3D <3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +	sdmmc {
> +		sd_s0_pwr: sd-s0-pwr {
> +			rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};

[ ... ]

> +&pwm14 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pwm14m1_pins>;
> +	status =3D "okay";
> +};
> +
> +&pwm7 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pwm7m0_pins>;
> +	status =3D "okay";
> +};

[ ... ]

> +		regulators {
> +			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
> +				regulator-name =3D "vdd_cpu_lit_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-ramp-delay =3D <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_vdenc_s0: vdd_vdenc_mem_s0: dcdc-reg4 {
> +				regulator-name =3D "vdd_vdenc_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-ramp-delay =3D <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_gpu_s0: dcdc-reg1 {
> +				regulator-name =3D "vdd_gpu_s0";
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-enable-ramp-delay =3D <400>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v8_s3: dcdc-reg10 {
> +				regulator-name =3D "vcc_1v8_s3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vdd_log_s0: dcdc-reg3 {

[Severity: Low]
As reported by Heiko Stuebner on v10 [1], should all nodes without unit
addresses and phandle references in arch/arm64/boot/dts/rockchip/rk3588s-qu=
arkpi-ca2.dts
be sorted in natural alpha-numeric order, with blank lines separating
sibling nodes?

Specifically:
- Under &spi2/pmic@0/regulators, dcdc-reg2 and dcdc-reg4 are placed before
  dcdc-reg1, and dcdc-reg10 is placed before dcdc-reg3 instead of natural
  alpha-numeric order dcdc-reg1 through dcdc-reg10.
- Phandle reference &pwm14 is placed before &pwm7 instead of &pwm7 before
  &pwm14.
- Inside analog-sound, simple-audio-card,cpu is placed before
  simple-audio-card,codec.
- Blank lines are missing between aliases and analog-sound, after
  simple-audio-card,routing in analog-sound, between chosen and hdmi0-con,
  between headset-keys and ir-receiver, and between hp-con and hp-det,
  headphone and ir, and pcie and sdmmc in &pinctrl.

[1] https://lore.kernel.org/r/2372620.HovnAMPojK@phil

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-quarkpi-ca=
2-v11-0-eb246076a82f@163.com?part=3D2
