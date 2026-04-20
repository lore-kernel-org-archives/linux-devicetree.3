Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A6B27B32C
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667456; cv=none; b=DQlngv4paep93bQ0yrp+xd5Rd/asRGQ1RPfuUk95//0jflhPleFbewuKX44HYM2YBGTa6e4G2euxyJ5R2gxHrc2AtaFim4NXjtTh5XEXnkkzdSV54IzCIhIEUQiZZEZIosI96K+19HCsHCWR5y7xtARJknjmhCKMIkHIPysaRv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667456; c=relaxed/simple;
	bh=s6pdxHoI5hvCRhFDkqXtAgC7HtCveanbHrTod1f/yLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNzBrn1+9CDnLq7eY3ii0SwUnpw9ppGe4ScZNoSOVvUbG63kQFg+Nc67v8eXuu3Gxbs4T+l8gjnjCmyEGz8rB61TsIpToPDI/FlqXsruHP/MQ5pePyCehj+OUh8MBR1vNlfI6oUONAWCAEHy9gqcrKQPni4BG+NwCbiaZdrY/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQwdBXjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/J569I4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQwdBXjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/J569I4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNsHmP2428116
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D7K7654DJb4U5jc4p5qdGIOfHpVUN7aYFET
	3b2LG/ok=; b=aQwdBXjSXkfr+kOhmVtzoe+vG1mV36ULNo6iltWCRtAtsr0d9yV
	+l0B/SkB1DKB7dL7yT/C7mk33y0P9TX+r9naL+GTC+1zJg6xbk4gpFmc1Vk6N1Fz
	HO3OzUYxJVxiTCIaONEthrbEWW8SHPGtBVMnLsvXPrTM9nV3m1MWyNf9nK6oaTTS
	h1m1ers9emvTHG9Br79TSL2KU1/4LxmO1BxZQWNg9XLbdQozlyk9Ln6++WhGlBhE
	jxhqBApAhk5jW9N6z5WbexGAJPX4dzyHXOcAKKxF8g8ChxjFFr3PyRFm4Z2R3423
	D8UGuVZ1uQlb/fErKhbS5jOnBGeX69kzI4g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21umfeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:44:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c87ba0890so2848180c88.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776667453; x=1777272253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D7K7654DJb4U5jc4p5qdGIOfHpVUN7aYFET3b2LG/ok=;
        b=c/J569I4owNeHUyfC6S8VhmpoCDiVLKEneQ2zXJrz6Hj4W3RPYqztJMvkeSyukk01H
         p0INkh2L+kF/MGbpb9y93d/DPKSAHhOYLmjkJto+Iuou0oqSc2ykBDKw2aF+70k5IYnG
         GDtkJ9Q+Ndh7QlhC8EUNoZsxQbZM5caH9JGyv/l4So45iyRzn11ciUPNJD8zrysMx+9m
         rvePKhyDBUG83/CMw+F4l2KzGqGqoxM85049aXy4mr/AEhL67HWDDyih2D1jDEyXMJcj
         ppS6uCzJkQ1H2CbgFkzRKh7i5VjjjWXPKMGKKs5LTYd7XrYLPB8/sreVM+mxn0q70at8
         9tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667453; x=1777272253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7K7654DJb4U5jc4p5qdGIOfHpVUN7aYFET3b2LG/ok=;
        b=kw/8PPc0bdx8ssCw2NOkmzWqCGTSj57S4y7UKTAAFZtTO9YuKCakDmB59QQXVlv1du
         3iZiasApByCIufwlICY8gqm2xd6mCETEVImP+eBSrPZrfi44dg0hXsTMQ6puJ4aX0MjL
         E//B8qg0YEdMAUSYE9+znx67+YpFPrSEEftZN8R/zPb62/LGR6MLacTBG6dXNc7b6BH0
         3WOzOleHFUHNdTWZQBc7K0E7UlAG4twK8zGUHuaqyhIWNKja6XgoZT4NKVPotFcPXL39
         gqSu1+mm7jMF84pJGPPmRS9BMJlzlBnxU9frRF8L2BGogI37wSuv7PXJ5UjB1KUsgaMu
         AieA==
X-Forwarded-Encrypted: i=1; AFNElJ9b7droPcT6SrEIu1RBrZCr2UbmgMi1693xODSsogKoikxMQ4hvgqYZc9USzZIgC9tPapZI44ZhYeoU@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGxjUFrGkC0zLN90uJiLNA7vqeytZf33x7obSDlLGjAkPh9Mi
	Qs9jBcm9mF4dGcAmc1+WHU6g/M0mUZkoq7GL9xyWTDAVN6egB/upyO4Yc+89hsKOmfA0wVBF3h6
	XZAKLAAPoc4NrzmbgX1Wr6BOFUgYBfaoBrL9OERoWKHj9QiHcM0OUoDzM0NMUwtno
