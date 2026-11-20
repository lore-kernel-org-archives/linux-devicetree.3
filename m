Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162275;
	b=TMQ6Aam/GyVUfGHYEu0nu//40BD6qRTbV2jDkJLNGgKj9yHoYJUanEV+YDNTSC5irW2D
	 oFao7o7oH+4jAsBwP5A9i0ZOq4Jy3SfkBtQoAjW6ckZ23ICPrHaxsLyrx+xCxvhmz0Kt3
	 TYcDe5YXzqFlOaQGSuvbLCAZUXUtqjAePeWTO6tAk1co1z7tCnKk4/D/H3kkIgwn3nvO2
	 dha5M34OaE5WdRsAofcrg8yyIXLf3x6pznRnN1pWM6EXYUuDSRkfCmFtY/Gfv0mU5TzuH
	 U1m0FBk4f7Pd+ZQFoA/HCVuIlkSRQ3ieFEnspg/Vq3X2L/E3TKczkikER8ALZcZ5aYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=FcH8qyBUmmRXjzVGIqxqXJOtGJJulMl1d/Wmt4H3/QIhEZ56RHpcbKDwzopebW750uBu
	 17MnlEehJUL7YGVpFbYkbS9+CrV3YaPux2OtLYtEwh5eyHX+JDomH0QI2Gljyf4h++Uz0
	 XxC6rF9BElep/5BfyBiV2TG0IQpGDO8gW51SENzsnpoRYQfxf6JKKoP4Pvq7NrVvgOAKu
	 yyOomjsTZBp7E6BwQ+WVRlVmOl8fqCcTeLAREPKcZZ3FzphLgaiNp9Fk8c9pzrzmymo0z
	 BwO1LnhEBaQSfPoRHZqd+HYeAkb3qHISvhwdGkQYUoKjYeOFBQzSm7WJ99mhs1PxDRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BARaHMNl;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51060A260E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F51060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BARaHMNl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso361959e87.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162273; x=1795767073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=BARaHMNlq26sSqV12YSvYOroX4P503BDVW70Vmn3F1ccJ5GXLuDKEGGjw5AZKmf2RF
         XMYXZC9bBgtwJLSOznWjcwaon3KsmYVlfjePgY0jBYQd4WjLYV5eYO4fbDclRsuZP4cA
         BTXlPQ8Q5eIuu5asX9LoAHPTO0dbbnal47mMPjMe6NrOPek1lnUUTD8FUNo9FYy4/mlj
         w/iwd7SZRtYpW1P+TDobhJnkD3x9mvdjtk4e/ecZ1QyBz/xVvwBkDU6h3baFktKOAI2D
         0NVwM4+i66hYaas5BnQEl1l9AMr1Qa4PemDiEqJSzdfliWwgsljhmLBuhkFU5w7EokPp
         6nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162273; x=1795767073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=rnHMSAXiyCE7hYGEXbRXnfo2Xk5oekjfgTM6j8aZwJnxX74qZk6chW8yuUBM95hSQh
         KugtzSd+eDq6BHk6H8pugCJAiJ2U2q3KTE6hJazsdP3mv5vHQfqJ9+6etvwvBc08a0LM
         huyB7FG1Qlrovodf9ruRPZq9z+Agl8OPcNm7tnOOMngN6wFTFk5qtbTBzUl/Y/zGabrW
         BTrU94CRbxom0RssK9gUqYop7p7haiVALtO83ZTTdpsY/M8m+PCFzZ92bwQwjSx1NLrv
         zID42HgAuGEg1MRfQImutdciDTA5fdKP661XW9qWeidhS3JR8y8zdTESQYZ7HUjbQdvO
         brjA==
X-Forwarded-Encrypted: i=1; AL+hErHJnvtJHzIclI4S3PFbWe0+Fg07gK075Jb6QjxmZURC2cbEjQarlm83Dkvm4aFTfr7+SwMTeN0Hwi7M@vger.kernel.org
X-Gm-Message-State: APuU4Z+2+VU/G6GzV6PXUFpvYdP4a7wRZu6eNnmQwbm5g/sC+ljIDI8c
	EYNMCnCaOvxMtJUT9Tov/Ck+LFeMk3jtkcfchRom+lXGtjKFeRwRNZ0W
X-Gm-Gg: AZFdTZfb/QPxDce24oK4sZS0zWGxLlvg9oaJdN23jLBXoLhgLqvWPY+mVkToqKpFyGb
	lnOtJBX9/03S4zsEjC3yMC4b/9fxYuNF3Z7rn8IMmzW+7Mx1t9Bf2zSnHK3x9AwHdYszBeAFrw7
	93YK7S4J+4p4Y43a2Wdit8/Q1lmJTEXzloC/ZOQofdeZQ2lZZiQhjMHbMU6SW6llHnPEaod2Hig
	mLIvumWe+batxnQBrAGN/w+4e1Q9Ce7EJc3C9w569B9R8/lS0nn72524A4Y1zqLMtuZ8LIUsqau
	hdqde4mngLh4kiLrzWafNsz4XEGiVKZ2thFEY+yRXTajUYisujbOn5h0o6gWCSh3MBzIbptchU5
	2Zm3vTJk9tQpyP0d6BfWzdXzsYqlUBht5feqRe9Hb7gKPgFFDcW5C+Qi5WYbSpMmoBqSiBhpoQ2
	OSNBlqWxb2iAbcdTJcjW0k6Be4rbTVjaKk7u8uKiSY/uZxgMDBa7SW9QsuU+5Z5EuCrxkc9gcIq
	sCWq+UDARAuE8YVO4eJsX7UTIsgVGh4rgYPpQIRNiF6LfXoYGAkNlPOg2efhMTReJIMt4A8FHyZ
	zvl7EWv/5EoQLJxo+KVgo4NaayAHQgzM7HdLX/0ae6tsRVE=
X-Received: by 2002:a05:6512:b9a:b0:5c1:acda:6dc3 with SMTP id 2adb3069b0e04-5c1bc6f6c92mr643326e87.3.1795162273362;
        Fri, 20 Nov 2026 00:11:13 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:13 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 2/4] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Fri, 20 Nov 2026 11:11:00 +0300
Message-ID: <20261120081106.2919010-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
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

Document the optional "leds" node supported by the DAP8211R PHY.

The PHY exposes three configurable LED outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..772329feda05 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,40 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
+
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              maximum: 2
+
+    additionalProperties: false
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +89,24 @@ examples:
             reg = <1>;
             rx-internal-delay-ps = <1950>;
             tx-internal-delay-ps = <1950>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+            };
         };
     };
-- 
2.43.0

