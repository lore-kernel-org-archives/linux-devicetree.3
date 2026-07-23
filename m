Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A835A952;
	Thu, 23 Jul 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813041; cv=none; b=VEOXrN1tXIrLaC2jzDYXpKh/XAqgZivDd+OezxNC8+Avxa2mggE0+d5JDb6rUObpda+wXW651yT5+myuc6elI8ZTJyaam5ZJrfKmajekH1qqVnHG23oP06E2Cr+aM6Rs5TZGP07vS8NGUwhcH1mPm9DoJk5P9ilA/5Vo9wB8LzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813041; c=relaxed/simple;
	bh=u5edIeWA0/OJPNd4QkbW0kHvGqkgG9nXqugdLqMKV80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JvHOpL189dRENsQwFOlZRay5Ceu1JOzDg/V6v6F4ICa3drC6rcwmHVGUoqXXKxJZTKYzLakRdY3qc5JDgX+URxWYq0Hkd21MtsnhoiqVm2oddxFsNI6S+7lgxwb9/y5EN5a071P6ANZ5QnCnH/RC/fuMxWQJBLHnBY/4JkNbXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBqTX+Px; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBqTX+Px"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BE54C2BCB8;
	Thu, 23 Jul 2026 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784813040;
	bh=u5edIeWA0/OJPNd4QkbW0kHvGqkgG9nXqugdLqMKV80=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jBqTX+Pxi/YXqav9+YFalUQfBP/LBNHcXhEtv499Bv2ntbiocjnK7eTD3fFMId3FJ
	 xj9LchQvqhf/3WB9MC63Pj2XfMaxPEZctXTiN0Tg4vkAqJB3lMAt2F/X0WNo3Xb8R0
	 VC9fT0n69Cuae9E+QM3fvYIp7WCLtfGpxMdWkaiL0ki9PNd7TGsp0mjE3N6UGne0UH
	 5jIexeHEkinyvKSU2kV9pHd9N27KC1mtXV1TztWtebunEtBkl2Zc0P1NcScXx0Jr/J
	 x1eQnEk9KYOEjBsxHpyjwzIyJDSmlFEtyC0EqKVtGU+Af+E+CZFa7e534qKhyHvilz
	 LyafFizoTJ+CA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B388C531CF;
	Thu, 23 Jul 2026 13:24:00 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH v5 0/3] arm64: qcom: add Ayaneo Pocket DS gaming console
Date: Thu, 23 Jul 2026 20:23:58 +0700
Message-Id: <20260723-pocketds-v5-0-74508388c716@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NsY7CMBAE0F9Brs9ovbFjfNX9B6II6zUYDoLiE
 IFQ/h0HCiygHGnezE0k7iIn8Tu7iY6HmGJ7zMH8zARtm+OGZfQ5CwSswSiQp5b23PskGdiunaN
 Q1U7k+qnjEC+PqeXqmdN5vWPqJz81tjH1bXd9fA1q6n2ZHZQESQFMQ0xQN+Fvc2ji/5zag5hmB
 yyhKiBmiM55r1HbgB+wKqEtYJWhN04BLUBZU79D/YIWsYA6Q10tLGjyRgVbwnEc70Fy8SVdAQA
 A
X-Change-ID: 20260510-pocketds-e0e7b99cf369
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784813038; l=10000;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=u5edIeWA0/OJPNd4QkbW0kHvGqkgG9nXqugdLqMKV80=;
 b=a8aYfizr1GbFyM/x4/StH5pDKfLQd8LUI0NBrl6pQecubsh0ZACEN7NLtDWNfqBiAakQr1vhB
 Tp+W7sRie1oCHNcFAiJqoFeHlJeHxDq+6wM5DKvyTyqG11x2RW6nR8c
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

This series adds initial support for the Ayaneo Pocket DS, a handheld
gaming console built around the Qualcomm QCS8550 SoC. It has UFS
storage, WiFi/Bluetooth, gaming buttons, microSD, and USB-C with
DisplayPort. Game controls are exposed through a Renesas uPD720201
PCIe USB 3.0 host controller hung off PCIe1, while a dedicated gamepad
MCU is reached over UART11.

The series is structured as:

  1. dt-bindings entry for the new ayaneo,pocket-ds compatible.
  2. sm8550.dtsi: add the QUP2 SE3 (UART11) controller node and its
     default pinctrl, so the board can enable it as &uart11.
  3. The Pocket DS board device tree itself, together with thermal_*
     labels for the cpuss/cpu/gpuss thermal zones added to sm8550.dtsi
     so the board has a real user of them in the same patch.

