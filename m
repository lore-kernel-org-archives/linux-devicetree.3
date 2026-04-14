Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB821D5ABA
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175676; cv=pass; b=QZtK0jJjgbuRBSrUnPotFo5drpTMulzoHtDNmPB6D1w5ZA90omJXq1GfwdXw9a/rN1aYOClSKw9Tvfn8pGNYDRCXq1d+b7jvn7QiNrQuG5VrcXa+NQH3hXW3LDe6dPznwLXt5aXLsEp7Crtw3Mhk3aXIiBCH3uxgF1Co/KV9HoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175676; c=relaxed/simple;
	bh=L5h18lMVQ86qeLqRTako3QgTAnePNOJgTXHVLOCya0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uc6e0NKuj3n5ShRW7rh4YUCu1EQ51uV4j2BQq2AiC3YBUNNQdrc5EFqHjIG/JW4RJGi+QaRmjvZ0Jrm1EBQDyoTgCbm8yo7b5pKx+KBnU4ZPU6/KCh0odXfEAZdHKUzR9osEnmEq6KNjMwPYvauFcr4p5z0fh9bzdDG41Z6g4Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=G+YzIfCV; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="G+YzIfCV"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dbce74e537so4402464a34.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776175673; cv=none;
        d=google.com; s=arc-20240605;
        b=LM/qaHdPdPjxTZOIhS5D5RsxLjTHIeOpe0x+KdUJHhJ+nE3zskniR2qZ7Rm4JXN1Nf
         T+4vqpTUd2MjHTIZ29wXUewAHbaKAO9c5YuOvcn3xuCG//vZSwReh3KD7TPYSGZY7/Zx
         5E/MD4XSThHELIHdzJPnT1oD4U+UhhsGA1snAtsACyCz+RT8f04kOOmjMsqpaOP0/lsl
         +Jkq+g5PNGLJT0gq+fQWORTx3RApTldNHTh1Hwzsf9ptnU+vyuXywYj337EtSExYtV/x
         JK5jAIUAktmLZBnDf74vAIdE24i9e1yaPhDftBSlPFJORg3HcvMy3wnIP9Z0XsRzIzUo
         uIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PkaVo8h9lBRir+HqwJgm7pOOdykb4zdly5L78FOuyuc=;
        fh=6E2HrRut0+5qAf1XA01JMmAqiscoRTi2lCWf6fKnpP8=;
        b=eCaiLgbqzlfVz7YXWL6fI2CgyMc4oFlPJsWtkFbYUok2QoGrHQGZZnuQ5zcCyb4KKC
         /+by5F7DvtWS36CUGy64TX7u6Gj85RAiMijHioeVuI939EMNYGoQxUpy+Vuj2ab7hNn9
         D4Is8gIGtGmZjradP9qX3E4KjGKCUxYCSj9M9spzVpZuwMQZ7v9zeUfUFxtmJBWpVU23
         /5711+QoDTm2jrxjuM9bqD/g9tYHfuQCMLM9vZnObuq+LCtUQbjOHGAfuGNRopzJFS3a
         VCu7arSJDI38vxa5H+bLeVDWkaJOuyAxORsrJO25LRvHx3lN3siMGhqrF9rwG1dTSD2i
         H95A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776175673; x=1776780473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkaVo8h9lBRir+HqwJgm7pOOdykb4zdly5L78FOuyuc=;
        b=G+YzIfCVCR5+LsFeQjeX57FGuFEbpzw0GF9umxxtW/m0AJWfVRihT/vvj6rUfSE4f7
         GmqAZmIDDQPcWFaAc3ZJLSTM6p0IiTX3zKcwUPy3lVPNKgdvACkNtMhbrqsLCo3Lekyn
         R+sZl2NbSI4uTFdCXzfGFiJHx2FDSIxp72ztKW1+eF3/1buqgrKfThxCUKHMFso/yhAU
         wMT921zoVqK8B2/448XeLt1uISNU8Xj56KzPAO+3ojiQnXMQ3q/n3oRbDlQRZsKxctkW
         cQlACgpMNSY5rlCAlU0RE/Qd06OhRAMbv9dUhhkpPyJ+2SLmIkV9vTDQS0xZ/mFJNqCB
         KGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175673; x=1776780473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PkaVo8h9lBRir+HqwJgm7pOOdykb4zdly5L78FOuyuc=;
        b=sFDl7dtK+goTqkpu5xf6jlszEz19KOiCQFvVaYz/1hBwCyfRWYacDSxTCqn5F8tkVk
         +8p6mZ/vgTRzkJsEaukAsP8mBF3xVmrdfeGtQJvtlGssx5NYcOUN32hNyRAb/5KP0ANw
         U8euxerwUrJHPGgS8RfIdl8NEBTz/PFXU4GbJZzzmDUxustVq1hVJqwD5hvU3yiIcyyA
         r+zUSM5klRp3MuFkN/omBHGD8qwdYLAoxxzlTGLMaBpsMw78ECD0F01DgdNzVH+SVQSU
         vt/V3DCrG+RRX1pBlZrPyGzjBYyXEpIKkZ+/5DB/4p3E7o3MjoeOOosCdI6cn6zFblUz
         ZQCw==
