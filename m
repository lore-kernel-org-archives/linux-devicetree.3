Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98A03AA1B8
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879306; cv=none; b=DS2DNLc8cjVUWI7WSmI0MSzydO5TlXg7IBf5XHjAmUfyzxNZWzwGLh2wrHVpu3iBdKUQCAH1hJGR17S2YynLR6WH1LW756SfD+VsQDMPb9gFoovn9hVD/Ir1TrV5QF0Vl6vq++L1VWbkEXVvzpBQ8wrI+8ByCcquKZizuPhjURg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879306; c=relaxed/simple;
	bh=yhfsNlH0RS+IypgukP+bK07b4g+Hfp3VDvpALH2BQRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFJdXI3vJ9JChHpzmtulksAeB6TgMFgGp4r7BeL7YS/t1NR0ktotCFbpuxwjRSdQWuTK0UfhKx5topTJPiI1c7p2oyhEO6LSY5yElhtRFxt9GPAyPOL5xT2jDc+DbpCTZ/95LRPvBg9yldL5FVSkWQRfRKBqrsBbelWSFREv/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXcHTWa+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck6QSB1h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXcHTWa+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck6QSB1h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lePo2163501
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=; b=BXcHTWa+XdhLzidT
	UzspvCo4elz9OZrnaRGbWgH2zpQ/GWYE9LccH0sMVP7WAJw3SuRxFYtG88PnzXNN
	eQtkNHLcJBEK/XbQppjf2Mcs0vY01OzEY8mZJoEeRYHDh2yijtT+tFOmV4tFi0xd
	8bMT6w5Tpbej5Nw+Q2zLCbVUpDhvs1+5dO4I6aCxINQdAYTmvuH74DijrYQ78jSm
	1xFadpDXjYxwZ05eadgN8GkHVu2JbCRxyQP16KIDVfzvV+A6YHWKAIk7UWTP/B4d
	Cm5TQFV4ILMXtA5jZQiONPlzlu3PZzHfikCFmTYVBQ6JGqHHEHFBVG0R3zbkMbW9
	+dZPGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vk404-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:48:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so2992761cf.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879302; x=1785484102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=Ck6QSB1hz/JIR7GayCYG8YoSgEH7RE8vK7yx6ehyLXCKIT00Dp4PJogyry1Rdtu4+s
         L7Y/mZ7isqBrvhEkRnOClUb07qFgJRy+sDXCeYzo9yoCVEOlFnCmNCNgjPjfjxn4mIFQ
         //YLL/c2zzhNKuBPExLnRDgtaLKPrx6CmaQBOAH2Y3eeN9JlKYw1gmCXOeSIXDG1553m
         OFe5Kij1tBoFWVE6xY7mOqb8Vjayw+0l8ZMLr08RLN3J1O5zHN8NRCLyP9pI+ED3pCcJ
         uQp8nvTC00BBHKDlUXZByGHDIGuaZY6VT9wXBGJlJcssCbzMIyyw6OjppEonGaL/pHXa
         RXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879302; x=1785484102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=oU/haPLTdCQTrJv5o96jjJUMRSjZKCqeY2ktdtteFu/NPIoBOshmg05ppeabdlaDIQ
         6D/pPY0n9JBO5glLsTDNARHnmdjNsoY9N8O1bd/9zQDN1/WynKZwk1uExGu0CaAuKJD1
         8B9SsizRB8+PivxdC2IjrqaFuJTHENj7XKAHlVyoIGl/6H4Ym/vVCIfC8U6Pj2OoV+Pv
         YUC8D0NJMM6sEE4cWDRelVMdEg+Vs/WQVx6PbhOuTmm+4s21rRFVzbsdBQTsFZwpDKiQ
         RTOF4xQX8llE4uUIw/L/3EI+9PwMFTnbkIIraW+vNsArrI8rmEKYTTwChPfdyTQQFOx7
         BNCA==