Only the basics are wired up at this stage (boot to console, core
peripherals, USB-C with DP and SBU AUX muxing, microSD, WiFi/BT,
gaming controls, volume keys and PWM-fan cooling); the DSI display
panel and the secondary panel rail will follow in a later submission
once the upstream panel binding lands.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
Changes in v5:
- Restore output-high on the gamepad_pwr_en pinctrl state: the Renesas
  uPD720201 gamepad host controller power-enable on gpio52 must be
  driven high. It was dropped in v4 together with the boot-time
  output-high states, but unlike those it is a functional enable
  rather than a downstream boot artefact (Sashiko).
- Link to v4: https://patch.msgid.link/20260722-pocketds-v4-0-438704cd51f7@gmail.com

Changes in v4:
- Reordered the series so the sm8550.dtsi UART11 patch comes before the
  board dts that consumes &uart11, keeping the tree bisectable (Dmitry).
- Renamed the board compatible from "ayaneo,pocketds" to
  "ayaneo,pocket-ds", matching the hyphenated "ayaneo,pocket-s2" already
  in qcom.yaml and the DT compatible naming convention (Sashiko). The
  Acked-by on the bindings patch was given for the unhyphenated string;
  kept it since the change is a one-word rename, please shout if you
  would rather re-ack it.
- uart11: switched operating-points-v2 to &qup_opp_table_120mhz, which
  is what i2c11 and spi11 use for the very same serial engine at
  0x88c000; the 100 MHz table was simply wrong (Sashiko).
- uart11: use bias-pull-up rather than bias-disable on TX/RX, matching
  qup_uart14_default, the other high-speed UART on this SoC (Sashiko).
- Reworded the UART11 commit message, which implied that open-coding
  the controller in a board dts was a viable alternative (Konrad).
- Squashed the sm8550.dtsi thermal-zone labels patch into the board
  dts patch so the labels gain their consumer in the same change
  (Krzysztof).
- Renamed the sm8550.dtsi thermal-zone labels from
  cpuss[0-3]_thermal / cpu7_top_thermal / gpuss[0-7]_thermal to
  thermal_cpuss[0-3] / thermal_cpu7_top / thermal_gpuss[0-7] so all
  thermal-related overrides cluster alphabetically in the consuming
  board dts (Dmitry).
- Dropped the &gpu_opp_table override until upstream gains proper
  speed-bin detection (Dmitry).
- Switched remoteproc_adsp firmware-name from the downstream .mdt
  suffix to the upstream .mbn convention (Dmitry).
- Replaced the /delete-node/ overrides on &remoteproc_mpss /
  &remoteproc_cdsp with /delete-property/ memory-region (Dmitry). Both
  are already status="disabled" in sm8550.dtsi, so the nodes never
  needed deleting; only their now-dangling memory-region phandles did.
  The reserved-memory regions for the unused modem, CDSP, camera and
  IPA firmware stay /delete-node/-ed so that memory is handed back to
  Linux, matching what sm8550-samsung-q5q and
  sm8550-sony-xperia-yodo-pdx234 already do on this SoC.
- Dropped the downstream rocknix-u-boot-dt-id root property (Neil).
- Switched the deprecated "gpio" property to "gpios" on all fixed
  regulators (Neil).
- Reworked the audio-routing DAPM table to drop the bogus
  "VA DMIC0/1, vdd-micb" routes (Neil).
- Reshaped the per-zone thermal-zones overrides to a single "active"
  trip point bound to &pwm_fan via cooling-maps, mirroring the
  Ayaneo Pocket S2 style (Neil).
- Added a pinctrl-1 sleep state for pwm_fan and the corresponding
  fan_pwm_sleep PMIC pinctrl entry (Neil).
- Added a gpio-keys node wiring up the Volume Up button via the
  previously-unreferenced volume_up_n pinctrl (Neil).
- Dropped every output-high in the &tlmm pinctrl states (Neil).
- Dropped the incomplete DSI/panel bring-up (display_panel, &mdss_dsi0,
  &mdss_dsi0_phy, &mdss_dsi1, &mdss_dsi1_out, &mdss_dsi1_phy and the
  sde_dsi*/sde_te*/panel_pwr_active pinctrl) until the panel bindings
  are reviewed (Neil).
- Added the missing SBU AUX endpoint between the pmic-glink connector
  and the NB7VPQ904M redriver port@2 to complete the DP altmode
  signal path (Neil).
- Normalised the last fixed-regulator node name to the "<name>-regulator"
  convention (vph_pwr) (Krzysztof).
- Reauthored the bindings patch under Alexandre alone (no co-developed
  needed for the trivial DT entry) and picked up Krzysztof's Acked-by.
