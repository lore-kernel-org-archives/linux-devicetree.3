Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD641167E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102795; cv=none; b=r9xyeUT/aKym9oFoCso/VqZsqmBoD78o/AsGfoSbiowndEgD4bOSWH70bhS5jQK03bRam0JlMdUW4bNuVQ568jc2iqRQ5/SD/lEGfZuyJUZiEjbZIZzRF4i3gZ4WZUy3MRWzvk+L/wn/jqGLc11Kjf9kChb/mTqxiDNpDoG6QIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102795; c=relaxed/simple;
	bh=2ZlDQ94rUR32hDecoAEjqx6oT9mO2vXNWEo5sYWXlbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rX9waZppPGNaHQ2GIBmQjGpPq6Zghvlgxj4mSLhv8jssU1bHXUpq5fjgwYxFZbS0ZGFClKZWHvG5Uo3NYc1fh27xmXTaKCniMnTbmLzijeOt0tOmvnClZyCxaWKOyEESNNCtVtssry6UagayEtxaWhiQJZL4YPwmzXYemKy5jT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+1Z57/V; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+1Z57/V"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-69e59978deeso2737255eaf.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102793; x=1781707593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rohFaEvdb620vArkGLpQqclQhDOuQqS+sgoSDAQS17E=;
        b=L+1Z57/VVhXk4ALdOiEqSDGtGbjNc9lzyARyvHkm3FEbQpRP0VteeoVER7adQyBbh0
         i5m3Pd8YwDl2sZ7Q7L552Y70WYi7WPqs7FGfmSPzH9TWm1eOFs9ZCT0geLShLNaYNksL
         hJIBVj7GVUS3rh49oehZFc8kzqSMtdBb8hudY645PYHWMAjmawMAdGSP2eZg8cUnZ/GD
         caL6+S5PDe8kOK8Q0x1bGlZqSb2xs0lFwbW6UJ3cVJyBH61bMv6N7FX070aWrZ8VlgAM
         UlWNdTOtJ7qApFWdFdDI754s/Zk38dB1WCTN6HnlOGnvaOBnehy/OPeLqT8++T2IRaeR
         k5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102793; x=1781707593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rohFaEvdb620vArkGLpQqclQhDOuQqS+sgoSDAQS17E=;
        b=nfk8FHFm7HOYy3y1zHh4tf7T8GgOdVxOtOhsNfT2K3FLimdLJiuiowwe2F4+j5N3pN
         ZSMNit5h2+R25v9zQmCkDicnOC7L6xirkSFZiJpHt8yyFnB8SvzgTt/LwGVUHNcgvH9h
         l69bgDU7vv91CXsIe/F9tLLHtEcl4nOwPx95khlp2WMx7jYb1MuSdR2+M2H0z4MqrwPT
         ekfO475ci4KPO1RdbFVcTl4nkzhkShq4cHQI3iW6h9aik4bJ9WUf7xj+7qwsMRzzk/HH
         ZM4bPaKOAgg7LQHZSouhyvgr0tY40v8Z2/ykEXaKu0cmhbz+C9Nb04NiT+8tJhinJEFh
         uNtA==
X-Gm-Message-State: AOJu0YyiqX4AYVoPP9LOkIcLqf6KsoaXNAFXyUqJAGRx4gsFv0fy4suR
	O79DbkUiXWWM7zjQNBbhuNabYjma06rbqJ6qn4pc+0LBqvmTurVwhtLq
X-Gm-Gg: Acq92OFqVaRT2BrYgKAfi5/c64qDo9WOq7806dqKaJYlUS2wLJSYBwfjqjGn2PFuqHZ
	AbHXL+rnteeyHLbdP1a2tzFd8xM2DlfPrKiEXH1Da/YdKkuHl8+vb/EhK9epFJ9Ce4Zxkt41t+0
	uCpiJOL4wKUQ2nEIi3cVBuzWtIr5jo1i5RoWRxDoozpd6KDRisK4i/L0npuTGJqYnsGKYKTnI3C
	AKylM3OsfTFV71kBY6f0+O2gMcRA+244opfZ5kPkjPBKGfMtw2yJPWyEwTuyF8UWjsNiGIya9t/
	2KFf1pLzhyhYaSqzNhPsoDuii0Zdd4Ef8jPmQ8tc2xp6G0kC7iJgPMJLrbo6cD3OKGNcmWMInfd
	3YdWBwFqttcPSpNsADgftSwqG6Io1O8Px68eStDcVlCsUtm9qSqdTB1tgzK+JRJrdbpPYIVJMgu
	dwO6Tj/oy8CRtSxlI/ZR5fB6DXmh5F+B0=
X-Received: by 2002:a05:6820:626:b0:69e:89a1:ee0f with SMTP id 006d021491bc7-69e89a1f5admr10618764eaf.33.1781102793420;
        Wed, 10 Jun 2026 07:46:33 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e4644ddc2sm12069165eaf.12.2026.06.10.07.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:46:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V7 1/6] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Wed, 10 Jun 2026 09:44:02 -0500
Message-ID: <20260610144407.438846-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610144407.438846-1-macroalpha82@gmail.com>
References: <20260610144407.438846-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document the SG Micro sgm41542 battery charger/boost converter.
The parameters of input-current-limit-microamp and
input-voltage-limit-microvolt are defined as such since they are in
common use among multiple bindings currently.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/sgmicro,sgm41542.yaml        | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
new file mode 100644
index 000000000000..af80fe528505
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SGM41542 Battery Charger
+
+description:
+  The SGMicro SGM41542 is a single cell battery charger/boost controller.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+  - Xu Shengfei <xsf@rock-chips.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: sgmicro,sgm41542
+
+  input-current-limit-microamp:
+    default: 2400000
+    minimum: 100000
+    maximum: 3800000
+
+  input-voltage-limit-microvolt:
+    default: 4500000
+    minimum: 3900000
+    maximum: 12000000
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery:
+    description: |
+        The charger uses the following battery properties
+        constant-charge-current-max-microamp (default 2040000)
+        constant-charge-voltage-max-microvolt (default 4208000)
+        charge-term-current-microamp (default 180000)
+        precharge-current-microamp (default 180000)
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    properties:
+      otg-vbus:
+        type: object
+        description: OTG boost regulator
+        $ref: /schemas/regulator/regulator.yaml
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    battery: battery {
+      compatible = "simple-battery";
+      constant-charge-current-max-microamp = <10000000>;
+      constant-charge-voltage-max-microvolt = <4350000>;
+      precharge-current-microamp = <180000>;
+      charge-term-current-microamp = <300000>;
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      charger@3b {
+        compatible = "sgmicro,sgm41542";
+        reg = <0x3b>;
+        input-current-limit-microamp = <3000000>;
+        input-voltage-limit-microvolt = <4500000>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        monitored-battery = <&battery>;
+
+        regulators {
+          otg-vbus {
+            regulator-max-microvolt = <5000000>;
+            regulator-min-microvolt = <5000000>;
+          };
+        };
+      };
+    };
-- 
2.43.0

