Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973E93D47B2
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243469; cv=pass; b=oM+F2+kAa/3CNRTSyXJxaCvH4NC3d/WGo3QzKyZPeiwMd3jxRXzNoRXgaNQOUrcIWbp15XNBZzvKYwEFVD7VYUSFbXYRS7r/5kAqeHy2WcNt3u2M33xkLvX0foXcNtL6VcozJlyPEIQJX4qNsl71x8srUfhGQqTpUx89avkZXvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243469; c=relaxed/simple;
	bh=RsRRikMDvWMxQ3E4ivYFFXTltR6O1bpaB9GI+ei7GWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScdBNvKKL/HB0W/AFcQfWkXI6jMF3TZeN5Qn95fwRVcVWYKWwwDVVCodrPkWTqvuCY4B/1xYHOpPwA581DRaE+cCTjvyX2ZfLaLS83WOCRmOVUYcWwjmCRXtoGFNl7wIYSgg9BoMO2ORZytr3JKo8iowrIfY7kcUF1kCwozvAtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/8uuGlr; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/8uuGlr"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8d68f702851so986394985a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 01:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776243466; cv=none;
        d=google.com; s=arc-20240605;
        b=O+vF+JiwU5sJJznG9HdPTJnDehe9e6gY7ZQEEFSTWULA3lnJ0ZwiPatOgtmON9PR8i
         EmvSwKjnFcdILFBzcn36sgzPRHGpmq4sdXnVoX6aSzStzQnvEimUpwG4LRFa8UsiacgC
         VS/wt+ZXGfriRRjFb7QsBHdMKMk4MC6a8qf36JSq/UhkMb4O+1+0olh2WIEFd4bYmPWH
         K9FkJxprIQP+6QlYZAyCtaABh8Fr2yz7L9AfSSBPviXYZOzkn8Ykha/yC52Dv1wGZqAQ
         t6S72r+7iST2b0K+Vq9u1owsCmCIo+eQZIizn16qIMHj7jh0sV/Ug1VXUtblAViI/qeT
         RGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Jjqr84WRLYmTsvMPyUGhcd+41sBX1COVuLB9jY1N90=;
        fh=ApjWQMVsy5J+V++K5qTQQkjKAEMjcfcCf+khgbCGLqM=;
        b=Gbf/De0fOAwqlzABX9OcuWX669prgE90AVSBIZ5kU1Q1JFrjmYi5dNCtaJah2dBUJR
         G/8W0pBXDakii5FVne3U7epEWiTjfWBOQflbQY62gXuwl/djSQwAarUVMieRVYkvLIqZ
         MrzwQvclnp8XxzDIE+s1nNC0yhlV4BG/ivWOym0zf0I8YwO/32IbuVyZeY31jAlu8v9O
         ebAu/U7zZs3vNXs3MUZcp51Vx2rAzmYgBXVJ6QLo48SrzzsCMmwgQIvFG9RsPtRe7KH0
         eaKcMFCrGIfNPb9m0sb7HUgVvDoIl/Lf6SjCFfFTdf6uyqeFX9+dPK4s+4hFSUinVP8Q
         giAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776243466; x=1776848266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Jjqr84WRLYmTsvMPyUGhcd+41sBX1COVuLB9jY1N90=;
        b=o/8uuGlrHIIhnGlwgRvYOGh6wcva6hpDoXqx95rCaDgQkRQRqhTD7Qfxzw6Xfqj82S
         tUeY994eG5K7OlPc2RH5ad4o95PZv/U79dBWM8Nm6y307Rbz3CShz9+sMTSBzYVKtTfU
         UGLwqFpUbv0vHl7IYvI1MB1iBz2baIVtyzftPbRXu+5IUWwjaiPHDuCWUKF98ZEKrFb2
         a09jGFoxtlCixRD33KkKraIGc0MFdQk1SvDxVCNstVFHH9kSbyLA0PNiTVIWWtVUSWf3
         542k4yYj6pgKUWlO8bZvmbrDUO5wAddFHz31Ph3yNQAlz502WfhGmyCPK4lJlUU5t8+1
         xMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243466; x=1776848266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Jjqr84WRLYmTsvMPyUGhcd+41sBX1COVuLB9jY1N90=;
        b=OMYsKHzCyVS091+rZcQuoZBEgTnz+K2GuhfNSDtgfKVNXwGAlk4KMb0DYdp2374jRE
         s8bkim9VF0cy6a/5FQHLYfXGorcjYgZrqv0FVgwx+dgxg4V7UWSAbzSgJIIzFn57EttZ
         elvTvmcaIydYRsJEfI9ypfkFt8aWn0m2UsDkSZBYVC7SJq7SbjTMCjECB2iY90RolTA2
         fi1wDQo5G7/CTAoyqbOuD06odLrIBKv054DmElyYcUPfj+dA/bNCx7KFzH4VNzpmq1SZ
         pM4kkqoojwTnvJhdS0kC+WgP2clmwoxbTfkpPct5aRyU0rdGmI7YNQ0Gmkqoap2Wgb3M
         RwYg==
