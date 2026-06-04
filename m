Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD48325B0A7
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 02:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780541396; cv=pass; b=mTIqoJoJrWn5SqRB7OLfW/BMeZO9alNKyoe5bGU7wE/K8CcEeUIYPjIcf0LUQiojK7Sr6fEfUOweMUFiA0u9GNTUIZ+XWpHsCs2CeeQikCve3uxZSYSFGBEzfHbTQ+LNy79jO8FiuPrlH35eaQA0h/Smccg/KaMDOMKnid2/B7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780541396; c=relaxed/simple;
	bh=zC85CBH3ZSSfhzj5A1A0uZaJCXxlC6oWbkezPSVvkzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpuDlJlqN3nzp1/14ZZ6kTPn6fkiHNjwd68gpzuBcb0isQigq+s/7Ke+wpyH6oODy7kUo/8HZGdihK5FvMDmCo/mghX6+BDjiOJK9oenh4wrhVUnavCgVvR21/SYKOVfUyZ59DHofT77TLbpkPQDWFSYA6f3oadNnG502CIs1d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=Tk5fMds7; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="Tk5fMds7"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9159951f05aso31677085a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 19:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780541394; cv=none;
        d=google.com; s=arc-20240605;
        b=HrCSpbIsXZmG6qfObvDrO0+NZWuRPgUnZ5ezrBq1COHzykpSV9kKqtJ5UPNrVdLxJa
         4ejMAjqWcK/2uVnMT0J6mvLV3LsOJjFNK0jZIf7SSB+7P3MqQNm8NiPdfxbCSMJ4bIPm
         lVxJ9UTNKpuJyqgI2c+xMppDDp2wOVHfgwkHeZjv5ht5pOy9qNAxeUPKwRZ+8eOtFX+h
         GFgqgrwptq9ztbM4f8d0nfw4m83lQ+gQQYg/Vxf1lZlPEHIkF4nl1NWFOEtrFmnob3sE
         4Ut0FJ+7yQJom5h+X8ZbWmZmOU5YXODMGUjdaRgIEjjHzCljWUsf0hFs+Y6vFE/kAu0I
         nBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+w5xOH62tQlcUvjfnW2Mk7J5EBv1R2A9HmsoMIK4klM=;
        fh=h6Th2yuHiEiKkZTAyLTphwxAlQTCIkMJidg60kC2oCA=;
        b=gT3GAmRilLEbd157xT2pMOV7oidjulglnLszxouRHPhF+xuv7Y+TMzfKJqOHjwOelv
         QGizLS4CDobJZo6/yJ1ikMksVerkSwbAPHsVECHFBRrTtwly0JarE9StwvxGYC3H/AHZ
         4d1suWfavq3fWFwlxUADcEU8NXXtAMqsLcJqBCjfXq4r5gc2Ms1+0aMhsSyiu9yTJekT
         a3+my4CNO7UgXw8pigreLel362dhePEl8pcif32UnLZi7qhRFWPFSjta9a3+0yySYScb
         enCSBwz7x11qbaP1FyNCfWlwUCpC8E3SH0bFQEGTxwDsSLspvUgDeTMqlK9A7tEULQyi
         x7ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1780541394; x=1781146194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+w5xOH62tQlcUvjfnW2Mk7J5EBv1R2A9HmsoMIK4klM=;
        b=Tk5fMds73C8VuoAo1Pr01zkNGgCgfOjGUeijuizUzTJruJelcntkYDcPCUXad1KFfb
         zAKnYfcJ7e3qHbEjWSVT1F77LC+nLS3zWovPbKanLxxyXFxwhh7imnHJ8caj4mwSKh61
         BNj4maTRBR7ICANBuf9jW5lDnmY09OfHspplmlEl/KSwOUHv6TnGYSpaqNVGRJp3IOY4
         +30bNFMgr4a6XhHoLB3SuTl+i0kHZ2vs99hWR25IiLjupqj70AOb6Kys8PBogTpAganc
         dMiCvWDHp708jjK/Zs/CgRI0whfxKzn0bN13yLrAUNg4DF0pyuBDFVQiByrGm57A+eiB
         0bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780541394; x=1781146194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+w5xOH62tQlcUvjfnW2Mk7J5EBv1R2A9HmsoMIK4klM=;
        b=Q+Nb3fl/npdr5/Y2+bIQghM9OrbeZS60Y6ELvMBpHEP1e4n90p9Jc+tYK4nVtIRtqG
         /L3LOaCVf44xqltzhZ3DHxAw5BkfWlMEjivo293lxhHv19GedwcEFrZFY5MHuz0PFAFK
         mtdaFRryV7idKa/jjG3JQM+HyQcJUSJvje1CVbEVvXuVhKez87TuRQRxVnzVhLYBqvBQ
         5BUIS5MoFl97AXY17MOd9q/tlFQ1367TZe2O6wFc2LAFH4vAbnRI2hH5Q3QmRwd7ZEOj
         sZOhgpnrUHgOYKnoXgg9OoFJbImtLiNNYvrxG17X4FxK/ulCZH9exrUGxTtsodUPmJsp
         N/MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZPYSfeSANJjJkJ2R9RtibWS4EpIXnISMIg+ZG7ZsGO6HDn3e/ZjFVVEU9kC8v2kuNAEiNK4YiLHkt@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg289PB8s25tnbVKeIFXS50TgcIj4NtaEe7zslgXFy9WZwHoUJ
	/IJXpmdfTeNbbjejn6lNe55JpLN3yjAXjxx6ARhpUC4JIpcM31OHH73xKZNsUeE1VzuUoaZCW5L
	MxP0Y247S7fd30M+aQR7pveFzREqh6Wn5A4GThGlMcd+K6SJPE6sAL90=
