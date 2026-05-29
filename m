Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B153AFAF9
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040116; cv=none; b=scpq9F3VLLmuuTMuahWGmk6rwAXo80K5kxcuLe9hjmG6sKuhYYy0CZzoW+4QWFF1DYjIC+RWUW5TJHbN5l2TW3h9XmToGBPAFsF2islq7mcxoiIFR0+MZx/x6EMsb+xH3mlAUTi6JqW41boMrzqo42KIwQnV+GOtzwkc9KXPQvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040116; c=relaxed/simple;
	bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEsfmCAHpmavg7UKZwmt+W8D5A9troUUROJsJxM5GB3Ql/SZ0Rjb34kjF6PWiz/wLevDM34yvy3mzBpILh5shiONfyPNUQ8vGPr9g4IYZebPS+inC3RsUZcKSy1ngFOZA8I3tiH0ctO1BvBDd1gzXzPQsK9lnDTTNeJJYJvgZJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avyeEaf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKKIU5Kv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avyeEaf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKKIU5Kv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T5taNJ1372009
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=; b=avyeEaf3WLr9mVrL
	HrmvUOeEEZmmv0zbo6K2GXZ9S6+DK4Ir1tv+kENTy85CjdVPyKsQfgHaOL3ao3U2
	GErFd0URfRd7xEodcbcKo/kiraz0BFeazxx62j6UL1dHxnnrHmcFNsvPWk+Kf91m
	pwn35ccFFCotLIsXdQhFlZo6uH3dNFrWEA3I/D+yOIDxdeZ1S8oUU3whoIxvgVjD
	cZhr9d8oxH9Zx28gxSjjkkoGXigXHrAl5i5HRK27b0UScUsRTWn17TqWy86nFDcY
	4aoWdx17hmQr1o9L2Pa7ss6xzTTvNdQv7rOA0dcjVhLyVSTboczRkvvpSmYFzgM6
	jOhDZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5ty4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so150737945ad.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040113; x=1780644913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=OKKIU5Kvghl5a1jmfp7XDl9VaoteeonQMPooPD7ozZdaW44qviQg3ncBoEjngwU/G4
         6GUd6NeeUxdyPTm0fqV6IbEKRRHKy0r1MiIpL4wtruPjYN1XoC5F1CAOkafvxGN3q1Di
         Nu6lCARWcKjazkhhgj7IMYk1RJy4ZBgZSpY3V/r6H4p01nkvq+hTDv2Y5WULCWYr0FAv
         1D8i7HEjMAFo8re9OWg4CNlaP5NWrcoMQnyhDGCRULDZr4JMt+slbLDGGSAfUrB07ryO
         mFjLIt8ahWDmJvcY7FE+lNMtQAZ6aRS08ToTVhHvgFRvWtoOQRfh3HoAxXNKpAKLxTSV
         p5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040113; x=1780644913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=rzX8V7RDNrMe80gsDf0BEp99XI1QepGTUNQ+lW/2ncfulm9auLfqTrcQcvXyLhLYk6
         3NkRPvkhl7QlEXP9ns2RVl163TkbPAGaYjzKKFIn/rrXpaKwQ9qCPGHpxPcE5TSXSbSy
         ctc+h6OaV7HrjhzK8otdvKb2nbVn3oKtNwQ3iCYttaOSk0nYZ4nEUwOHwzP638jrc2tn
         lNRAyINC1fqJNueVSoEEE41zU2IIP/YZskfBVwtFS6AsNZEVgjZ4TqXsuCxr10VqrvCd
         G7sEEu3pZuuqUUYlLdt5FSlGQGHKZ8jZ+Jvv2IUyyCjqE3kHbjHwvMZ1qfXd55XkBNkC
         U3KA==
X-Forwarded-Encrypted: i=1; AFNElJ+jemN1zR0yM8/T1R4lf/FeUeglHzQ2EOefTOSzFT8lKJaHu+wKONe2Bj/0X3e+Br+u2mffft0sp0q5@vger.kernel.org
X-Gm-Message-State: AOJu0YzuIEdsJwhLnbohdKxdR+0FBw/z5UZ++ONN06IFcMVm5jbiEs8I
	+PNx1c0TkJ2qCl9T3ESd34/0+8tYitKjdTQYuooBk2EyGWJFtw0spKAai/AIv/tCY3H4+BY3eH2
	jWlWGMI00d3Zkpl4vXOAR2P7JaqBhUkFpDVn9EZu7NJFQUCFKr3Ph68RVGc5uF3VA
