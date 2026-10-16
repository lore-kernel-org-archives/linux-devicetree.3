Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559273C3438
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140390; cv=none; b=sZm4R8BnWcbqc9uaF0W+SYxNGkl2Gt/Askv5lhgTdWwJn5J8UM0lka76tAfBQijgd/Jj89OJ9VyBtYBsOdI30svcpOBMcTa4TN537/Y4kaCFkI8hn1mQfy8IXckiZynjyG4D1MzRaLqeIbE5PW6exvXgJ1kQNjQa3Yret3ZXl8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140390; c=relaxed/simple;
	bh=Dw70fL2b0plUD/9OzGbqtTAJXKQCheRPU6+zb6qN4o4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CXS4o+HMzqS5v01XqERub/uE6G0aDuun/isUrnPn4/RiGOC8uN1jx1NEmgx692LJ5nx/hMG5YFWzPz9cMgidZf7ly28kzhAkldaNyFWbSf6wwEVWSPtu9v4tO6Wx7QLpALLNB8Gu2XcU27y0LJKco+sOEXuLKktflT4Pq7dlpEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCWaiFyl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCWaiFyl"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89e018e466eso1114385b3a.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140383; x=1792745183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eP7FY3OQgnStG7pJcM3HLJIH3BqNv24XrFsKRwPXnqI=;
        b=UCWaiFylulxXn1DvXyt3dJAwNIC7GCX+OJdXMKCkbspkgDncJE4cBaggEi45WwBiWd
         fd8Qw5Bjr7MClLZyTObJ8w32qFenSSes/U3ElMR2Fp6WNUB1E6fCZXbb5PrNvyMECMf1
         e5N2Agpyr39mA05JS/26RFrGypjl92n6ZVJBtUUJVC6Dc+MqykXg3KPAKL1bKdlc4Ujg
         aqNQJHl/LZcCJTJEW8NfhlktqbeTFQWBkZHFVTk8TLNY8oXFFOJbwFV8aC4M4KhQqiPQ
         /09zxPC6gWXlf3gVGT/d3xtZ0Fk0EO49AL32JYpexdHFxh2TEud6CBqQ/GoUgaxBGaUN
         +9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140383; x=1792745183;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eP7FY3OQgnStG7pJcM3HLJIH3BqNv24XrFsKRwPXnqI=;
        b=1IDlRWskstWWE5mSdUeHINQDD6pbnWxLlfAWAGMnEOfQPr6I3gFjdjN3F0QyLH4fe4
         s0c9PtQASImDZCKkxvn2kVud/wc1kEO7iIdipkCSS95JtiNZHV8Agl6xqklTsz6p+569
         s9D1+55Gt1yLe7+LpDe6H0wsi6t2Pm4pYgToKvwLq74qT0vBubTjDXsiJfNsR088lK3N
         6sqgp/rTRIHkgsTRSY50NsVDxhVrbxWBiJKbnKx5RkzVCGHfZ+oMwEhrB4YYjEFDofex
         JjPgsLotCaWJOhHglO6JwXA8J5JJ4/1bwcI8ETT1FZOyNcm4R6S8mvuYhhjbj0uN/BGI
         rb5g==
X-Gm-Message-State: AFq9FYJF2Ump264Q9d5XOunlGL2ojE4sKI+fMz+n86fdqGo4TwgtSaO5
	hsUuCMNbK8sPdyQhiBKE1q/ByktIf4eM/QYYkWCR/5esT4AdQRm8lEB7
X-Gm-Gg: AYBFou3BP7yuu61So22t0hpoanhKkBrwNLemUkh+LSuao2zSUqmkqHzhyMt1NtBQEhL
	nBmOeGqO0JUBQvXrwSZOSJvoSO46UPmMO9xbdE8lUc/ad3s++8bW9mLJiD/z3gnTV5xPAzbuQ89
	jX6pig3B6OYdm7QwdIppO0wTSdTLgVPpO75/JuRDepOXReKZa4rrenuUyV1Udse90y0lqTugu7a
	wOeawVO6f4+2tv+9GoMpSHKDFBtQwGRIqSyUciTIw1KhJWEhJCWXqcH93GTOTpDp9AJgd6d2g+2
	5bYFVnp6ILEVgqEtx1DAAczQTK0u/cyelnJk9OK6sCsY+dFkKZrQbECikSsl9Qn0iziRx3iZn/M
	dK1dvL/Bm6tJgA3PWBXWq/cwnXE0KpcnrzO9Xzzlb6OaXMn8kqMMRfZCPTjjMzOzSEVUylexRxQ
	r82vQDPddDui2wBGHtQUm8FNdA6VmDdhEgNu/rx9LPY7CZ+5DfJLrqLIW3unqgQIvYUNIwbhNBD
	7QpN33TD3aTaNn8qB4BKI2/fQ89ea0lz8M/GEm9HW5shhdF
