Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A805CDF1
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470664; cv=none; b=llW9QMw9nFnXXyboO25WuREc6HKXzrL201ZOMsz0wRfc/ISWvKta7ta5QMOlWLMUlq9kQmMjtSnPsOTudHFVuVxymkbXvVdUKYTG/XSyGhenuTW+z+gcczXmbcvYyShOIIoi52/66PpJDTtbVO2gRupxj7H9GnWRDuvbtrrlklw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470664; c=relaxed/simple;
	bh=/QOJtGfdr+JOj0LUTr+uZzROTqSHBvb6AEola5plcyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mVXVqjHmiN8qYpvnMQdYVBI/uxyHNkl2gmZPCskAUOuOiFmxkv4igo/Hh8EstDpHTPUbwPz8wAwXoyXKlOpzEBhI+G+ASXEHvkJH+nL7VDPTYbeZRBwYKCaJsFHohjqtvdccOdKLplrvczWy/L+T+Ereq4VeXAd81yqUoPxDfww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPZ9cCXx; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPZ9cCXx"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so3384298a91.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 03:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775470661; x=1776075461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91bKJs2UF/hPf879HWzWnCyGjzk/ABzmRajut20ibEk=;
        b=TPZ9cCXxhpAjroUI/CwYegqAmckUvFX1dXaQlNxo8P+bE9J+Kz6kKKg6Xo+BGytutu
         JD9jpzIPm03QJ0xZsE8EVvfmnqnZ8hCKVxjsA+R+tutxcTk8SyQyM1F9VdI/KMYoKR/p
         sv6IHtdvuI/S/A6sLNvUFo1oIsG+06/SnVt+o1OpxtbNmtc211xAJLcPxvjuhHVcDo4/
         Z9UcqgONI34nxZFyLHmRXZ19WNCcxUjTTjLAZV2gsiJgyE7817rqSPIRdNHhmeLOpODc
         le3kxZmFPjLtfkJ1o0HIXlqk5qkC+qPP6lExGhth3HJ9GvMcVeW97agCBjBaUc/G0IrE
         axBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775470661; x=1776075461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=91bKJs2UF/hPf879HWzWnCyGjzk/ABzmRajut20ibEk=;
        b=UdYyaes17JHUaMnQXhwPcKFg6oNpDWc7p37CA25TQte7MB+1gUluLYVYI1CEufJS0y
         +hv1oLyts2SAh0ik08I6jf0xFEd+dBV3Pcv+BbJj/c1+ZL3h31wBZMOIOjOT94Fl7i4B
         3z/Gtr6A07WtD+NGZ7ruyW04r1MIkJk4Bsz3KWYxFzPWCPqYIFGUNpPiK4ZvRtuF+DiE
         aZx65wxV8ByLGZRrWC8aQtDx6jS8h825QGm8dfQVguT9sXwJtOGcha6yo/7KnOmHTHyP
         Zgq2dLK+fHnspWO5ns3nO09RTNK9IYoT8zBgBW69STJ8LiC8ctSRaGtQXo+zAbWeMhHX
         526Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9Duxa1T7DPt8C4Odh/kXqZU8L/z7EPw8yvI8HaS5TNnbSpNx/uNU99pDl/oAMhZpuv2X6rbySbjXc@vger.kernel.org
X-Gm-Message-State: AOJu0YxiSaoNkEyJ9nOxvrbLE9jr95smRCGXPMsDOopmWwS46q+qm1C1
	y2K1ZPXmZlT1UQuILhUdRWntaR6CGNK+cVq7YXKz8G9y9kESQLLuHFhM
X-Gm-Gg: AeBDieuQhiT9gkmJyO4/orHnIj1mpvC8hlwfPMVieLSDCx+FuD9g+au5+Jo5IL6EsE5
	FaNPAGapajQPfJhBlA6UGH47G7hbkNfODQDKg1je4kMZqSqahBkvmak6ZyQEmWOY5sksuMQnIIB
	O6vLg9WgBekZhIBi9UluesBJ+p7uC4WiF8VWmVKgKToNn7wjcvPcKDkNE/FTx5iQcmKNBZ6G0vX
	1PVFtR6ODGMFDvt6aYriRw/ywEf45M8KyuEbTstuT7HiPbq0zF79fSsLBJx4WVgFIVu0O+N0iMk
	pgNQsjw6dJr0w/1To+DpfdOVGRtC+pRValmLMoLbg05tKoVnnVP1DXgpgB0ve2Cwq3m8eIiaufC
	TFq3fQN9ukxMF2Vs2K+MwOppmyDXgDN2RjOTM/qSjKlH6N7Aqfdun6mqaAMT4TVwArXT/Hu7Jh0
	577ryLHnm2uVQN69pLiiGrMCqq7Gjm9weAS+IbDwvGhGxN
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35de68ebf53mr12282940a91.17.1775470661157;
        Mon, 06 Apr 2026 03:17:41 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c94a:aad7:a860:f869:a68d:92e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm23332527a91.5.2026.04.06.03.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 03:17:40 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Date: Mon,  6 Apr 2026 15:46:46 +0530
Message-Id: <20260406101647.109667-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP720 eFuse.
This patch introduces a YAML schema describing the required and optional
properties for the XDP720 eFuse device node. It includes details on the
compatible string, register mapping,supply and rimon-micro-ohms(RIMON).

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
new file mode 100644
index 000000000000..72bc3a5e7139
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP720 Digital eFuse Controller
+
+maintainers:
+  - Ashish Yadav <ashish.yadav@infineon.com>
+
+description: |
+  The XDP720 is an eFuse with integrated current sensor and digital
+  controller. It provides accurate system telemetry (V, I, P, T) and
+  reports analog current at the IMON pin for post-processing.
+
+  Datasheet:
+     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,xdp720
+
+  reg:
+    maxItems: 1
+
+  infineon,rimon-micro-ohms:
+    description:
+      The value of the RIMON resistor, in micro ohms, required to enable
+      the system overcurrent protection.
+
+  vdd-vin-supply:
+    description:
+      Supply for the VDD_VIN pin (pin 9), the IC controller power supply.
+      Typically connected to the input bus (VIN) through a 100 ohm / 100 nF
+      RC filter.
+
+required:
+  - compatible
+  - reg
+  - vdd-vin-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@11 {
+            compatible = "infineon,xdp720";
+            reg = <0x11>;
+            vdd-vin-supply = <&vdd_vin>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

