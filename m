Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D1A3BB13D
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233235; cv=none; b=DYXeOGGwjha1OclM+7+XuQvcIR9U/2D6xFeKXdzarh7TfqUlkGdpvI6wcx/8DAiDI7CxOAy+deyKFEis3RNLEotg6KBf0ZCciMg1f/hLwr71hpDd4F7SzzuvOUoB3lCn6w0A7raArwvyVVM79OCKVuNvASdUvwsmr9FV/cQRPNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233235; c=relaxed/simple;
	bh=L4hjxrVI9j9WNQiTNo7E4pMfYOhsq3Kw++wyebOLp74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWC6E7UxgnNx3/HD3MMfYE5jzP+sfMfqeK+lKwAxwFz/76FuRhCwoqIc9G4fpn69DwTGThfs6av4XxuZQIPwkI8hSmIDax/+XPSaEeMTKX5H6t9Bv5cYw8RDrHpOgRbM8uDOIJE77Qhvauav83UCPTc9x/eRAublj3YmA5cPPuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw+t4m9p; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw+t4m9p"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so4445695ad.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792233233; x=1792838033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJMiI3zn0Ah/6v7E7BqKNzfu3zqpMlEsQjtNsehcFhg=;
        b=Zw+t4m9pTvbzqeGSsoTavHub+dMoO4riTa+0aDpo9itRvLxx42ZfC6+VfmAPzc+609
         rR3Gz3DKJrlGiV4z06YqKchs2D3oVRpQojCmH05j4I82/kK5HGuEmveOfoiHTiHGrQQm
         ntpSVfomXmgi9TQoEWeZ7e8fkcwksCdQHLT9P0tEbCOrdLoKZbRqFnCsJARlXlxqSGma
         oaEUqVB2kKYnlSASBM7PUKV8i/G34rDki61ggHLFUQmABrE3Sot1Y8t+v0urQqixUZgH
         DU78r3t+Y6yN//Y0mHGgQNqKatFfv/RYyALiQSnUc/vBx4bWMdZTxgAZyMiFoJKKMohq
         H0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233233; x=1792838033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJMiI3zn0Ah/6v7E7BqKNzfu3zqpMlEsQjtNsehcFhg=;
        b=OhnLq6l3BczxPBcY8FhpJGVRgG5wP6Dl82zp+WcsAT9IvxqNxvyPOqJ+dCeBQ6iKCk
         UKiM8vizAYCFlH/Wg5AxjAREUgv3MzQfdA1hhGN83a6frqjZL3DV1y28jHGJH/el9A4v
         1BjOZutzukaGEf9kZpEjZe2OUOwmbkg0og5o1HaKwe7yN33BN3Q8/eJ3Vru3QtlYConm
         81NrR5L69e8QV9DDKrAbEPL1bhafi6dl8VWie2nt3AMUC0o5WDncuCTGw6E6S4VsEp2t
         5GVygzRZlgIH9a+DIyVpjeI9YP3cem2Mm39MRfkdgwza+XHEk+DWWaoMvwBvcgjgk5fh
         P4og==
X-Forwarded-Encrypted: i=1; AKwUvBxIEqBhV238zmUTuqEIb3q5a2ToLiYb0dALIfz+2ugRTDi6rnvhG+2rhHfc7jwKK3aQ5CKr3YirWQdJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLwrcJeeMszLo4VHjgeNOl4w41tk5RYuOAKPCkcNg+uoWUQsG+q
	HAvWfV4tiZrl9V8S1qebxg6wrdxW37QKRT2Gbi32sEYWD8l6hkhINyZY
X-Gm-Gg: AYBFou0ieTtw4oaG1kDU2a+ti8Hl4lSeTn5UZ8aabaS3j/PuXdx1YEID2JD2OpjlYYx
	ruhHYs0kKnKNZ2KsdXKTLgMq135N3UHtPkJEXK0pIApj7G/FTSRMDrXPdPioCMW1PpespB9okQw
	zJ+9wEIG9Ibl3cEZH1NW3fzvcu8mF3nbSFTr/OtGr9ao3YRrKU7x1H+cklQoJ3a16ns/+VNnQPt
	QkPFSW5tXt9+ix0/X9sI06GlyVHTILBN1LoxAPpubNXcfCXz3LVn8gilljP64s8jXX9e6WXqm1W
	agR5ZFuhU4kUOMAFXtANk24+FrvI+SYo+DhURlQAuTpQFVUtE+fdF+fHIjKwjTaWJ8Ptc8M05Ws
	JHqvJRPVXjNaf/oF71tiovIY6n139jU8VMwjSp+TLDn+PcojrCC4WH7q1rei6g4jzeCj0E/6eXo
	MtlF0BehWuBLCaITXyu662qRxf5TX9duFH8OSUv5RPLkvCD4VrS8Bxgcif
X-Received: by 2002:a05:6a20:6f8b:b0:3e1:7249:e26c with SMTP id adf61e73a8af0-3e226057ed8mr1628852637.34.1792233232952;
        Sat, 17 Oct 2026 03:33:52 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:372d::57f:4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58414986sm2051585b3a.57.2026.10.17.03.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:33:52 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: display: panel: add Smartisan TD4362
Date: Sat, 17 Oct 2026 18:32:49 +0800
Message-ID: <20261017103250.800109-3-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017103250.800109-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Document the Smartisan TD4362, a 1080x2242 command mode panel
found in the Smartisan R1 (trident) smartphone.

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 .../display/panel/smartisan,td4362.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
new file mode 100644
index 000000000000..d9a18cbe635a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/smartisan,td4362.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Smartisan TD4362 MIPI-DSI panel
+
+maintainers:
+  - Lu Chen <tianshi12127@gmail.com>
+
+description:
+  The Smartisan TD4362 is a 1080x2242 command mode panel found in the
+  Smartisan R1 (trident) smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: smartisan,td4362
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "smartisan,td4362";
+            reg = <0>;
+            vddio-supply = <&vreg_l14a_1p88>;
+            vsp-supply = <&lab>;
+            vsn-supply = <&ibb>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.56.0

