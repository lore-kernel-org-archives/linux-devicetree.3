Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D139989D
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455358; cv=none; b=guGq69SFkN+IWmlkWGwS/L30bzYcxvuIBOUMRNWz0UnI8vBYh+URtSh2fW5vJW0G5gKM4g0eHXuTDFfAqTjc/rTsW7oahMNW6agcK9kSFJlTpf3JZ6egP20KnJraH7w0OdRoiDrf/VPD/LYxeoVyvQ3Jwy/pbpnUipfX5ZbDeWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455358; c=relaxed/simple;
	bh=XH9ZkSLlZXi4Q3xxOdKdClWcWnK/2QO56yV0PVRrX6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeDawTRpvrBkIpoi2pMja5L1cf1P1ty5sDlpHnZs/3wgj69fyHinaELZ9/nNQE7SJNA2OcLMZCSs/s+r5lRJzuvEnKsaB6HNJl82BPFlyksesokhaCdkRYfzl2Bryohzla/C04FYYH3AgOca4IqXBl4/OJKBMyJR34jviL+iWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2ter51Q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2ter51Q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49041e84237so7242835e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779455356; x=1780060156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRieD+RAjUYcMpIS7S33Q3GLSc1bkdYTe6Jma832hh0=;
        b=q2ter51QTxi/HuVNxPoQk2xkHcWQl/PJDr9Lsu9SQuOYF8/ov4UZZES3puXDLrrW22
         BAtUZ/z1Rd5B3VXqzf3B4NWwux/Q+HhetSx6QLVikLCech/Ijew4KOk4aipG8cQ+l0j1
         fc1mCG2WdBhen7WltH1spkanqbM6EpLZVmz560w6cD/ETrG7CKlsa4gIZd9elb8TI+Gu
         mHWsXvN52CqRELZHIWIpxL2Lthf2ENzUppjc98qqiqrKtsfcF6keF8ujjn5f3NO3HYC6
         1RYctpGjFb6gV+vhErVmiZ/KH9CFzSaOjHlyn1n/AIOTj+QNPAn9RP1pAYSum9BOBnZs
         aUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455356; x=1780060156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MRieD+RAjUYcMpIS7S33Q3GLSc1bkdYTe6Jma832hh0=;
        b=pLZaWU1RBJSgsZ0YWpjeg8shtgCpAsgHiuHfLiwmi1h7B2PV8XcTB7EL5P+d1BPxsq
         EeB7jM97CGMaKpoKlkrfpYDy/sHAATo1YdWuJbKaKnYcWk4Nvw39xOUjnp5urzdx39Mw
         s3gI6XmD34x1lT1zTxkUcq5B1JIhk+05CpaQ2xtFL4jw7HdcTPRkQCPcHl6blp/j7kia
         hBGO8NdXP5kho8CeY1xf1fUTpnDehXx5aMX9gLgCYIh9JdGcDxMe0KfUJhvqtWpiHb9E
         gY0Z76Onmwq8F3R4D95v1lF0dByyhZ7s9zXGw1Rks5viTnYpaFV5ayCzYvzoKlvn6Ws0
         pkEA==
X-Forwarded-Encrypted: i=1; AFNElJ9JOvr6xbKhu/UICn+72opIIpMKrlduyYAsz2Dn//2XuF02I3WgoFbHzzSzDelDNBbD0JiK+XzI0y4a@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9LhE7te6w15lSup65hEWEhYGLztBLA511EJnpRMatTpQIyaOT
	lvOb4l17DfDDcM+qkPHYx/pVSNQAKdLnwNYqVSUk/OpBSKVsX+HxKMJo14iqukJ3m5c=
X-Gm-Gg: Acq92OE5Sk8/qEWMWZy70q+aHq+ZNzsqZqmVq3bZQ2YU3IWLcmuix3J3z0LkZGzMEYb
	j0JxB9SLn1jVUd0Q37a3u5Qiw9JA90S6MkI+yq5fNBVuQ3PqRZsvnvonCoBsvW9RqSsNLEXiCVF
	Sx9XfYcSV2eOH0l9lY0nTcT7dmTPun5yoeBs47+Ne7N/a6HyobJAbyEQ9fI8NkpfFM9A9l3lZCw
	ir1Qb/gz1PBqaukutBmjmBPliqZ1TfhNEHpXrV89JMR1EmeQSFYPx1uuvcojLAW2lwzz9QUMD3w
	pDSMFw1WnMSrO6oiyW2Y2XwH6B7NuuYHi0Fk56KKgcL4M+KapgQUQBMrPugLXbHtsH/q6nVzhmi
	zU6NGZUtW49h9sdnk7qRk3aKvqwyK9epYhm7a+HuaO1plz2br+JjVVvNP5hhSAo6DpyDifg6kZR
	vmTXR6d/Io2KNvMWoNBC+z98z5x2jBpbAyzfHl/MHDy9JJjX4COEM1sE0=
