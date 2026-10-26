Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792985697;
	b=Oda4uMxoGTgZHswC43AkiSjwKDl6p7F3xSSqf0Vz+8dGQw1kVPPSEaWkCML8FCm/QB+f
	 xVimoBTf4tNoF1dg7KWFB9BJFvCONdv9SNQVzi/MTjgsOHuiL9A9xLKjNDiqMVBHThCIe
	 wgkR8OwzKqm7l0Z5gFugG1fduNhYiBBMF0qznMWEMyqM0SURIE3sikRq1Yz/jvaAOVK4o
	 Yy0eqa2AgJWRbRq4w3nchdSZyzuLpXFKq0WBKGb6TpDfyKcqOvId4grZH4fc/BrAydu84
	 +0nwGug30VXzcwq/xqE89I00Hj7iwTLcrazi8aVHO3lEZy90ImFOeGnDOloI9nCNIhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=qvFzouQF9MYPvoxr1/BdmBibADJU3LaIGGor9Gt6xfo=;
	b=DKpnlZ7I0mi0mNhB0vHPBYGbLydS3BXFGQgVGSygbypQpajgRZcx4dqkMFBY21CrRgiF
	 KJPKSOJXwNDtitg7uv3Tt4bP/KLdcHJ9D48Y869EEiThjLoXcReLTwb78WWBTiIX6i/MR
	 Tl0adaaia25h0cRulolfWEtkC4MJXJ0K9z3lGufWHiA40rrDXvc+G4uDMuWR64G/g32Qm
	 Bi4O0cYDr2SK4YlMGEypWYdJAhExCiheGTDh/zU+nVrQm5+uiN3KUlqzQD7y/eJa0AJtF
	 IDN4yw8Tn9uIkZmn21Q0QPxmCIc6hjqSZ4Kn85OI+wck8CTH2jWIi14rBBEZlDRNn3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rYMiA8ys;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42F606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B42F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rYMiA8ys
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ab43af5e97so24110077b3.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792985695; cv=none;
        d=google.com; s=arc-20260327;
        b=CySTEncT/lOtIsAeHdH8PFmJEBRYw/AGGqFD5CNqQpuoPp79Dt7TibKtVnsS+zqyaY
         w1LjLX06LsPmpLFg1Ro8kj4ykXiPN2AsNUidS/pfOSiSxxjlYd9d1KCoQW1ClnM6d9mq
         6fR+cae436SRWo0nBi2ZgaUIBVuvO4NG+paXVK20KlEPKIpzeXy/GfM9hLcQgH0htysq
         JxEwXMf/OQLvfaSu9HzF0wdU2gDmIvnCrsok1CmoQtdZhXNMhY7AnZSkzRHhYUI9pLbJ
         gJzInQZe0knM/VJ+h7GRArkBCRYtV+uGgurwo8h5L6qxq4I968GmL7/nZY8qZIKf7TQh
         wDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvFzouQF9MYPvoxr1/BdmBibADJU3LaIGGor9Gt6xfo=;
        fh=PbChHt5XpJJeDpu1jYqD2a2ECrFXEXj2ERT9iTYtjHs=;
        b=oWjXL6S3EfWMWp6coFTn88J0xIwwPT8Gfjsaz2CpCvHQqqprKKRwubEGXCfhS4/BnS
         7YhfG+qceoUXEbCvTe9033zkU0V9W15Bxw2VvF4JxxLwRQYHj8jNhCJ8nrrw0+FdHzji
         wW8+eDDumtXjsjaXhauMe58q7ABN8V0qEBNaNBYph7xEDpFeaG/7zMV1pRnTD7U0WSVl
         +pun/wPB9640hVSL3vC2vEtL1MuN3lxx3oyQta4/gCU5hKxQLZY9xRVl2vVpHopfjg4x
         vRiocnnYpL5RCodf+GV7LI+pKd6+u+kiTck5BDBnNh+QK+Y8nGXi4mUlKiBi4LUSM4wD
         /84A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985695; x=1793590495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qvFzouQF9MYPvoxr1/BdmBibADJU3LaIGGor9Gt6xfo=;
        b=rYMiA8ysjT5IvjhuRemw0Avujdi5FohZAKqBHSePrqVcvcHGeuM6gHIZmURwcGTHim
         heMyODVoa6U26ievDtI2Zu2udRuZ0xvzaBBGO1GAfz+GA1WSaU5KiZdCje6huqfLsihS
         Uv0/dQ0+eJ/d8pAfztHWmPZ56DRXNpbc6VvPe0FK6jNhZTfXJUqJnQtTo9pnxLBnQyNO
         rT/pYdbDjrYDvG0ds/GmbO4WOjC1AfRRRDrwl4RKCNHepWwoTembmLv1V1iy6XRojUhK
         ThYl/9cEhZJ9Zw47ojh4+g9w6dTdF/HeohajtqhHUvxiFZMd635zXBxB48SEelhcqWK7
         jHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985695; x=1793590495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvFzouQF9MYPvoxr1/BdmBibADJU3LaIGGor9Gt6xfo=;
        b=UCK1XUpO9KkNHQBRLzSp6TI9/YJPmGVo46cC8HAhfV6TU02UVGxBX1Hn4wQGldgx1G
         n+oxFG2mvd9wM25qF+b9x2FHztQP2+482HNPvRznvl0R/43IWXkJdkL0u7J5jmOSKRpv
         hlRV8osG03bBIz877qaPhUO1ZNkzwyOIBmPpEOt8lViRHdfu9PktJrGeek35yH4hhfpk
         r5cIIqu9+A9CcVILNL4EN2MabYKGAIJlgMYoz7jsvkQWYHwUtfrOnh/ey1fNpa+A2xvY
         ZEMt0Ckjd6kp3UTwH2R2nh25btOezynEdw/Hn5Fwem/qOeIJdZ2h4txjwkDeB8UUcuGt
         Fy3g==
