Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D96A3603C0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922559; cv=none; b=jOsG/Onuy9LLPk5+NqTIFDxIjcvBxfOHYjROtmlLgSKMOU97PWNNsyMeqmGKELnSJE8hw5dk4ks6Oc/UMgiZcSUuU3xFjWZYsWZzW/IK7bPl7xWfESmhXUVHvVWyE5jgvVv2P5IQx0pQgR48XdroqQ/MlblvWpT0Ie5ngxw0sFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922559; c=relaxed/simple;
	bh=pFSbTRCJzU6q36Dh8FaRMCEnLAZ/U8kQDE+7od1r148=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lo7T/FveLXG+/e0Pm8k0bELwVnMAVFlB3Or156Uv44/IuX6imFl1W1KFRG+4GFfOpzDPb8KOj1PAn6zWimyWvk2enT5dIr0RkT2do3G78CWawDesqht1vl/Wlalj+9Fy44BGMSDZHhmGpfm70/Q6ELrGD4/yGYMgwgWHsuDlmaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoMrJ3IL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1a4J6pE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoMrJ3IL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1a4J6pE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661G3IHx1504283
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/+4MD3mpODzSWY/mOJb34WlGF9b+ZYiU+CvAZt4d58=; b=DoMrJ3ILkQpfurPb
	68aSgMsXwWYr6UrjiFHU8PhniBKLnq2Q/sOaTHcQ6Ad9mDguSAcetcP4vN03SWbT
	JnTP3u89Vw9mm0nhtI0iE+ggNLpxU0ho5G9802bEEsFUnD12oXelVaeq3+a7WNxs
	34gH6FdhJUNpJYs249HO60fchMWUUTHy/8bPABpSDR4Dr3J99SRLRL9G6Y+VgJCk
	cUkxNLOpz9+IYgko9HqcE692xrISEyUSlPbiqDkZwtnsqkpTvqRYjIgpS+ldR1+1
	+//4Th3OuW2P9AkF0ui/MiaTrc0x4aEF3Aaiu1Bpz3Alfk0hhVA53Gl31EBQrNSu
	xF9wLw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630823g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:15:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737d2bd8bbaso945553137.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922556; x=1783527356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/+4MD3mpODzSWY/mOJb34WlGF9b+ZYiU+CvAZt4d58=;
        b=W1a4J6pEYuLqT60wjLJLBBXHlQySK6mXVzRMtRiKkuPGUC9hsjI5zBQOiASjeSWO+B
         DsSPaKr/ccsiGqJs9Uo4+FcxxYorz4wx0RSSTLgfXK1Q3IkqyRWUuPk/kFEyKaRlOuQf
         9Kz5TzETzY9LCOKN8JmnsSMiNEHiCDhS+19MqBgM3wY6js43YGme1B6ea6g8mTfQDNL3
         A7/E3dAPT8FnpsR7xH33xfnELNaHsFMZHjGI0gBE5klX6HqJqnn5MR7NJ9U0J+b1x+GS
         O6o/GIpg0SVGTHD4G+ZGONZKY0689n84Zk5PWOy6Rq4QE1HR6Q4mn5DGd6YksP9ze05y
         y6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922556; x=1783527356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/+4MD3mpODzSWY/mOJb34WlGF9b+ZYiU+CvAZt4d58=;
        b=XyQJAC4GiBrdclOktHW8xcGODt0z4+x4sYOSl8GNqn3mfRX9NnzP3r7EDhRXiz1tSE
         PAFADzlkHdqE6oYHLAAX+Q+GJB/2YVkkVlz4nRRwnqWuWCgageMY85A4XpUsOgK13QaU
         YHj57BdgDQQ4enaihUM08VM78izO1M7xTDvEGXwoFWjFGf0EARxJ65LRF1dgib2R//Fk
         rNE3Fe62Z4lZUPXmHCWbttbYY9ifUzJVBqxCYNuCyb2IZdMmPa6kCPlajfnd+XMKKZ1T
         t+FgEDj1k/IqNnEiYsuh6uNtF3zGI9NwN0hFw3kwcBo2L1GhqFlYVrcrqODGfsQewo7J
         aCRw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5r6j+3k/PvZEnJ7iqga0sZOatRurp3iFSxrZkC55uN7gmm/Bb5V40Nuz3B37OumR8E58b+1wYyzZD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3abhTMO92zvfoUixyZXIQFwZ2DUYCJN4nRPsGaedw3Emvqg1U
	KkdEXcrT2aWdDWfY81vtJMikaNBOOBFhpMvrxpGKQazUiAqflyR5oZ2Gt5K3YWwLccdlXHPFJfV
	vkILpx5IK2HXNYWyQwROV1AWDEEZ28IIkdFptwpILeWBX/O7O1K6rS+hnU7VImUOt
