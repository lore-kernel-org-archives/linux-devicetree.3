Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C645A0ADA
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894052; cv=none; b=MO5hguCbqB/0kxA9Tfw2r8PL7ZfLFETXd0E9LUwUY8BmMqqcewfbr0VdzeJnF/itvvFjDMzD3sF952VhC3YW5ouW0zBjmSnHDgx3UmfxLfexC+4LeZRC+FLzmnFkcZg/7whOHWPvcgc8UdBt/c2ELf8JGJa0b196e2jIDgUI1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894052; c=relaxed/simple;
	bh=ESLv5L+E1+ggTkF51IFY+k17qh7UMpZrmc1b1Q4Bu8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jk2urEjPqTqx24IwsuVHBeGA6WoLtWmfxp7P/4kUn7ZGMLzneIJmAp6NRq0XhdnjxDW2zJkjLCOoF2Cc038xCMrt0Sq3ncHxOT5srVtRWQJUr8iT4HzGVyklUDTw44t+KUV2Y7yDj78crM/muQ9mwPwACeQEiNVc+I9/B+4ay5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJVwXV0L; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJVwXV0L"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so2093385a91.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894031; x=1789498831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/3+KCQzTKA9dA4hix+BprsbxqkXn39e4T080FI7K0o=;
        b=GJVwXV0Lr2HnAFeEGbYWgg+kN0NpJEWcxJ0wjVuzd9tZP2XxfnTg5KmPPxCnkjX3Ca
         9pzEYuXfrp78dPzSKI/Y3iI6tKNjzqtK+vs6OWXYuzi8DbEH0uRqCdnGt2VhHW4RmPaH
         3KH1+349GoxyT9OSivAlDZ2yWgkuhVnBRWwj/QjaqfaAFvcOCv5teCqCPxAwayOF3ik4
         /yjH9OhX4HD/36EkddsJgijx3qARYKPY8Ib9ewH0Sti0YsI5qOfyURkCbYfLs/DXUwy+
         5XRN8V3uPfpZ36WvOLifmoWeybvwiJufI/qOoovW6YqVHkME6i/Ie2TdR0+FCC/ZJzzH
         JNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894031; x=1789498831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/3+KCQzTKA9dA4hix+BprsbxqkXn39e4T080FI7K0o=;
        b=CyOiBsKJMf5Yno4pSgTzzO3AxxoaqqPdzOlhMpuzVVAweoqok5/RoTx4AIT63GnZUr
         Ij6CKAbldMq5dJ8jG51/D26bW0GC6pUHQ0e57qdbPqqU3WHC96/rmHnSrp8gjJhEiSDd
         TMWQWLXdnnsdG1QRzUHIebMd2N82YaKORtBzL49isng6JRsDcu3JNiY7mEVvnJmXA1vZ
         kPwMGm8bKy8zVjkCj/dAtsyGpIPvlLtSGdNG+YlIb1uAFkX9FtovFl2fYj8kAcGbPdWY
         RTkxMs+/9vfkLSGrjA4wWjr0YLBDIumOmndQIYGoPnsB7R2JWNLvNBoKzka151bNfF+E
         H4gQ==
X-Gm-Message-State: AFuF++lqkWNmREzdi7BDGYwM3FzlRDJCtpa0b6KqLgfPgrnUsD1VZpSt
	sTHBXcCCEg6kSlfRXVZDor2CNnu4+AswyQs/o5mEXfyMCrA8gY9bCSof
X-Gm-Gg: AYBFou2DgablO1C1CO4miZQMXBtBEeANd+mhVT/VhxaGW8YH9KXqrq/E19EZPOD5cfJ
	yrqrlT1ULoBdzagN//kDHRFTo6WBeMhEpP9MLefc3LVJAKZpEuKGQCuZnDWKk5BHzCeL4d+31dS
	Z/I+oksZGnnrK+fAct4NwU2qv40Bo88CPWFf/Rpicft7axNVCT0eoY7yi9YQsRk3700HfOXtxmv
	EsTamOZPoGRe/gopHh0Kex2NREwdYRKzmCg3SFh+YkCzAxUb6u+M8waA92X4lKKQteN1rSO3CxI
	b0ufhgYLhEIKIoL344G+hxQKPrM5DKAvNT+Oz+LdJxi8ODvVlroHCTx4JM1ZbTS+vFyVyqsxq7y
	GEmC6FB1HTT5+6WRNXMXnyQqZTvrgzvhod0R93dzVa/bHYak++lCdnvUo6UUzDb8/LoixfNoKtJ
	U7AacmnEUCIQ5sSfMy/dOpS/cBMFi/+gx92jP2TQo+onxSchd2VUXUgHOD6uZ7HEcqntSgN0kq0
	TJY4rgYf/0D5vqgudDDu4Qb8wkpVHe0Q7PGK56sFVco3OYtm64+YIKCwgYczaXtHp28zIOwKA==
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr46524869a91.0.1788894030484;
        Tue, 08 Sep 2026 12:00:30 -0700 (PDT)
