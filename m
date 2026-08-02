Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2F73B6378
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676431; cv=none; b=h21/UeuajXX534+CvTrQOFmBshZ0JcusbppY1239GF1g4Ei9DIOg5PQ7la4wMj3Xpsi8VWE14GK3KSrd7nRK4kYP3O30MDWEEKDKWUoXoEq4c8mcK7emJ468kk8b9SJWsYqR618wLaV1LtbSGaWeCBUYOafoszLGUYJp7BFcacc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676431; c=relaxed/simple;
	bh=c+YVks3b0NjnPxZoViYuM2n50/y5hiDqyE3XSAVuY7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fP0q1vpbiZGkvMDRGAHkMvVZBYoq58ozXuG5NyZcJzuJtuFokXQB8XuC/aDpzpMz6ErCBe8EoDp0J19liAcP2TwNWSTiYQI58Ye/RPOJJjHCR11Uzz0rPI88LAxeJMT61rLSQqdX1Xe9VNQsQ6Q31JfTaA7QtpkbMUU7xgR/KrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piH226cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPxiwoGy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piH226cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPxiwoGy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6diV2009806
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 13:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFMrveH/zKDPg6uSCRqHIFF/V3WcuiRR4bYskluiiOk=; b=piH226ccPxhyuSkF
	qrWV0HA4UabSsB9S3VG4rMDPrcgRPtCpkKl23ZpKNlQO7R5qYn1lr0HK/+Ve9K9e
	6n2ijm7ae2IFZSaCj2xi3YHs7tjOWXZFQcZ9yqoNZpSqzGT0EMl1/TxbfWPfiNv3
	T7QXBt0HJ1nLa7n6izV/EaqR3Xi6iY1eOFipTemOuJtmEq+rQz7Ybd0U9ihQts4I
	P9wR2++wjg92ijHGzVwtCPUbD+eBby3bWzF/B4SVjBPaMLLRzVmN/1KAldaz5i2F
	ZbgZkMs6C25Pu2RybhDiLQzlT8RsTaG89ZMGyW3PdlihmLCaKg7llcrfhehS8v2r
	lLNXTA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qptut0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 13:13:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1306933a12.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785676427; x=1786281227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFMrveH/zKDPg6uSCRqHIFF/V3WcuiRR4bYskluiiOk=;
        b=UPxiwoGypqreNsQyKsKCzrRaGeLjI9dnxsShw3xSa2mRE7nCJcZd4Y13VyjGqRs9cM
         EjeiFTlk14COn8Uo62XAuwXfx6zvcnA7rhAhLDiHBN8ojZM1EOCRGIBPqx2js+1Jl/3F
         gxsPK3otca9kXjZXb7ROzuATZ/gf5LsnIeCmvla72lXSfgO4rSRKLBDP6SSUL6bgLcR+
         x6SLRkEWS1ppnychplOBMHZivft0xAog+FrMXITmmoNCULku0Tn0CSH6JbF+flvDlTlb
         28glomotKExUMX4hIpKly4S1qX14QkrCpqIkoKi8XcADEAWekr1Hko/0XHs5eaB4HvmA
         ARzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785676427; x=1786281227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFMrveH/zKDPg6uSCRqHIFF/V3WcuiRR4bYskluiiOk=;
        b=hcIcYTHCyJnWdTxUCb/f4GIW+9hQz6MXBMto5H8PACTKg7cZXTHzQ5b4e7SdTklNBW
         HtDIGqVlicNU6NTREoFtJWLOnoMd9WdzA24STgHGGmLc/3pVJjwLGx2ZfpDZ16WMbwy9
         29Os68iWRPnV2PSjLDtQ0BmsxdLPA0uSVPMYxOoT/Oe2edlIZZAMwoT2K/mk5ZVWkDUt
         gZqN/YyRnR5Pr/qaWBq6MbXyaDvhm/ZWkDdyNM7/bi87+xQWeG8O2B75uHk9NcxuhecZ
         xCu8SgRF6exShINRIKdmgSqZSqZsWdpeKjrTmqcsV/VWvby9cDUZDtz9/609P46xvTWl
         jMYw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7ATPb3sjmx2QJQ3gzOWl0SK2xFYI08DJBlKqChlOBDI4sFq9/8bpV4Kgm3YEmomiH9mB+01BvBZNC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42xHU9cw7S1eY5BT50ZT8g+UM4rKHxMiSHNsgfXaxGjyB3xLw
	SNhudBIZ4J42HAdiWmgFNQhG9QmDzl1RhPbGWDj8WieG5Q9dp/cQa1mbUuf/TFAT0AzJLj9A6Dp
	jj/W59WHATKsE8+N3tXjd9AXzF2ic4D/IcQ7iH9i3Yi4MfEubVUL0EUCSmeMYC8It