X-Gm-Gg: Acq92OEDhIYTS35TGYwcLecBP6dtQlD2DdFg1aBloGgb8fNsUBu2t4TOKX3oBgB3wRy
	438/FYTRiLjuq9WV2S2YZaN/iRqAqyFAi2YYjGIlqu/mKpgiYBKWCMhSBtvUcvytghjanydIVkQ
	4baCx690Pcfg9rz0SWQt0vXBtZ1wH+NLHbgJ9kWoyFn6iw7AwzmKXdIXF1EDL+2Z7m6K9TSYC1a
	FwGDDZoUcNIJqG6F0y4olwubzdrfPuOYK1P7ITap+aM9LoE061lIBKXc6cg02GouS7gOFHIXbqp
	C3mN08LtzPBzg4+53GPqScW61kf3SY/1E8kRoZ0AFBhFqvp5NdjnKr1he1KSNd9GbYL2VovgdwN
	XhZLHrPwybjyjNlBut3VoKC9YUHXQaseFW/56hcEoD11PblF4xT3Ba1xxw4RNMgokb1LmNRaE42
	DFBTx7TNwNPuCXBSwVI9wIyH+aF/PRY0U=
X-Received: by 2002:a17:902:ea0d:b0:2bd:4b8c:fd30 with SMTP id d9443c01a7336-2bf20ce71d1mr23149015ad.41.1780040113310;
        Fri, 29 May 2026 00:35:13 -0700 (PDT)
X-Received: by 2002:a17:902:ea0d:b0:2bd:4b8c:fd30 with SMTP id d9443c01a7336-2bf20ce71d1mr23148655ad.41.1780040112841;
        Fri, 29 May 2026 00:35:12 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:12 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:34:58 +0800
Subject: [PATCH v8 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-1-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=2090;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
 b=8ZAMmoJONTi8l/umFhkC2sOa0L9b4o45/2EgRUWWydk6hU5M/O7pGnEswHAG77EHEASth8lTj
 Q9kLskIVOWEBGqwCHMTkV3qYyp/meYN7m9Q+tcD6uyYi0JARnae5/88
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: kD1hCz1MyzOBxjI2iUckXiJhRurMTEQV
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a1941b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vdEEYnp-zpI4J6gZ5dEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kD1hCz1MyzOBxjI2iUckXiJhRurMTEQV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX1ikAYLav91gd
 qkV7MHKgEoY6UdCVqOqfVTQmiNoZ0/0OgMvYJGMeCTAYArFpcRaL17WZPFX22gmFC2m6QdUwxs+
 GH9/xJrtd4Bf5wA+hMZQ3rOggVrytsmil1089AFUx4h+P2lPYqv/eY3pg/lwcj+J40EF8VaXbBN
 mGc2YmajVuycvpDeMs4mlIViBOIf7T5CKeuUec+Edk9CSY1cgHT7lde1SuwU4YmxriADq/B25tQ
 IwMg9eVgJ7zlxr6jLtR41nHHp3Cz+F1QJmUbkA5Hnlmogl571ggE9quI3+dR5UJXsaebTGLhJMR
 ntDe/nh9XCHTZ8jzYX+kt6PPQ1OSBotRi5PdXV1aUiDXc//fr+QQnHlqrW5uFTW6ZaLc45p6Xan
 bcxOq4fn7/y+EQ9HDimiVKfwHfO+ELSViN3QSw9H7oUSZ/maiTgSOlBUiG5UOS1upP4SnYkRmlG
 Cn2o63Kt4NNUJMXfhyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290072

Document the new compatible string "qcom,x1p42100-iris".

Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
that requires explicit enable/disable and frequency configuration.
The SM8550 driver has no knowledge of this clock and therefore cannot
operate x1p42100 hardware correctly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0

