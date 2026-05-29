Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8800B2E4257
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016750; cv=none; b=jJNF2owAUbBMznEjx/TKV0c815FoULlI7QYXas54ZxH4tfoFaj6yTtd64/FA/JC2ZqUlnKiqh78kFPJrtzV4O2Hz0HQy+F+ppV/eARJr1L2v2zg3LposvCMc2bGuhJHwT2qYu5lNN+TYNefmfLQgyaFjAskG6bm4JPPqj+XrhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016750; c=relaxed/simple;
	bh=lXy4t/t9OCmAgFepSL86P9vwWEgmZ7kUmPb0JJyweV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aV7R6pOeYe0BhtMN4R2NZ+wq3ooZOzvdboFa4ZNwzHQX3VLPSe8dquDYGUr5y7YkSG6DQahkE3TJoSy63b3ZarjvYal5kiqoFFN23BdEogMvDOkY26d/fVR6K2bikNpkAO7194h8KplKXbwZzkKSFji8QPk18iPanZXf1o1d9Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BY8/Sy7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1j63/JO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BY8/Sy7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1j63/JO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkf8A3252897
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=; b=BY8/Sy7YEVtBa8O+
	G1Qi7JpGGF9vxDTfK+oC+9hpCUJqtYV7rH9iKoIAO+HdXmyiPlwLUcGShpa+BbrN
	sx2BDujI++nRJDvyBorIp+1rayp1Jnnc7iztWLfkztSQwYD7ZoyuUP2SXoeO0nfK
	wv8qIcYOgwfD0/EVnUL9889TppeY5+Rhrc2sqK2kLkmYhfzQ5NlwpxgAhzaFzguy
	l9H2uoLN/dQ4l7PtB/f5FyTMq+wpz2pZCcCy4Kcfqgu5IC/n6KeEb1VGJBv4SoW5
	S2ihaOSprCxpEVGy1+ZtfDKeGKMZUmFTlyGiEXLZIsY3XNhPyvUfP6YmyH7NBBLk
	kMN5vg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn1y3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:05:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304df51ff3eso1035434eec.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780016746; x=1780621546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=;
        b=i1j63/JOQTXMh+ENzMnCwfY/fFnvl/JY+3US9r4g6wXJBS+/gBwAKN1ZRWDKISKtLI
         drv/NzbhXVDFp6U/FFxSUhgEKCySV1aoB6KOP7F2xkDB97+0BMcq5XGppk9sogCWl31A
         XnX7RILAD5o5g7l37uTkzFDzsnBnNmedWByQpVZfkbxrAj/jm8sBxzQZp5sv/a4UUbDh
         jkiFzFFx8lXP9nXiLfTeA8CjzsrzEGVR0nxXZohMgNMK2mtqm8hTFuIBHJQPZW5PgicG
         vwd9xACvXZgsNyrKo0y9s4JxHyAnIhFlm2PUaoiuvy1hZUf9bR13M5Jcirb/f+lcQME7
         ylIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016746; x=1780621546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=;
        b=Ez7QT+az5tJM6iI6gG8KW7s+W0ZJsU7R36x7gSsVvXEcbvw8zvKew4bARDfPI96q3Q
         JvsiLn0AOqZ9+D3pvIo1BNQ/uWz/+sL+xbB9cRnuZROqkPdna/mkS/hlGAroRvXgF+l6
         9clhRQ+K1Fxofsd1NXiifGUKmhqoGxltjd8cCDK5RT0nXKAJ0zSlPAwAF7eZsfccmS1i
         ogFY8PYRxHF2EF0RAGB5vJN3yu3ajHDiVD6Vp2yFMGiPU7eKlmmocufstQI5xg805Lf6
         /IComWksBkrm0qPDOV3JpfYy84aAKmP1qtXvZJbQhIL80hyhjTAMzQzvAUMgdXqo+eKB
         fScw==
