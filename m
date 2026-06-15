Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203A3407566
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538509; cv=none; b=fV9IQAv5APUkIPr662OzGAeFJQhLft/63+Vhx+8MfGhCO+VKNDMKB7WsVx+6VvRHDBqxWS4kTpGnH8CvJzVr2lrPRcTtjvd097GwwoegmzpUFS9+wQUgOiuwcPltt7orlvJP7vh+j1j/X1HskFbjlJapKoi4nFgNjhKWbJAO2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538509; c=relaxed/simple;
	bh=ON7Z9N+BusoLW2abOlOvuPQACWu9rFAjcD8AKM9aY3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=od2zVaGPEZY20Yv3ERHU2C+t/iqYdtKj0f0JfqowkJkPFIwKpn4dfZ52zvW/8QZ5Q/KRIuA8bp+yh0fffIvEMDUpsuk1IOlTiJpD2IVYavJ+HeYQuN4P9Zy6Bn6VZPSySVGPp0iW4wbvFwwmqbw34z3PrHEJoFjTe/vB1BBSDGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnkPjCHD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnkPjCHD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2615168f8f.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538505; x=1782143305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8wLD9zxqwXDPnyCjq4DuwsGKzd0OYW0pMm0bgsfQds=;
        b=bnkPjCHDrEOkRVlzOORB7pCHzyCqmcelnNC1HNXfV9ONXNuFYo74VofxlGAEIxkBUn
         xHmRmJZ8Gi1e2LeGL+74vg86sGkxTMoap1TH9rbWvjnwCLAzJt/MQtodWUY5TKsLR90k
         3+3LY15fVDzXgmn2I3d0kZE8TpY50SzSvA1TwUEq5usfW/YoV/PAq/ObyJHml4xofTCc
         fCTIx+sizXAUn0EBj1WMGO2TGTGXDUc2QG+8mdjnq/5a2AzRowocJ0/+b4X7CHisEgwb
         5qGhdjGhZr1lKUdKNHmLOHDMPBoZ9We536Lu8CRxW5h8FwcfmM24WvlzqTSI6yz3odFl
         EIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538505; x=1782143305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8wLD9zxqwXDPnyCjq4DuwsGKzd0OYW0pMm0bgsfQds=;
        b=DWPFVu9/J+hXTrrvESFsY4yulRF/3o24tQk71DghZkEqesMxusE/GU7h6NE9EHf/Sn
         E6ut73AL536GKwi+YdZ0IWc3ZEfNbRp9pF20dJQGJyXRkp1e+EMAYHkwK56VkRzHiMVV
         4fNHfde5Y1YsbOeD5iId3Ld43JTvnlAQKdptGFsNKvE8ZeuRtDM8pv1S6+uQz801MSek
         IBxKH4rKVamWOR+WWikGFeHJQT0pxcstH6vKYTUDUtqmJN9f4e/DNJ+GkPecNRmQGaQV
         Joz4NTXgjAkMXVjWYHDuCYXbN92oMDMUAcZ+zltNp99H7SktG80d5UGC4Ua0JdvIGw2A
         ZU5w==
X-Forwarded-Encrypted: i=1; AFNElJ8MH2AW3PZyoXVXLvwrxAgVvXYi1GekPbh6db3r4B7FDSXHRFb8iJ5QVkWDSU58UnKUluVf2l1//6IY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dpTHD0emWDsKdagk+J4lljcU9vGtrPzRs2rY6jvYpexlR3hv
	GWLXnxJlrptFFVx2ZX7D0/npIRV5GNT1LhedZg7yBXYN/QyHd4+/c9aQ
X-Gm-Gg: Acq92OHAX1jdyQEZFRWK6TL+VzVeQhCL3WcQuTdpTr5ouo5Dlubw+MmuP/Ljs9W8O3Y
	JtGj19+kDZsyx+6L9q51sg5+y0q4WHtTaOljlHzfRPSoMxzQzIzriDKcIoIJYiprvv431x0yKa6
	rvshIORyH22e5J83NRij/Mn6HJdGRFrnHdA+b1WarrOCJqqLPPy709of4TRve5MRap3zdEZKGhe
	wQJdZK19zo8daz/fqp0RCrHLXsJu/ICofapZ44hPQiJfsiWrBUxfI3BzrFegh+qmv7ooDP1Mvyt
	d+HVaMXLG7kvVINJzQzZZYNg0nhaU1F/v9DNHxnAVOTX9BUaf0gpz8ViZxcuZRLh4FJ3m9FuMpZ
	f9dBskn7sgSNQ/aR3wO5l89HxIHs6EtAf9TEr8nbS3vyNs1nSeROgs+tP3G6MS7tJ442sEF8NKx
	UR+olMhF5575cbFfDOFYrvm+fGFtoTBzrYqA/zXtglZtdXILNp7cBlyGSjCIbW2skd5yYSrC8qL
	ypCzJ9z1n5QwbAqPn8iExmWw0HuOnqCRJ5I
X-Received: by 2002:a05:6000:290e:b0:45e:f381:cd7b with SMTP id ffacd0b85a97d-4606da6985fmr21913290f8f.8.1781538505346;
        Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:24 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 06/12] rtc: rzn1: Sort headers alphabetically
Date: Mon, 15 Jun 2026 16:47:59 +0100
Message-ID: <20260615154805.1619693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sorting headers alphabetically helps locating duplicates, and make it
easier to figure out where to insert new headers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 12a319e9112c..fe21fa624288 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -15,8 +15,8 @@
 #include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
-#include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
-- 
2.54.0

