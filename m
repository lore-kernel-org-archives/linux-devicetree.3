Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763163DA7F7
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889195; cv=none; b=jnhp0nuGPwZbSlcwaINulfpgGSRjUoxDLwhWTsKJK+nyTAxga1aY/gwfH9y2Dw1JTsx3I9utmRbJGYJN+VS2FY98Lc/RbSRKTsxlL36oGcDU5fz/W1JsaFT1ScjdLvYdLGg/jYuUqSbToJd3fymk1+3lluIulTCNlL9PF8U4do0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889195; c=relaxed/simple;
	bh=UGRFSj5Ba3is397uYXqZUWK6BEHYREPYtCW/7pqYOYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MN1al4ITjTHadr7Ls2T/EDZ9pbZlh2CX9YBfaiyc/T9F224OvawwVwKhIQnnMZmHtdJKvGzW7KmivHj5lRNt2bKWtVm2i7bIXsJvcJrup957QX7wpsrZHzjG0tcGRWTOfgVtWs6d0NfNUkn7LXKJnZAk9LHBS1Z8LA9a370EKUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A41TPXXX; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A41TPXXX"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cd7284782dso286146585a.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889193; x=1775493993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbcT5PNKPZsRmJFnWFIOFaq96gfL1gOp/mxwODnDkPQ=;
        b=A41TPXXXmdUc+Q+HfvIhYbOgrHmoapNir8A07oxqfS4AjrhZhXwVUR+vIq4m8eq7Z1
         nQtl8EcjD8z2+XQl96A5xebpWRroHeW4Wx/MPBwqb/y2IhdaC+pGOtrMVzOJNgxcoMxi
         fPMZ59P8LQ4AVkse3xzhJefWdjHx+rPLquUokd74eoEAKeW/3KZQVZu46+s8Sc7VARlY
         hSUNMyAGhVSpZu62iyvkZl86XVkvrFn8j1bXz5D6/9QBM6EotaMwdkrbGHzvkmpVwoij
         ts018aOr/CsjyJOZqcwOI0NTABkclH8elkS9YzMtLMDn/OowcY4qOD9HynzWpHOd0o17
         KI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889193; x=1775493993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbcT5PNKPZsRmJFnWFIOFaq96gfL1gOp/mxwODnDkPQ=;
        b=gciFpTVYIA/q4LQIzu3XN8xIKZf4JOBssVA3NcSsffUls21g8Vr/IpVSrPvNvOh5tc
         Ic/oT4WJpxzjduLwVQwQLlG3kuuY0AMwJ6n05Jaxvn1cethqsdE9UXN2UdHRMLNL0C/v
         5OGHuB14JA2ZoF2VJPw0dhbr2FGXDR3yqoDfHxw3Hd69fszKr1KJ3d011rLpDeaJh8nU
         yBLAfr5yi587jkD7ULBSnlzih0mSNX97rTih/3uNHpTC9Gncun5zrncM5t1GeJ7lNBzB
         ZTZETxSSjiQophJ+aqaZSwzUPAy/e4LQm/0AY+eFQCl+IRa6fwUxcd4gq3942Ty/6yAf
         pX8g==
X-Forwarded-Encrypted: i=1; AJvYcCXJ4J2h/x+ma66q7m0yxIwFrSic53Z5bVh7Y5xz+kXxpzBxBC1eIKP+wV8NknbYbnoZ88CP1BFBYE1U@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5WJpQ0mKpOesfGROXJlVGPT0x5WvR7kdM20/BT31NwZwJRVV
	EXwFa6/wNwO/yLiR51gNMSzMwBe9CgpPVZ9jLRmo66Cntql6Wlci8qLV
X-Gm-Gg: ATEYQzyTvK/ekDcBgtUJM9yR4Y5z/onQZMXK+1Z2G7KizGkl1EbZKVfF/wV4uYXPY/W
	uN/Mx4LrsKpIWW50wm7y3KWcLRBSEmGWIVIpebstgIAzpxjb4QZKaLaHEULtU+kDV9GogVJ7oMD
	kVOmvuJjQDpM/8jHoiW7G5zEpmtMOreLDU+VplbOlaLBnyggodBtW/6N53Ov9d/KF5vkyyeAfNC
	hJJ6ElUvD8AjXqV7Ek8IKBoj4ItwoHh/qDnYJ3p0s/IGxy0HWULi9H0zV1ClUCfUQfxXWvHbqBM
	nkZrLF/TXJIiJiKUHFZx1iJA12njeN7TjtEaRqhY3MiZs6hMh9a3g0b2aUxVWEVMg0KkhF65eVx
	ak2TAvdelkACYiidzTEp8q5ki5+AqDJu/QuWJF+cu3rNttEyd004HAvb24QjrFwI0uAQSsKuuos
	AXhXwLWxu3y6RFhzpyuKYrTIY=
X-Received: by 2002:a05:620a:269a:b0:8cf:c08e:5f55 with SMTP id af79cd13be357-8d01c801736mr1622688285a.60.1774889193277;
        Mon, 30 Mar 2026 09:46:33 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028095f1csm741102985a.47.2026.03.30.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:32 -0700 (PDT)
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
Subject: [PATCH v4 2/5] dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
Date: Mon, 30 Mar 2026 12:47:04 -0400
Message-ID: <20260330164707.87441-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
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

