Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12737401A06
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736952; cv=none; b=OSk/1tcZ26KABUl3P0ONr9fCjdpyzy06YBMCHm6M/ghBpEpTp40/KYQbl0WsP1ZSP5OtxOZqQJzxn7NGpQiJaOkxyMepv0ZL47rkBdnWOjBafncfDCK3jTXYCs7h6rWd3Rhovk0s9xftqeXPny9OUDiZJiSlbatRX3keSDND5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736952; c=relaxed/simple;
	bh=Jpxu3JhIRQUn0r/J9h/BIiZQMvK4hOfLEjUDM7I8VOM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F5kazBTIjzpbIQZOydIy8pMNUnZuWlNpMdRi4WabxQ098gr2EKAa6ZvErtLzF0O31ANcn6QWKn6jeGegoRGDUysYxsViJ7+8eLPJAaK78m/YQfISeMieaI8hKc3bE3t/ihlwXkp3WatscboekvcXAgWqaqELh2SkCbxgEYXszjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=G/3cVPky; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="G/3cVPky"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so27198695e9.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736948; x=1783341748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=;
        b=G/3cVPkyWAKic6W6iUWDAxwyTWSnVSxcsLDtj1wbmJRP2N2OE1KYFsRBmKVv/ae37M
         TQI591kLpEwVSb8n9ezKEsdLZiQ4AKwyenBHMNar21P2WGHtEE5CbLoecsPb4x7yQPP0
         CsTVCdhYJ0GAjpw6hEWgCIKfgfP1+EG34dnjH4Uhen9xTfU3rqGHGpFajNoTrPPtCJy0
         iy3PkTMUEqI3JpZsrYUvSCYQY2YAzUJ+dzBfH5WEYeKcSAynAhEcEioeq5vlt/Asat2K
         R5f7Ukm2OUIcjjDzIg9xWFhzZ6Fmz/uBn2WuE2r4ALlOK+WJVbbkaFIVIm393hPSTeTz
         XofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736948; x=1783341748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=;
        b=kLTOD1SMQUGx75FOvULyjYdU9B28nb9BqcmRKG6uuul5yaajfkY5p0S/R1eDofmrgN
         pX+mYPW42zSgh5EMuT08nlTxd04OcSFBj0cjQmQZSw4PoSop7QMJNQ8Uu3I761sOg8DR
         XtxaWDrxkdvv+BqLdV7zAR7+t84RVsPPc1KqsYGuOf+ppC4D8kT4kMn6bKTu7iYCf0+x
         jzg+DpY5+z5MSSKWumF7Ur/hk0caknveZ6FwG7WtGouFtf+xwmSmlSwZREnirltsYE5e
         3AJAJ2j6y2DigMlIlxsxf/AtAtxZwuyqcO5tAEhQSK40xNhp9T2yJ2AvKtd/KKStbLTq
         0dGw==
X-Forwarded-Encrypted: i=1; AFNElJ+oQBAdZZmc0mhnLaxVsJUuz/h/FKoNkpGct5/KYx0pDVTB8QZP0TtYkHwGY/qzuPNFG7j0YvIIuY3u@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ewBKQXwDyNutQexb4iINDD095x9SIhuxd8fA2TgpbPSWkV+2
	aFWGkoLU2pNabbDOW8SCYlr7JaR+Mtk2eKIOSz1T79D8RFPtHmM1ttIwy3oZxKFARETOTI41WZN
	8za9A
X-Gm-Gg: AfdE7clyupKtfro4WINgYkUaXom2u6ZAI2RBMvACqzaiVeSvAUNg++2i6tMaJxn+Hyk
	EDtJSQuLySCjwBDxcA0NzIRBqK85oyo3ynx1HxWKfTs9da4CiRI+BBh9poVaYYWtE/JZDhWpQfQ
	yyC5SdE67/kN2kvAbv8itlOIMbObiaQ266p6QKMgTr/jJbzRpLUlHLlgP5yBa9VOotIl9Tmd9oR
	FEQyKZ3bRjwrXzyj0NtVxp4/8uaKCASvVMFTGWJF3QoDDQ9osi6glo9KPb4nFdFk0HOXLMM6QdM
	DIZ9Q4FlSRmW1OP5wWfXoG4qPNKCExliLH0h+jDOcj2SiJnr6YHsGiSP7jTkjmKUtivNroBBga2
	ZXr4SiJDmnx7AFZ/ZLLx16uRdEisstyrUCX2q9apMGpe9G6JK7KYIrG59aFTKkEvwPDehK4aX/d
	iH/J0EySSXu2Y=
X-Received: by 2002:a05:600c:5298:b0:493:8391:919a with SMTP id 5b1f17b1804b1-493b71ad007mr9854285e9.16.1782736948492;
        Mon, 29 Jun 2026 05:42:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926f94f213sm276368785e9.12.2026.06.29.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Mon, 29 Jun 2026 14:42:04 +0200
Message-Id: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1oQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3URzY2PdopJk3WRTQzPzlDRDk1SzVCWg8oKi1LTMCrBR0bG1tQB
 8LVc/WgAAAA==
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Jpxu3JhIRQUn0r/J9h/BIiZQMvK4hOfLEjUDM7I8VOM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgsLZoWjG/cvgZlCtaTSQlyh40bTtBK3tPuD
 /vjZphmkpCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLAAKCRDm/A8cN/La
 helPEACuIP0X9qjYFDqGAzbzDm7fgzSYec6JBjtuY8SIhaIYa+FNc9lGF1OgsEkoQzgfbdkOP7L
 zI+/prvEt2N7oqAaLUTLfEW6LGKu+bcrYgmFudS/f6O5MqMTUYzHm9/j36vQLvhydzF4f9Y1Pne
 mZZ8IoXTrAkhvwsa4JQhR0k2qI1wLA0yHyJY32k50Pfqvvr5UG8GDsWkCfLQABKIboBiolOpxQ8
 KTDpRZH/G145BUKyyagMGkeVJjIqHPGI97EieDJVkl4ozgdKCGPUbW9jKEkBbO8UXq5odYObgpx
 +g4ZNaU81kT23qb/G1MLK8wPSFSEVO3qP/JGIIrGMzbKcUrYISZHERVQmdnwuGDWetI0M9CdX2z
 g4Ls5cXglJRTatUUltpxUvfiJBP8UZiX/tPpfCsS1fXIWRRg2rsz3wHgegXmlO4YSkulE/8AgmT
 8jg8MIJ4I1EZj7OD7ZeVRrwCwpmEAC9ZanJpYpN7k4rgtjOcLgE5ns3gtuH2nKdi9s4LNzIPUqX
 FKIm/DC8C2DUEP7bUd+6P9M44r4sf31b/c61qZ3Tu+wqxYNjrCvJIdR6zl8bOuC1JRfKoyIHlwY
 YSpRwTACAPjGg8h7icf7N/6/xOe+3B4gBFtqLpqloNeIvlYEN6wkpek8vLlxSHunLzuaLec6hv5
 yTkIJm/l07vOsMA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (5):
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |   1 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 124 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  11 ++
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 7 files changed, 109 insertions(+), 36 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome

