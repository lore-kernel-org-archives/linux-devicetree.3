Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143927;
	b=3p84SclaqMytg3rHcW3XBJOom63/4JrlqdLeIkqUFXRdUkTXCTFCIX0rvRo31wJUkFes
	 sBIKte1PjkHmT1wh6FK6feZisjjyHr7dUMGFNcDyf6bCLjh8kxmu29mMupR6s3FeK1s5d
	 dIdB5rZJ4443ONOSdUKwb6XC8vX5Sm82KoD0jUOg15uKTjvzX7qY8s8qDD0FZwS7wuO79
	 vn2vMv7TOes10WFQZ/PCk0D1sahzll6eirV+4Flhto6uzrvpaS4exBpUX0nM2QoWauE9G
	 yzHTxf3Apx1/Ve1lpk+OcfjsaCjKbS/2sZKI6Wn/N29EU/L4N3R4mEdznBrc8IB2wuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jr1K8KQjyiiPf5+tNEOw6AbSX+1As/e48i2X/eRzKKE=;
	b=LjOU5fmShPEvaJiaFeVsdxsAHia8KKdKwLWIqlDwgvTNJEdRihhNrM1KoBONVeKRdFl0
	 0Paa1J7FifcMp5jx49toy+KWeg+/qur6coua4jWAIEqvMUph93gNqPtUYiASejt9NGgIJ
	 w4EO56MLxrX7ZYZLTnrWqinVL8h68f85vuvwfJ2tPx5FjgwlOrkazr+wxzlNkURyPblzB
	 oTOjnlELnEdsyKdNRwBL4iybNqkCPHIp0A8IsVaV7430T5JEAE9DYRsGNmOT0Ja2LBj0D
	 ME3sO4J/fL9P98UWwEXrtsXiCOZDPimCevvviL4Ek/l53AQpQtiS3WF8TlSpO9tTOPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKTHRfJ0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3Uo7o8Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D199606A332
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D199606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKTHRfJ0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3Uo7o8Y
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ah5YO1201427
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jr1K8KQjyiiPf5+tNEOw6AbSX+1As/e48i2X/eRzKKE=; b=FKTHRfJ0F487PoJa
	LfJ4+rV3+wbTcw8APlMMt3FN4USLTYAoY16cPVZUE3aA/uUlq9G3C5N+97vVnkUP
	o5CLguVQh+L+Vl+eXqvfn7gz64dhQD4jlSptXETKRS7iJWy4kkn+QSIFhdx5I3F1
	dgKSyRDj56I450+c+P45uHKZFz834KymMuzD9tzd+RreUZMPY4hA35dYV3AY01Xl
	8dO831XhtklHHNHV6/31A0zTtdQQa/rym2BEsnMq4xlEUXv5ZXH21JDyjyeAFCgm
	3Q45WCL5CMQ60VKn0KhVkR0Bjyl3DkezVEZnWUsJNf2lS1Z0HJFxth3bzxFc1iiC
	qOAO3w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv732whc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:18:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so233971eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143926; x=1794748726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jr1K8KQjyiiPf5+tNEOw6AbSX+1As/e48i2X/eRzKKE=;
        b=G3Uo7o8Yd+iOgrO1GzgKQlgs5a4DcPhbwq1Iam+hlZqpyDLRkpklXN6UiaZSp8ocBX
         Tx1BwIX9bEWSdd0ho1cOVriw3BuX6Z38VBJMwP21d8ytfHGoxLdEa0xBbsLwhiYUAUY2
         b1cpGsgcn/gBWtVeGzw3Ug2rJ2NrG4gUExwB/gb+qHluUA1KGCr40elKeaC55nE7lVLI
         8+KN9HqbKnkGYyVwqelATzpK9rODdedUAR2MYD5FBTDRwgizrhszXoAqwaXrTUWfd4En
         wz6eJaKeh5u/SEWmmbitUP34F0yM//KqKRMlzSH3Z2wJ5MoxOsNmnHH7VfSxtG0efH+e
         Yqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143926; x=1794748726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jr1K8KQjyiiPf5+tNEOw6AbSX+1As/e48i2X/eRzKKE=;
        b=bfBuTjUiul8CAoqdJqDFhdyHdBFNgqcp0zWhrij9sO7N+31odFyOhXp+jm9Xgt8ppJ
         tvEZNFye00prkPnIpwyrJY+TGfuqNaiu/Hv2TJWnaRevn9rojyFiYLYcJvNJeSQXahpF
         C3zY8w/aV6pbkNmBctmTWkHmQ9k31Ad64tm4bkk+F1tomb4lWBilRYzKX699kJhQx5dd
         93vSAWsVMcb6ktu1YcxeI2cMXYovTjMzPNYcalJkutZ/Ao4TnIVmFHChqXP4E+vJmopy
         1d9Z2skemsSFENMviFeJ5ZCkcrUcbCOWMa32Uo4GGyggqLwfWo/1NaMGdavD4t/ng7rE
         KlMg==
