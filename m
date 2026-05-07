Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF9A3D4125
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194236; cv=none; b=AzdwUmXBjfQ1YD5Our3v4AAzuwm4MwA/RaELF9mpRowyLVW30QfGK7wTdcxKBIYPS+mv1D7tJyEpSst4bWHz/RCyCO5CFpNxJtdYQly4p5kXfCHmrgghO/sLyVVLyJDQo/DuXer+i5a8Wjeirw1Ub2bAAlCTH7CXPpEalxWxNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194236; c=relaxed/simple;
	bh=HnARY+NkaPNMNUfBnCSEykpZMQqEGOfF6pr1czcSrpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z5wcnvoPiUMkO1lDJXQWbEYwFsHH6oY/sHEpRSbi+fN3mI0uoe3C27BDL2SGqthW3DCMo6aUVFVyv8tsYBlPQn4aQGhb6jqcBuavoGVpNGnxrcZ4dnL6hWPliRv2nuL4pN+dWi03AMgb8nYCf3KZo9Bxpi8ZHQOqDAzn9QvY6zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUBFhLsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O43INbA3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUBFhLsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O43INbA3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647G33ZI2384344
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Q0b5h3vUIlMdYhm0j7sbnZMJtdjyZUlMTDf45sV05Q=; b=bUBFhLskwAmbqqKZ
	WBd9gh4rFtkYZ2PJs7seBp1fnAbqgGZ3o3Z/5MxhhCQnCdKuGtjPg73dozAVMQ6e
	/YS5/KktrLbxVDC8E7om3a/2tTiM2xwU8LayCXkbrE9zXfMGO+rGEHu3dR4LyPbR
	ELXZidV4g7EHfR6x9EsfPnwNjrj/xnI/JmkXe98BdCdlAuzSaHGnlUEKcggQ2AMg
	aUE3mdzVFd/0RMYQ1JoycCPPjia4Rkyqgoqn4o0ZL/NQ3802SiPup1epPj44rKJ4
	uv9L2QcUYOyA/Bc5ThCrc29pycE6TnKlGwiEwuS4dfUq/2MmN8Hx7vT/a2QCJH5z
	VssuKg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwuhba9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d1fd7dce7so1099698241.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194232; x=1778799032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Q0b5h3vUIlMdYhm0j7sbnZMJtdjyZUlMTDf45sV05Q=;
        b=O43INbA31XQNhHM6Yes940vuK3EAa3vrOR9xqVx87BFLjiXxvhAJrI/gGoVluw9wYO
         libeDdrNbKea2z/fEO6cG7tlXmSn/00nky98ZZZP5pgNchOSVRB7pag6RnqY1e2FEJJu
         jnqkVirPOuvdLU5z0LO93yHcLqFOstBe8nXlWX6uZxu/ARm3KE2bi646E4Vuuhljk23F
         2vzlFGFwDNgFzHJGfCX3BEFWzveGMuCJBu0tgItU+/G1AE3I2vrS9JXXpB39XcG/LHEQ
         JhlnPekE4RscmE+CGpfYCPfOx+ao2NudStWbvuCgkVv2VZGvNyX8d3NHqoYB3Cj3GcDX
         3HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194232; x=1778799032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Q0b5h3vUIlMdYhm0j7sbnZMJtdjyZUlMTDf45sV05Q=;
        b=NEQF2cGxzaGiu5i9xhCc4K/5vRSMzcUTdB1lKCJdTwi7fgoxfUaoZ6g0zPG3P67bH5
         FzLb0Sl1CxJ7MsRDx19tVuIYV8w+tN7no4eGIEaIUAUMelhJWbw7jiu3fqq9xB+yQRKz
         /1wooM/Tn0D9GNlL0n5kL1yDo3ph0XWW0HeU/TVWi4j+KHvpKv5E7PVMEaMK2OJRySd+
         ufYZzMEP7PCTOk7fxV4bXd54eQXJxWzswGRpU+BJKWD1O1kgY1w+10fMDsVAFyCtERgC
         Jehr8rIQTgSxVIlxs1jDdV9RXNL04sJ55uEMhqGev03s5JqLYmYRKFga2ogxacEvNR5O
         WOKw==