X-Gm-Gg: Acq92OEqB0T9l/Spdqc2mTJH9TcDBtsJg7K6m839+4jHsPhWgnKD98chbyQ9ktlLtVd
	cve7oDMZ8QCfLCwW70o/+n3Af5UqQO7fqBYTAFehONYcXO2Ns/MAnFAQQPzk9mP2CnefKkGRzKj
	Rknuk6njmBJZRiim7WNZSVFEhP3fY6On+pVGVlwz4Xn0I4KdNzjnH41XWbS8VFCHVqPt7j8N7rl
	MmmS/J0k6H0wppmPD5b7/mic9U1e9fOeXUESw7w4jBZ3BR2cNB+JVVpiV6D7SICoN0KyswoPaXp
	wr2J/ZcLfLVKWZ7XLs2pyxeTFc4s7Y+s+oF6iv6Efx4ZWEL7dMn3swYga/R0JgMJbXHvijXtZ+G
	xhcBYjQ==
X-Received: by 2002:a05:622a:610c:b0:516:f4f7:3315 with SMTP id
 d75a77b69052e-517787a81c3mr90745271cf.57.1780541393683; Wed, 03 Jun 2026
 19:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511025352.106126-1-dennis@ausil.us>
In-Reply-To: <20260511025352.106126-1-dennis@ausil.us>
From: Dennis Gilmore <dennis@ausil.us>
Date: Wed, 3 Jun 2026 21:49:41 -0500
X-Gm-Features: AVHnY4LhLvbE85WDi5tseUk06DljGzo4-m7hp6BtGBWQK2Ylp4pYx5qPjbkk-Fo
Message-ID: <CAABkxwvWNvZbGNRYGQVnrORr0ycXFY=SdUTD9Oe9tkPcdPSUEA@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] Add support for Orange Pi 5 Pro
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Alexey Charkov <alchark@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	FUKAUMI Naoki <naoki@radxa.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just checking if anything else is needed.

Dennis

On Sun, May 10, 2026 at 9:53=E2=80=AFPM Dennis Gilmore <dennis@ausil.us> wr=
ote:
>
> This series adds initial support for the Xunlong Orange Pi 5 Pro, based o=
n
> the Rockchip RK3588S SoC. The board features eMMC, SD card, NVMe (PCIe),
> a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), HDMI connected to SoC
> (Second port is disabled in this patch), and a 40-pin expansion header.
>
> The series was tested against Linux 7.0
>
> Please take a look.
>
> Thank you,
>
> Dennis Gilmore
>
> Changes in v10:
> - rename rk806_single to rk806
> - link to v9: https://lore.kernel.org/linux-devicetree/20260429024737.544=
813-5-dennis@ausil.us/
>
> Changes in v9:
> - removed support for the dp-to-HDMI bridge, will send in a second patch
>   set to enable discusion to finish on how to handle its two operating
>   modes
> - link to v8: https://lore.kernel.org/linux-devicetree/20260425031011.252=
9364-1-dennis@ausil.us/
>
> Changes in v8:
> - Bridge node: renamed label from lt8711uxd to hdmi-bridge
> - Bridge node: added vdd-supply =3D <&vcc3v3_dp>. The vcc3v3_dp regulator
>   gates power to the LT8711UXD. regulator-always-on is kept because
>   drm_simple_bridge only enables vdd-supply with HPD which does not
>   happen without power on
> - GPIO output pinctrl groups (bt_wake_gpio, dp_bridge_en, ethernet_en,
>   vcc5v0_otg_en, wifi_enable_h) changed from pcfg_pull_none to
>   pcfg_pull_down to match the RK3588S power-on-reset default state
> - pcie2x1l1 (NVMe): switched from GPIO-mode reset to hardware sideband pi=
ns
>   using pinctrl-0 =3D <&pcie30x1m1_1_perstn>, <&pcie30x1m1_1_clkreqn>,
>   <&pcie30x1m1_1_waken>. Note: despite the "pcie30" prefix in the DTSI
>   group names, the SoC pin-mux table confirms these alt-function 4 pads
>   physically route to pcie2x1l1's native PERST#/CLKREQ#/WAKE# inputs.
>   reset-gpios is retained alongside the pinctrl entry for U-Boot
>   compatibility (pcie_dw_rockchip in U-Boot requires reset-gpios).
> - pcie2x1l2 (NIC): added &pcie20x1m0_clkreqn and &pcie20x1m0_waken to
>   pinctrl-0
> - Renamed pinctrl group vcc3v3_phy1_en to ethernet_en to match the
>   schematic signal name (Ethernet_EN)
> - link to v7: https://lore.kernel.org/linux-devicetree/20260414214104.136=
3987-1-dennis@ausil.us/
>
> Changes in v7:
> - Fix up whitespace issues identified by checkpatch.pl --strict in
>   rk3588s-orangepi-5-5b.dtsi
> - checkpatch gave a warning for WARNING: phy-mode "rgmii-rxid" without
>   comment, as this was moved over I left it untouched
> - Added lontium,lt8711uxd to the compatible enum in the simple-bridge
>   binding
> - Added lontium,lt8711uxd match entry with DRM_MODE_CONNECTOR_HDMIA to
>   the simple-bridge driver
> - New patch to rename the regulator labels for the es8388 supplies to
>   match the schematics and they all use vcca_*
> - Fixed ES8388 PVDD-supply =E2=80=94 vcca_3v3_s0 =E2=86=92 vcca_1v8_s0, 5=
 Pro is
