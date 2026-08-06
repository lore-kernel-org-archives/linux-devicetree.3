Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E314D43F08F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011735; cv=none; b=Z238QJ4Id3sSIyy7XZSXPIOXUYOnUqLDuFxnScokz9D4NjdX46H8xaub/crEIrYDh/70zOh0KWj9BEqkpCd/+yCuS2ysu1z1P9TfaIkbbfns2NR+Y66HvktSlL8rtauFHNwgDx3Q/m6K7AwqnJuU9zfhS2inmjChdEyApOQYReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011735; c=relaxed/simple;
	bh=BhNchIMHagP5LNiH58a3QPrktwpAXLbNmtJZy3kytRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UtSwBVfO0ad1/dSAHT1N/JulYmbvgO3vRLcDAY5WQX263RY7ScQ+R0EJYsdrOqps+Za2hH31VF1q3TomZVHOuavR42XzmGfAQjKqx8SgY0zxZZiIToVtd/lOcIvsxAIFkVwld8hK9HXOvOG/2u8zYAH6MhzADXBy+TpDUort9lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH3P3bt6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH3P3bt6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49800c6a846so16517235e9.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011731; x=1786616531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNH7C3+W1iQuetjKu7PHcF0eka/FhNKK8WPnZOjuhC0=;
        b=PH3P3bt6Hf3iiq0uXf9D31jPLqsO/DuyrEn+81iZZsPo1+qBRuJ9Ch7NIJXAQa1uZN
         SQs+XuRLbQWkUz3K6b2o7ZddSP5ryKSWfxcLPkuJ5ZG7e84kf9+fGXdE/1189X0aIK1n
         rRmRJ5Ey0NaGVVrR9OirxkbrfNyqDgmYJtZ/W1mxU3GMlKSo27OelNPIPj1jxIfTXZpX
         7H/G0IjInc6X0cvDimzC185OU0QaX/CEmi4qJ4vwh1ftTR3SGVLLZrKqIG52JNDUzBzb
         JwdnzlgLappTdPT2ubxz16sY1K6rNLrFzKU5x6BRwjpz9fiHMibB0hYABfkixAqHSS1F
         z4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011731; x=1786616531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNH7C3+W1iQuetjKu7PHcF0eka/FhNKK8WPnZOjuhC0=;
        b=ZEtYUeEmupekOgWbNOxre6rI3rKMd+S/WVlV6KwOHLbSOcXMfW1wY1PVIUg8L1yrMH
         F7z39W8joco6yZCbm/qlIFD0tnxr4ovPh8FCT5O8a+QmA7qFAt8m+13gzl5z9GpwAkru
         d0+yjYDzG8ABSsJ7W//Ffplz3JW9CEhUPMU70Z0BRzbfwiEBaccCdwvifC+4xMab0kXt
         bIBMmLoHg15+pX72LxT6I0QajW7p8YNQkiMKIa8di7WVKzBMcc0Wb0UpMGawWi/Fyf/7
         ufCyTE5mFeGdzDjygtjycTQ4eg9wGi1zZ6l5JuOsddRk6Vb7cmNw1jHInRUVBeOy9VDa
         MM/A==
X-Forwarded-Encrypted: i=1; AHgh+RrMV+o867BWpeczqXg6gdLaagKTgYMF7YcLRKkCOcV1dZjn9PCedhaQNC9dd1fkf8dsv4QZjNvg+0b8@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzONh6+9EMQY9gO3lquHms7awGUjGSSI88LJ5BBnM7Avy7mOg
	CV4EY9KWgHYibLDkRK8UGPwviL02AXZ+7sLsX8cAK4F8b1Apd1LKhAYv
