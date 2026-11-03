Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672534;
	b=r804ZQtGFMTbVxn3sIrGYXaSQwVTfiWA92d49PBTtyFtZqT1rHGGGSFJx26htyW2lEWZ
	 QIW9q8fr9tNPQ1Yx0L5EHxXV1C9Jtc69C22DwYWbmQTxR2aQQtQpHnneBVzudDyO9gAaz
	 YfuvZBcSqK/4uhMaQp52JxTn+C1KqnfvpjnRwAiKQSQHmo1zE3hDO7JaiFqu34bLgqP09
	 Jw7G+zr6i0jW9hr4H82eZ87W7INYIqC8RLiWR6gJI/AeAInuQSVEQKB9yr/WVyonEAakU
	 uZg3v/RujVpJZoVhqqs1aygeZO4rlm60JfviwFWdJE5ELRwm8NXx0W3Bg8s4xszR4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
	b=sqVG/jid4N/DzhPXrhdgm+oAdgOQP/Dyf5kco6LLZpqqYQ3EO2ht7M6dJ5LFoBNPhN+U
	 cUpXrasJ3JLEjcC/FUq0uPxMat9oTJg1NJZk+sIE7fDM3oto/0/74s7tKle0w7ktIRwxb
	 wfHbI3ABJwH24Esmmjc0KvbifVyDXXCiaXEL+qsPX6QUtUtpDQGnNjwvNYmm5hvdBYtHi
	 7Zmi7hxbfSCI19E7Bw+YW+ZCy9ljCsCmDR68UbfIatvxUsaNJ4VKdbfwUBuCaAnIfs7Ih
	 kxy3eb3Wc+S3y6SzfOrz17Fomg380Nln+a4FyUsXUJZYAxX7ZjRLy1bAnBjuclWBfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcvJJlQH;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F16B606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 02:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F16B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcvJJlQH
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e987b4a710so1130725ad.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 18:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672534; x=1794277334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
        b=pcvJJlQHlGOF0cpRM0UZePAnDC0vqeuBRizCxvexJ7QOLkN8zL3s4Cjs3WJ/t5DCBc
         d3lY9QkXohvzSDMe3oJ+hXgdx8im/eKScekNjdD5xWcpzme7sOuLYx170dlJIMYZlszQ
         YPdulHvcX71xyKzwLy00njaxlw1cMOFw8ZeSm+ZVYAdo6Ubhj9QafHmSlaGYXtsJpi2W
         902Ac+nkX/bTmhzQd4fdw5AVucBp3I6xec0Zok7FolDgMaPxy6bDM+qClB4y1BTAm5cU
         lSPpWGTzBUxCl1zoIyC8IwHL59W2TLZTBU/801Ml6a5Zxl0hbtaPi+Hb4VZ3RjnC/o6k
         ytOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672534; x=1794277334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
        b=MCzxKoP/cqK4ywwBrjI8lN3uMJT5CGKDel1QogfK7PKBXu76F+bB77//czPnAKARNL
         iyW+km07eFnEwtO4LR8FVx1mOrqYlB9x+xG8OOmKwgpgv/21k2Am33kPSaaM7TnjgyD3
         PB657Wch1oxR2RrxpiEuEdo/H6BJjL1an1yAsL7Jsf3R6I2uIFuZaW1LbrVSE7AqkiSZ
         xstyvcx81Zn2FwLB4aR+uOKIv302iZ2xb26/XqdFo1DyllPtJE8G9UcuTn4jqTApXa+i
         4WG151hLnId8kzq2/uARXXPRy8VtGsgPKnX7Oox9fOa+AePVDvCaYBdXUom3w7lOHvnP
         VVQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxrHGwQS/wDW31FFsy1m8vbThnEpSUyGyr1eHAi+1ZXgaI352HHhnS4mYa6ZdPMx6d0jamEA8SZyi5@vger.kernel.org
X-Gm-Message-State: APuU4Z/32vu90AmG5A1/7rVfy33KPHwVuFz7qXHncgDENBs4Iw/dlbYa
	9ZT4SfA1AGGUS5AzEU9nq9JKbhIGz6/xondLAGhLmagggkKNgwxSFHEl
X-Gm-Gg: AYBFou1lpmiPnQ87iKMeAboswUgQrU7zJPg9VDeOU8FLLd2RT92ziOpPFwdeHAZiiKr
	MBoYnCb//LXR0bikQkiHnYQD5LUkCuJV8PxwiPX+dyqSP38izICiUkskZqPpsjnUWFKJfGxKG/O
	u+QRW0i92QcG2rTut6GGAAZqx62gYr+9FE8LNy73tlMp9ZBXyOkHKoNSwrkYFqMH9f/ZZ9+RhSk
	1hwUoTBy/A3AhgaPo8xOvXTmR6L6L3JgMp5IeFBctWLsY1UcVKF1dn+HflBJfECUqQ8OTyoSSNr
	AXDHGz0mWKuuv1n/NiGHGFMtQqL6eQ7nNCuUUSF8lgwomTDE8T2Da25BQ5sTd7y63k7KnCkhDwq
	9HNdjWRl6CJwC/TUEdZfxZwQMJTlLPQ3a2w7JadtyMw8OtUd8W0do8TcArxqUXIYP6a8XqLCyTo
	ZAY87TNkDtYLHyU8wzm2VDyJJNstj/v0iJKQdTOMcZSDKT9PfF9wu7a5aVfnny7ynJAnN7A6PgK
	UhAl8RxFh0ddMI7ZQLIXZbDkKtxhzG7jfNnn8zYaP5IYmi8sfJz9Va11OlNtKi2OriXSWLebVAW
	B0JoPWE8L0fZj5aqxEtIkdcVQe9njyqCpoptaoiWrwzaMbgjysRDZ1rcdvWrhCHSFV6+P6b5N3M
	fC2tQNs+a7fGJ/Jg=
X-Received: by 2002:a17:90b:55ce:b0:3ae:3f20:7058 with SMTP id 98e67ed59e1d1-3ae897bafd5mr6113235a91.36.1793672533832;
        Mon, 02 Nov 2026 18:22:13 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm1570124a91.5.2026.11.02.18.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:22:13 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Tue,  3 Nov 2026 10:22:00 +0800
Message-Id: <20261103022202.2139674-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memcpy, slave scatter-gather and cyclic transfers,
and a per-channel timeout configured through
dma_slave_config.peripheral_config. The timeout is needed by the
MA35D1 UART driver, to be submitted separately.

Tested on the MA35D1 SOM board with Linux v7.4-rc1, using local
(not yet submitted) QSPI and UART patches that use this PDMA driver.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 780 ++++++++++++++++++
 include/dt-bindings/dma/ma35d1-pdma.h         | 113 +++
 include/linux/dma/ma35d1-pdma.h               |  24 +
 6 files changed, 1002 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c
 create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h
 create mode 100644 include/linux/dma/ma35d1-pdma.h

--
2.25.1