Received: from samlap.tailb86931.ts.net (c-24-5-101-44.hsd1.ca.comcast.net. [24.5.101.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19730135eec.20.2026.09.08.12.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:00:30 -0700 (PDT)
From: Sudheendra Sampath <giveback4fun@gmail.com>
To: alexandre.belloni@bootlin.com,
	ynvich@gmail.com
Cc: devicetree@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Sudheendra Sampath <giveback4fun@gmail.com>
Subject: [PATCH v2 - dt-bindings: maxim-ds1302: Convert to dt schema v2]  dt-bindings: maxim-ds1302: Convert to dt schema
Date: Tue,  8 Sep 2026 12:01:37 -0700
Message-ID: <20260908190137.1168904-1-giveback4fun@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Maxim DS1302 real-time clock binding to DT schema.
Changes based on code review comments.

Signed-off-by: Sudheendra Sampath <giveback4fun@gmail.com>
---
 .../devicetree/bindings/rtc/maxim-ds1302.txt  | 46 -----------------
 .../devicetree/bindings/rtc/maxim-ds1302.yaml | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml

diff --git a/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt b/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
deleted file mode 100644
index ba470c56cdec..000000000000
--- a/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* Maxim/Dallas Semiconductor DS-1302 RTC
-
-Simple device which could be used to store date/time between reboots.
-
-The device uses the standard MicroWire half-duplex transfer timing.
-Master output is set on low clock and sensed by the RTC on the rising
-edge. Master input is set by the RTC on the trailing edge and is sensed
-by the master on low clock.
-
-Required properties:
-
-- compatible : Should be "maxim,ds1302"
-
-Required SPI properties:
-
-- reg : Should be address of the device chip select within
-  the controller.
-
-- spi-max-frequency : DS-1302 has 500 kHz if powered at 2.2V,
-  and 2MHz if powered at 5V.
-
-- spi-3wire : The device has a shared signal IN/OUT line.
-
-- spi-lsb-first : DS-1302 requires least significant bit first
-  transfers.
-
-- spi-cs-high: DS-1302 has active high chip select line. This is
-  required unless inverted in hardware.
-
-Example:
-
-spi@901c {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "icpdas,lp8841-spi-rtc";
-	reg = <0x901c 0x1>;
-
-	rtc@0 {
-		compatible = "maxim,ds1302";
-		reg = <0>;
-		spi-max-frequency = <500000>;
-		spi-3wire;
-		spi-lsb-first;
-		spi-cs-high;
-	};
-};
diff --git a/Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml b/Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml
new file mode 100644
index 000000000000..54a2fcf7f8e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/maxim-ds1302.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim/Dallas Semiconductor DS-1302 RTC
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+  - Sergey Yanovich <ynvich@gmail.com>
+
+description: |
+  Simple device which could be used to store date/time between reboots.
+
+  The device uses the standard MicroWire half-duplex transfer timing.
+  Master output is set on low clock and sensed by the RTC on the rising
+  edge. Master input is set by the RTC on the trailing edge and is sensed
+  by the master on low clock.
+
+properties:
+  compatible:
+    items:
+      - const: maxim,ds1302
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: DS-1302 has 500 kHz if powered at 2.2V, and 2MHz if powered at 5V
+    enum:
+      - 500000
+      - 2000000
+
+  spi-3wire: true
+
+  spi-lsb-first: true
+
+  spi-cs-high: true
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+  - spi-3wire
+  - spi-lsb-first
+  - spi-cs-high
+
+additionalProperties: false
-- 
2.47.3