X-Forwarded-Encrypted: i=1; AFNElJ+CMuXfUyYnSnor8UG8KhhiWng6GOEBkCbl8AqHbO5mA+SW6ByjTs0R9IXAGQ4tYbffmpxSFlS63Wzl@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVrboDKsGZr5/YYcUuQ2Mi8PIjT440OTo1NZtAg2KvpCd+tUE
	En+4M3jQb8tu2DEC6phjFMDwroKVJalHwdEXQZ9k7dPTNlBDebMYEvRvSSHA8fDKBeSxuzZC0lZ
	sNMLP+CAhUDyGNT64QBmEXvE9r2qK7S+cHqR36/HanA==
X-Gm-Gg: AeBDieuCCja2nTL9hPLDVZYxKa/2PevELKpH7Akcqc/K6ds3Av+uehDLJ7T7Eq7pBJt
	RiPYWRvwjx5Fynvy0EiCYIF/Yw592bo1wBMD0EJWdRvLJDa6QPfW/Q3nBeIFZ4jME0b6iRpwFeJ
	RUWHpP+BouvAHf0qKsy00RCxe9hd2UKaU+7jljgxHZAgDE07F+4leo4q1USGrSLcaorG+5e/zjt
	dQ+xNxKRmcyYEdkRUCZ1ugVsFnbF1m5tsA9Y2kagdQAyMACKABDe7ATpdxa4BFlmy9DXtVsTdav
	/IHS0V3iEIEpMCuA8I8HVeyizbBcmo4en4GD/J7KtBXgoGiJvNE0/I5wQGl0b3pntkjYlczC5f/
	RZ/JDjA==
X-Received: by 2002:a05:6830:67cf:b0:7d7:f15b:bdcf with SMTP id
 46e09a7af769-7dc27f7b5c2mr10526044a34.28.1776175673260; Tue, 14 Apr 2026
 07:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411024743.195385-1-dennis@ausil.us> <20260411024743.195385-4-dennis@ausil.us>
 <CABjd4YwZJe8fO+kJiXRTq5gZirVvKvCqWzNdYqN3-6eMAZUFxQ@mail.gmail.com>
In-Reply-To: <CABjd4YwZJe8fO+kJiXRTq5gZirVvKvCqWzNdYqN3-6eMAZUFxQ@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Tue, 14 Apr 2026 09:07:41 -0500
X-Gm-Features: AQROBzCWgjy0MHcosgH1clxH68d6T5-V8Mjv2Weq2daMr5LTi705y3HE_wCPOpw
Message-ID: <CAABkxwth=fC20n_iO9GV4Yv+ybUo_srRe_aoJoC=o6setTwTDg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Alexey Charkov <alchark@gmail.com>
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

