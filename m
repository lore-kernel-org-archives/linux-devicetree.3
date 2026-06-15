Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4A404BE5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538502; cv=none; b=nC/xePA5t75qk6hir/4QlmJo1Wb83eY7g9Dd7YcLYkg1yNm5Z8lKpJ+OkYu8zY2tL6yQI+v8Ben2g3tajHwaXEXa36mQ7tV4ByogMXtyGXr+Nhw40hGD1B6yr3mT7dtuaE3zS+G/sUvcXNcRchQgFlsoFwYd/jXwTfFq1zgYbwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538502; c=relaxed/simple;
	bh=i0epigYQSf6nodYrIVmZxJadmqWcGELiZNYUZq0FVfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/MCWhXDtN9E776Xbz2RflYcQTY1EOQDliUozFb6QFgIedhKT9T96F8Xs0HlWb1/XOqIWoXpZzGd3UJqJg8BjdyAmGXusQjORk9AIHVvxN6u8kpF/ZsjYtlbunuebJ4V52p1J7Hp9DMPtc3d+xtum0cC+ZafaHRaSJ0azLQGJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oya6tk5W; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oya6tk5W"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so23093535e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538499; x=1782143299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6TqdYR7EjMTpHsjbl3Oaxm9i/7wwH40MmAvo6XkU6A=;
        b=oya6tk5WPsFdMxBAzLZxTqF5CNPi25TxzEVJIPdXn1eGkjcz3LIdYSILyfV6mB8DCn
         HqX6cX1R35+olDhoFLA+niKfwVQ8goyWH6C0s1fcbWaIlog1Si4WgaagFtLR/4PpYGu/
         yC9O5aMx0OoXoOORnhnvM7qrDRh7DBr41jPnPGhMkI40VpKJ5sLz/c0bAHKjEjDMkpRY
         V22YXEFYYd/z+D08CqQNpxUM1eA39H7lInADFBwwVTkGgImel6LMg/oYaesrWUIucWfL
         iqIoUVkl6zyTgHmj4ppXpkMGTnFscrAU4FzPxMGpeRBe1jM3VnxBg5e76IyhBHjCjlkC
         58fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538499; x=1782143299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+6TqdYR7EjMTpHsjbl3Oaxm9i/7wwH40MmAvo6XkU6A=;
        b=ldXSgj9UdILSvViaULZNV2F+d+ug5iILXL4glqUXne4hF/XN0s0PRzQDS/uNC2I7Ad
         rJ7h7UwE5aLk+8bxp7DbaWg6r0cSKiogONoQG/kgBDZdSk/5GodosXhO0F03oxB/HHlF
         LG/f9wRVOXq9FNLHiAoN2GzFuMfluuutj0ejjKHicGXQvouuQTjgvD+e/sfcjj//HGc9
         nK27/re+fHkbHWRFZGw2YsSeU6jNBAIWdw5S3gvquOYpoqTcbkTcv0vWy1D/SP+Jkoqg
         R4vGIbmoEbZCNN1ystYqUeLVC668rOGFEjRwcGVD8NQsPPAssvvD3k9zfWhUnvuYI814
         i/tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Vjz9n8x2Dx3bdA08wMuzMFxVI10aZdE3iu5jPGIdUlrgQj/wXNDcidg8G/pQEM6QwWeedBh1VNc6Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxpE0RsNv/sRR1F1sEy3eBKfjQw5ooKeayV/0HLoJWzDfPzPZ6w
	eyKm9kZbxFVy616FZTA4B6d4vhXpx2EUlwhy6DHXl5waarj1SOZi3q2L
X-Gm-Gg: Acq92OGQTuFpqUhNEh8ScP3zkOKQE6VRURfU2JY8G3WoUk3C/pBTrOeKMmfsK0STjvj
	P+3xjCvm1Yri0sqVKaVj0Gmc68oz1KT37HD1DSGmhUICrmX9rR2kJqEZ+qSISliM27TcTlZB5xI
	yWnCD21yVpMCWeR7t6fkyTPmT+9Rpl2xsMlf2JyvIKIKjvVbzzNk+PTspi5pc4vNF7jtDl+KEQf
	X1ny9UhFj7HZBT9ScV4HseYb4A8hmGhRYRMtp21P+gWFUGJ/7nnBph4bnQWJmjRt5lnmfqQ4d6W
	ZqPQ4J2U/8YudzdoZZY8pzD1CJyScOgO+lCtmEUJ4UjPsU7DegWFFaYdSYf5r8k/A3Xqakr7izV
	gnO6GnoN2Z7fU4wMCA1oA6QeDg/Ixbi9N8yJGNqY6+TJ5LNdgDwZOP+emhDD44iU91bC72y7vRJ
	4rR2YB4NrwDQldYvuoPS/3EP6cqDCc/p5SWGlOA6ferY4G0JGUTaX3MDIKZwtu70ycxPh9cowML
	SP5Av6cADU1++DvUWFs2kn93KOVLQRcfHuT
X-Received: by 2002:a05:600c:81c5:b0:490:ea88:9d4c with SMTP id 5b1f17b1804b1-4922016094fmr111312015e9.32.1781538498881;
        Mon, 15 Jun 2026 08:48:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:18 -0700 (PDT)
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
Subject: [PATCH 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
Date: Mon, 15 Jun 2026 16:47:54 +0100
Message-ID: <20260615154805.1619693-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add compatible strings for the RTC block found on the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
Unlike RZ/N1, they do not implement the RTCA0SUBU and RTCA0TCR
registers. This is not a limitation for Linux support, as these
registers are not used when the RTC operates in "scmp" clock mode, which
is required on RZ/T2H and RZ/N2H due to their 195.3 kHz input clock.

The RZ/T2H RTC variant also supports a 1Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual.

Update the binding schema to require the additional clock inputs used by
these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/rtc/renesas,rzn1-rtc.yaml        | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
index 1860f0e4c31a..ea7b039a91e7 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -9,15 +9,19 @@ title: Renesas RZ/N1 SoCs Real-Time Clock
 maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a06g032-rtc
-      - const: renesas,rzn1-rtc
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-rtc
+          - const: renesas,rzn1-rtc
+
+      - const: renesas,r9a09g077-rtc
+
+      - items:
+          - const: renesas,r9a09g087-rtc
+          - const: renesas,r9a09g077-rtc
 
   reg:
     maxItems: 1
@@ -54,6 +58,23 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - $ref: rtc.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g077-rtc
+              - renesas,r9a09g087-rtc
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.54.0

