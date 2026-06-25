Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA2305687
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782352849; cv=none; b=cQ76nMnXDGQLYx40myEjR9Ns2GOXCxt5o+O/0gdo6c1x2KimR2SJHDVF575LFjzcDjUtiC+IpfZ+cdfpfVZLHkJbeas1WrTdV4NsV6sSRzSE52aBT8B8LpsSLG5piot2/51FygS6VPsuOPBPLcVL4jYPza2dK/GYcg1muoK06pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782352849; c=relaxed/simple;
	bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vbxbq2H+ws4ozcKat60GoSg59Dpc2E2VMw0GTm+jFk9sxfT6v9AFMEDIbtvcEzeWMXawqmb86Qi83ReaseNOz+hspbppqV64a6X7YDYDAeSvPPTaJiGJdtFniZ2zpwY+q1wjP/cIvb5PM427ElSadUpy+hJAShN4E+ZRVP7UPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nw94ETJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLsZ432E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nw94ETJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLsZ432E"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLr1ff392574
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=; b=Nw94ETJ+BM4TaZRu
	ZUFmUCB2c69twa3XAWukijHgrqfHzSrgXNxFpf0ppVGssUmjIFd/tcn3/vxj2qJT
	nb7SO+y8GF2YHuoLshphnV1JfCXm3LsQEaRf94gHXBpsBa6zTRLMkrRTkU9bZ7ex
	Xe0l8gHszTwdFZlNS1OKN1/AoFFDS2IMpkkGovXW/cD1oNXXnw63fZUye63JiCdO
	ywL/VyLi+6bUuJfYxgXSjAWM18tHklB42fJL5kWEMG7KgcikSeE4TMw5QojKAxIA
	eDTRKjYp94a+CbkwiZaaGGDDcr6dMIgHfFq5HWQKIERka2q1sL78NvSIfr4FBMvg
	9PLkUA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g3b3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:00:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c03c1dda3so889030eec.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782352846; x=1782957646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=eLsZ432EQw8XSbjQVn/Bbh1PqJIeciilEE4gNPpIj3IMP/JWD0cPu7LJ/MaZ6e80UM
         mDmalplnQXI5NIOfjWTmmqwfqGtFAEawNVgeIEK7jj9ei30fvlBwyE+pWOOZmYGRFZCp
         PIC7TiTlsO2u3TJpicGpfdCY9eVU7VcGBKPd9kue0hb5N2Iq0cPApsypifRO6wRszJEe
         6PdL8dEY3p+HF9c8Q9UiGehbwvyOIB8ZBIRSvksy3Y996d6G/Jvet/EPf9jBZa/u0V9C
         V128uI39nWfIBOvnIeYTcMUzyIa6+k6aRXrKhO60qiz83khRhiZSORlxZ+oDlHPFg5mU
         bcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782352846; x=1782957646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=TlGBKGY4+zG0aOak1wNWETDul8rB5h0ZVbD3z7Ht6HWlwMpi5XBpm/EDDR3otHws+U
         byxjT2kvGaA/PG2zg/HoD4Yh+c2e2ZamQrzQ3v9YyDP7nbqlbNmk8yc9iCn68UM0K1Wa
         rVCDaH9+sPUDzgriIgEf2TJtkk6UjWoCeGNJmuurBUULehY0CxzHpl2iDvUToE/ML5Kc
         TD9TPfZdhk+Gtz7bAMit0NaXl3iIEHbjgtLgUqAL5tJPWaqe8ZfzO/a8q0teI4sZsunn
         OJLHD8kQGl1kO+RUFhGDdM+XRKQg80FeO4+7L9zNl8euTyRktLvtc91CNrs3wygLCvMs
         JsqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpN3xlGTfyDui2UBxwo2CmuzQ7Y1JINaLUMno8CmtjZxsHaLtuEwc9SKmEAoZEGoeCYMQhK0Uapk24C@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpzzCFuBKMSs2xVN260kHftu4lwLQ3EYpAGKYJu8mZ24wVD+I
	dLyMWDr2kp04qCp2SrtLrLeSwFMzuD8ehjcouoAel8AzXCyqLzKnAiHV+KoBDddvzv1L3BLviy0
	9D3v78r7sQ4koJHkqGETS1WECJxTdDfqrbczLYIpVdjIAgn1xen1Rpe5SBdAFE7FJEDM/IXd0hO
	4=