X-Gm-Message-State: AFq9FYIG+M/d+QkJJMAKAXsKnf/JV0HUDr+z1ZScTz08bdsBs1c5s0c4
	yRS2CC+VIxybNY6mACcTl6KJ6/HYbIgByKilVgLI0Yk1X8JAfqtjil01edTkhRqvA/1lwraX05h
	ZSZpZXFocZictSUzPizgASqks2NSBCKR/nrOy
X-Gm-Gg: AYBFou3s4DaiLnBo/XZn8P2xfYn4zX5S/MMB1Bd5PJ9Z7VWyOztnU7Zve095UFMFEIS
	u3bsxd5d0VuujdQlLIo4OhA5135aa9/4dDbdsvHL10e3IBZChp4qp71weWGnTMHMXMQP2K3TWWx
	S42hp7s0BtsnffRsX0i9tJI3qYeGtXTvxqCC22GwcmwS45lWVrbKP2U1qmqSWYlQZZ1YYD3JRaz
	Qw4fNGpfGrgqB4cdzs+BFKjTfrz54h24TT6iqijy0AoWYo8p6OC4HY72akibi2s2Nd0+pU1WtCl
	/zGbuyAxKre810QECtoCKbywrOVKk5l+dkpvXqH0n72fDvC4Gmue54CmVbY9rWmdR27pGa6OCj4
	WEH2L7V6dUw05zpZpwFykDDUpI4ajUfwptSPt
X-Received: by 2002:a05:690c:e3cc:b0:8b0:56e6:54ff with SMTP id
 00721157ae682-8b1671e0cb1mr39578197b3.6.1792985695228; Sun, 25 Oct 2026
 20:34:55 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com> <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 26 Oct 2026 09:04:44 +0530
X-Gm-Features: AclHuK9g2QPyjNGvOYOKw3ICZuN5ZkwaHqbNNAHIXI0yRtldeEML3mZWQVHrKk0
Message-ID: <CAMFFDGjmJTRR8GOX=S+kKnMA-bG+gbZP0sS8dG_d+taDPPRDZQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

A gentle follow-up on the B650D4U BMC device-tree series posted on October =
2.

Could you please let me know whether any further changes or validation
are needed before this series can be picked up?

Thanks,
Prasanth