X-Forwarded-Encrypted: i=1; AHgh+RrRKsfnOBj9TkFWgJMUIaok6qy3/jA/aMVlrEydF9TM8Pu/HIXnHKSV7zN0/yLARBXre8q5kj+//duX@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVk8mC1DOQocjUWAu8vLIxCU8tYVLiUCT3Pg7eTHx+nDnHBzI
	FIMj2uyUNahLhBnfIt0vei0ZvUdlVOyy2kWow1iY+japEAmyfJog9vy5LvxHEpgJ1RRTagSq7m7
	U+BCMZ6chMCi3jytrusAKRBT8dijvreSR+OL4ZXU3DHC5WM1TTirDavdGAQ3UNVHx
X-Gm-Gg: AR+sD12EM4uGdGwM19UCx1YIY4dXQuqHcd7Kba7luOuNTCOTQAqTyAtBwsPYdgrwD3K
	f0VwtkwsbgmqZq8tqfBBZvNmnNJ0XD1hV7YsrwP8cPbne4eRrPOY/0SAu4pR9LVDnJsLIGNUSOm
	iLlpJqsFtetvvKznbff4gVBe4fKSeIQtj0/XPurVjY6Nxf3l2YOC4b9KToUvDChf+vHfYQ4/yd5
	Iny/zDAlY/rKgkiNZykGTW0a6wNCTb/QOf25hDs2CTmqfZahFW6V2WFNza7pJ4A92iA0NEoeXd9
	FyYcCulKkMZqv/mt7eOnH+6cFjDF2rIMiBpjKY/Lwp2SeLEIIpidPMq4vtDtocl26I2AFx/nFuz
	AT0ShsJwaxIuAKuWHrRLntjS5RLFvDZBvrK79CxSTIxX8W6fi5xHBQAMajiHOX/NdpHXIOVqGgf
	pScsTNyM2ZUeS/gY4AXcSnGr4ojLBJJBPr6MKKWQMGINOL//DtjQ==
X-Received: by 2002:a05:622a:1a8e:b0:51c:1590:8e13 with SMTP id d75a77b69052e-5283ddd1751mr62829391cf.4.1784879301764;
        Fri, 24 Jul 2026 00:48:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8e:b0:51c:1590:8e13 with SMTP id d75a77b69052e-5283ddd1751mr62829231cf.4.1784879301298;
        Fri, 24 Jul 2026 00:48:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:16 +0200
Subject: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
In-Reply-To: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX8Zk5x2+CdS1K
 CjL7OKipZgEijemcZ4nxFRha/uPGYr1TYlUbY65UnnfL09GAms39InAeNvh1k1lNit0cnPEhxHC
 KiJJG6VwLKKV4g8IqCy9I4G79VE4jbs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX1N7Zc+Kw5H2e
 U/jZJBUYsWA+DajhMEmT4f4TKRmcwI9k0sh5El/QQc1mwedXqmHk4VQEQgVFN229UIITePUKXgk
 dTnVf2xmfg848d11w9Nlg1lOgDH15WZwfJlDJkyWDjGL9AkWVSwtAen64NcVWdGGMG51uKAq/4+
 J4MqfpqDeIKDXvjsy/a48/Fip91LPjyztAHvuttV6EvcZVScOcfkxRnxceFhK3D9AThDcN+bud4
 0zrIa/cQvRIyAaR4TEQiSg3l6uq6aPGu/9gewj/nHWFxif415/y4kROHuMv2IpC658LXldt5OZv
 5L+4viVKnZxonvII8ZJhkG4ERNZtBTdNxsvZPpSr43KnoC9QApyni2jxEs7iyOPALQaELtyUEns
 AP0r8PYtmH22zzY9hUr7/cMfI3JTYZuyAeoexSwEk5s6v3d58TxPFVxop6ntUsp2V62sMeLRDUX
 kGd1izKJVYMlvXEZvfQ==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a6318c6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: coK82qXETI-leKm3Z17Mn5Ta51i7ex2B
X-Proofpoint-ORIG-GUID: coK82qXETI-leKm3Z17Mn5Ta51i7ex2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

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

