Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF5E3815F0
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777086618; cv=none; b=RoFxamkjWwe6rbguzdN3uFi9duVVjy3AGyhsFrG/hQ7SDvEa/BQPkb89B8KZFW4xuA6yqAjI9hYtEoNQmZ74mL7sFoiIfMGg6hhNRZC+Ip6MPzHRlc1PKnv3mBbwfSm950WFM41izF2c3Jps8kr8G0vzvRykeH3cyBUIwujZrqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777086618; c=relaxed/simple;
	bh=8GOFmnl1KonKJRLpAbC2DSRi0HLySB4FtIdRaeKcGbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s03lcFp0ORXqMB6qKpoPcePFv5IvDRNkXMgLWbN9LBC0hMUX/Nxb8qAVmvDK13fLgsYLjBX4zTBpyb6NoFKUbpJRbKFc5zPaq6nTTfulcP0wBMgqJPHx12wBjsntW4q7sOI8CNVWa9Z0QN8McHDAHXM/OEIw1BPY9TKfRjlGQ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=IUR1LolQ; arc=none smtp.client-ip=74.125.82.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="IUR1LolQ"
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-2d868d014a5so8351278eec.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 20:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086616; x=1777691416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fvue385W0hX6gDR6DeAjBvEUcDEjMxESWf6pVitmIoY=;
        b=IUR1LolQLV1Y8+QBrIrUw8zpGfLs4D8vgvCpJI6b5qq4Q0MUmeQnC13/V8nxa/kyfw
         xsaGFgLwHe8xeVT/cghWSmht7xCeVslnCW/CMQPL2NValmcv7EBB8kXMeFEgQLVTRvqZ
         Hmd9zcAJ2Crp7OFhr0K9nAS4ZkemzGq91DQ/sYsmUZ5gijvNyW0g1daSqxJar/hnrc8U
         NcDCew84HkmCuXyFwLzf/TzSqtO9knzPOgwwRYn3BxoqkwlJEALKBIpM7yAe+xINMQ9O
         S0Hs98R7GhUzldvcy5wGRHKFLz7wa1oEhwkm5Pe3e72tv2QehSQSfB+F0N9sEqpuVYrh
         QdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086616; x=1777691416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fvue385W0hX6gDR6DeAjBvEUcDEjMxESWf6pVitmIoY=;
        b=Ho9g9KEsNLg0IiLPjCuR9QMmtzDriQwVg9hd3QJoXSQfDALpS1y0Bv9MFm0YIFt5Ul
         kYC+CTGot4pFtS3l5/6WptfRVWVkDhcfga+9Xik0IExj+itllE4Pj4+J1Z5exbeilXhv
         xlpsQ9Zd6S44rCaQYg8pkvOMPU0C8EasS3QmfSdsHDw/kdOrwaP+7hVKoEC3xKp3vOxN
         Wb91zn3wMMNzpwY26vDfzXHwQW/eUG2vs1t/ewHYlItjoviUa38Pw96UJxDuXeffCBW9
         rqpC4ZSXwrMK/YBe3ZVklmAeLSNZE0Kr4VL0RxVnSoSNpyBYDpSiM2rKbAu3fL6fmAjU
         AHYA==
X-Forwarded-Encrypted: i=1; AFNElJ+jVXm+s8ks8iWoVaFqFc9Txug7BVfHDcIlzmzD68IPDGzdrpxQCteB12NwH1Lf4ZnE++FM+p7j4dhA@vger.kernel.org
X-Gm-Message-State: AOJu0YzEBAMogyQIguWYL3ciijTBhv/CW0+K2s/g3NDxzc6XSrv1SZTX
	LefWcIzF5eCZ0OQErtPu3CLq4edDopr+aDyZdcrvT4pplf9dCT2s3/JCl1HAl0UeLEHXw2YqkFx
	AgaZnB5fg0NDuZqhlSM/4DU9pnpICyda+ET37
