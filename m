Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631873;
	b=DtyojgGcfGBGqqxXgfdH9p5Qum4zy2B/tlTA9q9qYykra1EHeRV/oSV2ivDnNkcrGjzR
	 Y6rikd+fuGRMki+Gyd13N55Zujcuq6o61+0Mp/j7asWaC5WhWdxspKQigEVysUzNLllCz
	 PHlbR365Sj0C6MUX6rBY3XhTS1dVsP5rUM0AAWCU2DWoWx938qRhImSamCGFe36f4nAfq
	 +IZ6bhTXexB41riAcc6hcBBpC4QAVdYQ5XsdAFlC1GvJ2ArC3PIrlEVI9aUu+ipQ7xr8a
	 E2nQ61rkFsAUVqrcQdtfoQm39ElaaEIiN5qWkeGm7vqNflel0rWK5VFyl8qlfD7gvZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=LV4B1Ia98DrhpnGWNJgH2Sz9wiiUv9sikSfLfRL1HQ57/+tWZ8hZCTQbsqVEmzXXRTRG
	 Kd5287pMPsFV6v97Fi1+LZJ8qdEI08ESxKUB0Im+9UunClx4Bc7u9zQEbfeZLnFI2CeFg
	 984/418VNt93WWJs8fsLXi71QAyBP2SHj1cVeSc1HfOYATa7Iis7YIFzRCgNtxVykhR9l
	 Wp8UXgY5ePpd2ZbZw26GpQcAACV1PYue2GFXjiEgN+xP5ucX9ULCWpixQTOcV3v+nvwsq
	 I7d16W0045ROXp3pvFmuBaYFAcw+i29DT9GfVEn+UeiVCuh2JbawGQIpeXIbA4Eo0Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4wfCvfS;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F287E606A68D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F287E606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4wfCvfS
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c31369ae36so1903502e87.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631871; x=1796236671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=B4wfCvfSF4jdXEA6kj/yuB2UxAv4pDDqE3JiwSoT/R0UrRzx8nIBRNFumcOkLeNfcc
         7ODJ9+MXj6Zn3KDW8YTaFITvTt0REXoNcKYEOpXZR+jGv+yLHsF8rdlJ4uqLr3zMBdXi
         qNZBQNGJ1LRQ0Gx/Nltz+w0nBvGTnNHCfLKlda723KPJvwW9uJe4O5yjUZ8OdxjIAB+0
         +FFL7sk3+IuXJBagc0IBqo+q1tT/ZJjv5+Yt09fxgl0fH0ov/wY9EoFzldAkqypbq5ms
         ONLrZwLX142EZcRWCcwY+B8KX7AZeRiBzWRQ1+ShyU4jotJhoU6x4ZKYYwJXxGbv7kAW
         ZYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631871; x=1796236671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=bedJpGn0q7H5WqzNWifEw91jJd/qfzGU0hMYHorT7GfUw1BDIGbHJGFYY//U7BcYGL
         veAuPajwb4+tLgrhdH+/G5khnNvmHIEvx67h5wnwBdVGzQOLJUT5E+pSeFCqxVxVt1b1
         1e8TIDIRUYEEOiFbqDeVd5C2z32ti+0R9kAcMRVkk0zVOL30Z4DvmdkdRyix4/f3vjrk
         Hl+JWp4ZVYdTKR4afxAnRp+yZXA6aBHI+QcGnsjzvXOqYME2neuBJOASrIItGca3iwk8
         zw6fdP5pHYPcrFzy7LsxKSYPn8JGEm3a9/VVLHc72pL1BCHySiLzwpp2prBBuVd0+y7U
         6ugg==
X-Forwarded-Encrypted: i=1; AL+hErGz4LSTu2GykJYlklFQUNSeYl8aA0wwUCVQwq19rc/W4pI13xaxJ2/dxCari+jhmjlgeyGvU5BwWa8y@vger.kernel.org
X-Gm-Message-State: APuU4Z//2pCAojFmcgjsX97FtRHAMRLJzC18FQ69+KEZccHnU4exFeHA
	wEywV1mqIGMdx05Brh5LWgkKu5RmRWMWwXey533lipf294aB6eTaxhrr
X-Gm-Gg: AZFdTZdYzESDApYNp5LzbNujqOd775o95NbT/xhzB8t/lQ2JELJsbfql1oNfglGqTAq
	pb3lCJJZqkZMatZ9UfNXX9pYFdavELyedPKmP3MjyUK4ws8VnBCKT3COBx+tK5f6mmruwNUa9LQ
	sXlbYqdleKRxNOXALYwMpSQPploT0VzXjq+fuwjJlIhaB/fgeWppCEkaO5Vtn1H571OJxLylcka
	nCEOuE2R8ShwFO/kb/ZI/bEIywCBuPzluOY74wkVoIdu0JCcuq59ZQyoZMA21u3nSmiy9tUOCGh
	Sx3mZENjxQcsN0IVtmlx54X2lh8nExhfxBDIyWo1b7BkQobmb3M66/YXeGnec0Rz3+ysYBvAT8O
	3R+jc4UXrI9MHdzfCwF/+VPf3W2NKjbyCOutUCHqlv2Rxw7JI3kwGBs9Tah8p70JTx+rVcbW87a
	o4UyohHIr+ATwT8tfSLhQO3mFbB5S2m86FXm8BDNeKMM5c2uhkg5OEmeIIELAacFLxinbmys/ts
	U2EdhcQc7Nw3siROcFUS2v/381Dq4qZWflBFCocJ1lDnRq+jmNFr+lUadXCPF9ofD4TQ9P9WZzv
	6EBS/ZuAm2r/WZXlLdsJRH3JdYxttKykvu5Z2BhefSBdj5L9ZScpSngpIJMA8PEMNQTh
X-Received: by 2002:a05:6512:3a92:b0:5c1:4c4a:f018 with SMTP id 2adb3069b0e04-5c1bc6d25dfmr5683691e87.4.1795631871079;
        Wed, 25 Nov 2026 10:37:51 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:50 -0800 (PST)
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
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch
Subject: [PATCH net-next v6 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Wed, 25 Nov 2026 21:37:37 +0300
Message-ID: <20261125183742.3039752-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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
 .../bindings/net/dptel,dap8211r.yaml          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..84efee27400e 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,31 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
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
@@ -58,5 +80,24 @@ examples:
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

