Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6243C7BE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717101; cv=none; b=sJ5p9Bh9Bk3g3FUG3A9tGb5yxmHrbTnJdI+ALluXHO3L4fRIcbql7YGlVnwV3hFjuG6q6R8wiqm5Wcz+UNCLabU64fpLDnj7+TWaT0wZG5GUTCV+0iuu4bEpBrxc9YANenurgSLi45SVqvL8KL5ECU2mDXK9eibd3Y4GWmvSgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717101; c=relaxed/simple;
	bh=we1L1lQ5lcQSoRayGEALtC+WkaOOAukyLvGKMNh/VIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbmkXEqiVpgVTbNyKQUvh9wTuywv9z9gPkLJitPVIHULnS8GHyM7mbD9oUUWDqBiJVH7Oe5vOOh8DIVPrgNSuwlJ2d7HXNE6CyMt0m0EBHcuVvytT+9LRx9uuvmIAQXZinY5J1M4bbOAlHhDEhLzfRm159mmpfCEZZw29tKH2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pojz5FDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiRV5ZIE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pojz5FDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiRV5ZIE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xAMR1400267
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAAgAP0V7LjmvDcg7cU4QtLN1FT+eQx8NoMPuNIkpro=; b=pojz5FDAs1WmH/Zz
	4eurqxyoIhAan8Z/MhvynjLMSxvi9LDSn7SmcvhBLzwKdkPJcU7cWsYXoRRknodT
	eePyk/b3ZXY62uuKtMXQt2CjiKfNQiQsQ5kGHuBGW8UG8if20VkyXFLauNKhEx+l
	AjPq80rdF0hCvA6yt4z73pUrLukFvEPLzJBKLxKcu9D50cyDYxnr+qe8fN2w9E3k
	uiyGppf8cRFl5J1WTe3pwBd//dNYZ0rGuyxHbLq9y64TSsfs+o1LUNIRdapo4mi0
	k7LBXoIjXiendtEBCZs1wK95NPVrmhQ/JgdZb8sScBbOqnFMwIQMma4JC+4CshSb
	seCGRQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83957v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:44:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so156791955ad.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717098; x=1785321898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAAgAP0V7LjmvDcg7cU4QtLN1FT+eQx8NoMPuNIkpro=;
        b=CiRV5ZIE17zpGIkQ1WwqjmX2zadsb7Rios0bRvZeRWgdOJ37cE0RWV86Q7DZyE8czQ
         l2XlnwEec8+C7Udl1LRm7znCSCd3wboKsv0VWc7jgcb17S/jQt+H2TjybnxENy7bB9G/
         8HmVwiy6aIEDE+JzIoP47ZaUfFdOX9+A7x6P+Ko1/XNI9PQPGdUt7OF4pk3oC2TFC9qG
         yMlenx4hEoxe2dTc2Wvh6BIPw7F2DEgxpDu7C7AmDr9RGsLtFua2zV6L56bCorZAHE5R
         KqcCDc+g6otthxNIcE0KlpKwuie5fUnA1bnLPx2Fs8AAa1+ZdbsJN8n8WVZMmWnug34b
         V7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717098; x=1785321898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAAgAP0V7LjmvDcg7cU4QtLN1FT+eQx8NoMPuNIkpro=;
        b=s9+cNf61uV45Wrvz9XWze8uVc1EnrVtvd7cxgg9QtNvYR7TayiGa37YhxkAq4/ug5d
         wGCa8OLojpoUI4TE6KGZl/t43TuFcm6V9V+PWIRgbRXsU3o/lan4BvcvhYaYjjjYeIu9
         1FhJ5FOHkanEirIuWfoCe4gdBL0unEGdAQ1LmTNd9L1XEWuAo4uPCSNwuP5Z77dVQU4D
         EdHZ5/iUQTQ692veb/xbsNeN3jJKnNvt5xADIQ6NI44nq1O8bq3ECflfkxak4wajrQ1M
         VdxAupG0Rw0qWkjr3TQzK1Zk4lRYOp7TfGG4w1Og/uMEhuoyAINIz+peJo2qCKWa8wyT
         nnFA==
