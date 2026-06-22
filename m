Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E39233920
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117343; cv=none; b=WIQ4VeUYiFTy1Kr+O4Kt/1sz+vs4dx/zOD5Xh3KYuCOancSwggCU3Vyq55jakvkO4c/OavXOv9HYz3dJRhxP9g0poQ9j7JHrAxSjnIvJS8aLeVwQg/VawfGYkoYgmNsdlX6PQB5UGAHAygrOtcLOhuzX/eS9l4wA9T3ry0w6nCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117343; c=relaxed/simple;
	bh=a7DZ+9+4fIbwpZO2uG3g+W5R1OjcQ9AkslG3kjBbpc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=La++8VTrDauri+XyC0AJ6LPxPF2tI4/S5AsWpfU17h+GmLLGKKt5bqWdJ3+6zj2WFWK3T3yN+5mxgdlnYJ8Uvpa7Bmw5coAOtyJTiawNh6NAyEjvQ3M02l3qNaUCdL3RbNV+u0LGkeFUzs7JeqNozkZMPrDsMcdtrLPqIHvuRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaBDF+vW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIILLJ3p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaBDF+vW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIILLJ3p"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5B7HL156591
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=; b=IaBDF+vWkRgTxJrC
	blf7P+NYzJCuuU/Ubij0ToAPpbgsFGRnZR6mFxw+INqAdfJH3pnetrmRLKwwj6lN
	k4IsULXrKw5X6O9FMi5M1SACMeCXbZ7wSbn/rlMuxzmVL+umlEcu7JWL02DlZMTd
	tgyzibr205Z5gYTvIrzUp/JsMuhdWi14cMS3OWjy8SCDZac/pJO/Q7Qp3mbhzL5U
	B+yegaL9iyg+La2NiAVOgPKaLeB3IJ7QZa47cMz+LXsMd0byqM0e5S7BAcRTbSiB
	nCmLK1exESHN384IHKx4/GFeztmqMXAWPnS4n2VV9d/GeiBZH2mwyvbiTXmej8xJ
	tb+gpw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mnx3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:35:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1394c3ee7f2so21125534c88.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782117340; x=1782722140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=;
        b=QIILLJ3pqqRu+ZQ6Pyhq+pnyUwSxtwGGSlVUy220HLXBQk78/R/iqhJK5hyIrGklpn
         fFnPTY1qxcwnv+wDZCjgro4KuLitkP+E9qt4c1gxmcDsmDVO48VzadBaXKZ22h5v1Lq4
         deqHMFiIeHkyS+sg5Pq6I9t/yEMdasA+lcfxiCGHQdOk32EeuPEnsDAU6uaablOejKoQ
         hy288rQZcGQEVKl0zddVmh1bmaAvsUD48+b7FfElFITlFl0X3MEV82O+X6dSXYaol/Ze
         aTR6b3ehkMxswHbxMf+GYbTygpl5laKx1FKvaw3ZGRCOMXhxcuELsJe5WBzx9MJmuYU5
         yAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117340; x=1782722140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=;
        b=S+Crk55SJ2tkKRybo0FbYkoNSPpiGLBzuq+VTw26lWHdTVBDoT80w/A1Aj1RK6uEXl
         qtfBWeQpEbBpBm0dpmgxfIsy9xPRWSuZwSuau4x+i1jQ/okgkvI9DgAlqFyC3An4voet
         BjAwgRDdHzgKs6rQvgn5j0OPVsaYM2BNJDOC2s1b8inNDgfBZEgBatLQPXKPBt6ySZ64
         Tw0EvBsp7fiL1GmsvUjWliS6vJgVVsK3iaCS69aw41bPEXan9jDR0kJtfbBeM5XbwsC0
         7S+DbdSIv7St5sbxHMbWbzxHCCCAAAynoaigv78LRexLXrjqKff8E2jneMa9rbBnUI11
         elPA==
X-Forwarded-Encrypted: i=1; AFNElJ+q9ajK5mSM1rX1zn9ndB4q4d9O5l77NLCMJWJXfVZ/9rwoRK2PaW4spshSdcjw7ljHFF7pb7s/Jo9b@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhx9IZA3Ll38nB4Kc+pSnz4JjJ+Xqesc3ph85yhOW4+8BwCOYQ
	0SreDLfjgr+YYBEZ8afFM96f1cMsvIBVtxLHWh042jPoiGB2d5aMB4xXDRMTkWR1t9mfYPt/3ns
	oj/2SeJhrj0pJgLzASS70DPJs0OXO1LHxcw0Tyb5DHiAutRryDneyCRunuMhoWhXc
X-Gm-Gg: AfdE7ck0eym68clyw0M7yZbywfcFKw/VL0kxR/ekXzPvwDFxhnRsgkweFnPr7ot0YIU
	/zSlTZs+T92jd4oyB83BfXtShwBoGVfanslY9Wu0/kJCXDvUUjwhk8AxvZ9eM/XBuAOM34NTGMB
	nOx8jcFpgi7tZz6m0bTf/sHVErPGIEauW0syNTxf/gD9iSNUepNzIN/6wGIJokCynE4CKB7wf02
	XfkjXriKmkPHeVCEUXsjLGsNCnlFAkC/87CM4Ik8RGwokpeunqOzsVSVyWbnnUSiaIjBUzeSDLc
	I/uz5i51J7cFM44whkRb+tw9Z9k4ue6xuBM3q/zR1ErB5k31jdp2QGu/mRlx6LViuet6HmjXM3j
	UA0HsJqqj1hK/QwHpUatGJWUQfvy6MtKUaEKHTbyYaTytOKFcdJ7XNwwC6ZGkjw==
