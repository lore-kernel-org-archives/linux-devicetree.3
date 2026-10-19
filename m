Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D287343885
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378895; cv=none; b=MCjBgK2QQm/722y9zxKsHlVapJ3et+01QEBYqgGefS1d6LwJ06SJBPkemj7LwYusK2S/z2TUxO4v+l26Rq9oCcOi1VbqNBUHYGkYGiOpA8QIr8UknO3KRBKaERaQPg3+zT1yUkypYMjq+oH5ASYDO4y8q2M29aF2rOT9KGpNesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378895; c=relaxed/simple;
	bh=FrNTlR4U8Qa0xBE+AtEzlNDQeO1NfeIDzp16ScHs28s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PbdVRgN76PrOSYn2S1Adp6hjup4gW46gIFGR2MimwSq0gSM4BrhdarREs7DxibPSl25cQ6f14Y+0BRVRMzb2Csm5luDiSCqznB1h1ghFPP7xgT/v3ksIL+zpgaSRi66HRAect54pv1uSpb2aK2G0WvT+0kR0VPKtDD+xg3d31aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ZXjY2OdS; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ZXjY2OdS"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e63ee7b4cso198871585a.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 20:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378893; x=1792983693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLqDvu5I7JlAwNybBnp+q/NWLExf0+AtI016xe/bA7I=;
        b=ZXjY2OdSkA9EE8eAiNXmnnrB6RZ9LQOK2UmXZCt0uCAQsgFDaXOQhUm6hfrAbhAynq
         wdmPr48wcIU3gvyyKxp+AwnBD0BAKyHY8hPqduvDMBATHUV4rnxH1I/HRQau8WdGjeuW
         DDia2P/cYdWAEk2w2isYnsjbNh3S2qU1LRZkswwGsIN0IiAwr0J5zJoYscftRdOwc3ql
         EbVsJdwBaHWV7rDY4OSpANiKefkmDBveGPZKKZ0z0lX96DtVvYLNctvtnk6II4K4LvZT
         zoxsEGT9GT8imFn9cntiZ/SWd5XTzKPCmIftHq8TRlq3kqtcyi9MNzbTIyF+pPi2xtqi
         bCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378893; x=1792983693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLqDvu5I7JlAwNybBnp+q/NWLExf0+AtI016xe/bA7I=;
        b=d+D0571uEAQ1g43TTS7HHXjItvmnDhxGFd5b0YkkSt+lQTNXEeYHlX1+GP1uilBq4U
         R71pNyJVNf5v+lNtyMFEsj0pTH3Vez7aSY/teLEavTNhmCAJaEXszFwqX85WvDnoepHm
         qAhyLJP9pVrTQCUPJW/wMZazy+1PDz7Qp693MQVU1AaxfzJTkJRqMP3bSLj1BtTB7adH
         9ByJnTuesyY38SKI0NOncC19M5Iwc+jc5LDoJi0L6tN7G7PU7RUDy5FKp5ELnBv+XoEu
         i9qGUkVxuYVDQBasu3gy7kXtDlVfCkAcmEZ7alBekTrJDtb7ufck1bRW1ZAPZkH+XUHJ
         fsiA==
X-Forwarded-Encrypted: i=1; AKwUvBwLJKwGD3OzAf0gbh7FuCbSw8Cx7K1T04kI09bWswpqJkh8jhnzWL1rdrDb1P4Nc2EirjNgiyBJ73Eq@vger.kernel.org
X-Gm-Message-State: AFq9FYI9IP864E5+T7+2zC9nHRt33iIcv/rlW4PGlh8+xRa+nkImHmYo
	Rvm5JZGbEQJ041NoozBreMxq4UZ3ONdCzBIR67b4j6ocNqC9Nlgv5phbzte6cnZ4y9M=
X-Gm-Gg: AYBFou2XNk5U138ynnGklkujNOlIiKh2eDk2cgq7NAD0UMTzpUeConqwvnU0m1wcher
	VsXveP7g2dseu4y//Fd4tLFNFRTJl7l0+vP7rdkzrxQS5tJUHXE9RyBNaR35+ER//phmwNElMs5
	MiuYz5VPrG+rQwqYC3QjiW4hu4PcXENP1RIFBemp97TgwBtzQgPHkO1kjVuJz8ee5uDAK8xHIsw
	dubYAly477HcSoKLduoLELSA23croscoxfuDjtCNzYYHiYulActsZt4M37jXNpG1tiYVTk2SbNc
	3Mz/TxmyfmbM1txU3rtngp/rQm5hMHXv+V3WYMbEDwDhQY3r5CUBGa4WK9PlCL2eTuyPBZxdXi+
	rzCtx+M9TG5+DqR+Q1J4AKWmjnACv7ExYpTdybiN4eZNHAbCjsuNSLCwmwANaKEwLJjegq5AgH2
	e6QDLew21NiGkF8jdEePIs+WItD6FT+U+IK5P+98Kof9SgVpckJT4Qw/+J0PFLGtUEgQFXEfS1C
	W0=
X-Received: by 2002:a05:620a:25d4:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f29e0edf8mr1056254885a.80.1792378893364;
        Sun, 18 Oct 2026 20:01:33 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	daniel@riscstar.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/5] net: stmmac: enable Toshiba TC9564
Date: Sun, 18 Oct 2026 22:01:23 -0500
Message-ID: <20261019030129.1470307-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the two XGMAC interfaces present in the Toshiba
TC9564 SoC.

The TC9564 SoC connects to a host using the upstream interface of
the PCIe switch it implements.  The PCIe switch has three downstream
ports; two are exposed externally, and one implements an embedded
PCIe endpoint.  That endpoint has two functions, and each of those
has a 10 Gbps capable DesignWare XGMAC interface.

This support was originally submitted earlier this year using a
PCI driver within the stmmac source directory.  This version
instead implements a platform driver, "dwmac-tc9564.c".

					-Alex

Alex Elder (1):
  dt-bindings: net: add support for Toshiba TC9564

Daniel Thompson (4):
  net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via
    regmap
  net: stmmac: dwxgmac2: Add XGMAC 3.01a support
  net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
  net: stmmac: support the TC9564 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |  26 +-
 .../bindings/net/toshiba,tc9564-xgmac.yaml    | 327 ++++++++++
 MAINTAINERS                                   |  10 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-tc9564.c    | 590 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  10 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  70 ++-
 drivers/net/pcs/Makefile                      |   3 +-
 drivers/net/pcs/pcs-xpcs-regmap.c             | 169 +++++
 include/linux/pcs/pcs-xpcs-regmap.h           |  13 +
 13 files changed, 1214 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc9564.c
 create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
 create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h


base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.53.0

