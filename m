Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD9B261B9B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691392; cv=none; b=dBDyXfhJPt3IbPHZp8O3D+WqaC63j2aFGWgF7CxehRONBYISyMmKwFzyXa8uGezzaY1lU+uuCHyskY8jEhJeshuXw1sI+lVW9UN7UWooMWLiLHkIaLmUTjzzwLBHvpsU8lMvAs3oBYH5Xk44+HTdpI+DmJHs/9GYcG2YdKMX9Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691392; c=relaxed/simple;
	bh=yhfsNlH0RS+IypgukP+bK07b4g+Hfp3VDvpALH2BQRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLo3TJlz81dA02YH/urw9n8iC1XWBHJlfQGFnNbNC735gwiHiDaxMBzdanqsEe+rP0nsAN4cxI+hoCTW4GeIgZUa8F5VTWzxI8Z7v9cG8PisfS5+bUEezurpeUFk4MPlDchle9nl9tgA8gAN9gffgPCg/+VRXMwsRH7gqqLb1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X250Y2de; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WY5691P0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X250Y2de";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WY5691P0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6260910464
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=; b=X250Y2deU1JxPQLk
	BWpRVtx+AQByTtNv7NnPxUE5qdh6783aCxZDeHf3wBWvtAY7Wzr8nQ3kyCg1tBwN
	nWhoHGqtmnUjeLQa/yzS2ef6Wq4U2V4zWPaKshkPxRia4ZEcJzSZ8iutzg3dU9Kl
	O2MU4j4wHEuKjthtFl5PCZtG4KImDIFx+nj4nQ8pL0nWIARoO5WgJeiCQWcctEqH
	LGVkBT+6A+cu0ieFCycZapvAWNpUmHF/51gyu6UAxU0u0q3/5xWjbVkfxE8jpxvh
	s69crDR0GSjQi0v+WkAQ39RYfvXn7S38DJ87uvxsHiBduH7pSj6xsXIDAlLozDs+
	861ABw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwearyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso16145361cf.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691389; x=1784296189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=WY5691P0NzQZrWAFlquUkk7w74SEgKT3tkMALtxelr576qFgMA10KcPN//uP0lNm/w
         p7Os89J3db6lnLi9aC1qwqLpH1t1jj9jns4sMNzQVsfxhnaSDs5++U/cMejw5f6c+sN5
         T9oCG5473VdYuFDt5XInefp9WpNeoSvOSswNoBfwrj3ysO771EMmSomIR8gegOk7Q0GS
         dphimL86nFIdZCVybDmWHl+GI3GiaEk/6SvD4AQR1d9S8NRnGYKhNQTUdBKgEZDI3OPR
         K+5YygyG4Tq5DIyFVu5xGVpHP59sGqV/f6Wtq18VVhXxVJCaVEPApKw/yHWGKY4JVGkr
         j9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691389; x=1784296189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=NeDYmzRp87BTryAEHg8hT83wXSE4itdeVG4F6kNl7CBCi9XDSzaJoiE93RWrVQq3tK
         g2jsMGoTpAcaQBYxLsKc7+xBhpmG9o/VUGJMGlDGfsYI/zr43Oj95q1/Q9U9Q/SaAMjJ
         I9D/HS9JX6vUoitIvyt/hOGD+D3bF9zbFq8fzNTevNuYbZQFol9F03ypZDruICetHWwy
         bBVEyImq1036XBXJXiGPLULHLGjKSxWAK9bzKFhnB1pKhIl8JgR/gQSPo1n3QOiYRx8k
         LZbQLBdUm58MXtjmi5y3U8FBqQKHsWPEc9B3mTjwVgjtkaQSbsXJ/QaN1D1LARLteP3y
         rdLg==
X-Forwarded-Encrypted: i=1; AHgh+RrxN40EMR9WYVshTpJfvxPSpkxT2PVxQp6kaBBmkCrW7wkX5QLxsRoY9yTcZlbkAKrsuMoau36jEVtW@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjMgqxepfw9Z59n3Saio+QHdhiMg3IRj5cm6VxNuF9ARQW3L0
	8C2D1gsdmioj7WClp9qeowmDZtYztsOngljqvl7qW/5E7yO0v/O90xrNob8iTk4PUOJxEYo1zkp
	brWJNhfDCMY0fStFlGGg04JLSd8CEcfu8d9cKgsQJRsHUktBoe+HSWPeUf7+iO5gm
