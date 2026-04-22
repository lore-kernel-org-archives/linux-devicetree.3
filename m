Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB83F3C3C08
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858253; cv=none; b=HwBu37TYOte53KwmxHiWzqxQklIilhNlRim1Kzfa+SqfR8owZ1kB+YEtKWe50CWbH2zJ4lBogohf2jLp+9teEQVMmcoG8QNetU6DOScw5+9OXqfQKE/8GLOUwsE/V4b/woeVb9J2tKZZiMJshPhSZAn1cKXOWj2f1sXvM9/S0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858253; c=relaxed/simple;
	bh=FntQhP/O0Z5WG9KzvwTg0ixC2Hqw3iL4rsA0JE3JrFA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Pd2YOrZniJ6cAGUfxy2um5nqSMwkUbX/rhEsZyd+G543LKeNjG/oxeLiaBk2Kd+DVlGMbVmL8ebJgDOVQmfj6a4EJvHruLZSpm9ETWTpVh6do/tTUp/+WathRpzPNdTahjZjGI5O9uZMuXj3YJaOiASu+P0NmcWS4dbiL0VaF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwEpXt16; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwEpXt16"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38dd575bca3so57693881fa.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776858250; x=1777463050; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9drZOG344fqQoYzPEpzOY3EXzMEq9Xd5LoQQRRgJm0=;
        b=dwEpXt166DiOWklBtpX7naiSkkvQT+3ltzx54hqo1uP7E19O55Y4u0Zvu+NeayUEQ2
         KTu7dB5xaSPDmLsUAl0JAUGLD8ZZs9rGOTkTcnXQXNuqyH2+T0m9wWyZViao1kRwwtAs
         cxMQdIIBgn95/VPWtmlU9aEeJSI+eQO5MS+1AQI/zElgzDJBiH4JM4orrIeP1esqy05p
         DqSCy5SFXs4W1jK9UHMXWuiMaxf4gYpB7lhHoaAsNKdPDVRUq96uQM/b3AJrwjtJ67BI
         fxtTFFdFkXg6bG1+nTEdYC9Ne4VMNd8zbX95Of4d7ecYuQt/6aVXEo/kCWAodEXuY8dO
         1pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858250; x=1777463050;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9drZOG344fqQoYzPEpzOY3EXzMEq9Xd5LoQQRRgJm0=;
        b=GbciGJ4fy9VC3g2wCEvWBKDogleqMWOc3l6+CQVqfWrvl4rvqA9blWVjYeMK6UUSXH
         rM6OwBQ7OdrIZhyF7pdxQK0HR+UE/Y1cUKrdW0B1nmQEbqIi1WsYlMp3zpiHNb01z5Ti
         M7pYaxfznr0XhviYADVbwfB2mhIy9/NxGluaIrJuGT919P2F2GKMj1MQRoliyyYkupS0
         ZJodKug84PFy+q1mnLT8A+EwvgbE1XzBpDzbZJoLblEbzVPfLLG1mFmqaz5UMj8VyuMc
         P6MQUdsZj2M382czVNYSjjcD62ZG2wkB/RoNbQqfvaqB2MxgFfj/ewu1o5OT9UKXC2Ee
         stRA==
X-Forwarded-Encrypted: i=1; AFNElJ9zB8SiqEs5UuGd3jDmZX7xBJKm9AaAIJYP7x4keVt+59b2Tuy9+3zMjsq6HFSxHwJSa8pzMZtoiazp@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOmJluUUJNSv6WooEcdYAzAzQci38JHqgUlGCW92i4KGY9M/C
	2nOpqqhwxIdXzIGO2MQWpLGpSMGWDhWDVjl2XuFgefkNtyMhQ3xBP4GUndWJRA==
