Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00AC32863D
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775908711; cv=pass; b=o9N0m+Gze1v9WeRnI4RY70pWzz8ZeEMG8SWGJYAlUtQHeN577JWeWct/dJY4Pp/aE+pFj5okbaoo+vvvnzeZKmtO7dtRESn+MiFhiT30mRpiZDhlAJ8YD14uu2uNNfc4Yb2v2uW+PeF/spDgB5qWwiHsnJK00FmRE8QC8wHQQ+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775908711; c=relaxed/simple;
	bh=4ICkETzYJ8G5ope5d9pQMy2fZKDPaUV+WimD+8ucms0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBs9YcRn8IHJhZtD4ToAZ+SY0RHQxuqG1piXXwqaEySI9KxA58ADJ3jJdj2EVXVSqJs3CoP4j9WlKDwnr0lHn82Gzs0xbczoAqeSM8I+PG6Fphv+zAtZ0lCfbXwrHw6k4vexBTgRU5bj5HojOw/0z8IDliAEB1sO4Ua/z1yMv20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxxzDc9v; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxxzDc9v"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so2826399f8f.3
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 04:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775908708; cv=none;
        d=google.com; s=arc-20240605;
        b=kMQw2MWtNvMo+yPsGy4VGAFHBTXsmtHTO7XCAiqEI2R67hSVtC0c1t8nc7qsdAJB19
         qrSigsR/MFYo7v7jt1JrZjJdI9JwzzjGStNC8V/ycIFzRzXCUCTUX6ZG0BCrrIAxw7ME
         pWQUcHx/estXP80HAlHpemwHfARX2THe4uFofrFk3n2vyshMkkDF2GHXsp6AGKNyI09R
         G4VbZZIYtZ6CESrmUPmIjzf3vmqq4rfgaTre5776sFlsuIYtsh/WhaD3cZ3kxwis+a5R
         KRBV3wqW1XzSfSEoidXRrweI6KuQjLDCcSpTBJaDcJXJoYD7+VbWdCqWtrN1SDHCfjNo
         59uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDfIyXP/Uwov8eB2hwhNC8+qnUHzWCIDl8PJ5Ugl7vQ=;
        fh=s07lOyM5Ve8r55MYaYvPNIduJZ4ihczQE0CSgxF0lGI=;
        b=drMSF5UiRlXT9HF5IenrrsgChvNxW/C4shQn/eSV3pXNU177p38SX7fxKE48aC2pV3
         tFYrz7Kol/BDfFHqFBL0WJBCYpqX077GqX60FdStVkzJr0i5lGHZb6Xn5cmotRv1Ygrk
         mLSUqmo0YhWFBpzAy9VbviN47Kca9gKvJvBOS3tD2GCGOp9KuKkonefeSToloY5j4l+2
         YLGAw00avHhqAf21VWUe8YNMJ5lvZMaChZaS3f3nWlCkNB/A4C3zsizjakct0zGQ7Ox7
         pdfWc1/Lgmvp90Y+IO0Y2Rd4MtLuAIFn4u3fd+QX9kimDrNkvRb/KpkqXG2nAVnH2qM5
         Cy0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775908708; x=1776513508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDfIyXP/Uwov8eB2hwhNC8+qnUHzWCIDl8PJ5Ugl7vQ=;
        b=LxxzDc9v7wtOxKSWs4+JHS6pyrp/qm+R3YDrkh7REYmie9BcY80IqzIlMRbhIsFlW4
         moJTm/zCT7m5HjtErTisjYq0XadMqzTry2vTJl/5Fp3QJfb+BDjbJ169FV8NCYlyEPpG
         VyOJacCSWEESzEzD09F7pApeJHZsRajWoJBqD6ONRKnIhs3728lEG1U4QgbV+4mjKDRT
         1UoxJhx5yS2+HPN2aBH44tMx70BOYabWpgZBl0Ghb7TbqXGSdYDRYkrjRhgDF1akQbtV
         Cql6DcZxc0PuGVCaJJk5K/wDNIgNvCmal8Q74ISbX92L72bSWF2q7l+3uzXXCEq3inDE
         w/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775908708; x=1776513508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XDfIyXP/Uwov8eB2hwhNC8+qnUHzWCIDl8PJ5Ugl7vQ=;
        b=XRKmL/l24YXGPqGqkrIMi6DrxN4VXKRieC4/G9FySiiV9hCXxFHMzcs53sv6NoxTaL
         a8q3LLhpLm/tmp3zLUm4aLwcCeQ5GyHLccdQi15LrN7EQxNAdIa54kxBuPTOjp+W4WDi
         YGAnNja1sirWgwE2u04x17bygzPobBRprGCVHHdDAsZ6VJUhjcaY4Wk6sOLaWXAVsiPu
         YBZoNVxzCUcmPs53dxgq7Cjx0Xso4LyBHTal2yJNFQnj4pkWAfgMK37clEK354567phO
         eR7ZQ2wIRjcidF/JydcKq2xaeFSi88cWPjl84xJFcg2Eik2UTN3vrOUk5K225VCfnT32
         NkqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhrOq7kpuYwZl+9ulYwjkbflyTp/3Knx8jrDALSqY+NvGuO0nYpm+le1FVE9/gqFdQmMeh3MuXtAoW@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhv07TCd7BPaShxI4RBwEsKeo1tyQdZhcUXc8tk/0c1h2nTOB
	W376k+6zpkIa4qYbTBqCFs4VwB0O4F0/8AdOcMrtuUhVrTF6KcM00w10a7HPjYZinndEKyt8//B
	k5B3VmdU26p4cmLcFDvI6gQORNFmXClw=
