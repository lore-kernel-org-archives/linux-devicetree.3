Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA63B19B1
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459874; cv=none; b=lmC+RyN/EQuu6su6KqZrjWkqaWntpf0y+nirik93A1Z63F2HCKksx5VPQs4nfBtjXXLt9wn2i/pVxH+B4Kn5vPzRmDQ277X1ukfbXPpf1nudeGrrlP5ZsvMqEhvhd5wu0218TPlmLfyv54M5XQr6zPZ/c7NziKLVkPfCr2XEVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459874; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcYwMRe6sTfvFj5SXTx0fdp4LRVUlS3W4eT9wmUIQTQmqKTLgR92AC5CNYp3H89NNvm+p+9r6o2LCpDdx6+8kUUuDOderTdS5AoFkH+u4VegdLpzdC0cD+O/CL7XmGBrqqh+lmBfPP6R2MPCQ5LN+DAEeCtCmRLkVhHh9ThFHqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKX10Ys+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLSAJ5rv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKX10Ys+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLSAJ5rv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F7Wn4R1790828
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=nKX10Ys+WXtgZEky
	aNm0qUs3q2jb0QImk6qA67WoHx/eMre6W0OmGTWzYbxHP7xdAd7Pz7X084aeHVDy
	VwbiCbjAiGTov3Rdv12DM+i9kWk3EI47KxEKBGZGcmRr+eCyR8DFlx6Vsuzu/ecz
	XJ2yTr95W14fKJZS2UJQqUilJzszsrVumUxxo1qL+CAGQxumMuTIafDIS+Vz7kRf
	9KTArW2Wbq4SUIZyR+DpF77TXfH/BmrMIMGE5hd9ih/grNpr24iaDJLOkUj4Yjg0
	v1JP+vNFrBdjfvzgsOqmY4dWeaxmCKJhH8PKybuYjFvEmY3wXCsjBGu7w8VamypJ
	4MNQdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp85g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso481353385a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459870; x=1790064670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=gLSAJ5rvmwIglFD9EG1hYthmJuXIjIboO7q7QS2PQURmTv95Ckd9t/1OTzh/ri47Zo
         CbDBwF0i2BOUJU6mSt8bcN6h6DWPsh3hOLDhvn+OQ7WOsM+OdXn3njUYO268JVG3j1Q+
         HKCSkZVoJ/I+PLsWZ0pcJqK9bJRwYZvyJLGd+w0Pa13ZrFvwL3OKGcdKYwxFJ99F3VAt
         dEAaTBdwP+5X0ANmpFILR8e2VqJT3/GWs+JtfUfQlUs41FhuSHUaF7gdS7Iak+lSc4RN
         Li7yB+Etnh4V0mkuFV/UdCJV8Focxl+CWS/ZoRG8VAWjjqT72VRSownPFSr5mACLdwDf
         JzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459870; x=1790064670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=uVBNNGL9D7kRVRAHxAVXef7NH45v5R7jLX7Io/AL+dc4DOSKA9t0C6D6gAytLhKRSF
         1WpWQYgPJ8vGh+dAcYXjLeRP+ksnrhIBCbXbOph0DIHhgZsVj3I5KDouGWTdOHLacLis
         hUXQqc2rQ+AgLtauXuo34Q9A4GVLzio6fmLMED2Edm+rkckHX0xjViOtsvNdqznsJ49v
         O9SdZ3RpCZIBupQUixZCGrUWL6FetnHcC7SQzqNcEDAWQ3zNi+ieI2xV8m0qc0RZq5IF
         /ifgo6UiU4ekcI3xCRfJrdGurEDA7etJW1sKW41Pl6CqPqZOehmWY9NNVF50FIsYjZmK
         sURA==
