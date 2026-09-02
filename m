Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9C4503E2
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 23:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392126; cv=none; b=JhyfPavwIzdwhwsApRRIhlZr+8X8dTqctC/oorIJVOukNAugTKkIVPeotIqiIgNUru2zETekZYw400rRzlGFZsy//K5AR3/kkKhOkuxkxvBRjelRhj+wRboTrtO2va3Mq+yREXWwCku/8CS8faBiU+mNcNfw6wCZD3360clnu44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392126; c=relaxed/simple;
	bh=U71T/iH4wTJhru5jPquFocWPqj8LcYNokk6NJovo93Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JF6sDU8p95KXXjaQn3U1zsgu0JpArvjONXvOa2tDmTM+2CVqm6UqgKK6TB/2t1ro9zd+DxWnSmeyLph5JRYIbmKtv6ttcQthBYz+COyxW3d69kTKnnW9E1tQ+/BhgfgGUW95pwbras3sniKcv6C2TziNRwyg5xj3mAmnmAPA1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1+CgPYJ; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1+CgPYJ"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3965683e9e9so987583a91.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788392123; x=1788996923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhxmtI32HeN59PYea0qLMDve3O4zMl3qKBe7Lg9m4z0=;
        b=i1+CgPYJ9MTaoANCKUiyMGxPX9KWLNytH1An1H3wj4hmZjVoe+habo5ZzuDjav7HTU
         iJgnyJJNG3+gG9QAwe+H/2Cio6fW7ouznxPsMV1ih3wpUc5G3MF2tncyp/vul/CEVuhZ
         wXAEUB9344eHQayYDQyh5o7TZRqqW4lX9SNKT3Ea+4dYbsHN0rXcDmBs2UWe9t2wI6DB
         l+nimdoEz8CkBHJWyJxkdFqepcA6qhLEdFJcAq4EKG8JPk0GqpzpFpiA8TSQ28Z0F3C9
         wIYYngwVfz7kcsQYaOt+SP+nuurqrO45LvDIqoq/wAS6q5tL2aDWhUd0oguGAxCUw7HM
         12Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788392123; x=1788996923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhxmtI32HeN59PYea0qLMDve3O4zMl3qKBe7Lg9m4z0=;
        b=GgWQ0QJDKNgsFRRS72WzV5GENxia9OeWNSIlNHm66Ty/6qY1uBYPhktqt4nQkR8xps
         s9gQcVXMMFEv+JqhkqNX7rgGNMKlCeOHZvv1yzCAdfwO4pbHajVtOCWKaMmbUSXTL1tm
         BDuHHog/QHVwVWw3Q8ct7R2+nVMrJFUlJqyTnTnzQaqxV2dg+FAkr3+vYHC4nDsypXqj
         KJzZ77x3pQUM9HeSWvCGnkaoMJh8UhwjEpWPThOX0gcZgpUgQJXDndpcpVUH73SafEfP
         CRiIMjHhVynUeN6P0wGBo/y3zamfS11Ucm3ylZLquLtxK/KVm9sQ1XT28CCbeJmF91Cc
         JtHA==
X-Gm-Message-State: AFuF++mg/ZYWuAdXz80NvC5t93ejoCIy+GGsyMO8hqHcTRf7lPyLYfCY
	90KXFyTYe/z9esQGud4vo0bmGjL9lIz9WUT54IRShFAoRh4Xt9OmJ4RD
X-Gm-Gg: AYBFou3A02bClr5RdTL/KpmVUlycHdBksENMIlJ4aFb13s6J97egPuXG5sn0lBD2Wnu
	pTViV+IERCKtcA5OiYzI9tgJ6FgAW3hrbhqeGB2ee7JOBgirnTv38hhJH/HN5jea54EClFwXC0q
	VbUkokbDs1cRJQiyCtWKDhcl9OA1w4ULKu4TILBg72NdDowFsHJcGWD/mGvFmhnElrQFROL45g0
	rFJCPPieqvTFJPRbkdZaTAnlU/QGQZ/qnwz/s/RXoo6FiNQNZLoLVU1/XB81z5VvMUtO2vYG+cv
	OrW13p/VvWBSolsEWVuhA+kJKTN9TYY2KPqKlqI+IkmXsKmyZoPyT6TSGnxuzDxt+jGiIftF6Hy
	k6LsdCPRAcICkPhIgWfTaVqiykOcTb0wwfeL7YDSQlfr/fxrCfzzRrnM027ZjncVZk6UwKA2vTb
	TJXRFCIs74BPA7Yq2DfXfpz6yb9hHqfvCf358wCXL1pUapEhSBX5lsTtbiQtmY2l5wQ+NjpqBlu
	v7s+Dewoqeg4XGxC1Mse4TJuUeegfXeRx1PMD+h76CImnKeDdS9xMohfment4O4paIc44Ks
X-Received: by 2002:a17:90b:4a8e:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-39aedcfc81bmr12171133a91.0.1788392123330;
        Wed, 02 Sep 2026 16:35:23 -0700 (PDT)
Received: from samlap.tailb86931.ts.net (c-24-5-101-44.hsd1.ca.comcast.net. [24.5.101.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994fdd7sm1209199c88.10.2026.09.02.16.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:35:22 -0700 (PDT)
From: Sudheendra Sampath <giveback4fun@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Sudheendra Sampath <giveback4fun@gmail.com>
Subject: [PATCH] dt-bindings: maxim-ds1302: Convert to dt schema
Date: Wed,  2 Sep 2026 16:35:49 -0700
Message-ID: <20260902233550.947218-1-giveback4fun@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Maxim DS1302 real-time clock binding to DT schema.

Signed-off-by: Sudheendra Sampath <giveback4fun@gmail.com>
---
 .../devicetree/bindings/rtc/maxim-ds1302.txt  | 46 -----------
 .../devicetree/bindings/rtc/maxim-ds1302.yaml | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 46 deletions(-)
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
index 000000000000..3e6264464e10
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml
@@ -0,0 +1,81 @@
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
+      # Maxim DS1302 Real-time Clock
+      - const: maxim,ds1302
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Maximum SPI clocking speed in Hz.
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
+
+examples:
+  - |
+    spi1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@0 {
+            compatible = "maxim,ds1302";
+            reg = <0>;
+            spi-max-frequency = <500000>;
+            spi-3wire;
+            spi-lsb-first;
+            spi-cs-high;
+        };
+    };
+
+  - |
+    spi2 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@2000 {
+            compatible = "maxim,ds1302";
+            reg = <0x2000>;
+            spi-max-frequency = <2000000>;
+            spi-3wire;
+            spi-lsb-first;
+            spi-cs-high;
+        };
+    };
-- 
2.47.3

