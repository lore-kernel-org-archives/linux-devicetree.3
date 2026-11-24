Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534175;
	b=KFyTzgrEeVWg7BcYDbfE1RjAphYbGvlAhd9LmT0t8a0xK4uN92POWT1RJAo5PyoxuPuc
	 kcJHLw31TlPBhdk3rfjTOt/7k/DK8cy2HDOTY6F14EfK4WjAx3/1+QNDq6ZlE+WVl9G12
	 EADcNIpecjDVyIzFQAXGyoozUD/NRNT+0DBEqZXuH0CUvANeKpoC8XY8/AlfxZxIdSCCL
	 te05PwLv0zu5C+FpWady2oTLhvGuefW1M2hIdMLabhusxwVDtozMYIWLl4KFqiGd/BbTx
	 ouICEgDGfKN/rs5yhxTETpkncVEcE6PF7lu92HYbtRQpsxlTcvPdkU7PGl8C1DfI15Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
	b=oj8FlRE/pgip1geASob/7U3mYbzDMc1mMP2RIhbSlE7drO2Dw4hqx1EThC5HH123Xlcl
	 WOxDIgYHzHQNCuGI6OJn6kYZzp+dPpK5Vkq3ymApJXP+mCy1/3Uh/iRgIeArkT7Tx2yrh
	 4XnN2prdAPqJyyjSvbMHKjZLPBABjVrlu96vQfpm4pYCoa230M1cAMoEjyMtTLzAjWQ3w
	 4idG6qISmv2V/7/ofvaEo3/BVYXowPlPXpG/Eh4V++RSI61tKL57tE70YEZh+3AVqgydM
	 ghNFovS2CvCN/vbVUaXIrIf5X3zIA/FBN8xv1RkqhdMp1CIwle6ruPUZN4BsbwsptiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJ0334hd;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA760A263D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 15:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BA760A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJ0334hd
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so6069175a12.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534173; x=1796138973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
        b=CJ0334hd9uWluNShzhtgG5AduQJZDf2Ib7OhymDcqlu1mpZqKOdQTNssouDXlpTyT4
         ayzUo4ahmISwl3mZboo7ZzvTc+jdMUOxp+bNAAH88u8oJBUOKAG/HdXJHphgwVlrAVTc
         6BwQ8/jDTWQlAARfdnwCKvVh7ETzfqnktMGl6M6QKT4A10kuzUfyB5tR95U5sK/2zg94
         BlTg2xJbRfgH9JMq1zafrvSulW1TcRApLZNn8ZC/a5PA6OFNPsVvjUTFx7J9e25WN7J2
         KRkM15kGVCVR6vKyM0N2Amw29JDPfawpI3wnYuYF0w7p8T7UI8Ew8qzPiQAtEOgjByUF
         f+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534173; x=1796138973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
        b=pJD66Y+Y+Ea0k4y7aoOKPuGVwv47oU+LUBmsRruGvDw0247WaVyFz0al4TMXDgCQ58
         3leI7FYb8nsMR1Yr4TthILozl31wK3rRN9Izag9lvxpThWaisjPdILXs3mVUwyjg9F7d
         vU3y3v78LqA/rrAWXh8FLJVf7PkeJ/C6ea6eOXc7UW2YsMUINuYbqoEiUEzbjjQeKULS
         YcV9I149d0Eh++7MMPDdkssKeaNzBm9MCmKhZkh3GwVofyaURoBfq8lH4SnXHmRLm2/K
         YhUqxMVDD9jDwrgtcZVNzYqqeFdyPInr7yUYZx4cnwrhGKaKNW7o3syexGJRc+bkVVew
         5DWQ==
X-Forwarded-Encrypted: i=1; AL+hErFxjGMywaYA/259yENz7WwVABPCbq9+f89Yxtwgu71ZNKMcSwPgyYAiyIc6Fl68YFQ8BsFmC+naKeq4@vger.kernel.org
X-Gm-Message-State: APuU4Z+07bKfdKeqnEdxQ29MBo3Khvl/oRNVASwucMsDF9AhCOtCNggm
	LrGqjHhtbeHgfI5BdApJR7uKqJqIT/WuPksBwQBkk1Cv8Aqygdhd4V4WrGUEXYMObB4=
