Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BEC3E7141
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165805; cv=pass; b=fPe1wTWOCGGacoqJdfCoG6jgW9IfAJNl0XoVia8XlF+sPwqzu92fOl85T1l5oLRRE7wvbrqbrCf6QjmYEumz6LOigvMlBvrDlDKaBiGKQQoHmwNQHtk9Osak6d20/9fGCw0cd8iFKCYTCoAH9k/o1QJZBYKIqg2M18/HG/GT3Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165805; c=relaxed/simple;
	bh=sEgUrZ18SISt5XIgWxWnNuUv/BNTZYddpMy7Jlw4U4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/xDyYMiksUyKStq+P5iRLAglK+ZkmMrEPzViteZlQv0kcbQqRN/t4NRfxU6bzKZWPpcPGXA7bzsAegDAHAU8aRJOjAXsPRYPlpM6QTv/y6SlEWLlOYfjZ0YKfV184Q97vmAaBX5YnbumQ9vg7wIJXIXpjHUgVDfIHzFnFw8ofQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSj7TP0Y; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSj7TP0Y"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50d880e6fbbso18999221cf.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778165802; cv=none;
        d=google.com; s=arc-20240605;
        b=EJtisbHuiAqVXxcqIq+BGiL2ASt7N6oRqemX5zT3/lKD/zarfId3Ds9qvk64jwMXRu
         ZGGB0+PGHeV3ueOcuHksbHDkS2EKlQ3SUr5qut/eqk1NTfk70e9RBkWU9C+2M1SSjjXP
         4cC5Ujf8AO1XKV/gkCits9rBPOAKaBoPIxMYNvt335iLOmpBxgYeKhK5qUTA13lcpVhJ
         aj5Y4QALM2GNsqNEd4VQWONZXdCV1b0f1bzVDjB8195gBXCukyPnYAf5hzB7hOF5rVTW
         qrJYZcDXGZitSDh0EiVWplo8zrAqh+uHY+oFJ9cD6sVQ1ObMlnodZafa4wwb5qwiwvp0
         LOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ndl3+yfbim4cO8qmcSCh8IE48ZCvWnEZfI+eDsspdGw=;
        fh=3pihUpjciFctm4iBE6h1oDkb7hpvCG4dszvEFtcq1d0=;
        b=X74NleHKdC1Hfj/Xsf8ArEgj/qyOp8Fe2H0B+IVEInWEoF/HzA6soJGGFVRy75oi5U
         X0YbvwJiOTUFFOLxwjarhLl6KNhJbVJj0btBGRGDIiivIsiLtO/63lgZB/GrB3frCa6Z
         IRelYaPEqwluJStAIEc1t0p8EPTs5jhXIIUJIhP7//HMg+IaY4MeElAjiCBC2IpJD/Hl
         HlAGbIAe43qdrkqZJevOlf3C7nxRvxZGpC7aRu89JC+HiWeHrrqLkLdQu/+SAE77/Ggh
         U3EgqOK1iMMRW+AnlLuNaAGQ1ljimMCdSjfE2dVS1dE+Zsn1yXmDnmsMEEKJx5ZNc6zy
         3AwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778165802; x=1778770602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndl3+yfbim4cO8qmcSCh8IE48ZCvWnEZfI+eDsspdGw=;
        b=PSj7TP0Y3mJbeCaWnAS596aKe122TbCi70Sihh6NwDcntmccVxZGN02wKpsnt+9YRG
         7J3UHlQQqzf4Bp9LJc99ICQQyTHwI0A7nDFGxVYa91XMsOK5j63LsT/bcZjwj9pGQ5aa
         6BCVyiMmncKIY8e0XG3guysYsqPSAMQ8KvHxz9TqOi+zVTcxXufC7o9VdxwOgIeT8FCY
         xY8UhTuWr/ThM20u2Sv7l5q9tamx8oCOpedM397fPaCsMkMI/z2bQbBG2EUOdnRhu+x6
         vqt/hQGepCX+nyuGczl+zpzNJdOinHqJv0bT+S0X+nneqMKx8PFVT1ld0Cmy8cTpeseR
         iGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165802; x=1778770602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ndl3+yfbim4cO8qmcSCh8IE48ZCvWnEZfI+eDsspdGw=;
        b=kzkPHWnYZKxrT6DJqqlFpF0//2yDgeaNmg68a8xxjnzc/Joi+8cTMHvPIU+WnSodxE
         pB+agjbKoYuPC/xEDGs3yE1iGDrPyzGVeoTTrlno8E1moNf/thvCOWnZOLOxpSfQuUKU
         /nu+3EhXu06JhE6AaRnmZ1+8f0IQ+F0UPdgHsPM6/wifS3qnWwN2AijVUrdCO58qivE+
         6mw6ubdURGy8fDoUWsi5JZ4bmOOoi5tywXWWhnvRK5cNViNnqaJFET1OZoPtHupH9ynF
         nuqefDYT4rZAjskyIFK+0YYC6Fl5AGSQUB6/4jBZlNbS1d1WcyPkTb9nmJAOn8eSmgtV
         WcFA==
