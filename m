Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B978D39022E
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779612823; cv=none; b=Pt7q5pmUyH+WePZRgQG9UUCaRFeLzPRjJ7GM7EhLOKYEZvhCnnDPYV11zRLJMgN8Kw8oVHG1B7jJWVToY7AXykigSYjuhZnYIUf53PuPL5A/x/p1zAVqwbO2BafMJGCfTypMYp2jBy18HJ64lVQy0ehwtjn2S03ZhlCIaKROnWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779612823; c=relaxed/simple;
	bh=mnbsGdXqPudND64KitG2wVJI1G17JSPfBSazzNlu7eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruouVFN52kj/C3Xak8F2L+nnEMlgk51f0GH2TDf7iBhqHWNBhJmoFNAXkycsdg+wznj2n2iOY9ptQ4xhJ/vIZ7nK3nUeqzMowVGfndeyDr3tCkVxyCeQIreBpaS83CTd1q+dsr1YfoQUqNnbDnr/X83CT1MP2XZXqwLwe8lBqnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhFg2QyN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhFg2QyN"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-83945063f70so4516838b3a.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779612821; x=1780217621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xECuTc1TXvHh4Pd2rPahPYqdqFjRE3a5nhCp5fRA9c=;
        b=MhFg2QyNj8bcNiH7c2VeqPQexN2Nc6T++/Wqy0R23W3bTy97ZG6u5HiJjHPjDbYahM
         iOoqxj+3P3BrBvvAQGqooyNC05TAwfa+Nd/F5xq3C4DxSbv1+uAUMho1n3l5M0nXFQGZ
         GSBzeXqjcxPqk97eefppqw/1RBPj8pKir2xGr4jklGY9Bih6Aa+aBIZKLHn9Q11XkUns
         2NnXTexLik9XhUhyp3xJOz9Q0Ix3GTtBbgQBnz43xhC1ZhektMeo+CIRqUf2gpkdPORZ
         7N3SaPN/E0EZzy7SAgeUbN9xuFY2r/vtwmHEHhDK4daNJE3OHMdC2anoTF+1Ba1NFoBZ
         vL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779612821; x=1780217621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xECuTc1TXvHh4Pd2rPahPYqdqFjRE3a5nhCp5fRA9c=;
        b=LXYkw6CEWqXffx42JQE2zlWarQwmPbIZ/59hlnm+5FwEPHQPtjUVpeOWsDSc/T05xT
         CHEw3TkyLtU1RpcGmEOfg5z92dKCNHb0b4KNFujF8/n3x3V/WMtf+RzFZENYckqJSDb5
         GCQf77FjLSuslqZjZE70xSVuTrg1R9xVEsr19xnX68IFm6VhxdTGDvNBVqnQh4w7PKRu
         UlpCEF5BmQ43m4rSkEwEwrmlrY5s2CGbmfnOJDuK1vo+7HdIp2HWhHfvdPXC1ft/Q0Xz
         EI+XCjWafyql7v19B+E25rvEO8ymulkXEu1Ci0t9VhauDdby8chA8nHi5VA0jhACFueo
         YqXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9chsk6UPErZnMzbYZtXTosu2hYAOA3p9y+oXl0IBzdrTWbExZRjnko9AFVqwbHIQkRxWIY1tu0h76I@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDlxIwLyxVanQyJBFtPhkiwMZ6GxoYs8Z1R3ZbqU4JiHGLVM+
	skmUV5YAayepuadYDrZ9NnSe4KRf0aNiBpxa3XyyEjpmtyhSK1UsaxMh
X-Gm-Gg: Acq92OHnF8vBQIxBkYTyUePqgrCABT9gf2AhSLhkHYZ6gme1JnN/FrME2J3twYFkhln
	4UOHylTJLPtxKAYFF9N4FdUdKXa0lmpqQHlG4hUQFZkWWBR2/ZLsX7HrfgMeiDn0qItBW4DdMSZ
	RM4GGYECaZUJ2Z0+O8TCwOrQE52428U1n494635ahZNzQcBEJzAt0LDjFNB4aDSOblY4gzpK5U3
	hqzzjhhPfKHI006eZe1TGDR+0e95s6kYodVU4i9JDWuQVhM/aAIKoEHSZB6wl9+G6G5txLeiiGH
	5btZKr0PlJ68SGvMlPXI8punI8E2HBaoyuv1GXnm+qSyBknLwo2N0a8wbAo6vsue90LU+91dOwj
	UMfNodUHZ/nSmpZZhLOHJfX0ZD+mi/RXWAOvAiiqqrgE1i2B0eQmnIhYQkvGWGuPS0PlDE866GV
	roGwHzENGSj+vUihz2i3gDsJsFtFg9Kl4kqG1DNGVy2SAt+N7MEPMGqZSeckzdeRfxlnN7f2hOX
	vKPd+byUvpktTE1f4w7VPk6UR0MDo9NBWkt6Q==
X-Received: by 2002:a05:6a00:8d82:b0:835:7c0e:b530 with SMTP id d2e1a72fcca58-841606f55aemr8287017b3a.0.1779612821128;
        Sun, 24 May 2026 01:53:41 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea4de4sm6353116b3a.35.2026.05.24.01.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 01:53:40 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v2 1/7] dt-bindings: iio: add Open Sensor Fusion UART device
Date: Sun, 24 May 2026 17:53:06 +0900
Message-ID: <20260524085312.15369-2-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524085312.15369-1-kimjinseob88@gmail.com>
References: <20260524085312.15369-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the OSF0 UART-attached sensor aggregation device.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../iio/imu/opensensorfusion,osf-uart.yaml    | 33 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart.yaml

diff --git a/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart.yaml b/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart.yaml
new file mode 100644
index 000000000..d4a8f6819
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/imu/opensensorfusion,osf-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Open Sensor Fusion UART sensor aggregation device
+
+maintainers:
+  - Jinseob Kim <kimjinseob88@gmail.com>
+
+description:
+  UART-attached sensor aggregation device using the OSF0 frame format.
+  The device sends capability, status, and sample frames to the host.
+
+properties:
+  compatible:
+    const: opensensorfusion,osf-uart
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    serial {
+        osf {
+            compatible = "opensensorfusion,osf-uart";
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66a..121b83f70 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1239,6 +1239,8 @@ patternProperties:
     description: OpenRISC.io
   "^openwrt,.*":
     description: OpenWrt
+  "^opensensorfusion,.*":
+    description: Open Sensor Fusion project
   "^option,.*":
     description: Option NV
   "^oranth,.*":
-- 
2.43.0

