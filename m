Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2972231A41
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126621; cv=none; b=SvedLfdHv2RHQWIIJv81fGfjHYFVZSoqZ2R+pOvZ79ylOjlEg88RneD5A/ZKPbCYXhdJ2Vx9GRQs6lOEyMnFh6R6AOMNuZoHX09abS9E25/z6qsAspf+adC+Tkre3g67vqEJVqCD8LwLj0/0zCVId4PGP95es+5iqSrhF3IIOQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126621; c=relaxed/simple;
	bh=ECDRQ+WrFbVZS+CZDLgpuXr0f49U0NwaVirTL3iNsYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jiwj1UOAXPhEfAhSm2waq+5mizf6Utc0a6Vv+O9dL7e7hfB8EGlxS5fIMn1hgwlwKVTuM2Ti2xSAa4qwEGF4h3y2Qa80QLYEwu+nwerExc5CtZSWKmjW5KJEsnadBBdKl0x6mH/zXncmTuDxtUt12t7b6YL+PmDc0l803K72TcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJQgVow5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJQgVow5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf41bab353so30615245ad.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785126619; x=1785731419; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hRs1ILFVuPcRsq3x/ZGBZ8F4Diw0x07EEaf1JzdhoDY=;
        b=jJQgVow5BNafn40Z1TjfJ0v9YOfDVQ+usmfez3gBxTqalHfcqzbpvxKVy9UXZ391Pv
         7HiZnY0TLj53ExuVw9kVUSlP5GYMZdUsUaPAQ2DEJUJI7+43OVk+L+Np81Mjq+lx+vmp
         xqdXOmT41BJSUtJYe12HeHMVecfw84JznwtW34UKWY9vzCJRCxec40IuElcKE+cdps7O
         K9ResqKFW/r0Kdn4Imn6R+zfNGsGqWcJvuSx8iF8lvcH8i6peO/xdI/NvwX9eQ08z4XS
         6ynTRTtajroz3zyldcIbaiIAU2gecsMTS7l1Rz66NGHQLgWt0fe4ZYEC40LvzQyh+O1P
         S0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126619; x=1785731419;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hRs1ILFVuPcRsq3x/ZGBZ8F4Diw0x07EEaf1JzdhoDY=;
        b=I+bSoFqGPBkWwfqoQ/uC7rM4CBhbfY6rr/EXt8/I/IqJA5TJGcEFRAeEWmbMn58hQn
         FgiAKEtZlDTg0/js8xBqRiSXerwqXzcfIu5PhXxQvUIqxIzb1dhURgvAGxOWfAPYq0Ez
         pdkwGZlcWBK7uL1524KsnQ9Z1en3NXnH5aqFk5yi8YdrMGpXFqCaMuz7NwVp+6ALbpjZ
         oNl/+/4zZ9kvwtGMRB1Gw0glJJ/wibjWYIrw9NWIo7DKUcXIA6Ds/V72n9RtsaQ3W54S
         vwuuohj0+yhQdyKQ7kUKaNN7gGAH00PKl80RRJTWYHfTJkyGZms7oErPMchRCG5ypJ/p
         Y0ow==
X-Gm-Message-State: AOJu0Yz5ONV38Z8SKvh3G9bj3dXggqfr8B+JsRaDedXtRLiGM5lr4c4J
	4cu8UZWGL653A9MVTKDspaA7mrQZOJ+X2/xeY3ZJ8SQ05wRx33xzqaOt
X-Gm-Gg: AR+sD110SRla+NDG7GJEorFis/wvlMBxZVbBdcSEZqJbGISf4XCDK5hlE6/5qqz/qqT
	5po/QNbsZAwJuuDRYHhnomUUzYmxEdRABQnosKDHkV7tDssgnowolFnbPQHjOSwdxdiRJ/ZQdL2
	jjCCVjDb1HN6AlUzXo4l3+cJKGRRQ8BY0PXHo0MKQiRZGTO8jIBbPCIXuCv+l5zloApxozlAG+q
	VBPiAoD5ellwDaYv8hoa0ivqdTjROecULadcZmOB+PQi7T3Ew1vzFWjn+bmyMMK86wnttGYsQiA
	2sIgIIadjBoG0gVyWZV616SxtqVwEwt55dPtSJ/t+9DNQwiv/JNnyr8ObvbbciqRrvcq7SvjNRX
	zo6Koie4F56WaujDjBTGfGT5X8MekbsrNNpTRWAZa4p6JpPbkgFENnyJu/wDHMRPxaEbmSknmGx
	daF3MfHICwHZs/AoiwWgLixrLy7Rf0HPIlcJV+ngEdWg==
X-Received: by 2002:a17:903:2385:b0:2be:3850:297e with SMTP id d9443c01a7336-2cfde866c11mr69743805ad.31.1785126618994;
        Sun, 26 Jul 2026 21:30:18 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80f50asm27372145ad.77.2026.07.26.21.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:30:18 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v9 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Mon, 27 Jul 2026 12:32:08 +0800