X-Gm-Gg: AeBDievlk3ZWWY4qFo3498hPyV9x3KNJCQcSHAVP2jDG1UlblHYbfWIYxXxBTwGzKi5
	ixSTl8UlxiK8bgBMLRSaBuq/hF72QqSygAkAifvpclQzb/HSlHXbxD67c4gIQ+n8rqYjM7vQsFX
	L0RT7lq+F5AbjkyDgoxvMMdfTV2TFk2QuiqTeT8yg0dKptTH8xMmPenB2ZIGJR+GyJtZ2nuk3cy
	eJkTcgV60IimpV6Xj6Oxly6uk6Z0Y2kIPR/yStsJJtQvtHSvcaAfgylpfLoAa8QeQNyAqPS5e7B
	ikbzqcRUQ3PP1uHGMUNaT+c7WktMuTONqtYc3cXOCWIx3vNKRUYGkkPMa7DTAlVf/FEuXaw67RG
	XeIkC5vRcX7tCdmsDQ3M1RyelBD9b4JYYJVDC+QCowQWunYy5Nv/C8+cLomLIeQlARCe9MUrByh
	FbQaXqaQvNK5GgeKxFwtkCD7O2+QZ4E8fMUtYwRP8Abbpj8cpgSO9aSyL56fqM2u0=
X-Received: by 2002:a05:6512:3c99:b0:5a4:1b6:dd31 with SMTP id 2adb3069b0e04-5a417299948mr6173524e87.13.1776858249676;
        Wed, 22 Apr 2026 04:44:09 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm4355743e87.82.2026.04.22.04.44.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:44:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for Amediatech
 X98Q
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
Date: Wed, 22 Apr 2026 15:43:54 +0400
Cc: robh@kernel.org,
 krzk+dt@kernel.org,
 conor+dt@kernel.org,
 neil.armstrong@linaro.org,
 khilman@baylibre.com,
 jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <08C1AD64-2AA9-48B5-B33E-16844C0111DE@gmail.com>
References: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at>
 <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
To: christian.koever-draxl@student.uibk.ac.at
X-Mailer: Apple Mail (2.3864.500.181)

