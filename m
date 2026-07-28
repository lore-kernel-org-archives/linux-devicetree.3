Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13683F927A
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227161; cv=none; b=BsdmGrRTculpkRoAPaUgQQgAQUFqcdm2P6akxSV4bcWrXQ1OzZ4UWiCsh+QwT6+BFY2Tbeey+W/mLhd/oD3YDXbk2/9p8pqBtLmieDVF6lFbjzoZVXC9L/gSJQdAqS3nuq6KTvnATbRtBcIKYwfDsYo8wCuPyGWP1P/+AXS1c7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227161; c=relaxed/simple;
	bh=6evu3aesdSZyxyQpr8UnWBSTusJ88s7x832RblxrRpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rBhK0Vs+6f5sLPQYQj7aaPraslO+xBvVmbgXuaZniYBxGHvERXlCLSrkWBqDThkVYwx/5zaxGVrWZEE5hhkLE0n13lcvcSRqJamjk1mXV1hvgMEooWX+K1DKr5GhIRV6rF771njf59BhIXMMWMZCJttHhre0SgKiniIkNPOF+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OapyYx5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1ABVFBo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OapyYx5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1ABVFBo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82nbl2309780
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SPz7u/BMzMP
	ZviDAEkDgcv8666LLO11YQMLJEjnTIYI=; b=OapyYx5QpMQ/B9k3Mm1qFF30DU8
	wDcFXCsfZuS2mJl35orLQpfy0iYiHGaVfbIrIekxsZh1nMYPUI2c/RSigfr0J/mJ
	lkGhSLif6FCE1GuKw0U2fMs+5/xh8VRV4/1tlEFLqDfg6JWo/SvF5eoieQZXiYnX
	nq743W+hIA0XJuzE/AIjTDCKHVNyP6mkkBxJ4MGC5ymB2gGezx7ZXAXNJHHoIFmS
	5Nfl33LuvyhhDFPCBhERP7Y0sU8cOotFNQg4SYwEZjtmXOGQEwN8G6kL1hmE1bpV
	1TqOuzu9yEk45l2YRZvXT1Zw0jWPk06k298bJYZibnBk7ESG1BlL0f2G5bg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7hred-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:25:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so77610971cf.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785227158; x=1785831958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPz7u/BMzMPZviDAEkDgcv8666LLO11YQMLJEjnTIYI=;
        b=D1ABVFBobCKxwYS7bC4AK6QbQRB3sSwBJskSSvQzdOOubratft6/KLAbuRInbWE/AE
         tRRQfU2FVwSoBxsDaO9iKNhbXVeOlO/jjw291UjcGnerxQVt2gf1llzxovnV7F496Ao5
         EsuEqqbI5DuJ7BrUsQgDrFgcnlGfi4EBBWM1Nibe08ZHuODtxzFMJM+6VM7BERcuvj1U
         6Z4H2xz5VmNMkz2xsprJzfVVDkrwHoIVnU+YqZHi93kJdbv0pfB5951oGI+fjs7zd+fR
         8ToBgjVw2ITq2UQS5gi3DRSF/j0HTw4lEqSXWLkwllsntoUJSv25kSazuIMYpXKWVXjs
         rh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227158; x=1785831958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPz7u/BMzMPZviDAEkDgcv8666LLO11YQMLJEjnTIYI=;
        b=Lb5ad/mLVLWdycT99rfHpNpA5oSQbsvxliwYHsq9MA/dT1Is8X8Ypf5AHfxdeWWXhv
         RW7T/YM8HwAiHyc5UAFm7p/F+x8lkS350qtLYnVL9HOyOg2ZBDFyF3x2biw6AvCVDld5
         rg7RfYrswN/iT2F+IFp8XGl+edKHdw3wVQk8TA2pgzvXZBpNqCYtpIkHJJPSo09zmIcN
         1i/MeFSD86KENcdi+dQsy19O/5q41Z7UkXSwK3v7dM9DSQxyqI+gDUlzql82Z4R6kiWS
         Nj8Vu3f8/sKbio+duRCuu1j0limlZxdMvjcv0Rw91N2X6G+5G/6lH/MHqxs+Zs6Q9FRo
         ljww==
