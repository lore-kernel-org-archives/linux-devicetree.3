Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080771;
	b=I7FFOKvGG4sax48dUP0kUcV9IJm/OLwm8EigQiRLoYSU3rmXP1F4VxlAhXFIy8GaDtGT
	 heAszmfOPitukI7hxEMjQUoG5Lns2NeByiOZuTm152Bg74Xp5d/6uuABum7MpJIRnmdui
	 Vc5qPBhgPMtWYHcUmIMDVj49aGkAR+PVRKdUUlGiKQKN7ZQV4CfQTbhdRoS9J6/C+7wqn
	 GCPZIREV8hFn8tmzNMY6VZ1ZFox00ht3RMBRyJsYsPe9V7BntVWA4EWSIn/c8L8+IpeS2
	 CpAKgYMLabpN3alvMg0ZK/CqBNgjD30eNPmlN5bvB39qlT7UFDwHd09Tv/a9RTR5uJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080771;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5SIbCKLbo1w8YGh5oVXw76cVvhxNyrnILNLSA5WrO0o=;
	b=ILuL0ldY8ZBxzczELs1qxz7cLkxIMuVAsuBa2pEP8AwN2h1tOMUxI6QIS6lGs4EcEaR4
	 Duw58fHZtJ53xQU8tUUn4FwMxGWHsKmQc3+nPutNvJqZsS5iB3OqrTeAkEk+gnViGp5T0
	 B993cJ6bqcC10E+1JYlJ7ppj7QGw4QfqsLqFz7MaxR88hx+SByFRptoNu2ORGQJURdni4
	 r8D/KTGfOEefUpqP5U7LqD6Dv/D692TVGTegbi43N+wrbME4BUYph5C36QfDTw/YFmyYV
	 QTnD9jp4WiMAGRl2X3A216oTyYljImd+MMdq19PwUmMx3m5mOLax/7fnMSN4EA6A8hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE63F60A2600;
	Thu, 19 Nov 2026 09:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE63F60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 19 Nov
 2026 17:32:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Nov 2026 17:32:40 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Thu, 19 Nov 2026 17:32:35 +0800
Subject: [PATCH net-next v7 2/7] dt-bindings: net: ftgmac100: Add AST2700
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261119-support_ast2700-v7-2-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
In-Reply-To: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Po-Yu Chuang
	<ratbert@faraday-tech.com>, Eric Dumazet <edumazet@kernel.org>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "Eric
 Dumazet" <edumazet@kernel.org>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>,
	"Conor Dooley" <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795080760; l=2882;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=z/jDVnt1v+IO45QABPbJWPByU6w41vsX/US31ZBKHIw=;
 b=xU5SQTSLFYMBZuVJV8GUgRsbo4aNqULqZOEZ9lkWGmHD/6Bnn3m5k6Qf637BvdJH34sP17053
 uyR853gVOwWA6U50hq0bTtEOC7NAbQBGNG7aGKZALL505hS7VhATG17
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Add AST2700 to the FTGMAC100 compatible list and document that its
RMII RCLK gate matches the earlier Aspeed SoCs. Allow the reset line
for AST2700 as it follows the same reset requirements as AST2600.

Require exactly one of "phy-mode" or "use-ncsi" in the device tree
when the AST2700 compatible is used. The driver only enforces
"phy-mode" when NC-SI is not in use: ftgmac100_probe_dt() takes the
NC-SI path before ftgmac100_mii_probe(), where the AST2700 phy-mode
check lives, is ever reached. Requiring "phy-mode" unconditionally
would have rejected the valid use-ncsi configuration shown in this
file's own first example.

Add aspeed,ast2700-mac as a standalone compatible, consistent with
the other Aspeed compatibles.

Extend the per-compatible clocks/clock-names validation to also cover
AST2700, since it shares the same one-or-two-clock layout as
AST2500/2600.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../devicetree/bindings/net/faraday,ftgmac100.yaml      | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
index 9d352e3686aa..95f4993939cf 100644
--- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
+++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
@@ -16,6 +16,7 @@ properties:
       - aspeed,ast2400-mac
       - aspeed,ast2500-mac
       - aspeed,ast2600-mac
+      - aspeed,ast2700-mac
 
   reg:
     maxItems: 1
@@ -27,7 +28,7 @@ properties:
     minItems: 1
     items:
       - description: MAC IP clock
-      - description: RMII RCLK gate for AST2500/2600
+      - description: RMII RCLK gate for AST2500/2600/2700
 
   resets:
     maxItems: 1
@@ -79,12 +80,24 @@ allOf:
           contains:
             enum:
               - aspeed,ast2600-mac
+              - aspeed,ast2700-mac
     then:
       properties:
         resets: true
     else:
       properties:
         resets: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2700-mac
+    then:
+      oneOf:
+        - required:
+            - phy-mode
+        - required:
+            - use-ncsi
   - if:
       properties:
         compatible:
@@ -105,6 +118,7 @@ allOf:
             enum:
               - aspeed,ast2500-mac
               - aspeed,ast2600-mac
+              - aspeed,ast2700-mac
     then:
       properties:
         clocks:
@@ -124,6 +138,7 @@ allOf:
                 - aspeed,ast2400-mac
                 - aspeed,ast2500-mac
                 - aspeed,ast2600-mac
+                - aspeed,ast2700-mac
     then:
       properties:
         clocks: false

-- 
2.34.1

