Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7825D23D297
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886437; cv=none; b=T5/xgLKfKtRevtM2s++Gg7If72lkPifjX7qiV5MMgzIIaxrIrdRfiL7YWULGCCNha/T5nNzdrr6RcFDaJUabbgqtibn+CK8Nt59OR1V/Y+0OhDXxR3g9+L1uGwsSeqYJdVHfaF6PXc1j24XWi27FmYmjHSBBQkkEHIq9MIsAr3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886437; c=relaxed/simple;
	bh=Gi78jGqhca4I3YcILxH9j+RePrTUjsAyMzxkhn6QReQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kUANZ2Om0lJlIuBl9N5h1ehvUSatc9ncuJtHpd1dBjtBkX28VWPUM+qnV2ZvepREPwl+dh9SIw1HKBZ4sIBiwe1Gp92UhWDqR2eN6KyYGiPxenKhkKtNaAe2Iqm6WrIU4FdYBrEt4+PIJ9TROPhpHHEe4rDblSet+32EYPksuis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HanKu4dA; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HanKu4dA"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c85ba774551so1321129a12.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780886435; x=1781491235; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38SrOSOGK3sCwLNpHejTdRoa1jMmte3Iy/3zoqwAvic=;
        b=HanKu4dA5d1ze2td3To+4JU8M7FHW/UxIGaM+PJYyzbID9H54FFmmWti3IzL1FkbUB
         MDOSNWNfafZn9Tr18l8RMFNj7MdR2htMMH5D0+NaX+PPcXxNZYrbWf/+t7PIHZn7q8Hw
         iNBZYUx5jyR4gEPhuLdPOcAutwD8V2UgWp94ENeei5Kq100sbIyMVMqApgHxaFTynPAB
         t3dIHrbGQAWfutLZ2j5c8crtY1mh9G6i+J4sSY3AEcC5reJgcLUJHzORfTntgW56wZlZ
         E8z+lzP3TvDHBRoOK9mqyeRB0R9nBWFBcDIJsgTITMe7hoFsSw6sFJ4nQhjvakTOy2gP
         cVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780886435; x=1781491235;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38SrOSOGK3sCwLNpHejTdRoa1jMmte3Iy/3zoqwAvic=;
        b=bQChW37pcfoP1/jZ2+KoFvdfLpX3iafz1yhtxRnVskEhWPFRSGwF4swM9saP/Iw4Fy
         QaH28tqVhJsqxNYcRq2Ue2YmolXlkuPEvoNCzKv78dmueatYTg8HqV95ldso5trmK2xx
         PTTeimtMkI/IK/DKValSrbKswoiZsqywk468FxoY/DBzKGKPts0B3iNlDJfx0p/dRw64
         ZSeoRBojJv031bQiIPbt9MQUh3N3qaEZ2iPRV9kWs1e4l5EPwpZLaJ8V+qY2uVnzPGRM
         Mqtb+Bc1dQwCiperwfkc4WLt+Z7YFTLfFHjjZxG68fB6MRz51Bew710aZsRXESn2Zh7y
         /dyw==
X-Gm-Message-State: AOJu0YxieT1EU2v8aKSAwuC2HkZxAHSa2GQaCC0toatLw+/i/rw1Y0kM
	HcEMdW2o7y6jGBODS1ooyppcFMcBXV4g65r9WP3m9Way05EcOxtIjExw
X-Gm-Gg: Acq92OFIlkAUWAyBJNGkpaFziRhfVg2Omr02iV70Tj4bq2cUfdPl1WXS47PHmLBoWkW
	syTwdHGs/ky14IOC8yQL9QeEwEbfpOPiK0JOX5RWZdAlHOMjm8WI2zl1iOSuhsrBNHfp11VXINA
	Dq/ICDqAqapGzTKYKk0lcsaJwQsf3Q5lkG3v6wCmo50eh30j8gzWvYPkFeJUZT0/T1WgfrRQnIB
	tkDuxtNhf2l8Qk8wZv/5STpjDTiOAvSwDiNQHhiQBFYrZ2HZdL/R7hNsWPcrt4h2yriPU0eZj+J
	Hse1J4K+s4v0yGRg2RvczwSReAJqeXS40l57r9twlClFAO2ihBYMJ0BbXEHhcbn4sZPsFeKSB5E
	irtSF1d72l7qvdLPPOUHtlCRCqakw6e5LAr+a78tSJB6QtdWa1oHtv81Gg1bQwcLRgpGOsFxRGN
	EUtdNc25Q2f68BQp28P4wxhbLlMUEEr4g3GI+COZRw+RmFRxssqSDAFWUqdxn1ZS1Y9LeNvZdGs
	w==
X-Received: by 2002:a05:6a00:844:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-842b0ea14f4mr13899922b3a.21.1780886434827;
        Sun, 07 Jun 2026 19:40:34 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm19310520b3a.26.2026.06.07.19.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:40:34 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v5 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Mon, 08 Jun 2026 10:42:07 +0800
Message-Id: <20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8rJmoC/4XO22rDMAyA4Vcpvp6HLJ+aXe09Rily7LSCNhl2a
 jZK3n1uYaxshF3+An3SVZSUORXxsrmKnCoXnsYW9mkj+iONhyQ5thYIaBUiyprG+ZIJ9zzyzHT
 ax7nIDrqg0fvonBVt9T2ngT/u7Nuu9ZHLPOXP+5WqbtN/wKokSDWAU871fkv69XAmPj3301ncw
 IqPiFlBsCGD6nQgGw34P4j+RhwopVcQ3RCMYYjkyAbjfyPmBzGrn5iGbMEFgERGK/OILMvyBYq
 Xx9SHAQAA
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2830;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=Gi78jGqhca4I3YcILxH9j+RePrTUjsAyMzxkhn6QReQ=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqJiwEBeVbdsZIqyr8QR4WZFHc+4DWcWIpgMLHD
 L4ZxmsorE6JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaiYsBAAKCRClg0K3CVbE
 gfajCACvzmERcaUA5uZwA+10S/TWH6Nt3JMJnEm+URle13QSepXcDkTNb0eQmi4RsfL4iVmNsoc
 /HrrnqUGJS4o41K7I2CL0WynKLmUiv4gJQx4v5jymkNb09RR4n3mHvvXI8BdNz4VOZBoS0tusQi
 zAsZD4NI9x+3U+rCzFfRt5VdWzbutkScoAIOT9XF1kk5UdiR4MRy5LqpoS9UDPQRnhNmI0fewMU
 MxixylKyvMS7KPizt0rf59y9QmhNnq9BXaQG9zWX/PCWIJzlVAKJHQMRwrxVThJ69V9z+MdpIXz
 hDeKrlubXoPM2vXYsHHpku5Y4zXSK0vPfeBqgjBVmp56DV8T
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
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
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

