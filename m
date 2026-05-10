Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF6A25A2A4
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778444213; cv=none; b=i7cUborHFbvIDNS3A8lRziiOwRux/kSW7dRnJti3tgLdS5zmxT62ucl+YwHRtA5pQTlswJf15PZqUqJ1MowNhOmIKoe5CrXeaElWBt6xsp++ojJuvFygYrke79KQFqakUgeZFHImYHIHXDifA5lbdCDC2/5H3MiJfTu4GFZYY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778444213; c=relaxed/simple;
	bh=OlrvUpfZIqKGu1fy1Yd1seg+mcVBashr1N60V4HpbQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DycZMbSOkB3hSwkzh2CJkmpa5L0YrSbUYHRSLLneQnX2O1u5UEalvTB3LBPC5v94/Jv/VKoJ6usyGwL4S4GS7QZqhWoT/sxq9+r/fXSQRF20NJ3NkjADCMprjFJFEu53nIKxGkxcYid5oUQdKh5PgTnMytEsEBH9KbaJOshjYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLM8ka6D; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLM8ka6D"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0046078so29721965e9.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 13:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444209; x=1779049009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NI3fN7QsJncCNnXfLt8QQqn69GGnzb/da19UX/jwp8=;
        b=cLM8ka6DbhYxzzUW6/H7sNpTu76WHQbVlZMfQFg2gLnNCYZzPJUbXVFMclpmScK8f3
         Yfamffr0YNr5IIdg6Bs/UAOA2j3/ZdT/4ZUm5oFl8qhZZ7LI52vYsoP5g6tOy7rqPG2m
         XCunp8xqhOZOT0rTWLeeSUplWowRQpHjmGOXH4kg3Wodt4xjcSo3cV8jmxoeaxnIYbCZ
         eZ2SLstIOMMrdA/PpemTVm5xSd98BoMbgvo8lRm8wxbHm8oyRH1YGxI26KNIArtbaHn/
         Y+qjm7ywqAEV7QQAQYUhMq0VtWLWr1/J7aH5UVmP/ufd/3IijE1gL8D2sFBEyk6Z5iad
         hI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444209; x=1779049009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NI3fN7QsJncCNnXfLt8QQqn69GGnzb/da19UX/jwp8=;
        b=jI4kjy+wqixDTq60cqsv+Lx2kLlxY+/9O/nqLYgFq5Y/mq8aTs16yx7numZuR0ReYL
         cQolYfN8huTnA8dJOxTlKw9V9l5QWpKmaynN8tCvM87UV6yYRwlz3ibV6QQHlE6g1g9Y
         pXLYv2DXJ9PmezWR+GM6GFSc1R4h8hocicqizQ6fNudE0xKsH3Xlwt1ZEn3QOCxwpj/K
         ttNHQxAQ5qAWlCTUTzCaC69d54r0w3KNErXjQMzryLS2nctLf9iiMbUY9EiskBm2SYfd
         nQkqsHAol5lSED+h2pmm5rEbgxn1+FawP6h6DvRw4dgXPkY7mgdefnd+/a0n/UWbLyBL
         dH9g==
X-Forwarded-Encrypted: i=1; AFNElJ9dZYYMZYgdRrqMtDiLUbdJ8D5sf0Yz0yUBU+DBOfDi9bXRHJSNeWrOrEokKGnFutfKOvKdaylRq9Nk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tvd3uMhj7Wx++UzNs//xohiEwNSpY/oGBWmpHqOytiOjMzQY
	zC7rVXcq23XBq9bErcdACpFWYeEmDS8cUpwUy2l0SXEtH/dcT9SK3sUH
X-Gm-Gg: Acq92OFKaNpBrSeVCa7JcyWURlNXqlsz00Z9UxeH3zRLcVoz2G+x5Y9bIp4xEAGnimn
	W6iecRtk/CliCXa8qytp+gL/ep6wDg1acnPBQiLxVFUnG3HhQ7y2fTPvx47e5Q24cN/4qLZL1Xd
	dsXrBI6l82pHwvAylP0EW8gg5Aqsl/5GwbeCiUbgFSWWBrvkuvxaA4jmpHjhC7YEryYXOHTQ7nq
	nbX9NXCV/AODTageOUQMNDbnRpGsvqaBxrJkVk5Sqh+Fq8zymWCtgM27byoNDa6sbz80M5OZsw5
	YJlvN5zINXClqiIr7n6K9xjKcYaeGFD/ea0zeT/DP39xWUaOINCMn6pqdJL/RfU+ojP6hw4wMes
	dpysGTr3pP4RejPCl+qKMQUyzrNbqrCLe9+9Tp+ZUzYByTkjiqEhef4FnFZkPP8js1Lt4LNR3CH
	6ObtoclvZdmNpF5aFaT3/2AguFqBQrv5/fF7vmGXlX+D0ogsePaWbQ
X-Received: by 2002:a05:600c:3507:b0:48e:635a:18d9 with SMTP id 5b1f17b1804b1-48e706b2726mr104321595e9.15.1778444209019;
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:48 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add support for Baijie Helper A133 board
Date: Sun, 10 May 2026 22:16:37 +0200
Message-ID: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet.

Link: https://szbaijie.com/index/product/product_detail.html?product_id=23&language=en

Changelog:
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/

Alexander Sverdlin (3):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |  11 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 162 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  94 ++++++++++
 5 files changed, 270 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.54.0