>   different to 5 and 5b.
> - analog-sound: use CPU-as-clock-master on the Pro. The ES8388 is wired t=
o
>   i2s2_2ch (the only I2S block physically routed to the codec pins on thi=
s
>   board), which uses the legacy rockchip_i2s driver. That driver's
>   slave-mode trigger path hangs for 200 =C2=B5s polling I2S_CLR and bails=
 with
>   -ETIMEDOUT ("lrclk update failed"). The TDM-capable i2s0/i2s1/i2s5
>   blocks served by rockchip_i2s_tdm don't have this issue, which is why
>   other mainline ES8388 boards get away with bitclock-master =3D masterda=
i.
>   Drop bitclock-master/frame-master and the masterdai label to let the I2=
S
>   block generate BCLK/LRCK itself
> - Removed regulator-always-on/regulator-boot-on from vcc3v3_dp
> - Added pinctrl entries for all GPIO pins (dp_bridge_en, vcc3v3_phy1_en,
>   wifi_enable_h, pcie2x1l1_rst, pcie2x1l2_rst)
> - DP bridge rework =E2=80=94 replaced dp-connector node with proper chain=
:
>     - lt8711uxd bridge node (compatible lontium,lt8711uxd, with port@0/po=
rt@1
>       endpoints). Bridge power is gated by the vcc3v3_dp regulator, whose
>       enable GPIO (GPIO3_PC2) is driven via the dp_bridge_en pinctrl grou=
p;
>       no enable-gpios/vdd-supply on the bridge node itself.
>     - hdmi1-con connector node (compatible hdmi-connector, type a)
>     - dp0_out endpoint now points to bridge input instead of old connecto=
r
> - remove accidentally included unnecessary changes
> - link to v6: https://lore.kernel.org/linux-devicetree/20260411024743.195=
385-1-dennis@ausil.us/
>
> Changes in v6:
> - Move the shared configs for the Orange Pi 5 and Orange Pi 5b from each
>   devices dts to a shared rk3588s-orangepi-5-5b.dtsi to avoid duplication
> - Remove empty ports subnodeis from typea_con
> - Move i2s2m1_mclk pinctrl from &i2s2 to the es8388 codec node
> - Add dp-con, dp0_out, dp0_in, and vp1 nodes, plus the vcc3v3_dp regulato=
r
>   in order to get the second HDMI port working via its transparent
>   LT8711UXD DP to HDMI bridge
> - link to v5: https://lore.kernel.org/linux-devicetree/20260401010707.258=
4962-1-dennis@ausil.us/
>
> Changes in v5:
> - define a connector node for Type-A port, and list the regulator as its =
VBUS supply explicitly.
> - Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a=
4c2@flipper.net/
> - link to v4: https://lore.kernel.org/linux-devicetree/20260310031002.392=
1234-1-dennis@ausil.us/
>
> Changes in v4:
> - rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy1 =
to match the schematic
> - use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
> - remove the definition for vcc3v3_pcie_m2 as it does not really exist
>   as a regulator
> - link to v3: https://lore.kernel.org/linux-devicetree/20260306024634.239=
614-1-dennis@ausil.us/
>
> Changes in v3:
> - moved leds from gpio-leds to pwm-leds
> - remove disable-wp from sdio
> - rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
>   purpose
> - actually clean up the delete lines and comments missed in v2
> - link to v2: https://lore.kernel.org/linux-devicetree/20260304025521.210=
377-1-dennis@ausil.us/
>
> Changes in v2:
> - moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
>   dts files
> - removed all the comments and deleted properties from 5 Pro dts
> - link to v1: https://lore.kernel.org/linux-devicetree/20260228205418.294=
4620-1-dennis@ausil.us/
>
> Dennis Gilmore (4):
>   dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
>   arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels
>     to match schematic
>   arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
>     Pro
>   arm64: dts: rockchip: Add Orange Pi 5 Pro board support
>
>  .../devicetree/bindings/arm/rockchip.yaml     |   1 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 256 +++++++++++++
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 358 ++++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 263 +------------
>  .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
>  7 files changed, 637 insertions(+), 250 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dt=
si
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.d=
ts
>
> --
> 2.54.0
>
