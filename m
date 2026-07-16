Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D13812DD
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218804; cv=none; b=Ewg1P/yBMs9384SHcDGfNmzSZzW/wySI/hMwFlJgqU3/OR6jzR9QprcqxXV9MUADHLIq4olw5QnLuOF1/uX45wiKX9s3hHnmVdhRDJGQHz4yi+j1EBKrZfPu8QxUSrjFKkLhMXVuHaW8qRaluMULRjLpvHyTsIHBimCrg9t9u/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218804; c=relaxed/simple;
	bh=n9kNRyaRLW6qazOq++7deREiI3P8wgaDeM/WQyENGlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mn54IPE6MrMCxomAyynF9Lwwj4pqJdal15U8JqLl2Zaj/sv0uMDogigGknWnKD2hIcykU8kp4hI7drujM5oa2lL8O5wDqjQ6xPBgIIYnzK/WZT9z1MycwWP9ocpHWG0p/Ge30lpkqQyZGvsl8/lMPWEEMuzgnC+vjMB8gZDse3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtoeLUIK; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtoeLUIK"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8485b358552so7601160b3a.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218795; x=1784823595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbVIpIkuseKM9YQeH51Wa+r2dL8obTD2M1N0wW92ZT0=;
        b=ZtoeLUIKXJQ8FvcGxBHyLf8xZAMe0N/U8W+c6k7WtKjmZe06AcKzo292/5wyytu5kd
         7X1FHdCZky/iZkgQUN/ap9wqVYdEZ2P6GjbnHmAMfUXNORfHFT16yQjc6Th0X4wuusZs
         ueNfepCwturt+fSvRchzabXAZyllcIHgeMV+S6NumexncP32E/Woa5Yrj8EN0CIgYLXX
         qHH1Yxqmuv4Fhwt5BpxnBceaNEP2ITlWPJ1p7JKL0vu6AiMVjLo0i/zpuMvDeMvfvLah
         rEqkmhQv6Td4jSJmLaEmLTXuKAPxPM6KROorGTTSuU/Fm4Up4YYDTgXaUDuYeu4pnncl
         ZzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218795; x=1784823595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbVIpIkuseKM9YQeH51Wa+r2dL8obTD2M1N0wW92ZT0=;
        b=USYeRf9nwklJb2ga/UWv8zOHg6Fvv1ZDps8Hl+FuZfdDHYMa409xgb+/Koj+rRgjc4
         1O0obafSkZ8YHhV23CHXjaki+eYCWcVfu+0vEAHx9moa+PxdhgEogxZKXgywndTHuNSw
         t0BKLuPARgU7GfTETZe74YLMaXoKeFhISqcmfnaRfmVRTnOi7VDN4cT302jElOFwlRpZ
         5eUK5T5tSxh1AjLk/fIfhR771UjQJKEEg+igkeBWLMLBvSi2zHNVaTrRp6JfHJjRggOC
         2WXqNuhyquwsEKryfMsFGqOpweMihN6JnH1GH2jec4V6mWur+b0q/1OzB4XY4UwHjmW9
         tjEA==
X-Forwarded-Encrypted: i=1; AHgh+RrrKT49gRpseRFe+XMq9lrn0/S84YLxTbezJjBuICcz/exNIUE8hpzDUzfMRiOWfo2SYmBKkZIImD6A@vger.kernel.org
X-Gm-Message-State: AOJu0YwX4eBweF1EVM6IkOSUw8JXeR2n0ibBRJthKBJdQ4CSury+7cgr
	+oUDDO9EC3wnzG6YzGNdFKa8M2JOGl91nkVjwSdRYIFjV+3dNHLy4k8F
X-Gm-Gg: AfdE7ckK2B326caKUXsVTzhwnfkB8VQed+COdSVI67US5Ianzkxfj6sMXPj11y16jpn
	MtTsKbaMoQMe39d2hrUWBhXhSdqt+2YmW3W9fD2JBpEVRWUbs9kOUB0vtli5Sm1zSZlrEb87nTE
	NsloRsP21W6KAj7iUVPoujfpRhryH4O6eakLp32jE5uSXxjW7SjJmwyKAgbeomw6/hoFZTL4b8V
	9A53KmD2s9P2NYYzfNd1yVHWLnwPxZXkIId9ZHX+L+j+l38zTima9usESEswFbmDQinwWZsHo4C
	nY7FCmblE8zej+2zHdLs8UzsMnh70WbGqmYwy/S/k458tN25oAhHX+PN23kD3ppH40vDJsXvGfo
	qGV16PZdeRDckCH+beeb+WdonEbVPpIBKdYx5lrebz+1hIsaioTHwAe+5OxQI0Y/hONNM2xKyHI
	aT1LQ28cFyivMfUbUZAXsfr+T9FPazduGi/Q==
X-Received: by 2002:a05:6a00:22c8:b0:848:2f84:733 with SMTP id d2e1a72fcca58-84a559dd085mr10999832b3a.70.1784218794877;
        Thu, 16 Jul 2026 09:19:54 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:54 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 4/7] dt-bindings: watchdog: mediatek,mtk-wdt: remove mt6589 fallback items
Date: Fri, 17 Jul 2026 01:19:20 +0900
Message-ID: <20260716161923.266315-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All DTS have been converted to standalone compatibles.
Remove the items block that allowed the "mediatek,mt6589-wdt" fallback,
keeping only the flat enum.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml       | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f4eaa5f7c5bc..2411c02f1cb0 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -42,21 +42,6 @@ properties:
           - mediatek,mt8195-wdt
           - mediatek,mt8365-wdt
           - mediatek,mt8516-wdt
-      - items:
-          - enum:
-              - mediatek,mt2701-wdt
-              - mediatek,mt6572-wdt
-              - mediatek,mt6582-wdt
-              - mediatek,mt6797-wdt
-              - mediatek,mt7622-wdt
-              - mediatek,mt7623-wdt
-              - mediatek,mt7629-wdt
-              - mediatek,mt8173-wdt
-              - mediatek,mt8188-wdt
-              - mediatek,mt8189-wdt
-              - mediatek,mt8365-wdt
-              - mediatek,mt8516-wdt
-          - const: mediatek,mt6589-wdt
 
   reg:
     maxItems: 1
-- 
2.54.0

