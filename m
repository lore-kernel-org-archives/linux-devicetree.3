Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE832A3E5
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131312; cv=none; b=rUm6PSzA7Wkj6DnNB/bZ9YF/5I/DkDBX3ikUW5DAb8drWmfWQsPpYre/ZkNe2Rz6v80s8T5jCKC+3k6gspWnpnihCyopu2eNXuDqOSv058ZU6v6QioNgglfhsPSdC+KO/hO0Ntwx7iOIZoUj5O4hL40r9SNEmeiE1R6GDXUdqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131312; c=relaxed/simple;
	bh=+T5vulQEyMVm6P9sXfAjnNyXQcGFVgyBTnNOo30l8nE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGyMHQosJzDijmBz24i4mS0SSwGRr5/YBHc8p7GtLrvVa/t2dZjdYJTkHQnU6cFIvlte2rLK73oLy3QzTGeGmB44ghQ3hGBMlndLsN1P2+WPlnJsV6mcoEQw0Lm15kCey+1AxHGjMgo2eJYSs1sNjPy5DJJUVBroDC7iaWSewDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ubd3HtGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Naxcznvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ubd3HtGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Naxcznvj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN7QLU1530052
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=; b=Ubd3HtGxd9l4NS6f
	yelSLSUB8yqTBPCg1o6xfmbEATxZcwHJ+hsOUDU2FIArKILGA0CTEFCwRA3WoiDD
	zmoS8cJfa9apR/PVL4vGU1nRsXSaDS4WZo0CFEC15b3vOcxPuEl+xIWO79ZPEL7f
	OSKcVpA6/9CGfW5CoT2XOsbypJUWmsXUWn1iw3YJ3uKmrLMORPkWdRgynVN7AcFO
	nmshmgWpSy6UK5bYGxmKNAyZIHxDjPtQ6HBILrxUM5e5rb6KCNjT0inczOKf1xt6
	SPbeEBhUMj1lQcQkjU4Rktlx4sCvBp/LrTHT/OkcVxNwXs0xqaMWOd0d4MvNsE3a
	e3tssw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qrkvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1146760a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131308; x=1790736108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=;
        b=NaxcznvjcMgq/51LK3+2QOblT89Dol294HOjUChuor3ScDXN8YOjYo7kHUPXxw9cBv
         HCyVd8r1G+lUFaQhfenS9Gc7vuz3LQT1MAOuuYzF4bT5bSz2Wm6X9BeDYugUQpRXOgrl
         FLLi9fu1n22kY/gqJGkuwhjFYyWGwVkH90GASkn5LK6ltsc0C7TBcj7Fs7/dFM+HyhBY
         7I8gqihIjQ7TEuuHADJRTx0yMhFBtRUdGUTZ5QloNoEEDDlhABzFLPeKl363cjjMp8ao
         JWmGodbvuvo1O+QD245QjnwbUdJBUvvYSDex1OVwcQfaMLNPolpYaLlTshkaLfZTLf69
         qt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131308; x=1790736108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=;
        b=RbOFcXZjXyPjsMu/CelbgsOeDD591WczDCxeJqhvXWl7aqdpGuYK6X4mnayrqeawET
         uo9RgkFU1lhVqjSht+stzZKBGOXxo/c37vrBebVn+FTf3bXgINYSqYdmQklYyYw42iyb
         uqOSoS8XlJEQitPAB1cjXc6sDEVOp0Jmb0o1r/iE099IUjlcmIPR+cuqlBs/MLQ03PPz
         vNgm6G1YvBMqy/zYq6iNkobzoGW0TT1/rwu6yX/Uh3g7+tleC/y8q5l+WkIvCyk/smWA
         TBI7aEc76RYLD9hnSC500x69sTppd0XvNIavbCTcgSjTUd1bKsSJItZU+rj6s+rjxj13
         VvRw==
X-Forwarded-Encrypted: i=1; AKwUvBx700NBhG90prs/9tWBHPIYjEjEOQhnivITO2tOYzFobDyWNVVxM62D2+K9KGmqVn/9G8rr/ezUQP1L@vger.kernel.org
X-Gm-Message-State: AFuF++nJz3EC+JgTvQIh6Tew+nbJEeZfBU4/GurFfeKqHsq49x34glFT
	VDuWiEZkTOwMFIPFBebWn5r6oD3Hit5lGSrnbZVHhMZ4SzGDdavjK1nmJ/Kn/zJIQaNVL7gLpLD
	J9pD+dR1x+5yN+KzYeQxa3RT5nF0Vb48Pa3HozNBR7CSJrSUi8fw9Qo1duOjJI6E/
