Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA1483831
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390882; cv=none; b=YXKoHa/632TvUzL4mi24z2MbYBoIhwrNAAIne7ybctYJ0XYEzupn9XeIYoAnOgP3J2t53tdhxbDnNsb1tmqAh4i2a8zQ2b7RFT4CHs2+5ER+TroNhPUX94MmNSt/jHBMtKaLAVCf9T6dzy/wd6Pg51QMmViTVMw6Oxl2xePV4Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390882; c=relaxed/simple;
	bh=emTQjKtF958VuRYhFu2t9A64DPRu8dA2BOz/r6vU5yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKRfUjt3LsjR8J38pZ+Ka99qIXVwC1r6Lq/naf6/0S+Xn12d7I7EDBbLzo2PcpF0vkPeYv3+p2z1kf9W2QwGD002QyMHMh8TZF3Tz5KMz0Vkpf4s/nlxEt5pnL6NhOQVS4XOXpyfm6NbrmWM+CESfqmNZEbxYWPUDrwu0yrB0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyCgRki6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMV4h3bM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyCgRki6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMV4h3bM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0LZl1514342
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRz6VHQGiykBa0i3ogC19Dh3CgFydt4OqqNuW0NHehk=; b=lyCgRki6e0lUGktd
	yOtDT/frP3tsimy95ST03kDn1/kxwUKrg37b30xTJjEVicA2/2nERpECgbAlxFxV
	RLrZwh1yqHGIq66ouWCrCQBNl4FcKU8d8lBxSeO11tEyiMIMJ1jd1oSONrEPTbZl
	YTgz1SUVVc0GWUEmi8X9WjDlsO3U7TB0KE+PrKZC31xo2Vv7xh57hQispjMEBKr0
	MkPDUp2ncKrBulrkFo2F8p6Cc2BQa+cCfHc7nrc53vwuqpXJGRRWW4JBRt4KpvEW
	E4VM98n4tywJYX8WqrvGp4oldF6kxwNEgPl9Q+QvLafKd1dzKg7QX48hk097dymj
	uDBjMg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0ak1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:01:19 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-881a45f96bbso48815677b3.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390878; x=1789995678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRz6VHQGiykBa0i3ogC19Dh3CgFydt4OqqNuW0NHehk=;
        b=NMV4h3bMHi2aiC9tXcNJtEKgaLxwVHDLMhlS4u2kf3dp3wKIk1Aov2lvjszvp0LKcI
         yQb7Vr9sHujo6tMv+UyNbGCiLuKsqSlR1+LCGYrLoTkSLUSvVyig8ENBsRmoDRjKUvIA
         aT7/J4vsmK6lp4Ano5qm9sqjyGu8sMlhjQuOfLTiCsYMHyEy4Ab65I5EHzLqZLjS6dEt
         QeKKytI32/HWwvhBGh0XAS2BJ6DFt9w0BnXdpRpmrZBkHYTE5DNWb7zv0UOPVSDPh3Ty
         y/py0Q7qtycz/lbwh60XTM4vrXg+2sLso8UPQaJ5TXu4Xz2a5iHEEqC8numAIhaF1q/o
         o/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390878; x=1789995678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRz6VHQGiykBa0i3ogC19Dh3CgFydt4OqqNuW0NHehk=;
        b=XZrbI2DqcuduzjxBdZQWoxV2DGfaz5E+nuCKYh4vDzmXHSkSEtOCm099lCM7R6mkmG
         wbKuUjD3RmZ8h/2U43W+8Ee7AiDmyGevOWDPt04Z7yPirsHgsqeboDUxl9prW/m6zP3X
         Zt0+3jEBtypDnViaTifAQPzrSnVh+H0WdwIqqZhQNpxKqLBt04YOJK8Fmg/uZ77pzbDK
         SdCt/JK3/Sr6rOl1lg4KNyIOpCzVNSi0x3R0p3a7wwf8pox8X5g+CaiJopbeIE9UMpgg
         xsCNWLK3ai1SpWJBiV/Yn1UVPB5PNpJVsjSAZRl/VsDSHFuI38doJ3WPbSRTT5XnF2Rq
         qxuA==
X-Forwarded-Encrypted: i=1; AKwUvBySg0bGc3MCPXwhJ4Fg8dhlcDUj+Q64D5sproH5U0c26MqDJDDNGgHMq+WihsVBvxnJDxEXEifQIcxm@vger.kernel.org
X-Gm-Message-State: AFuF++mDnGmRUq0zBTBd9fJTb/9BOwp/FtDvZYQ2tHS/x++h7BTGQ9xr
	xwWdTVXJe9seW9QXYfelZ0RdibrnbCqfC3EBy7P6sSppLV23XzVmWF0JLwPXjXHvOd/BDw/s1Mi
	r8W/UneRhxuKFMbUdxACjwWshPDSWwB7g/uVXeWZFqssQ9Ruu9Y8dZwTxJZLtX/Zu
