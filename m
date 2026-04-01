Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB553B895F
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037080; cv=pass; b=qYxfpWKrszWu/3BMGOkZR2EhNIcXGoWl+atw+uauD9tEyweGkZKuh3Z0lYNkZDKt53sZGNIV+limW7KE9JS9ipcRazseTWYVH0fL3uyJzirzTnDNylJ7Lky05WLV3NcPFEkx24PUG4BmT6j87I4C5Tzh93mmDsDvYFUhoNePNBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037080; c=relaxed/simple;
	bh=XKPiYSIzgb6NVeZlS8C8wzTlmjcPCD+6SxVz/Zj3e9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TG68HepQ+yVaFnxAPK/VDi84xlccdGmMH9MzJpwaQGNfAHyv/q+qQb0l2eJjjRpkTvXNYoUyQlG74HnibdVKhLUVscyU6Ar5joVJf/0gqsX6diVXT/fUGZvQ7ReWb8ILsTk5Fv8lRYyP9JSJH8u8A7M80SnZYsYMVu8hSy13+a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGnntptj; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGnntptj"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a016799d2cso44763456d6.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775037078; cv=none;
        d=google.com; s=arc-20240605;
        b=fQ1iEqiL3MapRIZOa4cBglwjNMX4awCYbWrKAchp3BLnYzd3go2W+l9gZGCMU3lh1j
         nDwYmKjd5KCuwkk9jDP0r5iizVelMyZbqTQz8kMfhjB8kIWm4fRh0Y7LDPe+ugZpDsu/
         pX9Z7jp0h1dnKbPeonlpF9Ghjh0/qCe3oobWBCWXiyapL9PV96+lT/+4RwI90ZtVEweF
         zaX4nStOr3xPFDmbmaI+XU5nEBmIimC6RkTHVZQfuo2LyWWFF7ClBECr8F3BaunQMx3t
         BeZic0xQ+1/LnIeH1IrR6XqjlK5kFxMe3RnxOHh6pIq6LHAMyWa5L6txxvYLumTTarQO
         kw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z3jWD8KB9axY08EbcL/Wu3ONW/UD+QA67EncL91vtpI=;
        fh=w1K/XzR/PRCIB8+euMpvphnFfvhO0YOXMYMCGfq60AU=;
        b=S40UdihFUI9AHB/ncnWwsXN8VF228PIfcLUqRhVLeJsve96iuF/bEHtNelQXiNbfD9
         hT8ENsgYkU6b/5FupznajcuedTMBI0RtLq8c8t+XesxCff28hRJud2ad8cQjbSd9WuLA
         vvUvnxUOU3rf8LzQff5cFw44J9GITe5CL2BR+BXSUT5c5fAHHhEsg6dAAyRV5q20UOao
         FX04XzJIpD792ueD5SQRn3mFsIF3PQZRpQ3fpHjHUGKzSHmoosk2zXy1/Vn9zhEVrDFg
         ao598O3p2Ue1mGL6qOhJeLVEk1xUy/ODEG3MsSHRQ/p4ni46Pm/UfYm3J3hOEa6F2Ax9
         0AOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775037078; x=1775641878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3jWD8KB9axY08EbcL/Wu3ONW/UD+QA67EncL91vtpI=;
        b=fGnntptjEws2hKMi0Tyo1l+TMTyrHIEg57bpEt2XXnpYS5QXJnlvaQZmlPB7vRUwlD
         a5qJynKSy2hoVR2FGcAYIRYSIxE8xF/UhCqzMwkIEK0Uj6N4QbZ9wGb6RzKbZMFpUMjT
         glOrTRZORu66CeOmba5E61E9r5y3jr6bARgVmsJJMHtrSUlWADiBAwp1psbase1BgRLW
         of17UGVEWtRnBLB+AT4to9EczQ9uFpDSz739ippoh4jBjw8ktiwo20Odkg8i7VwhJohh
         qqbuvfuFVzEtLgzfRgd61/lTbx9EHPLlrq/EDKa5nhczmxgbV3gtYErp+rLjM6a81iol
         dpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037078; x=1775641878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3jWD8KB9axY08EbcL/Wu3ONW/UD+QA67EncL91vtpI=;
        b=SQclYIzdudwb+HfYEPKiUjgpJjSVOdr4PYUAn71JpLR9QtLfpLL+iwZzkmi1zWOqjN
         LVtROL9OBWSJB3rkqsJAOZtj09drS/iNm/oaLM1a1qH12NpBXOuks/7NBp9MWr3GYv6l
         MXGkrME82eDdp7Rs4bbf3TugGwlUgaRw7mrKM9JF1NHI6DgJ9fRCoMpXAfDGbVsT9EGX
         YKycggnf1J8MsCRuNNbZ/69xeI+tA331WjIlDsSltCrMp2MSe3NA7cmmTxeu8xEKkMuS
         ++EyLFM2ZN2jsZ3TSm8GMYYw+rsjyrcBEGzIAiirjS+wQqqEvzpgKodZUnblKsob4gb5
         bZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCWzZV1D6l+bVhV+WCuQ1I9qrcpc6wGAVz/FRbIHUdF07IZOvEXDbb3nrQNZx5SNr4dniLha1vWTZ2GF@vger.kernel.org
