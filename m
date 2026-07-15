Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5762F8EA4
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123077; cv=none; b=f1CrOjVK0CFYv31iEKMe97eEEURdeZgNGpFZF3wqLRgrmHRTG6xfECxYTnDITBUMIMzLve3sY+co0E/Z2zFp2GpceAW8MW3Wxjjo63UGigRAFGOS79F8f+LPoopgdW7xqME5M6Bt2uVy6oi7vRHpoEWos1Fnt6QWvzl4dHfTDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123077; c=relaxed/simple;
	bh=yhfsNlH0RS+IypgukP+bK07b4g+Hfp3VDvpALH2BQRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfqR1fjOvRc7ummLrMiZHxOesAUB8Sha1A6cKPS4AEZv7GYfAoO6uZ05TzAKRPQCIjkWJSUtsSbneMYXYNvxBhCvzgu+Q16zE1tl3cRozWgAeI2WOOsTAlnf9nPkiYWppn7F5a/Gq07FcG0t+IUqrBZmakzXzgzWx9+IJEnIYjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1dXWGvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2rq1Yln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1dXWGvP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2rq1Yln"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBd5wn3600293
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=; b=p1dXWGvP4dG+CwZb
	NO9LA3qIxwGeSZzNM+Ae2No+B1X3BnDvD4k0OBAXj/3bCv/HWPXlyzBQ8PGAcBRn
	CqjXWTUwaAU8RIv8XT2T83Sthawpf0V7tPGYxRIQqtAZMLCklr0BEYyCGqTr/GvI
	fgUGWC+tY47ClD2oknu2VyxAEujwSZjWDXt1ykxYQKqXQ6upKrsHLxkYsshIRIB9
	QWi9gOQJpvy4VjANWDgxDPVSDyy9ojA/H/iATkfFG3/2J6XcWbo9B3jH9IJeYS4e
	vuyBeZd/1H7Y+1ueNK5iKb6NE4N8vfdkoBn6VBiBu4xHWK/bTl33fDp2AlP89/bT
	LL6jsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60wy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so41755971cf.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123074; x=1784727874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=A2rq1YlnY2qKkHzqsDDXtebFTIbe5lJb6EPQ271XLQd60ykQqoQMVKK5hac9l3ierg
         qGH6II5cjP71fJc2gFAG9uXi48b4PHSUnM9zhrS16IGDX8cULl0o0oy4Cj3kqwIur8DW
         rEvzicwXCUBO1uFbN4oPI45VHqWYw72fBNBeoN1srehOnnusUxaT+xJr/3C6mgwrVt7T
         0XZk+2gylxwaOg2JgmDBS9GudJdU6vITLRW2Yumr0sbQNqXBRdDRwaWAe5gyVT7aJQVb
         BAtEiy/cteoixEjByK07lctbYcbLwrAKN0zlk5SDxq/Z8lWVZZDLwurW51vHswW8P9Q/
         qsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123074; x=1784727874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=cNka6VgE90ih+3DjUP1XdS8aUcafDQPzjfOmTX++CaAfWicOD1L4P9rcD4k0IkhiUF
         vk04W65SFZdOT4S2dcyRV55IVK4F+uw3NiEF2psx5dx4t4EWqPfy9Am1lov0FxtDdZ0q
         YEPtaA4znG60hNw7PWINMXZYG8YkCW5E9/geSpUxDyQMUzBQyICLtXvVNmk4E5fUzfKQ
         W/oqWpqUXsBdONzKVceGDjYeo45fMlsOIWchNMPFwGEt8A3F4mCdU0y0DPmWW8RoLtFc
         ha0Z3YcUHEPbSbpQw8xBT2JwW446qqDF+xY1l3h/XelKIdRxBRqTdzgCELvdkq13Frrh
         LJMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmIiqqv47zzecarfHdvsH+xoA21YXnxzTxQfr2x5E+gQUl0kmsZBwL334LgOo/zyaOwshkLfd5spND@vger.kernel.org