X-Forwarded-Encrypted: i=1; AL+hErHsRKEv/GRmp8RcJXNulBmy1se+x0pe2FF96mu02g4KlIzGL+/oZxoT/ZvAP+E5PEsFX0mZ/dzFlVVm@vger.kernel.org
X-Gm-Message-State: APuU4Z/NyXbZdP4Nuqd5ul81eDRaDAHWKIpxnRy3B2pfEEbfuIJyyoDf
	Vdg66ym6bw+PO55dREQaPPP4qTGeA52WJfpt1wfSlmEtJ91ANIdklthRxCja3Fp8OVhgRJxXa+/
	Y44B3mbZegMSdiAHFt0hFd1dIIpNXYmmtjffCXtK8rdQhHwdxRV0YMzUm9UfmBMBH
X-Gm-Gg: AYBFou2BjLY586kGTrIeXKF7qGhYS0P0QbfwFgaJR8G6J/wKrHboItlqMQFBZvs1Wg6
	Ek+XCmGrCKmrq5PGmR8oaLS38tE8y1WD+b/i7EC1Y0JBeWsXN2BDpewKfRQiVXEP3g2BAs2ei2l
	mWEnBzTL/GNIPJ+DKISLYKGhpC8dXjXbaQi1+H7i2JyZn86h8Mi/4FvsrO+G+EivCAjPfiTx/7r
	dZRZ3G/sUtIGv0n0wnpmavcNLhKMUzZoAW01dVzyjMXW/r05jn7faCzdwg//TQ/0FFJHkHxN1pk
	lMcQFctMIll2BuLb0xCgknnGAaxIdh9dkDdQ2/AfJ+/RJULUSkooEB5XYMALSThURP5J0NUjbEc
	6j0JhjhSMCuv05cMUM3r2Kcy4OY5Dpa9GJfPRJYOkgmYsGWG7lHh2MocEoyQtRkOFDCYoJnPdVh
	MYBpg=
X-Received: by 2002:a05:7022:3c85:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1b39fdac3a0mr1916663c88.0.1794143925800;
        Sun, 08 Nov 2026 05:18:45 -0800 (PST)
X-Received: by 2002:a05:7022:3c85:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1b39fdac3a0mr1916623c88.0.1794143925126;
        Sun, 08 Nov 2026 05:18:45 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:44 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:23 +0530
