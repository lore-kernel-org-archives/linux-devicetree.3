Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615F4F404B
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750367; cv=none; b=q7OHkZG9oPevsaQzwuV7hdbE2EVs6J7xKbU6sKyv3uAbXbEcTQ0omNc0grunmDYwg29JVcXLg+fHbTtf+LO+/5kvhEaTBQTPszmtDEZKoPPCtFJwH2G2dyiDsC7nvblAyevTJtK5byINke5eIqyAO/+iKrDR/jNEUNIKAtMtvNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750367; c=relaxed/simple;
	bh=ut9bu0ogvOe3LaZe7HaU4YRdS8uXZFfbEqCnduNcrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1jrR4acc8U+YQ4iatq9KdBW7JR6iYtiQpNnVoiOU2rzPu/Xt8d1Kc8Y1WV+y048M5P7pAtTrYwgz5PYPIgHHttT62NQuRIPFpjqKtARFxM7OtCh+nLmL62LEeXeU3e8p2LNB/OBqWct0YZG2I5J4WL2q6t57QxPzE3F/SIMozw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=E5JVYXGu; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="E5JVYXGu"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cadea2so76155485a.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750359; x=1790355159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oe9FkoIahCgEzPBuPDqtCAL2bGeR9kc9QC4Nw24cDKs=;
        b=E5JVYXGu57Y/67BCAKxRz5yPwLfPxcgv6/MZt99eSldvuFl7BWxiWIO1RE4Y69QTK9
         UajLCGadRl40RX3VDBkonBYkX1Em3iai0tdjS8rNdfyYc/lXfOmGWqlfL/M10Eq/SePg
         y5L8zT7xvcKX1WcRIQRzukr/w3kx4nHxUNBmr2C9l/jF2D5dkPHGakBzVRPICV5jA9Wd
         wM7s1h03hHoPUrcTuQiNnb6q5+uBqCR07Oexy15x/Osz/3e478tMvJwJDjc6CB0T00RQ
         OkJcK1rjwlLDARKkNzi1/PYoGzdwg3TXYg42fVoPcZfZHl/7XAG2Nse/MIiSTXTbnCar
         wB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750359; x=1790355159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oe9FkoIahCgEzPBuPDqtCAL2bGeR9kc9QC4Nw24cDKs=;
        b=v1+9DMOj3wTKvTrEWkLw5CRmtQpVL1v9zBSRXrnkFk29/CToQSTstcgk28H1NyReyk
         gpVlxwJChSzR3gyOfbnm2r7B5wb3BaksLYyZuTzyaQmbFWRTFN/ujARbwNKXM0mSkOql
         XBUKLAXYXf0UIhkp+m1qy+jpE9tihFi8zL2pyQWdKFRF0UoyLXewvUniKXc/w6OVg4bH
         gXr0od9L78330T2Nls5gYxFt5GAb7g6SVhBEvlH3MK53S53YFeqmIFZEGsDpzFUnp/2F
         byPyB4RELNLtyb3f6miN7ha18ewhP75a9OufdluTS5o5+yBctE3ncVYSVcA9SLbIkmlr
         kf/Q==
X-Forwarded-Encrypted: i=1; AKwUvByhXUa0Tg+OV4kPUgyqsJtVGhD5S7ku5EEgBGnlG40hRsKGLZ9Ef9BZpH4vhweyc4djfbnAuwYExgqN@vger.kernel.org
X-Gm-Message-State: AFuF++nn3q+RYba0figUZQpiMvFyidZrOvwrOtLclXzBljh4Y/EXbNxf
	qyU2ehsjvqF+gX/WmriUZvpTJT+uJj3sQI+te216DCH1UpclTQnw5VO7yL1uIi98txI=
X-Gm-Gg: AYBFou2yBW+cNQooqYXeN+3+2D97d76H5xVxPwGOTKOpiBSa2aZqT7f9+tuW0ZU0ao3
	tIWUDGVbzsNkHbTMSy7UD123jPqHl6z+axg5epPC9/wdXJ2GZZv5+BOUzzGIiztPUIiUuxDwpEv
	nsT/ll4lPKPaEtdtNkMaVCkSJS77CZVeH6EfTtkaPLSH083ttHGg1SHOjzfJAc/7KhOLWmigj36
	9xM4lX8582WrCIk94kpEVwuLKTHvCG/w0F+hwqhy9Qp4JALOQchcozb+zZLtVfkYSkArS7pjSmV
	UJVhtwzwpK43G7FUfsExMLJ2aewQKGqN/+YNAwpOh79WcO6X5AQRAF1W7l2fNWrcKAALHHbLd16
	wXBW3XjSccJwUj26rNO/6jANL+HQyG84rod3lJiNH7RlwoxB0I+LLIo/yYdzItPygkuvk3A4iJ1
	RkPqwPGGyYqyv/pKb0qQmXjfkHjJH3ARtAyyueeXhvHGIwx32g17Dl4MEAzokIOvRgrwrV77gdz
	W0=
X-Received: by 2002:a05:620a:4103:b0:93b:d7a2:dd39 with SMTP id af79cd13be357-93bdca3fb9cmr469299485a.73.1789750359512;
        Fri, 18 Sep 2026 09:52:39 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:39 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
Date: Fri, 18 Sep 2026 11:52:30 -0500
Message-ID: <20260918165234.687224-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918165234.687224-1-elder@riscstar.com>
References: <20260918165234.687224-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for a system controller used in the Toshiba
TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/mfd/toshiba,tc9564.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml

diff --git a/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
new file mode 100644
index 0000000000000..32e73a727c82a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/toshiba,tc9564.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 System Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch includes
+  an embedded PCIe endpoint on one of its downstream ports that provides
+  access to various SoC peripherals (including a clock and reset controller)
+  via one of its BARs.  A system controller provides managed access to the
+  first two pages of this memory region to ensure accesses made by these
+  peripherals produce well-defined results.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-config
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon@0 {
+        compatible = "toshiba,tc9564-config",
+                     "syscon",
+                     "simple-mfd";
+        reg = <0x0 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cf846853fdc79..b2d3257b8f892 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27674,6 +27674,7 @@ TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 F:	drivers/misc/tc9564-pci.c
 
-- 
2.53.0

