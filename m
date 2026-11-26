Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720768;
	b=HxHZNjYgumHMY9DSw8AnBkwd76WEw+qrqMpcSKsppoD3S1XZK+T0ihX2zMpHJeHrkNTf
	 bryFKNdAsGNOdviE4sqqCZ1u76bj3w7B5NGUgf7PGhRrEYpFpNv/xFym43uJ/JlsFEy40
	 pVPczuxlJuN6mZwt3LRvvaqGZARyGWSIxnzHAm67ZdtQofdhYMA9aMfJpsuQYLT6TGYUS
	 q/XGIRtH2emubgNVBTIFuwWc3JnhyDktpZdK1ll/0wW5BxpsR5w6XtwGzVcKPCT/hqhyk
	 A2QFCnjaR5evvOR3h7c8iuHAQk54Y0KfEdHETXQRyzjaYJNQwBNPljVapbCgzyLxpLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rkm7nMrRKwRzVgmhVYxHUTIkns0RjHhFy2fC/PXx4iM=;
	b=ydqsm30oxg6oSSYUv0nCktcMV/agnk0NauR6Eoesbp0kWaLmwa6wv3pNxT9BthLxDk5/
	 9LXN4x8oFuFxiqqls6hfF/0XJiUZe44BWl7LgpnMouW4OgILeKifKJzw6XwCGd/RcC63Q
	 kYxijisolZZrp2hiD+h9ZDqLGP0niebWXhyhnAlkGGE9JjmGMSO0+Ndn3MPmC1843oHiA
	 hFD8PiP0E3Q03jUmpnb4IwX+k7yAqQfki7/lw3blJHHCf+wFC/HJjp3er/9T7Tz1XYXvS
	 Bh55sZExnWiozQX12ku+JgaSbsscR94MJm/AIIvH3I217+Admq6vY5GJsWoZhUWX5QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gG5GgK5t;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011AE606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 011AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gG5GgK5t
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so11146505c88.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795720767; x=1796325567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkm7nMrRKwRzVgmhVYxHUTIkns0RjHhFy2fC/PXx4iM=;
        b=gG5GgK5tth8He/HzZX0vKu6b7/SEmvGf+sNooZWdZl2sxYXUlsqrErMtuxcfYDHsyF
         f04R7qbe/ymvqDNFWgWgAf/YJCCtAYD+fVoGhaRlXY1zfzuZuLjwYRe8qJZDsXI4Z6gS
         R1iMo65zbw/w4YsG8u1GuvjbW4qBlcoUdhwg+Udlcx333870hiAiuCzPf8Ls8ief+/vR
         BtecmQsXmexPv9CSvZvYpBmJPmVmXGfBOvAj6/55Me6UzpsviLL7zUkaqicVMyReXb2N
         jHRyr1kBTr6IDTmpJiBO5/c9b50GdkYLC0T80zFbrcPhxuljMP4jo5/z7mmW6AvHWu3m
         V/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720767; x=1796325567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkm7nMrRKwRzVgmhVYxHUTIkns0RjHhFy2fC/PXx4iM=;
        b=pq0UzeoehMAFjfKZDOL6URJjHPr67TNTkEKBYJ+trmrunCSZbLw2pud9q1e4nkBfyh
         cxuRzaio1s6r4Hi67jBYBHPM1EDFCaN5dG8PQwi3AApQBGOmkH9o+2yi4PJvsjXGFop6
         I/F0uNAkbE5/QBCdSByAslebVSTtuqIL2QPO3H86s40ZFh1MigOLsNx5dORdPTyq54LH
         HIJ1pIwK3rtZZLYRfRzkyiWNS06d+MZL/hhFhf84nUBQ0Sf+QI1BQhKu9E5kp7eCdGlw
         gc7KK2cQPwHbcVVY25HtpSW7pvKMBhOu4/rmbAm8TWV/UwWAYVRIUy/bUuVUv3UhFG93
         9kKg==
X-Forwarded-Encrypted: i=1; AL+hErFHkf50irTV7nbRXVwOQgF+2Kck9tjdT5HnPEFHnH4sJ+NybJy8U/OEHo7suR/w9v+R28ESMTJFs0lV@vger.kernel.org
X-Gm-Message-State: APuU4Z9ezluzKY/f51dSlLs5ci7tgmo4kijT5/Mr+cT6ai+Prr4rvN0h
	idget33Aa+ldoiv6fdnmr84DJDI/59tymhQMchvf/mzkQPybsosKRtzY