Message-Id: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEjfZmoC/4XQ22rDMAwG4Fcpvl6G5INs72rvMUbxsTW06Uiys
 FH67nMLo1mK2eUv0PcLndmYhpJG9rI5syHNZSynvgb7tGFh7/pd6kqsmXHgCjnn3Zz66XNwfFv
 6MhV32MZp7CxYL7jWkUixuvoxpFy+buzbe837Mk6n4fvWMuN1+g84YwcdZiAkCto48bo7unJ4D
 qcju4IzXyKygfCKZLTCOxUl6AdE/CIEiKKBiIrw6HN05JSXeo3IOyKbl8iKGCAPkJwUKNeIuiM
 EpoGoigidkvIhK+NpjdACQWggdENUNMlGnXxeI3qJYAPRFXGE0VjgPqgHxCwR1UBMRYKx2fJgQ
 P597OVy+QFD1uYImwIAAA==
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5157;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=ECDRQ+WrFbVZS+CZDLgpuXr0f49U0NwaVirTL3iNsYY=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqZt9OCSm1dOCGzSJG+/XAVlSwITAZ8teBCVRjk
 RqnKU2yX3KJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCambfTgAKCRClg0K3CVbE
 gSq/CACmfWJchkK2REQmVizNMc/5PAD1prTQWJl+KEK5rofWdDRC6CenSzKodSHaOiosooNQ8xY
 wpZuiTO8SCqBKKhc+Yx4CB4iidhIXfQYG48xpoDZuctrCXJ5c0C7AJyOapK0elrUhZNtURKeF6H
 Tl5lVXp+0+ns8eiQDudLuxb7z1TOgdeNRgMh/xIu1AsxzPZAVRtZOQYmJKscDdUO5vo2kTgDgg0
 hk29/s56q/jfONI2zraEkDRZIwTdU50Z3KySYMDP0C6gsXuzjF6EISPnNACStGp61dGSsVb+XCV
 ymJHdtqSrlkeey2fQDFpVJy9s2rusAx8Gja2BEv+Lqjd6rgB
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v9:
- Rebased onto the `aspeed/arm/dt` branch of `bmc/linux.git` to resolve merge conflicts.
- Resolved all formatting issues flagged by `dt-check-style --mode strict`, including:
  - Fixed 'mixed-indent-chars' and 'continuation-alignment' issues.
  - Sorted properties and nodes into canonical order.
  - Removed unused labels. 
- Resolved DT schema binding warnings reported by `make CHECK_DTBS=y`:
  - Removed invalid `channel@X` subnodes from the `maxim,max31790` fan controller.
  - Dropped the deprecated `aspeed,hw-timeout-ms` property from the I2C bus.
  - Removed the incomplete `ti,ads1015` ADC and generic `pmbus` power monitor nodes to comply with upstream schemas.
- Corrected the compatible string for the 40-bit I/O expanders from `nxp,pca9698` to `nxp,pca9505`.
- Link to v8: https://lore.kernel.org/r/20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com

Changes in v8:
- Addressed review comments from Andrew Lunn:
  * Added a detailed comment to the Marvell 88E6393X EEPROM node to clarify its hardware I2C multiplexer isolation and out-of-band firmware update mechanism, explaining why there is no concurrent access or multi-master scenario.
- Link to v7: https://lore.kernel.org/r/20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com

Changes in v7:
- Updated the commit message to include a detailed description of the Ventura2 platform's purpose and its key hardware features.
- Fix comments from Andrew Jeffery:
  * Ensured consistent blank lines to separate child nodes from parent properties and from each other throughout the DTS.
  * Sorted fan nodes in ascending order.
  * Replaced '//' comments with '/* */' block comments.
- Fix feedback from Sashiko AI:
  * Added 'idle-state = <6>;' to the PCA9548 mux on i2c4.
- Link to v6: https://lore.kernel.org/r/20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com

Changes in v6:
- Addressed automated feedback from Sashiko bot:
  * Clarified comments that io_expander0 and io_expander8 physically share the same interrupt line (Wired-OR) by hardware design.
  * Removed leading zeros from unit addresses in DAC nodes (dac@c, dac@e, dac@f).
  * Removed unused properties from the adc@48 node.
- Link to v5: https://lore.kernel.org/r/20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com

Changes in v5:
- Addressed review comments:
  * Added comments explaining the necessity of 'legacy_' prefixes (hardware label collision), pre-allocated I2C aliases (future expansions), and the 'ledd1' naming convention (schematic alignment).
  * Removed the empty `&mdio0` node to comply with upstream networking subsystem guidelines.
  * Removed the redundant `&peci0` node.
  * Sorted `&kcs3` and `&lpc_ctrl` nodes in strict alphabetical order.
- Hardware/DT alignment updates:
  * Removed unpopulated sensors (adi,adt7461, infineon,tda38640, ti,ina230, ti,ina238) to accurately reflect the current board population.
  * Added the secondary flash node (flash@1 labeled "e810") under the &spi2 bus.
- Link to v4: https://lore.kernel.org/r/20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com

Changes in v4:
- Fixed capitalization: "ventura2" -> "Ventura2".
- Reordered I2C child nodes in ascending order of unit addresses.
- Enable PECI, LPC control, and KCS3 interfaces for host communication.
- Configure MCTP controller on I2C4 and enable MCTP support for specific mux channels.
- Add Infineon TDA38640 and TI INA230 power monitor nodes.
- GPIO and Pinmux cleanup for PVT:
    - Aligned gpio-line-names as requested.
    - Remove unused or non-existent GPIO line names to align with Ventura2 PVT.
    - Update specific GPIO pins to empty strings where signals were removed or consolidated.
- Adjust SGPIOM frequency to 200kHz and update signal line names.
- Enable UART3 and add serial2 alias.
- Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com

Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 3005 ++++++++++++++++++++
 3 files changed, 3007 insertions(+)
---
base-commit: 749c34389679f8d56cb200a69b62f9a64670034f
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