X-Forwarded-Encrypted: i=1; AFNElJ/JfFfWDBlujZIh/0Hu8Nn1zbWVfuUtCqsRUHuMLgjr0DqiBlnoCvDZq2oCFPOaDG3+UQAdVjEmp3Dp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YLQXGRoWBMrwgahQOYFsaGZILw1DKJifqTUm47gW1+r+ipXh
	tQhuc2SG1vWFZpKHVYY90iSJvSC+Ieo2smcQJmnoWlgW1OwkhHFZsmdMA3fbbkwGHiNVQgzg+/N
	PfoKNErRIeq5u+sMTIhioKbOHt63PmAQ=
X-Gm-Gg: AeBDieu7usUvQzvxS8TwH1esAA9/Ss7KxTMb2yHMdROoohQkkAeNQsyOhVrJwdykQ6w
	cYVW0BpY0j9hzOJrDgOFRPy/nTYP78tolAyNU86SsMkQSzyMaxUMgbWpjQQXGOHApoQZk6/whrT
	ZlxX0dG4zlop1Q0121SqslXsO6Z4vPqyRb/vogdJZz42mxXNswiPx36JUC/z+Cw1VyzLuxPmhhE
	Y9sqfaQDqP6BX/+BOWqPw9ZAT1xSdGrfXe+6bJ4d+bEErFgd4czk2QA6ueQkI4Ogs1/pBfOSKKq
	ZJLUWbU30n5qD9liJO/EtHs1Y//VprPl3qWdv15R00G8XSisG8k=
X-Received: by 2002:ac8:58d2:0:b0:50e:4307:37b6 with SMTP id
 d75a77b69052e-51475c4921emr37743311cf.23.1778165802009; Thu, 07 May 2026
 07:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MN0PR19MB6091AA2B594F0E026518E884AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091AA2B594F0E026518E884AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 7 May 2026 18:56:30 +0400
X-Gm-Features: AVHnY4LFH2dNRHafMTXJ36QxVkrIwbUVtI9Whf69J7fZb4oxWrN12tLl7emQ200
Message-ID: <CABjd4YzNQCwtxz+v474vrS0fCO2AZz+bNCQ+4F5afTeAUpad7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
To: Liu Changjie <liucj1228@outlook.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 5:28=E2=80=AFPM Liu Changjie <liucj1228@outlook.com>=
 wrote:
>
> Add the device tree for LCKFB Taishan Pi 3M, a board based on
> the Rockchip RK3576 SoC.

Hi Liu Changjie,

Is the below link the correct source for the schematic for this board?
It would be helpful to add in the commit description. I'm assuming
that it is for the purposes of the comments below.

Link: https://oshwhub.com/li-chuang-kai-fa-ban/project_gzzvrwqn

