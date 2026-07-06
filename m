Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3863042CAE3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341098; cv=none; b=Wv7duswPNfOgwlSZoD+oGXHaZ1lKoAuHwI6vLuoqTshJeJBZpb7sV5UMotPS/JKFzOuhcxrxTSMoM97GXFhpQGRCYxRiPGKXxKWWjXFLQ910FGUsVAZDVNNVG8WQ7xMwi1jZs/5k4wxhLZI2XsoJi5qlgsaUhNbotTmMJv4HUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341098; c=relaxed/simple;
	bh=wcaDAcJbxEOLbIDYL7Yv7cDA2DO4yoqD9dV8JvZuO34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7ixx4gY250OLym8IPR8pL4WRKSbws8qGFiSv7r4Wr8Waofhd3gUgXk0jkSRRJZP5/REgkPPmdc75P9BDkbP2LktiwIGAjoF5MFohsEY+UdiRe/y+oRr3DAireDoARtZTsCBn6+JeSPjfnObhTCR8x3E7E4oJUEe31xG4vWM5NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9k/eB8n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJIkRm8Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9k/eB8n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJIkRm8Y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxQte218865
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IknsrGHJP1iQr5TspskyHtFF58EhBmo2rNT3Q8qunWY=; b=U9k/eB8nz7NfX4WC
	A+cqPIHmGSKR7aBvDKrkW9SqKNDvLwWokaSRgnjbbXeBFAgVUqCU4xAocrM64X8T
	jfr3XAwSJu/PYfB0mVdYTKoHuyFlo7Bk79uuOgRLEpIruU69wcOxlca7Hyu/NRkS
	soVgLiuZ7EfqNCDACqBYFkufs0MjyC/cof0gmdfxUeu52+h0K2/F2uOMiy0ZQeIF
	KwapRMp0J6uF00ZF1WYB6HSJEga7swR2WtVJdKK1y8SJ2aIyyXeQtU9P1BugQM3K
	Z5W9IQklSMt/t/yJGPFhNkqpL8ol+eJOv7dnPhzKVHLL6Y4DNlmb9KvBxdWWE2qZ
	0Zfvug==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs91rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:31:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9692d7bee20so2397973241.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341095; x=1783945895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IknsrGHJP1iQr5TspskyHtFF58EhBmo2rNT3Q8qunWY=;
        b=EJIkRm8YPfV2iQYvZViFJOk2bUYD6TmCXWjaIjYf1MgnOtsY9E8NEmHBcqHPHY4ser
         CjPXXFkS1IV8jDpbos/HJV32M1yayshRguG/0tQX/fAfvZcH1YySNYkFUnvcXANMb9ll
         nGpVewe5bUq6cepawCQhr5OAkgeD7fW+91GfUlkBZiV58DHfCXz+uSZ0+BqAVTJNuy4C
         GLQxfjhIEsEnusOHEyvu6X0gOARNlqNbtVL+NIJj0LXlzIW3Kl86bMEO98MrBSWp0Q7M
         xhvLp64OEKIF7SvwN/VhlH3b0zQTOh97o6Qwp9ceXvr2ci/nEAMGxtwb/BVH0tXIVI1p
         uThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341095; x=1783945895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IknsrGHJP1iQr5TspskyHtFF58EhBmo2rNT3Q8qunWY=;
        b=ehEPQNe+4CzY1/3J/yzJsAIdYBVfZd8UJl2X0rTWM7UIuZeV87RBLQZ5AHmaGfcv8l
         Scj/PAMtdaDr4l4x7VApQdF5iVklc4ny6IAm3x2R8SW3DVMz/iD0X8qBvjTpJGtm1WEL
         Hwu6Y9jkCgHbIaDFSMYQsNFlEl5SK+KeoH1WSNQkha0x2FNWlo20moDRHzpM8IDpfGOk
         mjHHSQawERTH2Y+MO+BbSjFWz+hnzG9Yucw8enWtcjAtV77bsohFD6c3oT+aMNBSGOKm
         jLskcYYHuyi8cbwazyvDFftNDtyzePl9JN8m4FxteicnmIcKm1N9WTJ15Aj3X36OFUGg
         NI9w==
X-Forwarded-Encrypted: i=1; AHgh+RqvzuXFUcmInL2kld2bQFWdzQ4OS8pqIlSnVduiSla97auycb8Fb6L8d0bGlc8vvKa7odiVN+L/5rIj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz556dwtAum5GKdeK0mZ228p6t/Ive4s3yvOkWzrks2YdqwNXkK
	GHzBqlBzgFaWOP2L//AvhVwOspsec/y7QHTz3HF7XfIXKfVpdB2eF/l1vNteAL7gZEXoWCbUFJL
	Q24llbOzzzeSGZjcxlQ5CaREj4f1i/YtbN6BGdxpjfiAELEQX4VYM8KA8mC4ihlY=