X-Received: by 2002:a05:600d:6446:20b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-4904249da29mr30890835e9.12.1779455355576;
        Fri, 22 May 2026 06:09:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm45413615e9.9.2026.05.22.06.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:09:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 May 2026 15:09:12 +0200
Subject: [PATCH v5 1/2] regulator: dt-bindings: document the SGM3804 Dual
 Output regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-0-bd6b1c300ecc@linaro.org>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-0-bd6b1c300ecc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XH9ZkSLlZXi4Q3xxOdKdClWcWnK/2QO56yV0PVRrX6s=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBqEFV5/clXRdSP9+NKvtANaAm8ILY+Me0htq7PmuBk
 miLfG3WJAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahBVeQAKCRB33NvayMhJ0RHnD/
 icDI1LRTXMAVx2p0nh5Wr2xcncG88/gkStB7uP5sEsQr5uflOqHG8Lk2czlc/eOlfTnZQjbiCXt2Mq
 VOBdr47rzghLszl85c2pG59WK5ZLsBJEdbwLd21G8nEF1+SEAwNvhjKj+q+NiS+RDqP9sB+XHNHF2I
 XDqdbMlj0UVOPoOV+UCvtUn64M25j0W7Zh3HiC3ccjSPl+npbjRM3WXpYZk84ZZUeZKChacs0dkirg
 m+IsHHCsa/kk0m1GLUC/AbC6eMyOQ4XdLYLCpZpgd4LFg/nuKlS9p0IycUZnOMYxp2Cb6WgN3m7JQQ
 YrscaYdLKS0r1w08WsQ7RoCrNsdMJWwg2cpISVRuoXyfROxsQHLnYnfN9SVM6Kbabq5d3RMYYWB5w4
 f2ndIldMh0HxDZ60ix8zjYgBmsUp9hwbxX16s8Zw1KbaAe9yJQ8gzmUiENrB9B3IUL/5Am/UKwQXAZ
 YSG55znsevy3JCOyH9DG1aHdroqPa5jzkmLAVhHXUm0UZqHKxL2iHSzT6Qe+Cy1FzjR9LOOkJDuWn2
 tkMX+836h0dULOOAch34z/r040Fwih6LmBRUJpoYzIYZ5JMG6fodZw7SB4RxxD9IqtxJkq51QU8BOF
 aTJyky+d2hDT9qLS8nh22i8TleB+BkyfrdulAqSl4ATxB3vg+EaMVV/ioK
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the SG Micro SGM3804 Single Inductor Dual Output Buck/Boost
Converter used to power LCD panels a provide positive and negative
power rails with configurable voltage and active discharge function
for each output.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/regulator/sgmicro,sgm3804.yaml        | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml b/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
new file mode 100644
index 000000000000..3716eaf81aa9
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/sgmicro,sgm3804.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SG Micro SGM3804 Single Inductor Dual Output Buck/Boost Converter
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The SGM3804 is a dual voltage regulator, designed to support positive/negative
+  supply for driving LCD panels. It support software-configurable output
+  switching. The output voltages can be programmed via an I2C compatible interface.
+
+properties:
+  compatible:
+    const: sgmicro,sgm3804
+
+  reg:
+    maxItems: 1
+
+  vin-supply: true
+
+patternProperties:
+  "^(pos|neg)$":
+    type: object
+    $ref: regulator.yaml#
+
+    properties:
+      enable-gpios: true
+
+    unevaluatedProperties: false
+
+    required:
+      - enable-gpios
+
+required:
+  - compatible
+  - reg
+  - pos
+  - neg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@3e {
+            compatible = "sgmicro,sgm3804";
+            reg = <0x3e>;
+
+            vin-supply = <&vin_reg>;
+
+            pos {
+                regulator-name = "outpos";
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+                enable-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+            };
+
+            neg {
+                regulator-name = "outneg";
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+                enable-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
+            };
+        };
+    };
+...
+

-- 
2.34.1

