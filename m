Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201191;
	b=zc9b5R+IBP4OU7jn1B+rCgSMYi4JB1AYpItqx/44k4PG+UmOPzMtbKX1ye1n3us9cAVO
	 EUSc7JoriK0IIZVU9F0B8GGum+VtkLGBnFPMmprPxq/8AN3wmib/ulrUlN//mpN7wHaYq
	 ZNfteflevnyBYrkFUaebsMiik8+z6rNVko1/yy0O17Va2YUGBXD7aApZM2N+2LMkS5O+D
	 WIfaaZqmTZv0BTJwzMnQMS4/LqOYU593XCaubh5VTIEqhUc26g3UN08WFn8yOJYmBmH40
	 rKHqLeAFC9VzihLCBs9m7ZO3MgYKf1Ar73XAstgRfKuz9n4YaT+PaUFmc6bXM/X3Zhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
	b=rbUQi3+/qCZ4y71zjzKfg3mOHkrPaG2S/eRv+EyfrrhN8f38WXVa589Uo7AoCW5JKxeu
	 oHw6jLtE3oZ6XBRLM1ah5UW8wda41eLtH9S5cMjE/OtuPbr32Xwb53MwLOudbpCTgfvXl
	 8aplXo5s3v/7mO8F4FzzTW0+DYe917kCZFcQ+vXj8kBOVNv+ROFQXzVdTOiAQWtMjR2bf
	 mIAvv5r5+VJnQM28QwZBIP09CLWDH1Zvb5LndMrdOvcwfzku0+cq7aZjNKHVMXJ8c9ih8
	 hZIE7I8jCVP2Ky7gj7UlclCdfoKWuSA4JQq7cA5IwSKCQkoldC1rOoR3vBjh3jVarlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxkcDXGO;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3E60A3801
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D3E60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxkcDXGO
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c51239b0e3bso209152566b.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201188; x=1795805988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
        b=yxkcDXGOasir3Qy6rymbwZ/6dJ/Um58rGBpB81H1qg5RNFLOoQ6GK2AsCGxDtL2CJo
         oJ/y2p/fqn3K01f0Y9rTNMQrS/undGrlx1eJJQaLIFC0tLdFy7wohnRbz+aPQ/fuZ4eh
         zMsVRxYMA67xJ99I6j43TSyT5zA0divNQF2ntlSUYeOqyUUyrC1gYRE5wBok9kkLan97
         Guui3O+gNwH2afkBdz1Qp6BXLpm4AVL+qwhTyQ0PTn0XyfFCN7QBQhO3t7wR5Fi671BE
         JZE+WjePQDzRUmsKlH3DVNkATh8GE1JYn2baRismgDLTBTYftBADchLio99oNKSHZGq7
         QDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201188; x=1795805988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
        b=WdXzfFdOT5+cR+yF57CIPPcnR1z9K7fwcRw8mF7/fYm+B59dyDItuGTzspKIjPRf7E
         6w3D10SWjQTsDDmHlXCUlxHFQ0JPDfOzwonpQiQQ85IR+kcd6XTkyvKEe14FXGo0C1oC
         QpS4PNhDiKPNK71yyYeVMqFF7b8/LWeqgGeiEfbKEvGSoHGMiHAdZay17YGz3lRYRcN1
         zd93tqU6Da0JvTHf6u8BobvNLr03dkAOITI2o1TLzA/ZuZC0sk36mJJfmzHSi+cFzf4B
         wobkt8iaeFHDFM1G6D05Sls5IqfIGBGA2zsyHdG1mJRN6Lu+0BOC5yT2t4cblohQIlsA
         Qk9g==
X-Forwarded-Encrypted: i=1; AL+hErEflh433HAE7d2o2YHrdy7we07hDIijn1u8U0m2b7eORaxcv8N0lWcrC2o5MsuBmigk5B8rv6JAOYSK@vger.kernel.org
X-Gm-Message-State: APuU4Z94v1NVzJO/T4SR/HYnLZVWNVX62ScqbUJ5evzEa+kL0n0a2my8
	4LUzsfzo+doSXdtNBLkZNsWChXNrQ7wNEchTJUFvVAQimD30gEeTyDi4
X-Gm-Gg: AZFdTZcCYK1MER4NDAh/NfNyMgM07H3uD+OfOxcZiavuB6bm8nE+k4HaGNCIaTtkFkv
	72qiuxMc/AuLZBtYGeUos0WQkWHpxtPA0KBmQ5Cpos6PHB4nqFAgPxXuroiD5QSe014G7yaxAwM
	f1B//NZlPZXIDMuCoBW+mg6GQGtIhRKges9TXKLWKRSfIQOAKjHJUM3cImLD3hx4MVAN56bArbg
	o+7LhDE7uP5FGg6Ca4Sy+Xc3j5YVLD9QTklWXkbG1TZ4jl7+aEFRHrmuBEEeloLmf3W2MyPYJe5
	NkoEhTC/itRf1RGw7Gu4h0ylchTYbhbS6BtTVvwVVqpRcPfwviXKKB9U+NeGE0jgDNHM7Ark1Q2
	2BNswGHxXm35+oTC5C+/rdMEf053vYPG681fUYofP2mBngt1v8KFlufBNnV9Lq9OP1hvoqj1kCu
	qkv44av0hp12tIZH6+4CROWf7BpSG9C/EiNBf7MRlI6p0dw9Zf25mwUGEHmFBaUub9CUxrGEN1G
	Aat1NetD3mUc7e5M9CEAwsV6Tj1wmc/8xA78Z/1GVe/CdYhEhfDBaYwJ8ZQs5ZCpDOc5sFjsT/K
	2KtHJzBTICkzDBTUy2yyaCDzEdvpVUegG2DZ6aK5gVFpEDa/tWBZNQ2hSfoUfw==
X-Received: by 2002:a17:907:a890:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c513ab14a58mr450503366b.32.1795201187683;
        Fri, 20 Nov 2026 10:59:47 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:47 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Fri, 20 Nov 2026 19:59:11 +0100
Message-ID: <20261120185915.150228-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120185915.150228-1-apokusinski01@gmail.com>
References: <20261120185915.150228-1-apokusinski01@gmail.com>
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

Document the TX and RX DMA request channels featured
by the OMAP I2C controller.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 58d32ceeacfc..ff946fdfaad3 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -37,6 +37,16 @@ properties:
   clock-names:
     const: fck
 
+  dmas:
+    items:
+      - description: TX DMA channel phandle
+      - description: RX DMA channel phandle
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
   power-domains: true
 
   ti,hwmods:
@@ -93,4 +103,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         mux-states = <&i2c_mux 1>;
+        dmas = <&edma 58 0>, <&edma 59 0>;
+        dma-names = "tx", "rx";
     };
-- 
2.56.1

