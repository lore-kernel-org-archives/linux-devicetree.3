Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C63AE187
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325741; cv=none; b=gaXOVGpMByu88u7yorJdJgKYGYSvMn8Cvt/3/UCxFcKtJhAFewsNj74998h24c3BovjtovTg7YIZpO52CzL7MlX0a7wz8FzYZCkfHVMc2yS98WW/AGKV9q/snG2zYRFyAFRwl0XruPrmTUgIV5gBussXigzIUZGkNEEscxU+OXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325741; c=relaxed/simple;
	bh=HfW02N1l4i7cmbUtMhYPdTWIGgGXsEjiwIOB8y3xC7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpPjQpHfI2nyxMsuJ/hUEqBpHTr5d0io7xjByzV1yKFykucZ9dR9SAPsWhgcQ2fqNRRKiWr6KdK+fgcDGY3cjBJl3YpYW0z+DMjTfHUlhogjBkpl/WvjmA4hTbru63rPjyNF+bQhN/15BnBZFwSPoIJwHEN3jfeZJz7RsCChHw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxPgJhY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfM1I/LG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxPgJhY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfM1I/LG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641VeD3594266
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQ+KvHpKSyuoob04CXLtszZfz/siqFdFw5I3KK1ovkU=; b=pxPgJhY3u0cIEi4q
	ZFmDtEANrUdbSlxnZ0xsn7xBJWtYSzSVBz4ES+sDDXu1MUqmRD2yb8IjBJntAyGA
	wzcr3/eQM8lPoo7K+q5o6/BCq5SKTPOAQrj/TNnj2B5pNfa0Y2TMLOzwOvj1pQsF
	fYlTOEqVpGpQ0OLoDvFzraQ2/u23lXM1wFwT0cETK6+857ZpStStDFN1I5iL90eE
	FjWZ4WlfgKjtxN0eaRLyn+yVYoQ1UqUoh8Wn+F4FhDAjwH/WN4Yy2oz0ScC83RZG
	BUGIpfKKf4x3fNXi1cqoOtrfH41AWhJ8vf7HjukXJwfTWk+yYgX8luGt8TzpMuDc
	qpDwEg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwj5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:15:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847c3a12ce8so2858218b3a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783325725; x=1783930525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQ+KvHpKSyuoob04CXLtszZfz/siqFdFw5I3KK1ovkU=;
        b=SfM1I/LGJR0ShEJZ5DBMtXfGahAfQzwngO42xwiyW3LnsFdKAE5q3EUUsTF1Yhuh/E
         boUD8FKOP5+DpzRjzSpU0GYhrns6ZYsWHCfS+8Do6qaZoNxUx0uetV+mbvsPdIxTFVGs
         0eTT+xFHIsXk3kDEtK+Ua4SDIXKXCCJshEEP/mZYue1Ejn7FTHcHepSIadWRkIW8L8Fv
         /zI09fBvI7Jzz5mnj10HNYi8joHc/krT27BFHzBdliVrEtBuTBN0OE42ss5wSUvYTahe
         M9aSrGualhvByWCsgpECr/g5bzkn5IK6+qNVwccOD+89OZ5x1VQtIh86PjFJPyaynvxY
         7ucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325725; x=1783930525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQ+KvHpKSyuoob04CXLtszZfz/siqFdFw5I3KK1ovkU=;
        b=TbhWEw4wMY+9v+AeXVDRYzLDqGHSF7mmlqCIPXVvlqstHp/AIHwT2/IVd3NMwrV+n9
         cq9IP+owJBWELhSWrJ2GaR8vNlglxqSSo9GRexpOmsLRuhG68nDMQCVRB5NX5g7hejp0
         cAvSAguUJvkhUuPVpTl7faAyCxGKzESsWGLbnjrtUco6uUKqIGSoN5lOz9DWW5R/qdvf
         fqwoFli8WjBpUhNQlt+HNC9b7S2S5Vla4vA42R/5hyngA0IyjwnA2W7ymU2E6WvkWCob
         08H1NeUSiRZe78VGXh7rjFr6FbiG+hbmR5sj1o5vBqjpK9/YjK6h+RS+AgHuRTXM7Y4X
         nerg==
X-Forwarded-Encrypted: i=1; AHgh+RqkASAIFGSyf2sBt6rnktG7b7krOaxiO6hy+zuF3eFZD7Zi0cO/55vPXlJjFyV7JwpRT2w3PIuE6ChC@vger.kernel.org
X-Gm-Message-State: AOJu0YxROn+EFp7GVoQXmiECFW4rmYIaHg/YoDoa5pIEtBcoGbdMw61S
	ezboGR5JYrY+xA0i75nJRFVkP62MxlFq4UR/6xu2cqptjkXhF7j/RbKLd3mX2fnIeZDIN9J8bB5
	kvc7tw7MVbvXGXzCfMtYoT+09BrgxzsgpE3Zm1eNJ3/rmxQQo0uVURTFINaxHCzde
