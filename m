Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A51368D73
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783265825; cv=none; b=BNrqS8E7Wk/EYOmIt+jpq9BSfPCtLfE4kPEh68mCGxZDmhy4ofiig0dOaggbDfcPTU/5pfbbpsn9+KQ74Uf+6LEGn8r68jSGuAIMzBf+i7l2GPs5Mz5si6bz3YjQvmLc7bBkQyX+63u7yT4yU3E3Zktea9BDToZjK8ywY/5/jKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783265825; c=relaxed/simple;
	bh=E3VeMurdvuO9lZQpxy9ngIKPz0EtT6qzRP5NTYYMJrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAgD6S5+C4gHyQ43hcLbH6PdTz6CvoTTWPIaWPuAituV8nMB4NhKZs2ehElUSaEcofPVNbLW4+P+OBgv8BvOflJmXy2vx5RI45V31V3nbmL/c9HkJVtb5p5Y4LT9Rx3YtGH023zWbl4QSscqI3Ij4JYJNstRWYVGms51xtQOltM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/Pay0Pj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/Pay0Pj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847e6f03df8so2765034b3a.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783265824; x=1783870624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMHOwB1gJgFIEhx9jNa5p0baI/PKUY5J0BR5RvxnEJA=;
        b=j/Pay0PjfZawx3+yMahR2PcRlFrlmQSdGRXW8paprJeWMyBAy8HWYM5lZFeA1GrLda
         hRYL1f0DylgxH1vOB7WscrHwMGp6JmDVT6k742jUG2Y1engefwL2Y/GFIu+lVeJLul7E
         VjCvWovg9JACZbfJl1u/GnLhX4fgAKDGnZR4VfSV+2Yt/Ffe8j7o9VfvBc2vCnzKAc5z
         HQwqZapBXikVoEFZg17zgIIEeVAb/H2nLzLCH7diL/rsmw2gFGSmvKuCT3oK1ztb0MaE
         BFoMZjBTwYYykbIxVhZkMuwpCZ+3OPPXWiFImGlu9/jy/byPWzd0aSrRJTdUd4XyM9Zk
         ljgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783265824; x=1783870624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMHOwB1gJgFIEhx9jNa5p0baI/PKUY5J0BR5RvxnEJA=;
        b=hwJJta+/6J1lffjTWIA9N3sF6JpUKXQJdmLpDNMvXXRBEWYfvUNlHdVx3cOa++MeZC
         kmbmUwJLIG88npeNcievqZT7SU8kuBUgvKcbKC60FPggsIATpSdiAtiMUJtQRiKdqZIV
         dvwsRLFDLruTI5Rkv5Gd+P6vNTGIeql3Mfr57p2PkPEBlC47g4ZiTXyDqv4blZkl+sxa
         HNS7lmrjvZAiClFdnOxC8ieC/QeWgkogUQXN7RVm8GIPQQ9KPBvMdeOM14RtrvZE6191
         WxPRSCDvuxqbjjIWV0thF1Kpnf+XPpO2Owto65zrd8115nEVUOKeofkJ5QAlsv5p2BrW
         jtiA==
X-Forwarded-Encrypted: i=1; AHgh+RoHtfFBODgaT9yuPVkjjahOoYqn1vSjwzMFYDZ3ooBv/Y1zDO0jjt+fI1CArAIzTbZkdmKXN+N2eGN4@vger.kernel.org
X-Gm-Message-State: AOJu0YxUgZc9vUtZWWtaQKx4r63la8nOv7Dh8zzOgPcqx6PA0DAmWgMO
	NmQGylhLUhTMgoATvJ8Y5xaFqHb7IsXZbkQLffpuAARjILf6B5Pw0sZW
X-Gm-Gg: AfdE7cmCz5eOTUrBKaG/Jh/12Y9DuXwzY+4yqaJN2nLLX0OO7Svn5XjX5M7EPrC5uhb
	R2ZfiujnxUjek4exr9sbNVU0zDHRGilbEPoN6YPaciJBpZibs9RfBZDVxhoRqkp1EWd1T4pBgGx
	nq3HoQJ2/P4bOmbxk7Uq2GJ8MSYEl4v6HFRoJSzTZvDgUyLgOarF6CVvRSfWQrTZYSDjEaQN4C8
	oxi2c/0agDNBt5Af3UJoutfqBTX2gfRONNqmoS8C1MiIy67YIz59NkQrTjAPFQMRGioZpNnZQbv
	Bb+9Gzz2TW/HZImV+41W5NWLgFSUSkErVHWjHaKdefGY4j9r55uIRxrYOKeHcXRK6OTQcNnQKDf
	Ze/XCHVdGbLCaGTM3+ZJDS1sM6IUEgsvyv0yNaYeq/e3/CTwWnulv9/tVh0Hl7rilvQAXgmv6el
	l+Nzl5dSfOCYljEAwnQkm40H4ro9B1KdLjpZO8Yk8=
X-Received: by 2002:a05:6a00:44c6:b0:847:8d56:1f71 with SMTP id d2e1a72fcca58-847f6dc2c53mr5948118b3a.21.1783265823618;
        Sun, 05 Jul 2026 08:37:03 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm2402076b3a.53.2026.07.05.08.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:37:02 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT36536
Date: Sun,  5 Jul 2026 23:35:14 +0800
Message-ID: <20260705153515.46147-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705153515.46147-1-mitltlatltl@gmail.com>
References: <20260705153515.46147-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NT36536 is a driver IC used to drive MIPI-DSI panels. It is found in
LENOVO Legion Y700 Gen4 with a dual-link 10-bit CSOT panel.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v2:
- Collect tags
- Mention the CSOT PP8807HB1-1 is a dual-link panel (Krzysztof)
---
 .../display/panel/novatek,nt36536.yaml        | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml
new file mode 100644
index 000000000000..0862998cc6ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36536.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36536 based DSI display Panels
+
+maintainers:
+  - Pengyu Luo <mitltlatltl@gmail.com>
+
+description:
+  The Novatek NT36536 is a generic DSI Panel IC used to drive dsi
+  panels. Support video mode panels from China Star Optoelectronics
+  Technology (CSOT), such as PP8807HB1-1 which is a dual-link 10-bit
+  panel.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - csot,pp8807hb1-1
+      - const: novatek,nt36536
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  backlight: true
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - reset-gpios
+  - ports
+
+additionalProperties: false
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
+            compatible = "csot,pp8807hb1-1", "novatek,nt36536";
+            reg = <0>;
+
+            vddio-supply = <&vreg_iovdd_1p8>;
+            reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1{
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0

