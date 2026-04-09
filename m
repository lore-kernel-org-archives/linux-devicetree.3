Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200C3B2FE3
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726510; cv=none; b=kTAtlVxV10MSsX0b/BWc0Na82a867YWH/ymHYHoCFXXL1XLgXIH86W5SVfF/SmQfzly6blY6PN/LoTxUbFqW2UxNtL1jduZRSTz6N52jRh1S3IeCabtHr6RZVmEg35wHGq7WP+gooctAYc9XTTz84x47SeIsQ2ZEry4KLfXP6wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726510; c=relaxed/simple;
	bh=lyO+hk8kt2i0G/vKlS7Khc05+qw6hrcZ6upbhob8yAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEjWYil+mZ1kN8ukNxnnWUAjjJj143SCweGA569LT5u9q/k6ZCfewTvsNJYfX+YEyp+kCtQly4DL8GCjh/Hq7CqdIq0yDULJT+wY6I3eKopXbfaHnPcWZPZsENH8J5EXKhsvK4flMAWV0hsTrKfPedGCstKx81Nw1JEONM45ThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4fHSuAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwCDvB51; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4fHSuAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwCDvB51"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6396uxBZ674170
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=; b=Q4fHSuAOQkbgn8vD
	NmMWvK5Ip7enQi2hLm+i5QclQFGKyKJ0Pg6PN8KI8l6f0mtO+iqdQDqsE9AICSz9
	+ubjfqDxXN+l6HSHdb+66yOkf4Yp6B0HYPgbWS04rpRdtUljjrwFXrZbBJXniGMc
	coEpmLEPMAQrkIyUpd1ADGEMsYzWHV3y3XdN/GLpW00YkGwkqx56RuPltkexpNoD
	bK2B+l5/hRqAPk4bx2FEpsf7/AsYsZuEa1I00nkhz1yY+BIngzf82MSwIIXFamlM
	eDXvS6n5Xzud2nD5RTu/o5tYYkYxQG8i4jpt+RMLCphNNfsXXpHFYza6kI8oZlH1
	E1xFbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmuc4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:21:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0c30b51bfso13741015ad.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726500; x=1776331300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=AwCDvB51sR/AnFv7hAoV1djRreqSG+vwHL5trd0GYn7Kk81lYThHsrwPTait8/h8q7
         dUcISAV0xMc3y7WzJqbFCRAOjv2lkyQLhG+H4mTC2PW4OUYjuJg1V5n7QJx+BTmCpiU4
         6ima5wrvXVDWXWuyjOJTohisXw43bkMRq6oVLk3ERsYrAMFCjA5nUn1WNUv+8/doELEQ
         0NRcfzP2L/B0LCRhu2v2Owam3iKO3afw3qlO7HgYdhz6WsUS+kMhxLvDmO6l40fWQPGA
         pI2Jl6msusWxnnKVIo6ao6AIuMwBv4vn9x1gaISCuER5a6aWjY53C/i1TkwtHYlL/qwP
         fe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726500; x=1776331300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=INTkrNBoC2XX9xUYb4WN01MeHSQTuD3SA52fekNjNpdY/L9UUE8f0IrbFLB3SczKYb
         m75Ufhg3CYzJzZZ3ZZCdjpQdljrKEcazOkkcDhsEMzUN7Za89E5xHUMHZc5+FBgYyi9y
         FujbTYJi3/v/JBQUoTH32N0bXA5dqQ4h7D8yJgw4Fi/F533UiK8yA5kJQLa+nk614Vbv
         qnfwXM8Mu0F4UOHvlfG6Tvp1D+yqMWa+BvKgqae253EJQ2Jd+gWVFlt022MI+RPSqfxd
         JY3VwkzU7/mUZkHpYKSB010Up88PeoIyepuAop3eFVy7c3m3a7hx4Ab7i7h4vVMY8Tlx
         KgAw==
X-Forwarded-Encrypted: i=1; AJvYcCVw2Zh6sjPgKZiK50Low4flbwgeiyLX+wGFxIvKAKqkn4L+9C0h55PYOHc5founzsTyRDXpagbgQdow@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc3o2mR/706LqhNS4iUecuVuRzPtPytIkDH399K7ITIm6CqY+X
	wjsKPGPVC/yRXfCoAX8qOTbk07naKlAdfaUKcTqqa1qDVCyx9qeTC2m6VFGdnY3lRWDdB4hBKbI
	NQglVUkBCIRqJs6Kzzp/4UErOELVFCtkGfxVK6dAa8V58w6KpUTZ68HkIN2kMDJzU
X-Gm-Gg: AeBDiet7kVSyrpPCW7QPFZbg30TAeOuRkeHAmjKxqiR7sZj9VE1YJcTsO4q4jIJ0ze1
	6kZ8i2ee8w1JWqCPqXd0oiCjWPhQRoFEwY8Cq8Srr0OedRgEB8A5lE6oMF91rHu5KtebdK2wblQ
	ZDxOs4TUc6A1SVs62Q4yKyRsUvvioM07j3j4kl2fJM8ZWFs5SoGkcsVWCoL6TUg4J0IcX/f+3rJ
	cfujbGDau5sWFyB7lF0vK2geQ3K+R1TFUsHo7rssGcX+eYgGImMF76gHssckDHO1DwKa/9EQD5H
	n9fFGUnqSgt+/MmR/pJaL5HoZSIz5uFV7VFwfyuBXzi7IEqUJnNySwJopGuFcoOxHQgg0/9UgFx
	Uu7hpbJi7xxn0JzFKSY2n8QzKpmm9rr9h3jSnGki/7tG3TkY1zdmp
X-Received: by 2002:a17:902:f9d0:b0:2b2:53f5:4627 with SMTP id d9443c01a7336-2b2c723f6b6mr20625015ad.4.1775726500407;
        Thu, 09 Apr 2026 02:21:40 -0700 (PDT)
X-Received: by 2002:a17:902:f9d0:b0:2b2:53f5:4627 with SMTP id d9443c01a7336-2b2c723f6b6mr20624665ad.4.1775726499939;
        Thu, 09 Apr 2026 02:21:39 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:39 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:04 +0530
Subject: [PATCH v4 2/7] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-2-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 8xpUNt3dX8LvM11SjMJamX227EzVx9hd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfXwTuWCCCtUUDb
 4VQZOT1H8MQe2nqei5kcdTYZVmY7L+ALPpyhfkyTP8uI9qMHBk1rOmJIc45rwPsZ5bWXfeSsnUz
 EMKUvt8ar9K2d0Bc/po59sVE2i6WXBDzh43c6P72mSVScrnOVJ7pqExOI6cCy67B7zzRqXFUlu0
 NIK7ffNbp0vb6xOiBqmIlV9xn4Mk9WuBRKj7IAN73gTC39yTA9Tr2iGlXJogl/ZAHlt2mH+oRv8
 Eq5r6I0W/cvRi+lq5DHp1LMkTdXs7eaF9AslThA++ZK/dzNFqeHV7/MduIj7DhQyYANjSwP+iPF
 7jFpLhFNhtAVEirh0s1zGWoCIGpyus+vK0TCIBMjL2gsJw819GJaAk6SSf5jrlCLwTm9T5dztKJ
 I23/7C3YIIxSzoH20k4eyHgcYqag2WfRUdR8/UGSGt++HM6KB50CWzOELo2UOauY8/gAqbEXLUG
 Nse1dtQAxUCe2eTGr/A==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d76fa5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 8xpUNt3dX8LvM11SjMJamX227EzVx9hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090083

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both X1E80100
and X1P42100 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1

