Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3018330B01
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428445; cv=none; b=Os3niz7hT8Xk6+Yruo8KJcxRCV6Pms2IyOVv2SacetrGI65DnZGTOczMeBVVorOVDr8EoN3PbCNpKM0JF60YK9dmOBMmVPpfuveTTBEchxQgKwsc9/d1b4u+RF+5gGLCvPB9BQ+kuknFGXCggZwx+gPBomDh3gbENkxboSVYqfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428445; c=relaxed/simple;
	bh=ztL5qrDQmt+89+QpvFC3jkjAmOts+inzbS/It1L6Fjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qCnpHDzdVXUM/JNHQubQWN2/REExq9qmOE3b9/I+mD3VZovyZa/O8JiAg6T/i1zSDiN1oRWhavQkjIOWE+pw4V8wgzuH4s/4IaE5pPl1x2JOpomc/GoQPYNyCWMrnTZ+wtLFVN0UWwvWVlHTIE1oCkKl4Vm6Qv1FGpbNJ+c950g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPb/eT5Y; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPb/eT5Y"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b0abdde280so13406875ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774428444; x=1775033244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OxEr38MnvqVqZ2J+GW/5gCOfjo4fanfd7DqD8+2VV5U=;
        b=HPb/eT5YmLRHBcFT1ADW6dSnVUPKYZOmZ/jx5vRRFNvbiEhw/aqnllBJdR4Z26ZVbs
         nLYiQweCsrxPuZRjClswqmi/MzRRkst//rg/Z161stdWV9lIsJO3i6hvkNRnknp8I/Rs
         hZyIz6HCyyYC7hNRSl3teBEOQqJjZg3NHS4A4GZZ8Z6F+tUS3HFQzcac/nm76xMNiXry
         0gjMI+xjzKyEflJ5m0/2I/xXjMgU/Di4JpzJaQFmx5XzqJU52fZ7YXSjddpwYBepx/Lq
         gTzit2MvZjJcZYx7lg4JGJUlqaDUtycV80ZBAc14HlQy2lgvl9qlRq1hjuom9eYW1t/3
         1mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774428444; x=1775033244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxEr38MnvqVqZ2J+GW/5gCOfjo4fanfd7DqD8+2VV5U=;
        b=GldsiQ/b0Vuq4IovLN5gxIThDSG8Ak/GHPFjDqFIPQXOPpfOfENHTVcpiiGaf93iiI
         JZjgGvnBCWgznIUK4sWMRvZqSSBzv6u0dDl9qxjfi62Yi34vrrgKmJCxyd0Yp5vxROtv
         zxOzEEb5Vri97SWY54VEdPyaM6MeSd+it4ogbAVomtishjptGY+rQXktv0qmpK/MjuXi
         d30BKKNhH3SUfLBqHvaORP4T8N0icPaOUspc27reIGrloOaZK8nfnuylC7T1xlLIgsoX
         MYyVzD0qQtZoIeZ3z0Hp1X/aglc9SVeWk5rno6hKUhlskyd245MufxvRKQEFjjl5djJR
         LpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgwnkCkDWcljy6JqccXAvL8ZQDaye6VhotUk0xDTQIsFXBCEt5PC4PXWXEGajA/u/wy5HUA5X3dwH6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8/iVyCA2tsr72cwc3toQ4eM+8ar/0gOUZgzMXrAyhs9s8dR2p
	xMHfgRsHu+aqHjUkFiwvPob4JLiCokuvHT6RJE8NERQ3pte5A4dP+wZM
X-Gm-Gg: ATEYQzyZjV5X/cOW3RACSwOX2kfNdzjko9HZWKjjlnguTX9CqvaBTJkfHZXCfnpwCko
	pbqytAqDID7CW+lMwW7kPcn2nkbQnvG6qlBLkKC3hvU6niA7PxfO19b2/QGZk190ZXVyOF1Us1T
	BrVrCFOCG2kLfvFnjOj9XrpRYki3kp/Dw5owGdvvs+v8RJjKkpb4kr0o07n94Bc8rcuuMEFNE6L
	JoPfBoFuLEVCoWPHG6BygTHkJHgGMz88+O+cQ7wSRaarJYMwkARkSFQVvsIEbEWyJEAdaChfhRa
	/38I5IYBmbSy6JArN5ZTbtSOh7n0ojrv97A6DRyrteO4EdIx5wRI4bXH07AjFoDRc4w0CF8JNhG
	vnVcVQMnyDsyZvSL3GdzdW1VniIDXA/7SBZxWnDb9Hw5+A18WVcPLY3m8+8MRJbd4TXfpPYg3wX
	DIXHenW7yqpFi7V2B/VOD0NZk=
X-Received: by 2002:a17:902:d50c:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b0b09cf4edmr33792755ad.15.1774428444074;
        Wed, 25 Mar 2026 01:47:24 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556desm231009545ad.47.2026.03.25.01.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 01:47:23 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dsd@laptop.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] dt-bindings: rtc: Convert olpc,xo1-rtc to DT schema
Date: Wed, 25 Mar 2026 14:17:08 +0530
Message-ID: <20260325084708.40629-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OLPC XO-1 RTC device tree binding to DT schema format.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---

Note:
* This patch is part of the GSoC2026 application process for device tree 
bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../devicetree/bindings/rtc/olpc-xo1-rtc.txt  |  5 ----
 .../devicetree/bindings/rtc/olpc-xo1-rtc.yaml | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 5 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
deleted file mode 100644
index a2891ceb6344..000000000000
--- a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-OLPC XO-1 RTC
-~~~~~~~~~~~~~
-
-Required properties:
- - compatible : "olpc,xo1-rtc"
diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml
new file mode 100644
index 000000000000..a5f029a4de92
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/olpc-xo1-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OLPC XO-1 RTC
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - olpc,xo1-rtc
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+       compatible = "olpc,xo1-rtc";
+    };
-- 
2.43.0

