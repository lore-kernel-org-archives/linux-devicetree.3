Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567066;
	b=MC43mG4PQdQlGOf3PmqKiVGuifF3RBdAXd3nHl1iUkPqKPz110UWbwKN14YEZTzL8dsN
	 lUvWp1NQ/Z58wYvfTtnEeGvNxtIexUvWVuwM6Kmv+9l5jC8SFslUtQKHszUod6u2C+vM6
	 GYY7IFFF75fRs0v1dnAhcAfgdmtcQHinU7qN4ZSqNbvfA5ExGm/lewaLMb3m6wmSW7CZe
	 fB1P/zjl8asrETJHwWlNA7/84g6mw+MoCPplCprdnP5nsU9OdeSknTD9JGzi4OGCIQ6Nv
	 QRXq2VIRPtN4L/KkVjOm1U0wdKKPtgxqCQiBzNTUcVoVDp/cAbuQMgsh8GHUCFF7whQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567066;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=PM96lafS/rwv826v2LZCH6guF3z+x32g3ULBEqHU5jk=;
	b=iW755FO5CHxHfuY0wuykiigtG8eRPcZC10ovZFH6zb4Ix8OoieeDR4XkwTquh+lshcD4
	 OUJbtvL10jiXTA4ngh3DoMUL7yMXVqmSmgs2hfVZ4+Gh7/Pb8gbicG0KorciWKcIOsvwg
	 Et+qY0hiK9fRiiVRjKOCt+DGZYxvyDFrg6dLTJUSAHYGYIMyuOpll6FefvXChassLkV7z
	 ep4OtrnvMuJDgdrtEX6SWYhLq/h93467l4pnkjcWQX/NwawYLDuzqCx9VBFKIf1XxfQ5p
	 5d2T3c7bKCEMTOvejgFHY8kRJks0a13VbNgQRVtEgqw5Uj0wvtpwjM8SRQllPIyq2hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YO3uMZ1L;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E17606A894
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E17606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YO3uMZ1L
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261113105102epoutp0310a7674c156b1610205abcc6978f6d7e~nlTwiJORA0190701907epoutp03N
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:51:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261113105102epoutp0310a7674c156b1610205abcc6978f6d7e~nlTwiJORA0190701907epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567062;
	bh=PM96lafS/rwv826v2LZCH6guF3z+x32g3ULBEqHU5jk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=YO3uMZ1LKk3HCzxl7OnAt/8z/BO8/f2rg9Jt8hOFV2XVXnVmp4r2s6E/PAd0mu9+h
	 r7KBVHYg2SMPx6FI+E/rDrXjPrmhOXbePwEynWxlhz9hvD90avkZZxPnHUGy5z2ipR
	 6I6f29rfTQ+0xnCg7mwoLvYESfqCoAUHialrK6NQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261113105101epcas5p100e5c266cd26e579976a9f322a776c23~nlTv160Ni1299812998epcas5p1G;
	Fri, 13 Nov 2026 10:51:01 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jQvF04Fmrz3hhT4; Fri, 13 Nov
	2026 10:51:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104829epcas5p13695795bc337b89816b05eec610a0dba~nlRiak2-X0455004550epcas5p1i;
	Fri, 13 Nov 2026 10:48:29 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104826epsmtip2c360208ef38f5550884792f7a48e171a~nlRgCU2-52451424514epsmtip2-;
	Fri, 13 Nov 2026 10:48:26 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
Date: Fri, 13 Nov 2026 16:35:58 +0530
Message-Id: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104829epcas5p13695795bc337b89816b05eec610a0dba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104829epcas5p13695795bc337b89816b05eec610a0dba
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>

This patch series adds clock support for below blocks
found in Exynos8855 SoC
TOP & PERIC
PERIS
HSI
USB
There are many other blocks, for which the support will be
added in a forthcoming patch series.
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Chanegs in v3:
 - Addressed Sashiko review comments
 - Collected Reviewed-by tags
 - In patch#2, added samsung,sysreg property to the binding,
   somehow this was not cought by dt_binding_check
   Have kept reviewed-by of Krzysztof on this patch  
Changes in v2:
- Removed name duplicates login, as pointed by Krzysztof Kozlowski
-Corrected the sequence of binding, driver and DT entries
- Removed <linux/mod_devicetable.h>, as pointed by Uwe
- Added all the TOP clocks in single patch
- Organised the patches in the order: dt-bindings → clk-driver → dtsi
- Added Automatic Clock Gating, as suggested by Peter Griffin
-Since we are adding ACG, we need to add SYSREG, hence, added that
- Followed the name mangling strategy as mentioned in clk-gs101

Link to v2: https://lore.kernel.org/all/20261009120137.2801911-1-raghav.s@samsung.com/
Link to v1: https://lore.kernel.org/all/20260728121111.2077860-1-raghav.s@samsung.com/

Alim Akhtar (2):
  dt-bindings: soc: samsung: Exynos8855 SYSREG compatibles
  clk: samsung: clk-pll: Add support for pll_4313

Raghav Sharma (12):
  dt-bindings: clock: exynos8855: add top & peric clock definitions
  dt-bindings: clock: exynos8855: add peris clock definitions
  dt-bindings: clock: exynos8855: add hsi clock definitions
  dt-bindings: clock: exynos8855: add usb clock definitions
  clk: samsung: exynos8855: add block top and peric clock support
  clk: samsung: exynos8855: add block peris clock support
  clk: samsung: exynos8855: add block hsi clock support
  clk: samsung: exynos8855: add block usb clock support
  arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
  arm64: dts: exynos8855: add cmu_peris clock DT nodes
  arm64: dts: exynos8855: add cmu_hsi clock DT nodes
  arm64: dts: exynos8855: add cmu_usb clock DT nodes

 .../clock/samsung,exynos8855-clock.yaml       |  196 +++
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    8 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    |   95 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8855.c          | 1378 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   11 +-
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../dt-bindings/clock/samsung,exynos8855.h    |  233 +++
 8 files changed, 1922 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8855.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h


base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
-- 
2.34.1

