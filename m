Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F42C0F6D
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936878; cv=none; b=OfM6WKjruJ6fy7+VLkSFcuqbyljvYSwJ3U/c8HRJpC/MBLh5a87VfVpbCpb8po++ULmFPy3D32oIUOOZ0d8Wb/sdI6qqlCFX/+eRG0JMmCZyk1BYciPKgWDwXsRcLHmi/IYte9UkQRyO9ZBd2530b2oMGJAsqf4Z4v+IjJ6LWcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936878; c=relaxed/simple;
	bh=w+fAriFQ8WCUbA1D2cwXRmLRMFcXIzrV7SLpfLn5HzY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sh7x+nW7QuGNSCAYYwKKT+c7lGh6k+GBgFRZyBbotBCCeV8hAVPwcBnl17vy+aDcKL4twXlTtgIf0l2ZIP2qHp059nJdto3tjD92KZs0KuRXIwn/sauey9aJUdR1Xf5sd0v5ZvIFY1r3Ruqb9jXbW0tLNDYAtGCcOYV3VnGV+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fz2ib44T; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fz2ib44T"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so4878070a91.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 23:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774936876; x=1775541676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilQzBc8woUsRjSpAUcJxuzvzWy7droM45xTJ5hZXLwU=;
        b=Fz2ib44TonMMdbA3qilnxOIVgbKpCnStTmbSUMS7wIuQHZxZoY8Ig7W8v7IJIGoxFr
         gHIW4p+zFdGBHEztu7L4FGF52zfRpwRHE7JCWr9rlo5gJBz9Pr/kRDA4ZjmviG9hM8hG
         w0QI+Cc8T4eHmiEiRrAT/+otEyYtnvq1bFaLvw7L82xE5mdAtw8VSDJvEm4HtLqGJr3U
         O+mb5QN0Os3XKyW/lrZGAz8egGhmVB3udf5TVM8Q+UN63ez3pJQ6QEbjSUfasRWquXjK
         B9jF0WPYYx9qsPE8r7OHFh9toR1wfdlt+dmPDtnEim9+4kZPHagSCCv9m/bOlI2P05qp
         lKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936876; x=1775541676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilQzBc8woUsRjSpAUcJxuzvzWy7droM45xTJ5hZXLwU=;
        b=P7vaIWtoGxImdo+uhdJ6USgx+9t7I++ar5SyBmTcFTRYMucRlqrS0TwmxWgqHnBr/3
         dUFgrbB8Yg74n5VYqTqBacA7R78DDbPPM7u2MYviUZjGXHAVVLBU4CGwFPc5e1vHRawR
         1Mmimxb465EwWAGy82SrADbGDDrO7CDTVmMgQjwlzoP5Tns/6+o2c0VHxGau82E+MlxH
         Glu0/R5u9vdLgvFwg62QysNqewdlxvZTouhvUL3bqu6A7lty6j2I3amz21RFSzyyHAyv
         DWogeVzi+BawJ0/778TtmRJNj60m8GxfO82mGp3MzX5XBpF9Zz2f4rnbrqX1E4vdnLoj
         y0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUOvvl9XzscgOlaU6fhyvsOms+U8m2llBpfEpHv6WeopeiLCIWeq3lDSVM4l99feoLSK3RA7/f04pHR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66LEFOoOD2hKSB01pcJD0y3L4kXyQPaoaDgZw8ojEoZvbh9IK
	pn62RQoIBZ5Fk8yLd1j/o76d5/GVq5jqwmUf6KlsJTAzyVosq2HW5jPuzse6JQ==
X-Gm-Gg: ATEYQzySs8vDBdKog6D62QSn6MTLVDp1UD5dL3dIcgPU3xIc0CwXyirRTbZtwEjm2fS
	+SquN7zykBcmCKTwC0+Dpdd8Yapy6Vy18BLzXCpRGgFvMiIDdwvsb38oT+BSw6R+wWoYsiKMMDg
	Q8JpYZse2enKF7h+u4Yr3vsdImXeyHmf2G9396ziSHiMWoAvpJAEPZTK/NfrBVNPGNrUzufhBLw
	GBi3LKpcH8lY0DQMmXpLsnGdS0i9kNpbtsik27Oj/5rNZsE9jjffpbkFj5x3mniNn/s0549Dy7G
	DkOKmfs/Abb/gfMEUWXjj/p4CpdzaHgWIX2Np3p+wWjoHRachGQKwGYuUc3ZnfhqlVikogOs1GP
	TenOUj9Elf70GJLlpZioA4swpn0pSNEfESCekJ7qQvGiJ5iePJ/8MnokWDM+V5gblUQXfOcaZiJ
	wEwnRObyXT52SSgEuC7ony+YmvMTDWdZ/B3XOuT4ggLHbs4s7Z
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr14476488a91.4.1774936876413;
        Mon, 30 Mar 2026 23:01:16 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe606dd2sm575343a91.3.2026.03.30.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:01:15 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v16 0/3] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
Date: Tue, 31 Mar 2026 11:31:04 +0530
Message-Id: <20260331060107.501561-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds device tree binding and board support for the
Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
QCS615 SoC.

The first patch introduces the DT binding entry for the Talos EVK
SMARC board, and the next patches adds the corresponding DTS
files for the platform.

Note:
USB0(usb_1) supports host-only mode based on the switch SW1 on
the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
is not connected and switching cannot be handled from SW.
USB0 is configured host-only in the base device tree, hence host-only
mode is supported on Linux boot up.
For ADB to work during normal runtime, a separate device-tree overlay
enables the Micro-USB peripheral configuration.

Changes in v16:
 - Reordered device tree nodes.
 - Added explanatory comments in talos-evk-usb1-peripheral.dtso.
 - This patch series depends on the below url
   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260330&id=c1e77b13457d20f14c70e623f7c0a6a3cefc1d67
 - No functional change in bindings file.