On Sat, Apr 11, 2026 at 1:00=E2=80=AFPM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Sat, Apr 11, 2026 at 6:47=E2=80=AFAM <dennis@ausil.us> wrote:
> >
> > From: Dennis Gilmore <dennis@ausil.us>
> >
> > Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
> >
> > - eMMC module, you can optionally solder a SPI NOR in place and turn
> >  off the eMMC
> > - PCIe-attached NIC (pcie2x1l1)
> > - PCIe NVMe slot (pcie2x1l2)
> > - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> > - BCM4345C5 Bluetooth
> > - es8388 audio
> > - USB 2.0 and USB 3.0
> > - Two HDMI ports, the second is connected to the SoC's DP controller
> >   driven by a transparent LT8711UXD bridge that has firmware onboard an=
d
> >   needs no node defined.
> >
> > Vendors description and links to schematics available:
> > http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/detai=
ls/Orange-Pi-5-Pro.html
>
> Hi Dennis,
>
> The most useful of these is the schematic, so it's best to include a
> direct link to that in a dedicated Link: tag
>
> Link: https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/v=
iew

Will change to that, I did not do it because a random Google Drive
link doesn't really indicate it as a source of truth

> [schematic]
>
> > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > ---
> >  .../display/rockchip/rockchip,dw-dp.yaml      |   7 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 352 ++++++++++++++++++
> >  drivers/gpu/drm/bridge/synopsys/dw-dp.c       |  12 +
>
> These should be three separate patches, never lumped together. First
> the binding change, next the driver change. They go together via the
> subsystem tree (likely DRM in this case). Then the DTS addition (or
> change) separately (it goes via the SoC tree).

They were something I was doing as I worked on getting the second HDMI
port working, they ended up not being needed, and I should have
removed it there really should have only been the dts and Makefile. I
should have waited until the morning to review again and send.

> >  4 files changed, 372 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro=
.dts
> >
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchi=
p,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml
> > index 6345f0132d43..079a912d97f1 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp=
.yaml
> > @@ -57,6 +57,13 @@ properties:
> >        - const: i2s
> >        - const: spdif
> >
> > +  hpd-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO used for hot plug detection when the controller's native HP=
D
> > +      input is not connected. If not specified, the controller uses it=
s
> > +      internal HPD detection mechanism.
>
> Do you actually need this change? According to the schematic, the
> DP_HPDIN line from the DP-HDMI bridge is routed to the native
> DP0_HPDIN_M0 pin of the DP controller, so it shouldn't require this
> GPIO trick if the pinctrl is configured properly.

No I do not, It was an approach I had experimented with but did not
use and did not mean to include here.