X-Gm-Message-State: AOJu0YxVuQ2zsKx8mK8l5IKy16v9vuHov5O6p/goEAv2TF9FNYwTu8n4
	BP6czlYFnvO51YKIroVrJPGMltUxblxsErPvI8Ze4XYWuS+1FY+aXIc/d+cJ/bcBnevuT8yeFg2
	aJElVAqB7gZw2W2wDW2sR9QUskMltqRo=
X-Gm-Gg: ATEYQzxnwOQ/yYTr0p1Wi53eo0qPlew/cZdUcjDEc7hWJIq6hP2wy53fx/wyjGdOBTZ
	DDYAHoJ+AKeNy8yf2FbFkZYsNTZAWp8HU0dw/px7f3F0ZqleoEZE298KE+qkHN5tbIS4YjTtNbp
	RZZJsTPpNMClVTtlyNzb2nuB9yPHKmdA7wifTBdCjB08HsOM2YNrnLDbbEV+MtaeeZr63br0TtV
	WSp/nUyxtAgh6LpqRiYm8OoDimE0jtqu7JmSMXemsh+0kgLHxsvc4eD6gJ7eBdNzryw45O8AkJ3
	yHfhAoWHnlk11m8W8g==
X-Received: by 2002:a05:6214:dca:b0:8a1:6509:9cbf with SMTP id
 6a1803df08f44-8a43ac4811emr40231156d6.52.1775037077979; Wed, 01 Apr 2026
 02:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401010707.2584962-1-dennis@ausil.us> <20260401010707.2584962-4-dennis@ausil.us>