X-Forwarded-Encrypted: i=1; AFNElJ/HQ7IBMyf1/TwgM+Vny6yS5WIRbd7cPcL8by4LDgB/rrzKAUUBG33skuL5ScVAg7+T4DCy7tvivXVB@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFQdQI6351Ta1fZeOS2cRz0+QwLQ5NpruaAvDsEsGvGnvwJgp
	Jzc587U9aa8CXeAFfbcP/cGii/rqHImFCfdtoJ4BZYsSOdSOK1zvG4BmTSfsiO+/cq2MypOOrEm
	+yzE9jj1AhoZkMJqIemeMsa+i0uyNvLs=
X-Gm-Gg: AeBDietSbeLWe2lWXiOMOl/9uY7oIlqWWhJ/nHfcGFOx68LCR8SfPVY38cWCFKmvzih
	WelV/K1+9tMHFpHONwr5w8xpY77jGK7kW+p4Dat1sNmfs1+NXSyJYgtMR8/iQJxgRHSKIquXEKM
	H33WJsi80PdXCdPYODewgFicvjD/w5I9ydMYpjsQtUpZXfDd8ocOtBJYgJsyY0TVIhegGZkx02T
	HGcW9XVz5SIRb9DuVlhd3mFdYqhX8IF8PvfM9OXVkB7kapbZomMEW/ed7nqaEsp2iH1TKv7Aurd
	u7yCgOg=
X-Received: by 2002:a05:622a:2a0c:b0:509:14f6:9841 with SMTP id
 d75a77b69052e-50dd5b7c649mr291665491cf.31.1776243466376; Wed, 15 Apr 2026
 01:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414214104.1363987-1-dennis@ausil.us> <20260414214104.1363987-7-dennis@ausil.us>
In-Reply-To: <20260414214104.1363987-7-dennis@ausil.us>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 15 Apr 2026 12:57:31 +0400
X-Gm-Features: AQROBzBEtWJOTHuxeBGjPJqMt4Wcq_1Spd5oLgN9jC4wNkqJlKqoy-oCTRuq_9Q
Message-ID: <CABjd4YxfeCfRUneZfFx31WmQOexO0gcH8yHPQmRY38GKNk=Ztg@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Dennis Gilmore <dennis@ausil.us>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, FUKAUMI Naoki <naoki@radxa.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hsun Lai <i@chainsx.cn>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>, 
	John Clark <inindev@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Peter Robinson <pbrobinson@gmail.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Robert Foss <rfoss@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 1:41=E2=80=AFAM Dennis Gilmore <dennis@ausil.us> wr=
ote:
>
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
>
> - eMMC module, you can optionally solder a SPI NOR in place and turn
>  off the eMMC
> - PCIe-attached NIC (pcie2x1l1)
> - PCIe NVMe slot (pcie2x1l2)

Hi Dennis,

Sashiko noticed [1] that the controller names here do not match the
nodes/comments you have in the patch body - which ones are correct?

[1] https://sashiko.dev/#/patchset/20260414214104.1363987-1-dennis%40ausil.=
us

> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth
> - es8388 audio
> - USB 2.0 and USB 3.0
> - Two HDMI ports, the second is connected to the SoC's DP controller
>   driven through a Lontium LT8711UXD bridge.
>
> Vendors schematics are available at:
> https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/view
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 442 ++++++++++++++++++
>  2 files changed, 443 insertions(+)
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
> index 000000000000..61462c66753d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> @@ -0,0 +1,442 @@
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
> +       hdmi1-con {
> +               compatible =3D "hdmi-connector";
> +               label =3D "HDMI1 OUT";
> +               type =3D "a";
> +
> +               port {
> +                       hdmi1_con_in: endpoint {
> +                               remote-endpoint =3D <&lt8711uxd_out>;
> +                       };
> +               };
> +       };
> +
> +       lt8711uxd {

Please use a generic node name per DT convention. "hdmi-bridge" perhaps?

> +               compatible =3D "lontium,lt8711uxd";

Don't you want to add "vdd-supply =3D <&vcc3v3_dp>;" here? It costs you
nothing, as it's already in the binding and in the driver, and having
this dependency listed explicitly will let the kernel order the driver
probes correctly, and also likely let you drop the boot-on/always-on
annotation from the regulator node.

> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +
> +                               lt8711uxd_in: endpoint {
> +                                       remote-endpoint =3D <&dp0_out_con=
>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +
> +                               lt8711uxd_out: endpoint {
> +                                       remote-endpoint =3D <&hdmi1_con_i=
n>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       analog-sound {
> +               compatible =3D "simple-audio-card";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hp_detect>;
> +               simple-audio-card,format =3D "i2s";
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
> +               simple-audio-card,codec {
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
> +       vcc3v3_dp: regulator-vcc3v3-dp {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&dp_bridge_en>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "vcc3v3_dp";
> +               regulator-always-on;
> +               regulator-boot-on;

Please see if you can drop these always-on/boot-on when vdd-supply is
explicitly listed in the bridge node

> +               vin-supply =3D <&vcc_3v3_s3>;
> +       };
> +
> +       vcc3v3_phy1: regulator-vcc3v3-phy1 {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&vcc3v3_phy1_en>;

The board schematics call the pin "Ethernet_EN"

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
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_enable_h>;
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
> +       };
> +};
> +
> +&dp0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&dp0m0_pins>;
> +       status =3D "okay";
> +};
> +
> +&dp0_in {
> +       dp0_in_vp1: endpoint {
> +               remote-endpoint =3D <&vp1_out_dp0>;
> +       };
> +};
> +
> +&dp0_out {
> +       dp0_out_con: endpoint {
> +               remote-endpoint =3D <&lt8711uxd_in>;
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
> +               AVDD-supply =3D <&vcca_3v3_s0>;
> +               DVDD-supply =3D <&vcca_1v8_s0>;
> +               HPVDD-supply =3D <&vcca_3v3_s0>;
> +               PVDD-supply =3D <&vcca_1v8_s0>;
> +               assigned-clock-rates =3D <12288000>;
> +               assigned-clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> +               clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&i2s2m1_mclk>;
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
> +       pinctrl-0 =3D <&i2s2m1_lrck &i2s2m1_sclk
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
> +       pinctrl-0 =3D <&pcie2x1l1_rst &pcie30x1m1_1_clkreqn &pcie30x1m1_1=
_waken>;

Is there a particular reason to use the GPIO mode for the reset pin,
rather than the (confusingly named) &pcie30x1m1_1_perstn in line with
the other two?

> +       reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> +       supports-clkreq;
> +       vpcie3v3-supply =3D <&vcc_3v3_s3>;
> +       status =3D "okay";
> +};
> +
> +/* NIC */
> +&pcie2x1l2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pcie2x1l2_rst>;

Similar to the above - have you tried the dedicated hardware mode for
this pin, i.e. &pcie20x1m0_perstn? You are not requesting the
&pcie20x1m0_clkreqn or &pcie20x1m0_waken either, even though they are
routed on the board - that will probably bite you if you try
suspending the board.

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

If you care about power consumption of the board it's probably better
to pull this down to make sure the Bluetooth module is predictably in
a sleep state when not explicitly requested, not floating randomly.
There is no dedicated pull-up/pull-down on your board.

> +               };
> +
> +               bt_wake_host_irq: bt-wake-host-irq {
> +                       rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +       };
> +
> +       dp {
> +               dp_bridge_en: dp-bridge-en {
> +                       rockchip,pins =3D <3 RK_PC2 RK_FUNC_GPIO &pcfg_pu=
ll_none>;

This pin doesn't have any dedicated pull-up/pull-down on the board, so
you might end up in a weird power state for the period of time between
the probing of the pinctrl subsystem and regulators. Better set it to
&pcfg_pull_down, which matches the power-on-reset default state of
this pin.

> +               };
> +       };
> +
> +       pcie {
> +               pcie2x1l1_rst: pcie2x1l1-rst {
> +                       rockchip,pins =3D <4 RK_PA2 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               pcie2x1l2_rst: pcie2x1l2-rst {
> +                       rockchip,pins =3D <3 RK_PD1 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               vcc3v3_phy1_en: vcc3v3-phy1-en {

The schematic calls this pin "Ethernet_EN", so perhaps use that in the
label and node name for easier reference.

> +                       rockchip,pins =3D <3 RK_PB7 RK_FUNC_GPIO &pcfg_pu=
ll_none>;

As above: no dedicated pull resistors on the board, better set to
&pcfg_pull_down in line with POR default.

> +               };
> +       };
> +
> +       usb {
> +               vcc5v0_otg_en: vcc5v0-otg-en {
> +                       rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pu=
ll_none>;

As above: no dedicated pull resistors on the board, better set to
&pcfg_pull_down in line with POR default.

> +               };
> +       };
> +
> +       wlan {
> +               wifi_enable_h: wifi-enable-h {
> +                       rockchip,pins =3D <0 RK_PD0 RK_FUNC_GPIO &pcfg_pu=
ll_none>;

As above: no dedicated pull resistors on the board, better set to
&pcfg_pull_down in line with POR default.

Best regards,
Alexey
