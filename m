Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07A47A863
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325830; cv=none; b=Pa70txjjmYeBtEuJrxCmT9aSOpwmQ4jGIdHrkBPP91DastjmTnWaL1JKILt7xMjNOLNN626bF71AmERZAs1zF2v/Mm8bGjGkPrzMpvaCbijFFTErSgp05yhoKaVlZjzhZo+UTqp0e8SOYNXYPOVbhWiEuZx/HtgpK1kjwUr6pPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325830; c=relaxed/simple;
	bh=lR6QyY25Do8SfES/EfGeKw3VaIh37ivecitZT6N2LwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=itl+amltmTcN9l9Lorzlp6p+GNsBKh+8+/K6DfX/YYS0Ex7hEM0hVFqtGGJq0zq+AIlkzgbtFxyHIN0uHUh6yyAyxZDjw2PeQ7JBnf1KsN+6PoRl7zR9qpcML/bqKRFpEB5SLJVbgZQsvAKYvGwzVImWb35flpGxj11MnkxKk/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mufecqUQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mufecqUQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956242332dso7308815e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325825; x=1785930625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UW2B8F00dGnULpBPWdrKAf1y7uPkeTEHd5iC6/HbnbU=;
        b=mufecqUQolxuinqRsImnCkL9FFJAz4nKLzx7KCmMM0qtoAMVWGglrkDcUYsPqyT+eY
         6OlzHI0NP/N278zypR+BlAbz/tQffHkNBJ3joKjmV2dqeVjDmQfywSvsinC+ffBKyIKt
         XgRPb1tSrYWSyWEcmHCmwWiBKgEam5TQMwEgEB2Jm1sdU+AEkZR/aZJCiAi6UwF1oHNJ
         Pzc+ySej8Bx3cKMIefx3KOjtoliWWWNBk/v9lgPrmscflXJ8j44fH0pEyRjJLQZ0WdcD
         gUBz+bTbM5UMbHDbHPhCnnZGksuhjeerXA8k7a5o8N2QlUJAfiylkVjtK6Cpk7Q0VEd/
         fIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325825; x=1785930625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UW2B8F00dGnULpBPWdrKAf1y7uPkeTEHd5iC6/HbnbU=;
        b=lJXWBuI1fjpHk3BrbfmHPgQH8m+eFSBR9I0BYuWgfJQsPkTP4gykEcXHn2Ix8DU984
         Xn4qHVkUxFin61PjL+Oz3jBgv8cluB6CI5NfLbSfmX5p9mYsbFNiLvqd8QRWkmwIKt0i
         EUNpIJQ8mwFNNdYJ41nq4rvXWZX/fTL0EntGylA+MS/bFnwRD6iITofoD9kyiC4VnNb4
         pTHik0q4m6+coUHhUKQBiJfwe4DPWawkS8gF36wclHUzmqUOSLQnGPFVOzf3iy0qa7Eq
         dsS9cSSVspSIXBGw8f9m6yd7UCbL+OXvgr8jFAL8Nfv26/i2yplohjryU/f03nrkpbS/
         Femw==
X-Forwarded-Encrypted: i=1; AHgh+RrGzXCzhYz01YGwc/L38ZJfdY1CUqhmhwm7eCkQfpzkd1jt+GirQr7pD3kwqeYoZeWHIwQ4R+2SVJt3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4wQuGsUTl58If4Y59t7Y7K4I1jaxjGMvX0bC+y7C1VVKYkStl
	6PdO5UfflmwlOZ+sNCbTY6LWMN6N4v5yViKVwnG+aAGGLgEeeUKxHFJ2
X-Gm-Gg: AR+sD12Qv3itcCxfVt+g/M3GpIWXY7+EI9Qe0UGzCMm+/1uzp780k4i12+6Iv8Tvk6q
	ctdqOFDUMhnd/9O1iqIKlPQaU1hsU5uYLt5vNWNKIWunBLs85Oj+JTKY4t7CNuPgHyJIv2tCyZe
	ji2ltgjy4UP7DCK15pLBJ71bgN+rB9o3MxQxtsy7h5dE8KGVXC4vGWKxftFhD5fHaWCfOZsi9ou
	Yz0CYm/hTxXraM+lhQIcLcsS+aM5bEo2Pzi0ANr4+gkrr6uATLS/wKRCNXpR+WVso31YfmfEABz
	EhYOZdrcaFePDBkDVmEu3dbKCR06Y4dXsHGC7aYzQ0WjZixoDw56bDG47AZ5e26iZwWAaXeaKqN
	IH9eEkdm3KxX3Fd0tlLD1Mb4c/juLgiRsEdstqldIe7Tdsz5mXQj2LsV7sZAv3S+4bHc+PPTQ3t
	2lXUKv8STiIx/4LmgqgZV+m1M2TLk9tmG5+AO1Dvo7imQIwi4IBKbbIKwGfrvLeKh91wpnKkBm4
	QyK7W/fG1PsrA==
X-Received: by 2002:a05:600c:1907:b0:493:f442:3dd4 with SMTP id 5b1f17b1804b1-496c65d4a28mr81347155e9.39.1785325825029;
        Wed, 29 Jul 2026 04:50:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:24 -0700 (PDT)
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
Subject: [PATCH v5 0/9] Add RZ/G3L USB2.0 host support
Date: Wed, 29 Jul 2026 12:50:08 +0100
Message-ID: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
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
  An Ack/Rb tag from Regulator Maintainer for patch#4.
  Patch #1,#2,#3,#4 - Reset subsystem
  Patch #5,#6,#7 - PHY subsystem
  Patch #8,#9 - Renesas SoC

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

Biju Das (9):
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
 .../regulator/renesas-usb-vbus-regulator.c    |  74 +++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 109 +++++++++++++++---
 7 files changed, 370 insertions(+), 28 deletions(-)

-- 
2.43.0