X-Forwarded-Encrypted: i=1; AFNElJ+lJdOrxuxcQGriZgH2+eR7aUdHlvC3RHKkCW/j+lXQlCTSIIhxiByd8OvmnjBKegtkLRLRAVdP3Kht@vger.kernel.org
X-Gm-Message-State: AOJu0YyRLAdG2e42cLHM4nWk42p/M5ZY8DXS5w/nVrHBmHgaOAw3T38s
	2PJKgL56ipA/XGtJmI39MBN4nxmESYwN6eKTnpGjcOA0bjBfMogE/L8XzD+DQyBwzW9L9Zc3qrN
	AI6YO5mKWjI7pblza/sPpbZS8IWsEz+7OqXUpZQSAC+LqcDk93y8cg/SAMW5lDTzh
X-Gm-Gg: AeBDieuTP33WLpeB6lFFQP+MibdJXvkyV9ID5JrgUAwCAO3UXlv9SqDNYJ84K7EqLBW
	HDyWiIfqGlnf0podvS7+NZqmALQU21YWLPbTHVpNoOOyWIPLEDYJWxc0p0e82ugKs5mf7qZWqeK
	W0jGXIbXY/tx7K7f+wl36mhiyGHIz5DfEeDcJMhRn2S7QiSnHYCws/qjBR2HZI49Y+dGllIZ2Dk
	XriG9+FQqtuicyQAmvHtdP/tVLSFJQDP+T6FrNFTsn+A6mRcFsnB2yBKn2dB+HxzAkSd0Ei5aQ/
	J6CVuV3wKmEfH7QOgic/L6JAtPWoqzN49MOz5jSCgWF+LthqvAgmd4btLfIdzni+S6zJCptN9+F
	MdM+bgTeITpCtescMqM+Noih1gq2EWxTuZ5ueBH4dRebqgBHG0W2S75seui5Wtv+j96jXyIoiL3
	dCM4zS3b17xpaSOd0A
X-Received: by 2002:a67:e102:0:b0:60f:c9ba:b999 with SMTP id ada2fe7eead31-630f9023892mr5232269137.21.1778194232269;
        Thu, 07 May 2026 15:50:32 -0700 (PDT)
X-Received: by 2002:a67:e102:0:b0:60f:c9ba:b999 with SMTP id ada2fe7eead31-630f9023892mr5232256137.21.1778194231783;
        Thu, 07 May 2026 15:50:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:24 +0200
Subject: [PATCH v3 09/15] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: okbZUJs_A_2Ua2WNaIkl8Mk2hMXs671L
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd1739 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfXyDgSCZvpYGdm
 rXHuU2UhqJL/DIlH3ke2cLe2WgM6zBLtMUPjczkc8nCqqUiGjK+ofERqTU36WlL8LorcvlV+dWS
 onKWRb2RpigKg7IMdzVgRUVDxfYR7+k0WFpJEP8ezW+cyrDuRdWZ0Pk21T2LwLZvyQPdtEZzGch
 yi6SHsL63DwWeQxb8y/YqTqBorFQrCa7UJvop64e6fNo0yXwrG3Nuk50+lesecDSy372/tXmjFh
 l6xNguHleyFgViKkUPhbnEzODuhkoCAVpI7p8tECPGSQlsVhOXgCjLuJgIvr+sXoReV0ver5G37
 NizfatYZB2/v/IM2l0umZ2SBsSUFq1rZBGh20wHNhsh5ND6v0aPetXn4wJzg+dvnq2Wq2piubAr
 P7Oeju9it3I2h+g9mg/NHeIq84XUlj4SrSREq8qwlqlZaQw64dIIBws3sMsmmYTeaEUlcvWFmG7
 o1N75x7/mLtGOWyRg7Q==
X-Proofpoint-GUID: okbZUJs_A_2Ua2WNaIkl8Mk2hMXs671L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c91d73af61f5cbf8384be5ff9b03683de8413542
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: data
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    maxItems: 2
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42400 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
+        clock-names = "core", "iface", "data";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&rpmpd QCM2290_VDDCX>;
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