X-Received: by 2002:a05:6a00:178f:b0:886:18b2:361c with SMTP id d2e1a72fcca58-897c3ef946cmr17880250b3a.7.1792140383169;
        Fri, 16 Oct 2026 01:46:23 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57947b0esm756620b3a.39.2026.10.16.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:46:22 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v10 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Fri, 16 Oct 2026 16:50:28 +0800
Message-Id: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTl0WoC/4XQ3WrDMAwF4Fcpvl6GLNuy3au9xxjFv62hTUeSh
 Y3Sd59bGA0pZpfngD4JXdiYhpJGtt1c2JDmMpZzXwOHlw0LB9fvU1diLRgCKo6I3Zz66WtwuCt
 9mYo77uI0dhasF6h1JFKsjn4OKZfvu/v+UfOhjNN5+Lmvmfmt/QeceQcdz0CcKGjjxNv+5MrxN
 ZxP7AbOuERkA8GKZG6FdypK0E+I+EMIOBcNRFQEo8/RkVNe6jUiH4hsXiIrYoA8QHJScLlG1AM
 hMA1EVUTolJQPWRlPa4QWCIcGQndERZNs1MnnNaKXCG8guiKOeDQW0Af1hJglohqIqUgwNlsMB
 uTzY+0D0agbiK2IAhkgBTIg7BK5Xq+/B4rCleECAAA=
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6891;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=Dw70fL2b0plUD/9OzGbqtTAJXKQCheRPU6+zb6qN4o4=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq0eVZpleBCZqqfNsYKGcsYjmdftXDSEKwmFEz/
 Fk7HceNwaGJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCatHlWQAKCRClg0K3CVbE
 gZmbCADETLjO/mJloOC5b2aXbOyfCVndZI+m6BIevSwUcj90wTGsuiJwyVFTkmwFuzK6d/Jqnm0
 7rl4PZZ6NYSnW84hkE6fCnYI1vRQqZbUTn7eNCdqoMneyMYztF6LlAUnMRfa9oO5t3eyNYs/Cni
 pfq/fwmOLt6/Q9y9+ZFUH0F6I2nM8KMw+xN4krxRpLEfFtbQvWcZT9AzeCiI+UKVv9+ibA09SfS
 jE30Cwlj7GFRpw5hqVi7xQbp9LJjblBjmehWjXJCBzGgFiZAEL0YDMOoMcsDJtormME6XE+gdJy
 +qfWkotAWp2NKPuOxZOKOrwARqrIe/OUFwgL3p6RrAmvrffg
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Summary:
This series adds the device tree for the Meta (Facebook) Ventura2 Rack
Management Controller (RMC), which uses an AST2600 BMC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v10:
- Addressed review comments from Tan Siewert:
  - Restored the standard kernel comment style (' * '), which v9 had
    changed by applying dt-check-style strict output too mechanically.
  - Kept #address-cells and #size-cells adjacent.
  - Added openbmc-flash-layout-128-alt.dtsi to the alt-bmc flash.
  - Added a comment explaining that &kcs3, &lpc_ctrl and &peci0 serve
    the optional COM Express module.
  - Renamed "Sequence_TransFR_Alert" to "SEQUENCE_TRANSFR_ALERT".
  - Added the Assisted-by trailer to patch 2/2.
- The v5 changelog wrongly said &peci0 was removed; it is kept for the
  COM Express module.
- Hardware alignment:
  - Dropped static TMP75 nodes (i2c5 0x4f, i2c10 0x4c/0x4d/0x4e); a
    second-source part is used on some boards, so they are probed from
    userspace.
  - Dropped the INA230 at i2c10 0x4f, missed in v5.
  - Declared mctp-controller only on i2c4 mux channel 6, where the MCTP
    endpoint is.
  - Added FM_E810_MUX_SEL_R and FM_E810_MUX_EN_R_N line names.
- Dropped redundant status = "okay" from I2C mux channel nodes.
- Moved device_type before reg in the memory node.
- dt-check-style (v7.3-rc1 and later): relaxed mode is clean. The
  mixed-indent-chars warnings seen in v8 were false positives on
  '\t * ' comments, fixed upstream by commit 32541ce0ae ("dtc:
  dt-check-style: Allow space-aligning indentation in DTS"). Strict mode
  reports 10 [property-order] warnings, all from keeping #address-cells
  and #size-cells adjacent, as requested in the v9 review.
- Updated comments that still referred to labels removed in v9.
- Link to v9: https://lore.kernel.org/r/20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com

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
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2888 ++++++++++++++++++++
 3 files changed, 2890 insertions(+)
---
base-commit: 749c34389679f8d56cb200a69b62f9a64670034f
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

