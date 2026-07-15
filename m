Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E16448D07
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146126; cv=none; b=qaAIkkOYnFbRnnp7bu/RU4HHQQ7h05A5101JprnGXSJk/1ku6BSz5x43ok6SK6Zq37zCJu89eq76FbVs/LYfYg9iOFwG2+o/+j4KudE25AqetCtN/5upYbL50cXBnw8LTa2u8hw6ik6Zfsvg9MX5mIQDo5yhcM8enmmAMojk6WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146126; c=relaxed/simple;
	bh=gkCD81XCRKujgWuJ/o0vlSNXbZjlRz5ZS9uv5DJwxlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2sTINuoKcObr3vHKbuMWGM0p2jfGysI9fch4rsx7Xn9aPVVunz3rPJvvtNdrL3NVLq6smq0B3ZAf4GHFuhKUzBstst7N3tZHeKY3kItVeYDJswp5wa9STH2YL8rlYyMt2sUivhYKTNnXIl5dGXpfZtCyIy3hrb/xdlFyIwdUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUZNL7Tr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUZNL7Tr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47debaa89cfso426986f8f.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784146123; x=1784750923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WB2MJcT25aW4xciwtNpRduuma9Lg4geJEuusUG9ev68=;
        b=qUZNL7TrCI6Ln+WovxRS8aYn5lgE71QT1mbdo9Qp5K9oZVKpJKO6YZGnv1mVf1BkwG
         kpzdB4r8uvu0b4Mn0qWiFAwIQ+COxzif0j7Guvs+hH1qej0eKgSbIx2I3yJ5DzGa2U3m
         O0H+cc89r9YTFOpuAC1k/gF8RUvXbWTAEicFR5gtAKrMU0ndnEqdkwL5e4ZOZdEPou2u
         dcP8aUbknCsdADjfXqoa8N6kRwGMQLAzsxHf2iIO4aDAaNcTtB6z0WzKVVjzgxXIhsYs
         TEjhKUNX5JdiBC55LelefZy+DA7BvZFry/L1yV0Q5fQZPK3QAR9C2bwtraSF6oID1OQ2
         M9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784146123; x=1784750923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WB2MJcT25aW4xciwtNpRduuma9Lg4geJEuusUG9ev68=;
        b=aS6+ajY/IC7B6rdBiHkCxdDW4x/+lfDyehzZcIXzb44TAs8hurJzWB8kWuHPzrm+Yx
         g2uzrJZsYtZa75YyJEFNwz+4dn+KMEGlDdcfDDzxNuJdPLuvza0Qgw2cbyECp9snPDYU
         9U+JGolhcybJpPyWaFems4NCIxhMADaXE2zOGZ2XkpiTCUdQ05okUZclszuGoKtZlu5U
         OT6j9kjbPSoD8eicqh2N0p3z0jNj84U6V9cjRcodRCo9zvxq9qJqYEwqG2aBknpenHsq
         wf7dAO86G3wiHI4Hs5VeIIge02pFsN8+QYnu7chxrzXcc8NeDBwnbokcEprRhXNxHSvv
         ncIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqwu+sj2hB0JRNs8wSlYy3TMAwlzYVzaX/cuu5gqlvQl314SQ4w2427hYbQmdwqaNHzGnS1ASnHLCOp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz97pE3lhnQ3j0wB68yDf5EtSFABrn261Y2rEALEgukEHNBWE5
	/Fkh26dzgaYoADEpfoFhDBLhq2I6bj3hp0OofwL2F8vXL9tYFH2ZlgzQ
X-Gm-Gg: AfdE7ck4UEX0uo2x91/sa36mcwY2Z5NKF0Mfv+kdkF5nFQm0wHc6np5z9qQiyZoy5ee
	JZyAhdGUyvz+XGNVk+Q+VWcCo7Vm20IGpDwfqM66HMLtSrqCE9L8Annekpz+7B0KqXv20KM/htO
	gAnp1mFFVYETTmbvfznpB+OPMjhuaUv8KgUmWcqcEAFyt9OOxMnTe7e/C1RzQfA/kxmNdZacRLw
	IgelpfQgmF79zkry2oDp9qAAQPPHBwVM+ac/mQ2fUYwbk/bZwLdcGdcpVh/3n/Ot2cc5F6TE9tH
	tI5muEasssbGqydiMpjZnr2NzqiFT2uswidnkIrM1BRUDekfxDHAn/NKdmYqwVfjxd7g2BiE01G
	g7SnEL446+5fgEwyh+m62kZsFMDuUn07k2u8plSL14pALUv/gWopeW6klCUCESH0N5FCE9UK7gD
	cF7tHe9Y9fRkdPmYZxXCldQvF+osPgxWwcw7wwfWsGaNP6PzbWxxNOcqvxeMtNmO5cliqqdDp6v
	6qD4NpMr4z5s3x9X3ANww==
X-Received: by 2002:a05:600c:4fd0:b0:493:b246:4a19 with SMTP id 5b1f17b1804b1-493f8855831mr121524865e9.8.1784146122782;
        Wed, 15 Jul 2026 13:08:42 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B883700BD3E109F7898AD30.dsl.pool.telekom.hu. [2001:4c4e:1b88:3700:bd3e:109f:7898:ad30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d21fsm7300625e9.2.2026.07.15.13.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 13:08:42 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 0/2] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 15 Jul 2026 22:08:32 +0200
Message-ID: <20260715200834.8486-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds audio capture support to the Synopsys DesignWare HDMI
RX driver, which currently handles video only. The controller extracts
the audio embedded in the incoming HDMI stream and feeds it to an
on-SoC I2S interface; patch 1 documents #sound-dai-cells in the
binding and patch 2 registers the generic hdmi-codec as a child of the
controller, recovers the audio sample rate from ACR N/CTS and the
measured TMDS character rate, and keeps the local audio reference
clock locked to the source with a periodic FIFO-level worker.

v2 addresses all review feedback on the RFC: Sebastian Reichel's
binding comments (hardware-focused description, documented DAI
indexes, consumer reference in the example) and the S/PDIF DAI
handling, Dmitry Osipenko's platform-device registration comment, the
Sashiko AI review findings on the driver's error and teardown paths,
and the Media CI sparse warnings. Per-patch changelogs are below each
patch.

Re-validated on an Orange Pi 5 Plus (RK3588, i2s7_8ch as the capture
DAI): stable capture at 44.1 kHz and 48 kHz, sample rate switching,
repeated capture start/stop cycles, and abrupt client termination
without worker leaks.

Igor Paunovic (2):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support

 .../bindings/media/snps,dw-hdmi-rx.yaml       |   9 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 280 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 3 files changed, 297 insertions(+)

-- 
2.53.0