X-Forwarded-Encrypted: i=1; AHgh+Rpl4ZxkgMYfSwt86Q2kmWb6ftLjfg7w13Z6dUIoacL6HBwgM/hTKOAAN3+hyapB+cswjztpfzbOOymP@vger.kernel.org
X-Gm-Message-State: AOJu0YzMglqRlaLUaUtjDw7XUVQ8SfsiSW4c2jZZY3BQjgDNEKAOJirP
	Qn0nWSU1lD3Q99mRgexHtLcl2bkmm6+w3yisCVoL6DNuq754dUm4CyTjwbmWLDFZBIakR/ors39
	EmzndzD9A0bGs3WShXh3tl25n2HUTgqQWm5ctSNvQV0VPMLKRhAsIbtBqFr0Jb1Cy
X-Gm-Gg: AR+sD10DZIchvDhLYIAjcaHB0UAfDg3XmsowI6UiEcaZelMAn5iva75QyBhl+FQL1kY
	ZHnHJYG8YU22VK1AthqGJ0fBMbiDljzZHdnv1vzb4WBGjdbk3cIKhwj6dok5NkSS6aR20EbyjOJ
	qpuH9GGfhV+KwHjS0gZFoEtzKF66s8r3LFzn7bEK4/lJn88Ns1CkJD4+5BmvKwJTXbBatriS91t
	ErNXcGsDznEsc74y3PWRT0tPCwHh0ljnctzAq6QfEQxmul+9qNsVxfrrz52nOdxqC8ZgNbtGF9h
	EjCf6hL5jWdHZXiOVYRie5ZK6H2GvKlhoqbBapLvL8qJ7bWDhMQWrJWSRd/SRej03cBXhEb0aCq
	vu2n2yjlMgLtwk4rOVKU/6un+hW/5+C3v
X-Received: by 2002:a17:903:1c7:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cf349fb45amr235093305ad.35.1784717098444;
        Wed, 22 Jul 2026 03:44:58 -0700 (PDT)
X-Received: by 2002:a17:903:1c7:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cf349fb45amr235092945ad.35.1784717097973;
        Wed, 22 Jul 2026 03:44:57 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e797asm12382455ad.39.2026.07.22.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:44:57 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:14:41 +0530
Subject: [PATCH v3 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-spmi-mbg-driver-v3-1-ef73064f2789@oss.qualcomm.com>
References: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
In-Reply-To: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: AvMxDLBrObQ70Kegfj13yveUJsMhebGf
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a609f2b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E-gG5h9l_blIFwvKag4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AvMxDLBrObQ70Kegfj13yveUJsMhebGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMyBTYWx0ZWRfX0Lw1y9cjV0vW
 +3cr40NaBgBDMGwRlbHabQv8TIAtWM+gCLDVhBFLNRt0ClUPFeKAyl3vZGpnPxtYcQDEvPLDkhC
 9j+qwi60WvUmCWkCePjg89P3L7EAIHWJKJwrn8sb7FKAGUEwlA9lchZ05PM31Fu0UemxliZSdvF
 ctag9MdZwN9fQqIbq3dzyw07KLvBfVmfJF+Y912NXc7A6Jr1j5MakHf6kWhl/iWged3NV6XK1l4
 sJhubzxZ22IYztb5cmq0kgqFj1WZE9f3XZqbqqA5+qCEImnk9tM1r6DicTjzsVE97JK7a6DL8ah
 yKvhA43tI+89EDGW+DZqK3uQ5/org1BpW+Ljhvkv2A80UjA6FXTIud1ETGpFjpcuDIAZwpC/AED
 8IHC9RPV9JfWbpcZmdNLcRxKLAmL3C1ZimTCS5c0eAS6xsBdXw5NKIUvsa5+cx3fe55jRNhRz6i
 vCKVj2B5HM3+6c5OzvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMyBTYWx0ZWRfX17pQBV7SDVRV
 3GujVTXYSsI0LKBc47Tm02kx6ylP+MKAcJPrfkI7z24pd+YrdShzZ3sOw/8YrC91oFbpITq+g+/
 8cwMJH0yl8icjWMeznTeHO8TFBlYLCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220103

From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Add bindings for the Qualcomm MBG (Master Bandgap) temperature alarm
peripheral found on the PM8775 PMIC. Unlike the existing SPMI temp alarm
peripheral, the MBG peripheral supports both hot and cold threshold
monitoring across two programmable levels (LVL1 and LVL2), with interrupt
status reported via a fault status register over SPMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

