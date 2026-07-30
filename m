Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E143C7DE
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423934; cv=none; b=WAKAujS/Jv98J31UUuKgH+wEDF3AxKJMNwu7Oapu4ZAD67cYJm67RvRxPV3wivUw9g5XY/zywfweMTXtia30MjC2NcU0EiZtg3i0tfMPc+T9uJlMJLxj/26fBO/gNpbkq8MYB7rmUObqxb4kjEEm7tP415Pzhx475b+X/O0FnIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423934; c=relaxed/simple;
	bh=Ix+wg8vzgUYd7842Y2GGiePZUk39A98Rvb55nGcQ9hM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cTKSRtQwI8A2Nyp5waZLiVAtdAXD2Ech4Z9C5e2HFFXTDisO+fhpFDTdROkGQWsF+Ke1vixc6MkA/u6Bq3IbCkLLSHXbFW3HIYSLAZc7E9d4YN+/iiuGLeysCkZio7SUmVHSP3RO/my9GsRB2LML2dt2R49QrmpuBb/0TIVBmuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCxAwIM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym5ADWKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCxAwIM6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym5ADWKt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEcoR1615687
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nkjwgkba610
	1SVmpfEBfl7XWsZeaYnMungObjyn30VI=; b=iCxAwIM6xp6ioJun4iVk1GvL9tR
	FnW4vOjPadvPWGnXSysnkBQJFQjR42s8UEVifxrLz4K0wAUFsyLuT77FAZnoOB0n
	MKRZZXcDX4p6em/jZSzgU+osjaUPl0snD6ADQ713+DOdB9ELDn8UZ6fDurxk6SHY
	bUxruuTEbMbHdw9IfDkryOELoycqcysztZ0kmrFrfpxABcCGcYNkr0JO5Q3ANarK
	5fay3LEQGXMgIbkhe/riUfrUoMCOAjXec2JOUWVHk4bCot7jQgAJ0QRqU8ptvP3f
	y8Voa2gyKx5YCQqfWtDMBozqPpkKJfyPyPePINIsW71/WpwDI0kK8FCllKg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8j7r54q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:05:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7563011591bso247965137.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785423929; x=1786028729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkjwgkba6101SVmpfEBfl7XWsZeaYnMungObjyn30VI=;
        b=Ym5ADWKt4ABXQn8N63NNMmN+OFkxYpffwA6L9mpvOWlNicGq1ElgAMNSet3GmTSBhv
         HBojwOSR5w69oqSxkAxHTBr8J0Xhu0QBMIfSeH8ilMdaR5ilkKdqv6SaEN47s7r/YgIF
         0sJzpoEr5Ewn1ludNEB6f+F2tRYt/CrLMsxPi9VsW82xR9C+X1kpY6jO7m91mG7dhXcE
         eHgu8wMZo/Ha9rGOB41Z8jHopybQKKTNjw4XvEE3f0FP3FnBXV5AZLcVGJnQlS0zWLED
         XbcgNTgPolpSj/iVx4o1qmgD/kOIDkNVe5ms8SNx1ebcXyP6eUnebLTRH6IsH3ubMvwC
         0nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423929; x=1786028729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkjwgkba6101SVmpfEBfl7XWsZeaYnMungObjyn30VI=;
        b=i9Kcx+lB3yC7Od3ZbUieCZjIkLkuXUy657f92+fTAxpCJ2kKkSr5lsuaW+MJg75Zmn
         WBO428xOYmr0ZXutrwrX1At9KI90D+MXKVpd4ZH43mx/1h3yG6XQLhMFU7tbMuszWrE4
         zcv7OT3cDJturMds+CzWIVRnCs5i+rCDh7htJPdIAeN7R2Ptxlyw8owyu51uRhSFzyX8
         8qlVKZKHrVG/n1UvV30NMrp9gpGuVADG95ex1DNLpjDremidQU3CtByrRrGwoIXxzpX2
         0ig42kW9yajZhJ1YDMiPfN3sTQxqWEYSsyo792Z/jObWKh39slPZ7B9NA2V6okENK6l3
         E82A==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Cnvda5mNfwcq7A4bRnh5dUaEj6dNfwYwR9U5PdIX9A7t36RydSpKOJcd48T5h5ZRvkzn3VP45DgN@vger.kernel.org
