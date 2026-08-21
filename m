Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B129E3C4B64
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301436; cv=none; b=J7yul3akXvBYHGIOE/ny3SjqUF9Z0OSaCMH6UjmBQR1OqHmet/jiRY0ZJhM3/j5PQZSnHVvto8FvzNpeGwB/IfsATlcYjui5/9JdID+0/3g8UzukdZc45aq0iMkQHrPPI059Mm2Ti3c9ZBnIxTffk/y/4i+MsxBrvR+ma0ASguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301436; c=relaxed/simple;
	bh=9bibZuUnFhpT6I48ELTQlm+vsx5ZODwi3YO0SRDPBnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGaK0jZ1JTdONeBlvp8sd6ohCPau4Fc5jNeYWuv2lEk5GMY0hcZRkaz2ZJbkATzto7gQEQUTdwPfoFVt1wnaCVIaUGGlfIi8r2eCwzvOcHbzmK6KuMIBpIrkXNHhG+iCpAeIyZ7OSsH+0a+DjVMv3A9vojxx607VFxttFLynTas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKGCxvke; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKGCxvke"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499acf0fb55so3910815e9.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787301433; x=1787906233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PldkGwtxCC+r0/FLbTvlyq8GzDgKIMshQkWa8+q2omA=;
        b=HKGCxvkesPJzGWEJ/hRe4wXGbp5IN9j8i2DZrW+d4eKG2DDivO9nQKQ23BQ1DM+R0y
         eRZJ+HUNFy3T8OxJd+MtdF6AeAL7p1Exqj3hhpo6cytYNshSDhLmaRa58cEBP/3y0xxs
         hDsgQyo9Gzlv6zytofWA6gE8YuI/25F9nhlGyTC2LfmUg7AxabG9bzVjZkbShytkgoY4
         0ooA9iZZnJ/6FkEi0gam8cC0oN45UVkoJqIwfbhXIA+0GYHEva2gdZFfCg+oUBp1K/mK
         HpdvvhqCDlY6MZXJe9oyxasrI9cDa2oCXdtIObly+kn2zdjwH7LEfEx38CYYun8954MP
         8z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787301433; x=1787906233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PldkGwtxCC+r0/FLbTvlyq8GzDgKIMshQkWa8+q2omA=;
        b=QHsdqU2CSl/rxwqyv0JGqDoc5npUt4D0+WrhMH9iK2ryCOtt7Ar/AGjJFKKD0YlxGU
         G1LsKaMcIrViB/CdwWqwZAWLxTc5dP67Uk1GT2EN/D0iKtCLfewPOCDLaXT4X/jF6uyv
         PSZxiXzhpNQPMtHPrYBkj7a+NqJzhLnuw6Hyd2l5igdJBTnn/oMOCuqt7sqbDPAYV4nB
         6swCJnGA4slW0k/goO54pC1U9aN4+VpawswdrtKacFRj6RgiAlUszwiTxFwnAtILbsXx
         nfvtokF6T4UNS8Q+LXE8+Q5asyl4pZsmWFD9M+9nyPYFcydB9rtjPxVnpN4YzNZCRz4F
         tw1g==
X-Forwarded-Encrypted: i=1; AHgh+RoLonWUry3roO9XgqdXjdUAp90zDMTzVCp9ithT40bRbaXgSa1cq4cpDBeXO6rEUY2IRbSW6RhyXRNX@vger.kernel.org
X-Gm-Message-State: AOJu0YylnyOg/ih6KFwe1zyqURhN4oLrp7dGatvXClF96iv749/K8mTt
	v57SC9AagU2CQNjLzfp9HePc3RNDalao1iUdI7p98eoC5O+Kdre+wTXa
