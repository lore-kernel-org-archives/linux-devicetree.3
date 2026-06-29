Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD83FC5A1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735487; cv=none; b=MftAanJcWJaTdfGaYwh1qFG686M8krx8rg98/mya3fYlTCfytXdIYMW6qZcIpSZTFmCXF7LVm/RN2ZfTV4NdbhA8MAYEOZrYtvfHcxTWyru032f9BeAGyYQEjDrgD7Q7niuBE2zTMvREKajNdiL6xzaKbupjPGTE4jNBp/OI6fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735487; c=relaxed/simple;
	bh=0osYs0gFrrJEZE6iCUGbkP1jDPBnlf/O0siNXKMpI0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOe3u0zcFc6TL5qtFbpx+86kc+Pti34se72Mr15V2tMENHnF3MIQqW9cakeqz9h6PKAHJ+B6KEzIZPIH/lxNKZRpaZxRtfvNS+Xbb53ebxtNqyudliQOYlYbYJlvjl8un65SOzXYi7jUmDXgyt0Jx9aau67XxZ7zRJVlBsEwWsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfcdb+7X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvqliEZi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfcdb+7X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvqliEZi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATDto2578972
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=krgFgmnm5jx
	WmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=; b=pfcdb+7XB0KUiMWiu9eti/bl2Q+
	8p3YIugewfkH8kchyHD7q4yAOEAQrntgB7UpTDsDL0FirNi0SBdIpGx8rWrSOgUy
	STs4M/bu4wVaIWKl9nnkcFUa5JYAGsc2EPGuRT3Rq2GIXWkpjuLlSXmnuy30TEsn
	h77yYZUwiDXW13bXrozFyGsxuq4xqpMVHxup810Ub0RxkkbQoUGa6D0riqA6UIY0
	LqfCZmTQvMYGzo/hbHXqs0YsSFcRHJduClwnTptwbLsMfaV8eyw6kqoXauE3MF4c
	shTcyBKGMtu5mZy32FBy+U8EfqTQ7Dx7BJsQzUsMrZ6Y1Rwvmp3O8kcHcIg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7h910-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:05 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbd3241499so2848466e0c.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735484; x=1783340284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krgFgmnm5jxWmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=;
        b=PvqliEZiG0mPZqjMMyHWV8FatJln7ZfyACouFVxEZrc1jEoHxEtONjWiB/Iv7dWNOI
         MsvGZAOK98hMcU5g6mjKbpJqmIIRd8uTJuzETZOIH5p638LLTpPolhyKtt04VkY4kiBZ
         Pgeg8txzLNFky0L+oLiaehkeZFa72honH+4xr43Gh1y1Xi4JJ9hCG51NlUTv45GParWZ
         N6Gg99SwVQjxo2EobTJ4Gzq4a2mKUe4Cu2MnjGUoPbPh77TV+zvVLPWtqogv/AjkX9gu
         nQ6QucfZY1J3O27ORCRhKOsUSF/+yNfM78TSIE6FNJU4sWAEyb0Gwys0RQ2DP6Ri3TVb
         J8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735484; x=1783340284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krgFgmnm5jxWmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=;
        b=F2vARU5cBDhejLdMCIdlu/PEH0utOLdrxRW7vgUC8TngxCz9JmHTi9m73a0TL99kM4
         LvFbQE+7xC/62mqCPnrkswl9eHdk6Qi7Ih7oivpZOZeeGi1SQZ4mSjzFn1cypqopb4Oz
         w9qwc/Fnn7Z7JT7iPbv8QoyLzvrArLsqXXchr+BaBMyLlccHyDDAdygS5L9AcafE86Jq
         FF1EBaMPiWX1d/lRH/28mzYfvZOC2UfRXXoB0mQVvUV26fMpbUXfhv7n8dT0BbmtBLIj
         4PE5m4dVVeGwnwrrG11EJTyIRT0MzN+/VW/NQMem0fmXibGy2pUcaLSulu16UNpFtZ5+
         F9Aw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0uJRyZjVmux7rnvEhuBnYLCoQZW9mUiM6Lvqi8ZTNJFOz+Q5HjvgUOpuQ9fWAatV6VxswFlvGbggF@vger.kernel.org
X-Gm-Message-State: AOJu0YwZkZyCyi0KQf7CFFx37RlYNLycFZNeXoPA4AdAbrChg7kP4Yt7
	Zjn/Eb1XIhD8pMvkV60UGHeO0SYQ0nEGYJ+LFBXiCatcUoLtUPnJLH/okp3hOOnwmKBdwsLrgHc
	KH5nTzEdGJNS+ataiJhWJo8FGJIpwqKRZR+4SBvWCE1nh5J4T6Qgos970JN0ZJf44