X-Gm-Gg: AeBDiet2vvsFAvmacBIVZXySJRbYqKd5ODSC8xW2xHHEzezHvF9bS1regN3GU93W8WK
	yzjiGDsbgT5AZ9pZodlAdIULmn3OVJJhJ+8k1h49/1mENDH0y6m9MfOeyaQER/ZmrMFWGP6NqYm
	gAgQr4JgyTLqxM67mtTbSu9rwYcvcobAdo4QW3rYHSAxvtkAfu4Yb8U3+id0oKC6W3BHGVAKRNx
	vn9PXSN0OuysIYNb1+i86dU9pO++L77hnshkc5jSAQqz1YKZ3KEx7uNMBGG/QVPuEUI5RFoFi3X
	KJcSNV4Pn3kejwoeQNJ4w4NXcDucxqOzoEi3cLBXEaXIA2iaIuDn9gl68TRVoazAb+22CotNWeP
	HYmMhG0IrXW1fEd87fQ/z76aUUSG51bBBPUY+J1+EFNqKHU2O1g/KWQA=
X-Received: by 2002:a05:7301:4586:b0:2e2:27bb:a4a2 with SMTP id 5a478bee46e88-2e47873a866mr19665803eec.13.1777086615769;
        Fri, 24 Apr 2026 20:10:15 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:15 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v8 0/6] Add support for Orange Pi 5 Pro
Date: Fri, 24 Apr 2026 22:10:05 -0500
Message-ID: <20260425031011.2529364-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds initial support for the Xunlong Orange Pi 5 Pro, based on
the Rockchip RK3588S SoC. The board features eMMC, SD card, NVMe (PCIe),
a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), dual HDMI output (the
second via a Lontium LT8711UXD DP-to-HDMI bridge on dp0), and a 40-pin
expansion header.

The series was tested against Linux 7.0

This series depends on:
  https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net/

Please take a look.

Thank you,

Dennis Gilmore

Changes in v8:
- Bridge node: renamed label from lt8711uxd to hdmi-bridge
- Bridge node: added vdd-supply = <&vcc3v3_dp>. The vcc3v3_dp regulator
  gates power to the LT8711UXD. regulator-always-on is kept because
  drm_simple_bridge only enables vdd-supply with HPD which does not
  happen without power on
- GPIO output pinctrl groups (bt_wake_gpio, dp_bridge_en, ethernet_en,
  vcc5v0_otg_en, wifi_enable_h) changed from pcfg_pull_none to
  pcfg_pull_down to match the RK3588S power-on-reset default state
- pcie2x1l1 (NVMe): switched from GPIO-mode reset to hardware sideband pins
  using pinctrl-0 = <&pcie30x1m1_1_perstn>, <&pcie30x1m1_1_clkreqn>,
  <&pcie30x1m1_1_waken>. Note: despite the "pcie30" prefix in the DTSI
  group names, the SoC pin-mux table confirms these alt-function 4 pads
  physically route to pcie2x1l1's native PERST#/CLKREQ#/WAKE# inputs.
  reset-gpios is retained alongside the pinctrl entry for U-Boot
  compatibility (pcie_dw_rockchip in U-Boot requires reset-gpios).
- pcie2x1l2 (NIC): added &pcie20x1m0_clkreqn and &pcie20x1m0_waken to
  pinctrl-0
- Renamed pinctrl group vcc3v3_phy1_en to ethernet_en to match the
  schematic signal name (Ethernet_EN)
- link to v7: https://lore.kernel.org/linux-devicetree/20260414214104.1363987-1-dennis@ausil.us/

Changes in v7:
- Fix up whitespace issues identified by checkpatch.pl --strict in
  rk3588s-orangepi-5-5b.dtsi
- checkpatch gave a warning for WARNING: phy-mode "rgmii-rxid" without
  comment, as this was moved over I left it untouched
- Added lontium,lt8711uxd to the compatible enum in the simple-bridge
  binding
- Added lontium,lt8711uxd match entry with DRM_MODE_CONNECTOR_HDMIA to
  the simple-bridge driver
