Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366E0279DB1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762736; cv=none; b=nKyJvqzzJV6FZgj+p1E8EwH85pVDjpL0hbFh7jJMkbfZ1VDjf8Jkc6NKTx/D5mBEovKU3+VqdQKmxHq1xyd8hw43B94H1lKmu5VStlYAGY8vHePjPtJFAdIJ3GlwreVKZtXUMTBJGLndtSVNcCjApt3XuZEzwOqbFMptJRH0co8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762736; c=relaxed/simple;
	bh=t2q3hueHHFjC6M3y4vZ/UbqDmOXn3O/w1GSgT7yLWXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmOrBrcbipArIN4jcCOMxDhvelUCCG7zGYU2mN3LyOH+b1wnfH3TSIAJni39suIQxuUQ6j7E7gmocYRTTSRoUFMw1fMZoZqaCKqrXMrzko5Cm/Z1WT3stZjDUtzNtvZ/rNw38crn3bHpnchqakHkpQQrpLAEVBvOcwNgVg0sHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQVSOeVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H29ro2eJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQVSOeVX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H29ro2eJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGJp6d3447809
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=; b=WQVSOeVXMgnFA42v
	B/p2m8zTA7rgwtzmAnRBdOh2j0uj1nVmtFX59WhKYE9UZxpnLJ06U0vCP8OAsONV
	LO4/gX9NrUC3ZaepexbEdILQ8XMBzC49QMaHPjIeREOI+xijpce+n9CnYNwX59JG
	Lu64B5WY9k2tLTj1JNhAUTeaZ0yD37IYar4PQyfZwD59a3q7i8m0wbMSzP2xbaFl
	PZvIQR9J7CGdzvGteTnuB8jNjkjaaZAIMbXtQuvIvnPgcLCoZPHZZubG9m0IRPCK
	N6LYOV8ui0OBxk1xpuc7BXhKclKZqRMDJtVpDhMqu6ULuY6nPiAiCl/rkPvYNF6s
	GDlvMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s309g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 19:52:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso58684085a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762733; x=1783367533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=;
        b=H29ro2eJz+r0MPUydCJXRYzmhgIm9FN9XMrpcub7NvDcgrsOYrKlZj5eFctaj5Fu0E
         KGDjxojWJGsy806/dlRMeyOgx4cfJ1LUVzIKFaKMxME/6kxk3SUP0KjYFi2eIHz419cI
         e3Cl5/yPDCHRBtoSf62UIdd97RCYuXF4j2hD2vujG1MTX3RDQGsA1VXQS8GWJxTnp+6N
         2q9tWbZEi+4Qx2k6qzK6sON44uG8u0p5bp7x94u0jx88QcZk1NuDZzg2A9gab9xAAZec
         eQnAqjrYRIB1uRxqTX09x2So4EqX1nQDFPMRX4dzXY1QSvRPMXG0HK8J4P6RSVJhGkxv
         eF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762733; x=1783367533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=;
        b=lUQ7kQzxbtgveVrqTal1OIbp/X/P6pDKV2zRbi3rmhI7Uk8fPbCmwnKWgTFlJnofyd
         dljoIYlfNINkrSaCRH0jiJuWoDZ6qHKpQOULGHfULeRIM/s6CzR0qzvsQxyuesuCsrvB
         dyVRKgmgtI/4bUy59DJ26/ajq1CSSZdslndjfwjhNICKOeUV5JIczgQCjBdhgIkA8QAR
         Y3n2o/0vNMIilt+oB1GiIpP+WvBI0W87pxaQkQouH6WSYldnoz3U0nvOsph9ACTaS3fO
         oh6J9aIvsGQhOU2mLw1Spos014syMiAKPMIuZ4J4Km4dOJjC5EkXlQB8CxxKy42l1pK1
         cz3w==
