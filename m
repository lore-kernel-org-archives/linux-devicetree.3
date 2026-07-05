Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8893C2459C5
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 03:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783221746; cv=none; b=HK2Qsijy3ac65wBoSW7BATeUNEfbw4QaCpXkTIOiEHcC4XQjAijhzk5bFbj6lDuLGbpaOspiTyMkYJR2uQOX/AOhktcWDcDz5aHSPnLmFhMIMRS8ggRk2riIYpv2alzVjmGkHP5wWx4sqp9FHlJSghE6eKUboH8pRVIObfDPnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783221746; c=relaxed/simple;
	bh=AARiKfd2W+SLSBr6CGe7FMomAjcflSVYj2+XRc6YAoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StgE+g422r1qCVwvRGjnL3toNdGTHAyCtv7kIus6hAmSh7qZy/fHqVU7GgF5floV3khGrlkyLUfavnbGG/g4NkUfmFbuK+pqtgDZZgsM77IoKbnWpHlL9nOpy2jNTKeZYbO30H786UEp99QUjQ9nSeH++aOGCdYDJO8K5odfEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGIa6niK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGIa6niK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caed617615so12504875ad.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 20:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783221745; x=1783826545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuqQpmGzRnX3zbaZKJbpvLAXlsBzMhwAPHYNslX9wpE=;
        b=fGIa6niKb7r56pd/3rbvaUpUzozEyLKyeEP9T1IkhdeVuGj6ZRckoIDCKxnpFa8YJ+
         rIMYI895Ev8pbxuuTPnzuHlmibOsK+gtq7IWf3wK6hP7mMuTRWkOccNxRSXKW1p2tat5
         mqeQc5LrIPfGVjZa2fqy7Hb2qGqZdiKZOS+qC8MJ1R0JU0Ey7QlPeM3zx6n3g7bvgy4Z
         dY17kEhIhNo56+R5+lBPev/tjpZUeDDW8arjW629MyCYZ46RWjJYyl0Xo0jcnaqj1neN
         2ukdofglwVtRbDEFuSyLigF2dmRgbDT0M0gTMpNGcKHONpzv/7ncqoxPUjz+pIFdVoqi
         E1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783221745; x=1783826545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TuqQpmGzRnX3zbaZKJbpvLAXlsBzMhwAPHYNslX9wpE=;
        b=LqTnhOko+zoXjTUGfSwPeRew5PlFU3VxpM+kn+qf5gMD8WUxQtk73VV7avPfmY0Vms
         neWbo4x+h03zmBd7Oi4xizxi4GQVfrZx479dx97Rr/xSqEyAxjcJuqjT63rtiKEztJz7
         /AhsvaAcjamWva+V+ZLohStO61e2QxEIhd20hF+C25dtexHZcwQ5rmRiajmjd0mbww3v
         SDlNqDvrhc0n8ScsHEsprzaIqvZkFf0EkBsSgJKYd95TQgdaGb8bz9Ix4eSkTVjn3npY
         4WeyP0TpYzhCdmFQWpS5v+XXtzQFTkT6W5pMp65Oe9f7/bGX0NT0IU9yKN9Y4n18b6Uw
         tKWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTLVoVC15+PTnqtDy1XMhjxYlAaaUaIegItvTopoJxIfgcEDEa3jI8DvxEszH6bC+M31GT07InG0Le@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtYwfgz2VsXRlmGEUO+r+lgMXjt/UgXDSfxygJGoNVM7+SpIV
	ZBhtGY5GhIOby0mlUHpyXN2+gHQvuGiWftkkWPekUNtHr7KaqeWS5WKH
X-Gm-Gg: AfdE7clkPYOzYrSUe908pBMb4BXWKufQRKmEiBKytbuV2Y91ErJXN7Z8/Vzm9bnj5rd
	tBlAbNhsKWGq60aOuZUixeAswzoDpJXF9DxM+Bm/cVdQ3elfB1KcGinnmRgHGZxEe/SEcvlSdHA
	DU9Wqo9IkEsFQCL6/jejN6AH/F5K1fhYMFXdU7p5Lwn11bkJs3JLr3e3j5r2p3GwhtvmXHGE551
	mdk1X8bxVORZZXHv4ew2ADgHoOEo0k/fGp8yLJZm070k1bPMI7z4SZ3lbd0TFgPAxv+hDGlV3n2
	88SvC2Gu1ZDYSKa6VtXbXlOzXolrVqzMKOR5HC8A52NtVGKpylrgmZkqMoGuBjgqrDPHQF+doFk
	Bz00bd9h1C/H5BYao5L22+HEaOmSpK5T9uA4zTbmMUF9v5h9oR7NoYJjVoez7UGievZ5T9Kpxku
	YynTFkLGY0GvhU79gW