X-Gm-Gg: AfdE7cmgqqPSFdi6yZm0hea1G7dTBGtU+6dt3kDCynGeTORpMe4qIpUVZKYAJfm573R
	WOHfCYluy0h/6OuphLefdNDqVfS29V2FJXr8PMAEnKdRk8cRVheaqGZolj1od2+ZVQoyiLGxHmM
	8bE5dso67RE9JlTptI2m2Ut6MENadXYY6nWJpaqSiqLJodgxaX83luYL/+bX268Y8eyJ0bLcMt0
	vClAvrhQrz0quI2DkbQTTXERvAZJdQjRy8aplmyh/QFHuHtmh0aP2rVEozV5tnFEqzpWhsNp6T6
	BgSNOfeYvU5D1gAm60h+LnbkyO4tp/Wr/v38YbjenRnHKB4d++pwpGPw/KzuILluVxvGrvLB5Mc
	O/onQB3lw8WWS2LdjI1vV+iPn0dNXj+i8wQrS2TLQeoafgeO+fDpL0K0UNPa2n5FwSXJ9sVbb/O
	Qx6jnlQQPFpV0K1jiiMi6BXXG/YCZT9diCFd98RvG1kL5zVHNgWfCQXYtUQ8ZQAX9v4S734jLNp
	olz/tPGLm9Wo9eAOCoJ
X-Received: by 2002:a05:622a:315:b0:51c:8439:14d9 with SMTP id d75a77b69052e-51c8b3c2a7dmr121726531cf.54.1783691388721;
        Fri, 10 Jul 2026 06:49:48 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:51c:8439:14d9 with SMTP id d75a77b69052e-51c8b3c2a7dmr121726261cf.54.1783691388257;
        Fri, 10 Jul 2026 06:49:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:42 +0200
Subject: [PATCH v5 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-2-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
In-Reply-To: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50f87d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXxBy9hAVMgoMr
 mME5pNz3iCOX9b7qoMAKXZ76lg9XFetu5LZ4qq4A8jHd8NpT1bF8OvUSJxq836u2ZSub3SJjBhJ
 8eBTTqApsdQh8wO2bfmHev6hFlEWcwD41RdGB+vEqIrZAfNtsqJ5qxq1pb95Qt8dDYXsTCJL7qd
 F0Hykp3MSPpysmWpP1O1Gq122b3ZBeurKihtZ1GqZsonVsaEJcwu06JOF+BwAmI6qexPKgdvWW/
 cV8EaUNGfuGPI3hBuozxJUYIB8SCREnkz556RtDHOWg2f31yjOsUoopejwNwBGzmnO+w/1tiVy+
 W5Qqcodd8aB2RQQX2zB8d1UmN4d1GPFPPNIo5fBcusRM9v+uCeX4lf2BpSAkUaR5ZhHsDU4zao3
 Ht9kSeJ+gzD8IKC1A9F+H8caGIm3iZ2NLrdDxnvpQFx2bGnyo1RwBt8aviVN5XajYwDhQUGZAIf
 regRpWsYoOuxN9tpaYQ==
X-Proofpoint-ORIG-GUID: Fd9buIWhLl5V7paq-LJnCse7byyNWI9Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXzgoo0sLg8wk0
 jPol1lO3OynAnBHRjY/TP2Yzr5vhA31rgIwHVx0Mz905TZ8o5KMEVJlu4cAxkOcgQs378qLTxoJ
 88Xawr0Xnlrc4aeNE4B+/ij5a3zHMUo=
X-Proofpoint-GUID: Fd9buIWhLl5V7paq-LJnCse7byyNWI9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 96 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4fda602912f7a9443b8a77e46bc015e244f82e08..eccf37de51285a0dc6d28ffaba2d47a9f93d867f 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 15
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maximum: 15
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -84,10 +118,16 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,10 +136,16 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 7
 
 additionalProperties: false
 
@@ -143,4 +189,50 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@62 {
+            compatible = "nxp,pca9633";
+            reg = <0x62>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Three channels controlling one RGB LED */
+            multi-led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RGB>;
+                    function = LED_FUNCTION_STATUS;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_RED>;
+                    };
+
+                    led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_GREEN>;
+                    };
+
+                    led@2 {
+                            reg = <2>;
+                            color = <LED_COLOR_ID_BLUE>;
+                    };
+            };
+
+            /* Remaining channel used as a plain white LED */
+            led@3 {
+                    reg = <3>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
 ...

-- 
2.34.1

