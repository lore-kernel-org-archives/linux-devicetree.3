Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052251AEC7
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687395; cv=none; b=PV00aug6ZnKqL8wMEZsjVE9ZaLFHKx7+2CyutKi8/9WDvSVSiGrpSiHcRkXLmm6EwCfie6NzYOJO+65nsR2weHp170uHrqpsLAwVflpQd81VvGRGp4VDeXgOTny/78eh/meUcH8CV3eEX7Zp9jcdspheE2O/Xz8RMUqhviHdUbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687395; c=relaxed/simple;
	bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfTJOIjQK2kJv9Tty143P7Zx0cRRs5xUvM2KBBJGRYvzi2fhnSlyIvspHCr6cpVwIJl5l6E7/xozREjzSSYOEjtMThkFTrZRka/32zCnCoPKql3YOyrOMUsT1aWCKU7BRT8icPmLpaiIb/ipyWc4eYzPFOYy0/yU3US1qZKkjqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEw85bs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ivxy9/YE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEw85bs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ivxy9/YE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqijp611688
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=; b=BEw85bs+KG1Isalh
	t1d1/n4SD8gCQy8hnkey3OEa1vYD+IfG2QYsWFwgumwmPhirXRDztPLxrApn1wn0
	3i4Ns+TPxOa7uWELw77QMKbg0KsXU1xlZoF54YPLm/mvTi5PVDsrvNWEzTu5hrgI
	rrPOWJdH0Wq8bOxYBwdnlk8QX1YeOIWV36Rmus4lWV8YCcAbfzPv736o6hkmvXAZ
	Kd1uF7WLUGCPWw+PirbL8qPv3TQ9OBVwmrIATDjuqsLVKdcN4R16u1wsLzkTeVOT
	TXW7cFDoEiKgIHMRtzhAbuYbQklTjYkTZJivVZ/hnInJba6F1S6n7qjr9jHduonv
	G52Eww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u6m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-914450ef7c1so38322406d6.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687392; x=1791292192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=Ivxy9/YEWT/J5bkdzrvh0uL4UoUViFhsrf7/klsAqTdGzTXnnMQ6f8fSroxOhEcpgQ
         RP04zmqgwFSSg1qW/adFuZqwm70mvf7Z5Sjj2MPRbiUlHHk6/EIrR56lPXNNAIHPoU04
         /KILjLDDxuTfY6/qZ5wqCdfBkD9cnYOBFwycSOERkS4CHmspAOXWsiufMy9cElw6OwwU
         4zEEZHobWNLs8WMw4WoPeWJsd71+IoHgmI1XhQCX3Gb+PijJiUQ6bosN8YpPB8z9l9QD
         Sij+32HAlru8JDtvJpkuGQDmiBZQCHqk5W4FKrXP81GaU3f3t8+BaQriVIwrwmVXmwfH
         Wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687392; x=1791292192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=GRaKgELooClO1RZr9dT/uMmOPNQ4Z6Y1WoTtjQ0TGNSQY+QB8hdfpMv4xOJ6lk1D9H
         wIvA12Ew3D/49X7kDiVJOpg2a2yRi307qWjZlzHrzFFwe0DlECCIV603wJrhPt04Se4H
         17kC99ofNgYqJMy5L7A2Qm0ZfgNcrVlFwJPeOHumXTSGMih7kMjoisgJUPmuxJ6AGuNk
         hndZKcr8og110d0avKbDpLFRJJTtKjSSexEmIPC5590n8LfXgoHdus4UvsjM8cQvpPgz
         XMbmnZJDbmzQH99vPxxSQjv5wpNB0uzE+DXP84gOcKX/IdVa8LmqorUOzlN/cJw6LkEG
         t1jw==
X-Forwarded-Encrypted: i=1; AKwUvBxZjw1Ot8PRsqPXrufJdQz72LCgHtuH7OohH+lsbL+xPNkCXszmwfhYZqVSm5JPcimvcQ+ym3O39Sfq@vger.kernel.org
X-Gm-Message-State: AFuF++nB7vIv63h2ap9oKtijwSM5HzzN2Y59BGDBbCnmJjtbsxOYpe2t
	F7/6eub0XnjJff5MAc2/q7oaOECW5siAcQvNuZscPuiUmR5UbjsUd/ccu0TbqlY38wGHXisJ8Xm
	QUgsuUt9/x0UAdb/Ieljn1fYA9aFFQdC2wJlofXr+GSveHdlbCl9zeYDsdRULq4Lp
