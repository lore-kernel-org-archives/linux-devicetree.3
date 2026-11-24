Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517598;
	b=gEowdPtmhv6kdrKY7LbYtWSCcy6hdZ3anRRLQ2BgFXFrRRr9kPSx9cKe806vYn8QrFsl
	 dFoglGl/OF/Q3rfdgV++eYtxLX1y29KbSF1SriVC6SSqSlPtMYFI2yDc/RHlrDayenPvS
	 8qlN29JJQnmR3JuD4qelHqhuoxpzHrHKXPmCtU4dtvHJ8RWeBYjEODHb/cMGQzcILEhv7
	 SoFd7DRrZF9XE4VBF1+Sl8xAGmX24KkMWBeKS4Pa00VEtGKQlQ8bhvg3NHyouVPzep/vV
	 8IpkvAj42/8uczboFo7pPIDLZ5ji9m0/LC6UwLQDri6I0c+u5Mj6QhwkHPynS7Mt0Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
	b=sz3VmBXGMFRbjWPn7miv/rzzN4dhmGq4FJ1GQ3Djj96tD0MrMd+CPRG0Kx0M/9vn8H6C
	 b2NAm/5aoMrPbdNf18qitZFQQquQj2uiwZ2tCzeyXh8BpSboPMHwJMcMemYO06pmablJB
	 rTqCe3KkjWq+5CBwsfOWfof8Vv6ECdGq4UhRwTMZMwTbOkIfo8hcJ/PbGJe853unlY9uG
	 LEqxA3736Bcn8JxuMv1+0wn1ErXdRIwglAzP+gECHVKJk/slA9hCDLJtqHuOe81IDzGXb
	 G/QjoLlxd1oSuBQqkWi5I7TLMa/PTGR5l7DnGDFIj/L0hpPpH+mOkJnsYtreqysTFAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liMUJPu2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFylF+a7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D91F606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D91F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liMUJPu2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFylF+a7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8G5vY196999
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=49YFlJIWuss
	tvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=; b=liMUJPu2ZSLIIUepwMKYSRScRD0
	oPn7tSnhAFYdPAlB21AyOf/zAGvv7ZXKzr11PS/Ez3FwtgngWXOh85YNatsNzA8p
	00Wes3lASwuG4h/I7f4O+e8vy5BqafNeJ28C4kKApiq+SI5z7bqrbrNbXm4uhgUZ
	e9czCriShkb+NQ1cbUC1SJoo/a60pAXrJ3INbJXqKavMzYSrI/YxfqeHaCqWAQFq
	RnpF1w/nD2Oanc92XoP6nefKwlwX9S86zPLWFbFZuTZEL/fFGn5kCVvbnRPoSAUZ
	FtlY0JI6qqSb2jgcCo6KTZgtBbTOnlSs6TwyaPwBiXPVaZu2hGzT8fwbzSQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrb9nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so4280807c88.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517596; x=1796122396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
        b=WFylF+a74VWEdFxY0y8Mi0XNwOuxHf7+EPxXTwBn9BxA7hL2jex5wXNLy1z3A2tIvT
         9EZ0aw16OU+StYiw84JTeV15wuY1o1mcpxD0GXttj6OIN8Hm1JQkfjSlVqlqDwqJcfpG
         Gc5SQb6NDDoH7gXA/HGJLFNNxr3ojniSDPlRLgvQsf4kcTrC42VAdLZ9OmgTlo1GRh+b
         Rqb5N6267FNkQ/u0CiyPmKIE1t8oeG+lcsrC/djLcwbsu7Uy9yj8FQkFTxa6NgMRf9mt
         naeYqXC8hBhE4TC94BqGY+eZHAezhSJwwohw3wdwF65dA/OmLvckgyQ26DsFBNgyCo6k
         4P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517596; x=1796122396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
        b=w0HilG8aYgL2G0yawjqKW8sYqJWYi85c2xijLGBjTjWcK1DVwthp+T1KTUyGcBbBWT
         PJvTjkOqydj5OapZPJXcZ+jfRB7W3sXncSEtEuxyMdP3cfvfGtvDa0QNC50Pkz8WKw2l
         iC/kJAmj7+3DRbIHAqf4/0ELOhE5LvWAfFRpE7wjfvFJK8XO1oCMhuQ1ixTBgZR7SUTx
         2o1epTelaQ2JHnfpAk+9tOzzPw7S8EFyYOCe2EezKBBroD9rMbtvxjYbglNZhuYVxck4
         06Vt416sGhi84Rl9mEy1/gt9FtGqBXFjGv9zy4b07sRnLLiVrt+aa5YqPf3MD3f6a0QE
         jRUg==