X-Forwarded-Encrypted: i=1; AFNElJ/EvElcTD2w48g6Iod43yHZOH+70+IjbvogcLZXbG3zV9bpcJvGGorV2571L9y1sCilg2R7xxwlWKht@vger.kernel.org
X-Gm-Message-State: AOJu0YzW9L7iz95BNpuN8kUpkz8O+ekyamVwsNWuj15H/3KuVgYzMwp+
	X1yyRd2l21DuCIrNDiPm5lm9/Jy425l9QhjKvx1ZV7ewfDqGiwjC7PFXR0bc/xARvh9BGAV3+IV
	UEr4fdBeoyDCfT6szWdOz3dbuLSE7I58x2/4kLHSpq/Z1/MVnaJF8jgcR478l4mV7
X-Gm-Gg: Acq92OELKHzLaLAf729Zg6ns50U2CCAv1ysHC6LsErBS6zEpKdTbZ2K8vXziFEtI9NY
	Mss0zf3rPO0KpJVpV7AmlcJoCGDlOiUIE+xS99/QlQVHhTLAStJnOYthaHJFr9FSR6Ecqk0xSsF
	Gndjd4p3gDxfc23wDtuwCRKl1fvfiBguyDitjC5LeAGZNqgdm5gto+HKr1r1v2s3rgtDlaKZRqo
	DYhVxbBZ9M+1Azmp9NHTDbOAb5aqs4uc8E4IsplJDtIkPTHiQbY9zu7L/yFFTf1OcQRenHgA6SP
	qYpJRKi20orsQzlbCfcDY4ew8w3BmMt2NcUxkoakg/Wp2oUmR9DWxKRcH0QCZRcu8I05Sd7798S
	lh3VYJc/W6bxFdkuvMC8I9lgGuyGHgdXl+nItKbkzp3bZUhGAfl5Wun0mOuAi1TlJubyNxGDnjt
	/OcbFcINLo
X-Received: by 2002:a05:7300:a484:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-304eb0d866dmr475131eec.16.1780016746069;
        Thu, 28 May 2026 18:05:46 -0700 (PDT)
X-Received: by 2002:a05:7300:a484:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-304eb0d866dmr475101eec.16.1780016745528;
        Thu, 28 May 2026 18:05:45 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c3121sm179812eec.5.2026.05.28.18.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:05:44 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:05:36 -0700
Subject: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
In-Reply-To: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780016741; l=4665;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=lXy4t/t9OCmAgFepSL86P9vwWEgmZ7kUmPb0JJyweV0=;
 b=VmA/SAjy7f4I991yfIMjzvCQdrqCb0zwssphblgXNFImVZft9fr4KM4C4Bbnw1S2jJoli3KNF
 T0DrFWOqOKVBJ/uIBeGaYuTzgbuN0oW3YihDJQP7kPejTVAD2TDoV4m
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: M9sZJdhvzZyESmUQD0wLZ7Y5GNmLqeSw
X-Proofpoint-ORIG-GUID: M9sZJdhvzZyESmUQD0wLZ7Y5GNmLqeSw
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a18e66a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oPYuZtxd-o3nixQqOr8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwNyBTYWx0ZWRfXyahOYhecASF3
 FY/ZGH/FjTy+tl8kq9Ca1L/IFteW/kNZKCIgkt/0yuF3r0sj1r7wiqLNhLY4OkW+NpFw47L3Aip
 iURCG9av6BQ0w3knxFlTUVK3LK4NT1OZsBJ8h/p45ExFNAQMV3ZJ21rLtLsLXlKSf+uu/ZcH59E
 8SQiDbBxOW3OPVETjLa+xg3Px3lI94DeS5Qu34D1QdM28ljZmF8sRRo+BQp5vjv6puXSeRTo75l
 7AEYwrzi8Ia+ophQjLrPnjTV+7jjAftgBAqQRf5kJdkSmc/O2C89v7KWuaq1lOSseecDwmj4kzh
 9bpSh0HZ71h3TbQ6Azrmuu+jjKCSyDbihdplFA/QQLxORfLQVIYqs2Zp0i8bn1TszJ1r+O58C/1
 5tgLpZzkyFldk8Aqegm/9c9KMd6Vs9dTXb8DUenWpo/mavnp8eExbWGVXLqyIQvBLTH8MzWVX0+
 vRZEI0jks36GkNQrzJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290007