X-Forwarded-Encrypted: i=1; AHgh+RpDl1IytXA/djIgYhKYVBZNWIifQ6ajTZupTXorad8unYNC4NvG8gX2SNXRDZOCn2CgNlHkYZamLLk7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2zBk0Rsm5LhXWTTEkQFuYq7ABUtGQWgezrUJwOz5lYfYWmB5R
	XIDtBDaGfJE4bLAKmvui4ewYJxdgjV/WDeNYoBgRuBzvrmeu6O+wY3QMdIX/5bSiCYDYUUC7pP+
	adgkoXmD685EVHEVyxtjXBzjoQEns+Tjqina6sNnZFlVG+e44m9xp3abrtdXkzWVk
X-Gm-Gg: AR+sD11JdBUIvOUdVL73NcCrZj/TW7DSdypTsVgFIympS4m2qqmuODSO3t3Cqkt2GGr
	x2UHlZx3dEUhNRJ00DgkG/M118fkeKhxjprmi37Z3/QfDSX4syfaMzyFsw1AbcXsJsiYAVbxJaB
	YMAk7kExAzjB29eHhUsgCQLDOtWvpXu/t8I8dRCYsjom6gsQIIFn1ulBAeswUOgnoHHynJfoyYR
	22peoWGO5HR0aOr9j1n3bJLmzTes/2wPvVioQ7+FDM0VKpKWTgzcMeolqaNBQsZ0KXfiIZJIUWe
	h1zZVZJEzgviAtNyqiRtbWcBPOs6c9OBqd2J15KqjDA7mWp0G8U3S+PMMKmXlO0rdKUEBP+hmj8
	TKIkhYlkeFuc0EeZSyOOBeJNo
X-Received: by 2002:a05:622a:1805:b0:51f:798:cf27 with SMTP id d75a77b69052e-529d714ac4fmr9810121cf.67.1785227157946;
        Tue, 28 Jul 2026 01:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1805:b0:51f:798:cf27 with SMTP id d75a77b69052e-529d714ac4fmr9809781cf.67.1785227157353;
        Tue, 28 Jul 2026 01:25:57 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm3585484a12.15.2026.07.28.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:25:56 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 28 Jul 2026 11:25:46 +0300
Message-Id: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfX4EorKXkCH4V3
 TqYbrPZlG1hU7cf8MBpjgc149THyfLFo2O1GpvpzJrCJtmXNMK26kd9ujJ4bHrdTI6l88O+IFH4
 ZfscsCM/QmFJsQAOWrKXSAvq1lo/xQkKWmfdblgl8tlDbF8NWgz/q0MTjoAxNPzRYAwpo3LaX4m
 BbXPDFYlfIhwZ37cO+4xAL0IOuyfFZAh7lwftLykQQU5zf5zNl38tjKctbNo450MPVtyFbqnpq4
 Wg9lZkKW6V6CUHXXZPgXAgVhwFWTQrefnr7juz8Tt8cva+9aDRKDSbaTV7y4VE5RPdFkMMemxIX
 IiRtfz7Urc+tGCj1QCCqxbDz0s0UahnrIlP9GvVle3otxsDELBaZb0nA6He1Uzn6gViTq4vRe0A
 ywA090WhamTSHEFEVCKV2GhCF+HMBQ8lM74f/ZYaTW68yviszOP7p6pz2/rYP6OhHYkTJ8KvkFc
 5HzovAe9UR98rDYVEHg==
X-Proofpoint-ORIG-GUID: 3503NfOx659cdJxQgNMkBElixGmzuqkj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfX1C2XG2HZkpZo
 cjX8qX1NEOcwCdnx2t5n5Qgmy6JkEl15YPbrLiIXkTi7TYySbnqaankFVfdFjd7gOQLTBDkze4J
 lqrR+/XSqbEWuypYCA9h+CbybBCVGKM=
X-Proofpoint-GUID: 3503NfOx659cdJxQgNMkBElixGmzuqkj
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a686796 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280071

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 000000000000..6aa2613bbf3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+  - Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jpeg-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: hf_axi
+      - const: sf_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cnoc_axi
+      - const: jpeg
+
+  power-domains:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: hf-mnoc
+      - const: sf-mnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
+      for the JPEG core engine on SM8250.
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - interconnects
+  - interconnect-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jpeg-enc";
+        reg = <0x0ac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc TITAN_TOP_GDSC>;
+
+        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "hf_axi",
+                      "sf_axi",
+                      "core_ahb",
+                      "cpas_ahb",
+                      "cnoc_axi",
+                      "jpeg";
+
+        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "hf-mnoc",
+                             "sf-mnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <100000000>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <400000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <480000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <600000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
-- 
2.34.1

