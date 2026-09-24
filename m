Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5B42BE93
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284512; cv=none; b=NWkKqCMrMe+OLH/PdxaImg0WtYbGxBHXIhnZQaM6snbZRbXrpY3o2h7nBMyCbQ+CDBXdCxPk3bRASCT8enx9FqQYCNnHVza5KH4TOcdxCzEJusPlmgjLNHR9Odl3rmddqPo5kNM/8M+qYO9z+tVMTJCeLDmTc3BwN4qSVd0/W3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284512; c=relaxed/simple;
	bh=w0mjgQ3e7Rjik9xVRv6F5PjUq2o85Jy5MMU5aRNWROg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WB4cedrXjtVcz1ed7C8kmXCB1APdgzCdTyBXAnda8iLk0BTpmIZnFOPCwqu19/m4qPZhaTp8ZLOmC6DSzsxxhDXu6Kqxj/m1mpuie6UuP4jrLK9DK8VIbkyQpdGNARCQ3xXeTY5afA9lYCeB9U+YpC/1Ts0LTcVtapaenmwLBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWo81Lwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUm1WRFR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWo81Lwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUm1WRFR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdkRL3462587
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lF+gxAigVU/m7+ElKGvkX2R4rXm0TJ6E4w3e3hNT648=; b=JWo81Lwn9dgoai0l
	c3dcqR8PoR6qSuPZqqmIpd4AewqohFeYIuLTUqiigi6pTZ5dGbSWvWtbhn3YuoX9
	QYNYjcck32v7N9kYlEVuz+6RKq/TbyX4Pc08cfX1Bfxg8sn1HELDQFFijgzGhP5R
	DP6aDbzMbTgKF3zFe/XWDP4udG/RZCxrWF6yOwAX0gNqnN/Asi9mfOrPfY5Q4Whi
	JviuNifySegKu8srVkbLlKvxGzn50wn8yfktuBbPxjWDJru9HtPuWhV5CThF1/yD
	9Ql6p879dWrSIcpd6pDOlX93/OjLc/lIOzMoUJJUr4AYKA8QJZG7sx/+43N3fiOJ
	N6qEhQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjjpkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14371f7ba1eso411240c88.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284508; x=1790889308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lF+gxAigVU/m7+ElKGvkX2R4rXm0TJ6E4w3e3hNT648=;
        b=PUm1WRFRKYuL2CCk5WBaA/veCpga7hQ61bjeO0LEGjZ//8iuzXyCtUjFWPyeGKt8zY
         DKCnCoq3BmJKXBx0eZpAUw8tkGpPemJVEE7dSx56FIArm1Cc9PcDWVKGZ/jvdtj9KOCy
         6f9O+I/p0PqvZWlL8U05ScVC4Bx0MHw2c1+ZLK4eMEt54B8P8SU7+oBV7J+2v3BHTTXa
         boZIQr2gzS6GU9lTLZr7qGplPBETn7gc86dTWb9C66giVSjtXnsbCMIQD1SzYf0Biz5g
         UJkB3NaZUopy4+a4Z7yTW0NlmhzjFjj6K3oaf/+SjSkIHOL0LSwdrDcP86atzdhw+RR8
         1+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284508; x=1790889308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lF+gxAigVU/m7+ElKGvkX2R4rXm0TJ6E4w3e3hNT648=;
        b=po9juCSW6cR+R+Aw3o4Qp/xm9ROYDybVpMZaH3XBJciODH1SBoGaOdNnZdqPF9F7sn
         i6Z6bYJtjvCPLD8gfggZCmGqLsaU/JIxKUAq+nLE6egVXB0QO/qVSDdTawUEpnjsgJQT
         rJPxg0OFhgqjlU51cLXJyiY070qPVVoHazs8VqnrmLOhPF4cvwThrXvUY+64xyNAEpfm
         gzSOr3vtvmc1VqRbGAGnYFR8TD/B6Z8xGLkK68t6Ftw6a3ggnQp6zGWRI66kryMkFZB6
         SkooFkblGaVWWLDvlxmftWBorb5z2qct2BpVCwbkpq/k+biudHywQmnu5+wSZlf8EsMP
         BecA==
