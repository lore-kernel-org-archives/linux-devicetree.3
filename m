Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD91C3148DD
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143778; cv=none; b=t20R0x4TPsVqAhcQbV4NUIv6rQsAg4e9H4/P1ww3CBARnD9FL1TGv/fw70IiQcl28+x790PLzAQcHxt2LYc0WJPbS/qg3MIwncH4FLATwv5jvsXvhISNmA0B+UpYZhEBB2voW15Ap7CAJg64QZ7mYuMaTRuUA3X/3x8pJGPuqZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143778; c=relaxed/simple;
	bh=sP3DTqWhImdGCeIzHLq89T2njIMNXSi4QCKR90SAFW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VhrTbBFOSd2Zcono8V5SJRUilhuwJF2rqIHugk9K48Ms5cqCRVV3JqDYuOu2GiR8sK7r/wvnF/jgvB80wQu3Bg4Enw4Gjm/PAAtuE3jl60JFm/f5fLq8MkiedM1DoX04aHfh1huw2nQPbg+DsnPhPrMV4uJyCu7axmm8zvFY0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+pVebQH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+pVebQH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so37457075e9.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143775; x=1782748575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cK1dU3jvwLWVY/k3Aa4QkwFEo+fnh0XN5XALhyjrfS4=;
        b=P+pVebQHtSH3OcO+M9c9ctohSipa1dWcpbP4iy/mh/TxhMLqUM1AEc8EvVTiBt1Yag
         PDwQInUUtwICf1StG2cTSjgsjx6rhx4R96Z7rXLaC/uH4ytCZjSmFp4jTKY1ixyRIUOA
         7ztOt5ItBN/H4jBJMEocfQcg//lbM5mNwxj/owUZnkpsHqWw1akzj36N00t10wOfQK4b
         CN2oyuB4Bn4A6UmaYfR9jI3O0NciGD0nDTd4lggqeh4s9QP8zir0iW+5jXlKawud4e8c
         wFRs4+WJG3x83mhIrEdBurCS0T++aO7Jvk06W7N4Kbp1VqghOt0iG4Iu+sdlLE3hl6sQ
         mX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143775; x=1782748575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cK1dU3jvwLWVY/k3Aa4QkwFEo+fnh0XN5XALhyjrfS4=;
        b=JPnVknhIfyLeVx45ECvqpjlu7QZF5HQ3EWKphXZxHsMq+rfe+tMQKJQmbJ+vYPkWIb
         akpnGNYmPDlAWvoswmPhOnJoCKKiQ5xKKP23ysLNrhMab3QkucSmf6VTVwnA/alfjaBn
         VZN3Tw7/7EgU4UJfCxez7s2xnuQE/yHfBdt5YoRrsIKZhoib60W0q+NTmpYs1rO9EN66
         WgAItK6Tu0Z9WvDFLPVgNxAKBlDKFWPaQiYZeZtvOyhKkFtPkDN18gKcMOFLBN1vEMBu
         xNxUQB450wvWVnosIexThjcmabnW7t/LkMCUgoLvSSnF3IeUARo4BawEmF6uSNDzCiO9
         +y3g==
X-Forwarded-Encrypted: i=1; AFNElJ/T+QMoNycrwL6lHdFC5vo/QkQ2Hl80Q2bbZekf8rUtpkcLtqCC01pwFmdSNtZBBO4k6duqsNu0VFgm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi6nVMtChctUi6KhpPf+QICqIe6hFfsWglnd2MnGT2enrlxs+y
	QyIDAKbsD/Cmp71tOE/7GJBGoH+vQfmH+etnkp8zqhZPxeoBbWAB2ivm
X-Gm-Gg: AfdE7ck4++VGUfViYwUoxlDUto83Mq6d7G9bbUsoBF3j9fMNxiWSC+2TfZ9RJa+F+5K
	gqQH/zkj89TKif+HDzLExx4ZoDlhIjJii2Ong9m3SwC9T878DCRdUHeM3IWp79fXG3a/FFiCE8+
	LYBrtHsJ12cKvewr/IJW6e2Oraapj+up9yVYh37v9sNQxOuYIkzeF5e2BPT9tFyg6WhKVfoDbZb
	iy5yMmtI6sivDPOvDJC07OEb7UhfB0tp5Xh6oKDci9TXs+qSs4DVcS7aeCNXJbJe7XTL8wgWgek
	hMsPChUXNLmEQ4wIthzDYaBHyfuEDclRK8bwFBAq4LAGAsdB/Ouxc7eauBRCKQTrvwPCCsJF3xb
	TQoUBCnmG3l24eUT6MLMzVEqrOkvTCEhGZQoopimhDZbmBWxj/lSCBiAHGD30CchKpFZh+2zSV+
	insIS67POeKhHle/LPgEa9UKuGeNEVfcLqOk1oBg==
X-Received: by 2002:a05:600c:3f12:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-4924257194emr149666245e9.19.1782143775174;
        Mon, 22 Jun 2026 08:56:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v18 00/12] Add Renesas RZ/G3L SD/eMMC support
Date: Mon, 22 Jun 2026 16:55:51 +0100
Message-ID: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SoC has:

Channel 0 supports SD and eMMC (including HS400/HS400ES).
Channel 1 supports SD and eMMC (except for HS400).
Channel 2 supports SD.

The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
not support IOVS and PWEN in the SDHI register (no internal regulator),
unlike SD1 and SD2. It has an internal divider for all modes except HS400.
It also has a 2048-bit divider compared to 512 on others. Moreover
RZ/G3L supports HS400 enhanced strobe mode.

v17->v18:
 * Collected tag
 * Merged patch #4 and #5 and updated commit description
 * Annotated the empty sentinel entries in the OF match tables with a
   "Sentinel." comment for clarity.
 * Retained the tag as it is a trivial cleanup.
 * New patches drop struct renesas_sdhi_hw_info, instead using
   renesas_sdhi_of_data and tmio_mmc_data.
 * Dropped clk, pinctrl, SoC, and board dtsi from this patch series;
   will send later.
v1->v17:
 * Collected tag for binding patch.
 * Resending the series as there is an issue with patch threading from
   patch #14.

Biju Das (12):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
  mmc: renesas_sdhi: Fix whitespace alignment in struct
    renesas_sdhi_of_data
  mmc: renesas_sdhi: Add clk_mask field to support SoC-specific clock
    divider widths
  mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock
    divider ranges
  mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
  mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
  mmc: renesas_sdhi: Add optional axis/axim reset controls
  mmc: renesas_sdhi: Add RZ/G3L SDHI support
  mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
  mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
  mmc: renesas_sdhi: Add RZ/G3L HS400 support
  mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 ++++++--
 drivers/mmc/host/renesas_sdhi.h               |  12 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 239 ++++++++++++++----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  73 +++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  12 +-
 include/linux/platform_data/tmio.h            |  18 ++
 6 files changed, 370 insertions(+), 85 deletions(-)

-- 
2.43.0