X-Gm-Message-State: AOJu0YzxZ8hZvvwiFjUwNZiFJDU7BUQDl6odrUXmwvAoTbUAg7KYnJXP
	f/mdL935t0jdFvsGc9YC5NFDNEKp8NJ5nS+XQaLEeX+UAZXHsYNT1twC06zSHf9mtVWYJdypBZ8
	HFftEY1FGMNt0VpF2U1OL1BQSNDNPnUdJyKblGoHstmjnlsCItr96NXLS8QU2nY04/whkF6sAP9
	E=
X-Gm-Gg: AR+sD114mPDgvLkN2w9zHrh5e07CnHcH1/Qv4rHu4bevtYHQ4V6P21FmE3upRMQfNZb
	TUtk9E4NGNWhJpJaOFMmaYVPjogXCGDBy1DzFqEC1Bd2Pmyn4D+iPIWKJb6l1b8TneeU1ZWEpEF
	8EJflPDNhiNYbRwbphFW7DBQIMSUdbHYA78hnLFGmh8PQ4GspgnXe5DzhMAlWius1cdl8zAaShM
	RSNYBt47hs8vCOMAkAZJZDtBqqzk/PLQ7h86jNqs9nbFO7s8flFba+7NVUjP/rGgBAHUM+w8VEl
	ak6fDQO+1lbUacJlqd/TIBY7RlEgASE7a3in2vU865nDGmu+vrUkXSIpOSWm/+tNa5cMFNGUXyP
	h9OCbXPSYDYcwr2AZl1jX6yQm
X-Received: by 2002:a05:6102:3708:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-75750786c56mr968835137.23.1785423929044;
        Thu, 30 Jul 2026 08:05:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3708:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-75750786c56mr968807137.23.1785423928521;
        Thu, 30 Jul 2026 08:05:28 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bf2417sm75211166b.59.2026.07.30.08.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:05:27 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 30 Jul 2026 18:05:22 +0300
Message-Id: <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNCBTYWx0ZWRfX70xyvlRWvfRC
 e67C6npU+NBcXj1Wqc0INaMM4aPQwey7qGh7+9KgpAaqvrFoJAroFO+6O7cG6tbjEhbGkBWPMfX
 MPOrm5O2rtNGyywwaWnalCEpBjP3ABbwEBVstSkcrs2PoUB9XncvjsKpqeY9Q5abBET6oB64Th8
 prLIgzXOvbys2XbWxZEVz/viZMykeU6ozYpB9F41Zf+MqUaeNHXPrBogl1moXbNjDJO8NX7F718
 gGJHAs1nJ3jRUnzo/IUu8twRhBEacZ7S0xq2UfY7Hm5Gnf6BQKFY8S0LAmrirFllad4f1xJ27ZQ
 1Aj1dRB9Z5tzj9ipbGyNAt2hSM2nncATOWqNCiEml+rDXi1PLH4Na6Eh4H5sXrP51LOo+x/EpPZ
 na7LL4UO2dsEcFrj9WftVv/dX0ETF4eLI644CNESZHlXC60elq9g6kWTy2+PA9Y7IoZAwvumLnx
 zAz+PCs0PIH6Ar9m53g==
X-Proofpoint-GUID: 1y_aJhV6ccYtNc_jQa7078UIUOxNGuPG
X-Proofpoint-ORIG-GUID: 1y_aJhV6ccYtNc_jQa7078UIUOxNGuPG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNCBTYWx0ZWRfX4gmg7v2U9dJF
 eh3DsukDV7Re1AqGd2Mw8GPytwcrU9GLm6OLDowV6Dd7CKaSTlejgcO6aTVmJkI/GaXc4xIfd80
 JRuZjrE469WxFshvzTAgdosw7mlDBnY=
X-Authority-Analysis: v=2.4 cv=LraiDHdc c=1 sm=1 tr=0 ts=6a6b683a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=ODZdjJIeia2B_SHc_B0f:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300114

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 000000000000..70f573100573
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,156 @@
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
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: sf_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cnoc_axi
+      - const: jpeg
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: titan_top
+      - const: mmcx
+      - const: mx
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
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
+  - power-domain-names
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
+        power-domains = <&camcc TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "titan_top", "mmcx", "mx";
+
+        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "sf_axi",
+                      "core_ahb",
+                      "cpas_ahb",
+                      "cnoc_axi",
+                      "jpeg";
+
+        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
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

