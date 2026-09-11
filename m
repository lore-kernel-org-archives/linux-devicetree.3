Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F736196B
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125477; cv=none; b=do2Nq7XYO6Kv/jxKix/OPBb8g9+K40dY/NyzpWyYNRKfKFFXkdPLEFrjoey7xt+6yRGWTSq3pfqIBIAVEj+KpXlVHxtzCrWIRWBKgc6DUM8N4cVgdnyIYs9/KcRu6pdU3SfdB58Wvjci6NE0Sa0cw/7F6xw6gVy9sewa17totx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125477; c=relaxed/simple;
	bh=fDZDTRI+aWu5LN17RJSF5MWiMpzqvK3NEpOcipYYhvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/VZlGms2MQqUgw9aBnZw2X6uOVTBfhg7nDHALIHMaEYeiYsSKRSZjh9Dhs5BePsaMogOTTotZqYPA4XAvHCsCet3IfiBWgxNIwK3WgPNsIn/34EKHGKMamx8TaBHDa5hT/GoOvuMqSZoNQIcTHwT4V+W540Ryd7dTrC4b6nzJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/tazKqH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/tazKqH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-485888b3c3dso725022f8f.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125466; x=1789730266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ6D51q/BQlK7MtFm054nWG9+DWDS+0mGNHkgeO5IsQ=;
        b=r/tazKqHQZjNLTW/Un2DkbLqNpel8YAooFL77376x5Z70WVE+bmc5f1fHER86XCRD5
         NFfx9KaQu7Umg6mf8Nd+0xxGGClz7PbAIOkPSZ9GAD6dnJ28au9jixEMJw9YEBja3q9Z
         V5ptaG1XUpjKaNlH94BNqrY6u+wyuTTJDIz8OB2n040hb91aNnvix+ayb+60PeTAiGjw
         tScOrnN216Abizhx/oCAeClpuBEONmvnM2gJVDUbz5sIrAo5we5DW1cBj9xtyhDtYElc
         y7XRViZlC1ZO/tCEW84hxkbQzISNYGfvsowKyIWaIkP048rdQ4V7yYjX/VlyZpUb1i58
         gFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125466; x=1789730266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ6D51q/BQlK7MtFm054nWG9+DWDS+0mGNHkgeO5IsQ=;
        b=MADuUbMykh5j/EW20mI+rL96iPwAIKlDBau3MGJJV0dDs/KUX0wz3exCDgIVkjAhkv
         uJjHGZgEBr0mK/L4gi75XSi0FTJDucbrSC9mubEjMSMN4A4Gngatrt4N+kUB64VTak/J
         cefM/H7hj/xuLPF0DowqYyAA3tlMkzHgsfmETc5LCBB5v8Q9vyJrcGjHK4/mKfikKLIY
         1buQlNSJk+ez3+18WMwzIYw9ybJtPgN/uY0xVNjyFpi9JzS492nvARdmyTKxcSU4VolU
         JY0cLVRaI5g/e7Qy/P93mLj0IY8jgmrZDNOfpDUvKyCcE9Qq6B2YQmBIb0hos7A0PeHg
         mqdg==
X-Forwarded-Encrypted: i=1; AKwUvBwoJVEJ9IBXFJZVIRIKQH7PD6SzPPYi6CD0uJFIhSW46h9PAz+RunA++3LB+vPVZPRpAdgaaUt1uJa5@vger.kernel.org
X-Gm-Message-State: AFuF++kjhirUcJVzAYA42n9zttRWmZl4F4Kk0DBu6qcm3gxcPTwNenh9
	r0M/MRuzBJ5JvuOnVzEd9AKY3wPaVkyU5+aFqPSZ3EzAGrizutP4fsMV
X-Gm-Gg: AYBFou27J3vOTkdebV0zl6Hy8kgKf+Th7u0bwvS8eoX7AVb/SXDyVjE6BqK1UXK/CbU
	n70WxCsfADfuNuISz2kAP4G7Aj3tfs/tozpIFx3ZniltXDgVJdJb6HuBw+qbYqQfhzwmCf3WHXu
	DqKw0TW5L2Rc/AMLbJjv6eXflQlMXoJ3fiefvczJkoAbTtX/oIhot7i1vfWd6ItivO76nHagx0G
	tBidDg6P+5m96jimVnmnusvKuERRhev8YHLtcv2EfTF5m+AL0NpNsN4Q2d1xPhkycnBZqY5a5E8
	TqzQ+Hlcm742yp9pgWplxFzRPn5HhjUtnMNHrAoOB+l7fcPRkV43VQpQj8na+LGTKfJ2TOlHKwV
	X6Q4qoCFksPjUkKjUtLRtRrduBV+Chf1cNmFW/66wXnUJSg3d/AOw50mgvFJ1SIKXfT01D4zJlG
	8FQvXbecHTnzdp8wXS7ty1itm34RAfz2TBb2kr6RyadqD7zHLiuHiHNmdgdhrPp9P1+quvNQo31
	QfetCH03WF+weqFLJal/IvOnY0J41a9Rxj9zerG8heedP8XCHiIFMrcIrGhJBc1Bqjy/4Wav+co
	vc6bOFFHK9oj4Yi80fAV
X-Received: by 2002:a05:6000:18a7:b0:482:de48:c445 with SMTP id ffacd0b85a97d-486eace4fa9mr4203841f8f.11.1789125465635;
        Fri, 11 Sep 2026 04:17:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/8] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Fri, 11 Sep 2026 12:17:25 +0100
Message-ID: <20260911111731.3404308-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index bd86da71b0eb..7c6a4855bd8a 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -39,8 +39,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