X-Gm-Gg: AfdE7cn2gAkGFfYt4WCa/NmSkk1T8frHSX+sTg1gxPKXuE+i0Q6byKL3Pv3S2slSLMB
	8ieJwmXQyHu6Pm0X7TPV5ReudvujsdA/DCV0kkNYHNCzdNJZjtlWpRyugVMR5ezOlyVgeiGhFXc
	mMFZaUQPjvTjnyPH21/0Dmaj+dgIBJURs2Z1P9x4Yh5PYaVIAwxFmdJM2yFXf4lIWr9vtSDU5SA
	+T5re6tm2lSLcv+rqglimavoqJtglDVRkGLUSDC2v4jBR5OGGAMdfzudb2kA270Y7DdjJ8CqN7N
	eQ30fhpDdQxxCvWA9EGkhyZQ/iE3BA8REhrSlMfqLBVcNoSWw8wLp+meVA/90ASKx7ne2ctQ8yY
	pyLNngyYHVN7cSEt/sybtSb6L8dacpnjYXQqIJkSJB7ORJD7nb6P2WuCLlq13QAQ=
X-Received: by 2002:a05:7300:b586:b0:304:18be:55a5 with SMTP id 5a478bee46e88-30c84d15d55mr618639eec.22.1782352846447;
        Wed, 24 Jun 2026 19:00:46 -0700 (PDT)
X-Received: by 2002:a05:7300:b586:b0:304:18be:55a5 with SMTP id 5a478bee46e88-30c84d15d55mr618584eec.22.1782352845742;
        Wed, 24 Jun 2026 19:00:45 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8afca8sm2933939eec.17.2026.06.24.19.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:00:45 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:00:37 -0700
Subject: [PATCH v2 2/3] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-qcom-spmi-haptics-v2-2-b9118e60f3e3@oss.qualcomm.com>
References: <20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com>
In-Reply-To: <20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782352843; l=891;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
 b=RWnpqqugPMLb6oMeuWHpmn19vMXUaJk5ZOAwNR/9o9ryQgbsienpos1/5XV4LNqWOHFvmGnZW
 A4o8ziT8+UqCpmYZlno6lb1wOF9Q8udFWf78MAO41Gq/20a8UhWA1Bs
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3c8bcf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aKV5VrVIVVfq6qmweGsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: sy3AoFs0zz7-OfEWxZHs4RAIFrgG8z_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAxNSBTYWx0ZWRfXwqBXlPz9jf2Q
 JpehYqsETxjQUVc6aTcjyL1uT4daoAyJxZdr4eHbDwJTtASEaffSUOFrh0DMCb+ZYK4uchAQbDh
 ZnwDzAiWDo7NvOsF/X5ZkyK9KCm741RbYyEfpr2lWNMbZ+eer82SidAXk3sVXL/+VluKfdDcnZQ
 +reVOBi5mn2uxQnzUq+3+qE5ThuXpgXOXvXYc7kZs4fLsaD5D6FXAsSz/exwPdGJ3WyCe7DRGYq
 ByJoPkusLboCo1yiO9dJQH/Og65gvZjf755M7U8Wtkf+KP3pSUIhGefVfPutFzILyfurVJSkkFO
 NGixPRTQ0jAEIRGrIK+OH5Tb2D9OU1W7aAp/wvxLQ6qjTwVfFnUq89/HnaG3LIju6bJ/ONZrA0b
 JQ1W/Wa7g73yHohCg+76r5pVwGOzxzHjbav0EX/ZKskzTtkLVeRDJMV6aFE+Rq40muZveAf1GvN
 A9VPAYzEqIrqwNl156A==
X-Proofpoint-GUID: sy3AoFs0zz7-OfEWxZHs4RAIFrgG8z_2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAxNSBTYWx0ZWRfX0zcdRkKl6FPG
 UHJ6unUAqyGAOlgTNAPxrrB49FxrbHbEsYDw9dEC3RryKlCWZsjV5HkO0ODgG3uU2e1OpQgYvgq
 xtuS2ySdyMpF7SL1AiWPmzxEEHrDGtM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250015

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..773f4cba5935 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -165,6 +165,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^haptics@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,spmi-haptics.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.43.0