> On 22 Apr 2026, at 1:58=E2=80=AFpm, =
christian.koever-draxl@student.uibk.ac.at wrote:
>=20
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl =
<christian.koever-draxl@student.uibk.ac.at>
>=20
> Add dts enabling core hardware for the Amediatech X98Q TV box.
>=20
> The board features:
> - Amlogic S905W2 (Meson S4) SoC
> - 1 GiB RAM (2 GiB variants exist)
> - eMMC and microSD card slot
> - SDIO-based WiFi module (unsupported)
> - RMII Ethernet with internal PHY
> - IR receiver and UART console
> - Status LED
>=20
> Enabled peripherals:
> - eMMC (HS200)
> - SD card interface
> - SDIO bus (WiFi, no driver yet)
> - Ethernet (RMII)
> - UART_B
> - IR receiver
> - PWM-controlled CPU regulator
> - PWM and Fixed regulators for core and IO rails
>=20
> Known limitations:
> - No support for the onboard WiFi module
> - Missing multimedia (HDMI/audio)
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl =
<christian.koever-draxl@student.uibk.ac.at>
> ---
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
> 2 files changed, 250 insertions(+)
> create mode 100644 =
arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile =
b/arch/arm64/boot/dts/amlogic/Makefile
> index 15f9c817e502..c7752684dea6 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -85,6 +85,7 @@ dtb-$(CONFIG_ARCH_MESON) +=3D =
meson-gxm-ugoos-am3.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-vega-s96.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-wetek-core2.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-s4-s805x2-aq222.dtb
> +dtb-$(CONFIG_ARCH_MESON) +=3D meson-s4-s905w2-x98q.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-s4-s905y4-khadas-vim1s.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-sm1-a95xf3-air-gbit.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-sm1-a95xf3-air.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts =
b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
> index 000000000000..3eecbc858522
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Christian Stefan K=C3=B6ver-Draxl
> + * Based on meson-s4-s905y4-khadas-vim1s.dts:
> + *  - Copyright (c) 2026 Khadas Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-s4.dtsi"
> +
> +/ {
> + model =3D "Shenzhen Amediatech Technology Co., Ltd X98Q";
> + compatible =3D "amediatech,x98q", "amlogic,s905w2", "amlogic,s4";
> + interrupt-parent =3D <&gic>;
> + #address-cells =3D <2>;
> + #size-cells =3D <2>;
> +
> + aliases {
> + mmc0 =3D &emmc; /* eMMC */
> + mmc1 =3D &sd; /* SD card */
> + mmc2 =3D &sdio; /* SDIO */
> + serial0 =3D &uart_b;
> + };
> +
> + memory@0 {
> + device_type =3D "memory";
> + reg =3D <0x0 0x0 0x0 0x40000000>;
> + };
> +
> + reserved-memory {
> + #address-cells =3D <2>;
> + #size-cells =3D <2>;
> + ranges;
> +
> + /* 52 MiB reserved for ARM Trusted Firmware */
> + secmon_reserved: secmon@5000000 {
> + reg =3D <0x0 0x05000000 0x0 0x3400000>;
> + no-map;
> + };
> + };
> +
> + emmc_pwrseq: emmc-pwrseq {
> + compatible =3D "mmc-pwrseq-emmc";
> + reset-gpios =3D <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
> + };
> +
> + sdio_32k: sdio-32k {
> + compatible =3D "pwm-clock";
> + #clock-cells =3D <0>;
> + clock-frequency =3D <32768>;
> + pwms =3D <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> + };
> +
> + sdio_pwrseq: sdio-pwrseq {
> + compatible =3D "mmc-pwrseq-simple";
> + reset-gpios =3D <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> + clocks =3D <&sdio_32k>;
> + clock-names =3D "ext_clock";
> + };
> +
> + main_5v: regulator-main-5v {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "5V";
> + regulator-min-microvolt =3D <5000000>;
> + regulator-max-microvolt =3D <5000000>;
> + regulator-always-on;
> + };
> +
> + sd_3v3: regulator-sd-3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "SD_3V3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + gpio =3D <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
> + regulator-always-on;
> + };
> +
> + vddio_sd: regulator-vddio-sd {
> + compatible =3D "regulator-gpio";
> + regulator-name =3D "VDDIO_SD";
> + regulator-min-microvolt =3D <1800000>;
> + regulator-max-microvolt =3D <3300000>;
> + gpios =3D <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
> + gpios-states =3D <1>;
> + states =3D <1800000 1 3300000 0>;
> + };
> +
> + vddao_3v3: regulator-vddao-3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDAO_3V3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + vin-supply =3D <&main_5v>;
> + regulator-always-on;
> + };
> +
> + vddio_ao1v8: regulator-vddio-ao1v8 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDIO_AO1V8";
> + regulator-min-microvolt =3D <1800000>;
> + regulator-max-microvolt =3D <1800000>;
> + vin-supply =3D <&vddao_3v3>;
> + regulator-always-on;
> + };
> +
> + /* SY8120B1ABC DC/DC Regulator. */
> + vddcpu: regulator-vddcpu {
> + compatible =3D "pwm-regulator";
> +
> + regulator-name =3D "VDDCPU";
> + regulator-min-microvolt =3D <689000>;
> + regulator-max-microvolt =3D <1049000>;
> +
> + vin-supply =3D <&main_5v>;
> +
> + pwms =3D <&pwm_ij 1 1500 0>;
> + pwm-dutycycle-range =3D <100 0>;
> +
> + regulator-boot-on;
> + regulator-always-on;
> + /* Voltage Duty-Cycle */
> + voltage-table =3D <1049000 0>,
> + <1039000 3>,
> + <1029000 6>,
> + <1019000 9>,
> + <1009000 12>,
> + <999000 14>,
> + <989000 17>,
> + <979000 20>,
> + <969000 23>,
> + <959000 26>,
> + <949000 29>,
> + <939000 31>,
> + <929000 34>,
> + <919000 37>,
> + <909000 40>,
> + <899000 43>,
> + <889000 45>,
> + <879000 48>,
> + <869000 51>,
> + <859000 54>,
> + <849000 56>,
> + <839000 59>,
> + <829000 62>,
> + <819000 65>,
> + <809000 68>,
> + <799000 70>,
> + <789000 73>,
> + <779000 76>,
> + <769000 79>,
> + <759000 81>,
> + <749000 84>,
> + <739000 87>,
> + <729000 89>,
> + <719000 92>,
> + <709000 95>,
> + <699000 98>,
> + <689000 100>;
> + };
> +};
> +
> +&emmc {
> + status =3D "okay";
> + pinctrl-0 =3D <&emmc_pins>, <&emmc_ds_pins>;
> + pinctrl-1 =3D <&emmc_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> +
> + bus-width =3D <8>;
> + cap-mmc-highspeed;
> + mmc-ddr-1_8v;
> + mmc-hs200-1_8v;
> + max-frequency =3D <200000000>;
> + non-removable;
> + disable-wp;
> +
> + mmc-pwrseq =3D <&emmc_pwrseq>;
> + vmmc-supply =3D <&vddao_3v3>;
> + vqmmc-supply =3D <&vddio_ao1v8>;
> +};
> +
> +&ethmac {
> + status =3D "okay";
> + phy-handle =3D <&internal_ephy>;
> + phy-mode =3D "rmii";
> +};
> +
> +&ir {
> + status =3D "okay";
> + pinctrl-0 =3D <&remote_pins>;
> + pinctrl-names =3D "default";
> +};
> +
> +&pwm_ef {
> + status =3D "okay";
> + pinctrl-0 =3D <&pwm_e_pins1>;
> + pinctrl-names =3D "default";
> +};
> +
> +&pwm_ij {
> + status =3D "okay";
> +};
> +
> +&sd {
> + status =3D "okay";
> + pinctrl-0 =3D <&sdcard_pins>;
> + pinctrl-1 =3D <&sdcard_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> + bus-width =3D <4>;
> + cap-sd-highspeed;
> + max-frequency =3D <50000000>;
> + disable-wp;
> +
> + cd-gpios =3D <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +
> + vmmc-supply =3D <&vddao_3v3>;
> + vqmmc-supply =3D <&vddao_3v3>;
> +};
> +
> +     /*
> +      * Wireless SDIO Module (Amlogic W150S1)
> +      * Note: There is no driver for this at the moment.
> +      */

