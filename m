Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0743A4538
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141905; cv=none; b=uA5ehMomjHbSSL5NH2o4R/8T7mzze8ah2M5lAD/GQG0BLRy/jXLCG9qyIscTTuF7Y5+Aqplik3qUOB+GssmRORLX7x5Q766enHuvkVP1TL9TDJDna+3aTIvtvuyY6zoe2IWPE5sXTwmWM8Uc0JtJdM99apA0MAnafeamy43jeqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141905; c=relaxed/simple;
	bh=7KuR50pAzSW39ZRZCwjG/exnUpapOdN4/r22kkJty6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0xKD6+PUb0djI7mPCe4ArDsTzPje4AiVyMTttBpM5sL38M3U/Of0TBUM81zMCsDoDicZqZo906njhvwMAghL0KabOyt4WtM3vUyViqI84yVGtWI5OKDJqAKA677HdEECIIBtXjIrX3KG5HbZ3KKM9R4ZcGaF7imzvKgZWazmkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bhz4m47R; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bhz4m47R"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso34666765e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141901; x=1779746701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd2gH8+KVNAxcq+NWcUqT38BQp2PFP+quQ7E39pyZhM=;
        b=Bhz4m47RaFEn7X2qEX6ZAO5eS3/UaoYDbsafcaXyDzbZyyXd9nKwACaW/t0LRExmcJ
         0HttMCGLGAdpqYbRcAdLXZki2oLdO3J0D8vOoMXQc6KGd8C8Yep4FTVCAo/Dgn6zkM3m
         8MLkLINRfHJvmE3SAxCYF6Fjuu89u4oPqnKb1yd6fAY/WKruuNBXAHOd3o1zp1LVzvsj
         rL//yFsu4FzEsabltDPJsni+c0F/BCMfNRZEfxHQeblZXBtkQ78SxDe+PCCjnIrSkVkg
         3WCSglw3CmontUGd9p084ZHA6vu55siwE6Ubu2MzUrIyaEc1Yr1Xd6J8tYGxmBcRJ3QT
         yX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141901; x=1779746701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd2gH8+KVNAxcq+NWcUqT38BQp2PFP+quQ7E39pyZhM=;
        b=rAfRC3acK1o683JSKAaenu+t+Oc1Px5JqOGFyq0MlpVES/Bk0jD1IIz9e2b7tdbYDW
         caA8aJ2tCgKMpImOKXQF5mMCdCU+4GZymv7VVi8c5VNgD57OnQzjI4+4LEMRpc+gDYqL
         s7hvr8DqnptpE+YMdE/Xh8efcVJR+Cpuob3fcm6iqxaV6fW1lBjIONtEIw1vEaXMSrlG
         qo//bR2+azZORDeoNYvBVLE3Uwhylbh0fYosspX7YyhqlyYRLW/mRB0CAiTsFLZPUyZK
         EGW2QZzDg6zGsyveTG8PyzmcFcroVbVt4yiWQclLkg311YTba3qfmyDVrFtarJbv5uEC
         WxQw==
X-Forwarded-Encrypted: i=1; AFNElJ/31lSvvdmSSKgez309twiY3BVyIoyfMnk7XUpt4LvTgS45x3fIucpFzFc5j6bArDzXQi+mHvDd5qvY@vger.kernel.org
X-Gm-Message-State: AOJu0YympVmGaJBdxdQoDwdZeZB7VjvvXmMSXb0dadyrIFmV85+9iDRq
	gPecxGAJe3RitYTIg1+a/6VE1VtExT1pRFE3uTONYZO2Y2K86cKJ1FlG
X-Gm-Gg: Acq92OHVnmV074J1Eeul2Tgl7nJR9EaDNDz9AFDFXvi9c1RBpEvMtxrNjcukDUdl454
	aIwoOQw0oVqEqy5f+5CW8adhEatexL9L4WnYG1waW9s4MOF+F5CHZJVfNYJmVP3vy7DiovFOO8D
	Ky7Y6VqjiuB/jdWXrLVh6o1yJyIrqX9BNuxUygsLoYH75047PNeZTMX5BGwbsp+zaUa2Kcx2oy1
	ZmKD1SaPdWaTAEhUGLi+dqzYA+7pTPcHFcoHbE11qBELxtTpZcm0VF98xpmn8YjyLapAoO+eoVC
	AWwSujYe0rlDTo6Ha7ffnC97Uy1vkhvGW6eX+pSTneWqwoSFJ4fjbs6y3h74FoRZJqGHj1K2UUv
	ZquGrmRfiJOhp6O8H2LZI2OEc4F1OuHim7mLa45qOiCcsWJQeJsXZNZmSNSSCrY163UjBlneYOe
	GIfn6H4BmzJdm5cb1CW/PTCsI4+HtWGBPCTP3aTnW9arjidY0zP0gbIPpUW5rU0ESGJtqCRPRJU
	Ewsj4VSaf8bMYdYX3Xcr9AIpTHAKatpEdqoQ9sBh7mE7rXyMwc0fin2B21zqNWIQBATLguDZBEC
	xRf4Ws4+RwFlCHz1Wie+bcuASkoImoW+zKjZx+zCp+hJDxWtAJeSL6DbQChL52Kc8igN46H1uT3
	azYB85U+eyjqv/hrlZpEBCg==
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48fe59b047bmr287108655e9.0.1779141900529;
        Mon, 18 May 2026 15:05:00 -0700 (PDT)
Received: from cypher.home.roving-it.com (7.9.7.f.b.1.3.0.b.8.f.0.9.e.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:e9:f8b:31b:f797])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm281976645e9.1.2026.05.18.15.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:04:59 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: sun50i-a64: Enable DT overlays
Date: Mon, 18 May 2026 23:04:49 +0100
Message-ID: <20260518220455.156874-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DT overlays on some of the Pine64 devices to enable
use of addon accessories such as WiFi or audio modules.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d116864b6c2b3..53e6b701e7d3a 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -1,4 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
+# Enables support for device-tree overlays for named devices
+DTC_FLAGS_sun50i-a64-pine64-lts := -@
+DTC_FLAGS_sun50i-a64-pine64 := -@
+DTC_FLAGS_sun50i-a64-pine64-plus := -@
+DTC_FLAGS_sun50i-a64-sopine-baseboard := -@
+
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-amarula-relic.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
-- 
2.54.0