X-Gm-Gg: AZFdTZdQqZHJo7XP1cVpgdybCxwmRJYLISDnfYY73HcWwjh12iGtvLEo/i5MQ08uoIb
	dTrSHbovv8MVh0pGy8dI2e9yxSv3oYsollkThpZLIbJjF7f/Xq/Uc9cg9yQKGHRtLaG3O/xJBML
	xbE2MG3W6DQVxia4/Mtr02ZilzJ72/73W7hUQJQ67pHBqJHvo3iQ0MLx41GPGXKS8+L+HQw/m2t
	EK4ptBcOfd/sjwWtUlIdgcWv6QR5nhRM+HvHNQxWm4F4292vtR80uW1zsr4Yxj4itEYd3uwSGH/
	cbzybN3u7ux8j+Zp2eJOfX6VFK4Qd3hXPcyXesrMHlgSPJuhrQjh3ClpCEXWwnoussZfwFdBqZn
	qQ/BXgvO6LL/NKv7gT2VXtzLmkaTwE8g9SLBBs2kbnn8rFHCcww1GeJAniEUZcvXKWEEaqMLdDI
	4oORos9d/Ji+TIs75281viNLIOSSzcqyH8C6V9GtnrsEHHEqzL2x2kS+EucpJE2tKemp3yC3M+o
	2tbh0BU+Y0EJcrcx7LnTllOURYHcOpAEei+A0h+AhSHubnfUHiyrvca/N9di4TL842BkPiwMmdp
	KsvQx0DRC4aM1d/ngCOSAtjwtfKGD3/qh/VNyK8wHt73uafg
X-Received: by 2002:a05:7022:3c04:b0:188:e51:e86a with SMTP id a92af1059eb24-1b5567dd1c8mr17611027c88.2.1795720766907;
        Thu, 26 Nov 2026 11:19:26 -0800 (PST)
Received: from mrprachoday.bbrouter ([2402:a00:402:9f97:e752:d178:849f:9d04])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm61339786c88.5.2026.11.26.11.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:19:26 -0800 (PST)
From: Prachoday Sutar <prachodaysutar7@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pali@kernel.org,
	afd@ti.com
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prachoday Sutar <prachodaysutar7@gmail.com>
Subject: [PATCH] dt-bindings: power: supply: bq27xxx: Add BQ27Z558
Date: Fri, 27 Nov 2026 00:49:06 +0530
Message-ID: <20261126191906.25708-1-prachodaysutar7@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TI BQ27Z558 is a single-cell fuel gauge documented in the same
Technical Reference Manual as the BQ27Z561-R2 (SLUUC54). It uses the
same standard command set and register layout as the BQ27Z561, which
is already supported by the bq27xxx driver.

Add a compatible for the BQ27Z558 with "ti,bq27z561" as the fallback,
so the existing driver binds without any code changes.

Signed-off-by: Prachoday Sutar <prachodaysutar7@gmail.com>
---
Tested on a Kneron KL630-based board with a BQ27Z558, using a vendor
Linux 4.9 kernel with the upstream BQ27Z561 support backported to
bq27xxx. Voltage, current, capacity, status and temperature read
correctly through /sys/class/power_supply.

 .../bindings/power/supply/bq27xxx.yaml        | 72 ++++++++++---------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
index be0f1f729..28b04732e 100644
--- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
@@ -18,40 +18,44 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - ti,bq27200
-      - ti,bq27210
-      - ti,bq27500 # deprecated, use revision specific property below
-      - ti,bq27510 # deprecated, use revision specific property below
-      - ti,bq27520 # deprecated, use revision specific property below
-      - ti,bq27500-1
-      - ti,bq27510g1
-      - ti,bq27510g2
-      - ti,bq27510g3
-      - ti,bq27520g1
-      - ti,bq27520g2
-      - ti,bq27520g3
-      - ti,bq27520g4
-      - ti,bq27521
-      - ti,bq27530
-      - ti,bq27531
-      - ti,bq27541
-      - ti,bq27542
-      - ti,bq27546
-      - ti,bq27742
-      - ti,bq27545
-      - ti,bq27411
-      - ti,bq27421
-      - ti,bq27425
-      - ti,bq27426
-      - ti,bq27441
-      - ti,bq27621
-      - ti,bq27z561
-      - ti,bq27z746
-      - ti,bq28z610
-      - ti,bq28z620
-      - ti,bq34z100
-      - ti,bq78z100
+    oneOf:
+      - enum:
+          - ti,bq27200
+          - ti,bq27210
+          - ti,bq27500 # deprecated, use revision specific property below
+          - ti,bq27510 # deprecated, use revision specific property below
+          - ti,bq27520 # deprecated, use revision specific property below
+          - ti,bq27500-1
+          - ti,bq27510g1
+          - ti,bq27510g2
+          - ti,bq27510g3
+          - ti,bq27520g1
+          - ti,bq27520g2
+          - ti,bq27520g3
+          - ti,bq27520g4
+          - ti,bq27521
+          - ti,bq27530
+          - ti,bq27531
+          - ti,bq27541
+          - ti,bq27542
+          - ti,bq27546
+          - ti,bq27742
+          - ti,bq27545
+          - ti,bq27411
+          - ti,bq27421
+          - ti,bq27425
+          - ti,bq27426
+          - ti,bq27441
+          - ti,bq27621
+          - ti,bq27z561
+          - ti,bq27z746
+          - ti,bq28z610
+          - ti,bq28z620
+          - ti,bq34z100
+          - ti,bq78z100
+      - items:
+          - const: ti,bq27z558
+          - const: ti,bq27z561
 
   reg:
     maxItems: 1
-- 
2.53.0