X-Gm-Gg: AR+sD13Rlszll5S24iX0lMxCKfPdW6h2Cej93ecXdh4V+2/qe68EGYGoQLOdlc+xTZH
	fl8k3Oq5ShyklBy6RT7WewDMMZ+YBPMGndzcHa/5Q4oQAtIZBqZbeqdp6cdB2XvQTRXQqsSPqec
	8op4XLEjIC08AX4IQyLPA5shOgs37us5RfZeQOir93jKcjaRIs3DuDOg6aKRVmU4z9Jm1g5JYBJ
	Gpjee70P5pUjel5yGD2CVDuMBQ6zHVlwBm7DNWCp9pAQ1Ma3wqzaNX/qTSkSyiSJ1QhUIXp+7En
	xw+TNEsmrJiSdPA/rreGVqKD9Hj8CiGhS4iF47tZ61m3xQiXI6YtdkRI3AQqzzlnK+5hrO7JA4q
	p+bsAggTD/D6yqijWZHl2hFKVWutoE6fSTTjDF2e/CEQGC2ITXfJH8Pwm9EWfJ3Jr5FP1qOzS7s
	rVn0lpa6bxCM13avUaqC57D29ygeS2vlx8ui5rPjPXpfrDfUOrd1j81w/UMvawbsW+OgPGF1aUH
	uc3L/4xE10H6y6rRXb44UFVNon9TviAAOUlfVP+1eBOHg==
X-Received: by 2002:a05:600c:8108:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-499b82f40b6mr72829115e9.2.1787301432800;
        Fri, 21 Aug 2026 01:37:12 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b911724bsm18546705e9.15.2026.08.21.01.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:37:12 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Cc: Rillian Grant <rillian.grant@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] dt-bindings: leds: Document TI LM3643 dual LED flash driver
Date: Fri, 21 Aug 2026 09:36:05 +0100
Message-ID: <20260821083620.68324-2-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083620.68324-1-rillian.grant@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Texas Instruments LM3643 dual LED flash driver devicetree
bindings.

Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3643.yaml   | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3643.yaml b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
new file mode 100644
index 000000000000..18b08a79512f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3643.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments LM3643 1500mA dual LED Flash Driver
+
+maintainers:
+  - Rillian Grant <rillian.grant@gmail.com>
+
+description: |
+  The LM3643 is a dual LED flash driver utilizing a synchronous boost converter
+  to provide power to two current sources.
+
+  The dual high-side current sources can be tied together to provide flash
+  currents up to 1.5A through a single LED.
+
+  Datasheet: https://www.ti.com/lit/ds/symlink/lm3643.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3643
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 0
+        maximum: 1
+
+      led-sources:
+        minItems: 1
+        maxItems: 2
+        items:
+          minimum: 0
+          maximum: 1
+
+      flash-max-microamp:
+        description: |
+          Maximum flash current through this LED. Each high-side current source
+          can provide up to 1.5A. The maximum current the boost can deliver is
+          1.5A across both sources.
+
+          Valid values for an LED connected to one source:
+            10900 - 1500000, step by 11725 (rounded down)
+          Valid values for an LED connected to both sources:
+            21800 - 1500000, step by 23450 (rounded down)
+
+        minimum: 10900
+        maximum: 1500000
+
+      led-max-microamp:
+        description: |
+          Maximum torch current through this LED. In torch mode each high-side
+          current source can provide up to 179mA.
+
+          Valid values for an LED connected to one source:
+            977 - 179000, step by 1400 (rounded down)
+          Valid values for an LED connected to both sources:
+            1954 - 358000, step by 2800 (rounded down)
+
+        minimum: 977
+        maximum: 358000
+
+      flash-max-timeout-us:
+        description: |
+          The chip supports timeouts from 10ms to 100ms in increments of 10ms
+          and from 100ms to 400ms in increments of 50ms. The provided value
+          will be rounded down to a supported value.
+
+        minimum: 10000
+        maximum: 400000
+
+    required:
+      - reg
+      - led-sources
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash-led-controller@63 {
+            compatible = "ti,lm3643";
+            reg = <0x63>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0>, <1>;
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_IR>;
+                flash-max-microamp = <750000>;
+                led-max-microamp = <180000>;
+                flash-max-timeout-us = <150000>;
+            };
+        };
+    };
-- 
2.55.0