X-Received: by 2002:a17:90a:e7c4:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-382802bcb6cmr5020863a91.5.1783221744732;
        Sat, 04 Jul 2026 20:22:24 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8900:e54d:68b:5bba:3eab:6b41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813c4dsm35139723eec.7.2026.07.04.20.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:22:24 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Sun, 05 Jul 2026 08:43:34 +0530
Subject: [PATCH v4 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-hm1092-driver-v4-1-0a13ec274d89@gmail.com>
References: <20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com>
In-Reply-To: <20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=AARiKfd2W+SLSBr6CGe7FMomAjcflSVYj2+XRc6YAoI=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqSc3lWSXYsaIVI9e1vjbm+XQ1e1aPlqqbZzLRm
 wSJKJnZbVuJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCaknN5QAKCRAVlYpeERwF
 3r7zEACgHwpiRkOmKbDD6yEq6WSdwbUEaD0ZBZina9jzIaMiSrR3gKwuNNG6dJMTrpEHFF+FeBf
 qBN55b4EKyIZoKwUSMDHY6zB7hn1jsYjbYlkxprOcnmB9soXDOYrsB0iyZOuOThd+5gTRQOjCFn
 AKU90jt5cIwZPM3fspJhPBspt0tcCS2nkpxzXzPj64yXFTtibanIeP4Qt4rrKIc3lkbcxArBhEs
 FP+yACiPFp5QsGj3u9B4w0RLHTTNI8NAVijCN2ZRw/G1Jf5fodTE/2+bLSq6biGHAEwpqpobwOE
 pOF4wJsRDL0kDzl5+kWWBJr5N/3CDfbMPC4w4oGR5e2s7n/0uklejtHLyFGo4//Ou8hblndVej9
 J1gGG3yQaGxTCX4cdNXJtaITwuAlCW4z8Uxtf/2SATHGCCcvGQ9gIAsc8QCdcXkJOGYLHVPOVsh
 vhg2PXP3ViXyq2OtThu7ZfcLsGKG30wcI9nT4kzpXDTZdVWK9mBvQSrvBO8zuqhlOledIfu4ail
 LoAAb+Qq/6aig37fVoL8dYnIJ6b0Nbst6gwmx4AL9eAtpCwq2UKCuIiukwMVPnz8VAGvsvRdA5y
 Ds+13R7tbp9kq92dGiZlFvM2J3+RZVSaNGVhQ2RGLW69RaWIrPksv8n5wXd+kr8Cfg2aaw9Ip07
 /x2v4tIaKJH+GBg==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..49f8d6e2ef93
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1092 Monochrome NIR Sensor
+
+maintainers:
+  - Ramshouriesh R <rshouriesh@gmail.com>
+
+description:
+  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
+  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
+  face authentication on laptops. It outputs 10-bit RAW over a single
+  MIPI CSI-2 data lane.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: himax,hm1092
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+            description:
+              The sensor uses a single MIPI CSI-2 data lane; this defaults
+              to 1 if omitted.
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@24 {
+            compatible = "himax,hm1092";
+            reg = <0x24>;
+
+            reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_ir_default>;
+
+            clocks = <&camcc 1>;
+            assigned-clocks = <&camcc 1>;
+            assigned-clock-rates = <24000000>;
+
+            orientation = <0>;
+
+            avdd-supply = <&vreg_l7m_2p9>;
+            dvdd-supply = <&vreg_l7m_2p9>;
+            dovdd-supply = <&vreg_l4m_1p8>;
+
+            port {
+                hm1092_ep: endpoint {
+                    link-frequencies = /bits/ 64 <400000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.53.0