X-Gm-Gg: AR+sD10MsDofLVOnm0pkI/xdIkrs9c3dxTloWtLEcsM1SbqrITf3FG64s5ugbu3+/Hw
	fT+US0f94vx9fximANd+j3LR0wgLIOONHRmVSN1UD4KX29fGS3oJFJYm25zpZIoWGv7VXtu1bgx
	hH6S2vJKY1rTdOO9JQu71fBv0q+ka016lI74E1GfjFyIGWrlwMBm8bUXSHglzzXBE4exBpsBOh8
	vSCq7vRG8Tdvfo8oUwV1DRhumpPvSrDL7Cbck43a39EWqhbuhRVtNqWbIL3IRJwO8ayEpkMc+JH
	MQ/5pqTyfhDPYzYxzsvKSvaS0PHghPtRkqcHIgs6Mv/BghE+A52LMV26dsp58kZvPbHVk2w8VFA
	IsPQCbhNqdtlrALmIrSwV3p7uvXMJ3Me9Ubqm
X-Received: by 2002:a05:6a20:430c:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3c92a5a1956mr6354264637.11.1785676427381;
        Sun, 02 Aug 2026 06:13:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:430c:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3c92a5a1956mr6354244637.11.1785676426894;
        Sun, 02 Aug 2026 06:13:46 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f8dbsm28303457eec.22.2026.08.02.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 06:13:46 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 18:43:30 +0530
Subject: [PATCH v2 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-i2c-qcom-slave-v2-1-27653118fa75@oss.qualcomm.com>
References: <20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com>
In-Reply-To: <20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785676418; l=2894;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=c+YVks3b0NjnPxZoViYuM2n50/y5hiDqyE3XSAVuY7U=;
 b=Pbj1y8oGh+c4QxvaVEvnyMqzGBQhd0ckHUQCEfsw+wxydShkDhqPFT7fwTB5x7saqp4i1qWVN
 3Nz7Zpv5dyeCafFgms731GZ8k5tPP+g7KdrQvvGTMdCeWfieLvJRB6d
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExNiBTYWx0ZWRfXwiAws5XAtCRt
 +8bfR2Oxqw4xeyPhuBn86+rxKISyT5wXx3GvrEWLIJFmy5+Wh1Eupn2VBZHl9xKXFYcDsTuGdwB
 EZYi2L5/BD8LB53KzxNQiTB7t5Bh3FYDbCP1BaW3Ufk4vWR+LQpCgkUTCoehlYtyHULuo7udc5s
 Fuz3fjoNkW9NgXhfeX2hmuhwuxGi/65iImZogkJVHoUVXqLHn0tWyVXGLcjyWSCmq6n+eHjAeWY
 uVLIlj3g/0H1LrrUNlYfaMq8Gq0GkgeUAXB7ZBJzwoYp8FVo/ZqDBM7bJbRUbgc4nwFlQ8j7wUO
 3UK/o42F0RACu8fV23Ydv5x+ojO/kZXmaso6Dtq7ExSj8eOqoPOc2n1eGz0ExDTc57xCPeyt2cq
 v2vDcJifkd5szHUTEVyVP0Xi5NjswPF3V41F7c5g1nGca7WLPpitVVy+ZUaxHlvqXAmn5fkSp4A
 aDgcax4pRD5Cc/MQwKQ==
X-Proofpoint-GUID: R9Lb7Ul8i3AJhmBY8jsjo0ivrd_mQns7
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6f428c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=64-jBHeFNbSwsrqMnDgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: R9Lb7Ul8i3AJhmBY8jsjo0ivrd_mQns7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExNiBTYWx0ZWRfX6dg3ePKTgrDv
 4qS2b9ao60xEeamGBw5rpxPVkT6ahRQjH63UF2C546VHmN0DVGfvJC2kIo+cT4e5kQVyCeNnXE4
 TX1PMlCXhprV+0MnXBWXpRbe8S8feBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020116

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode. It is a distinct
IP from the Qualcomm I2C master controllers (GENI, QUP) with a
different register interface, so it requires its own binding.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect
path, and optional pinctrl states for the controller.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-target.yaml   | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
new file mode 100644
index 000000000000..1e34e874cc4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-target.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm I2C Target Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+
+description:
+  Dedicated hardware IP found on Qualcomm SoCs that operates exclusively
+  as an I2C target (slave) device on the bus. Supports FIFO (PIO) mode
+  for data transfer.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qdu1000-i2c-target
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO reference clock
+      - description: AHB bus clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: ahb
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: i2c
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: sleep
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - interconnects
+  - interconnect-names
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
+
+    i2c@88ca000 {
+        compatible = "qcom,qdu1000-i2c-target";
+        reg = <0x88ca000 0x64>;
+        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
+        clock-names = "xo", "ahb";
+        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interconnect-names = "i2c";
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
+    };
+...

-- 
2.34.1