X-Gm-Gg: AYBFou22hCmZjMR0NUaXH04RjVNZk3XNgBbkXk5gIsTz9iTgDXSjk30da80zm34kYiq
	+5OBtpeJAgqkYqgg3nfC9ckuGiI7caK/r1XnKUKLafdnkDDzQbvUaThjp1KnOnpbPscus7s48Yo
	i1GQ9kG2HMAqVtHEuv3+yTQ+9Ify+G4mbKnPC3H5KtXENj2a/Brdjkty07WtATJBye28NDjT8mi
	a0VMfRSPWsl+610+LkHbEmRdLVFchC9/PGMIMxUYnSdvTtUybzeJdgg944JMKIY3KOyD9OJ9pU7
	78YP36FqBpJ6PeRH7ZU5F8YyWbV/ZLXA71XeH6U1Ye9zJ0lf48NmJ/+h/WXiAq4ZXGwX5+e2Ifp
	TzHBlo2GEDDCnXUFZAIgIpYLBZcJvC6Rtczg=
X-Received: by 2002:ad4:5f8e:0:b0:914:43b1:d4e8 with SMTP id 6a1803df08f44-914482574ffmr188849106d6.10.1790687391881;
        Tue, 29 Sep 2026 06:09:51 -0700 (PDT)
X-Received: by 2002:ad4:5f8e:0:b0:914:43b1:d4e8 with SMTP id 6a1803df08f44-914482574ffmr188848326d6.10.1790687391047;
        Tue, 29 Sep 2026 06:09:51 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:09:50 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:33 +0530
Subject: [PATCH v3 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-1-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=4232;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
 b=brzRaFooGdY1AEfjdIk4VK0wyoloSQQm8UmTUeWJ2N69TZZj0UtvAZagT3QB0Cn7SpHEVTffW
 //bQd+CYFXbBAmm8+3wmJCaRDDWk959jeJ0FBJyRFTte8/ftVC0wJ4C
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX1t6CBW4oSDuR
 XFpZ6ZHSIi3vtb+kbKaBKhzrSdymYWbzr5z2a8QS+5sl/D4TjQ6BnXxRw2pqCJJlxHLXFYH+w8G
 t4ONqfOsElQnim+aE2731SQEMQuKFao=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb8a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX43QIg+LK8sdF
 G+/axnPlHllqovwvmD/SKhwY2cJkyK4Jsq0udF9PokjgIrZZ9WBY4cYzfqf6YYrasXU2AUF2Gw/
 yc4aRKeY91aPlKGZnbZ0WLspkzEYd/f/7+VtO0dk2IefNtm+8il2ZTmPQQQiMFJAJQbudLIh5/2
 vjU6M/btEpf9Euei+zE9gbHdVbRAbtszVa+HCSoIiddq6se22msbHUPT7M5dy7Tk9koeyvSrkMr
 Dn1TkBlnKRLalcqvpZpwPeNBg+HK7QU77YxOEQGiifZWkdDSfHuYqv8Tg5RMjKZ199Rboo9OoIF
 yg7POuZ3F7uGd+A28NQ8OQwB6bMEAYLUlmbHYwu7Mx5Jcprtm69A+lJjCTCsQhuX997aKCntCsw
 mbS7IvEPtqvj1wwcABOdtT+qRdRUPNoK4hTLArWF4Ke9MhXDSAabR5pmPVny47B0mgHIkb3srqH
 Vili4587ZHDdtAJLQDA==
X-Proofpoint-GUID: TtAAvyNrpaG7domPWbY3FBy_qVr32SpC
X-Proofpoint-ORIG-GUID: TtAAvyNrpaG7domPWbY3FBy_qVr32SpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a devicetree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 69 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..a9e3525cf099
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,pm7250b-bcl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm7250b-bcl
+      - qcom,pm7550-bcl
+      - qcom,pm7550ba-bcl
+      - qcom,pm8350c-bcl
+      - qcom,pm8550-bcl
+      - qcom,pmh0101-bcl
+      - qcom,pmih0108-bcl
+      - qcom,smb2360-bcl
+      - qcom,smb2370-bcl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
+      - const: emergency
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@1d00 {
+            compatible = "qcom,pm7250b-bcl";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical",
+                              "emergency";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..48dc437b3889 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -195,6 +195,10 @@ patternProperties:
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
 
+  "^sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/hwmon/qcom,pm7250b-bcl.yaml#
+
   "^temp-alarm@[0-9a-f]+$":
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c02b919d6ae..7cc16f7ccd66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22657,6 +22657,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BCL HARDWARE MONITOR DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
+
 QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0