X-Forwarded-Encrypted: i=1; AL+hErHmCPBSbd9XEdNxIiUYmzEG2CjuaHztJGQKYa9MbCQQ0c0ADnbSJIKpJ3kZsgKKEMRfFAplisyfZLG1@vger.kernel.org
X-Gm-Message-State: APuU4Z+uJF261LCfPPCyof2OvBWcZFXvu3W+7+eEhqYhzDuDGAFdIgM1
	mhKYh5Pf2DqZy5lw+rnDqlY75l9O48egvWHAbvml50y3HSKAvkCHKnkr2dYqDjXaqdnzNna0flG
	eRzQr/eJbZ6x8TzxP5N0MXnjfIZ+toFuPBGPOS63fLEuFmbkB9SoTU/I6dEJ4NzD0
X-Gm-Gg: AZFdTZcjSwUmVeoYay2su90Wdchk3KBDLDUriaui1rt5ZBL1bAz3maPyemR+a/rjkSe
	vJdQuREDzEHsu0Pdrh2yaD+0ik/yv9yam0+9GSlId0k8zBlO7hg0uisQvKS/JHnKkxu+d9RU5vI
	+xdRbuiRcTm3XlZpGG4366nclxiMwJbCFzn8uRIrmrC9WaE9BUrwHNYxENq8XYD330OcIXB5oUJ
	leOmr8NBi9cd/l72o5MAVSrAy9QFSgmBcVFOXHi6aCeclt983iacCw/Ekhm/R0DJHYs1FXpSwB2
	Qott30pOKHS89NWwX4PEkdTrmkSWd6M+VZBQ93KphrFvm3HRL4p86mbEHm+6gZIjtJbVytHS8+2
	DhfMcos3fV9G2G0xIxg+YcQe7Y8ZQev5rDhCKbsQmUn6vmiyYidBPSP2r5N9HWTFpwAHUeu8+s0
	LETsyjmgxcrq8vgXsmBGQ3n71QS8k0WPASzwaG18aIr5wD8+BT/mWOF8vZ
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b55687ea53mr11862658c88.10.1795517596167;
        Tue, 24 Nov 2026 02:53:16 -0800 (PST)
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b55687ea53mr11862638c88.10.1795517595617;
        Tue, 24 Nov 2026 02:53:15 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm35075998c88.12.2026.11.24.02.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:15 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
Date: Tue, 24 Nov 2026 16:23:02 +0530
Message-ID: <7489ef6eb166f6292841030d299e72e5b27231f1.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX4is+9Vut/SPr
 pg/ZFIAjpWUUTLCZ3XeBIvnWDIPatzVNKtCo0rlY7HxC7JxOu7zor9pDKq1WjTumxFlataMhvl8
 20jkyY478VrxZPPyJ5Ukdq7W2lu6z5o=
X-Proofpoint-ORIG-GUID: zKDTO9kp9_gfWAXJ5i7dHYSRSX5dTObF
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056c9c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=RS--hHaVoNrYE_hnkMsA:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXxPyrNSZ6MEdq
 riAt3pXMkHqjoPYBjZYJWHeeBgcmTOZP9CVcM0b4B+pNvmGsE+t07LnrqhVD8QIKNJjzRIYaK+O
 eqqN8RPNlVF36UCyoq3WVM92myx1LkGhuYkb4aNGAxJMw1coIoq+Z29UQ48FUXw/3Xb9U5a1YU4
 Ncn549rgR5e0dmyBWoLUq4i8ki/E1fZuoqERMe+hleXTpYRKGFhJuD8K/idYKxhef/29LExosyU
 1z7yz1gRhI8TnTut12YaIL2fdKPq7AzgiK14jntOVwR4yopJC7Rf8Vr0vvvhsMDgmOQuViElKZ1
 HVDSevhzssgimyTPGS/RNdBDay4C5BZF/fMZeczEKVm1fFLIAz6+HE3i0Ds02blOjdPEMUVwLKn
 Evo+P+nzJKAVvGpbWG+uN2n5WfY0YW0SN/OhoSo3sA8QdC2VjDMzuA89zoStRmJmhIhj3q4ktAE
 qQR1KyXc0dXpGJE0D4A==
