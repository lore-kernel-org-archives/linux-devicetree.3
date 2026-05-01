Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000BB4014BF
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655471; cv=none; b=bfo51b32tKfQntTa7tOzACSedx0WS3GkyEv7TmzejMk+dJ0DtbXlkoU7fn+LYXsctqkIh9lb/LDNd76DKL6MvzaSfbrh/s2VQMnCwBAY1zMkK8dBGOIl08xOJSbsXmfckzG0PTj6fT11eDp2LQTSWiODUHGE+G0N3TefiFk7j6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655471; c=relaxed/simple;
	bh=AJlLPOqIput4lZvz7Qw7pxDO1mYbGZ42K21QV1AC8DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2m2cZ/1DxH75AErrUMxA5LLlvbnHnKdmOJLQbXNqxUbEXzJoriZHkNY4xkbzO4xoJCta9kVjTThnhkGdbGoaHa8Bj5lGGgH6lRw8/ACGap2bY4toh+lZxmljXM0xXsVApxoOvZXyT5wC6iNjI6VNwh5+Rn8s1KBlZ0v/QPiPks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsAT2e0a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjRm9W2h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsAT2e0a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjRm9W2h"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLW2a497912
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvactydo9LBndlL4M8ALZ02yKT1EFcq++vAUvHqcA6M=; b=DsAT2e0aWUQX4dql
	3CLFX31JDIo9f38d3NbN8QtRZOyr00CBqT232plbrBEKkRaABib/K/mVuK2cfUIj
	uTqAVv0PmjiMhoeUh2MCnrS2mpzE/PgTDtKEWc9cpsBGlb80G3YLkK+GjkO2U0gp
	wWLaivnH3d3+G/P7cO67JCBhWQo4lWRSSy90iMJfrvubdxZodX8gzPIUj+PBV1aB
	rLzfXiJIcIh4YN/hdDbdmYkY3YvMTDQYIvuxk1IMYEX6Ygnys92zj6YCSkvsI7NZ
	AK0jqPt2LvlJkdl7pAZJobW8Zds3WzbYbe9LoCERfyitkMxGycoL2bZawccQTfIu
	Lg4wrw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchkbcpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:11:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f85179263so2870497b3a.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655468; x=1778260268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvactydo9LBndlL4M8ALZ02yKT1EFcq++vAUvHqcA6M=;
        b=MjRm9W2hYX41Vpcs9IR6PPNXcGkYDI2FS8hZ0MBnDtH7LJ9IFceYKSwZrqOFeXMB3i
         M+kpMtRtMaWTmksGm7cLHBhzcAPCL8oY8E54R/bskpW8c33kR0dVNUUAag4ldU2UJK2s
         2l0Jobn3Q+fkwJV0FGP1jkK4N6up2KNMhP1dX7COSmz/kNBG/7CqiMY7zX1hBcblF+am
         tG7fiYjcIhxkiuHDbaDWPcVyjnJklin/tfKLKI8i5FkV5tP62hQttxiT5YFuJX1HmSN+
         6GuVs3hQ2y4o5TTZnRvGDWaUxM5o0iae7ijlh9GMCON/ShjgR/gg2MJE0PAxq4xlASQN
         yCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655468; x=1778260268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qvactydo9LBndlL4M8ALZ02yKT1EFcq++vAUvHqcA6M=;
        b=K/wKAnYDZ5V+IXyX3hZ1wESppA3ZIA+vKLYXLZOx2JJ48oRH0UWjWN0Z8j6VI6GKUp
         H3E8QA4obzpETafEwtZdO27ZKg1gl8DJMowxe/GfYXfCUM7k9fPMrGeFfCfvOV/NCwzu
         vgcviG3vQGmoYHefeZKreub2enEnNF9+OjiPJou5UqUOd1hSh6U2iCzgfrxEseRszWX9
         6OFZnVju1lPLg2VuNnljcNtYRrd/d0mu7gefyGVa4bWasWNGjNk4FwVcse7A/pCMj+m/
         N60sXG4dIHbj1N6KbXlnP/6dvgGODmPQWHp8OGexD0rCfV/8qD6SB9I2gHvZMlNQobzj
         hMog==