X-Forwarded-Encrypted: i=1; AKwUvByCpkBfsWoQQHFu8U9WnQXU0tNiC9xjblhx5R+kskcNW5ViOOtJXE7roHl4yRemgjTJ9/uYJ8BDr2CO@vger.kernel.org
X-Gm-Message-State: AFuF++lbZ91x26m4ujEJ5vDFqti3KLWBJ+LL0VmPj6GCW9xX0XtukyS3
	DGOLHhVXCGmf7fYwvcbG0aipcD3xuWwDGOb1XKMf1BRzHS3VIjeme+TxR2VcE00+73ceLQJBuIN
	ESlrsnrtW7W37P/lA3E1+WSwoeNcRTcuek4ojXXdScQ/tQvOi+d8eQ/xaO4hCJn+v
X-Gm-Gg: AYBFou23Vd62WfiPnM+Dbw8PUnHetNhTWDhc/+lLSGf0FdxDkiX0XhmmkEfKhutqcF7
	vFKbUzvZL8wJ/UBeqzJpguwofEi0a9oe7LOOwhSCE3lk7yt5XUvgN/LPXA00TmWTQRKiAaBgLNa
	DdCGsk7oHtxWm9vC/5CpeKxpCbjEN+F+IcrnQl7xbYZshDdwBnbXi4svhSmRk6DBY0BqXxjMsJS
	PmvoWP/KpulrXZwPfn7qr0TdYkbrJ4wkHaWsDhNyJ37H7y9Maliw4+qNZTcEMD0I6CDEPVyTFKB
	Ik+SdOF7tzO4B56RZFTwL+411on+6EqH8td7xbCiV5MqLk0XLKp4RQUz97GO/tNerJ+jtGlCgC4
	SbyumzSyQ/w8nh9vrUA7gWrx0lC/zODRvmHLgTIp2/mkYp2fX1zC80AT4H+PpXmZwIKTI1tL1Mk
	Wq/m+/tKXX4yhlcjXxZNNLvIPqycWVlF4N39bbL2qvuzisyzZCrWU=
X-Received: by 2002:a05:620a:4481:b0:937:675e:2903 with SMTP id af79cd13be357-93a29839ca8mr908875485a.14.1789459870016;
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:937:675e:2903 with SMTP id af79cd13be357-93a29839ca8mr908871185a.14.1789459869528;
        Tue, 15 Sep 2026 01:11:09 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:05 +0200
Subject: [PATCH v7 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-2-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX/ZoLRMicHTu2
 9CV2ggey0gm7o6N/PHwHy7Yo/PcYSU7lXlWN2kLy04y3QDpYOmsTfS251LzraNNgHMNvhIvnEey
 H9KZOz9p/vWkL4N+hO1tFNk8stg/0Hs=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa8fd9f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: rucQwwsvSsnz0jUTuroG__XvxmhVCe8_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX3KDxupUhgOzy
 GtXOfv6mPo+nTqSWmu2vUqVp6P9RI86HtFBFlwNV0IiDIqxxgdT+5kJDNJ439t4ZXYnZczxDvq+
 aDkUOFagjS430oGT59FVqYrP9lfadiBAyR18++Uw3td86e316N7GM8yG7/UK+b1M0uq/W1jesYx
 lDTbzGjhm4toE0841x9AN6XfbMl9JbAwGF9MJt0mRh19d+dobsKBSOTw+P8tEDH0BkS/CJ0IbMI
 pj60ZVjRVA9Os/xyWQxjMu4Qh839hBtDMQHPlIMfjlmHfCjJ1BPBqRmWsevabCxHsCEMh6sZa4w
 neihurXKm7/AcBfabXpwrupPnZDJoJbW5K24EeZ2hHIqha3aZZGLb0m30gFCVy2QLbT0g9HGzQl
 HS6d07RlIB/VcPh9yCGvmPKfbIlTWSaKZvRbArAj2l1fSnTWLyl/1TXXVyW/aLwm1YQUsac3PLH
 9IvOX2EwzPXcuo6Q+FA==
X-Proofpoint-GUID: rucQwwsvSsnz0jUTuroG__XvxmhVCe8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150116

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
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
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
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
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
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
+  - power-domain-names
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
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
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