> Signed-off-by: Liu Changjie <liucj1228@outlook.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3576-lckfb-tspi-3m.dts     | 711 ++++++++++++++++++
>  2 files changed, 712 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index cb55c6b70d0e..dedadc22d15a 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -171,6 +171,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10-pcie1.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb2-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-khadas-edge-2l.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-lckfb-tspi-3m.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-luckfox-omni3576.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-nanopi-m5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-nanopi-r76s.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
> new file mode 100644
> index 000000000000..2eaa6969b33f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
> @@ -0,0 +1,711 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 LCKFB
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3576.dtsi"
> +
> +/ {
> +       model =3D "LCKFB TaishanPi 3M";
> +       compatible =3D "lckfb,tspi-3m-rk3576", "rockchip,rk3576";
> +
> +       aliases {
> +               mmc0 =3D &sdhci;
> +               mmc1 =3D &sdmmc;
> +               mmc2 =3D &sdio;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:1500000n8";
> +       };

What about adc-keys for SARADC channel 1 serving the RECOVERY key?

> +       hdmi-con {
> +               compatible =3D "hdmi-connector";
> +               hdmi-pwr-supply =3D <&vcc5v0_hdmi>;

I'm pretty sure that this is not the power supply, but rather the
driving pin for the FRL mode level shifter. Please refer to the recent
patch series [1] by Cristian.

[1] https://lore.kernel.org/linux-rockchip/177800595582.3294944.15259294512=
505640833.b4-ty@sntech.de/T/#m8c2aca86588ae1e32506c4b6302bb6232c5cd14e

> +               type =3D "a";
> +
> +               port {
> +                       hdmi_con_in: endpoint {
> +                               remote-endpoint =3D <&hdmi_out_con>;
> +                       };
> +               };
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               led-0 {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_HEARTBEAT;
> +                       gpios =3D <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +       };
> +
> +       vcc5v_dcin: regulator-vcc5v-dcin {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v_dcin";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
> +
> +       vcc_sys: regulator-vcc5v0-sys {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_sys";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc5v_dcin>;
> +       };
> +
> +       vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_1v1_nldo_s3";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <1100000>;
> +               regulator-max-microvolt =3D <1100000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +
> +       vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_2v0_pldo_s3";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <2000000>;
> +               regulator-max-microvolt =3D <2000000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +
> +       vcc_3v3_sdcard: regulator-vcc-3v3-sdcard {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_3v3_sdcard";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&vcc_3v3_s3>;

From the schematic, the SD card is powered directly from VCC_3V3_S0.
No need to define a separate regulator, and please make sure you refer
to the right supply (*S0 is a different line from *S3 with a separate
load switch - although they are still enabled together as the EN pin
of the load switch is hard wired to its VIN)

> +       };
> +
> +       vcc5v0_typec_vbus: regulator-vcc5v0-typec-vbus {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_typec_vbus";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc_sys>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&typec_vbus_en>;
> +       };
> +
> +       vcc5v0_hdmi: regulator-vcc5v0-hdmi {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_hdmi";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;

This line goes to the FRL level shifter, so it shouldn't be modeled as
a regulator

> +               vin-supply =3D <&vcc_sys>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hdmi_con_en>;
> +       };
> +
> +       vcc5v0_usb20_host: regulator-vcc5v0-usb20-host {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_usb20_host";
> +               regulator-always-on;
> +               regulator-boot-on;

Do they have to be always-on, boot-on? You can define a Type-A
connector node and list this regulator as its VBUS supply.

> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc_sys>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usb20_host_pwr_en>;
> +       };
> +
> +       vcc5v0_usb30_host: regulator-vcc5v0-usb30-host {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_usb30_host";
> +               regulator-always-on;
> +               regulator-boot-on;

Ditto here.

> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc_sys>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usb30_host_pwr_en>;
> +       };
> +
> +       sdio_pwrseq: sdio-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_poweren_gpio>;
> +               post-power-on-delay-ms =3D <200>;
> +               reset-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;

What about the 32 kHz clock? See also below under I2C2 - you'll need
an RTC node which is in fact easy to add.

> +       };
> +};
> +
> +&combphy1_psu {
> +       status =3D "okay";
> +};
> +
> +&cpu_b0 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b1 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b2 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b3 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_l0 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l1 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};

