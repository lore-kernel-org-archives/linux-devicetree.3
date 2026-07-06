Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D6F42CAF1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353005; cv=none; b=k/L1yMtc68PCYEBAeXydWb873n4dBxAkmmc3cqSz/r38fqS57AaqjzN7qLbYKpZqVjkowS3+fJK3VtwbKpB1uNngRCsKti0SI+XLWHOOcT4Wq+/iN0MgyRmxKrLnr993h7ROKXNn0Den4OJbL2bEMUR1nTtV9Vw+nIc1k7y21eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353005; c=relaxed/simple;
	bh=ILYdIx3m61dAB1nX/VjGOC/8TSgyHp5ugCUIjXo5OaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBPHT4PHfX/OMb5REVG5iArYa/mN28oe6qC5/xdFeoo/2CS0XJ3KLOPDnvvFgcBNBj+M98oy8sri40/cjuFB0Nli3w7VzDmPDQjVmfyopfh241zOI+c2mK4d+odNWk0jzABN2/1WFurFOo+I/YAlsxfu3Z2MhcFCzLOTMv5BEhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6hv2QCT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjaTPug/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6hv2QCT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjaTPug/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6L9981547
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bFesKw1f2QCeUZxjTiA588dk82SKORVLapcmCwPMo2Y=; b=p6hv2QCTm3SheoHU
	SeVWgDNLZtO4mDf+Mp6sBpbC33rg2jrYvZ56Gu9viat9JLZOTq1/VB/LSg+Jy0XQ
	SGxHWeCAq96Oe9tIlQaHRkaK2jd0NKqO1tilea7XjtaRVTsyJ2SoRg5GuMhALasa
	wdyaOV/kahW0QHx0edCg72pCxiKSGW4JFu+ze+ZDwCmqRHroBQIP+NVDc3u6RvwZ
	sNcTTmrYoTCxNpZUm1mLFVqEcwQUflg+sb1i8m4UCOyU4TuY2rRffUlxKswcxMjo
	DxH6D5N22vGmOWW0S/r9Mr/bMc4u8CpEaeCmR1ghpeH1uLb85/D+XRYf3q7LSC2l
	TQ573Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsrj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:50:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e632390d2so589076985a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353003; x=1783957803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFesKw1f2QCeUZxjTiA588dk82SKORVLapcmCwPMo2Y=;
        b=bjaTPug/03TWlM7XGyX1I4OojDy/z/OqAUnsKVrOX2E3T1FfY2o/wvavwY4kUvncgK
         kR2k4+UjSYOKeG2zUSqqGWGKAt8VLtmVAE4zZTOd6EpM+6LkHFroQIhxdYfkvX2SZ78o
         8X58sme8xhwcg0Pg0WQIGXc8fbdpy0EKVOm4ryCvuu1/xV2HHKvfh6Ldr7RAamokpy41
         85Xv9TDR/p6gmQ+3yzQjzQJRXM+NUVqshWdPEJp48V6C22vAr5gOQDNCHRX60UV7s8IV
         sfKk8iCfzExqki3hMpR5ROq1Q2ZAWAmoe05nVpzPUkW/ReplOKQfCPlvHowHUIf6PRtL
         dyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353003; x=1783957803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFesKw1f2QCeUZxjTiA588dk82SKORVLapcmCwPMo2Y=;
        b=qbyt4N40AhzGb4IuqcqWRtUvUYSDW30PllbHz1mj3w1OiYrors8EOPybYXFgkDso8U
         uIJnEDMWMaVXj1eak4hZkTXG3oQiBi/wV5ZIT76ECjD3P1sy6wTGF9lv9NWk+zGQexBJ
         L4vibyfwFHRg+r5WohH82jqT+p6jSMgzGu/7bs6jeo0pKzVd/gHJpE7QuWzX1RNBZ07C
         0fY19IMQPh3DWpSwFZ/gf3+1LziieLmHSGwHVAVtBORGKYwXT9Q454Tez5EKx21ftnOv
         8A43ulkWp27gQD6vpyvf+olSk730RGVpiy5gb44gWkATcA2LiB2r7hKiQ7oBJCmbB/fy
         yCBg==
X-Forwarded-Encrypted: i=1; AHgh+RryLjlm+RPyXv36EX+egpmmXIVTZ3LylAfqjH/hUfPeodz6QJ6/8xSaFl5ZfoKGkSUuKBIeIHF46pRT@vger.kernel.org
X-Gm-Message-State: AOJu0YxhqFC/pl31prB4D0/NvbLDY7BvpwR2um051Vt4+HMzJMzHUh9c
	lmx73JGhPY5/keki10nP/KLBzFXuaiQpiYyPt8NTcnfRW+ndFuG5CBD79/5A2riaXzHvwst70Zj
	odsrIME7mKjpYNjMcDPXGUK0lX+xcMDbCi2L5mc+TYffb0wOGmERxKU5izCIpSdWH
