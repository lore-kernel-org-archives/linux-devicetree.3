Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A0830F94B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321893; cv=none; b=reP8WQrj7mM440QJHIl0d3vS3btO2d+ZvWd496eza6vdhcKIs1mUwWabUhborm6JFHIhgdg/kuzQLvHc6QR4sbNixGV6vkAz+IblUYJgfX45eoaeiCrY6INormjD47aa75h50Ylpf/nSnAPklgKjqYsw1soRBJ7Jew3WoBqcLyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321893; c=relaxed/simple;
	bh=Knxq4D5423UKAR3wkX3Via9xM0R1jLHouZ/zCcPtUQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TezZGLSsPZNqS7AYGUe/tENCLtMsc56HcffgyphniHfXra6SzulOc+S2MTxFQGpQSkYZ99JFIeywezZBWlku3y/hjpo/9kvQfuYHXFRP8JNRUFIDpUICe4L4t/3PJQqqWVmKIqZJncJ8gS24j92mP0dkVoYBO0lpGXATQYjG6uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eb8jbxDO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0d41f/I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eb8jbxDO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0d41f/I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641SS43616885
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CYG3iRypWTg
	hSWVq3cEnooEpodS3fjJadhGEx2ayCCA=; b=eb8jbxDOvLnt5Io2NkMS0BKWATF
	KdeSaX8cOXfQaduCNy2MjEAuMYrwI2Ilh43mdye4rmH/RBVBUmfvcPq7s7KJMECB
	U6Aj0EB6jjJmYjIrfyl1pBjZPw8vpuWRSY7rlN51mSXqBBPvobRDKzvixAhJw+i8
	+y4dzrd/4P/JVIIjhD387Rjoiaj6D2iPzbnp1/nnFQ2Fdzk2ZaJyiYO/Awytfxla
	ByB60TohccRc3wzv0933Vg6PxgoI1xw2fTRXFxQDbg0zWk3my3K2DsTQFtvs7nB1
	PVVhgHj00gXPmMCCblGLu3d2TICpCUwDoDBdkjgWP1jy5NxQh4qgaTrrbRw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64n3dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:11:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so31444856d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321883; x=1783926683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYG3iRypWTghSWVq3cEnooEpodS3fjJadhGEx2ayCCA=;
        b=O0d41f/IXQsdvTNK4lfl0/ya4uDz8yH4qkVqUgKUl4CgR9z4yFv+YJHubWw0e4GJmt
         XCFahEJ+Y0EJtZ0xgRL+VAx2ZqpgTRRipVYoNWGTnlO6pbUfUjUSWOhY7t6pLxl0g17Y
         uTOS9HsW2JMCkLGjXJT0Uo5XcfiazsHal6FNtZyi68FzO+21aHnH88bDlg05BaDmQZAm
         i4k6bMvuaP7PsOoG2Q6yE8BLrx/mc+0D+QXvF2qzUsRGGg5BNxwvHeeL3l8J6915xI4d
         V04zfIfoMVO5RCRoA0iHc8JjvTeqwXDAYlMTxlGty+tlHzYMhkEygX/2FM5RM8Jq0gEA
         6Zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321883; x=1783926683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYG3iRypWTghSWVq3cEnooEpodS3fjJadhGEx2ayCCA=;
        b=ljW6SuIrqDMMm++gp28JQbgNkLPoxYgSx4qKOLQ3jCZX1hp7kf4rv4R3CklwbdxXI0
         N9Pprfh7bYVuU+YN68dFGw8NmstCNAnYizwthosCsZ0hyg+8wA47XePtViydnRXZY+Ai
         jS0Yy9h1Yei53z0RmMxgP8WwGal6gDhP409npc7y5mDjKWn7wovbXNIEFr4qm0t+ux8V
         EOMdSW7hoJBXWo/04Ozfj6jz95LWKIP7Ayvs3UYD/d0GA/Tb5RtoS4fg5uKRdx31owVy
         +bxbNBQTbCpI+fdF4R6yT/f54/+05W2LQXPSyUwkwVQ3hQX/IqDPY+VN3ovu+yJ6cMl2
         qa8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq0l/revYcX2GTBgtZtD9kl6O5UQSYZ/gpAR9uHHpnIzhbYBRR8UDPTLUHqHA6VtRehDWFI2Z6zul8k@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOcZWxGhWh611GKNty/5SmQIq2z+76XNeQsVccuqiS0g5vo+h
	ZtUpS4y9iB4AAOweyAK2Z7YWHV7uUW9drpdwxL8WiPpXsWbGNR6gPn0QJ+RgDtps+A2iBgzvd17
	N+zCriYaW98gPYWRp2BT1po/CKyFsNDXKeaRHn7Up0h823p2/MUM5jeNBRckiNDxfQzTFTMAdB+
	8=
X-Gm-Gg: AfdE7cmDruLeTlk9eO8liIVBThVF5QPMyNR334I3VYVbqwD38NV063wg6r7yWMsanlw
	GwINEUv6Ne3lyW7b6CjlLKEZjMmaMVcXFVjQ1ew2FB2q0XMSD0SwWLHUQhTP+FReIph9yphTALb
	kIH+MgQwIDtNUWaFuWWBT5M6EcP8ngGQe+sRsh/qn88uQSBVHHj/HRc0gu9h2zZvMRXLO3pT96A
	ZWgtqpTgxe1xNsCPfH3UUTaRZwXnnW6jipav8J6HQXlxky2rnq+3V9IE+IhwIwoI+kyxIpiexp5
	iwlCwppvnNJ3CivrhGr7WEnskWkCpcN0sYl0LPfR+AtAQpCraKUCmP2QsIRJOKqsw6Pw/Bb5W1w
	macojg7xz6ZvmPbrzgKSmN89jz+DyguqjEA0=
X-Received: by 2002:a05:620a:6888:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e9a4172f3mr1241901985a.33.1783321882772;
        Mon, 06 Jul 2026 00:11:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e9a4172f3mr1241899185a.33.1783321882344;
        Mon, 06 Jul 2026 00:11:22 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:21 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Mon,  6 Jul 2026 10:11:11 +0300
Message-Id: <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX2zCJ+QG1KRkS
 GKjW73NoAGQyCCfnmgXFlfWWgf+blyxjcLsEtZpbIp5bTB/jXx2k8YwJISf3xE3bVi1cIGTjXCm
 05wkzDfLQSijbwWWwLc8Yq1w0XpCJhGb8aX6tR4DTXSxZzblhvlckaVMSrI/0S0r4tRKq9UuREu
 lLRf43AnXyiDqRZvJ54jRWmqnfmBPDs2bVEfEWnvFFlaGdvylDrojsVZ9+sdOBg6hAgSM34XowH
 rej/fkJwgt/QDHYM08TMxfu+GW+J1h08JM3y8fNfE7YQXZ/5eKuQlkCEKnKBGTrWINnUfA+gYea
 ZlTnlLHVimuKcEEHbXlxsu80X1PqfnOX0Ji4m6KAcIZWkXMh62fsyovyE1V3hp9tBRxHEk6gDeC
 PhL5YIXGJw9dKn+EkNDL3wKy2c6GVlGY1tKZQwlMoGPYrBQfkjI8cZlkR1K4SV3QrNMKSEgd5pD
 50AV6AzvjxT7LjeKEpg==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b551b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=OIgjcC2v60KrkQgK7BGD:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: HPpItpHoHnHZMven4QwOXgrDyawLaAht
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX9kLT1uzJtXHE
 +umLydHn4/ADkBXyY6J/3dlei0xMJN7bMnFtLDiApDFsRCdMySQZvKK4JtRh/WD3Y3sKNgOMmaG
 xY0kWAwuUMGgla4i36g7j3017WI/X5k=
X-Proofpoint-GUID: HPpItpHoHnHZMven4QwOXgrDyawLaAht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060070

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..e4c16388ef07
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jenc
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
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jenc";
+        reg = <0xac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
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
+                opp-peak-kBps = <76800 104166 104166>;
+                opp-avg-kBps = <38400 33569 33569>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <200000000>;
+                opp-peak-kBps = <76800 208333 208333>;
+                opp-avg-kBps = <38400 67138 67138>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <400000000>;
+                opp-peak-kBps = <76800 416666 416666>;
+                opp-avg-kBps = <38400 134277 134277>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <480000000>;
+                opp-peak-kBps = <76800 500000 500000>;
+                opp-avg-kBps = <38400 161132 161132>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <600000000>;
+                opp-peak-kBps = <76800 625000 625000>;
+                opp-avg-kBps = <38400 201416 201416>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
-- 
2.34.1