X-Gm-Gg: AfdE7ckSI/NMTyWDr+bKjXGRnzkJ2tR/3f80t3UdvANVFDX67i4jX4Exr/aXm9JHvBR
	GqyigBV/Htm2FzmIf9LqNyR0tgpi8NZ6fmGDO4WdVW4szRpzdC64/E2fncdX7lZ9QjfVaRSNdS5
	Mj9+B6wTn+KDPxjl3eiyqZuViqj/81MISg9TkWcTQUGYcDK736J8fw5O+o1mTb448hdoDYkfw67
	MrR0LCZCdgFYx8GiyVtMwvdb5zpozCY2ZxGmei2faDntCA26I+Vc6RY8C+mz1sbJ6OdhEajhkuL
	IRgi7zZklLMwUc/w4n69rne35dNKq0bfHsLvOmj+nEPEAn05S4cJdAkeEQFUE/x3X3hLeu8s5GR
	EoPVTl8+RJPSrzKrpDAFRMzKFoKlR9xcvlU4=
X-Received: by 2002:a05:6122:208b:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5bdba88ec29mr230816e0c.5.1782735483553;
        Mon, 29 Jun 2026 05:18:03 -0700 (PDT)
X-Received: by 2002:a05:6122:208b:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5bdba88ec29mr230759e0c.5.1782735480453;
        Mon, 29 Jun 2026 05:18:00 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e0d15sm6837519a12.14.2026.06.29.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:17:59 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Mon, 29 Jun 2026 15:17:48 +0300
Message-Id: <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX8PECTBR67H1+
 8atPYtDN4GbZCjpcZ+unuGpD5taRqD3NzP0xID0xkLSjFwmmX4vabzBI+FFynrUnDkdS5CIE/YO
 /lv99WEL2EaEqKp8TN6kruoMArkXy+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX8VF15GvbVaD1
 blPPp8/7Gx5gf1oWmRpEiL65gs+By3JfdR6ONN1e8vzZf0mRdMAXpIlbXOQQq14Vbau2wWQZ4XF
 48kiCCkPgfercUThRRY14+gsxEiUJdInroBlbNWPfliyGYwTQ2brFcCRpF3QmOIQPn7Vw/oNvCk
 rlrbM82CzNsWUpS8rMUdctDl7H0gcL4B0VpcZpfflO4Ylc/yZz0+zHFNJgVDg515tmKDM/8rjj2
 wSxn42w7cEDxIU+MlOZ1qBCRR3NvjK0LwJOl9Z43gW3zQxBjY4yLb4N1XWcUOCVZPe2PK2p+1Zo
 guRkFNhguVp7Ru2kZ6OTrcbkVxjpp7RYxx6TltdU4F1cSGxBT1ysrPRx5WVnnzR/vRDBEgfvqxn
 xD4eMOrNlKuydXCE4u1b8bDegixLeb98Iew9CsSHwo6S7KbBHt2GC5dyKaNCS7xPgb3fE9XnPLd
 /FJwNsSZH/j0sXz4hvw==
X-Proofpoint-ORIG-GUID: HR8DbwIviFkhMc1kE5BbatrE-TuScthJ
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42627d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: HR8DbwIviFkhMc1kE5BbatrE-TuScthJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290101

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..c8b4808054cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,160 @@
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
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Two SMMU stream IDs for the JPEG hardware. The first entry is for
+      the JPEG core engine; the second is for the JPEG DMA/scale path.
+      The exact stream ID assignment is SoC-specific and not publicly
+      documented by Qualcomm.
+    minItems: 2
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: hf-mnoc
+      - const: sf-mnoc
+      - const: icp-mnoc
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
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss@ac6a000 {
+            compatible = "qcom,sm8250-camss";
+            reg = <0 0x0ac6a000 0 0x2000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            jpeg-encoder@ac53000 {
+                compatible = "qcom,sm8250-jenc";
+                reg = <0 0xac53000 0 0x1000>;
+
+                interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+                power-domains = <&camcc TITAN_TOP_GDSC>;
+
+                clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                         <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                         <&camcc CAM_CC_CORE_AHB_CLK>,
+                         <&camcc CAM_CC_CPAS_AHB_CLK>,
+                         <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                         <&camcc CAM_CC_JPEG_CLK>;
+                clock-names = "hf_axi",
+                              "sf_axi",
+                              "core_ahb",
+                              "cpas_ahb",
+                              "cnoc_axi",
+                              "jpeg";
+
+                iommus = <&apps_smmu 0x2040 0x400>,
+                         <&apps_smmu 0x2440 0x400>;
+
+                interconnects =
+                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+                interconnect-names = "cpu-cfg",
+                                     "hf-mnoc",
+                                     "sf-mnoc",
+                                     "icp-mnoc";
+
+                operating-points-v2 = <&jpeg_opp_table>;
+
+                jpeg_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-300000000 {
+                        opp-hz = /bits/ 64 <300000000>;
+                        opp-level = <0>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-400000000 {
+                        opp-hz = /bits/ 64 <400000000>;
+                        opp-level = <1>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-480000000 {
+                        opp-hz = /bits/ 64 <480000000>;
+                        opp-level = <2>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-600000000 {
+                        opp-hz = /bits/ 64 <600000000>;
+                        opp-level = <3>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

