Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2095C379EFE
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530061; cv=none; b=PqdkpheyHA2U86+1DT2x9vfHOBaN4MNb9gLPzxI7+qHcLx7SJE8Omnq2ScaBnIG9h23ierQiytJV8AR+QiKFdyz094bSSlX0j3Eo1VtZHusvC4pFaCo0C6LwFIg3XAmTvIuCsKQDFI1+gq7ZO9cqHqjkecQp67/LboGNC6nsN4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530061; c=relaxed/simple;
	bh=Mpr6Q33aJKvJH4hPu7N8/Msc5ivh6tKB28dTURNeqko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBUAZWm1wRk6cWaHWCxtYNsNCaxNnAmtBib2YQ/R1qbORXVJy69Io1k4a00mYKoaKd7vKFQcmUjgSY+3lFoikixCc+hwpeozV6/7wexudx5NwAPBtFnqsbV55/r+NNZZgKjBmv/S4j7kZe01O1vzj0wa/WpAzAzMn2ai0p9+HhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFcllWUa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnAb2x05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFcllWUa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnAb2x05"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK7BNY2804751
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=; b=XFcllWUay+9RdocR
	s0FI4YFR3bEBB2hQrvG5Jqm6twOHRpyg4YmErW6GeLCDH1j0rJsDAMTQ3XBf/Lj8
	CYirf48uZ3If66DyeyHdxAFQZ+U1m98gGpZbbtRm4XCG/Z560bozfPOrV+TMC3mR
	BjNtDWyM8iMlWSpyAY7phB6n3yn+M9BJZlIe40inyUgphNdPVCmog0W/JH/wVFLE
	uih/7WmDa/ixUjc3bvxdiktN/oNYgLYRv3en6VTKJ0C15kHlzbEvbJjhBTyA2jcf
	ULzHtOtcBVliv1VzfzSHGjNRQ+r6pRUQenXuAyymzfmYtdUNwNzHmWIN5Plm1o3Y
	VJOw0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv3805j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so4012889a91.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530058; x=1779134858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=;
        b=dnAb2x05jXkva9+H+u5XqyNSpPkfbasLcoyr9VxjHYZNZwypy8UPNzEJ5aaVUEPcpe
         WcXzyBsCM1m0ZHElO3ZU66/prEifCExSIEzVvwwdz6AmxePF4KPloOzBvzc1MSK5rbGF
         Q68LmQdjGj5KlpjN1iuiuSDADVQ2G6R5FzgVV1ANUH3YeQ+98GL8b34/rMtdD4Hj94fG
         96zd90lFvXqgP2NmnpZCHbWQV+XUuMuUOxV+GswtmgwCHK7MZb1cFWroH9M3hESjLFK/
         6b8484gMse/F0fOVWcvRlW3dJVbr8txGqCHWKy9qughlD9F3nXj4ZCA+S/LDvZ1uWYcM
         UN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530058; x=1779134858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=;
        b=Cz58Zk3q3pKqmMfD7/Qu0i+sKA1FPffu10/C/EX/RgXQ163e+MhXHxFOVyIrKGBYPn
         yKXZTOck7l79cHF++64GiSXgA1Au8afhblZ+PeM2sBIjM23j/Zv8mQoIN4jZhdBB8C1h
         xTf2ZB5wP77Mxd2KgzTgKdM1BfzYLWKooD921ueyL9SZYpMKHE0lMIcabTm9VQI5Y0Wi
         GDkt1+p6g8tXtJKmF/yCTYhSFrHharlmhcTgR6CVlRBG1Bfp/ueZU48vTsR7lQGx+dcN
         shTCap2jHGDsnH1g8XyveJN9HibaTnw7GuQraP0FUg6HdOLfWvTZGRYkWALANdkPOg4u
         wDZA==
