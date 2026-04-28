Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2AB3806C9
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390606; cv=none; b=tS4cjfyszJamIda0+SVPsNQAM1xMyPRuGKcqQAWV6Sv/rOITpdL//AReTyg5v/g59bbm9g7heftT4Zlmh7MAw0Znv11NukhMtrxUeNmXTy7d8P43nD9RdjSsfyQ2rOCkrTnQOuzBSeecgfXVnAYD5J8WwWe52pwfupnm/Zo8BtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390606; c=relaxed/simple;
	bh=0gEwZwS/FYqnGRZ59VSyvYE3yvqWMDCYZCh5Jh3+mCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WkNGsyx0Eteq5fvX2fd0ATxAeRqRg6Fz491Yatz6E5jZAKrmxWHUMoOXAsx7HP/mDS5kza4iG79g4KNCSUDoA0RDmG2pYUPGi/n9AMzu0LAujwUR1UbKNZrtfP3HqFa5B+nTm8Ty/o+S2fjvoMQUqRVIcr0FFKoG/dZ1vdlK3MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4nYMmJk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4nYMmJk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so142204415e9.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390599; x=1777995399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Ch5JjZSDRX/44ND7WHKAD/uEQw2ql3s+wN8Su8rG0=;
        b=r4nYMmJkiJTzRJALEoN24245AHb4CqIdo17Jns3G8n63iDncjs01KiHsuYg0Sqpspf
         BfJfemDC7I0uzEUtAwYY1auLUAkmBb88nZ9xETv2Jv5gZ1/zpCrMOr3FAlJkAky6ZT4l
         ydUwXHZR5eE4l6u83FeKOPRudATyx4Gyz3gjK5AoWOKGcZeT3zpCmmfDXKvAM0QBsOLR
         MqhLoGMXCQ1UvfO0uDe4XAIQff+KYQ9BXR6Kzj6X5wKZ5qYZ6KchatBo9oz7J3nD/pNY
         U59W1xbdTkysfrL+xH9nVPcHfgFc62ljOEdYwVsTQr9Ca1jWJfBxg6z6p4h/wzzhCWxX
         064g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390599; x=1777995399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l4Ch5JjZSDRX/44ND7WHKAD/uEQw2ql3s+wN8Su8rG0=;
        b=Sn4mxr0Vy9UEPQr63jFn9xWUv0wAHPbm1tw/NRNiW5eomfubymIJDqAAwg3VYyazp3
         JnWeF3p3PrPeOsrkgDm9rCLnJN2QLZ1Hq/4WbigHQR9+gxallOFbgN/ao2X/eeM7R8QP
         dGgF+OgcLUOrX36ibm5MQSFCnWk0chpOVdZYLePmGCdE+dx51NhDqvCIdA6Yh6COTgex
         7dBaQ1s1Dr1ffLBQa36qF3ovArRT+5eskRSbENBHSaTA4fAEV4bdK6RmDc7+gCTm+xti
         fmQxSf6TQolIprFuhTYpoEtFoGASYptLnXF2T9hIoXBVh5HoOt8npXg8uoOxC6cWMJB8
         T5Sw==
X-Forwarded-Encrypted: i=1; AFNElJ9IoVufsqLtiQIIhqzoUD1kk4ov/AuaBm6gQxAaEJctF6DHNal2jdaYc+aplXavbKHZuhp45YbzF8Bb@vger.kernel.org
X-Gm-Message-State: AOJu0YyDjTFK1M7I0mU10PoSeZG0K0A44atEEOtB/MClcpR5CdqVV/Sd
	vNEP4Gk6yYh2iCsX/CW7Y+t0fIO5+sIb89HCArpEiKq7jHGw1q/hNTzT
X-Gm-Gg: AeBDieveQv/lvrZZrL0+xYfAc0je30y0+Y0JWWed70SeYSilJAgl85nmQzMbSQtA9gv
	5sE55JYLY02JwD0a+GwwQs7osKrxDU+/qf3pUNIORRKeXLNTLRhlqehD4MBxve9bDYbkTWQ6Obp
	03VuMmuupSm+LB8qSTfpeQdnN8cBqzgxWupJtK5f7WENIYkWnF6VEFommjpI3qEWo5hHVSvDAwx
	gY+enjqqS7SXrnSZUmDUSvdBLcVLeI3/iSb/0HFASjWplCEhgCnMm0TYEQsw1DOAQ0Q+ypfc5pt
	oEmlJFuG9LqKpzhGzehLieuLaznl+4rp8NVENMlVQF7JfgqLWu10IOa3vynMhN3nRi5X+FObJ7f
	67yjVJA3ULBlG653lrQCBVcidxJ0or/HnDVWlLC0tsAtY615fASDVZiMJ0oayQeqXb+TTEgwv6m
	aY+xFnZX6yEJGTdF4PiORgRFxToF3UQBclTw==
X-Received: by 2002:a05:600c:b8d:b0:489:1f98:71e3 with SMTP id 5b1f17b1804b1-48a77b21791mr56327465e9.28.1777390598799;
        Tue, 28 Apr 2026 08:36:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 4/6 RESEND] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Tue, 28 Apr 2026 18:36:09 +0300
Message-ID: <20260428153611.142816-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428153611.142816-1-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 7f257f3a1a5a..542d149d2b39 100644
--- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: motorola,cpcap
-      - const: st,6556002
+    oneOf:
+      - enum:
+          - motorola,mapphone-cpcap
+          - motorola,mot-cpcap
+
+      - items:
+          - const: motorola,cpcap
+          - const: st,6556002
 
   reg:
     maxItems: 1
-- 
2.51.0