Add the "level-shifter" function and add the required DT properties to
allow RPMh firmware to control the level-shifter. Introduce a custom
pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
level-shifter function.

Additionally, add the "groups" property with the allowed group names
that can be used to control the level-shifter function on pmh0101.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index b8109e6c2a10..19dc61ddff2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -119,6 +119,21 @@ properties:
       The first cell will be used to define gpio number and the
       second denotes the flags for this gpio
 
+  qcom,rpmh:
+    description:
+      Phandle to the RPMh controller device. Required for PMICs when the
+      bidirectional level shifters is used (e.g., pmh0101), to enable
+      communication with RPMh firmware for level shifter control.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  qcom,pmic-id:
+    description:
+      The ID of the PMIC which supports bidirectional level shifter function.
+      It is used as the RPMh resource name suffix to request control of the
+      level shifter to the RPMh firmware.
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: "^[A-N]_E[0-3]+$"
+
 additionalProperties: false
 
 required:
@@ -330,6 +345,22 @@ allOf:
           contains:
             enum:
               - qcom,pmh0101-gpio
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 18
+          maxItems: 18
+        gpio-reserved-ranges:
+          minItems: 1
+          maxItems: 9
+        qcom,rpmh: true
+        qcom,pmic-id: true
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,pmih0108-gpio
     then:
       properties:
@@ -523,6 +554,19 @@ $defs:
         items:
           pattern: '^gpio([0-9]+)$'
 
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          List of GPIO groups to apply properties to. Only valid for
+          function "level-shifter" on pmh0101. Valid groups are
+          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
+        items:
+          enum:
+            - gpio11, gpio12
+            - gpio13, gpio14
+            - gpio15, gpio16
+            - gpio17, gpio18
+
       function:
         items:
           - enum:
@@ -536,6 +580,7 @@ $defs:
               - dtest4
               - func3  # supported by LV/MV GPIO subtypes
               - func4  # supported by LV/MV GPIO subtypes
+              - level-shifter  # supported only by pmh0101
 
       bias-disable: true
       bias-pull-down: true
@@ -592,9 +637,24 @@ $defs:
           configured as digital input.
         enum: [1, 2, 3, 4]
 
-    required:
-      - pins
-      - function
+      qcom,1p2v-1p8v-ls-en:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable or disable the bidirectional 1.2V/1.8V level shifter
+          associated with the specified GPIO group. When set to 1, an RPMh
+          vote is sent to AOP to enable the level shifter. When set to 0,
+          the vote is withdrawn. Only valid when function is "level-shifter"
+          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
+          on pmh0101).
+        enum: [0, 1]
+
+    oneOf:
+      - required:
+          - pins
+          - function
+      - required:
+          - groups
+          - function
 
     additionalProperties: false
 
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
index e5df5ce45a0f..b0824d5eb056 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
@@ -105,6 +105,7 @@
 #define PMIC_GPIO_FUNC_DTEST2		"dtest2"
 #define PMIC_GPIO_FUNC_DTEST3		"dtest3"
 #define PMIC_GPIO_FUNC_DTEST4		"dtest4"
+#define PMIC_GPIO_FUNC_LEVEL_SHIFTER	"level-shifter"
 
 #define PM8038_GPIO1_2_LPG_DRV		PMIC_GPIO_FUNC_FUNC1
 #define PM8038_GPIO3_5V_BOOST_EN	PMIC_GPIO_FUNC_FUNC1

-- 
2.43.0