- New patch to rename the regulator labels for the es8388 supplies to
  match the schematics and they all use vcca_*
- Fixed ES8388 PVDD-supply — vcca_3v3_s0 → vcca_1v8_s0, 5 Pro is
  different to 5 and 5b.
- analog-sound: use CPU-as-clock-master on the Pro. The ES8388 is wired to
  i2s2_2ch (the only I2S block physically routed to the codec pins on this
  board), which uses the legacy rockchip_i2s driver. That driver's
  slave-mode trigger path hangs for 200 µs polling I2S_CLR and bails with
  -ETIMEDOUT ("lrclk update failed"). The TDM-capable i2s0/i2s1/i2s5
  blocks served by rockchip_i2s_tdm don't have this issue, which is why
  other mainline ES8388 boards get away with bitclock-master = masterdai.
  Drop bitclock-master/frame-master and the masterdai label to let the I2S
  block generate BCLK/LRCK itself
- Removed regulator-always-on/regulator-boot-on from vcc3v3_dp
- Added pinctrl entries for all GPIO pins (dp_bridge_en, vcc3v3_phy1_en,
  wifi_enable_h, pcie2x1l1_rst, pcie2x1l2_rst)
- DP bridge rework — replaced dp-connector node with proper chain:
    - lt8711uxd bridge node (compatible lontium,lt8711uxd, with port@0/port@1
      endpoints). Bridge power is gated by the vcc3v3_dp regulator, whose
      enable GPIO (GPIO3_PC2) is driven via the dp_bridge_en pinctrl group;
      no enable-gpios/vdd-supply on the bridge node itself.
    - hdmi1-con connector node (compatible hdmi-connector, type a)
    - dp0_out endpoint now points to bridge input instead of old connector
- remove accidentally included unnecessary changes
- link to v6: https://lore.kernel.org/linux-devicetree/20260411024743.195385-1-dennis@ausil.us/

Changes in v6:
- Move the shared configs for the Orange Pi 5 and Orange Pi 5b from each
  devices dts to a shared rk3588s-orangepi-5-5b.dtsi to avoid duplication
- Remove empty ports subnodeis from typea_con
- Move i2s2m1_mclk pinctrl from &i2s2 to the es8388 codec node
- Add dp-con, dp0_out, dp0_in, and vp1 nodes, plus the vcc3v3_dp regulator
  in order to get the second HDMI port working via its transparent
  LT8711UXD DP to HDMI bridge
- link to v5: https://lore.kernel.org/linux-devicetree/20260401010707.2584962-1-dennis@ausil.us/

Changes in v5:
- define a connector node for Type-A port, and list the regulator as its VBUS supply explicitly.
- Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net/
- link to v4: https://lore.kernel.org/linux-devicetree/20260310031002.3921234-1-dennis@ausil.us/

Changes in v4:
- rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy1 to match the schematic
- use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
- remove the definition for vcc3v3_pcie_m2 as it does not really exist
  as a regulator
- link to v3: https://lore.kernel.org/linux-devicetree/20260306024634.239614-1-dennis@ausil.us/

Changes in v3:
- moved leds from gpio-leds to pwm-leds
- remove disable-wp from sdio
- rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
  purpose
- actually clean up the delete lines and comments missed in v2
- link to v2: https://lore.kernel.org/linux-devicetree/20260304025521.210377-1-dennis@ausil.us/

Changes in v2:
- moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
  dts files
- removed all the comments and deleted properties from 5 Pro dts
- link to v1: https://lore.kernel.org/linux-devicetree/20260228205418.2944620-1-dennis@ausil.us/

Dennis Gilmore (6):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  dt-bindings: display: bridge: simple: document the Lontium LT8711UXD
    DP-to-HDMI bridge
  drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
  arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels
    to match schematic
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 .../display/bridge/simple-bridge.yaml         |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 256 ++++++++++
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 440 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 263 +----------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 drivers/gpu/drm/bridge/simple-bridge.c        |   5 +
 9 files changed, 725 insertions(+), 250 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0