X-Forwarded-Encrypted: i=1; AFNElJ8rwsgku51thTWLJUh1Vtm5b6wAIge5VNOY6l4wYspfwwOcWSphaiN+I9M3ISpzEyAWZh6kGWqBbJKe@vger.kernel.org
X-Gm-Message-State: AOJu0YwWN043EhMXswmXR19M9WdbUYC68Zb+qGvnIogjvHh35ZQq7y8O
	36l96OCWoaME/Xmk9sKL+WMGXXhXZZBdLsRAnfdQmlqaqFKrtZ4Rx1tarKa7Zk/4l5/grAyJUAr
	RramPe7McDRoTWsZ0Abtxd2ChW02oLAhfcIpy93mkH4T0+uMW5FD/RGRT1RWU7uCJ
X-Gm-Gg: AeBDieuoMCDXqpB/+hP4Nm2gF3mxrjvy/EV1Idh1cvnsPQqOi02ETfqs5EslXq/EBEj
	BmwrPdEv0nGKTkr4cHFizhDzVhthaYAYMizcN04ct7GInfXiZ0Re+ugPGHMPu9ZhKT+7RCes0zp
	bgl6SPJpDGsa2LJ4fcgNVLbXnB4+rMGGjp+ZuULbL+cM3EokEaMdR0TQYad+yp2EH8xubnyebi5
	6PDOHxioheaT/ZMCKeIOyR4F5uYs5AVPgeIwDPrgZQ8HaCVJAfI7qyWLgr6A2l0RfkW9u6m3WdG
	0zmpGCEXJnX6tC+P2jr5dReHVLafZdVw8Ib+bhp2Y7QLE7vUUzdRv7Gv1eF/mHVotr4jVUgecIA
	74fDXAaWg1ZHJjzmQOtRyi/mrfjY3/0K7LphsKx9UIV9DaooCjPqg0GyT
X-Received: by 2002:a05:6a00:a10:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-8352d1fa3f0mr86197b3a.29.1777655468139;
        Fri, 01 May 2026 10:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:a10:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-8352d1fa3f0mr86172b3a.29.1777655467620;
        Fri, 01 May 2026 10:11:07 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm3099323b3a.13.2026.05.01.10.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:11:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 01 May 2026 22:40:38 +0530
Subject: [PATCH v2 2/4] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-glymur-gpu-dt-v2-2-2f128b5596bb@oss.qualcomm.com>
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
In-Reply-To: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777655447; l=1314;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AJlLPOqIput4lZvz7Qw7pxDO1mYbGZ42K21QV1AC8DA=;
 b=RQBbUHg7ynwcZIYGXJfF5UjeI27Y9iCGT60Yo3GTy0d0b8UlsVvDPNbblzrR8sySspG5ewvHE
 /W0QN6tlcmmBOI/mEoHoI7ooCg9EDOnjjkJ7y3pda4rg/Tt+k1Tgn5e
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OSBTYWx0ZWRfXzy+NlnBDektJ
 E/EVdZX0PXLC5kNvb325Wm1qMGvChz1fgrI1ui4mfDKGG8CJwl2yaBZeCm+L+8ngvd2rvzLHlRW
 m/4OfIaUdX34/XGHKeHuaHtO4MhQSjayaIx3CSDBlbTL1l99A5vKDtR3L4ManpS3pdvZXMOTJnB
 sSh1uZZXKEEibVXvsMbg4drQ3dMD2PmmAPi5p5bK9xha22IC57bXoZXCd/DhyUqzTkcH3BZajjm
 Pd2DXWBaVDX31xEetxxMsX1tYtQXv0813BtAtUEzBkBMiGqE+NScNqNJRdUCX7U49EDBiPXm1uX
 wR6iv5OR0repO7yAfBMm04iCZ2x4ao5araMWl38UpW2c69Xc4FaLSgwURx9i5FmFo0IX6KutgLg
 cMyr96I7WY72Ipxv0g18jB6JPGU6GZDt0QMc+9tZ68GTnVea7kjbqzqRKYYZ5pNYFmRwGh5cZ/B
 lD6/0leVK5HKxnXTlUA==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f4dead cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BshQC2s5e-qBobt13pcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: vLSNHzQD0mlbSrzQkn89GCeIgaqSgk_y
X-Proofpoint-GUID: vLSNHzQD0mlbSrzQkn89GCeIgaqSgk_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010169

Add the interconnects property to the common SMMU properties and extend
the sm8750 clock description section to also cover Glymur since it uses
the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547cb7a92823adc2772b94f747376a6..df67ab2aa715f81f5a10678b936558827c105bd9 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -243,6 +243,9 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -566,7 +569,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500

-- 
2.51.0

