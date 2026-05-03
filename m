Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C134737BE8D
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835932; cv=none; b=rmf+PGJz2zcsTI5MhSh9wAlTzdi384SyyJFAaOL/EWQIKQRdGmy4OtXg6XhDxi7QIU4/9lLVpZGG36A6Vv8L5cbalZHFKWU6KHqyvkj+wv7ItEcDJJjkfor+LvUkNpaSsWtHylCknqrj32/msNKEg911zxRSEBFyBp4FRVoKfMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835932; c=relaxed/simple;
	bh=X8wMLDqKz/DqODvYXvtH9vp9dZqC++Dh/8QnPTP2z7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0gRvIuusN/yjBH02Z7opJW85ch63lMV9TXYkGfms1hw/1to4qaFv9WoCU6J9G3hNrz0OwfZ8RvhkcaHcwKyrebSX4AvbIg0CBhxlCPXQEMYq1ev1aWdxk4eWLxRNfOXWOVR6910bD7HixnzgcTjZ6BMjInkYLy+j1cIV8GXg34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBaoAH7K; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBaoAH7K"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b150559bso22593905e9.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835929; x=1778440729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMCDw9wXTxDgto5dOfbGsyssZJSrE9wLKmOGf2pkLYY=;
        b=fBaoAH7K+Gsp21O5d/BWw93hRgg3VaWhaHuShGmISWvBgdHeDpxkpsCvqCyhpOy1pJ
         6bp/zo2EKSPPjQp9i+UpffRDlXu4nDCptixDtVknJdNqobPU6yn9GLFs8sKJlXiPUY1B
         EnOjnCL5hgmT4o9LepcLJ1k9uCqTHwRTxU51M+s8z490bz0RnWaixTKIbCC2T/qqsxw3
         3Uer4hvwV89MQjXMecpKCN2WB7PkMJGaH+UTsbs2TfIXj7w/PJvm2nauS9lDL24IaPct
         d39cXfz+wDVoC3XffVoGKp6je3NLKH2iwZYH5Kk0KgONT1jf3/F1iiS3a+RzBNvO8jSC
         LTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835929; x=1778440729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMCDw9wXTxDgto5dOfbGsyssZJSrE9wLKmOGf2pkLYY=;
        b=D27J3xrKDY+HI03W31b9yyaS0gGx1ywTGvb6JdT4/WkvHjpjQCK2vyqYm7K/WaG3/3
         zqpmzMhnnWw+RUnlWysMOz9SzjYrmVYDAaZi3erGJiQ0fOQTASgC5CcqyV3P/3nbeCOI
         ZHfAOqG8GQYXtxhXZ7Y4d7qwq+XDIQjt8Il0nP4WImQrViZzK2jM3ybm4kMcefu1UnEw
         obITeVpjdOl2oA7LH+UeiR1juDRDkXVzUGmsr89O8uxAo3CElJCm7Tb5sxIyG2cnh8u0
         S3FYnuMpwQK5WrZfZvYElxDCBl4/dew4eX54wvW64wCMtjEe7+XSd7elBGOn9kgcTBw+
         zzxg==
X-Forwarded-Encrypted: i=1; AFNElJ+Nv5Yuti+Q19tn6oF2kaoN06HPA484nHsliO1PLrPdBfv8WOFfjYEvjrkrZvYZ8cSKYag2bW6Hhzhf@vger.kernel.org
X-Gm-Message-State: AOJu0YxfD7vPAM0gAXyreiiLYnd3NOZ4uP/qODOdjUyrktdslquibved
	sjyPsdfxekgBywVWASqGNz5KKX2mNOiLzAipYO1++md/bHdP7o640aZn
X-Gm-Gg: AeBDietppVnhgQ/7p9CMWQmu4GUttMdJxEZE4Nx4QKeXEQmsL4dsA2Y1SdvvRPH29y9
	lCHNphOEODwHTMo3bEefBubzUqewOB0tmgm8pLUpqHEYLFdT9SO3Jq1dUIS4zeaEB6a/BTMIls7
	MTGSddLaL/RtSPKmrrcgvO8cIAe7ybiPYHen3odEim0mDM4YvgSgtWIm2Dx2LUBABqhnk8+KTkK
	V9fXOp/1pkX5razK95Flm1pQJyLpL/Smffs9GRaJNXSDDC13Rwi+G1yVKyxeMjtB8MZltjJjCN9
	5ngPIpnmokdMQQd5VLquXjWb9BM8JGOr99/qbWg3W0GfbhEQm2m3XLCdWngUV5DAeTkOaoubX+v
	pFQ+RQ1mhlAUajVkQjO2L/n6HUbxHT/DHUUxyMJrEmF2RychsV/EXG2Iy30OKDCkMOslONB3OUo
	ZuhGDQymeULDXW1rySOHBE2nK/HlPttLvnOmtbn1SdiBBYU9bTxNBnb1Z3eu8pyOs=
X-Received: by 2002:a05:600c:8906:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a9867a7dfmr82025435e9.27.1777835929008;
        Sun, 03 May 2026 12:18:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:46 -0700 (PDT)
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
Subject: [PATCH 0/3] Add support for Baijie Helper A133 board
Date: Sun,  3 May 2026 21:18:35 +0200
Message-ID: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Alexander Sverdlin (3):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 159 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  93 ++++++++++
 5 files changed, 260 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.53.0