X-Gm-Gg: AYBFou0wbImNi3mSZX339Yd5CoPv6y1f1HeNztOD9sXiIMCvlrurpaHMo0UhqQ3x6av
	ZEqDM4UGvMZfHOzbrTLz65Gl4x0zOdgVHENXvsR0m01vedg9zwZzHnffgKjZTL1XejI8WFAyUbg
	Hxj5ejJtREV5v4gDV3bVk352GARnyCpTuPskQ/3xNs6KjofBzGfeR7mw3pjimEhYwlo+F+rktHI
	A78fUPsByySMxnvMenza3miCEV7SaQxmn1EQ7CglsAFzhQW1rYKVsS0kZQabNP6vBjv/fGrNem2
	mrFzyWK1iriCdy21+f69Td97Y0FIuGvgay/6kpqaw+RdS2yhk6whbHmBN0Gyv69/zNf7HtziIMZ
	iCXDDPnTqNXmH9tMikW51xmn4uYNveEHQP73POlh1K5y5xpryoR7UYrDumushlwKT1tlIBrPHxg
	==
X-Received: by 2002:a17:90b:1cc7:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-3a07e6ec797mr1084739a91.63.1790131308347;
        Tue, 22 Sep 2026 19:41:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc7:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-3a07e6ec797mr1084715a91.63.1790131307849;
        Tue, 22 Sep 2026 19:41:47 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:41:47 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:12 +0800
Subject: [PATCH v2 2/6] dt-bindings: media: qcom,maili-iris: Add Maili
 video codec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-2-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=7742;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=+T5vulQEyMVm6P9sXfAjnNyXQcGFVgyBTnNOo30l8nE=;
 b=xs8h2an6tuCJt9Fow62KGRLwQDXcITZvAjw0qf5hEjCu+Q5qUSyhg0bs/dIzcUAkFh8f0BbUr
 7QFBDzokvf0DYfo6QQdevD+ZOSy8WYnTziMEde9O/PpM/O8bPEm2djw
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab33c6d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MWoX49SKP4xWF05JRPIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 59epJZlBTUMqOloiMwHkHcEUir39unjy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX3s9+4QBjj3Eg
 G5I6NQiZuXyQPXOo2CAfWaS4bwKwrWSlcRrmMIIfMe9TmKoTc3uWv20pN2uUxdhPnRHh8DpChW3
 HoLfPGNzF+1SKWdj4LioCBBdS08Mzs8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX3jeYrcWVRF6Z
 pMTL3f0gcfjmICp8ddTkQXYzALy/kLq2ZnNaH7+zAwrUtGChYySWfZcRwwN1+dBweTyhKORhLte
 do6v4U3J2esxRVSKTNsXl9aXcnj1XPrHr2f+Lg30+eexp+bzt64edVarC1OR2biYxpt7JE5PDOM
 TGHL80TnOpTY9gRxE9dqBQQWQNIhwgEkUHTODOHBKmyHnlxpf6v9Wopn/FkeBkYySa/5JjiSWPi
 ZSObhYI2JswJl4kQP0L/wH6CKOYDufP5ZkfNzF/giMBkOtvU3CYFmX1VmHNFDldBDtaelNRxs45
 yQOfm3kOiQ8AdH7LARGAo4IqbCSYEpx8rbrQyfMl2M4qnupOQEdapgoKi/5Kgsst+9O2df+07FI
 w1PWbIiR7Luacbcn8fd2pvzWzhmTb88gBvJdntIcdkCBXt2zxQ1ko33UBvT4BSjGqbziCL2u7rW
 gRFFXebnBM+GJOgltQg==
X-Proofpoint-ORIG-GUID: 59epJZlBTUMqOloiMwHkHcEUir39unjy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Add a devicetree binding for the Iris4 video encoder and decoder block
found on the Qualcomm Maili SoC.

Compared to the Iris3 generation, this block has
- separate clocks for BSE (Bitstream Engine) and VPP (Video Processing
  Pipeline).
- power domain for VPP (Video Processing Pipeline).
- different reset lines.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,maili-iris.yaml | 229 +++++++++++++++++++++
 1 file changed, 229 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4ddc4df8481b52661b314821a9fac68870d8ca6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
@@ -0,0 +1,229 @@
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

