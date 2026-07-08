Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA118EFD1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520350; cv=none; b=m1aJh509CZWH+CsW4zcjMVj0FVvw07luKhY7B2tGvg2FVpifrTmgdfgl42SXwohhkll8ot8cJmY8gqShqQCOoY9YceDNAug6PZaBrIdnVGXHdw+ixCBseReuT/SQyXidPOk1ryXsHXIZKTiiISXXWEzQyeyIY7R4314GXMed1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520350; c=relaxed/simple;
	bh=A9oiqMvMvHneoJV2ZBiozRHMKsNh7mwKSxwv4q8Mt54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUQwer/QzaADIyRtzB/82i5M6TW4+nB2mV+Wu/LqxLS1kpXigaf2pu72pniXHMx8OSKLsHOSzGB11r+e7ZEhrWzxl6ti4DYowKzH4VMV0j/s4wkhSx3YOogc2YFpsmtI5/nbxBf3/tmBhrC+bh2fc4264IlOLk2Hqsw/oXh0qKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owrAu1gj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4WBLyyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owrAu1gj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4WBLyyp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3NIn2753549
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=; b=owrAu1gjdGnPQkgP
	D732Wx4rmkUUSHa6KVUcYJORwChWv/exGbo+IQ5fTn26XAbHBQeIYfIwvEKZt6zk
	s42eRNSmdzLSGB+vlaOI2IEjjVdiJUBdwNq6rsk21E0sRMD1MdSyI63/mKYoeLGC
	VEnFLj6Qt99KJGCaIt4oR5ktGbPFNOWfWQC5FQMVbRxF1zRQNR/LKYEwBDB0yVZi
	bd3zRMyfQ3vShDeg0AMmQRw6vgtpEiODQ7r6QTHD0mX0JHJynurQkhUbWO1RDjDi
	5kyHL2CvE9mMd8Speuwy+hfGSVJQv5OzOjVJP+y6C9x9FS4eB4RYk9wLXAHqOcqn
	J8xXQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hj2cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:19:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e53b8a302so81291685a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520347; x=1784125147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=;
        b=U4WBLyypzJSx4DNEYQFmH7KNJlv8Il5VDp+eEE1SZb5fsYd6o1ZZVXOvMYO6XYSk+d
         AXBzSVrWFet4EPl8W1UqG60O7+deWuDgGlMa0Z6pqH+H70VgFMwHxgAtShN6aS62JQK9
         MGv2b3l2iYiDfjzfYPHj7gPwML3E01TMQA4XwcT37ZnQ6LKYtmYpmtNPYXk0HYryDHyo
         jEiUJrnerN8HB+fVUWdfjGA2BLUE9ZoqEmo097eraWwAg+E9tCX8/fldEAMiS2FGg0Hi
         hKw0+RbDiC0ebxQmWaKGr0q9O8x/mVqUWmPvmadvsJDfNpwodh7c0SvtR0AICSjfqUSY
         vHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520347; x=1784125147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=;
        b=lvediCc4NtJVa5mxtdCqjl0nBCAX5kkbPC+wX8G3rS83EiwviQdudSG0U7bfVZ3US4
         aXXHwqCXciPv2nFETqsPcEgkxBaT6slbVOViiow1j8lZj4QcSKZ+RJNwCvgZte0rpffc
         1jCw7BoErR4kCmaGbHRWNgc0Ce+K8XHwkw8njy67Ymhr0kweL7RimrXlgAWvrm9QhFGl
         yN+R0/k19zCi2nbJnpv/dsJAJfmyIuhe488Q5JDaTI8YvrxIv3hGOKW0CwbST4OKHemI
         PRBl+Bz6HCVj3gUMEQU53SrkcoJQKq85Q/jzZzDoNerzttzNawpTPXlDLw8si/a79zZF
         DdRA==