X-Gm-Gg: AfdE7cnU6euyJSrADprWRTurpaRbWw1Lrpyf2GOBLJKC57b6N30ASy75QcnZnHSmOXZ
	l5wOPNTcXAzazKvuQ/2La8WLvrhQvAEf/3Lfy1j8aeJiProx2I94+5NIZ3kFaCwN86V/gLLgRwb
	M2mTKZy2OheBlHSKuWzuSmvSM0OvufA5Ou97CsDP0PRZhKeWZuSvZOi1OV6BUqgVk8Y8GoTq0qm
	/ZnTP9QDR0jRBEMnRPC+C6B8fDK9ptfGPHB93LOUwYaNoAPU/jCKHasQZZ/N+JKcPEYKl7HHUXf
	t6yMTjifWYymaNCLhcrArcWPn0p7SEpMlNaknuNmWNdy6I8TVWdrHRh2TLOow2hlpO1u1FclI+u
	AjueHNCOcD2RnaECI93V3WyI/IJNVK5H+VCxCKAv0A5baVoZwkg+olf5zkoMfpQBxj2t4VhE2Eu
	dP79CZBQ0hVwcuWv7E2rNeqLFTnZNZivdeVFaiuZ4Uv9XqHrUWeBJ+ujc5RwoP6QA=
X-Received: by 2002:a05:6102:2c0d:b0:737:5c42:858b with SMTP id ada2fe7eead31-73dbe25087cmr915940137.11.1782922556257;
        Wed, 01 Jul 2026 09:15:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0d:b0:737:5c42:858b with SMTP id ada2fe7eead31-73dbe25087cmr915878137.11.1782922555676;
        Wed, 01 Jul 2026 09:15:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm299570266b.3.2026.07.01.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:15:54 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:15:51 +0200
Subject: [PATCH v2 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
In-Reply-To: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a453d3d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bawOQVNTVwYUprhOnAsA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX29CdXW2n6r+V
 6zKyvCqWqS6N+pokEvruuItg3jphI0+ajaz0R5JBVd6fSZFGECPVvfFpnKpq8vlzn3Q/rCBOWQ0
 0p3Z85AvjCdvI3K611pJOtuEibHaXSc=
X-Proofpoint-ORIG-GUID: u-0OUuo4n8F6ptrH89dIdHUeAMDto_js
X-Proofpoint-GUID: u-0OUuo4n8F6ptrH89dIdHUeAMDto_js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX4YeuFiVs76OH
 +APF4QULTnrlyIwKgvohnSKMirF5NerCIkD7kGVlwti9/EcDc3YqthVNgyzpOfOjUCE7HNBvKV/
 IGXXGq8bsHp7xfH4VXCVBEWlAaw2z8ygVws1ODcqCqjba8EV7ba0R0o3L/3XIerS9epQY0bQ+2M
 /0kH9OQbMIQ3ZwOoYaEepbJxVB/WX2yaFBYAk7hNkmAie+q/SG1qDG2KNhi+gKMt75cGPIUZcgW
 EtrqV75fHVg1AZ6e6Tnitw1TzXfPKqLkr61geNWdAz2YwUR3OBJtRE6RLYqsg914ZeMnpWaGduq
 aiUqmMo6dehMlq07UsrNl6HPFdczEpt2+erhPNRV1ayw506AN9babE8GHwuVYwsMA0/HGWMF+wu
 WZSILovZjvW6TpEY5+bP9cT+7NqVFeTv5b9sAe6nJj7dgaIsAk9/9m0w0p36qyPxn4FqtgiRyqR
 MtqBaZ0cIzN1Hp8GSvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010172

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..04b05b8195c18ae9fc1c1cb9d3c694d819ea88e5 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,39 @@ patternProperties:
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
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -137,4 +170,50 @@ examples:
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