X-Gm-Gg: AeBDieuC5iTgzrqui1dT6QSR3bAHkfisOhaSTUf/L4VfUlS53dCLD6wnp1ByPBMoFBi
	lMcJAgC7RChjGVgBM4PCmcjqJSRn3LQGJLBU18a06dzEgn69hHKbLFYamRjEZab1yP3Hb7tNVcf
	SJXtHxjJfwTQrL5bPvihn04Gl6pcPahX99mJIVDCx61iocmhbPfq2eS3gUMoxu5rO/EC8D09YJ6
	BhAhczNx/koLtLFrGuc38MQZDBKOFrHm4sijIIdKfWRl5coN/qxfeauPpmQEQxSyjAdE+AqEkFX
	3XVneYq+f0GhTL/UnQwH+xq9aeLcny/rxzsoL8E=
X-Received: by 2002:a05:6000:4285:b0:43c:4810:dc4a with SMTP id
 ffacd0b85a97d-43d642d3630mr9789353f8f.38.1775908707676; Sat, 11 Apr 2026
 04:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411024743.195385-1-dennis@ausil.us> <20260411024743.195385-3-dennis@ausil.us>
In-Reply-To: <20260411024743.195385-3-dennis@ausil.us>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Sat, 11 Apr 2026 06:58:16 -0500
X-Gm-Features: AQROBzB-J9aCgYAe-VfePK1n3X_NKRT6WCrA17gzUMN__JIvmHRVrDeM5hAiTf4
Message-ID: <CALWfF7JAZYHwhVAT_C4XppPrBnwwKZ4iNNdwZzkzFPkxZiJuxw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 9:47=E2=80=AFPM <dennis@ausil.us> wrote:
>
> From: Dennis Gilmore <dennis@ausil.us>
>
> The Orange Pi 5 Pro uses the same SoC and base as the Orange Pi 5 and
> Orange Pi 5B but has had sound, USB, and leds wired up differently. The
> boards also use gmac for ethernet where the Pro has a PCIe attached NIC.
>
> I have not changed the definitions from what was in rk3588s-orangepi-5.dt=
si
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>

Still works on Orange Pi 5.
Having the 5 and 5B share a dtsi is similar to how the 5 Max and 5
Ultra share a dtsi while the 5 Plus has more differences.