X-Forwarded-Encrypted: i=1; AHgh+Rqi/KN7H4+zmEJZuVpKiGGGmqXhdcjGO/GatfKgdRLHyCjAnxIIUiOVjw/TNoMuqtrNjYgpyA4ZanoM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LeUJD8CPdZEFaI/9s6lj72ZkoTokRnbx/GBHo5Yw8G9ytl4b
	PQfK3mKkl0sQGfeC/apYLnUrN2qpSsnbFzwUVgMgShkRF9A8a7GcYF05TWDkhA0dhNr8TnE3N2V
	Az/nfKvm5HynQHy+U3jwe2y3BhBX7oMP17HIjn86tXn5qNWcH1Haq3ddGwxNXfGIv
X-Gm-Gg: AfdE7cltak4KRAWrNhCQ4aBkmtZU+uDb3e64N1kW0M/2K09QJyBTQ66umF94w+leg6/
	fCqWWmlWOgwS3pDVlxu2P5H3dTeZM3z0dE52mv99E20YlK8ssRq/mrzVdsb8X9BqhFHCxf3td5g
	5QJGI95QMHZ0MtXjiaksWMckWCZFAneGA18tIKd7aGtvEBiQFB1psQul3oa0kY9Kj4BA3tWlvkq
	0VIS6KCxYo+DvUUs/Emsj6Zeq/FFR1QA2Uj6cVRwJqiQHdT+7xscBwAAjqTrLtLk5uK67JJ8r5g
	RJ4Ceoa2Enj5DidA5tV4BZqMW4Og+tw9sbKGRc5wiQFO1MYa7vJbskTrnXtw2y272C/tddEbZ3D
	8HhdjlU6BcQuDlYPqxWrRDAcG2T1720EcPhkrz29060wSRMGbohO/VyqSiT7z3ygLLQn5GUgiHn
	wtbwBqUJHRGl8vCM3Lv2SO0LeK+g9F1jRb+ta5BhrSyk1OIvyViRw8vgYqdLlGUcg8TWOqq1VFC
	QThzGofRr7jP81V2kR7
X-Received: by 2002:a05:622a:303:b0:51c:7b12:6007 with SMTP id d75a77b69052e-51c8b57f94dmr27120551cf.83.1783520346901;
        Wed, 08 Jul 2026 07:19:06 -0700 (PDT)
X-Received: by 2002:a05:622a:303:b0:51c:7b12:6007 with SMTP id d75a77b69052e-51c8b57f94dmr27119771cf.83.1783520346380;
        Wed, 08 Jul 2026 07:19:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:01 +0200
Subject: [PATCH v4 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
In-Reply-To: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX9HZiQ+fkX/A3
 XJn1top2Gi+Dxp0igxC9OonQOOy91lP7KqjuLJJkngGB6iK/yZvN3UMuBcm+efyPRqqK1vTBdOl
 vNet8VFQbRaS8DR61+6P4AM2gjt3CyeXcZTHHEFKlvY9tg/6azuH2wvXRoGNrm8HqnTfaSgRYoF
 ZbGbsbaqmi2KQUXuBsM5qN1gBzxkjtB2Ma3B6s3KkM3gpaFeVBb0QPK5jkCujmtEn3Io45yrDE6
 LzHLmDWJs1QkWbfqPSnR+kRJ5pA6CCuDXxL8UHn8EgKXPv9iqXDF5OJptNtJoRcuOzpTgNOYJeY
 C1zpyU+rqUcTkgLF30prKNHydyD6zq32FO8maSsVxuSOm5bjKksPjsARaZ8eW04hDz9YhvLZaHB
 pc0tcBxxMntUQB+f1jFUOYl1UTxUBLjPP6n/nQZEyok+yHohIBmSZauYAdDuWW0wagbyrV9v1nO
 XexQtF5OcJrOyOVhzvQ==
X-Proofpoint-GUID: REOAPm0kyMnWe6qZarbTbxS1Wvz1Uli9
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e5c5c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX3b7BHOvicGsn
 42IAwp/fY1Qhr2Tljx/AJGxFkoHqpYB++mNYKo3CaSnwtpFcxarNpBcG5jWaJ5+DA30pb9kl3sf
 FP2SiccyikuFGeeELWAyQepuFGVArZQ=
X-Proofpoint-ORIG-GUID: REOAPm0kyMnWe6qZarbTbxS1Wvz1Uli9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080140

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

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

