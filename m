Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690837;
	b=xLT0lxwjk7bYuIoo52/byuGAxafW/frC4R5ig/5LuHIA5jOZlWsypOIEGhx486pc4yyA
	 /CTnDzrIE7mYaSHH3nQa7LEooviROaGdFAonIyUGU19+ZVrn1cN4Guinb/SNOTgVXiq8R
	 qjDRRwHYGpXNlltJg46VqVQjzsWsmXq5sIVlUuMszsC65IMkuPOX54AF6q1JrnJTFwQH0
	 vetn+qz9UI5HnJXcj+uFSPVn2RGSYhAUAZGu6bJvdGBA6QgZA4EXDvtskwEE3kgkfP08j
	 JvSdMzgvyt/5GI6SZsh/D6uSWNJuZwgqJZ1VwKJzcBIaEtKwfLCQT8nOvmOpk0cLKyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
	b=CdC3PPEsez8iOzrnPtjfGEq1n8q7bU84VOy3SlTdwNexSxkll8J/bJnzI3IB6BmuCwEf
	 lSjMmHmLEZuho8iiSXB/RH7cVFhQsxFI+WP8J3XerWRLvlBizURFMhAM0rIYTQWfAGg7Q
	 GofHYLA5ib5fxcyhVqbqBIrCfWZ2xMb90NT/XeQtQ2zDz1JvqvGGfhGV2w9MA+fJ1f3dQ
	 XfftMeyRIQv4P1sf63ac8vVw1wqVJAazNdttO+n6kLlZU9gE4sY/ngtXtaLriIRyyUxWJ
	 wvLicjpCNB0OQuW+B/htqXs5xz5IcMPNBkunrdeLTWKYSwt7nhlUlY8UuSO2P2ZdC7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwy80TtI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kr85/9Ds";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A250606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A250606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwy80TtI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kr85/9Ds
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXE9h3348328
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=; b=fwy80TtIGhc4VeSu
	s/5RoI7VGxBPpvJuw6RovybbXd3p3ME60tnoxYEsaIxn/OHJAdLfGe2tw0Tj3XS0
	PlbpSUwi+MXk38SwMQbT+17UXkmRCTsICtEMU5NZzfi9vv3kBGe/yodulrdEog0Z
	m3hI2YCX+kE+7vTA8wPfPE587YfRxJy1u5qQ0zS+39gvqKjolCxE2SvnmScFwIv2
	XKEToN3cFc7dRGVw/HyRhSbEnmlFQBSAiFcAzukFOx/9ezqYzABsAIgxIIXnvMGW
	HvLSN6iEwt4mBn9zpePHYwwLCt5ueE2AC9ck4lqY19xc3rmaIZyugtx7T63HAjGl
	zE1qvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rh3ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:00:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0329e57eeso63817995ad.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690836; x=1796295636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
        b=kr85/9DsqGGiG7FShPplbgJRwAphF9yF7TqziPvUEMH23Rq+El7mi8+yA9Nu5/C1zs
         /1EH6v9jVqokkqfJs3lUYd9dFs2usndR11WN1NjFiNRdRJN+sUCT/7JHWM9lHk7qWXW4
         aYUOFZHgaIU8ntvAM9eNkBqmh2vXCFE939KJQXZi9/rqk/fJgAI0Nw+sHuf/YnGK9fNl
         zN1RNd/VuumdabQElldcYQBxHUGb0k80vxCAuTgVP7oAIOavJeHG9GofQ0zMl6mEMSDM
         k3rYjv6S/gR6V1pauv/Vllc/03h5cFSJLtBfuO/J4ignxipQWMyiHXD+8D0pHoeiFkOY
         68PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690836; x=1796295636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
        b=Qdnf2zrX7CLw6CkMf2dTgkm9IU/978Ja6/Cv/kQNaKSDCuwGsorIrVrUrGLqpfxVZr
         wat9OwgUKrDWd//oNArZitfwOvxvxb+ODbSA+nKvUZpaJjZFSTGr3ce8zOtAAwD9Ms4S
         pxVJLgpRiFi7Dfp39t25Sw39ktKLiFcsr1f3nrrqfbMAoesF90FQblwLpUU4P39wVdVC
         gpsKiZyWPh8J1LXfTVRv0DLRfXFbfjaULvVUXCXOxxfODdVdj4B8epcdDEwshrFi2p5k
         +iXU1jUHWKfQNenZgP++kUt9I7oHNTUpVKUvJCre1zxLWu4354vRMCwekf/1VTgM3Z1v
         y4Kw==