Don't you want to add &gmac0? And wire it up to the MAE0621A-Q3C RGMII
PHY (you'll probably have to rely on the generic PHY driver). You'll
probably also need to configure the GMAC for RGMII clock input from
the PHY, which is unlike other RK3576 boards but there are other
Rockchip-based examples upstream.

> +&hdmi {
> +       status =3D "okay";
> +};
> +
> +&hdmi_in {
> +       hdmi_in_vp0: endpoint {
> +               remote-endpoint =3D <&vp0_out_hdmi>;
> +       };
> +};
> +
> +&hdmi_out {
> +       hdmi_out_con: endpoint {
> +               remote-endpoint =3D <&hdmi_con_in>;
> +       };
> +};

What about &hdmi_sound? And &sai6 for it to work.

> +&hdptxphy {
> +       status =3D "okay";
> +};
> +
> +&i2c1 {
> +       status =3D "okay";
> +
> +       pmic@23 {
> +               compatible =3D "rockchip,rk806";
> +               reg =3D <0x23>;
> +               #gpio-cells =3D <2>;
> +               gpio-controller;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <6 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pmic_pins
> +                            &rk806_dvs1_null
> +                            &rk806_dvs2_null
> +                            &rk806_dvs3_null>;
> +               system-power-controller;
> +               vcc1-supply =3D <&vcc_sys>;
> +               vcc2-supply =3D <&vcc_sys>;
> +               vcc3-supply =3D <&vcc_sys>;
> +               vcc4-supply =3D <&vcc_sys>;
> +               vcc5-supply =3D <&vcc_sys>;
> +               vcc6-supply =3D <&vcc_sys>;
> +               vcc7-supply =3D <&vcc_sys>;
> +               vcc8-supply =3D <&vcc_sys>;
> +               vcc9-supply =3D <&vcc_sys>;
> +               vcc10-supply =3D <&vcc_sys>;
> +               vcc11-supply =3D <&vcc_2v0_pldo_s3>;
> +               vcc12-supply =3D <&vcc_sys>;
> +               vcc13-supply =3D <&vcc_1v1_nldo_s3>;
> +               vcc14-supply =3D <&vcc_1v1_nldo_s3>;
> +               vcca-supply =3D <&vcc_sys>;
> +
> +               rk806_dvs1_null: dvs1-null-pins {
> +                       pins =3D "gpio_pwrctrl1";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               rk806_dvs2_null: dvs2-null-pins {
> +                       pins =3D "gpio_pwrctrl2";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               rk806_dvs3_null: dvs3-null-pins {
> +                       pins =3D "gpio_pwrctrl3";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               regulators {
> +                       vdd_cpu_big_s0: dcdc-reg1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-enable-ramp-delay =3D <400>;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-name =3D "vdd_cpu_big_s0";
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_npu_s0: dcdc-reg2 {
> +                               regulator-boot-on;
> +                               regulator-enable-ramp-delay =3D <400>;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-name =3D "vdd_npu_s0";
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_cpu_lit_s0: dcdc-reg3 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-name =3D "vdd_cpu_lit_s0";
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
750000>;
> +                               };
> +                       };
> +
> +                       vcc_3v3_s3: dcdc-reg4 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vcc_3v3_s3";
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
3300000>;
> +                               };
> +                       };
> +
> +                       vdd_gpu_s0: dcdc-reg5 {
> +                               regulator-boot-on;
> +                               regulator-enable-ramp-delay =3D <400>;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <900000>;
> +                               regulator-name =3D "vdd_gpu_s0";
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
850000>;
> +                               };
> +                       };
> +
> +                       vddq_ddr_s0: dcdc-reg6 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-name =3D "vddq_ddr_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_logic_s0: dcdc-reg7 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <800000>;
> +                               regulator-name =3D "vdd_logic_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcc_1v8_s3: dcdc-reg8 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcc_1v8_s3";
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       vdd2_ddr_s3: dcdc-reg9 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-name =3D "vdd2_ddr_s3";
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_ddr_s0: dcdc-reg10 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <1200000>;
> +                               regulator-name =3D "vdd_ddr_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca_1v8_s0: pldo-reg1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcca_1v8_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca1v8_pldo2_s0: pldo-reg2 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcca1v8_pldo2_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda_1v2_s0: pldo-reg3 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1200000>;
> +                               regulator-max-microvolt =3D <1200000>;
> +                               regulator-name =3D "vdda_1v2_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca_3v3_s0: pldo-reg4 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vcca_3v3_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vccio_sd_s0: pldo-reg5 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vccio_sd_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca1v8_pldo6_s3: pldo-reg6 {

This regulator is not listed on the schematic and doesn't seem to be
used. Delete?

> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcca1v8_pldo6_s3";
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       vdd_0v75_s3: nldo-reg1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <750000>;
> +                               regulator-max-microvolt =3D <750000>;
> +                               regulator-name =3D "vdd_0v75_s3";
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
750000>;
> +                               };
> +                       };
> +
> +                       vdda_ddr_pll_s0: nldo-reg2 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <850000>;
> +                               regulator-max-microvolt =3D <850000>;
> +                               regulator-name =3D "vdda_ddr_pll_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda0v75_hdmi_s0: nldo-reg3 {

This one is called just VDDA_HDMI_S0 (without 0v75) on the schematic -
consider renaming?

> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <837500>;
> +                               regulator-max-microvolt =3D <837500>;
> +                               regulator-name =3D "vdda0v75_hdmi_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda_0v85_s0: nldo-reg4 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <850000>;
> +                               regulator-max-microvolt =3D <850000>;
> +                               regulator-name =3D "vdda_0v85_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda_0v75_s0: nldo-reg5 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <750000>;
> +                               regulator-max-microvolt =3D <750000>;
> +                               regulator-name =3D "vdda_0v75_s0";
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c2m0_xfer>;
> +       status =3D "okay";
> +
> +       usbc0: usb-typec@22 {
> +               compatible =3D "fcs,fusb302";
> +               reg =3D <0x22>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&fusb302_int>;
> +               vbus-supply =3D <&vcc5v0_typec_vbus>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +
> +                               usbc0_role_sw: endpoint {
> +                                       remote-endpoint =3D <&usb_drd0_ro=
le_switch>;
> +                               };
> +                       };
> +               };
> +
> +               connector {
> +                       compatible =3D "usb-c-connector";
> +                       data-role =3D "dual";
> +                       label =3D "USB-C";
> +                       power-role =3D "dual";

It's definitely not dual-role. Your VBUS is the output of a load
switch, not routed to any consumers on board. Is the load switch even
reverse current blocking? Consider changing to "source".

> +                       sink-pdos =3D <PDO_FIXED(5000, 1000, PDO_FIXED_US=
B_COMM)>;

Don't think this is helpful for your board.

> +                       source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_=
USB_COMM)>;
> +                       try-power-role =3D "sink";