> >    phys:
> >      maxItems: 1
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
> > index 4d384f153c13..c99dca2ae9e7 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c=
.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5-pro.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-cm5-base.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-radxa-cm5-io.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-roc-pc.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/=
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> > new file mode 100644
> > index 000000000000..84c83aa69f63
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> > @@ -0,0 +1,352 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "rk3588s-orangepi-5.dtsi"
> > +
> > +/ {
> > +       model =3D "Xunlong Orange Pi 5 Pro";
> > +       compatible =3D "xunlong,orangepi-5-pro", "rockchip,rk3588s";
> > +
> > +       aliases {
> > +               mmc0 =3D &sdhci;
> > +               mmc1 =3D &sdmmc;
> > +               mmc2 =3D &sdio;
> > +       };
> > +
> > +       dp-con {
> > +               compatible =3D "dp-connector";
>
> You don't have a physical DP connector on the board, so this node
> doesn't describe actual hardware, and is thus a no-go. What you have
> instead is an HDMI type A connector routed via an onboard DP to HDMI
> bridge, so you should describe exactly that in the device tree (a node
> for the HDMI connector, a node for the bridge, a node for the DP
> controller, and endpoints connected from the controller to the bridge,
> from the bridge to the connector). Please refer to the device tree for
> Radxa Rock 5 ITX, which has a similar setup (but a different bridge
> IC).
>
> I don't think your LT8711UXD has existing binding or driver entry, so
> a one-line patch will likely be needed to
> Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml,
> and a separate one to drivers/gpu/drm/bridge/simple-bridge.c. Separate
> ones :)

Will add in v7

> > +               port {
> > +                       dp_con_in: endpoint {
> > +                               remote-endpoint =3D <&dp0_out_con>;
> > +                       };
> > +               };
> > +       };
> > +
> > +       analog-sound {
> > +               compatible =3D "simple-audio-card";
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&hp_detect>;
> > +               simple-audio-card,bitclock-master =3D <&masterdai>;
> > +               simple-audio-card,format =3D "i2s";
> > +               simple-audio-card,frame-master =3D <&masterdai>;
> > +               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_=
ACTIVE_HIGH>;
> > +               simple-audio-card,mclk-fs =3D <256>;
> > +               simple-audio-card,name =3D "rockchip,es8388";
> > +               simple-audio-card,routing =3D
> > +                       "Headphones", "LOUT1",
> > +                       "Headphones", "ROUT1",
> > +                       "LINPUT1", "Microphone Jack",
> > +                       "RINPUT1", "Microphone Jack",
> > +                       "LINPUT2", "Onboard Microphone",
> > +                       "RINPUT2", "Onboard Microphone";
> > +               simple-audio-card,widgets =3D
> > +                       "Microphone", "Microphone Jack",
> > +                       "Microphone", "Onboard Microphone",
> > +                       "Headphone", "Headphones";
> > +
> > +               simple-audio-card,cpu {
> > +                       sound-dai =3D <&i2s2_2ch>;
> > +               };
> > +
> > +               masterdai: simple-audio-card,codec {
> > +                       sound-dai =3D <&es8388>;
> > +                       system-clock-frequency =3D <12288000>;
> > +               };
> > +       };
> > +
> > +       pwm-leds {
> > +               compatible =3D "pwm-leds";
> > +
> > +               led-0 {
> > +                       color =3D <LED_COLOR_ID_BLUE>;
> > +                       function =3D LED_FUNCTION_STATUS;
> > +                       linux,default-trigger =3D "heartbeat";
> > +                       max-brightness =3D <255>;
> > +                       pwms =3D <&pwm15 0 1000000 0>;
> > +               };
> > +
> > +               led-1 {
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_ACTIVITY;
> > +                       linux,default-trigger =3D "heartbeat";
> > +                       max-brightness =3D <255>;
> > +                       pwms =3D <&pwm3 0 1000000 0>;
> > +               };
> > +       };
> > +
> > +       fan: pwm-fan {
> > +               compatible =3D "pwm-fan";
> > +               #cooling-cells =3D <2>;
> > +               cooling-levels =3D <0 50 100 150 200 255>;
> > +               fan-supply =3D <&vcc5v0_sys>;
> > +               pwms =3D <&pwm2 0 20000000 0>;
> > +       };
> > +
> > +       vcc3v3_dp: regulator-vcc3v3-dp {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;
>
> Please don't forget to add explicit pinctrl nodes for each GPIO pin
> you use (here and in other places like this). These GPIOs happen to
> work on Linux without configuring their pin control first, but that is
> pure luck and coincidence due to how the respective Linux subsystems
> are wired together, and if you ever need to use this device tree in
> e.g. U-boot (which also derives its DTS from the Linux kernel tree) it
> will break there.

Will do

> > +               regulator-always-on;
> > +               regulator-boot-on;
>
> Does it have to be always-on, boot-on? This looks like a hack to work
> around the fact that you didn't define the bridge node, which uses
> this as its supply. Please model the dependencies explicitly - most
> likely that will let you drop these attributes.

without these the the dp to HDMI bridge does not power up, and HPD
does not work,

> > +               regulator-max-microvolt =3D <3300000>;
> > +               regulator-min-microvolt =3D <3300000>;
>
> It's two separate regulators on your schematic, one DCDC at 1.25V and
> the other a load switch at 3.3V, driving six separate voltage inputs
> of the DP bridge. They are both controlled by the same GPIO pin
> though, so _maybe_ it's okay to have just one "virtual" node like this
> to model them together. Would be great for the DT maintainers to weigh
> in on this.
>
> > +               regulator-name =3D "vcc3v3_dp";
> > +               vin-supply =3D <&vcc_3v3_s3>;
> > +       };
> > +
> > +       vcc3v3_phy1: regulator-vcc3v3-phy1 {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> > +               regulator-boot-on;
>
> See above
>
> > +               regulator-max-microvolt =3D <3300000>;
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-name =3D "vcc3v3_phy1";
> > +               startup-delay-us =3D <50000>;
> > +               vin-supply =3D <&vcc_3v3_s3>;
> > +       };
> > +
> > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-name =3D "vcc5v0_otg";
> > +               vin-supply =3D <&vcc5v0_sys>;
> > +       };
> > +
> > +       sdio_pwrseq: sdio-pwrseq {
> > +               compatible =3D "mmc-pwrseq-simple";
> > +               clocks =3D <&hym8563>;
> > +               clock-names =3D "ext_clock";
> > +               post-power-on-delay-ms =3D <200>;
> > +               reset-gpios =3D <&gpio0 RK_PD0 GPIO_ACTIVE_LOW>;
>
> This GPIO also needs a pinctrl
>
> > +       };
> > +
> > +       typea_con: usb-a-connector {
> > +               compatible =3D "usb-a-connector";
> > +               data-role =3D "host";
> > +               label =3D "USB3 Type-A";
> > +               power-role =3D "source";
> > +               vbus-supply =3D <&vcc5v0_otg>;
> > +       };
> > +};
> > +
> > +&dp0 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&dp0m0_pins>;
>
> This switches your HPD pin to the native DP controller handling
> (DP0_HPDIN_M0), so the GPIO bits you've patched into the controller
> driver aren't even used, and it doesn't look like you tested that code
> path.

