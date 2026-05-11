Received: from mail-vk1-f230.google.com (mail-vk1-f230.google.com [209.85.221.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79292E8E09
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468040; cv=none; b=Z/zWlMwoRLKNoA7JLlJicaakBqImPv+VdaUUBCG5KRwQ8ZpTLk4SpNw5ta4ViNJm2DVA+nLwRpvv88PyjPbZmP8c9ehE4l3/Tb0D5jnwmKPozVi1u1SiHUvKy7CgGqsKbzZII0HilVkoFCKo3VqniM9KR9pYy5AZ+NanwwsaE0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468040; c=relaxed/simple;
	bh=hcfrC32nrYYlBM6jaQlhfso9Gmj5smq8dSZOaaDTJdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QGlDLzc2O8OVxEQNsxgnZUMRCBjfmLOjZOhILgvGNzsK93qP1u1Eefx2nbqCubKjbufkl8wU34qG/Sm7YMcYsGP6SGGD/hDIHXqBI3nN8ktCJBBmJha96GfCXnX1e8gyaRHTWFRmQ/GefVcAcJzCQkkYC2YX9ZeNhkBxPJI7PPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=PFZRjArc; arc=none smtp.client-ip=209.85.221.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="PFZRjArc"
Received: by mail-vk1-f230.google.com with SMTP id 71dfb90a1353d-5751136c561so3522801e0c.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778468036; x=1779072836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4O7npYUzaYeXNaPBSORmBhh0snrT3iu++6Vs+W8JAA=;
        b=PFZRjArceEb1PO0DeJrXCRFHn7b7ZdhCU/L3ksSezawJ8/2LJKrd+4/pBRgqwgMmc4
         B42lCd6qOCHIXD5c49/vLZc6+mwWsM+VBUC9A7GvtTo99QOZ317KvPTYqU588T1yI+MM
         ueVP71LFM/bNMI0Ag5E8wTOWblTja/yNzeS+HMdCDYrcTI4gyWfcO1pWq9eP92mHKx/X
         d+W0zFCDXR01iXsHiozapNONxpGVwQyW7h8JNS9uEf9uN6bbKGusTzHazmCsoUtQeD63
         8MRs7g+La5ipb8DIa8ZBrL2FutyLPJhFrcv50LR1CajERAQySDdXqeXECVeB8BtlQz72
         DRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468036; x=1779072836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4O7npYUzaYeXNaPBSORmBhh0snrT3iu++6Vs+W8JAA=;
        b=hpxG0NOhaFHA/KeePpSrnbE3VDrbvNaEiFHPTQOq0slu3jqrTxbOt8q/1r29kOpKtu
         TJF5POJnCqViJ+yaf2uCcfM5HdooGlkF2gs/g5zL6cJ97ddC34oYxgkyBtTDOYJDLFka
         F1658ahG1iuiObl5lcl+V0D28R7n5U/hqSL9YJqJJQnxr7l7nW+Z5EZXxVZVXWmU34Ha
         iMDIDsH8I4Z/rgQiLE81h4+/wgBA/9QsBQUBg0J5MTESSaplKNx5HTPQZPZ9H1fSgJ3k
         WAi24GU0Nh10puQOs4823IPedshxtOfRSL2El+UQONoZwqvQkwdrw3SuOh0th4/ISzbc
         p9FA==
X-Forwarded-Encrypted: i=1; AFNElJ8aLWi0eup3eA6Kgr+dEz/nktDV/1MAnZvqyB/XC/QAeTFCHOpnPt5p43Q03QehRtdG96d1P7gMb7Ij@vger.kernel.org
X-Gm-Message-State: AOJu0Yylj/M9AqnmpOd5fUo0bTd43L23/+KShSEFQQjKy8mK/uV3gAUD
	9SpXcCp7uanxJgPRTrGaN0oQi8N2dDnAHBxrZKJ9jkzwr7WffJ20r5kOAOP3T3xXoyJr1PquXx9
	mmglH1nYOBxqcBi0aYexTSzBUAp3jO+7/3IiB
X-Gm-Gg: Acq92OFgzh1pQu9AhKHjDNiYvBUisyEszkHChOdFrPTf6mUzCoS6Aztq4isS6T7xvS8
	erqOkhQk20bsRtL0U7GD/knZV1jGuxV2TT0B4WO2YmNXem/R1Qju4RvEvpw9E+ImIz+kyeJpNAS
	BnuotIDk/at0jp2iK4vnXeUQNAr2dLOQngWVJG1qJJfGD/G/s1suUaeS49aOgpCisCtGSRHEfP1
	UUUaL7vHqbteGAyILvbnFXazy1HJJUHLpd8OLP1TmVKWDIhKZvM+7dSpVzJQ8lHL1+pYsrIwr+N
	nGUpW/BQbkHbOdI/YbUJaYuZupugCwTZiZ2LIZR7YVshpGuVZmj/qDQONvpIa3chzje2TmemHca
	5LrIis4m4S0xa6fLz4gAF01BQEZbYXIr4uTe+YFeNcTH6
X-Received: by 2002:a05:6102:358e:b0:634:6b98:c37 with SMTP id ada2fe7eead31-6346b9813e0mr447506137.7.1778468036478;
        Sun, 10 May 2026 19:53:56 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-6313ff6c191sm698744137.1.2026.05.10.19.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:53:56 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v10 0/4] Add support for Orange Pi 5 Pro
Date: Sun, 10 May 2026 21:53:46 -0500
Message-ID: <20260511025352.106126-1-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
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
a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), HDMI connected to SoC
(Second port is disabled in this patch), and a 40-pin expansion header.

The series was tested against Linux 7.0

Please take a look.

Thank you,

Dennis Gilmore

Changes in v10:
- rename rk806_single to rk806
- link to v9: https://lore.kernel.org/linux-devicetree/20260429024737.544813-5-dennis@ausil.us/

Changes in v9:
- removed support for the dp-to-HDMI bridge, will send in a second patch
  set to enable discusion to finish on how to handle its two operating
  modes
- link to v8: https://lore.kernel.org/linux-devicetree/20260425031011.2529364-1-dennis@ausil.us/

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

Dennis Gilmore (4):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels
    to match schematic
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 256 +++++++++++++
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 358 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 263 +------------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 7 files changed, 637 insertions(+), 250 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.54.0

