Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31744238C0A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781491465; cv=none; b=qoPtZ9njWxXM+ZsU8SaKG1MDXpfAp+cjcJyDnj04FFbbBR/y5u7BPBafs6plW3Dm7hBcyoCDorqYkK/V9geac2BXP0Kw2pauIoK2qBn5lXRhSC2wqkd8usQn+m0RiCTdjr6mdPVqrtkD/v8nOaPGLtQC80iTjDAPSO5Dzq2x67o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781491465; c=relaxed/simple;
	bh=3h3qFVrVCHwqA/9jJB20RsTtPzwqAaPlxKs6hDrBMFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=urKMna8EVOEbeWSAmztl2B9KX3+CTyZh93QM1bvTlZPxZtLkxKFv/T1BJ/tsVyj+EmTwnF7B35BYMMBZRm6MnWP12irhLdecVTRUyhF4Z2SkpDNMdbsH8L6IYUXDMCfAQ+u0+X0BnJR5327+yI0IpVrmWWa1IRI5DfbPZ7bnwrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeyPNor9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeyPNor9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c3546924so16821495ad.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 19:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781491463; x=1782096263; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQuGdM2CJQXaRNDTIGDSfZydcbPeUd8rTAur9l3mo3A=;
        b=KeyPNor94Xq4r3tLTOIm/Fwz+YwU3pMjvRjdD9VkILBBtT3IhSgAzE1lgbw5q8ye4a
         0jUAi9Glaq7IfDu2XJPJ7mw9xzpoNiaJjXQlPmZKUazRhQ5DKTfTqQH+Mz3ZI3ZfwUwS
         IssTaaFFEiU2VSWj/caBhKghW6Ve+v/tn15ji9ohPi2d0S/+gGPLcSMRsrWX6qX+zrwB
         jJKRbBdzhum2OFYknPvSNvZ9nDaLlZKzYw0aiW4T06WOymITow0lqrO+uivb4WVQKzmO
         Op8/H0omiEhrKdwNFJy6hIjl8956Iek1sWYlVt6RB2LtrjGqVcLslfBrOrJDskQeeZNL
         7u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781491463; x=1782096263;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQuGdM2CJQXaRNDTIGDSfZydcbPeUd8rTAur9l3mo3A=;
        b=BiJo5Sge9+zIQ+4ZB9+rkBK5kI3/M3z1DRS0GFSOLkd/XZiXJs+g+RiiNtr6rrisY5
         KJYKW8VYFlMCacOsQG+WlL2g83xKqv68NKW1KcI6sQao/CUSzKhOulEeJ1oKw234URXI
         +1rSMUPCOOtvM+OtdrN+C9ql+g+fXnfbZ67NSs62rkMGrAcEQhx+moAWT+Cson3SABkJ
         j6gGDYwP19MwtFKm1TM/ESTpgdYxvIWqoo3Y0VCYsZX2W4SumYX75Q3UcW4Ahn6VOFrT
         EzPKYwaH1rL7RwAKEk2qoMcdRWzxD7gfa6nt3pmtXXyuVAnJqye5vS8KvmArSY9f0GCO
         8VaA==
X-Gm-Message-State: AOJu0YzYSaj2lgDtvlyzVkB+cxEmIyh4fWfYt5rE+/iWD7ww4pycWvqQ
	24GNo1wHiNwTkIRqPaJoVeoHwrKg57PMsmvf+Khq5CUMc9JxGdWH0woN
X-Gm-Gg: Acq92OGnyJiieFtP6rdlJX0ve76ECKuqUnm9oZ0LYSXNojeCJIinhDhjHSKVlJccbGP
	EzHg4LRRhUh0nIO5+JohyLudxxiKRvMQoy08yo7LPVbcDvn9AmZuHidrvRYFm1iEazh2SlSRBCa
	vB7/rHx0GDcvcY9+9voRvRpAruJyPz6Kpzxb5KUz1t34GEqKiPW1XuJCIwF0a0foPQIA4agpLjt
	ZF2ZJhUMCu1whX9ehU0weooHGHJ80c+ls3TlXS8lReb0xLQiPib9M+PYFbZ4prgNCE5NZoTBbS4
	Cck+qjj6CL+y4SNpAM8SbsibDX7LH8Nfo1rczdI2OkFb7A5gQ2d/kpLE/jzcsz0EN7Ji9m9oK9E
	IZLbKQQFKDJf548vsI3EE/23YIhdyJcFIJzZHfCTCPvaMQkbz7RcbKhY9agLYaW/czOUe6ye1a/
	jhCHc2No169TwKKILwTCAHCX5Sy2jpvB2TadZTuyH91P3NpkrobcAgTyDyaDrhGXM=
X-Received: by 2002:a17:903:98d:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c6641ef6a8mr105720065ad.9.1781491463515;
        Sun, 14 Jun 2026 19:44:23 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm7138676a12.11.2026.06.14.19.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 19:44:23 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Mon, 15 Jun 2026 10:46:01 +0800
Message-Id: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGlnL2oC/4XO22rDMAyA4Vcpvl6G5IPs9GrvMUqxY7s1tMlIs
 tBR8u5zA6NZhtnlL9An3dkQ+hQGtt/dWR+mNKSuzWFedqw52/YUquRzMw5cIee8mkI7fvaWH1O
 bxmQvRz8OVQ21E1xrT6RYXv3oQ0y3hX0/5D6nYez6r+XKhI/pP+CEFVQYgZCo0caKt9PVpstr0
 13ZA5z4GpEFhGckYi2cVV6C/oOIH4QAURQQkRHuXfSWrHJSbxH5RGTxE5kRA+QAgpUC5RZRT4T
 AFBCVEaFDUK6JyjjaIrRCEAoILYjyJtReBxe3iF4jWEB0RiyhNzVw16hfyDzP34jjJyNWAgAA
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4257;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=3h3qFVrVCHwqA/9jJB20RsTtPzwqAaPlxKs6hDrBMFE=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqL2drhFWW9Ip8dlj2f14cILevLO2MTyU/2m3Ei
 PIkuV427ZyJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCai9nawAKCRClg0K3CVbE
 gTMUB/9x5bCCP2AyO20NPdO+gjy6d7sGgdpp5kUBZUx308VpT6TYKOLoou1dllpA+RlDeokdUau
 XP0gXKvPjTBdA5aSgBc8SZOhIaDlL+s2LS+iTf05I/445Y5v1qF5jhRBt9Sk+bGO9bWiwlZn2we
 Ucge/Q6UdVqwYQlLI061q6artDZhH+u2Vt+AJKBCqqQpU9eY7zM3bK2gb5V2CG6bQXATIRFN29A
 fUxmaK6R/7Ze9qpq3kUcvzkxiWFHOoS/zF1aWYf0u7IsQ8Un/CqUY0ZD+6OP1wQ7fKBJryWPXHh
 FjvV3AydxMHniehH2Wdu7Nj3BigOeiR/z8QXaZn7HNv0vjgf
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
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
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2903 ++++++++++++++++++++
 3 files changed, 2905 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