- Fixed the sign-off chain on the board dts patch: the From: author's
  Signed-off-by now comes first and the submitter's last (Krzysztof).
- No qup_uart11_cts_rts pinctrl state was added: nothing in-tree
  references it, and hardware flow control is not wired on this board.
  It can be added together with its first user (Sashiko).
- Built with "make CHECK_DTBS=yes qcom/qcs8550-ayaneo-pocket-ds.dtb":
  no errors, no warnings. With W=1 dtc additionally reports
  avoid_unnecessary_addr_size on sm8550.dtsi's dsi@ae94000/dsi@ae96000,
  because no panel child is added while display support is deferred;
  qcs8550-aim300-aiot already reports the same for dsi@ae96000.
- board dts: enabled &pcie0_phy and added the &pcieport0 wifi@0 supply
  node for the WCN7850. Without the PCIe0 PHY and the vddpcie0p9 /
  vddpcie1p8 rails the WiFi link never trained; the wifi@0 supply node
  follows sm8650-ayaneo-pocket-s2 and the sm8550/sm8650 QRD/HDK boards.
- board dts: dropped &i2c4 to 100 kHz. The FT5426 touchscreen
  clock-stretches past the GENI controller's timeout at 400 kHz, and
  the qcom-geni-i2c controller has no i2c_bus_recovery, so a stuck SCL
  can only be cleared by an FSM reset that is itself the operation
  timing out. Standard mode is within the FT5426's clock-stretch spec.
- board dts: pinned &pcie0 to max-link-speed = <2> (Gen2), the link
  speed validated for the WCN7850 on this board.
- board dts: dropped the undocumented sdhci-caps-mask = <0x3 0x0> on
  &sdhc_2 (it masked the SDR50/SDR104 capability bits that the board's
  own sd-uhs-sdr50 / sd-uhs-sdr104 properties enable). qcom,dll-config
  is kept, with its derivation now recorded in the commit message.
- Renamed the board dts to qcs8550-ayaneo-pocket-ds.dts to match the
  hyphenated compatible and the sibling sm8650-ayaneo-pocket-s2.dts;
  the Makefile entry and the CHECK_DTBS target were updated to suit.
- Note on the UART11 Reviewed-by: Konrad's tag was given on v3, before
  the operating-points-v2 (&qup_opp_table_120mhz) and bias-pull-up
  changes above. It is retained here; happy to drop it for a re-review.
- Link to v3: https://patch.msgid.link/20260517-pocketds-v3-0-d5910c801756@gmail.com

Changes in v3:
- New prerequisite patch adding the QUP2 SE3 (UART11) controller node
  and the qup_uart11_default pinctrl state to sm8550.dtsi, so the
  board can enable the gamepad MCU UART via &uart11 instead of
  duplicating the controller node in the board dts.
- Alphabetised the root-level nodes in the board dts and renamed the
  fixed regulators to the "<name>-regulator" node-name convention.
- Link to v2: https://patch.msgid.link/20260511-pocketds-v2-0-299dd4247f2f@gmail.com

Changes in v2:
- Inlined the board into a single qcs8550-ayaneo-pocketds.dts, matching
  the sm8650-ayaneo-pocket-s2 layout
- Added qcom,qcs8550 to the compatible chain
- Prerequisite patch labelling the sm8550 thermal zones so the board
  can extend them via &label overrides (and refactored the board's
  thermal-zones to use them)
- Added the Renesas uPD720201 USB 3.0 controller as a child of pcie1
  with proper avdd33 / vdd10 / vdd33 regulators
- Moved gamepad_pwr_en off &pcie1's pinctrl-0 and onto the
  usb-controller node
- Split the lumped upd720201_active pinctrl into per-regulator states
- Fixed mdss_dp0_out data-lanes to <0 1 2 3> (all four wired)
- Fixed gpio-reserved-ranges to <32 4> (gpio 38-39 drive the Goodix
  touchscreen)
- Renamed nodes with underscores (llcc-lpi-region, splash-region,
  gpio@20) per DT conventions
- Reordered pinctrl-names after pinctrl-N file-wide
- Dropped the unused cont_splash_region label
- Link to v1: https://patch.msgid.link/20260510-pocketds-v1-0-cf05acec06af@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Alexandre Hamamdjian (2):
      dt-bindings: arm: qcom: document the Ayaneo Pocket DS
      arm64: dts: qcom: sm8550: add UART11 node

Teguh Sobirin (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts     | 1618 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   52 +-
 4 files changed, 1664 insertions(+), 13 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260510-pocketds-e0e7b99cf369

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>


