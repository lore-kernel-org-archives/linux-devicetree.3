Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36042346E59
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916213; cv=none; b=pc/jov0BAphOW8uGaBonhs6PWJ36KDzPaIXycuHPMp4DZ2eTc7UKEK/Uibd5N/qLe96hq6ML3XrZzuKxBkHmmUhSTo2yg4QHrU9pj+Vp3mjb8iOA8W0XwIUH6Apmpf2usME/hDgCKy+EmPVJDPrrzQxrxau5nMVqggNgiMQG5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916213; c=relaxed/simple;
	bh=y1gUHIbNe+9KjDfOQGhoTyPNzefKQCJgWUCJO0B26ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qei1oE49W1Hg5u1GZrcXRzajTSJyaoO3W12c//LxX3phlZK9MlWVZNs+qoxI1EmH5+3WUuR7YBvwEsGLI5UEm9+orH6YB8gh0E9HpmUWNJcDggu9MvvF96HJHjX9R4q1er3v6kUbHFSCy2Wc4xe4m2r3EP+HkYi42gFh7ZMEvbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNyZf8pS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNyZf8pS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so6464345e9.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916209; x=1783521009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLLnf3TBQD8569ASiK4m9KPGvM1NQaFDK7d0hj0Yj2k=;
        b=nNyZf8pSAsVY9B7uZEnlvH1+SJDUTk10qRKHU8Mx64dxR/eu9tLasvhuwkzcDWmsK7
         RrMNn0r7DvBmvoDkUpJz3KdEqME+Rld1GLlxUk7IXykiYrEoSgr/HKH52yxw7QMl00lV
         n6Lrwzz8FfIr+GdaXN11xiDSt3RYMs8ljwjvvhziMLQvOHdKFynWtVZcskC2SnxYvc1T
         CQ9zmWmYeSAONWmcawFeGjjoR0msc0grunnh2QRbPX8oUfzsrUgC7sGrtaz2U3Itt0Er
         s26mRrmZbdRZyOmB7mlv+oG8BPPfF5i47F4z9Cpj8Dd/ps1Zs8G+I0SUh+eYtdFXtSS7
         zFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916209; x=1783521009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLLnf3TBQD8569ASiK4m9KPGvM1NQaFDK7d0hj0Yj2k=;
        b=CZzK6LHi08owkh2ecN+W9Nsmm0ZIVpLHokiKTMX7+bm/JzVfZJYwot14gWxmktdpWx
         BnwpizGnouid0AItDRvu77ySUYozV11I3auOwXTiR6V+rOf1er2LVyOgz4Jt0DXOmYjc
         QoFyaoN+ffP9U+aiZ28g6kwUdW76eOoB5A3/gH6KDyVp4anHyhjilmo0WXYDy/Yp0qdQ
         l774YwnejRbV7/M3F65vK/P4+3pk+2s5QuYDM4NBFcsFZZAt/HGV7kd24r16dgXLfomN
         SN/PAV21p1IBBMFzWa/Q9ubF/kU+t0CApXs7yci8TLvoqlBIhgERnOrrxNDcVfmxp/J7
         95fA==
X-Forwarded-Encrypted: i=1; AFNElJ8dK1yW6gUP3FyrT8kIBjQT+sdEu4x0h/912CPR9RwEWySdrzgVZ4TuzeP0BCCk9hosqHHX4Y9aH21U@vger.kernel.org
X-Gm-Message-State: AOJu0YzmeW3zsIrJkWrKt1O7IDa/C8fLT4Q9CLvoDhTeAfCmi7zZi0T2
	QlDVx+dqEoBTFhW5Tj9IdJBfZ0orLbJ6oA9RF9PQxGa/yAkttWtw5vcG
X-Gm-Gg: AfdE7clISmPDRH4xpqtH/0v+PoJOtIiSSShwbZLxKbx25ZiVoj4QBmQkKVoWLaPNdRj
	DszdPaB9srNTgjZDo8Z+oHB1S/cXCiU1i3RKwV7b42LGtQJaWHr0DjQrBlxWFeRjBGObPOAwIUA
	D/IHHFRXZRWPMsY1vm7NiyRBic27qDzytTg0TQX4OvSscyBIB2ONCWbLda866Ht2OjJR1IPh+mN
	UDtk/mNEHkH919jdayAtm8bYjjckXNX13eWK5DKXTCW28fB0fboq02Pzh7Uls6QLfa/BeTP+mSf
	Tk4QaxJdWnJBBwTXYEMA2YyoBfbfGaOJsSq23NcrxUER61Cr41NJpDxZdoopRMG5eHTKaYfH2aS
	zHXJgFT3O4ra0ql8mMuvlG/pLAWk3M61ucpgbYHVpdBfVXPfzSJQ737SQEnwWoX9MB5n/yDjMez
	0ndVa/p5ydJ+tnirVuRnDKzfjrDpai0wCHK48kquJGMCRUYQ18qCsKHoHnlBhMxMY/vVCjbG5tQ
	kwJlqLGGTAHe2upxzWHyQeG9J5ZkthOziASiA==
X-Received: by 2002:a05:600c:1993:b0:493:b549:3be0 with SMTP id 5b1f17b1804b1-493c3cdec7dmr14805485e9.17.1782916208498;
        Wed, 01 Jul 2026 07:30:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 04/10] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Wed,  1 Jul 2026 15:29:47 +0100
Message-ID: <20260701142953.2014895-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated help text to keep it generic and not specific to RZ/N1 SoCs.
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 01def8231873..d23a0fbe8d89 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC initially found on
+	  Renesas RZ/N1 SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.54.0

