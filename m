Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097142980D
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606706; cv=none; b=qJux3jOWumiuKHJKztrqWUm+3dSU7Q39prTRL2O+3awz+lNDtnHLvE/Iju4gn8Hmz7mQj+C/ZVZvkUeLAc61WHTerPqWzXlvggYEr7O6MH0OTjEP0BKQef/TZVgc1ZFKzLvYsaFFmkgCNcH7mDIaFwSgr8OXA3ca7GJ22ywnrHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606706; c=relaxed/simple;
	bh=sKtKuInWWgkpnwOdLL4P+tLnyENjTquK40r7C4btG6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ns3NMDIY18Jo48x2vftGQ4/OnqwO+RtAVcsMCeBTSALe77hSbp4ZIE6KAn8Apoa2kLYf7W0PjFfB8UQGBj/88SyQUAdqwmOStTUWqQwlmO25xEN0nZs+L3VojXeGKE5BpZWw51b45xi3fgyYyZaJ29TFmx1rIdIm2x6v4q/XoA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/Ru7QiU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/Ru7QiU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so28020315e9.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606703; x=1782211503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+W3gkJdUSVWqcMXGqjt/1kOI7XTiovzDDxctkwEQPc=;
        b=i/Ru7QiUzfKr3YVecRZc1fd/7oKYU+TowVY2i1EcwBmTicUWOFluN09vik4kKTzsS3
         fhgIRk0U93iLfRkgxbodCbhdXw9qHdCokWn8TT1sQwdE62jxNrfldjTWzkl26hx/U8iG
         Hfa74vvt88RxV0CDNVbgvwncpPxa3Ziz2/Oj6P2OybOWJQL0HmQ9TR873JbUKsmfRPmH
         OZ+qrHrKCz/6BQzHDGluetj4nBtcLIck2/YxXHV2qUFtZpiwVzxMOCEqW3wUQR/WJRuP
         /aAJOhqUgnQTw1LZUqzD8DBFZ+bihaUBwwEOywSe3r+rOoU1HEHSAGRN3gHTIunN+3zU
         PacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606703; x=1782211503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+W3gkJdUSVWqcMXGqjt/1kOI7XTiovzDDxctkwEQPc=;
        b=anRoKsG3etVYwVskkv8F1kvhS2RE0gbxEapbqjS2uQeLWxQk8gfOLCqrco9Hz2UJqF
         JOexiLyMBdVLWqcl6flAcLjgyxY7NQrR71WKC5pijfqhAs6ZYf0kQSiug2hjfKKFHdGF
         y3CtzGs9xu8+HV5bC2jTVRGV0bJ+FICMnTZYaRgMbnHgKmZX787WcSU0Dtv2pg4vghJc
         2ECNzcZgtbgnpb1bfhCF0s8/cqf1nYWRDhm0jlxK8sI9/LrSwlsgEoPN5VuY13rWfsnw
         T4DMreX9V9Ip915lfVQ7c6pKg9otWon5T3IFMXTETPWuiZHcX1GZAnZbBPL5pdONUHur
         pKZg==
X-Forwarded-Encrypted: i=1; AFNElJ+1I6WQgOIVcBv5XX9wZu/udICwqg0nGdOoNtRqDb2pImGkRkx+EAY7usZDah5Q+s6L8eM9SYG2vqmZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+eEhvXZinFh9E0Jncjxx78PvBzu3JI1QqO0CAoaId8uRMjei4
	2bK3DViqAw0uLB7/5HeN5ODQd/ugHtO+uRVQXdLDrnxsOswGORNIsL9X
X-Gm-Gg: Acq92OGr4NbevlqGkRju43hU3D8KT3p/j/r7AdTLF5LckRYHq3KaDvG2BVAEIz19IZA
	pwTE+uaHZjumFsa8+KCNi+J/oK5cz217JoIHKqjWibjdxOK6+enhxC/KjfCNQRkeItsrEnX6umY
	VLp9Bp2Oj4yZrgLD+GJNm7nt/NehBXnzvf9pda6l6RVIJ1skaqyfv110zxMCCA5t05Z679kEdvi
	/lw2GnD2IAB8AYkomyCAt/lofNzhfhdxB3i6qBzU8RCSGJokJYb+QGUy9R2oc5/NtyKRWOlXg+M
	DMEWvFPXz/tboMrIY81oWl0FPoxxjcUGovup0uucpJODaejp5pjz4gVPOQ8A5VRTQAOAyCXsmdl
	fD1+TtMd2vaPnEDXFieSg+Wr7vjLzMEOAk5tZrZ9Itmff14AB+lQ1Ce7QrGB5z7VM0Mv4oWSIGc
	9mlIjwlifeMAUaPwOhWWKgLBZ4fgrSqGL14qxfMuPvaaruG9Ux
X-Received: by 2002:a05:600c:190b:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-490ec33898fmr239045165e9.0.1781606703064;
        Tue, 16 Jun 2026 03:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:02 -0700 (PDT)
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
Subject: [PATCH v2 00/10] Add RZ/G3L USB2.0 host support
Date: Tue, 16 Jun 2026 11:44:42 +0100
Message-ID: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB PHY
controller. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1.

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
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
  clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
  phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
    disabled VBUS regulator
  arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  49 +++++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 105 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |  15 +++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  53 +++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  44 +++++---
 8 files changed, 312 insertions(+), 25 deletions(-)

-- 
2.43.0