This doesn't make much sense for your board either. Just keep it
source-only, which would match your hardware.

> +               };
> +       };

Don't you want to define the HYM8563 RTC which sits on the same I2C
bus? You need its 32kHz clock output for the WiFi/BT module to work
correctly.

> +};

What about &i2c3 for the ES8388 audio codec? And &sai1 for it to work.

What about &pcie0 for the miniPCIe slot? And &combphy0_ps for it to
work, along with a fixed regulator to model the 3v3 DCDC buck
converter controlled by the minipcie_pwr_en pin a.k.a. &gpio1 RK_PD6.

> +&pinctrl {
> +       hdmi {
> +               hdmi_con_en: hdmi-con-en {
> +                       rockchip,pins =3D <4 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
> +       wireless-wlan {
> +               wifi_host_wake_irq: wifi-host-wake-irq {
> +                       rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +
> +               wifi_poweren_gpio: wifi-poweren-gpio {
> +                       rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +       };
> +
> +       usb {
> +               fusb302_int: fusb302-int {
> +                       rockchip,pins =3D <0 RK_PB4 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +
> +               typec_vbus_en: typec-vbus-en {
> +                       rockchip,pins =3D <0 RK_PB6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               usb20_host_pwr_en: usb20-host-pwr-en {
> +                       rockchip,pins =3D <2 RK_PB5 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               usb30_host_pwr_en: usb30-host-pwr-en {
> +                       rockchip,pins =3D <0 RK_PC3 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +};
> +
> +&saradc {
> +       vref-supply =3D <&vcca_1v8_s0>;

The schematic says VCCA_1V8_PLDO2_S0, which is a different regulator.

> +       status =3D "okay";
> +};
> +
> +&sdhci {
> +       bus-width =3D <8>;
> +       full-pwr-cycle-in-suspend;
> +       mmc-hs400-1_8v;
> +       mmc-hs400-enhanced-strobe;
> +       no-sd;
> +       no-sdio;
> +       non-removable;
> +       status =3D "okay";

It might be good to list the supplies explicitly (vcc_3v3_s3 for vcc,
vcc_1v8_s3 for vccq)

> +};
> +
> +&sdio {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       bus-width =3D <4>;
> +       cap-sd-highspeed;
> +       cap-sdio-irq;
> +       keep-power-in-suspend;
> +       max-frequency =3D <150000000>;

Is the default frequency unstable? This might warrant a comment.

> +       mmc-pwrseq =3D <&sdio_pwrseq>;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sdmmc1m0_bus4 &sdmmc1m0_clk &sdmmc1m0_cmd>;

Don't repeat the defaults which are already set in rk3576.dtsi

> +       sd-uhs-sdr104;
> +       status =3D "okay";
> +
> +       wifi@1 {
> +               compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
> +               reg =3D <1>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names =3D "host-wake";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_host_wake_irq>;
> +       };
> +};
> +
> +&sdmmc {
> +       bus-width =3D <4>;
> +       cap-mmc-highspeed;
> +       cap-sd-highspeed;
> +       cd-gpios =3D <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
> +       disable-wp;
> +       no-mmc;
> +       no-sdio;
> +       sd-uhs-sdr104;
> +       vmmc-supply =3D <&vcc_3v3_sdcard>;
> +       vqmmc-supply =3D <&vccio_sd_s0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det
> +                    &sdmmc0_bus4>;

Might be good to add a comment above this line saying that the
&sdmmc_pwren is not wired up on this board, and instead the SD card
power is hard wired, thus it's dropped from the pinctrl group.

> +       status =3D "okay";
> +};
> +
> +&tsadc {
> +       status =3D "okay";
> +};
> +
> +&u2phy0 {
> +       status =3D "okay";
> +};
> +
> +&u2phy0_otg {
> +       rockchip,typec-vbus-det;

Do you need this? You have FUSB302 to negotiate data roles and request
them explicitly, so no need to rely on VBUS sensing. Furthermore, your
VBUS is not even routed to this PHY, so this doesn't make sense with
the hardware you have.

> +       status =3D "okay";
> +};
> +
> +&u2phy1 {
> +       status =3D "okay";
> +};
> +
> +&u2phy1_otg {
> +       dr_mode =3D "host";
> +       phy-supply =3D <&vcc5v0_usb20_host>;

It's not a PHY supply, but a VBUS supply for the port. Please reflect
that accordingly.

> +       status =3D "okay";
> +};
> +
> +&uart0 {
> +       pinctrl-0 =3D <&uart0m0_xfer>;

Isn't that the default pinctrl for this UART?

> +       status =3D "okay";
> +};

How about &uart6 with m1 pin config including RTS/CTS and a Bluetooth
node under it?

> +&usbdp_phy {
> +       status =3D "okay";
> +};
> +
> +&usb_drd0_dwc3 {
> +       dr_mode =3D "otg";

Don't repeat the defaults which are already set in rk3576.dtsi

> +       snps,dis_u2_susphy_quirk;
> +       snps,dis_u3_susphy_quirk;
> +       snps,parkmode-disable-hs-quirk;
> +       snps,parkmode-disable-ss-quirk;

Do you need all those quirks? Does it work without them?

> +       usb-role-switch;
> +       status =3D "okay";
> +
> +       port {
> +               usb_drd0_role_switch: endpoint {
> +                       remote-endpoint =3D <&usbc0_role_sw>;

This port schema won't let you enable DisplayPort AltMode over the
same Type-C connector - please see Sebastian's revised schema at [2]

[2] https://lore.kernel.org/linux-rockchip/20260428-rockchip-usbdp-cleanup-=
v4-1-7775671ece22@collabora.com/

> +               };
> +       };
> +};
> +
> +&usb_drd1_dwc3 {
> +       dr_mode =3D "host";
> +       snps,dis_u2_susphy_quirk;

Do you need all those quirks? Does it work without them?

> +       status =3D "okay";
> +};
> +
> +&vop {
> +       status =3D "okay";
> +};
> +
> +&vop_mmu {
> +       status =3D "okay";
> +};
> +
> +&vp0 {
> +       vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> +               reg =3D <ROCKCHIP_VOP2_EP_HDMI0>;
> +               remote-endpoint =3D <&hdmi_in_vp0>;
> +       };
> +};
> --
> 2.47.3

Best regards,
Alexey
