Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761445;
	b=M/4I/tytQo4i671B30xi5EiFKQliPo3Or5KWbPdsQj7DJhM1tERVnmO30aZ8NgVIPZoR
	 yIK45A+B7ioSn5O8RQpdX1BMuu7Z5z/MxHjKsMcJnwETJMXCe+j3lu1ZXz8YOeOoHfCkB
	 CdSgabSQiHCDsh4irpCujIoKG39u64NbupzSoAbV16wCSPHTIjvDjpCltVtO8pPAyud//
	 x3chZUQsbNtBBOcEprgCK0ouXhGJr7A2U0KJWpSZoEwUyFdvjD16OQ8b464RTscWSAaXn
	 v4CSI79p0oKPIBDIjQual0T3fNlE+DGeYazyFHfbCD6hX7YSGcC3Nuz1mMJ/xJWP23g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=t67CAIxA8IlrHGlEu9Nms/vGmD7u6uLeAPtbvT0mzKoz/wSAq3PY20eOrQ+ChIw/VbKo
	 Ric2CVT014H163qu1nfLZFdzZf6FlVR0R+PMR3IalimEq/dIT3Nhv2+AEDMgG326dIQm5
	 ZaTuaVElJVfWTzFiiHzJzARk7w818Rrwp5fG0GrjwE0Kwo4FoYH78RQwsTBka3w53xRzC
	 mzX7b4dQKlaG2dWvE3AgT32c9ql4gCMM8U7mEOGeQNUk03uz5D1z3dUfPdCOmB88rRQu1
	 rhXt6BJazNIOVpGWtDjTTQHouqknAAyoZj4y8eSGW3SwtQND3Q16DS2Z3rPLrKV1VbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbstO9eA;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D7606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbstO9eA
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab4354db11so76942751fa.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761443; x=1796366243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=JbstO9eA44E3bBWgMfke9c3iAS4NCqV8AdRs6I+r8195W90yk4G+cM0lHvrsM2RGLY
         fVLIjmdyKg8cJPUyg9F6r7Z2zSOE0Pcg4/4D4OyOl/TAGDAYBU0nptGlvgko9e9PUYdD
         PDG6qsaQul3sXhXdMxWkkIYNv+QqEU/32ylJ0uhoioJEWq03jUJqFbmG5weCg3toEe74
         JuaslaHwfnCi3IMEUh9Sh87FOEyiwSsLXJxj5svnEy/nXwzP20/k3NmD+C4JzTZbESwg
         BOf6+yVq7my7WLW8h3q519c0PbtFIramMTL7gF52B3R47qcoVGe32TI1fiO8fMONgSqf
         cYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761443; x=1796366243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=tK/qqx77xc1MURBvWkSGmHysfgTLOy9Yob1YjqlGfYwwppRj6uB0s58TLclHBfmJkN
         xC/iIuOYxW0T8lM9dlfC0pfSKaQxwaqdLIX+6TnjD2BYyT+M3FON8oRkH7YvhzH7qJKp
         lk3AEvXbXEa5esp1pKyODJUwG5H7MKyhdciXs+GNxbITG40l+TDuneLL44TFUe1yKyOZ
         jMOAZ4QUPtNkIm9cHVfZHImmSUUs1//9rudz8ShKCNspQH+7iI8RFbHaxY1gnQ3dzw3k
         a7oVX3DSFmf9zwH1TH67jsxYFy+ZeNDp+yXx5UXf3oy7zJzu2VwrPucJtBTW0xtSCix4
         /VZQ==
X-Forwarded-Encrypted: i=1; AL+hErG7noVNRoyOg6oLlyNg217/nNDpSdtXOCZ2IlVLL4Y/5xgActOQpqYfgnzDaNqMQDspDqn7OvS/UqcC@vger.kernel.org
X-Gm-Message-State: APuU4Z+8WH2tLcHmygkXaG5zh6BZOOPDoW79bPVxbFcvER1K40a8w5RQ
	8GqLKblEFFG4Ve/TYxgpMKRYKyztkXjgRZTuqQNEySt0NGju8FTr363b
X-Gm-Gg: AZFdTZemyhpL+KyAFW4OcbPnVqfzvP3A2mCYbfmupzy6IjE0ABPDYAqjljvWjJJ9zjr
	wGpw3kAFghNwgjXu76Kp6D4qqsIduTrGckwZG4rY0f9tfX9f1W/6DVRbD/Wy7aCo/K1pWqMmwl0
	wUCWhkUHQCacYufq8OsZx0rF2sUELedVnmiNn8iJR2J9FedFAzIyRBymk3fW4sXCNOgwbSmBTIT
	AQUIViyTQNax513HHa6T/JlkXYNkSw5y61teA6+9nL9ssVxZtsKm6q6EnAgNvyePsdt62b6/3yh
	3Xzs7uJWSmE2OcbGPR/57J4RgRoCWvkklkkI7hoapGSkp9aEx3oht45kjqW/YfqAO+pjpHwYNp+
	y7ngZQ2pGQR2X/m3DUHapxEDXLgRDwx9uYkWUUm/u56Ov6J7d1mLxpHLRUM2Wd/mPOLcqo+WWxI
	NoZRvBDZtRYlBTFiC7RgH2h/70CtbX0Jx2lU9R/i3UH14Z9yPHyRnF/A2fODTT5H8G//2cSrMIw
	SZgI7yxe7Sh9LWOKB6obA7AfA/R89718LTfMhSfBRU5pxPrC///sXZN13QXesQ4mK0eWGgNiW9g
	+58Rz8F2q3TFghHQb239TfbpXOGirg==
X-Received: by 2002:a05:6512:3c8e:b0:5c0:ea4c:faf1 with SMTP id 2adb3069b0e04-5c1bc6907e7mr6613134e87.7.1795761443064;
        Thu, 26 Nov 2026 22:37:23 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:22 -0800 (PST)
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
Subject: [PATCH net-next v7 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Fri, 27 Nov 2026 09:37:04 +0300
Message-ID: <20261127063708.3074433-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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