X-Gm-Gg: AfdE7clR5YpVJJQhjpLrIm6q1bHnbcAb/3h7aVOc+zWmIGsTYu4fKbLuc+5Tm0y5prU
	Ilr5Zyl2moPIDQFSNEB+4ScuscfU2toRiV9Ir0c3wfNrv/PVpeFBt3pRPm4U5etgPVGyd+YIFK0
	xBj2IJINbMMiM0QoVbCpru2rSEODt5fhnsyE/X6KVvC4MClFh2hnKXqpkGvP8KD6WecZHVQMiib
	5twLzJO2BZHNcDkWaIDAQas2eTjBrLQ8/j1r6O7aoty3z1NrSt/tSy+1ffrLh+J9xqSYGe6N8Sn
	hHljNTw1e1NMFaNQavov3/amqJ1iGyT5Ot9Y/NPP5FxupWcfyUhUT53wCKPfmcCxSInHecfNHP3
	EAIdXc330Tf45CoYaqFfuvhnGhx47DBQFX65rJFy6
X-Received: by 2002:a05:6102:50a0:b0:737:9003:ac54 with SMTP id ada2fe7eead31-744b7855d90mr153477137.0.1783341095413;
        Mon, 06 Jul 2026 05:31:35 -0700 (PDT)
X-Received: by 2002:a05:6102:50a0:b0:737:9003:ac54 with SMTP id ada2fe7eead31-744b7855d90mr153429137.0.1783341094909;
        Mon, 06 Jul 2026 05:31:34 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:34 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 18:01:05 +0530
Subject: [PATCH v3 1/4] dt-bindings: regulator: qcom,usb-vbus-regulator:
 add qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add_pm4125-vbus-reg-v3-1-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=3484;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=wcaDAcJbxEOLbIDYL7Yv7cDA2DO4yoqD9dV8JvZuO34=;
 b=2jQ/lO3FvhUcsQ6YtlYpomVEr/QOxkX0m4JtsAFYOJdVLiMyp+w8lmsxN2zOa8l9fWF1lfOIQ
 EymZeMQUJrNCKKd9RpYiP6zVWek0dTASuLqfe726nxAOrvIo4MJjcqh
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: Vw6U5gWpImdwE1YucWnxokNmJcO14HZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfXyqG7jU0xxiXy
 uNgdoXaMu/CfsZVxAjbzMCvmXB9O2RTrjmnemBigugXI5vhxkFA4sFKPqEEb08JAfhHu6p9w+6k
 FnwjqUsxlOhZWaDkdLI/2A47GP94aMzlfuZgMAubjyryzzPbCPidn6Pk3iErUju9tFGVX2sT3Mr
 bH0RkJYGXRGpxOh3i7By2Joveh5w9RNbN0VndVbgnAcap1wz75yvFIYCWsIYXlcCgeJY8L5tZgY
 rSwlZi5l8kII9OEPPgcf9MfD37y4APJ3RTzAoTqmZ8UpiJaXGQ/xtUESe96d92r8Y2SeHjcAqE3
 aJHPTMJAquz0qgpd/6zfz6SDLfG3OuafV+zwqWJUNJXj5RcR5Npzae63otvNfmxDY7sGe6DGlNZ
 xbl6XGFnJObLm6pIYmjwPDwpfsSGL/CpNlL5wehwcypK9ITR+0L/vUJklRRreztdi/b6AoXMPzN
 6qVLB1yTYWuS3RBHtow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfXy2tkisevsupj
 V4ubYptOxk72OthAfs56Gg98KSuOjKQXgKYzsjd6Tok7hfZCARciXxSXIXw2cjg0NX28qAMll5t
 LVrTLc149rwo9GbE3uRnRTEPbvuCyFM=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba028 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nDMmG0lKkFKFsl1axvUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: Vw6U5gWpImdwE1YucWnxokNmJcO14HZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060127

The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
It uses a 2-bit VBOOST voltage selector supporting output voltages of
4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.

Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
standalone enum since the driver handles it with its own match-data and
register layout.

Make regulator-min/max-microamp conditional so they are only required
for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
max-microvolt instead, and update the pm4125 example accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a495837fedba026669de97350c566..024b34d0eb1a694b9e0ff530a35f787582caa425 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -14,17 +14,21 @@ description: |
   regulator will be enabled in situations where the device is required to
   provide power to the connected peripheral.
 
-allOf:
-  - $ref: regulator.yaml#
+  The pm8150b variant uses an OTG current-limit selector, supporting limits
+  of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
+
+  The pm4125 variant uses a different register layout with a 2-bit VBOOST
+  voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
+  and 5.0 V.
 
 properties:
   compatible:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pm4125-vbus-reg
       - items:
           - enum:
-              - qcom,pm4125-vbus-reg
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
@@ -34,11 +38,35 @@ properties:
     maxItems: 1
     description: VBUS output base address
 
+allOf:
+  - $ref: regulator.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm8150b-vbus-reg
+              - qcom,pm6150-vbus-reg
+              - qcom,pm7250b-vbus-reg
+              - qcom,pmi632-vbus-reg
+    then:
+      required:
+        - regulator-min-microamp
+        - regulator-max-microamp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pm4125-vbus-reg
+    then:
+      required:
+        - regulator-min-microvolt
+        - regulator-max-microvolt
+
 required:
   - compatible
   - reg
-  - regulator-min-microamp
-  - regulator-max-microamp
 
 unevaluatedProperties: false
 
@@ -55,4 +83,16 @@ examples:
             regulator-max-microamp = <3000000>;
         };
      };
+  - |
+     pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb-vbus-regulator@1100 {
+            compatible = "qcom,pm4125-vbus-reg";
+            reg = <0x1100>;
+            regulator-min-microvolt = <4250000>;
+            regulator-max-microvolt = <5000000>;
+        };
+     };
 ...

-- 
2.34.1