X-Forwarded-Encrypted: i=1; AFNElJ/zH0PFpOola3/Xd/JZNWiwViVn1hAzOjBWO2Pgmir593jqjiHqzf0A0Wks4PHM466sezlWlrp8GT8p@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtZv5AG2Ak7wfkAPNADei+sgknHd4lVzS2Db8yqx9iFnYRMS1
	NdEtkcTdrpJmPwcJyRUy+9HThCq9TfK4xhM7+rl8OXgHAQz7XxNEYQ+yyVX+i5330UmN+5FtPjz
	XSGJRBEfn9M0G6MYsyfbS2Ly5RUqlbafAaoln+R7XtGBMHLUhgyAYuryMvxQaCkHf
X-Gm-Gg: Acq92OFLNzTscN/7mncpzyKqqVHuOcHNml7vvUskqpKqihpTvWeChueZxD/2wQiqdM0
	sgEOUXejBEuPOAFc5Uo720ASIlmU5bHPeF4L/MYIt7TXaOHXgFhU71Ool84w6ExX/0TXjdKx6Lf
	qAwQC126Ga+ETFWnKZyT4+hfx3BvJPRCKziLd36r+flkrsg0+kqmdT59FYsRV1rxevqCLZBIkrF
	Ns5mP5fz5sLngvCt82VKaMBvjJn4Q7AJBxOz0qLA676ww4G1NQFd8qL0wb7lSLQxLkBqrHFNF/W
	McuiYqkNZKuVSTA5fopsQVOsJVYHjt2Q7rtqOtQ8zv8z3kjnzPV3TpBRFlc+mmVrDkw8R1GjLh8
	YVAjv58GSd80q2CU4PXoKiSHGLyqy7vYaXHv2yS98cqnkjg==
X-Received: by 2002:a17:90b:4c89:b0:366:159a:c1c6 with SMTP id 98e67ed59e1d1-368b22ac929mr135508a91.2.1778530058228;
        Mon, 11 May 2026 13:07:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4c89:b0:366:159a:c1c6 with SMTP id 98e67ed59e1d1-368b22ac929mr135487a91.2.1778530057776;
        Mon, 11 May 2026 13:07:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 01:37:00 +0530
Subject: [PATCH v3 2/5] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur-gpu-dt-v3-2-84232dc21c03@oss.qualcomm.com>
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
In-Reply-To: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=1607;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Mpr6Q33aJKvJH4hPu7N8/Msc5ivh6tKB28dTURNeqko=;
 b=ekTosnc5DQLaWUndNzB/IGlZkotn0XZ9ww9uCjL0bIlNAzL1p1kuTxGJDPkkZ05OtUKen42Yk
 kcGU2RyLwPPCOPKLZaEjrhtLZVKoRDA3OX3zfVRJl2MP8AQe2ZkATu8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfXzFYpT+e0YkhO
 g/tUc7aywectspjH5X3/6U0v6viqi68S/ctnaJVOHAy6yAhQHomQy8n6mdfaHieGVNdldtVuBwE
 wDDU1OGx4Yg2IHinK1PvQQZ+s9eNA8uDKuyC3IqB6RMe3aPWUQIj8gK+ZJVkgh1NxhUlm2viNqR
 Yc+5AgxZX4meDb7xPMi9ODmrLuCPo4Z6Pf6lQWl+wtZfxwFYmYo41mwF49auPNSoJ1fncOrSYdS
 CqFVv9/z2dMhnsGqowIBaZXKhCm4ZoMMQvcs/dzv/9N3Upsqy7wwhZYSmi6Rjf1C9hZJj9jWikZ
 Xhnn+OqP6FDQ8K/fzhzZOht/Jlcvo9kBzZ73f6B1PQS7hkP8b17ceIraUGjvg/h8LuUkeOGIlBq
 cFT56tPSBrSHoRDlCRMp2ra2RgTgqQ==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a02370b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 7A4KJEGGBQAqIDogdM5MkUtWYQS1Qiw9
X-Proofpoint-GUID: 7A4KJEGGBQAqIDogdM5MkUtWYQS1Qiw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605110213

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..e67cd708dda2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -411,6 +411,22 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-44070001
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+
   - if:
       properties:
         compatible:
@@ -434,6 +450,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0