In-Reply-To: <20260401010707.2584962-4-dennis@ausil.us>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 1 Apr 2026 13:51:08 +0400
X-Gm-Features: AQROBzDKP_DuLbzOy_SddOBUTgbRIK7NqHrgEOy3ruL0UsrfbQKg5eUwC1Wr0Tw
Message-ID: <CABjd4YyVRExX4gTCZQj2EEht_022ojS58DrYjntuC6H875ewpA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 5:07=E2=80=AFAM <dennis@ausil.us> wrote:
>
> From: Dennis Gilmore <dennis@ausil.us>
>
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
>
> - eMMC module, you can optionally solder a SPI NOR in place and turn
>  off the eMMC
> - PCIe-attached NIC (pcie2x1l1)
> - PCIe NVMe slot (pcie2x1l2)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth
> - es8388 audio
> - USB 2.0 and USB 3.0
>
> Vendors description and links to schematics available:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details=
/Orange-Pi-5-Pro.html
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 320 ++++++++++++++++++
>  2 files changed, 321 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.d=
ts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index 4d384f153c13..c99dca2ae9e7 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c.d=
tb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5-pro.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-cm5-base.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-radxa-cm5-io.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-roc-pc.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> new file mode 100644
> index 000000000000..7ab68245d2c6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3588s-orangepi-5.dtsi"
> +
> +/ {
> +       model =3D "Xunlong Orange Pi 5 Pro";
> +       compatible =3D "xunlong,orangepi-5-pro", "rockchip,rk3588s";
> +
> +       aliases {
> +               mmc0 =3D &sdhci;
> +               mmc1 =3D &sdmmc;
> +               mmc2 =3D &sdio;
> +       };
> +
> +       analog-sound {
> +               compatible =3D "simple-audio-card";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hp_detect>;
> +               simple-audio-card,bitclock-master =3D <&masterdai>;
> +               simple-audio-card,format =3D "i2s";
> +               simple-audio-card,frame-master =3D <&masterdai>;
> +               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_AC=
TIVE_HIGH>;
> +               simple-audio-card,mclk-fs =3D <256>;
> +               simple-audio-card,name =3D "rockchip,es8388";
> +               simple-audio-card,routing =3D
> +                       "Headphones", "LOUT1",
> +                       "Headphones", "ROUT1",
> +                       "LINPUT1", "Microphone Jack",
> +                       "RINPUT1", "Microphone Jack",
> +                       "LINPUT2", "Onboard Microphone",
> +                       "RINPUT2", "Onboard Microphone";
> +               simple-audio-card,widgets =3D
> +                       "Microphone", "Microphone Jack",
> +                       "Microphone", "Onboard Microphone",
> +                       "Headphone", "Headphones";
> +
> +               simple-audio-card,cpu {
> +                       sound-dai =3D <&i2s2_2ch>;
> +               };
> +
> +               masterdai: simple-audio-card,codec {
> +                       sound-dai =3D <&es8388>;
> +                       system-clock-frequency =3D <12288000>;
> +               };
> +       };
> +
> +       pwm-leds {
> +               compatible =3D "pwm-leds";
> +
> +               led-0 {
> +                       color =3D <LED_COLOR_ID_BLUE>;
> +                       function =3D LED_FUNCTION_STATUS;
> +                       linux,default-trigger =3D "heartbeat";
> +                       max-brightness =3D <255>;
> +                       pwms =3D <&pwm15 0 1000000 0>;
> +               };
> +
> +               led-1 {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_ACTIVITY;
> +                       linux,default-trigger =3D "heartbeat";
> +                       max-brightness =3D <255>;
> +                       pwms =3D <&pwm3 0 1000000 0>;
> +               };
> +       };
> +
> +       fan: pwm-fan {
> +               compatible =3D "pwm-fan";
> +               #cooling-cells =3D <2>;
> +               cooling-levels =3D <0 50 100 150 200 255>;
> +               fan-supply =3D <&vcc5v0_sys>;
> +               pwms =3D <&pwm2 0 20000000 0>;
> +       };
> +
> +       vcc3v3_phy1: regulator-vcc3v3-phy1 {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> +               regulator-boot-on;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "vcc3v3_phy1";
> +               startup-delay-us =3D <50000>;
> +               vin-supply =3D <&vcc_3v3_s3>;
> +       };
> +
> +       vcc5v0_otg: regulator-vcc5v0-otg {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> +               regulator-max-microvolt =3D <5000000>;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-name =3D "vcc5v0_otg";
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       sdio_pwrseq: sdio-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               clocks =3D <&hym8563>;
> +               clock-names =3D "ext_clock";
> +               post-power-on-delay-ms =3D <200>;
> +               reset-gpios =3D <&gpio0 RK_PD0 GPIO_ACTIVE_LOW>;
> +       };
> +
> +       typea_con: usb-a-connector {
> +               compatible =3D "usb-a-connector";
> +               data-role =3D "host";
> +               label =3D "USB3 Type-A";
> +               power-role =3D "source";
> +               vbus-supply =3D <&vcc5v0_otg>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                               typea_con_hs: endpoint {
> +                               };
> +                       };

Hi Dennis,

You don't have to define ports if you aren't using them - i.e. here
the endpoints are not linked up to their remote counterparts, so they
don't do anything. If it works for you this way that probably means
you can drop the whole ports subnode altogether and add it later if a
need arises.

> +                       port@1 {
> +                               reg =3D <1>;
> +                               typea_con_ss: endpoint {
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c1m4_xfer>;
> +       status =3D "okay";
> +};
> +
> +&i2c3 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c3m0_xfer>;
> +       status =3D "okay";
> +
> +       es8388: audio-codec@11 {
> +               compatible =3D "everest,es8388", "everest,es8328";
> +               reg =3D <0x11>;
> +               #sound-dai-cells =3D <0>;
> +               AVDD-supply =3D <&vcc_3v3_s0>;
> +               DVDD-supply =3D <&vcc_1v8_s0>;
> +               HPVDD-supply =3D <&vcc_3v3_s0>;
> +               PVDD-supply =3D <&vcc_3v3_s0>;
> +               assigned-clock-rates =3D <12288000>;
> +               assigned-clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> +               clocks =3D <&cru I2S2_2CH_MCLKOUT>;

Your codec is the clock master, so it would be better for it to
request the pin config for the mclk pin, as it's the real user of the
master clock (not the i2s2 node). See also below

> +       };
> +};
> +
> +&i2c4 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c4m3_xfer>;
> +       status =3D "okay";
> +};
> +
> +&i2s2_2ch {
> +       pinctrl-0 =3D <&i2s2m1_lrck &i2s2m1_mclk &i2s2m1_sclk

Looks like &i2s2m1_mclk belongs in &es8388 instead, not here.

> +                    &i2s2m1_sdi &i2s2m1_sdo>;
> +       status =3D "okay";
> +};
> +
> +&package_thermal {
> +       polling-delay =3D <1000>;
> +
> +       cooling-maps {
> +               map0 {
> +                       trip =3D <&package_fan0>;
> +                       cooling-device =3D <&fan THERMAL_NO_LIMIT 1>;
> +               };
> +
> +               map1 {
> +                       trip =3D <&package_fan1>;
> +                       cooling-device =3D <&fan 2 THERMAL_NO_LIMIT>;
> +               };
> +       };
> +
> +       trips {
> +               package_fan0: package-fan0 {
> +                       hysteresis =3D <2000>;
> +                       temperature =3D <55000>;
> +                       type =3D "active";
> +               };
> +
> +               package_fan1: package-fan1 {
> +                       hysteresis =3D <2000>;
> +                       temperature =3D <65000>;
> +                       type =3D "active";
> +               };
> +       };
> +};
> +
> +/* NVMe */
> +&pcie2x1l1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pcie30x1m1_1_clkreqn &pcie30x1m1_1_waken>;
> +       reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> +       supports-clkreq;
> +       vpcie3v3-supply =3D <&vcc_3v3_s3>;
> +       status =3D "okay";
> +};
> +
> +/* NIC */
> +&pcie2x1l2 {
> +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> +       vpcie3v3-supply =3D <&vcc3v3_phy1>;
> +       status =3D "okay";
> +};
> +
> +&pinctrl {
> +       bluetooth {
> +               bt_wake_gpio: bt-wake-pin {
> +                       rockchip,pins =3D <0 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               bt_wake_host_irq: bt-wake-host-irq {
> +                       rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +       };
> +
> +       usb {
> +               vcc5v0_otg_en: vcc5v0-otg-en {
> +                       rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
> +       wlan {
> +               wifi_host_wake_irq: wifi-host-wake-irq {
> +                       rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +       };
> +};
> +
> +&pwm15 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm15m2_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm2m1_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm3 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm3m2_pins>;
> +       status =3D "okay";
> +};
> +
> +&sdhci {
> +       status =3D "okay";
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
> +       mmc-pwrseq =3D <&sdio_pwrseq>;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       sd-uhs-sdr104;
> +       status =3D "okay";
> +
> +       ap6256: wifi@1 {
> +               compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
> +               reg =3D <1>;
> +               interrupt-names =3D "host-wake";
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_host_wake_irq>;
> +       };
> +};
> +
> +&uart9 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
> +       uart-has-rtscts;
> +       status =3D "okay";
> +
> +       bluetooth {
> +               compatible =3D "brcm,bcm4345c5";
> +               clocks =3D <&hym8563>;
> +               clock-names =3D "lpo";
> +               device-wakeup-gpios =3D <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
> +               interrupt-names =3D "host-wakeup";
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
> +               max-speed =3D <1500000>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&bt_wake_host_irq &bt_wake_gpio>;
> +               shutdown-gpios =3D <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
> +               vbat-supply =3D <&vcc_3v3_s3>;
> +               vddio-supply =3D <&vcc_1v8_s3>;
> +       };
> +};
> +
> +&usb_host0_xhci {
> +       dr_mode =3D "host";
> +};
> +
> +&usbdp_phy0 {
> +       rockchip,dp-lane-mux =3D <0 1>;

You probably also need a definition for your DP to HDMI bridge and the
HDMI type A connector. Do you get image output on the HDMI port, and
does the hotplug work? I don't see you enabling the &dp0 node with its
pinctrl and ports.

It's okay to leave them out in the initial submission if you wish, but
then it's best mentioned in the commit description.

Best regards,
Alexey