Right, I had not meant to include. It was something I had worked on in
refactoring it and went a different route.

>
> > +       status =3D "okay";
> > +};
> > +
> > +&dp0_in {
> > +       dp0_in_vp1: endpoint {
> > +               remote-endpoint =3D <&vp1_out_dp0>;
> > +       };
> > +};
> > +
> > +&dp0_out {
> > +       dp0_out_con: endpoint {
> > +               remote-endpoint =3D <&dp_con_in>;
>
> This will need to be rewritten once you add the proper bridge chain
> leading up to the HDMI type A connector.

Yep

> > +       };
> > +};
> > +
> > +&i2c1 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c1m4_xfer>;
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c3 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c3m0_xfer>;
> > +       status =3D "okay";
> > +
> > +       es8388: audio-codec@11 {
> > +               compatible =3D "everest,es8388", "everest,es8328";
> > +               reg =3D <0x11>;
> > +               #sound-dai-cells =3D <0>;
> > +               AVDD-supply =3D <&vcc_3v3_s0>;
>
> Are you sure? Schematic says VCCA_3V3_S0, which is a different
> regulator (PLDO4 output of the PMIC)
>
> > +               DVDD-supply =3D <&vcc_1v8_s0>;
>
> Schematic says VCCA_1V8_S0, which is a different regulator (PLDO1
> output of the PMIC)
>
> > +               HPVDD-supply =3D <&vcc_3v3_s0>;
>
> Schematic says VCCA_3V3_S0
>
> > +               PVDD-supply =3D <&vcc_3v3_s0>;
>
> Schematic says VCCA_1V8_S0

I will rename these. It was what was used in the original orange pi 5
boards and was carried over, but looking at their schematics, they are
labeled the same so changing makes sense. after digging in the Pi 5
Pro names two of the regulators differently to the 5 and 5b. and the
naming of the current ones does not match the schematic

>
> > +               assigned-clock-rates =3D <12288000>;
> > +               assigned-clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> > +               clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&i2s2m1_mclk>;
> > +       };
> > +};
> > +
> > +&i2c4 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c4m3_xfer>;
> > +       status =3D "okay";
> > +};
> > +
> > +&i2s2_2ch {
> > +       pinctrl-0 =3D <&i2s2m1_lrck &i2s2m1_sclk
> > +                    &i2s2m1_sdi &i2s2m1_sdo>;
> > +       status =3D "okay";
> > +};
> > +
> > +&package_thermal {
> > +       polling-delay =3D <1000>;
> > +
> > +       cooling-maps {
> > +               map0 {
> > +                       trip =3D <&package_fan0>;
> > +                       cooling-device =3D <&fan THERMAL_NO_LIMIT 1>;
> > +               };
> > +
> > +               map1 {
> > +                       trip =3D <&package_fan1>;
> > +                       cooling-device =3D <&fan 2 THERMAL_NO_LIMIT>;
> > +               };
> > +       };
> > +
> > +       trips {
> > +               package_fan0: package-fan0 {
> > +                       hysteresis =3D <2000>;
> > +                       temperature =3D <55000>;
> > +                       type =3D "active";
> > +               };
> > +
> > +               package_fan1: package-fan1 {
> > +                       hysteresis =3D <2000>;
> > +                       temperature =3D <65000>;
> > +                       type =3D "active";
> > +               };
> > +       };
> > +};
> > +
> > +/* NVMe */
> > +&pcie2x1l1 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pcie30x1m1_1_clkreqn &pcie30x1m1_1_waken>;
> > +       reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
>
> The GPIO also needs a pinctrl
Will fix