Tested-By: Jimmy Hon <honyuenkwun@gmail.com>
Reviewed-By: Jimmy Hon <honyuenkwun@gmail.com>

> ---
>  .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 192 +++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 198 +-----------------
>  .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
>  4 files changed, 209 insertions(+), 189 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dt=
si
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
> new file mode 100644
> index 000000000000..b04dd667605d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device tree definitions shared by the Orange Pi 5 and Orange Pi 5B
> + * but not the Orange Pi 5 Pro.
> + */
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3588s-orangepi-5.dtsi"
> +
> +/ {
> +       aliases {
> +               ethernet0 =3D &gmac1;
> +       };
> +
> +       analog-sound {
> +               compatible =3D "simple-audio-card";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hp_detect>;
> +               simple-audio-card,name =3D "rockchip,es8388";
> +               simple-audio-card,bitclock-master =3D <&masterdai>;
> +               simple-audio-card,format =3D "i2s";
> +               simple-audio-card,frame-master =3D <&masterdai>;
> +               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_AC=
TIVE_HIGH>;
> +               simple-audio-card,mclk-fs =3D <256>;
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
> +                       sound-dai =3D <&i2s1_8ch>;
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
> +               led {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_STATUS;
> +                       linux,default-trigger =3D "heartbeat";
> +                       max-brightness =3D <255>;
> +                       pwms =3D <&pwm0 0 25000 0>;
> +               };
> +       };
> +};
> +
> +&gmac1 {
> +       clock_in_out =3D "output";
> +       phy-handle =3D <&rgmii_phy1>;
> +       phy-mode =3D "rgmii-rxid";
> +       pinctrl-0 =3D <&gmac1_miim
> +                    &gmac1_tx_bus2
> +                    &gmac1_rx_bus2
> +                    &gmac1_rgmii_clk
> +                    &gmac1_rgmii_bus>;
> +       pinctrl-names =3D "default";
> +       tx_delay =3D <0x42>;
> +       status =3D "okay";
> +};
> +
> +&i2c6 {
> +       es8388: audio-codec@10 {
> +               compatible =3D "everest,es8388", "everest,es8328";
> +               reg =3D <0x10>;
> +               clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> +               AVDD-supply =3D <&vcc_3v3_s0>;
> +               DVDD-supply =3D <&vcc_1v8_s0>;
> +               HPVDD-supply =3D <&vcc_3v3_s0>;
> +               PVDD-supply =3D <&vcc_3v3_s0>;
> +               assigned-clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> +               assigned-clock-rates =3D <12288000>;
> +               #sound-dai-cells =3D <0>;
> +       };
> +
> +       usbc0: usb-typec@22 {
> +               compatible =3D "fcs,fusb302";
> +               reg =3D <0x22>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usbc0_int>;
> +               vbus-supply =3D <&vbus_typec>;
> +               status =3D "okay";
> +
> +               usb_con: connector {
> +                       compatible =3D "usb-c-connector";
> +                       label =3D "USB-C";
> +                       data-role =3D "dual";
> +                       op-sink-microwatt =3D <1000000>;
> +                       power-role =3D "dual";
> +                       sink-pdos =3D
> +                               <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM=
)>;
> +                       source-pdos =3D
> +                               <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM=
)>;
> +                       try-power-role =3D "source";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       usbc0_hs: endpoint {
> +                                               remote-endpoint =3D <&usb=
_host0_xhci_drd_sw>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       usbc0_ss: endpoint {
> +                                               remote-endpoint =3D <&usb=
dp_phy0_typec_ss>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +                                       usbc0_sbu: endpoint {
> +                                               remote-endpoint =3D <&usb=
dp_phy0_typec_sbu>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2s1_8ch {
> +       rockchip,i2s-tx-route =3D <3 2 1 0>;
> +       rockchip,i2s-rx-route =3D <1 3 2 0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2s1m0_sclk
> +                    &i2s1m0_mclk
> +                    &i2s1m0_lrck
> +                    &i2s1m0_sdi1
> +                    &i2s1m0_sdo3>;
> +       status =3D "okay";
> +};
> +
> +&pwm0 {
> +       pinctrl-0 =3D <&pwm0m2_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +&usb_host0_xhci {
> +       dr_mode =3D "otg";
> +       usb-role-switch;
> +
> +       port {
> +               usb_host0_xhci_drd_sw: endpoint {
> +                       remote-endpoint =3D <&usbc0_hs>;
> +               };
> +       };
> +};
> +
> +&usb_host2_xhci {
> +       status =3D "okay";
> +};
> +
> +&usbdp_phy0 {
> +       mode-switch;
> +       orientation-switch;
> +       sbu1-dc-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> +       sbu2-dc-gpios =3D <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
> +
> +       port {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               usbdp_phy0_typec_ss: endpoint@0 {
> +                       reg =3D <0>;
> +                       remote-endpoint =3D <&usbc0_ss>;
> +               };
> +
> +               usbdp_phy0_typec_sbu: endpoint@1 {
> +                       reg =3D <1>;
> +                       remote-endpoint =3D <&usbc0_sbu>;
> +               };
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> index 83b9b6645a1e..d76bdf1b5e90 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> @@ -2,12 +2,16 @@
>
>  /dts-v1/;
>
> -#include "rk3588s-orangepi-5.dtsi"
> +#include "rk3588s-orangepi-5-5b.dtsi"
>
>  / {
>         model =3D "Xunlong Orange Pi 5";
>         compatible =3D "xunlong,orangepi-5", "rockchip,rk3588s";
>
> +       aliases {
> +               mmc0 =3D &sdmmc;
> +       };
> +
>         vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
>                 compatible =3D "regulator-fixed";
>                 enable-active-high;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/=
arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> index dafad29f9854..5c154cc6c62a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> @@ -3,19 +3,13 @@
>  /dts-v1/;
>
>  #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/soc/rockchip,vop2.h>
> -#include <dt-bindings/usb/pd.h>
>  #include "rk3588s.dtsi"
>
>  / {
> -       aliases {
> -               ethernet0 =3D &gmac1;
> -               mmc0 =3D &sdmmc;
> -       };
> -
>         chosen {
>                 stdout-path =3D "serial2:1500000n8";
>         };
> @@ -34,38 +28,6 @@ button-recovery {
>                 };
>         };
>
> -       analog-sound {
> -               compatible =3D "simple-audio-card";
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&hp_detect>;
> -               simple-audio-card,name =3D "rockchip,es8388";
> -               simple-audio-card,bitclock-master =3D <&masterdai>;
> -               simple-audio-card,format =3D "i2s";
> -               simple-audio-card,frame-master =3D <&masterdai>;
> -               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_AC=
TIVE_HIGH>;
> -               simple-audio-card,mclk-fs =3D <256>;
> -               simple-audio-card,routing =3D
> -                       "Headphones", "LOUT1",
> -                       "Headphones", "ROUT1",
> -                       "LINPUT1", "Microphone Jack",
> -                       "RINPUT1", "Microphone Jack",
> -                       "LINPUT2", "Onboard Microphone",
> -                       "RINPUT2", "Onboard Microphone";
> -               simple-audio-card,widgets =3D
> -                       "Microphone", "Microphone Jack",
> -                       "Microphone", "Onboard Microphone",
> -                       "Headphone", "Headphones";
> -
> -               simple-audio-card,cpu {
> -                       sound-dai =3D <&i2s1_8ch>;
> -               };
> -
> -               masterdai: simple-audio-card,codec {
> -                       sound-dai =3D <&es8388>;
> -                       system-clock-frequency =3D <12288000>;
> -               };
> -       };
> -
>         hdmi0-con {
>                 compatible =3D "hdmi-connector";
>                 type =3D "a";
> @@ -77,18 +39,6 @@ hdmi0_con_in: endpoint {
>                 };
>         };
>
> -       pwm-leds {
> -               compatible =3D "pwm-leds";
> -
> -               led {
> -                       color =3D <LED_COLOR_ID_GREEN>;
> -                       function =3D LED_FUNCTION_STATUS;
> -                       linux,default-trigger =3D "heartbeat";
> -                       max-brightness =3D <255>;
> -                       pwms =3D <&pwm0 0 25000 0>;
> -               };
> -       };
> -
>         vbus_typec: regulator-vbus-typec {
>                 compatible =3D "regulator-fixed";
>                 enable-active-high;
> @@ -101,15 +51,6 @@ vbus_typec: regulator-vbus-typec {
>                 vin-supply =3D <&vcc5v0_sys>;
>         };
>
> -       vcc5v0_sys: regulator-vcc5v0-sys {
> -               compatible =3D "regulator-fixed";
> -               regulator-name =3D "vcc5v0_sys";
> -               regulator-always-on;
> -               regulator-boot-on;
> -               regulator-min-microvolt =3D <5000000>;
> -               regulator-max-microvolt =3D <5000000>;
> -       };
> -
>         vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
>                 compatible =3D "regulator-fixed";
>                 gpios =3D <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
> @@ -119,6 +60,15 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
>                 regulator-max-microvolt =3D <3300000>;
>                 vin-supply =3D <&vcc_3v3_s3>;
>         };
> +
> +       vcc5v0_sys: regulator-vcc5v0-sys {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_sys";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
>  };
>
>  &combphy0_ps {
> @@ -161,20 +111,6 @@ &cpu_l3 {
>         cpu-supply =3D <&vdd_cpu_lit_s0>;
>  };
>
> -&gmac1 {
> -       clock_in_out =3D "output";
> -       phy-handle =3D <&rgmii_phy1>;
> -       phy-mode =3D "rgmii-rxid";
> -       pinctrl-0 =3D <&gmac1_miim
> -                    &gmac1_tx_bus2
> -                    &gmac1_rx_bus2
> -                    &gmac1_rgmii_clk
> -                    &gmac1_rgmii_bus>;
> -       pinctrl-names =3D "default";
> -       tx_delay =3D <0x42>;
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         mali-supply =3D <&vdd_gpu_s0>;
>         status =3D "okay";
> @@ -270,69 +206,6 @@ &i2c6 {
>         pinctrl-0 =3D <&i2c6m3_xfer>;
>         status =3D "okay";
>
> -       es8388: audio-codec@10 {
> -               compatible =3D "everest,es8388", "everest,es8328";
> -               reg =3D <0x10>;
> -               clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> -               AVDD-supply =3D <&vcc_3v3_s0>;
> -               DVDD-supply =3D <&vcc_1v8_s0>;
> -               HPVDD-supply =3D <&vcc_3v3_s0>;
> -               PVDD-supply =3D <&vcc_3v3_s0>;
> -               assigned-clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> -               assigned-clock-rates =3D <12288000>;
> -               #sound-dai-cells =3D <0>;
> -       };
> -
> -       usbc0: usb-typec@22 {
> -               compatible =3D "fcs,fusb302";
> -               reg =3D <0x22>;
> -               interrupt-parent =3D <&gpio0>;
> -               interrupts =3D <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&usbc0_int>;
> -               vbus-supply =3D <&vbus_typec>;
> -               status =3D "okay";
> -
> -               usb_con: connector {
> -                       compatible =3D "usb-c-connector";
> -                       label =3D "USB-C";
> -                       data-role =3D "dual";
> -                       op-sink-microwatt =3D <1000000>;
> -                       power-role =3D "dual";
> -                       sink-pdos =3D
> -                               <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM=
)>;
> -                       source-pdos =3D
> -                               <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM=
)>;
> -                       try-power-role =3D "source";
> -
> -                       ports {
> -                               #address-cells =3D <1>;
> -                               #size-cells =3D <0>;
> -
> -                               port@0 {
> -                                       reg =3D <0>;
> -                                       usbc0_hs: endpoint {
> -                                               remote-endpoint =3D <&usb=
_host0_xhci_drd_sw>;
> -                                       };
> -                               };
> -
> -                               port@1 {
> -                                       reg =3D <1>;
> -                                       usbc0_ss: endpoint {
> -                                               remote-endpoint =3D <&usb=
dp_phy0_typec_ss>;
> -                                       };
> -                               };
> -
> -                               port@2 {
> -                                       reg =3D <2>;
> -                                       usbc0_sbu: endpoint {
> -                                               remote-endpoint =3D <&usb=
dp_phy0_typec_sbu>;
> -                                       };
> -                               };
> -                       };
> -               };
> -       };
> -
>         hym8563: rtc@51 {
>                 compatible =3D "haoyu,hym8563";
>                 reg =3D <0x51>;
> @@ -346,18 +219,6 @@ hym8563: rtc@51 {
>         };
>  };
>
> -&i2s1_8ch {
> -       rockchip,i2s-tx-route =3D <3 2 1 0>;
> -       rockchip,i2s-rx-route =3D <1 3 2 0>;
> -       pinctrl-names =3D "default";
> -       pinctrl-0 =3D <&i2s1m0_sclk
> -                    &i2s1m0_mclk
> -                    &i2s1m0_lrck
> -                    &i2s1m0_sdi1
> -                    &i2s1m0_sdo3>;
> -       status =3D "okay";
> -};
> -
>  &i2s5_8ch {
>         status =3D "okay";
>  };
> @@ -404,12 +265,6 @@ typec5v_pwren: typec5v-pwren {
>         };
>  };
>
> -&pwm0 {
> -       pinctrl-0 =3D <&pwm0m2_pins>;
> -       pinctrl-names =3D "default";
> -       status =3D "okay";
> -};
> -
>  &rknn_core_0 {
>         npu-supply =3D <&vdd_npu_s0>;
>         sram-supply =3D <&vdd_npu_s0>;
> @@ -841,26 +696,7 @@ &uart2 {
>  };
>
>  &usbdp_phy0 {
> -       mode-switch;
> -       orientation-switch;
> -       sbu1-dc-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> -       sbu2-dc-gpios =3D <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
>         status =3D "okay";
> -
> -       port {
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
> -               usbdp_phy0_typec_ss: endpoint@0 {
> -                       reg =3D <0>;
> -                       remote-endpoint =3D <&usbc0_ss>;
> -               };
> -
> -               usbdp_phy0_typec_sbu: endpoint@1 {
> -                       reg =3D <1>;
> -                       remote-endpoint =3D <&usbc0_sbu>;
> -               };
> -       };
>  };
>
>  &usb_host0_ehci {
> @@ -872,15 +708,7 @@ &usb_host0_ohci {
>  };
>
>  &usb_host0_xhci {
> -       dr_mode =3D "otg";
> -       usb-role-switch;
>         status =3D "okay";
> -
> -       port {
> -               usb_host0_xhci_drd_sw: endpoint {
> -                       remote-endpoint =3D <&usbc0_hs>;
> -               };
> -       };
>  };
>
>  &usb_host1_ehci {
> @@ -891,7 +719,7 @@ &usb_host1_ohci {
>         status =3D "okay";
>  };
>
> -&usb_host2_xhci {
> +&vop {
>         status =3D "okay";
>  };
>
> @@ -899,10 +727,6 @@ &vop_mmu {
>         status =3D "okay";
>  };
>
> -&vop {
> -       status =3D "okay";
> -};
> -
>  &vp0 {
>         vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>                 reg =3D <ROCKCHIP_VOP2_EP_HDMI0>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
> index d21ec320d295..8af174777809 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
> @@ -2,7 +2,7 @@
>
>  /dts-v1/;
>
> -#include "rk3588s-orangepi-5.dtsi"
> +#include "rk3588s-orangepi-5-5b.dtsi"
>
>  / {
>         model =3D "Xunlong Orange Pi 5B";
> --
> 2.53.0
>