X-Gm-Gg: AYBFou2pI29inGmAY0tVNU3y8hmLxupvSHGGNfznKrovnvghsCvFfdCeBLBnjYHSrsz
	9JZ2MQWkA5rfPl9hCKw9VivG813VfKdVcU91v0YoPHTLxmHWwA7I+XigW6QAm4kGR35DjbVsQRd
	MussbKyizRF4o14wK/+ULHuj9kJizycl5TIKKpxahbcpY9C7raBFQzUH/rB7lU8bLSMAI7PKvRL
	fSq9tO0QRgjtMxoTcwZ1rVUuDoUWscuJc0W3eK+mdl6cJlZrdfKdIxaK55BtvU1+H3d2BZIwuLR
	M+cObFspRmjZ9BiF6uzfmrYULGKRe2A0Zji1Du8wV2gC6/Fbri9l7U+8jUrxHjEslDDH1Y0/75i
	16oMrviUCK1Nuagjb5xUmzQBaM6VZfrq6458DNYuRgWMOBIYrbezzV0grsyqab7sLlKqNKSndU5
	M=
X-Received: by 2002:a05:690c:a7c3:b0:873:5ddf:d876 with SMTP id 00721157ae682-88d235a6b73mr4865597b3.65.1789390877217;
        Mon, 14 Sep 2026 06:01:17 -0700 (PDT)
X-Received: by 2002:a17:903:2442:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2dd6c6e2c10mr51107335ad.10.1789390849810;
        Mon, 14 Sep 2026 06:00:49 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:49 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:25 +0800
Subject: [PATCH 2/5] dt-bindings: media: qcom,maili-iris: Add maili video
 codec binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-2-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=7864;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=emTQjKtF958VuRYhFu2t9A64DPRu8dA2BOz/r6vU5yk=;
 b=yHUXyrdeohNAMUShXLAoxEhjQGHj3fLl2f2QRkLimgobydlk0aqkWasPssOHb1Y96UPFRwkb3
 GCc3OCm5VY/DyxHZbUAVD8a1Z9cvdqBv226fei/qQzkx0pW1+Fr29tj
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX+PnYf8xTTIZu
 OWOCrlUha8Q40uhiy1SPqlwZX/2PWlpA9jc/9+TMtVgsm5uORzpnob6xs2OCXTtmsi55Z4HdnJO
 q0Jij2pB6OkVpmUiUwn7oIDZ9bnsmH8=
X-Proofpoint-GUID: oTp9thxwKeIv9MH-z8jkgoKZgBbKdOpu
X-Proofpoint-ORIG-GUID: oTp9thxwKeIv9MH-z8jkgoKZgBbKdOpu
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7f01f cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=4rOvIeOAciRA3S1PgUQA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX5qpmKZU+PzpZ
 f1s2TDNrvsd0QbMG73o9tJ8up3qQg9j65l6eDOyoRfikhRCSF8wmylqcaDWzAePIFDukhV0JbZF
 fbpRJelKiTtUtzy5G7jr2A6YKByUCxgbtpxFA1W/bwIFcAbEPCsJAkB6JgePH92cjjhFkfHfS2i
 7A92nFqMoglZZKGGTvPfrbx52DKP9NfPlStmNkyyrog7PjGqMe4GUNdWzalzhC92szWB3/Y/ea9
 /KxL9tgF9u4m/+x0zWDWsJn3z7w6Q0N2TtDzEmj6FIKZ8MfsfVssldCzp8CtsBZuQ+K6dlHHoVH
 PChdQ0WhwArl2lsmEU2lCj3QPuWIhYGsB6PQW/hZFwSjLba2sgssPIZwk2vL0N3mKfVDtPpx8Us
 rCqLx7Q7TZTCmhuZuAC8jeV0IaDrwfMkIRcPVlSGfYwB5LZ/p2AuOH1IO4FlGMS5x9hWsu3oVE/
 DCxOtS7JBhLMpRdqCsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140186

Add a devicetree binding for the Iris4 video encoder and decoder block
found on the Qualcomm Maili SoC.
Compared to the Iris3 generation, this block has
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- different clocks and reset lines.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,maili-iris.yaml | 235 +++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..58d241999824f3cdc85a1d644200be1e4916e324
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,maili-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Maili SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Maili SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,maili-iris
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+  iommus:
+    maxItems: 4
+
+  dma-coherent: true
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,maili-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,maili-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,maili-iris";
+        reg = <0x02000000 0xf0000>;
+
+        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                  <&videocc VIDEO_CC_MVS0C_CLK>,
+                  <&videocc VIDEO_CC_MVS0_CLK>,
+                  <&gcc GCC_VIDEO_AXI0C_CLK>,
+                  <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+                  <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+                  <&videocc VIDEO_CC_MVS0B_CLK>,
+                  <&videocc VIDEO_CC_MVS0_VPP0_CLK>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec_bse",
+                      "vcodec_vpp0";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                          &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                          &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                              "video-mem";
+
+        memory-region = <&video_mem>;
+
+        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>;
+        power-domain-names = "venus",
+                              "vcodec0",
+                              "mxc",
+                              "mmcx",
+                              "vpp0";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                  <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+                  <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+                  <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffc00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1540 0x0000>,
+                      <&apps_smmu 0x1620 0x0000>,
+                      <&apps_smmu 0x1544 0x0000>;
+            iommu-ranges = <0x25800000 0xda400000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1543 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d2>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 630000000 1260000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 800000000 1260000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l3>;
+            };
+        };
+    };

-- 
2.43.0