X-Received: by 2002:a05:7022:2602:b0:138:3432:4f4 with SMTP id a92af1059eb24-139a2150677mr8324241c88.31.1782117340065;
        Mon, 22 Jun 2026 01:35:40 -0700 (PDT)
X-Received: by 2002:a05:7022:2602:b0:138:3432:4f4 with SMTP id a92af1059eb24-139a2150677mr8324223c88.31.1782117339486;
        Mon, 22 Jun 2026 01:35:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adca1b18sm6801967c88.3.2026.06.22.01.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:35:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 01:35:32 -0700
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Describe Maili TLMM
 block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-maili-pinctrl-v3-1-9724e1000471@oss.qualcomm.com>
References: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
In-Reply-To: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782117337; l=4956;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=a7DZ+9+4fIbwpZO2uG3g+W5R1OjcQ9AkslG3kjBbpc4=;
 b=wzm9E66zeWJGaPQLOHOyzz5oKMI22n8eGX8L2O0Fi2TACmgm2nivOI1zdsIEjGnUKq1oKEu2+
 G2zDtSCdE9fAGk/DU5rcvdex3QmXN8hFbj2w/LcEFxISQZt5Ja6+DWg
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX30S+BQwKOAzm
 kdi8xKNiGY6m1so9NCELARKZPivW/OTbpLn0zAGfp/bLgXamMoaA95hkPI6bILfr8pMBP8DEGzG
 Pj6s6G3O6OSfrN2B7ozCaC39tyotOcC8YRCLOcStX102FsAhY3PGqYtCM1G2bVr69UyLvx5tTfq
 WcvH1D0Xg4Ngb05FHfvTnozipS4BlJSf1dEElTva15ZSgTAqFuJN3gcHmDuOetEWAZGDcw4cpJk
 mX4+vVJOeBoeLReqwesa6Cn9Xzj0g6RmRQe61i5wQD/Ez5RdC2JdVlxTsY1JnyHzNooeD/H3L5a
 R1nHdnB4wetqePsouq4l6kbY4hpiDxMwT2gqjwIXI4z747bOUhOliauyzu+UdnvMV6AluBSYAoD
 JBd2QqLS9/XsTuv09ruhveV6YcNDWLUlEKc/DM9u6LeMDYVKAMXWyZVykq6xkWrF92TXK0+jdIk
 6NyQoO0r6W59lB7bE+A==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a38f3dd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX8fRobzITHxxj
 A3yA92m6npyl7u0opyI176tU7Q604ri5Tgw7D9ngYljFxgh3KI4O7g5Dcb/TvkRWB0uSUPVEUrC
 8Fa1c5crIb8qS+0TCJ64+ttKHj/gIps=
X-Proofpoint-ORIG-GUID: RgcNP3e7LnpGmE_PeAowJ_XXzi9pvM-x
X-Proofpoint-GUID: RgcNP3e7LnpGmE_PeAowJ_XXzi9pvM-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220083

The Top Level Mode Multiplexer (TLMM) in the Qualcomm Maili SoC provides
GPIO and pinctrl functionality for UFS, SDC and 226 GPIO pins.

Add a DeviceTree binding to describe the TLMM block on Qualcomm's Maili
SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,maili-tlmm.yaml          | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
new file mode 100644
index 000000000000..64fe90b2391b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,maili-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Maili TLMM block
+
+maintainers:
+  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Maili SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,maili-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 113
+
+  gpio-line-names:
+    maxItems: 226
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-maili-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-maili-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-maili-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-9]|22[0-5])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c0, cci_i2c1,
+                cci_i2c2, cci_i2c3, cci_timer, coex_espmi, coex_uart1_rx,
+                coex_uart1_tx, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot, egpio,
+                gcc_gp, gnss_adc, host2wlan_sol, host_rst, i2chub0_se0,
+                i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4, i2s0, i2s1,
+                ibi_i3c, ibi_i3c_qup5_se0, jitter_bist, mdp_esync0, mdp_esync1,
+                mdp_esync2, mdp_vsync, mdp_vsync_e, mdp_vsync_p, mdp_vsync0_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out,
+                modem_pps_in, modem_pps_out, nav_gpio, nav_gpio0, nav_gpio3,
+                nav_rffe, pcie0_clk_req_n, pcie1_clk_req_n, pcie1_rst_n,
+                phase_flag, pll_bist_sync, pll_clk_aux, qdss_cti, qlink, qspi,
+                qspi_clk, qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4_01, qup2_se4_23, qup3_se0,
+                qup3_se1, qup3_se2, qup3_se3, qup3_se4, qup3_se5, qup4_se0,
+                qup4_se1, qup4_se2, qup4_se3_01, qup4_se3_23, qup4_se3_l3,
+                qup4_se4_01, qup4_se4_23, qup4_se4_l3, qup5_se0, rng_rosc,
+                sd_write_protect, sdc2_clk, sdc2_cmd, sdc2_data, sdc2_rclk,
+                sdc4_clk, sdc4_cmd, sdc4_data, sys_throttle, tb_trig_sdc,
+                tmess_rng, tsense_clm, tsense_pwm, uim0, uim1, usb0_hs, usb_phy,
+                vfr, vsense_trigger_mirnat, wcn_sw ]
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
+        compatible = "qcom,maili-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_ESPI 272 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 227>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart7-state {
+          pins = "gpio62", "gpio63";
+          function = "qup1_se7";
+        };
+    };
+...

-- 
2.34.1