X-Gm-Gg: AfdE7ckCFb6XtfQ+kxLwOtpKeUGWZ5NYzu/drPAf+G4148ZHtar3D9CJSj9OrtfHaN1
	Dgips6EsaRQsGfs7UWzJrUonuZM1Vbu70fnbdQZKhcRFyXc7PlfXDKbnCbWomeVtma7mLqjskaO
	ZWttevjdeN1WI5G6z96FdMhEK28JbV0205aBqWM+h403Tw4Pt2lP+ftwP5rzwixvR/JYWeRTBn0
	C2WP1VVmN7nnAWRTlJqfcPOifTkv15ArvbKq79Ey0i1tw1hA+ytCfVWieoNVV2fXcBtxGmos5Ii
	ZOeVtFFZW3dIoyTkosoPMrp4Z4RwFzd5MUWH+vAxLBwt306ASAjdVDgkz/j2bfH+SdEzuQK/ZDu
	fMVqjY4VjYvqwLfl12ahjBK9kyEg3Vdb3YIR9KT+staV1qMTu8bxlITPTkgsg/77x4ozglJdorl
	CV3/UfZbxvFwg8UWq13P3ubXQNfmUeg4UEaaqqmf8gYmHgkrkYDnb2BflcOaQ44ys=
X-Received: by 2002:a05:620a:8015:b0:92b:d4e3:1f08 with SMTP id af79cd13be357-92ebb60a9fbmr144506385a.55.1783353002843;
        Mon, 06 Jul 2026 08:50:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8015:b0:92b:d4e3:1f08 with SMTP id af79cd13be357-92ebb60a9fbmr144500185a.55.1783353002233;
        Mon, 06 Jul 2026 08:50:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm801997066b.37.2026.07.06.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:50:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:49:56 +0200
Subject: [PATCH v3 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
In-Reply-To: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: maU5dzajAZ-9VbC0o2LdCHUhUKnn101A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX3RqbjzBU6B7c
 z5VnjIM9pFnd+JGdQ5zyQAuNnmrBRYPfuRwhme09irec0EwzN1MP632KBVB+w13cjPlKbtB9u88
 VsAbgTnLxYd7f73QN8F7F2wkCEMvbu2/kFTw+fLbvRuEqOMX2ahDeV8f35vVEJzECKsKVNAQk5V
 P9G8nN4zMo34Ovd73pvNWiiTwfZdDjFfJxQa7lvJTHS29L2tXUtrfc4F/D5dGegykCHd6qEutxL
 Z2YI4LSMO5F55fppwnCtaJXohYifco3uc101iO+Z5OWNlwbs3m7jAC1J3xaRB6Ei2CP4ualPLoO
 cV70Ia3n+Z7dKA6Iko+XFAhybjsrJ4yRjL+s1wPoWiCg207BIODrlD0hZPDbIwl/lrGsFh/CaJX
 THWWsfSKelJ3RJ55nK6M+7cWSDNKvlyHCeg2AxViijgLrMP/kUcRlTFExCN+kMUT4OaOGywN4MD
 0jpLvTq02CeA9POyU3A==
X-Proofpoint-ORIG-GUID: maU5dzajAZ-9VbC0o2LdCHUhUKnn101A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX1ZB1qDem3Xdc
 6MH65U4+HrteNsoy8U4UH263I6KoYY3QfQrklri7VQTvQhVmh1YxcyyZpSpY5P7hX6JuL3jjMGG
 53zclJs2i+IfVZmKhNliM+wr+kQho50=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bceab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qHk1DQmvcQX4ZLEpXeUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060161

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 104 ++++++++++++++++++++-
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4034139e3f770a1035208490a9436bdc33387279..dccdb1d9421199a51cac5c7f3f7da503caa35622 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]+$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            minimum: 0
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
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]+$":
+          patternProperties:
+            "^led@[0-9a-f]+$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,16 +136,28 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]+$":
+          patternProperties:
+            "^led@[0-9a-f]+$":
+              properties:
+                reg:
+                  maximum: 7
     else:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 15
+        "^multi-led@[0-9a-f]+$":
+          patternProperties:
+            "^led@[0-9a-f]+$":
+              properties:
+                reg:
+                  maximum: 15
 
 additionalProperties: false
 
@@ -149,4 +201,50 @@ examples:
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