X-Proofpoint-GUID: zKDTO9kp9_gfWAXJ5i7dHYSRSX5dTObF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add device tree bindings for TLMM pin controller found in Qualcomm
Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,seca-tlmm.yaml      | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
new file mode 100644
index 000000000000..be683e31332b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,seca-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Seca TLMM block
+
+maintainers:
+  - Yadu M G <yadu.mg@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Seca SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,seca-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 181
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-seca-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-seca-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-seca-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|180)$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ gpio, aoss_cti, atest_char, atest_usb20, atest_usb21,
+                aud_intfc0_clk, aud_intfc0_data, aud_intfc0_ws, aud_intfc10_clk,
+                aud_intfc10_data, aud_intfc10_ws, aud_intfc1_clk,
+                aud_intfc1_data, aud_intfc1_ws, aud_intfc2_clk, aud_intfc2_data,
+                aud_intfc2_ws, aud_intfc3_clk, aud_intfc3_data, aud_intfc3_ws,
+                aud_intfc4_clk, aud_intfc4_data, aud_intfc4_ws, aud_intfc5_clk,
+                aud_intfc5_data, aud_intfc5_ws, aud_intfc6_clk, aud_intfc6_data,
+                aud_intfc6_ws, aud_intfc7_clk, aud_intfc7_data, aud_intfc7_ws,
+                aud_intfc8_clk, aud_intfc8_data, aud_intfc8_ws, aud_intfc9_clk,
+                aud_intfc9_data, aud_intfc9_ws, aud_mclk0_mira, aud_mclk0_mirb,
+                aud_mclk1_mira, aud_mclk1_mirb, aud_mclk2_mira, aud_mclk2_mirb,
+                aud_refclk0, aud_refclk1, bist_done, ccu_async_in, ccu_i2c_scl,
+                ccu_i2c_sda, ccu_timer, dbg_out, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi, dp_rx0,
+                dp_rx00, dp_rx01, dp_rx0_mute, edp0_hot, edp0_lcd, edp1_hot,
+                edp1_lcd, edp2_hot, edp2_lcd, emac0_mcg, emac0_mdc, emac0_mdio,
+                emac0_ptp, emac1_mcg, emac1_mdc, emac1_mdio, emac1_ptp,
+                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                mbist_pass, mdp0_vsync_out, mdp1_vsync_out, mdp_vsync_e,
+                mdp_vsync_p, mdp_vsync_s, pcie0_clk_req_n, pcie1_clk_req_n,
+                pcie2_clk_req_n, pcie3_clk_req_n, phase_flag, pll_bist_sync,
+                pll_clk_aux, prng_rosc0, prng_rosc1, pwrbrk_i_n, qdss, qdss_cti,
+                qspi, qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
+                qup0_se5, qup1_se0, qup1_se1, qup1_se2_01, qup1_se2_23,
+                qup1_se3_01, qup1_se3_23, qup1_se4, qup1_se5, qup1_se6,
+                qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4, qup2_se5,
+                qup2_se6, qup3_se0_mira, qup3_se0_mirb, sailss_ospi, sdc4,
+                sdc4_clk, sdc4_cmd, smb_alert, smb_alert_n, smb_clk, smb_dat,
+                tb_trig_sdc4, tmess_prng0, tmess_prng1, tsc_timer, tsense_clm,
+                tsense_pwm, usb0_hs, usb0_phy_ps, usb1_hs, usb1_phy_ps, usb2_hs,
+                usxgmii0_phy, usxgmii1_phy, vsense_trigger_mirnat, wcn_sw,
+                wcn_sw_ctrl ]
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
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,seca-tlmm";
+        reg = <0x0f100000 0xc0000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 181>;
+        wakeup-parent = <&pdc>;
+
+        qup_uart15_default: qup-uart15-default-state {
+            pins = "gpio147", "gpio148";
+            function = "qup2_se2";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...
-- 
2.43.0

