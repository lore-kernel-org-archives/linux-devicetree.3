Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669111;
	b=KE8q74UMDSct+Nmom39LJ7y+Mr2d63rrp9ncLc7FAwzyp76Rt+OCmdJUZA1vLmJOuVt4
	 +bGCXudwT9LQrIur8PARIrc0OSK1WG+i63bNOTkuRnEjwnffVO45kQj9nt7cbiiFX2x8Y
	 AXehWVjUn15v4SXVesrYVoH0NUPNKV9Ys6h0zbAJ6QiIu4fQ9Kyd5nxuthVTWzC7vhZJI
	 ULmrJAHFc36LreBPPecx1/BMRfDRU9UUajCnQW+mvThyqC14Ixuu9LTCKzCSiWUaov6QB
	 7E94805ilbjgpY9GDkn1q8SVbJ0B9L/7zEatpeMUNqOy8bC4k3HSHZe7RjMVZHZUEKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6n0sXY2ihdnS4myjo8DBNolYG0W0qDR7Y2Fsakj4dZk=;
	b=my7gQik93pSQTHwIynEwf9FUhWgbo6FfC1ySnLJqNlMbctOmt2YVHw5KZnFgzEq996NX
	 HCHVoF1JCy9rY9k1y+QBA62SUWApr3sGxkYIkBCB/UeCwzCS/MnBwa0af1o9GVkLPlo2S
	 aBtdcaR7CCWkAAsrpJhjQVattk8jGYoh+MJWf7pNS0LtsYqDv9Qypa/jOo7pxNuzo4qk0
	 B07OnsiRyW+Wv+KamQGXqIOYrjaaXG5g0VDYBzKPl8J4jDnfa6IJrDLCMrFAT6rU1NXK6
	 xK/9Lr2ZQLNzEQg5PB39YwLtSv8KpR6zno25CnEJhLTQWVs+DW5p0eZgMhThT7eYH+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ekgJeyq;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957C1606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 957C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ekgJeyq
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso8876512c88.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669110; x=1796273910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n0sXY2ihdnS4myjo8DBNolYG0W0qDR7Y2Fsakj4dZk=;
        b=0ekgJeyq0vjwj+Ff2VZ8PJP0cgbnBt4nRb1wvTgeTsr2AdjFsN8SrWuO0aL5sqWzPG
         ryjZbdT6y8IJmmpJcOZewTOvj9eeknKkQ0sVeHK7DDSdwA2AsS1qx6MgjPjGVPS28cGY
         1RexRrKdy52o6tpYYib/5xhmsnShOEToQAsKPBUAhvHLtsS616nNPJ1OpOn5Vvh7vOvU
         R16zMpWXKdeMtXnKZR94Dh46j4/pmB+pnD/5t5SUD7l6wJdhu6B0yEv5e8WSzTI+FSmG
         nXey82wPjsr/h9QjHmiWPe8I3IEtBlEO0/idKpq32FCYJ3oUzQP4+Ag6mKMC8wqRhrYp
         eOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669110; x=1796273910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6n0sXY2ihdnS4myjo8DBNolYG0W0qDR7Y2Fsakj4dZk=;
        b=XLvgJ4mmkekBZ0KQ74Afmyk9EXBMi0Ywuica5hCSP+aytLW/MPM9f4J0ra5FIvwgaK
         YEvzu6osfJyMgR+L523NgCSqfehcK2vd+rKSCIpCw4P+y8qeTV+ZXWHDr5tczvzE+hFa
         xV1VLczSJ1wstYCivLXtznfNpAIVO6vGrM/OUcg/SlPZ8cB/Br9xRvkyJPinBkgCY0wR
         hGltVxe4b8aTVM/sEqnHogW8qYTKr4REYlZwwxi075snotXYdHCzqOnhY/lVOw+j2U7t
         bR2TiTLKnASDU7Kz4R5Nvp/IUuXfoB12KK/n+EH0t6FLObh1E5iPxWQs1BKh53wmPSMp
         nKHQ==
X-Forwarded-Encrypted: i=1; AL+hErFOCpj+/T4cqpqa1fojQ+HpzACra8TB+pSIBlTpTSJ0y4WPiG5HKy92lIt+b10aBBuhULYnQzqE3cRi@vger.kernel.org
X-Gm-Message-State: APuU4Z/GIodyTQDJqMtD2QhXockQLZgk1PVEl7E7ZxkRxzZidfYZVGbb
	PzUWtWv7sJNbFlWpUqEUiCcuMPaO8qLxOVLqDIOhbyXg6bgLz1cpd93t