X-Forwarded-Encrypted: i=1; AFNElJ9nQ9P4SliDVFPAQYrBZxE6AbZVGjI41nb9BUQmz5OYx63tcxfcdJpH36JGcR2HLNtIck4GiSzV5E/i@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5N4KIhZ8OMHdumn5dUqLXHYknpHhX8SYp4j4LldjJd21RgS50
	xcQ+zP6d/H0CklFBuDW2B8akKQvD8oek+nTjp/HNCkask0lVYHkiTrt7mLA+ctFjczu24MyrWqr
	8MEvuJ8iSj7SoUFTr3JAywjvSF1fXMn9bkP1qCm6BSn8661+GC4CIlEDpbP7G536N
X-Gm-Gg: AfdE7clPS6m23SJfTQWql0BbPi8NAdA8+GHX3gj1bw+raX5R778AK4aW2DE5jLjRVWc
	6gJo9mLZF96nw78O8ohvd0PStEtnTkrK1eRe7rCG8VRLnEtLWshsJlARLxlHgk000/WuE0g31co
	o/JPKjDL/aXKRrlEZ4zrMo94ZSqwrUZeLDbAL01Z6MfNx3x30mryuH53u9++OqNLS0FlrM2BrUw
	Djp920RjMD7OQ3GenTcPPp3x8fUso1FA0GR+8HvnJ/jsSaTaN2/25gTgUYUFgMhGtle8wSI0NTj
	ER/1X7QeCJSvKnpyRh3joBCWtN/KyBrVTYj03qM4NDEpCmlcRjP/AD2h0um1CCEdKZmLisTkCmH
	eD+znsXvhbqZKhrCqKwzWOOiurIiBXu9NloyPvq2nOYxDbMNA2RDdlTnESaVv43mjyFik8pHbj4
	N7+vdHKzBOc8YnDDC5iwhwg7N8DQ21A/QSvqr7mHTSyEKjrf3Miy5P+cmOiGyJnnPeti3jpW4F9
	4MOCDNN7UQh2KCPsZeB
X-Received: by 2002:a05:620a:1d01:b0:92b:6805:eae5 with SMTP id af79cd13be357-92e62818b40mr152195985a.66.1782762733278;
        Mon, 29 Jun 2026 12:52:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:92b:6805:eae5 with SMTP id af79cd13be357-92e62818b40mr152187985a.66.1782762732482;
        Mon, 29 Jun 2026 12:52:12 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:11 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:52:07 +0200
Subject: [PATCH 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
In-Reply-To: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfXyzM66txzIX9w
 pJFRVNhCo/s6XCrvpBQkiCFybxLCpyQzXug6irBR9sjaw7CPMMmp932z88Bj/0Q8bYLBNexDyVW
 AT1HPyhmTh7kOmQkMJfN3I9Vjxe/lFg=
X-Proofpoint-ORIG-GUID: IxmuEHXW-svPv6p5-44Ko862Ocoe1FMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX+W7KMJO6FQlU
 Mp8A9RC4/bHDq57Cm4t9cvnxvCvebF5QL+/9V1dim3pQDJZTEdlrziaUNnzxmfwpK7pQ8GtTC9i
 O/XVQVVExVznvA0zDb2NKvrAoBJbNfLTCLdfFUhoGVRv1+jYBBsA6mfDODczbi7rxn9cZnDdxaL
 NsuyHTzmck10pd07xPSS2OE27pLf8jl7hRD6WHj6rCliHCTaWqCxgq4dc6sGMq33kzsBZIHtH+3
 e5et9Wx3oz1tHwuybtT64l7ZJAk9IsCRpbByHEVcdMWL8ouhbOrPUMVGwMnNJ6X20RKz1gN8Dee
 ZXVtsnR5qn2ZQXzO4zjeU+lYxs62Jri5LWYccVplZV3wIDkDBxYu7Gu8nw9qS7x/xuB0BnOJ9Ba
 J9K4rpCmU5dg4zmCvla5t+M7SQzDNepH+AvvfAA1rY5NUZwKRIAzLLXC6H3qq0tYZJiOGcITWcK
 EsrRhh1YLf3B9frgxHQ==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a42ccee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IxmuEHXW-svPv6p5-44Ko862Ocoe1FMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290166

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 83 +++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..09ec140c5092950c54e1d4a55f52e11e8dd7b0f0 100644
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
@@ -84,13 +117,13 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 3
     else:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 7
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