X-Gm-Gg: AZFdTZdYArw/tWgZXqzlXf2PhWzjBIVutIlOFjQFLnS6u1kVAeqIvC3xIMZeAokDRgI
	mSBsWBlqI+zXGPmdai3y5Rvn4ZfHuGA/xHs5ZPeEl+1DKBf3abwvBRCO9iK/YaVFDK9/dNK1xOV
	dCDj2gj8jLSlHLhKA3XsdyZf/Si9cii/c3u1hnrTH+VEJ2551Ou63k9Fndwp9Ze35dNXnqsRyLk
	WOUg823hvx/tHz6YSsmyyVDIBvfDxitlQlcuMRr7Ohh5eCa5+W1ltLsekhw7EGqXBATpgACYQ5v
	skuCsBjDFdPzTQoLz9AT9Ac05unL6qIGxFZcFBaz+aHr88CkZ9rkmOYXoAB3l8B0AMvUlrxzdnN
	Mf9ttqMZD+TkiHhEf8A5xX9n1/eF60tz972JNy549ISaADCfoYQdTdf9HOh9QNDAAYpoXeVhFf4
	5PYfJAY+wt/lJbM3Ww/zL64ApUxOx8vZInD2mf6sERW/kHI9UdPAwWD8tCLcYs2nMUIX4kzQjjX
	y4AGrZIsZ3buVXAM21DCoeG01FYeD2QH2vyBHwx6l8fEBQdpOh6KnAMa7f3ytq9kRJRrXRMF6Bm
	sQajL13nyoIjSjRTpLxU7ZZFkizPaOvdQpGNpQ==
X-Received: by 2002:a05:6402:1941:b0:6ba:7bee:e100 with SMTP id 4fb4d7f45d1cf-6ba7beee6ccmr6924541a12.36.1795534172375;
        Tue, 24 Nov 2026 07:29:32 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm540425166b.2.2026.11.24.07.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:29:31 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Tue, 24 Nov 2026 15:29:17 +0000
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: document the Halliday Top
 Level Mode Multiplexer
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-halliday-tlmm-v4-1-3e3a1d0fb4eb@gmail.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795534168; l=6058;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=SlX6QYe21sxQH79MXblD8P7iKl/sCn2h4tLFFAnduVo=;
 b=shVf9hm3yWBFXe0hLozx3txiNh3jMVi1iB2P33RSOBrAdQY9FG0bdYO4uqrg3I6nqAKIeWHLw
 nYSHqlZywbEBQ1FVO2s21zzuG1OXsqb50dNgqANfH2USB+dY6oaEQK/
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Top Level Mode Multiplexer on the Qualcomm Halliday SoC
(SXR2250P).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       | 146 +++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
new file mode 100644
index 000000000000..2615d40b0478
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,halliday-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Halliday TLMM block
+
+maintainers:
+  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Halliday SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,halliday-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 112
+
+  gpio-line-names:
+    maxItems: 224
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-halliday-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-halliday-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-halliday-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[01][0-9]|22[0-3])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ atest_char, atest_usb, audio_ext_mclk0, audio_ext_mclk1,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, cmu_rng, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
+                ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
+                edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
+                edp1_hot, egpio, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
+                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
+                i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
+                i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
+                mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,
+                mdp0_vsync3_out, mdp0_vsync4_out, mdp0_vsync5_out,
+                mdp0_vsync6_out, mdp0_vsync7_out, mdp0_vsync8_out, mdp1_vsync,
+                mdp1_vsync0_out, mdp1_vsync1_out, mdp1_vsync2_out,
+                mdp1_vsync3_out, mdp1_vsync4_out, mdp1_vsync5_out,
+                mdp1_vsync6_out, mdp1_vsync7_out, mdp1_vsync8_out,
+                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1, prng_rosc2,
+                prng_rosc3, pwm_0, pwm_1, pwm_10, pwm_11, pwm_12, pwm_13,
+                pwm_14, pwm_15, pwm_16, pwm_17, pwm_18, pwm_19, pwm_2, pwm_3,
+                pwm_4, pwm_5, pwm_6, pwm_7, pwm_8, pwm_9, qdss_cti, qdss_gpio,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
+                qup0_se4_l0_mira, qup0_se4_l0_mirb, qup0_se4_l1_mira,
+                qup0_se4_l1_mirb, qup0_se4_l2_mira, qup0_se4_l2_mirb,
+                qup0_se4_l3_mira, qup0_se4_l3_mirb, qup0_se5, qup0_se6,
+                qup1_se0, qup1_se0_l3_mira, qup1_se0_l3_mirb, qup1_se1,
+                qup1_se1_l3_mira, qup1_se1_l3_mirb, qup1_se2, qup1_se2_l3_mira,
+                qup1_se2_l3_mirb, qup1_se3, qup1_se3_l3_mira, qup1_se3_l3_mirb,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se6_l0_mira,
+                qup1_se6_l0_mirb, qup1_se6_l1_mira, qup1_se6_l1_mirb,
+                sd_write_protect, sdcc5_vdd2_on, tb_trig_sdc2, tgu_ch0_trigout,
+                tgu_ch1_trigout, tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng0,
+                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
+                tsense_pwm2, usb0_phy_ps, usb2phy_ac_en,
+                vsense_trigger_mirnat ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,halliday-tlmm";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 225>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        i2c-w-state {
+            scl-pins {
+                pins = "gpio58";
+                function = "qup1_se0";
+                bias-pull-up;
+            };
+
+            sda-pins {
+                pins = "gpio57";
+                function = "qup1_se0";
+                bias-pull-up;
+            };
+        };
+    };
+...

-- 
2.55.0