X-Gm-Gg: AeBDieupK4rDScKNsk3cJLrVFnbkhs7PSiG0xnOx5VQg6bVJlI30d5IyCumle9aS5ru
	EcslAHfLN1HnIUw/21TJ7mGKlxWsDWLJuGDO6Q3JSTTSSnlbbcp0RY7Hbp7AyiZB141cP0X0lR8
	lAgKxF7OmsY+OWtWx/mmM45B8/yoJy/wghbGlI2UBMgtxQ6sbsPZD/Bnb6x8Nz0yoA6KlZZAf/Z
	2NO8+PONG6m542QvnFMC1VJJUX4g41O0iqXJJVz5jR/kSQE5DhWPM0M0UmTlbw+6POP+aRTzt9M
	VSizTRTb43dZDMnsCZpWUeIQIERW9o8k/3CJwsGzyDDQejtt4a3qasf2XvOZ9p5QTFOjX1hm0FT
	Gx04RwmA1O86O/6qlCry5bYiGTzJOZYVGn9fqlFJtx+qzZTrSMo9NoiJcCeOexxbDSqt+tXXkeh
	mVOXr1tLs/YXgBz13I
X-Received: by 2002:a05:7022:eac5:b0:128:ca6f:adf0 with SMTP id a92af1059eb24-12c73f975aamr6675240c88.17.1776667453215;
        Sun, 19 Apr 2026 23:44:13 -0700 (PDT)
X-Received: by 2002:a05:7022:eac5:b0:128:ca6f:adf0 with SMTP id a92af1059eb24-12c73f975aamr6675216c88.17.1776667452659;
        Sun, 19 Apr 2026 23:44:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749d29cdsm13731352c88.6.2026.04.19.23.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:44:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord SoC
Date: Mon, 20 Apr 2026 14:44:01 +0800
Message-ID: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA2MyBTYWx0ZWRfX9K6S4SV+rC8l
 ZN9JZu65pb6KM5O1j8aIDQUTb0rdp+xW/jKyJa6+5JkiDBmvJCko+Mg2mHTdsPBnz+GyU01oAxv
 Yy3n+QcN5iPm47SyOeuVZMtdsrzJzizjLaGOzEya1o/Px6WaWMol9iPyIzpndKkTxbQy8KeflXI
 hs8b65tpqB/dw2gDMizEa9Yjvy8aO3KMaNJIkUVoFyKhlJr1T1DIN0YY6fDvAOElWv+eBqgihM/
 w992T2/vITWkP3xaKExk8L3QzsQG4/6PJNSXiAt1tyG05LT4Q0TTLO4WHklrJ73JTVWq8YAbPC3
 dQNjy3nNw+DnldJhKWNrMUNoRwzHll8FTcEmTOAse0SLIwbsoT2wTXoqVXAC9O68HifmlUG+6dE
 Apyo9AzD4P/fpZE+akB73d91t/sUpcmNHRe1ay98ENzSi+PA1P9oSI0byuFxyOcU9mCmpkbPYlp
 bMRu4ybgYezeymPRmoA==
X-Proofpoint-GUID: 4mQWjjY9dLhrq3VuvIh6xnmEz1yOwIHm
X-Proofpoint-ORIG-GUID: 4mQWjjY9dLhrq3VuvIh6xnmEz1yOwIHm
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e5cb3e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RtP18x_fKbAUknpFPucA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200063

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
with fallback on SA8255P compatibles.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
index 352af3426d34..d73f9edcbbdb 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
@@ -19,7 +19,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8255p-geni-se-qup
+    oneOf:
+      - enum:
+          - qcom,sa8255p-geni-se-qup
+      - items:
+          - const: qcom,nord-auto-geni-se-qup
+          - const: qcom,sa8255p-geni-se-qup
 
   reg:
     description: QUP wrapper common register address and length.
@@ -67,9 +72,16 @@ patternProperties:
 
     properties:
       compatible:
-        enum:
-          - qcom,sa8255p-geni-uart
-          - qcom,sa8255p-geni-debug-uart
+        oneOf:
+          - enum:
+            - qcom,sa8255p-geni-uart
+            - qcom,sa8255p-geni-debug-uart
+          - items:
+            - const: qcom,nord-auto-geni-uart
+            - const: qcom,sa8255p-geni-uart
+          - items:
+            - const: qcom,nord-auto-geni-debug-uart
+            - const: qcom,sa8255p-geni-debug-uart
 
 required:
   - compatible
-- 
2.43.0

