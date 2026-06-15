Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4B40757F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538503; cv=none; b=pKDoh83knHnpeYEUcJo2Em5SyKSAUQbI+T0hv6cmGuEyQ+owlRHEdyU22fBTGeDJC2H5NQEPNTECfwDDiClTYLu1amBEJCw6uIkU1SsPiL2GwFQBh9ez+f7YruNI5FP8vf0kPp85vWyCkryoKnnCBPDCfkH3tgZqMMpQLCLXfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538503; c=relaxed/simple;
	bh=m4MDgDNJGJh6NUsFNjQqW0yFQBUw3oV+QM5zFXmcAFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnHoI0SWxwkdtCRW2nfBmQdjFC+/K/7PkC+VlxetsoKP2z/2E9kifaWl9A5yTMiR8RGLQXvIpOdOKPU9Rr/ohxYytjzj0EH0jSZOZi8c5m2I3uWXeQNSg3gpxAXuusOsGNrbI3IQQYVFUkBEMGHjHAJd8FiopfZfQ+NA//koMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEsX57p3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEsX57p3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eeba68948so2621401f8f.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538500; x=1782143300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N45xHGzaBC8uEBeOLmM+IjqfOYO20BdZazBFDqO07Kg=;
        b=sEsX57p3U6qbYGqJ9E/t8LNvHVaYFPySd3BrjbvOdlHbS6KegTJCunI2kmHNoqf+1f
         VES6I+9A5YcOLxQnWalGVyUPbnXhFFCdtejT9SCDCPyYrIwj0XOkk61BOkrJ4Xwm20ir
         G07mTbYKaw1IY0Oi7t1RzXo8nHTAN8xTFvkKrdBPd+Iyg3GLi70QQ9mdO8DSNIB45wZ4
         xwRIbWTtXZ/00I70ZbQl5PGF+VuUi+9V3govbkIIsswprxfV76nJECgXp+4HDIe+Ejj4
         986kFFdeu56hjltso4Rd5x8Bca/bbjTtjnyhTifPz3wCGJjr1i6fKnXYR+8CRbdXKLHL
         GG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538500; x=1782143300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N45xHGzaBC8uEBeOLmM+IjqfOYO20BdZazBFDqO07Kg=;
        b=hHenX1tseXbRfISq5RXuQWE+cVQLk9ZqsjrYKzS+vxisS3nLhuORcSwmlgWoy3Q8o0
         DMDmkhBqV47hgwhQN9zWVj4M5516q8fsOA6QPvy8uNKG7DTjmDD/9gtXHG6L9qHz66Ku
         FXrBW6J2qFgqLYNzVOZIbp8K7EcAk2OXRmrdruiuf0R1/GRQy+P5wSUhi4Xvz/gPt7l9
         6LzJbAJc+mCJJ0Zx4HB9hYSAp0cWcr9iBKSCFTxOdcPpMZ6dsbPjyR1Mn+B6D4RfoID7
         KvWvZ1Av0tK9sSSNhLtlDiJF1aU0wKG3SdmsneDXVeFnECoNTCrnOUBT07y5RvVqHcP8
         /0cg==
X-Forwarded-Encrypted: i=1; AFNElJ+QwSs+JU3qKU7D03dh4xhAz8W0q/9kzHfH2zDIETgzRSJYmCIdN3ISwTuZZtGso8QJmMn/3hnILsuF@vger.kernel.org
X-Gm-Message-State: AOJu0YzCHGz2BlE0wufHSYVv9P3lm8gspSY4obOJkKOSZHnnAc1l+1Rk
	1TIBQsCq94oHRERBDfOZYMrBInUGr3Pd1J9LCFz9vrEZzelTob3Q/syVmiRAlIE2
X-Gm-Gg: Acq92OEdQ2Rzts2E8Z3/u5b6+zmmsm3HJBqFvDmGxSFNnGUgdmUVsLHOXm8iOvcZjFN
	CyPS5vguUt1LDRpGa3JZCKj7SvTOic7X+k6vIU2w4C6VHvZ9uCQI7XCQRz0xue+bMbIiU96gZWs
	DG6V+ibo92rt6oPvVWm7B1eZcuqONLZ32yTjrRMhSjZGJbtfS9FzcKXID8joNo/5wrxGKiX/vxk
	cMFGoQBJy455z27U1Gra5l1vv5xDxedEiybUYQ8LHtDA1++XaMSC1xITMkqN82A+iE4NE5sqVo4
	V5yJY1qhlKve1rsHnBweReMyDBJDwZKHMujg8ccI02ZkrKe3M1edFNNMRdoOsgNAFgfKYPlR5NY
	UKiyyb/SQAM+zbsBMUS6O36lpKHAnb947eHjp7bmEAeLzpYCkRNqKo2+K54zA8Hw7+q/mJyfYil
	+P/pGN88MpljArpHX2WlvUUTtOtdXQTME1+er079zed+rfrshBKjIUlZqie6hJqeCFZWhl8LBZa
	O731gC2YRaxo3IEW1sMYsteM9/Zp9oiX9vx
X-Received: by 2002:a05:6000:46dc:b0:460:18cc:dcfe with SMTP id ffacd0b85a97d-4606dbba5dfmr12896535f8f.34.1781538500271;
        Mon, 15 Jun 2026 08:48:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:19 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 02/12] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Mon, 15 Jun 2026 16:47:55 +0100
Message-ID: <20260615154805.1619693-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
the deferred probe request properly.

Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
indicates that the interrupt subsystem is not yet ready. Intercept this
specific error condition, assign it to the return value, and jump to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index c4ed43735457..f81d691c8b9a 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -465,6 +465,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq == -EPROBE_DEFER) {
+		ret = irq;
+		goto dis_runtime_pm;
+	}
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
-- 
2.54.0