X-Gm-Gg: AfdE7ckN/W7yYbHRf1TAmSgpuDT++qClPRcJhIUVQp8uG0qUKM8e/sbHkaoVZaFAuEn
	yrC4W5N3+L+73e/Ue7cZVYbKGeMMk+c+bc+cDRYqHn8pWPbuX4Ek0DJ9VLpyXQ8xJmCP15Iwi7v
	g79rxn9tL6H4z1YelVdiK2AJTkNB+hHPN/qAKvsFVf8qRsqkKjaWmsryAjDaIy5bNOJiJ9XwkOZ
	Levmy95AWszrkjUeiCLJyNVOnsab4h+tMNx9zd6mzJxLucxed5q4h5FtdZO+UqBSE79xFkgnB2n
	KKe6uhegrVM8GZPe1DTk2la2oDA+soitxZi1wMsc+sL1nem3dBAhdo9TNaNSJnqQruCIN2ystnD
	i1pDhjMmfiPGBvCi5Cw+2r3wzZ8oXKVWJmGBZWZBjYaI=
X-Received: by 2002:a05:6a20:3c90:b0:3bf:6c04:a817 with SMTP id adf61e73a8af0-3c03e4dee8fmr11935106637.56.1783325722472;
        Mon, 06 Jul 2026 01:15:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c90:b0:3bf:6c04:a817 with SMTP id adf61e73a8af0-3c03e4dee8fmr11935058637.56.1783325721949;
        Mon, 06 Jul 2026 01:15:21 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f4cd4b1sm5584525a12.12.2026.07.06.01.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:15:21 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 13:44:35 +0530
Subject: [PATCH v2 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-spmi-mbg-driver-v2-1-f883ff1d8719@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
In-Reply-To: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b641d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E-gG5h9l_blIFwvKag4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WdylsUY-VG6orhztTgZbHeA0IthnV-E1
X-Proofpoint-GUID: WdylsUY-VG6orhztTgZbHeA0IthnV-E1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX+pF1MMGPeyWw
 LlhAkfXj5X8xx6r+mw1/ORDJKsvWHKPWIXUex6TF0F3Qg3LYK5J4o50iCFYX+kNn0GQm1amJj0d
 xae/iwHyb38ka4rXIjUUFBZOYKhPOWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX5fDTV9w3CqWo
 PZv734s9ptaHPIfx8NnIvjOhFGxuw+0hOZGcnAfG3jx1+kMBTSpptwVlESqHIfo0CZnc/p2qiq2
 U/SzjnY72G0z5pw9SZz8BrJn0k/KkonDxWtYDTKWjHdxJY/XCRS3RS1REQqBJqol0MtnzF7+OdX
 ymFWBfq14Pk9MTQ33z1e4YuEPt8dZZs4jcEUxw9VoTLUjaolD4P/odaQL5qPxImKLn+WqcOLQbF
 4z14A1quwGJF11lYKczlGPrrH1NQkMOFNXKNEoCasTdMhmJidiHeTwf/NZwkKvkVrzlgxFLx3p4
 y7+32pVnX2yY2C3gHvqfstE5rqSaXHaQ5ENgJGQuoZkSltcVYPWn6np30wH/QcWjCEdfm+ABYlh
 QkL/lqBKxZ3f46dwrO0pDQPt/leFMhOrl9CTF3rt6YIHw7Um3bJUspJpL2qD8RFCKSs5q1MrbF3
 CbABV4HYMIgx1bKx9RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060082

From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Add bindings for the Qualcomm MBG (Master Bandgap) temperature alarm
peripheral found on the PM8775 PMIC. Unlike the existing SPMI temp alarm
peripheral, the MBG peripheral supports both hot and cold threshold
monitoring across two programmable levels (LVL1 and LVL2), with interrupt
status reported via a fault status register over SPMI.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 .../bindings/thermal/qcom,pm8775-mbg-tm.yaml       | 72 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 809be2756a0c..bd77cb7173e2 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -194,6 +194,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^temperature-sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/thermal/qcom,pm8775-mbg-tm.yaml#
+
   "^typec@[0-9a-f]+$":
     type: object
     $ref: /schemas/usb/qcom,pmic-typec.yaml#
diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
new file mode 100644
index 000000000000..2e084d040625
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom,pm8775-mbg-tm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's SPMI PMIC MBG Thermal Monitoring
+
+maintainers:
+  - Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
+  - Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
+
+description:
+  Qualcomm's MBG(Master Bandgap) temperature alarm monitors the die
+  temperature and generates an interrupt if the PMIC die temperature is
+  over a set of programmable temperature thresholds. It allows monitoring
+  for both hot and cold, LVL1 and LVL2 thresholds, which makes it different
+  from the existing temp alarm peripheral. The interrupt comes over SPMI
+  and the MBG's fault status register gives details to understand whether
+  it is a hot/cold and LVL1/LVL2 violation.
+
+properties:
+  compatible:
+    const: qcom,pm8775-mbg-tm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    items:
+      - description: ADC channel, which reports chip die temperature.
+
+  io-channel-names:
+    items:
+      - const: thermal
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - io-channels
+  - io-channel-names
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@d700 {
+            compatible = "qcom,pm8775-mbg-tm";
+            reg = <0xd700>;
+            interrupts = <0x1 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+            io-channels = <&pm8775_adc 0x3>;
+            io-channel-names = "thermal";
+            #thermal-sensor-cells = <0>;
+        };
+    };
+...

-- 
2.34.1