X-Gm-Message-State: AOJu0YxwK85h2ywjNs2r5XhvaqB94rWlhQdmdMY4h9YYoOXhPpGODrOE
	lK7+eJzVQAvxkBHFtIPUwnX0+eI5mKKLXH0f7CZvvMGE5DLbtx8dvMBTCBEbqW/qrh6tv8sl7cx
	m5UOeBFTyH9vwWdJjGG1IJN2Hp4ItR3SamxepsnvI+/3LL4IxZE5aUUA1gNtCMYuN
X-Gm-Gg: AfdE7cmKWi7sdgcwhNeVG3oV8acecRWcG/YUqI2n+fJ5BoSy/7BX0RC4bhzB0jcz1Zp
	G8qX5nmxiw/bRor+7jUu+kR/Pes36Pof8mVRzpF94OUs+x06K/S5lnYxYK4L1eoXzsPLkm2mrpv
	aS1WTFaM04OmoP7ofolu/C6QqCzP0zw4ZJyUXf4tR9wiHz6HCuQiQo+MKAawZXwPr8J+QPRmWrT
	8qozWkx9zkxQxrTjw6ZSrCh3w8COHOEM1rvb9RhhGiJTT4OnlWmsmgDpf2zLSYMLtyJ54BQYrPR
	if4rN9EPp+v6yAAW9AtiwxI97M0UTwm+NS1mDQ3YavXDtwYp21QIsZ+ptCu2AmgGcvP3kjInzJe
	+jSUN8x1MpBlHXV5yvo+4grf9qMoE8eK6ObWTzDlSxCoudc4qFkt2e6WU+82OPzm+AfgGcmq+QF
	pkmtdkg9wNSkFVZL+ZeJoB0gBijyfkUnLfylmkvw9UJfn3zm+kT4U6A5yCTrd1Jg==
X-Received: by 2002:a05:622a:8c3:b0:51c:1ec5:d11 with SMTP id d75a77b69052e-51cbf130085mr181466781cf.19.1784123073985;
        Wed, 15 Jul 2026 06:44:33 -0700 (PDT)
X-Received: by 2002:a05:622a:8c3:b0:51c:1ec5:d11 with SMTP id d75a77b69052e-51cbf130085mr181466461cf.19.1784123073563;
        Wed, 15 Jul 2026 06:44:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:28 +0200
Subject: [PATCH v6 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-2-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
In-Reply-To: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX0DOyz2vsu5FB
 L19wNR6LYmQxDhaJJMb4NailBmRSUa8KisoS2Gh2XMIhFA6oEELW5PFIVuXcbRxK1fagik2hrh3
 kYUxZg49qhiRsjrEDYO9WcYu9q+yWPs=
X-Proofpoint-ORIG-GUID: 3h3GDu6ZUjJiPR5xQ_4EqOOtFy3SJ3vM
X-Proofpoint-GUID: 3h3GDu6ZUjJiPR5xQ_4EqOOtFy3SJ3vM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX8e5UD92P6qgn
 PZi6ecEWToF5bAQ+fviX1dj84CwY7WGUEUyO0NpThL4aMjaA6GOHMhp8D+OAPvMeAuZKDB2kPFY
 JRlXTQEvCTLbtv0167wXpdcLjsfr+wk5tkONZNk4qcLleomOcG/+pzLxplQDOtsBNbIbrYcrMzP
 Vks3t2PF54yhCJcmAuhKj6eE1ABye441itGCpKC/c6zUGKMUCy1X9JL3jeK9pCrjr8lO6kS1ePD
 TlpVtppNnMG3o8jk2k1rqDt6veWj9M13NTK7BVLGw3rXbH+sDBx/N3t4C40+nbQGpf6M9cKIp2m
 /rwtVOHXRj5bAZ9/0zmxzsaQtWuEOaTrfWute9fwRKZQXfSKbRBKuQedFyscDAxWLi4qvVLxIMb
 X1CpvhkWzTWOzSpjLq3F95QKQdjgvkXYhVtFafBKN11ibduzUM9P6B6PKpVgJGFBuxR+ykwUXks
 3ogEk+1JOdE62ExRQ9g==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a578ec2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150136

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