Subject: [PATCH v2 02/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm QDU1000 SoC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-tscss-v2-2-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX1lvy2gsH7XO9
 jC7tGUbXrNv9TDEGzkEWYDsi1vO0RY6I0A3MmfnIWsLYkAJuNh24vu/G3absxePRaZKwMXMEr/Q
 +KJgj0lS+VZZpyqKZZqHKDAiDsLWBA/lanApDI7z7EsOk0bjKBEzDNoL0WRr1HdNQlLXeEF2atP
 WyOmBUNt2Ew6WuP/h2Mrype45N1gJVYisgRwjcOJpBrGk8yVjQz+Zg7VHKQwWo7JNQoDDq016IW
 AJzii313V0lGaujw5Z9aObJrgnWWDo+5Pg79mGx2InkwzjS1GUKJEelXvr41D2ZRIqzrLMTRaBz
 6wirEspzAxMhuu7tFZNoj0Zm0Bj3c8Jfsln2ezTqOJyvTl2WQm/PpfaWwRp8VbWAeY8MeZEYJwO
 M5CPhor96VQ2qxW8fT+UJHu0KuK9Fv8D4vh8eLiRhdLG98ksWhYsXLemZhEo1OCXGFHdsVlcMde
 Jc446HJZIa/nq49BAyA==
X-Proofpoint-ORIG-GUID: 7tyK7_1xWicG-w7cUAZ7NhEyOiCfjPIb
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af076b6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=mcFP9djfoIsIUEB4waUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX23P5q++wkNVn
 9M/QCyQwDCBlgt+v7Z/xox4NcRTC7CW2xASWHrJ5mujQXM2szl25Ee4kShKEKhNX7KPAF245ZjZ
 cMs1gIiceO3ClrsV+kPuRRxR3lVDpKY=
X-Proofpoint-GUID: 7tyK7_1xWicG-w7cUAZ7NhEyOiCfjPIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm QDU1000 SoC.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 170 +++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
new file mode 100644
index 000000000000..52a063ec4b78
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,qdu1000-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm QDU1000 SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TSCSS is a time synchronization subsystem composed of two main
+  blocks - the Timestamp Counter (TSC) and the Event Timestamp Unit (ETU).
+
+  The TSC block is a timestamp generator that maintains a running counter used
+  for system timekeeping, and is functional with just the AHB and counter
+  clocks.
+  The ETU block captures TSC timestamps for external hardware events. Each
+  ETU slice binds a slice number to an external event selector, and
+  generates its own interrupt when that event is triggered.
+
+properties:
+  compatible:
+    const: qcom,qdu1000-tscss
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: tsc
+      - const: etu
+
+  clocks:
+    items:
+      - description: TSC AHB configuration clock.
+      - description: TSC global counter clock.
+      - description: TSC ETU clock.
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: cntr
+      - const: etu
+
+  interrupts:
+    minItems: 1
+    maxItems: 16
+    description:
+      Per slice interrupt raised based on an external event mapped to
+      that ETU slice.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 16
+    items:
+      pattern: "^slice[0-9]+$"
+
+  pinctrl-names:
+    minItems: 1
+    maxItems: 16
+    items:
+      pattern: "^slice[0-9]+$"
+
+  qcom,etu-slice:
+    description:
+      ETU slice number for each entry in interrupts, interrupt-names,
+      pinctrl-<n>, pinctrl-names and qcom,etu-event-sel.
+    minItems: 1
+    maxItems: 16
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  qcom,etu-event-sel:
+    description:
+      External event selection value for each ETU slice listed in
+      qcom,etu-slice.
+    minItems: 1
+    maxItems: 16
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        reg-names:
+          contains:
+            const: etu
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+      required:
+        - interrupts
+        - interrupt-names
+        - pinctrl-names
+        - qcom,etu-slice
+        - qcom,etu-event-sel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1da0000 {
+        compatible = "qcom,qdu1000-tscss";
+        reg = <0x0 0x01da0000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+                 <&gcc GCC_TSC_CNTR_CLK>,
+                 <&gcc GCC_TSC_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+        assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+        assigned-clock-rates = <500000000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1da0000 {
+        compatible = "qcom,qdu1000-tscss";
+        reg = <0x0 0x01da0000 0x0 0x2000>,
+              <0x0 0x01db0000 0x0 0x10000>;
+        reg-names = "tsc", "etu";
+
+        clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+                 <&gcc GCC_TSC_CNTR_CLK>,
+                 <&gcc GCC_TSC_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+        assigned-clock-rates = <500000000>;
+
+        interrupts = <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 334 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "slice1", "slice5", "slice6";
+
+        pinctrl-0 = <&tod_pps>;
+        pinctrl-1 = <&gps_pps>;
+        pinctrl-2 = <&hardsync_pps>;
+        pinctrl-names = "slice1", "slice5", "slice6";
+
+        qcom,etu-slice = <1 5 6>;
+        qcom,etu-event-sel = <1 3 2>;
+      };
+    };
+...

-- 
2.34.1