X-Gm-Gg: AR+sD13XNz+0T+AjRksWS6NWdHgeAh40qTKGaPtTN53bn75ozuOc75mD6tvA4PcYDo+
	UtspFnVOjg50rYZRafT3iwBB5GkH2cIJj9C0CXhvBA2+doRqhtHBSSL5IMEfFzvLV68Qgcv3TYc
	7gigR1e1A8QWfiooPzbDWYNzbzUjtG/l5s1WSJWtgzyCVCdUYfIpuHYe8BERF+Ujh+WFPqeBBfD
	LI85Z2yashDLCr0CZZUMf9VmoJ3zXff4sws5ijLu+JSnp7oA94cTCr4xpjV37A1tKEo5BCcdiT6
	mQdoBxydC3yAsUzYnakkO5e0OfLi7IhATOWNKPCD78SAgRlFn89pB3UGMBrn5aZYSzhkxDBn4XV
	n2EAwhy4jPX8hvjJS3+G3tqIJDMLCmfhWGncb3Q2OhZcohNFCjaZeGlNzFxeCXFkx5I6G3UBRtK
	hYr+KXwzjt3tFp8YLzHi9UTQUixGNTm0UPRedgygUeT7xNPqJl6IP109+t7YVQbS/NdnsHnzk1b
	Z+jNGHMH98X
X-Received: by 2002:a7b:c38a:0:b0:495:7538:d4ea with SMTP id 5b1f17b1804b1-49959d790ddmr3341015e9.0.1786011730787;
        Thu, 06 Aug 2026 03:22:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542851d6sm58729205e9.12.2026.08.06.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 00/10] Add RZ/G3L USB2.0 host support
Date: Thu,  6 Aug 2026 11:21:48 +0100
Message-ID: <20260806102206.149110-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add USB2.0 host support for the RZ/G3L SMARC
EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1. This series migrates regulator driver to use id-table so there
is hard dependency between reset driver and regulator driver.

Merge strategy:
  An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
  Patch #1,#2,#3,#4,#5 - Reset subsystem
  Patch #5,#6,#7 - PHY subsystem
  Patch #8,#9 - Renesas SoC

v5->v6:
 * To avoid breaking bisectability, prepared a single patch that
   does the "rzg2l-usb-vbus-regulator" -> "rzg2l-vbus-regulator"
   rename in both regulator and reset drivers and that could be
   merged into both trees.
 * Replaced dev_err->dev_err_probe() in error path of
   rzg3l_usb_vbus_regulator_probe().
 * Retained the tag as the change is trivial.
v4->v5:
 * Collected Ack tag for regulator driver changes.
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
 * Replaced the variable regulator_driver_name->regulator_name in struct
   rzg2l_usbphy_ctrl_info
 * Switched to power sequence consumer for controlling pwrrdy signal.
 * Updated commit description for patch#3.
v3->v4:
 * Updated cover letter with merge strategy
 * Reorder the phy binding patch for easy merging.
 * Updated the commit description for patch #2,#3, #4.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
 * Dropped rzg3l specific platform driver.
 * Dropped the tag for regulator driver,
 * Added id_table handling by introducing a common probe().
 * Dropped renesas,sysc-pwrrdy property for usbphy-ctrl node.
v2->v3:
 * Replaced items->enum in reset controller bindings.
 * Collected the tag for reset binding patch.
 * Dropped clock patch as it is accepted.
v1->v2:
 * Dropped patch#6(Introduce helper for regulator registration)
 * Passing pointer to an array of regulators to make it scalable.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
 * Added enum instead of const in the compatible section.
 * Updated schema check.
 * Collected tag for PHY binding patch.
   in the regulator driver.
 * Added regulators group node and its children in SoC dtsi.

Biju Das (10):
  regulator: renesas-usb-vbus-regulator: Rename platform device to
    rzg2l-vbus-regulator
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
  phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
  phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
    disabled VBUS regulator
  arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  40 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 104 +++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  75 +++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 109 +++++++++++++++---
 7 files changed, 370 insertions(+), 29 deletions(-)

-- 
2.43.0