> > +       supports-clkreq;
> > +       vpcie3v3-supply =3D <&vcc_3v3_s3>;
> > +       status =3D "okay";
> > +};
> > +
> > +/* NIC */
> > +&pcie2x1l2 {
> > +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
>
> The GPIO also needs a pinctrl
Will fix

> > +       vpcie3v3-supply =3D <&vcc3v3_phy1>;
> > +       status =3D "okay";
> > +};
> > +
> > +&pinctrl {
> > +       bluetooth {
> > +               bt_wake_gpio: bt-wake-pin {
> > +                       rockchip,pins =3D <0 RK_PC6 RK_FUNC_GPIO &pcfg_=
pull_none>;
> > +               };
> > +
> > +               bt_wake_host_irq: bt-wake-host-irq {
> > +                       rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_=
pull_down>;
> > +               };
> > +       };
> > +
> > +       usb {
> > +               vcc5v0_otg_en: vcc5v0-otg-en {
> > +                       rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_=
pull_none>;
> > +               };
> > +       };
> > +
> > +       wlan {
> > +               wifi_host_wake_irq: wifi-host-wake-irq {
> > +                       rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_=
pull_down>;
> > +               };
> > +       };
> > +};
> > +
> > +&pwm15 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pwm15m2_pins>;
> > +       status =3D "okay";
> > +};
> > +
> > +&pwm2 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pwm2m1_pins>;
> > +       status =3D "okay";
> > +};
> > +
> > +&pwm3 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pwm3m2_pins>;
> > +       status =3D "okay";
> > +};
> > +
> > +&sdhci {
> > +       status =3D "okay";
> > +};
> > +
> > +&sdio {
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
> > +       bus-width =3D <4>;
> > +       cap-sd-highspeed;
> > +       cap-sdio-irq;
> > +       keep-power-in-suspend;
> > +       max-frequency =3D <150000000>;
> > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > +       no-mmc;
> > +       no-sd;
> > +       non-removable;
> > +       sd-uhs-sdr104;
> > +       status =3D "okay";
> > +
> > +       ap6256: wifi@1 {
> > +               compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac=
";
> > +               reg =3D <1>;
> > +               interrupt-names =3D "host-wake";
> > +               interrupt-parent =3D <&gpio0>;
> > +               interrupts =3D <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&wifi_host_wake_irq>;
> > +       };
> > +};
> > +
> > +&uart9 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
> > +       uart-has-rtscts;
> > +       status =3D "okay";
> > +
> > +       bluetooth {
> > +               compatible =3D "brcm,bcm4345c5";
> > +               clocks =3D <&hym8563>;
> > +               clock-names =3D "lpo";
> > +               device-wakeup-gpios =3D <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH=
>;
> > +               interrupt-names =3D "host-wakeup";
> > +               interrupt-parent =3D <&gpio0>;
> > +               interrupts =3D <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
> > +               max-speed =3D <1500000>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&bt_wake_host_irq &bt_wake_gpio>;
> > +               shutdown-gpios =3D <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
> > +               vbat-supply =3D <&vcc_3v3_s3>;
> > +               vddio-supply =3D <&vcc_1v8_s3>;
> > +       };
> > +};
> > +
> > +&usb_host0_xhci {
> > +       dr_mode =3D "host";
> > +};
> > +
> > +&usbdp_phy0 {
> > +       rockchip,dp-lane-mux =3D <0 1>;
>
> I'm wondering if the DP controller's "out" endpoint should go to the
> PHY instead of directly to the connector/bridge. That would describe
> the hardware better.

This was initially added to make sure that the type A port worked
because it uses lanes 2/3, and I needed to make sure 0/1, which route
to the dp were allocated. The DP PHY is already tied to the controller
via the phys property on &dp0 (inherited from rk3588s.dtsi), and the
lane mux is set via rockchip,dp-lane-mux on &usbdp_phy0. This matches
the convention used by rk3588-evb2-v10, rk3588s-coolpi-4b, and
rk3588s-indiedroid-nova =E2=80=94 routing the dp0_out endpoint through the =
PHY
would diverge from the existing binding and all in-tree users.

> > +};
> > +
> > +&vp1 {
> > +       vp1_out_dp0: endpoint@a {
> > +               reg =3D <ROCKCHIP_VOP2_EP_DP0>;
> > +               remote-endpoint =3D <&dp0_in_vp1>;
> > +       };
> > +};
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/=
bridge/synopsys/dw-dp.c
> > index fd23ca2834b0..b58f57b69b22 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > @@ -8,6 +8,7 @@
> >   */
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/irq.h>
> >  #include <linux/media-bus-format.h>
> > @@ -330,6 +331,8 @@ struct dw_dp {
> >         u8 pixel_mode;
> >
> >         DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
> > +
> > +       struct gpio_desc *hpd_gpiod;
> >  };
> >
> >  enum {
> > @@ -481,6 +484,9 @@ static bool dw_dp_hpd_detect(struct dw_dp *dp)
> >  {
> >         u32 value;
> >
> > +       if (dp->hpd_gpiod)
> > +               return gpiod_get_value_cansleep(dp->hpd_gpiod);
> > +
> >         regmap_read(dp->regmap, DW_DP_HPD_STATUS, &value);
> >
> >         return FIELD_GET(HPD_STATE, value) =3D=3D DW_DP_HPD_STATE_PLUG;
> > @@ -2002,6 +2008,12 @@ struct dw_dp *dw_dp_bind(struct device *dev, str=
uct drm_encoder *encoder,
> >                 return ERR_CAST(dp->regmap);
> >         }
> >
> > +       dp->hpd_gpiod =3D devm_gpiod_get_optional(dev, "hpd", GPIOD_IN)=
;
>
> Not tested, not needed, why bother?..

this is not needed

> Best regards,
> Alexey

Thanks for the feedback


Dennis