X-Gm-Gg: AZFdTZfzvRDD6g4H8XUVF5y/rQdmGh77OK0ERocXPKxZ5h2ypo4Imc0BObCBmjM1pJ3
	hpH7umax1qpEY2l/FOqG6I8k5Rz2ROrvDCNCQlH81qjhIiXkqdXJBXXDHNiJ2xROEFpVDUMs4Gz
	6VZvr8rW3/IjCCRUDuC9hX3A6QJJvaBsEwTQvyY3C9t2osQm4062GGmneZPkufl6TmCLW9uPTd2
	LLNKaDtmGkV00ci2ZzfCkyAJSkHsPgb1fN2EgKWbM9oIc/cThAeCAvUgVonitl8k3+jTN0g/oe7
	/27KV6EEGH2S9LnUI4DrCFb2XZhNJJLKs3hGndsFYgtX/yt95ehwpHvHTNdJ/XzmNqscAqbRQA8
	MyGR4F4jhKwk03xQXZoeBT4qHln0fblm+YN/BiIO5I386VgVYVAgj895Zi17SWr2WlEDfseuEdL
	AlHfE8gfithVvCBgQt8z3vThO9i4xrDHSRiH2jWyDkrtbFKQDSfbojn3HqWEHbI7j2RN5rXiwVm
	7Eq6LY5dPrQwRyRiHNBVY22jNoNGyhMZY2BcuUZwhS2zmWBtATPkmgc1gkbvom0mPubD0+c8Le5
	GrNcKhFiEEvpSboCAeR2CUb32rN58LgPR7ZuIw9iesP/0CQ395uXXXaWnKkiZS9MHTfmS2Jvlji
	qjQRiPwo=
X-Received: by 2002:a05:7300:a986:b0:386:c6e4:5732 with SMTP id 5a478bee46e88-386c6e458eamr8438431eec.3.1795669109592;
        Wed, 25 Nov 2026 20:58:29 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:58:29 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:06 +0000
Subject: [PATCH RESEND v15 1/8] dt-bindings: clock: Add SM7250 global clock
 controller
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
Message-Id: <20261126-sm7250-v15-1-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=7988;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=TlI6xL/+9KtlUI581KVAiDRwoKRxLc4msMoZX3ID8b4=;
 b=K9xdhMsmKxgZ3ya1C6zk4Q4a1Pn0kAJXLFVgeKhIspWwlMOJgxPCsVGWWu8sHj0L3+snj2tj7
 4q6JuELsFeeDCdeBJ3FJxhg81E3Z2ntmyH7D9Aaug9kMV1ckgVYvRau
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Add device tree bindings for global clock controller on SM7250 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |  13 +-
 include/dt-bindings/clock/qcom,gcc-sm7250.h        | 163 +++++++++++++++++++++
 2 files changed, 172 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index 5f9aae728..f62aa0c59 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -4,21 +4,26 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on SM8250
+title: Qualcomm Global Clock & Reset Controller on SM7250 and SM8250
 
 maintainers:
   - Stephen Boyd <sboyd@kernel.org>
   - Taniya Das <quic_tdas@quicinc.com>
+  - Sreeshankar K <sreeshankar0910@gmail.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on SM8250.
+  domains on SM7250 and SM8250.
 
-  See also: include/dt-bindings/clock/qcom,gcc-sm8250.h
+  See also:
+    - include/dt-bindings/clock/qcom,gcc-sm7250.h
+    - include/dt-bindings/clock/qcom,gcc-sm8250.h
 
 properties:
   compatible:
