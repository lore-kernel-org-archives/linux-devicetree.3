Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4003A6EF5
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448654; cv=none; b=ZmB9+3IdNagRGyAAMbm3+AEyUqCGDlpAvqIyggjEEDDHycR7Dx9mE8yY53HZ1s5LHtQ5wYtJ56QbMYxhPupln9Yss4mjmhMuB5bVvM06odCq9FMyAYii7uCyhaWItFBbgFnk9aIpq0TLhmLCxTKvYv9nZ2gRHwlXxKUNGfD5mAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448654; c=relaxed/simple;
	bh=nCGNVdOSbKP+5Rvbk/rIUMxHzIT1UqzaZk73i/hheGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chbqZh7zQbYOqXN6F7D+hypqGRbc3fmxAuQHIhkUGinSIlI2sqrY528YNaROLFGP4rR13VIK/Lm4p9qefO4vUfdzkLeT5w8HZEAhWzj3YL2FnUOar32aPjJ+ZLxyhJTZVMUjuEBHzCc4SYQuVyURs4No9GAy7Zn1Vwz96wGX1z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOa6jCDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gngLto7N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOa6jCDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gngLto7N"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6F2x91282806
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=; b=FOa6jCDbRllsTgbG
	fHHxmCsEDF1OKds+K/ic3/zeBy94bmf51PLVfUgzwf2cs0QeKOLUV0ToSLekG6NN
	GsX7qneRkno2c2pwEqF/dV62MZQcKFfFsQy+GM0u3IzQrZhi1tkZkosRcjVZrCh6
	YQe/njYG5bhtpPrH0i5XYckpDfvHsCUPd+6WGp023SSlXXtF263DGIQjPapQTjU2
	gJEFixzUAewc1YeXON1zeEsAU+fnuWayTXw2qFBNZSo3Jqu7V6cxyqRAAHEsXFER
	BEynfGe8IQjO30Y4Tp479Id7R2gSuHvMKLn9v9SzA+2HG+La0IIzLuAe2TtirYzs
	q+gOhg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80bx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so7274563a12.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448651; x=1778053451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=;
        b=gngLto7NC50zFipJEh2gJZByvgG9uKfGSyYCbug2Uilmoq7EDgTdUyuuyjw4yKToOu
         0RgsTEun/+bmH36jOJ7/14REmHuGWl8hRx34gnlQmdqqYrWrC2WgzyZIi02A+r9jLipP
         JlBeakjJr5zBIVMVWi/HE81qQwodcTipSQqEfU+O2bN+1eYx1v4mxkGfZZLh0BFTT8Se
         NQbFQh6rKHdPt1Ncpd2GArKnjZqts6DAhMvmYlf+9Cjs7KdTsxLKGCyq4BoMJp9iIrw0
         19OuNL4SfF5b049BB9MnAHM0nd1SjqxDTgw81r41GuxP2gvUubrWBZCIwktbB6mdguSP
         6B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448651; x=1778053451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=;
        b=rctJR13SzAq49ah3qmGk9Hgh3u1r+UIywTLMwG5Mkd4TH64YRPy+dsS39kblyzZC8t
         JO6Z4vtQVqzDIerjECmBnMwMhli13xOzzfL0LRxPi2D3Duy2dBdTgSmXsbELnuL8mTGS
         1FBynzBG2PQg7Zno4eI3mDwMNFVzOuyqX0NjydwugMgLfcAIRbddmj6M1gpTXj/M9Wvr
         0DMZXV1O4SSujR2m0GH5No3udi4iFg/LZr32ROIZQ+NsX1CeqHc1epE8B6FIcyGXofwl
         sWW/WpuggC7I5o4Gg35aZ2aWYrYmM05pTWtwDMGpwhtUq/eZnEG1XSo48u6qvcXVYE18
         JMbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CctGE+eYgg86lenkZrYnb8tmMAPB3TsWJ/nkF3q4Oamw1eqUGRk1kPG+PPG47KZUuotwXoZmETqWc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0WWSKEW0JBJbVABTcaQ3Uh1N+Q0M1CmnKzCuT3SqiaiqS59Fa
	yZJmNcaUPHhW9s+gXzT19o7hfRvBqGaEK+eIHyNRASO7+4r4C3UHnE1Ggn/15f7VGru7qUMK0Po
	UH2ForxefVMfSdwR/DvlotEmNo3BWWe1mrO5b4eEeiP2/Tqa6oXp04IEENFnQ6Gwb
