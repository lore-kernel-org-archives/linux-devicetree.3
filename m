Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7B1D5CFE
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 18:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809980; cv=none; b=C3/siJcVAXL88BiQ1e7tGmhc/RV5oyiudwm25sOJn/EGC07SlqG/2poNU4lYIV2ymqFkbHD7V4nSV8pIMhoy7fxMV57PIgDPWOxKAtQeNNN+NU8PNZHbPMyiHQI11W1V6/FJtZWh3KHLfy2kn6VV5q9JEdPFJPb2UmCqULpCj7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809980; c=relaxed/simple;
	bh=SjQizlVvoQlwYx7WQTarbRGMK4rgnbozJXcZZjxmjDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DTTSdHXYOgMqx5muS2Cz80M+UazTBTL9o/A6hakrgpAew6bUbZrmKjIuJfDlmK24AEc+RAywQXf+X47ihivWdiDMTwdydYJHN8t+DsVerOJNSqHIVZ24d6gVw/6GbHCoRG06I6/EJ8eh4mlAqo0gcl+ag5BqBlJ4tKKtbuzpOEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFyqRICL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFyqRICL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so3697399f8f.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774809977; x=1775414777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SsRmU/z4QacokfzYWB3dzaQ/5a9aPH0r69IbOen0x0Y=;
        b=eFyqRICL2RR6+ZBIdYiQzPQr7+b9lS4liImcwnxBQTw9Jdis7Aja/JXyYlyumc3Qfr
         N2elW/EhcdCUxNTeKOPMQudtHfvMxQxbi2dIpOCxGSGDyFR/QYN9dqKejq7onEKk+Zq3
         0aAMUOp4gK5/2bempGvdX9whghMs/Vvs2w2okAII5RwO+Ej28/LSZgRy65jZ4U8Niz0w
         FeG8L3qD/1A4XNXfU2pmrM/BK2tAR8A7gK4uVnkqX5mzyFoVN838bJissHPgIU11ruUn
         gBq16t9RGMMd6nASF5AWLRd7cFkJ90SS7Ar4GKi8kkH266gtcVYHFJHUxjIBTU7y3QDa
         QTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774809977; x=1775414777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsRmU/z4QacokfzYWB3dzaQ/5a9aPH0r69IbOen0x0Y=;
        b=Lic8iraL7dEUgN8aSAGpgb00XR9h/NBY3POiHg/T81jZtsnyjkhKGnWX5aX6nVOqst
         GZWLTAGI46X4yWhmDs4lNuKi7nAhRRUwAkDsFshF8tT+otrLe69IWjg2+iZYzypt0Hv6
         BPAoXkgDCivaG0iVEBRWVTwjVE4SAq+f9jHSeVgwJlNsANzqGTSwJYyJNlErfANzE8VF
         tLSVed6kxp6KNRScCxQy8w03NmF3NQylwDO/NrO4lExrlPO18l9R55GrYYP8Q+s8N73s
         6dVvNC1zq1ZstPjvDXlzQgVm9yEnwkPVDBA69ag21hQ/zoJuEswiGARYhJZgJKHBe02s
         oq/A==
X-Forwarded-Encrypted: i=1; AJvYcCUkQiIOxQwd4lou/A/lW7PGtkKfQBghVMV0skcBLd+Rn0skJHqiIzQJN2FRsy/tVM03HxuqOSymIJEp@vger.kernel.org
X-Gm-Message-State: AOJu0YwZoCHzKXfEE+46M0aJSGcvanefal0Ryvk+ic9jaQWXxU7G7pa0
	hKchL10SfMEro4Ynwe7fZdu0WHSE+DY/fxWsfORKr36HmE7fC6mPE3ip
X-Gm-Gg: ATEYQzwPtyVcsW2H9cPThCoERRE/xfSy6q/7JDlgXX+w3wTzIdfv6m5Y5zIgp/kvCuX
	J7fpP3pFcF9ies7ZDD9n1ctA+2BAkwHXP2qdXVlolr4YDFcoNssFQzNBAxUmmBkt1mmcksvZLeK
	pD1amtgCq3pJLeBmTt2kt192rY2g73HST2Kk3kZb4TNIp7uP6dmrerJObd8fJHUUgQzHl5ZYYIR
	3zzuYBd7OR+eGOXnSYdmbg8+xVPSYIRnVdD8gKAsQqMdUm8o11nIC61bjsXVZ4zyySvT9cU2HHH
	XoCEyBs4XpdH41PGsVEYYTWSewc0irQsKO9haRviPjFIoGi26BaYZcVWiIAUJUNQhRWLOrjq34n
	qegJ9TpnBm41mAjE0LE7S8QHwRLDxrtLb6USGVOcwv3U74WwvXbhnKwHmVeqYN42plua29RC8Dn
	C/vtuP7AdE9K7M46Mj6wM2+Js2P7Hg/7pJJzTgC++FIJkGunu85DM=
X-Received: by 2002:a05:6000:420b:b0:43b:3d80:b0b9 with SMTP id ffacd0b85a97d-43b9e99734dmr16186904f8f.12.1774809977231;
        Sun, 29 Mar 2026 11:46:17 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257cbc3sm13108290f8f.35.2026.03.29.11.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:46:16 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH] dt-bindings: rtc: moxa,moxart-rtc: convert to json-schema
Date: Sun, 29 Mar 2026 21:46:15 +0300
Message-ID: <20260329184615.454887-1-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the MOXA ART real-time clock text binding to DT schema.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 .../bindings/rtc/moxa,moxart-rtc.txt          | 17 --------
 .../bindings/rtc/moxa,moxart-rtc.yaml         | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
deleted file mode 100644
index 1374df7bf9d6..000000000000
--- a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-MOXA ART real-time clock
-
-Required properties:
-
-- compatible : Should be "moxa,moxart-rtc"
-- rtc-sclk-gpios : RTC sclk gpio, with zero flags
-- rtc-data-gpios : RTC data gpio, with zero flags
-- rtc-reset-gpios : RTC reset gpio, with zero flags
-
-Example:
-
-	rtc: rtc {
-		compatible = "moxa,moxart-rtc";
-		rtc-sclk-gpios = <&gpio 5 0>;
-		rtc-data-gpios = <&gpio 6 0>;
-		rtc-reset-gpios = <&gpio 7 0>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
new file mode 100644
index 000000000000..6b8f6e5f99e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/moxa,moxart-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MOXA ART Real-time Clock
+
+maintainers:
+  - Serban-Pascu Robert <robyserbanpascu06@gmail.com>
+
+properties:
+  compatible:
+    const: moxa,moxart-rtc
+
+  rtc-sclk-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC clock signal.
+
+  rtc-data-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC data signal.
+
+  rtc-reset-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC reset signal.
+
+required:
+  - compatible
+  - rtc-sclk-gpios
+  - rtc-data-gpios
+  - rtc-reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+        compatible = "moxa,moxart-rtc";
+        rtc-sclk-gpios = <&gpio 5 0>;
+        rtc-data-gpios = <&gpio 6 0>;
+        rtc-reset-gpios = <&gpio 7 0>;
+    };
-- 
2.43.0