X-Forwarded-Encrypted: i=1; AL+hErHxZSydj1BjHyxTmXscRiWlbNr2Tl9E/N1oM6sX9eUkw9i1a1Tfj6ud8QrP/Ct3qN2rNxn+hwBrLaz2@vger.kernel.org
X-Gm-Message-State: APuU4Z+/BdfeCv7lu1C+uXqUiIlP0NTD+8wzaEUIpLrzHPyiRDQVfK0F
	YIolSITuxE9iUA2JrfI2zdgeur/e1ZBYEKcO3ElKBp1TXpBt/lkYONdTu2CndzZjeJSgvNI3aLG
	wEO4aMzd0rAkprmuFCGhdOscJRrCnc3t+MwEe7UEMzZ4v6p6BJbjrLen83PSfrN5e
X-Gm-Gg: AZFdTZdnVVxm/hao6IPMl1YPGfrdcuXWP924/faz51hdR4au4QYRy4UUBxhQpfGfAEv
	7FKPo92sI/4+hNWUS5mMLotB2juNYB/WVKRkwTj3h2ntf29hK1uPLJulZEPl5X6egAmDabcULBG
	8N/TpaidgwUZba3MHoReS4U7XZtL7J7jgMtUJrsqFNLz7LJu3N+KsbueoAg5g58ohsT1ckAHiXn
	DEuYF7NUfDrIWHuHJItPZPaWg9TKdu7DL+rQsgJ2zjMAvJnJxgyMGpJFVOBhG5oG9G3aTzhmZYN
	h6dS/RbtNvuxqzHNclcL/QSQuo9r+2yx2HHdmlpi9Yzc0nmDjfL6mtMx5xruR33/F8olb9djAXV
	cfpGFn7kw5sCYToQyN1wSNo5bfmcAFLevJPPX0OsNN6db4mDEwXzEhuZI/4vOxeKPGcCnrh+8E8
	g=
X-Received: by 2002:a17:903:2c50:b0:2e9:64b9:a330 with SMTP id d9443c01a7336-2f03f17d2ccmr205396075ad.11.1795690834600;
        Thu, 26 Nov 2026 03:00:34 -0800 (PST)
X-Received: by 2002:a17:903:2c50:b0:2e9:64b9:a330 with SMTP id d9443c01a7336-2f03f17d2ccmr205395245ad.11.1795690833868;
        Thu, 26 Nov 2026 03:00:33 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm101400615ad.17.2026.11.26.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:00:33 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:30:17 +0530