Changes in v15:
 - Simplified LVDS backlight implementation to use gpio-backlight with
   GPIO115 only.
 - Removed previously added extra GPIO(GPIO59) and related gpio-
   backlight driver changes.
 - Added #address-cells and #size-cells in &i2c1 to fix dtc warnings.
 - Added missing reg property for bridge@3d to fix dtc warnings.
 - This patch series depends on the below url
   https://lore.kernel.org/linux-arm-msm/e025b1b4-8f5c-4fd2-853e-56b89f1f8e79@oss.qualcomm.com/
 - Updated commit messages.
 - No functional change in bindings file.

Changes in v14:
 - Added DT aliases for i2c1, i2c5, and spi6.
 - Dropped unrelated talos.dtsi and qcs615-ride.dtsi modifications
   (handled in separate patches).
 - Updated commit messages.
 - Updated USB note in the cover letter for maintainers' awareness.
 - Ignore v13 patch.

Changes in v13:
 - The USB HS PHY node naming has been corrected to follow the
   existing convention used across the tree (usb_x_hsphy instead of
   usb_hsphy_x). (suggested by Konrad)
 - Removed unnecessary output-low from the wlan_en_state node.
 - Updated WiFi DT to control PA power through WLAN_EN, removing
   separate regulator definitions.
 - Added USB peripheral overlay allowing USB0 to operate in device
   mode when required. (suggested by Dmitry)
 - Updated commit messages.
 - No functional change in bindings file.

Changes in v12:
 - qcs615-ride.dts patch squashed with talos.dtsi patch.
   (suggested by Konrad)
 - Added static power supply node for lvds-panel.
 - The ti,dsi-lanes, ti,lvds-format, and ti,lvds-bpp properties
   dropped because they were redundant for the current
   panel/bridge configuration.
 - No functional change in bindings file.

Changes in v11:
 - Fixed inconsistent USB PHY node naming in qcs615-ride.dts to
   align with the expected naming convention. (suggested by
   yuanjiey)
 - Reordered properties in property-n and property-names for
   consistency across DT files.
 - Removed unnecessary output-low from the bt_en_state node.
 - Used a &label_reference for hdmi_connector.
 - Added pcieport0 device node, which is required for WLAN to
   power on.
 - No functional change in bindings file.

Changes in v10:
 - This series extends the gpio-backlight driver and its DT bindings
   to support multiple control GPIOs. (suggested by Dmitry)
 - Addressed DT node labeling feedback.
 - Polished overall device tree structure and minor formattings.
 - Corrected pinctrl configuration for the active-low PERST# pin.
 - Includes a fix for inconsistent USB PHY node naming in
   talos.dtsi. (suggested by Dmitry)
 - Enabled WiFi and Bluetooth functionality.
 - Updated commit message.
 - No functional change in bindings file.

Changes in v9:
 - The updates in the following patch url is taken care in this
   patch series.
   https://lists.freedesktop.org/archives/dri-devel/2025-November/534473.html
 - Ignore v8 patch

Changes in v8:
 - This patch series depends on the below url
   https://lists.freedesktop.org/archives/dri-devel/2025-November/534473.html
 - Moved the contents of `talos-evk-cb.dtsi` to `talos-evk.dtsi`
   which will describe all the standard configuration of the EVK.
 - Introduced 'talos-evk-lvds-auo,g133han01.dtso' which has overlay
   to disable HDMI and adds the LVDS-related on top of the base
   dts file. (suggested by Bjorn)
 - Ethernet and Wi-Fi/BT are not (yet) supported.
 - Updated commit message.
 - No functional change in bindings file.

Changes in v7:
 - Added i2c clock frequency for i2c5 node.
 - Moved adv7535 controller section to talos-evk.dts file.
 - Reorder the usb nodes.
 - GPI_DMA nodes added in the device tree files.
 - No functional change in bindings file.

Changes in v6:
 - Clarified description of `talos-evk-cb.dtsi` to explain that it
   defines common carrier board interfaces shared between HDMI and
   LVDS variants, And It’s a single carrier board. HDMI and LVDS
   share the same DSI interface, and only one can be active at a
   time depending on a DIP switch.
 - Added missing newlines before 'status' and between the last property
   and subnode (suggested by Konrad).
 - Updated commit messages for clarity.

Changes in v5:
 - Updated commit message. (suggested by Krzysztof)
 - Introduced generic node name for can, dp, hdmi-bridge. (suggested by
   Krzysztof)
 - Introduced talos-evk-cb.dtsi, which has common carrier board
   interfaces.
 - No functional change in bindings file.

Changes in v4:
 - Updated product name to full form per Krzysztof’s feedback in
   dt-binding comment.
 - Hook up the ADV7535 DSI-to-HDMI bridge to base DTS file.
 - Add DP connector node and MDSS DisplayPort controller.
 - Added USB note in the cover letter for maintainers' awareness.

Changes in v3:
 - Addressed comments from Dmitry regarding USB1 `dr_mode` and
   added a DTS comment.
 - No functional change in bindings file.

Changes in v2:
 - Renamed compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
 - Merged enum entry with existing `qcs615-ride` block (Krzysztof)
 - Fixed subject and commit message to use imperative mood.

Thanks,
Anusha

Sudarshan Shetty (3):
  dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
  arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node
    naming
  arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   6 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |   2 +-
 .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 127 ++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 610 ++++++++++++++++++
 .../dts/qcom/talos-evk-usb1-peripheral.dtso   |  27 +
 arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
 arch/arm64/boot/dts/qcom/talos.dtsi           |   4 +-
 8 files changed, 913 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1

