Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B03CC9F5
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987587; cv=none; b=dJ4f3j/W2XcEp3D5gMda7wHzi25AlCna9DAkZIZ1KMVSwYWa63Wd4KHGuLEW/5Nxjvtq1SmU7KNryjYJXDbGcp/WDGDrvB4cUMtlAVJ2L1bVGeYr56VG8LCjwb5EAIR1iz3Ogx9QeukbpFSZL12JvnFd5JAk2IqFRZGp49vTmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987587; c=relaxed/simple;
	bh=UGRFSj5Ba3is397uYXqZUWK6BEHYREPYtCW/7pqYOYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzMb4OnE++uPCdZHvNS3RMCZQVN9e7kCA0QlYadS+fIMkn9qC9eEibzKfRVTF2sBke6gAcvdYsx80F59+vIhroJB7KvAa+KpU/DFRx/hygAzaitTJ1gKW8n6nKX1IipmJeiKcF+ExvWsiaEj+o0cAdAZ5NA1MKYjtLajoN2xbiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0h475hA; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0h475hA"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8a151012558so27378986d6.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987583; x=1775592383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbcT5PNKPZsRmJFnWFIOFaq96gfL1gOp/mxwODnDkPQ=;
        b=o0h475hAX+8MaUe9AJ4wqo7v0JXkm2eyPNi6fX44fVKWwlvZ4w8m22eDfHNYqNs6qb
         WDOHQy+TMv+nNHUbjW1OCifupaEFeX0fVEp78zQAp13SDTgqwovGtGmVow9wfaERKPfU
         4o2urNJ/qsR6Oo7pPaCt2sehiP+VcTgXQW35wxH48woJGvMPQ5kn7VFENBwEQhnuBT0+
         ueYgHKizaG6gOh+kiU0UbRBoN6rkNKrOsFFQswdbXflQq/eJFfD6pELyw4G0u21toyv6
         wAPLKF2aK+5NemvHrJN5fY3+JzrH0l/45f48XGP66ph1pTqAVyB+K6X9RRlrgKU62Z7s
         lmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987583; x=1775592383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbcT5PNKPZsRmJFnWFIOFaq96gfL1gOp/mxwODnDkPQ=;
        b=hKnHx7jEUr3RyV3GaQ1NKs+AlOLj8R6Sdi9wELs/4e65jl+HE2EcT9grwPy5HMMAkL
         sCGuXCoULEJARop0+BDuH2XGVb8FuEaCkBq7Goohok2XRTLpld60b+ZlSOitotMvJ98H
         driczIDwCOrgEMR6H9O3/rbo1Td66yGtXvlZH5klCvRgGsE206TwtlnComMZCRWJLCTO
         Oex+R+gNwrJEqFvAGrs5dh6shfbhnSIWMMHT++3bKYSLd8Npfliz+4SibzcTsROwLH3J
         +qbRkHU79tjJNHt4Kif022aLbW8x9n2xHtgGTSwNBDfZSePPjSx+3fo0P1A1Qytli2kq
         10Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXYJpa+VJd6VUBD3ER8xHJJuOGix5eSPeQzScdoOTFjEZ8IHkyk0EHL6XHfosO8NpE805GaoRbFt43E@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/MBgCEAkd2EjAl/JY+9zVsUcdvbr/lMYENjxCsSEl/AI2hDc
	XjDbMESzZWddzrvAdsDeabK8IXc2CjQA0oV7iF7oRaBgvkNl4h01NmJ6
X-Gm-Gg: ATEYQzyYYPExcRI+iIBx+hNM8/yRwyJWSn8M3mvs6i03xRfGV4L5AsSFnQZla2rHSQY
	jHEdzOWu+ohUz72lnYGzs2D1CYwQVUksicoFb2A3eRxNi/qA1R33WVxgfGwpq0FZLdp3oIEYItp
	pmgOsu88rwQJ+3uyQL0ob6TluGeb+LAecXwftosufDYDNRuMg3SxS4MwwWCf/8QHDrCmPXVuReE
	U0uf67/TxzcMbKIInHn8s+tY/jlcJOjhQdk488MiAwGqhGB8g48EGnKMjc8xA9CTypGZexeblSn
	dKOiTARmJu3dTMfgoDmEwqUKAD26nCte9sTMqaMll2GbzTQPQmj7QMIFXQzMrGaHwHeg47whvaR
	FJn5kZCAqmFzTdQIMmsW4B9k4A4o+Grp+ezxgFDG5ZlmxivkH8X9JMfgIK8/2LC+2MYxHK7jOb6
	k34xTixy5uOg+dUFcSiywkJms8
X-Received: by 2002:a05:6214:4f05:b0:89c:ba96:5fd7 with SMTP id 6a1803df08f44-8a43a945af2mr13969096d6.53.1774987583025;
        Tue, 31 Mar 2026 13:06:23 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89f3ba99abbsm92411166d6.28.2026.03.31.13.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:22 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 2/4] dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
Date: Tue, 31 Mar 2026 16:06:56 -0400
Message-ID: <20260331200658.1306-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pin controller for the audio Low-Power Island (LPI) on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..c76ad70e6b9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM670 SoC LPASS LPI TLMM
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SDM670 SoC.
+
+properties:
+  compatible:
+    const: qcom,sdm670-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sdm670-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sdm670-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sdm670-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|1[0-9]|2[0-9]|3[0-1])$"
+
+      function:
+        enum: [ gpio, comp_rx, dmic1_clk, dmic1_data, dmic2_clk, dmic2_data,
+                i2s1_clk, i2s_data, i2s_ws, lpi_cdc_rst, mclk0, pdm_rx,
+                pdm_sync, pdm_tx, slimbus_clk ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    lpi_tlmm: pinctrl@62b40000 {
+        compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+        reg = <0x62b40000 0x20000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+        cdc_comp_default: cdc-comp-default-state {
+            pins = "gpio22", "gpio24";
+            function = "comp_rx";
+            drive-strength = <4>;
+        };
+    };
-- 
2.53.0