On Fri, Oct 2, 2026 at 11:59=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:
>
> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
>
> Describe the BMC memory, SPI NOR flash layout, UART console,
> GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> connected to an RTL8211F Ethernet PHY.
>
> Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
>
> Configure MAC0 to use the RTL8211F in RGMII-ID mode.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dt=
s
>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 6b68671f9379..b109491d5c8f 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         aspeed-bmc-ampere-mtmitchell.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-asrock-altrad8.dtb \
> +       aspeed-bmc-asrock-b650d4u.dtb \
>         aspeed-bmc-asrock-e3c246d4i.dtb \
>         aspeed-bmc-asrock-e3c256d4i.dtb \
>         aspeed-bmc-asrock-paul-ipmi-card.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000000..a4e384588a54
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +       compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> +       model =3D "ASRock Rack B650D4U BMC";
> +
> +       aliases {
> +               serial0 =3D &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               ranges;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +
> +               gfx_memory: framebuffer {
> +                       compatible =3D "shared-dma-pool";
> +                       alignment =3D <0x01000000>;
> +                       reusable;
> +                       size =3D <0x01000000>;
> +               };
> +       };
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +
> +       flash@0 {
> +               compatible =3D "jedec,spi-nor";
> +               reg =3D <0>;
> +               label =3D "bmc";
> +               spi-max-frequency =3D <50000000>;
> +               spi-rx-bus-width =3D <4>;
> +               m25p,fast-read;
> +
> +               status =3D "okay";
> +
> +#include "openbmc-flash-layout-64.dtsi"
> +       };
> +};
> +
> +&gfx {
> +       memory-region =3D <&gfx_memory>;
> +
> +       status =3D "okay";
> +};
> +
> +&gpio0 {
> +       gpio-line-names =3D
> +               /* A0-A7 */     "","","","","","","","",
> +               /* B0-B7 */     "","","","","","","","",
> +               /* C0-C7 */     "","","","","","","","",
> +               /* D0-D7 */     "","","","","","","","",
> +               /* E0-E7 */     "","","","","","","","",
> +               /* F0-F7 */     "","","","","","","","",
> +               /* G0-G7 */     "","","","","","","","",
> +               /* H0-H7 */     "","","","","","","","",
> +               /* I0-I7 */     "","","","","","","","",
> +               /* J0-J7 */     "","","","","","","","",
> +               /* K0-K7 */     "","","","","","","","",
> +               /* L0-L7 */     "","","","","","","","",
> +               /* M0-M7 */     "","","","","","","","",
> +               /* N0-N7 */     "","","","","","","","",
> +               /* O0-O7 */     "","","","","","","","",
> +               /* P0-P7 */     "button-reset-n","control-reset-n",
> +               "button-power-n","control-power-n",
> +               "button-nmi-n","control-nmi-n",
> +               "","",
> +               /* Q0-Q7 */     "","","","","","","","",
> +               /* R0-R7 */     "","","","","","","","",
> +               /* S0-S7 */     "","","","","","","","",
> +               /* T0-T7 */     "","","","","","","","",
> +               /* U0-U7 */     "","","","","","","","",
> +               /* V0-V7 */     "","","","","","","","",
> +               /* W0-W7 */     "","","","","","","","",
> +               /* X0-X7 */     "","","","","","","","",
> +               /* Y0-Y7 */     "","","","","","","","",
> +               /* Z0-Z7 */     "","","","","","","","";
> +};
> +
> +&i2c7 {
> +       status =3D "okay";
> +
> +       eeprom@57 {
> +               compatible =3D "atmel,24c128";
> +               reg =3D <0x57>;
> +               pagesize =3D <16>;
> +
> +               nvmem-layout {
> +                       compatible =3D "fixed-layout";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +
> +                       eth0_macaddress: macaddress@3f80 {
> +                               reg =3D <0x3f80 6>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mac0 {
> +       nvmem-cells =3D <&eth0_macaddress>;
> +       nvmem-cell-names =3D "mac-address";
> +       phy-handle =3D <&ethphy0>;
> +       phy-mode =3D "rgmii-id";
> +       pinctrl-0 =3D <&pinctrl_rgmii1_default>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +};
> +
> +&mdio0 {
> +       status =3D "okay";
> +
> +       ethphy0: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0>;
> +       };
> +};
> +
> +&uart5 {
> +       status =3D "okay";
> +};
> --
> 2.47.3
>