X-Forwarded-Encrypted: i=1; AKwUvBxhvy6Ww948ia3doJBF0J7K7PULOqX14rzDdo1CVhvoj5CsR7OurwtV52RdfTRnkOStqJTmNzdR7uCL@vger.kernel.org
X-Gm-Message-State: AFuF++noL4cRXO4FVOxMy32c4qtFeNnnNfrpeOI1yBLRjp2lbDMbGrJo
	6CVVvAMGmlOpxMQLG177NoOt2pf0fZCYOFWXPOPwEVwZZvdu7eYJC05num8cvabj/RY4TiBgSCg
	RYHRqxHgRZFWHCrge6us4RvZjmaxdC+FcG9M0PmgSOYd8E43Kwf+1bxhO8NgOYae4
X-Gm-Gg: AYBFou2+lxgPhsUjoqnbcHsDXfK0U7Hy5wh8o3upFdKBCJJk1s/Sk9QCXuDJ+SIlXyP
	cqQMKcGmokvrkYmTYDM4zry3btFzVoDDt6dgsz8qzWrqhzmtHWAZpTjF/jQokHBljP8vcrsir0i
	8+Nap7+9a3LFVdPX3yZXmmAcfQy4eKRW1CtsCCb+7qrI+0b37CrjtySu2cW0ZXM7U5Q8Nzv+/5Q
	7rY1xjnjmHQEAGDjOceMaP6qJdARrryFQw0luQzZOIOTZ9gilveOBeT3Fr0MiXnII2bRb6t5tsS
	SWpcNeFA7Xuy+yIHpUP60/PbIeJGwCRubwiUPrL06I9KWavqaRcAou4R0MsgF4wstgb949IBzNk
	aqm1q17OucsODExAm+lWkWoE=
X-Received: by 2002:a05:7022:b042:10b0:138:243e:ceb1 with SMTP id a92af1059eb24-145ee31fed2mr65430c88.6.1790284508144;
        Thu, 24 Sep 2026 14:15:08 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:10b0:138:243e:ceb1 with SMTP id a92af1059eb24-145ee31fed2mr65395c88.6.1790284507526;
        Thu, 24 Sep 2026 14:15:07 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:32 +0530
Subject: [PATCH 1/5] dt-bindings: display/msm/gmu: Fix Glymur's compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-1-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=990;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vBx0R2OyV72sf5hsevsW2+Rls3EglXdhI1k1nSVuKVw=;
 b=sgeiFAd9eIvzTIRaCGvOXP7QXyzoG2PvcI6ipCqovTmf+AMrfQxvG26DpaeVHwXfRp06f9lvo
 2HniJHHfi7JCjVQLPBPiEIypVgcvuJKemQwCT1LP+M78btqDHWmAdph
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: b2_Zixd47-Qb1CbSvYYUo7_-AY08g-az
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX+vxotErE48dp
 i+D78p2sG5gDfZU0ZGiGcBYmm4Rcmbig8Ig48/I/z633ghBBygQL4atPLfViNS7ov9DX105KcaF
 cGmJ5iysZg/7XugJOVDbX+Yj2FSHOAflwK0SKdmlOj0sP4RhOoiKBewgypLYmeXHFZ6NIYwHJli
 VP9D7hXimFrtf6hTZG0IZ6EoMBqCst7Cio7LZJ1Hi9f/wd1Nv661dSMyF5/CBzg6CSKONOtl/O+
 FM/eHeJyQ8dml6508ns7/Cu3on9NKkeTFFqI2cO8A2pu7HTvEavJLsq2cRepq4mZncODCBiR5vN
 /irb1Ih4CcTrm+rdpM+t3koJpjVW75ozETJ1CElhuWOAZVPodN2Y7miUK9+KzXG5Dv2LtlN/MsT
 Zmr9M9TOK20uuvS5CsYKnNPauKj+hDmOnjW00DpCCACEIONlmie4lb4uP2NfbkbnBkAKrgdWwxk
 9nkBtUtYc6G+2qdFx6g==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab592dd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RKY47XI1zMLZdt3AztIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: b2_Zixd47-Qb1CbSvYYUo7_-AY08g-az
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX5ylMilOIpx5q
 HjwTOVa0hnvd9UC/b9qikCqcRKeoWXCATkLVRTlvt/fh5Yv82rVn7l/dT1HB8gxEbCJx5412n69
 47+3fDbY/gT1xmbI7vSbwBMpueZmjN8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

The Glymur GMU compatible string was incorrectly documented as
qcom,adreno-gmu-x285.1. Fix it to use the correct string
qcom,adreno-gmu-x290.1.

Fixes: 7bc29d5fb6fa ("dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 9e459f12ce3f..f22661447e7c 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -363,7 +363,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-x285.1
+            const: qcom,adreno-gmu-x290.1
     then:
       properties:
         reg:

-- 
2.55.0

