Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E8D352C22
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663829; cv=none; b=VcOwXdP7hNmTHeywIa8ymmwq4z/hNxLxfYBpxb1uMRUHlaMO62oV5scrvb2cRrRI0A1yviFpSa6H+7PMpLUBz0+3v7ecV2KVLT9X93J0z+usaHSwWDryuFBEKU5TDUG0/aKwhLr6FijYPUNmrWXQzDzmrtxpsqbcMjkiNb/7Abs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663829; c=relaxed/simple;
	bh=eefoE2/jnfXAd5ZwciSBK5AkUaw4ydMJne1QeWmfh54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lK8hz+gzkKaa3mRSbr7ddT77w4MBBhcWAQngthIR9ZCq1Q4tDG9bdr6Vav+/DmQsbX0Q0pk5uhko/kI9NPMy9Q300xzVwguo9AkDvHZrsui+YOlhZF/0qR1NBLTon5bGYBKNn6bJSAbYUCughqAlSGQD+wQ8Q1HSc4dGCyAzcVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fb5n2/cG; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fb5n2/cG"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506aa685d62so14854231cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663826; x=1775268626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpLyTYVFGXE2glJ5ECH5NLKz7sG78XOrtnMCJzmIFwE=;
        b=Fb5n2/cGUg1ZHoO+g3SVWIgk/v4csL3Apn3ZyuUULQAP6xfQXnlnx0t6TGTZLOqv0q
         cbFQ7X9+3rIS263LKNIxy99ZuKq/ok8WkwL/k3ktEuKCW2c07fNMWBtUpKyeWSv6XEeu
         Y+DSk1ILp2p4dMufSyyOXBkJl9GjdP9U/3/CGVBjzsJfSnRx20/H5vcxg82Mg8sud22H
         4urBAD3RXjZZ4WkpSeGH0NYmkalknlVq5U/eDQWtgv/k/SA1DGAp+AecW+TUDRAr2BQS
         M3+jhH+tPSapYSrAFcawbeQZ72KNkFnlMXvWD05u6LpKRixRfMQ2U72WmBBLpTtYuVO6
         djvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663826; x=1775268626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpLyTYVFGXE2glJ5ECH5NLKz7sG78XOrtnMCJzmIFwE=;
        b=jINWv3TCw1l2iiw08s5eVWfJzMcccZD4kb9eeeRgIS1esjEa+pCWF8Qr9/vXvahy89
         qp+5/e2/qhIUP4esVvUhe/QJWZsren4+f52ew1AQHaPOB8VRMxq4DOAx+k1mBOFwmQO9
         WCqYJlNCQ2OsCMVYE/sD7uSToS+91KQ+UpOBqU5Rhz7W6GldSyheESxzulD3wz5u6+8Y
         3MebJ1tv26S5xC0nqV2UPMlaP9MFXbAlsI7VBRyUo6qJJ5cx1Cf6HcnNTkpks9ouHBN+
         xA5Z2gWf3zm90fRw52uEZ6GmHBU8GiEmx5Dh3mZYLteRveIICKuLFhGbe10IPMf7ytJ5
         mgyg==
X-Forwarded-Encrypted: i=1; AJvYcCUPnmqKtg8hYlAmzlkhKu6B09SKhr5po+c3ARPASbItZI16wdSGVKpOpFi+Hs1nGsHgmsSUXWZ56oQe@vger.kernel.org
X-Gm-Message-State: AOJu0YyBbLauInKTKgRyVb+IO8W8jKoLaTNadV6ckaF3PEJWv1R4+ujN
	MPKU5I/PpCWcCwcnNgBmhUPXIP9TEGLllc5qOE0ZVTJ8NGsajeC9gfi+
X-Gm-Gg: ATEYQzxZ8WyTYHA8BKwqSqTNfLEZp05r4hcKoSceYBp2LJrkkBPab2qC7Zn5VQ/LVQt
	9khXMejVCo3YNpwk8v+FjBYq+o8BRCV7GRiJHIhyv35PrQsH7dD3IsngA7MrIU0P7tYIYUb+Zid
	m5QOvz54rf6OtVNDLOGJjoiYYnNtK8UVqSR78e9YXMzC/4LCmty8YWlxbwicTOwJ8D1KO4IlOYu
	LNCuF3Du2OzNlSwS+CXfgs+g+7l9qkSmKJXNiUnypL/T77pbIUPA76BObBI2d/fzxDrBxwQiAwg
	i4CoWq2P5WfmSAM02fi8xqiYdqsfiViq4TwdI+SnM5iDM8Op3g8mPUrmRgo/iEo/8pUnZJzl+a5
	XL4Vb2ba8w+ld2CuUj57hpXF5vr9t26U9VrnZORZtq6wxz+10hH/iBgcLWQs37r+l7W8Y4R4RVP
	Yne8IKgnL8zCAPIgls3ILywpP+tQ==
X-Received: by 2002:a05:622a:5917:b0:50b:8b0b:11c4 with SMTP id d75a77b69052e-50ba380b4f9mr67449431cf.11.1774663825800;
        Fri, 27 Mar 2026 19:10:25 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2ddb083sm8167131cf.15.2026.03.27.19.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:24 -0700 (PDT)
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
Subject: [PATCH v3 2/5] dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
Date: Fri, 27 Mar 2026 22:10:33 -0400
Message-ID: <20260328021036.85945-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pin controller for the audio Low-Power Island (LPI) on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
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