^ drop this comment

> +
> +&sdio {
> + status =3D "okay";
> + pinctrl-0 =3D <&sdio_pins>;
> + pinctrl-1 =3D <&sdio_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> + bus-width =3D <4>;
> + cap-sd-highspeed;
> + sd-uhs-sdr50;
> + sd-uhs-sdr104;
> + max-frequency =3D <200000000>;
> + non-removable;
> + disable-wp;
> +
> + no-sd;
> + no-mmc;
> + mmc-pwrseq =3D <&sdio_pwrseq>;
> + vmmc-supply =3D <&vddao_3v3>;
> + vqmmc-supply =3D <&vddio_ao1v8>;

	sdio: wifi@1 {
		/* Amlogic W150S1 */
		reg =3D <1>;
  	};

^ add this to generically describe the hardware without
the need for a specific compatible (as done in several of
the Amlogic reference designs where we cannot guarantee
which chipset is used). The reg value should be enough to
result in the downstream driver probing should a distro
choose to package it; thus avoiding the need for distros
to forever carry a device-tree patch to add support (as
Amlogic have no plans to upstream the driver). Should that
ever change the comment can be replaced with a compatible.

Christian

> +};
> +
> +&uart_b {
> + status =3D "okay";
> +};
> --=20
> 2.53.0
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