X-Gm-Gg: AeBDiesVB04e2p52JGAVeYCO3t3ADNChKQs412sXNZen5Eq9kpe6wO8CxCuBjF6k7iB
	S/knBUAJZbNKb8S6N1rcPCoysvYMRSrQvcTEjtnwCKlS5rG6SIxk148dsi9ZBKW9RuerUCWbBh5
	sVQcIC9SvfzNp+5zo3gpJgDiufzuOSu9A2SyDIzAxsfwvGBUEnHZMuiBRxxlaYhq37aGu5KIg7b
	/izU3nCsgNSgTTplZTG5NCg6vlblwvazF/gayp/0qJxsuVuWa9Au3CfDstrBRh3S6CW2PKrjxHQ
	GskkvZgt5MDVGr9UpkbvZg5vUMZTQwKN5fPNf2wmRcBGeiX6XOeSO8hSbFWrdbG/fnKu87vNkxH
	eBOggfOcLkuFCkT8EuSR4f1vhIHarol4LmpsA9KRKw/d/d/ygaGGrffTp5TmOiAc=
X-Received: by 2002:a05:6a20:e211:b0:3a2:d68d:9e6c with SMTP id adf61e73a8af0-3a39c32e8d2mr7733617637.56.1777448650685;
        Wed, 29 Apr 2026 00:44:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:e211:b0:3a2:d68d:9e6c with SMTP id adf61e73a8af0-3a39c32e8d2mr7733578637.56.1777448650218;
        Wed, 29 Apr 2026 00:44:10 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:09 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:52 +0800
Subject: [PATCH v5 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-1-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=2017;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=nCGNVdOSbKP+5Rvbk/rIUMxHzIT1UqzaZk73i/hheGU=;
 b=SsLaueJ9P2BSamWpqEywUfgQ/TPTcl/0wfNpalloUqAqne62mP402W7Jl9OyZXtgt0lUudSaF
 ev89sTRtzaeDdIV2A6qiaqqr6R7kGcVxYnBq2eDgCV4zYUQfx8Jx9kl
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: JPess8l-tEtD9k4yiA2pw-eRGPjDAzsp
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1b6cb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=IRvKDNPyRmbH6eZ6UP0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JPess8l-tEtD9k4yiA2pw-eRGPjDAzsp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfXwqLJSX6cPV5z
 cG5H6zM5YvfRCbZftn57xN6JC0d2M+fN/9mlZ6xmXgNTY01XPXEbQM4gHCipGrx6MnQbcQ0+Skb
 H386tdhBORHSHcQb7+DIv2KqFhJQZnYAyAcy4+6XlNZyMU0Bi3NfPY+pYqKOUt9CUGw68NtdJfp
 YO0/PeJWj7g6p27HEj7rYONhGNPWLF4fHGc8O42C6msbNgEcwy2t8tV2QxUHHBTt1HHV0LYsQVU
 nZ5T7IbW5JBVh785LJdVDs0m9Wb0rS2BrkudsvirvlUEuoQbDxRx35mn28T7zw8sp/3n0lFpzXe
 BBZvSPpykGoau1JN/E7wwrWOjEsCU1PLKfkntT4Kx68t29uxRvEEFb4kDAMEyBTDNhEdayWzNY7
 7yR2VSSpXaedtgv4EsIk8ujJGwRwPalcLFohe2AAVKJ7oWwvMLcAwzj1y3EuoWJPl3FFE59mIfE
 nElJELwGFbp3T3+aS+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290075

Document the new compatible string "qcom,x1p42100-iris".

Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
that requires explicit enable/disable and frequency configuration.
The SM8550 driver has no knowledge of this clock and therefore cannot
operate x1p42100 hardware correctly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