-    const: qcom,gcc-sm8250
+    enum:
+      - qcom,gcc-sm7250
+      - qcom,gcc-sm8250
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gcc-sm7250.h b/include/dt-bindings/clock/qcom,gcc-sm7250.h
new file mode 100644
index 000000000..ae81f445c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm7250.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM7250_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM7250_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL6							2
+#define GPLL9							3
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				4
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				5
+#define GCC_BOOT_ROM_AHB_CLK					6
+#define GCC_CAMERA_AHB_CLK					7
+#define GCC_CAMERA_HF_AXI_CLK					8
+#define GCC_CAMERA_SF_AXI_CLK					9
+#define GCC_CAMERA_XO_CLK					10
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				11
+#define GCC_CPUSS_AHB_CLK					12
+#define GCC_CPUSS_AHB_CLK_SRC					13
+#define GCC_CPUSS_GNOC_CLK					14
+#define GCC_CPUSS_RBCPR_CLK					15
+#define GCC_DDRSS_GPU_AXI_CLK					16
+#define GCC_DISP_GPLL0_CLK_SRC					17
+#define GCC_DISP_AHB_CLK					18
+#define GCC_DISP_HF_AXI_CLK					19
+#define GCC_DISP_SF_AXI_CLK					20
+#define GCC_DISP_XO_CLK						21
+#define GCC_GP1_CLK						22
+#define GCC_GP1_CLK_SRC						23
+#define GCC_GP2_CLK						24
+#define GCC_GP2_CLK_SRC						25
+#define GCC_GP3_CLK						26
+#define GCC_GP3_CLK_SRC						27
+#define GCC_GPU_CFG_AHB_CLK					28
+#define GCC_GPU_GPLL0_CLK_SRC					29
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				30
+#define GCC_GPU_IREF_CLK					31
+#define GCC_GPU_MEMNOC_GFX_CLK					32
+#define GCC_GPU_SNOC_DVM_GFX_CLK				33
+#define GCC_NPU_AXI_CLK						34
+#define GCC_NPU_BWMON2_AXI_CLK					35
+#define GCC_NPU_BWMON_AXI_CLK					36
+#define GCC_NPU_BWMON_CFG_AHB_CLK				37
+#define GCC_NPU_CFG_AHB_CLK					38
+#define GCC_NPU_DMA_CLK						39
+#define GCC_NPU_GPLL0_CLK_SRC					40
+#define GCC_NPU_GPLL0_DIV_CLK_SRC				41
+#define GCC_PDM2_CLK						42
+#define GCC_PDM2_CLK_SRC					43
+#define GCC_PDM_AHB_CLK						44
+#define GCC_PDM_XO4_CLK						45
+#define GCC_PRNG_AHB_CLK					46
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				47
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				48
+#define GCC_QMIP_DISP_AHB_CLK					49
+#define GCC_QMIP_RT_DISP_AHB_CLK				50
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				51
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				52
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				53
+#define GCC_QUPV3_WRAP0_CORE_CLK				54
+#define GCC_QUPV3_WRAP0_S0_CLK					55
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				56
+#define GCC_QUPV3_WRAP0_S1_CLK					57
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				58
+#define GCC_QUPV3_WRAP0_S2_CLK					59
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				60
+#define GCC_QUPV3_WRAP0_S3_CLK					61
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				62
+#define GCC_QUPV3_WRAP0_S4_CLK					63
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				64
+#define GCC_QUPV3_WRAP0_S5_CLK					65
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				66
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				67
+#define GCC_QUPV3_WRAP1_CORE_CLK				68
+#define GCC_QUPV3_WRAP1_S0_CLK					69
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				70
+#define GCC_QUPV3_WRAP1_S1_CLK					71
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				72
+#define GCC_QUPV3_WRAP1_S2_CLK					73
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				74
+#define GCC_QUPV3_WRAP1_S3_CLK					75
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				76
+#define GCC_QUPV3_WRAP1_S4_CLK					77
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				78
+#define GCC_QUPV3_WRAP1_S5_CLK					79
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				80
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				81
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				82
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				83
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				84
+#define GCC_SDCC1_AHB_CLK					85
+#define GCC_SDCC1_APPS_CLK					86
+#define GCC_SDCC1_APPS_CLK_SRC					87
+#define GCC_SDCC1_ICE_CORE_CLK					88
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				89
+#define GCC_SDCC2_AHB_CLK					90
+#define GCC_SDCC2_APPS_CLK					91
+#define GCC_SDCC2_APPS_CLK_SRC					92
+#define GCC_SDCC4_AHB_CLK					93
+#define GCC_SDCC4_APPS_CLK					94
+#define GCC_SDCC4_APPS_CLK_SRC					95
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				96
+#define GCC_UFS_1X_CLKREF_CLK					97
+#define GCC_UFS_PHY_AHB_CLK					98
+#define GCC_UFS_PHY_AXI_CLK					99
+#define GCC_UFS_PHY_AXI_CLK_SRC					100
+#define GCC_UFS_PHY_ICE_CORE_CLK				101
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				102
+#define GCC_UFS_PHY_PHY_AUX_CLK					103
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				104
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				105
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				106
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				107
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				108
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				109
+#define GCC_USB30_PRIM_MASTER_CLK				110
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				111
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				112
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			113
+#define GCC_USB30_PRIM_SLEEP_CLK				114
+#define GCC_USB3_PRIM_CLKREF_CLK				115
+#define GCC_USB3_PRIM_PHY_AUX_CLK				116
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				117
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				118
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				119
+#define GCC_VIDEO_AHB_CLK					120
+#define GCC_VIDEO_XO_CLK					121
+#define GCC_VIDEO_AXI_CLK					122
+
+/* GCC resets */
+#define GCC_DPM_BCR						0
+#define GCC_GPU_BCR						1
+#define GCC_MMSS_BCR						2
+#define GCC_NPU_BWMON_BCR					3
+#define GCC_NPU_BCR						4
+#define GCC_PDM_BCR						5
+#define GCC_PRNG_BCR						6
+#define GCC_QUPV3_WRAPPER_0_BCR					7
+#define GCC_QUPV3_WRAPPER_1_BCR					8
+#define GCC_QUSB2PHY_PRIM_BCR					9
+#define GCC_SDCC1_BCR						10
+#define GCC_SDCC2_BCR						11
+#define GCC_SDCC4_BCR						12
+#define GCC_UFS_PHY_BCR						13
+#define GCC_USB30_PRIM_BCR					14
+#define GCC_USB3_DP_PHY_PRIM_BCR				15
+#define GCC_USB3_PHY_PRIM_BCR					16
+#define GCC_USB3PHY_PHY_PRIM_BCR				17
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				18
+
+/* GCC power domains */
+#define UFS_PHY_GDSC						0
+#define USB30_PRIM_GDSC						1
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC			2
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC			3
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC			4
+
+#endif

-- 
2.43.0