Subject: [PATCH v2 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-smblite-charger-for-pm4125-v2-1-20656509518b@oss.qualcomm.com>
References: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
In-Reply-To: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690821; l=5273;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=AUHf3tX4cjhQLgpG36hMqGc0GVm+wfhye03EyAkWlc0=;
 b=ENRMrEvMGxV35m3XI8+xe//bvjIErvUP53yqd5vdBF8qQggrPqWUlKqu+8gSsymAdOVlKMjby
 qxQCtBCkqdsBoMKf993R8wYV/QluSmaYt8E1qb3SO/jYCH4gZEr6i/5
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX6bFJJnr/KN9x
 vls8/uhPq7pXp7T43zB3m1wWJy5S+cAwuvjqd4sVh63yWpqSmSjhKdfSBAtMjIV0zAc3eIExz6I
 geEj6ez15I4R6DEaJIwzzLBOhwPAwtUeXW36ZANs/P190c+wTZIuSyAKuoh/8uPKVvAcFJXltwj
 vQWQHf0lAz5TCSH6hnUj8cp9EEEWEEyDszZUOyZ+hYo/SB02noLCh4lbcsly86NZ2/UcG/O690Y
 pMPCQyxuq0+DfIcSJcyR4btnxEkH7gdBmQoOhROLRhbdHcWpbrVV07S6GKckQxrQnu/JQRtXrXq
 oItsURXToGwuR4PBx9i2k9cI0dBTPuV/lisQvT2HKGpR18ryawiI8WDA54o4IIqYmtpYj1BMojW
 Ri2BHc3IbmNaeJ9wsrWxRgpcNnriC30z3aToR+htlp0ABuEXYb7ngs8Mxk5Z/Cni2D17qTOjX+v
 CD/Uc2e2m13d/1KMMRw==
X-Proofpoint-GUID: 1vmNeqCh3ZVL0hOOwTl1hKHVLVqjsUqH
X-Proofpoint-ORIG-GUID: 1vmNeqCh3ZVL0hOOwTl1hKHVLVqjsUqH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfXydN8k+NznD5j
 DACq/qaAsG8Hhi416QnZl8y0/LVjLQW4DhjwXwK2IIpDyGv5KEKxs7vBDlKYxm64JzlIoWN9M6w
 /rogInObALCjFNF5+N5gE0R4+0IMlrk=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b081154 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=qXe9l9IMIpBVqIDzQAMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

PM4125 integrates the SMBLite switch-mode battery charger IP, which
differs enough from the SMB2 IP already supported on PMI8998/PM660
(separate SPMI peripheral bases per block, a different interrupt
set, raw ADC-based JEITA thresholds) that it has no existing binding
to reuse. Add one to describe it.

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   1 +
 .../bindings/power/supply/qcom,pm4125-charger.yaml | 119 +++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 7a889d888383..8c8eec87a765 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -160,6 +160,7 @@ patternProperties:
   "^charger@[0-9a-f]+$":
     type: object
     oneOf:
+      - $ref: /schemas/power/supply/qcom,pm4125-charger.yaml#
       - $ref: /schemas/power/supply/qcom,pm8916-lbc.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
new file mode 100644
index 000000000000..4c88d836355b
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,pm4125-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 SMBLite Switch-Mode Battery Charger
+
+maintainers:
+  - Raj Aryan <raj.aryan@oss.qualcomm.com>
+  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
+
+description: |
+  The Qualcomm SMBLite is a switch-mode battery charger IP found on
+  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
+  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
+  supports USB input current limiting, JEITA temperature protection,
+  battery overvoltage detection and a hardware watchdog.
+
+properties:
+  compatible:
+    const: qcom,pm4125-charger
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: usb-plugin
+      - const: bat-ov
+      - const: wdog-bark
+      - const: usbin-icl-change
+
+  io-channels:
+    maxItems: 1
+    description:
+      USB input voltage channel (ADC5_USB_IN_V_16).
+
+  io-channel-names:
+    items:
+      - const: usbin_v
+
+  monitored-battery: true
+
+  qcom,jeita-soft-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: COOL threshold as a raw ADC comparator value.
+        maximum: 0xffff
+      - description: WARM threshold as a raw ADC comparator value.
+        maximum: 0xffff
+    description: |
+      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
+
+  qcom,jeita-hard-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: COLD threshold as a raw ADC comparator value.
+        maximum: 0xffff
+      - description: HOT threshold as a raw ADC comparator value.
+        maximum: 0xffff
+    description: |
+      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+
+dependencies:
+  qcom,jeita-soft-thresholds:
+    - qcom,jeita-hard-thresholds
+  qcom,jeita-hard-thresholds:
+    - qcom,jeita-soft-thresholds
+
+allOf:
+  - $ref: power-supply.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        charger@1000 {
+            compatible = "qcom,pm4125-charger";
+            reg = <0x1000>;
+
+            interrupts = <0x0 0x13 0x0 IRQ_TYPE_EDGE_BOTH>,
+                         <0x0 0x12 0x3 IRQ_TYPE_EDGE_BOTH>,
+                         <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "usb-plugin",
+                              "bat-ov",
+                              "wdog-bark",
+                              "usbin-icl-change";
+
+            io-channels = <&pm4125_vadc ADC5_USB_IN_V_16>;
+            io-channel-names = "usbin_v";
+
+            qcom,jeita-soft-thresholds = <0x5314 0x25e3>; /* COOL, WARM */
+            qcom,jeita-hard-thresholds = <0x58cd 0x20b8>; /* COLD, HOT  */
+        };
+    };

-- 
2.34.1

