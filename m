Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007357;
	b=OSfiht20y9KSznAfSNAO3BxnFmvpHA0URsQ+hyDMWgLhh5UEfOWrj5FpHWp7PnnpLZ2g
	 /v5JWCX1Fon/eAzyButCJQCFOWpzNb9dpyK+cvD+TTAtHG0wK9crgO9LSX29SEHVy1oBr
	 aXAWYGBsSepBmA/VTYi0sgHqf3ci6lxgZPrsg0XCVWJJG5TSW3tFWXef5SM55LcXJaM8z
	 5dtHXrg766xEMgtN59x1lmqiQK98fnfbhPGOwCnbHeIodyn1j+Y0FF4+R5swqLlXzSZPA
	 WogLIQW8wQmsGQMvVKHZIZI/mBx/w7nn8EbB96w69UX1RZ9kpoIZJjq5GGwKG9mykbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hGRlOCITxGrJlyMVtqXraDekEyGY6Do3g1FwaEQjkKE=;
	b=mUWGukL+bfCNUttDvnVJdmv6DPHm6uHoAff85tQHlP0dDuLPmpM6ujEHIZt4JmodLoxT
	 2CQLDWLCUzZue29cUJcKvlT1tjU5BoRSz23He+ZZfvFl6gX+q0XYHbrX3b3LYfSt0W1LS
	 0Qh+OrMkf3gGn9ZNiM0fmbPz1oTkMCDC99r9rzxqsPtC+FhNJ1tCN/BD+cJHxeGuNBVtu
	 UCFRsWl57QNVM/P6IJ68axulVG4YMmOJ5j3Ou765Tqlf+h4mUV6CidKQWKq6bG5WXlT5v
	 QEmJXRWVj1hPo22Q/dJkncScdmPd2AuWKF+Mx8Rs79aqhFFiITjtvttBjKBJjBuQQ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emTk5UXQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8BqyfOt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9CC606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F9CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emTk5UXQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8BqyfOt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLPMx236766
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGRlOCITxGrJlyMVtqXraDekEyGY6Do3g1FwaEQjkKE=; b=emTk5UXQE3v2LVIL
	PL71S2IRUG5Upp4XtTueqDaRhiPSOmfP2VfR3K/gWTmVMxm1CAXEP6ZuwDv4WtiX
	T4ud2ylNobOBIQX5E9LP2F97jGW+p2iUDTOOlOaA1611yHOW6Ome98GqU3/s5m8d
	5eagLpQLD9e4atW42ZmPBRM2hhz5tS0YiiFcxFencU8co4qIOE7n4x6itNlzRoQJ
	5R5QiPJpNTwbgnQ9CA1zgTO9jDvujbzMQeDw7KxHvsxZKdrX7hZvTP8l8XJyKaiQ
	MU5GGG2sciHUj9nygHX7IcGidY5NVKU2F/+VDX37MNYLUQasigN1Zj91RjewFsbm
	9FuYSw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9k2qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8ad6daa61b0so57205b3a.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007354; x=1795612154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGRlOCITxGrJlyMVtqXraDekEyGY6Do3g1FwaEQjkKE=;
        b=g8BqyfOttYw96Rfsm3eGWVJ7dWHo0fVtFYfZw/baCySlYjVr8745bDDjieIgBXP3Zo
         X9eCsGf+m59b382CgsVjnNKZqZ9ed/+dLeqSHxqyPp/Av/MewWMu223nAp/OchvSEBmx
         YjxBbYY0O3htLrI4tNc4Gn+2QcemysBym3MqRO3RcCgjinDKqmWwQ19JMaSrwH7HaTvA
         /8Bq/ZBHFmLYTDzaDBc8X9YQT3MLBnmiaUaOhOkxlteQSxLN84vK2o1GyR7zT32USphC
         IP39Sl0tVba4cb2ABIdjLe6nIxnD4BjxA/sDfJXhY1naGxW1woRvKWcuKSVXa4Z7i4ED
         iR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007354; x=1795612154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGRlOCITxGrJlyMVtqXraDekEyGY6Do3g1FwaEQjkKE=;
        b=IEV3Htya52h/u7gSVkXaxp1qPGB+5hxSKQGKIaVRcwOVWkhHvQAm/QAx0rTmP6+vlJ
         h5qFnIrr8C09OFJe4RNqx4WyCCxq8Nmumxt5baSPALPVMjHZepI0Wzicq5R5yobJA/qC
         7nwQPv5OWuUlz1kJ539uhyCLkVYGk5nMXCl6klmGBbDQBOchr0YQ4T6WMQvExjB0AK+g
         YvKrlWLuXX+GloHUwLWnMsK8vEjs5YQrNH2OybXhKQOvGNOthyXIepZQh/wj9vBDFpdA
         cIJbCYXMy6n0nh1/tmBqqPdApuPCcvbqD7l6ZgR+pH9l1pkS37w6bXy6MZb56Whp+PyJ
         KbJw==
X-Forwarded-Encrypted: i=1; AL+hErHff9gIlTeqLg2y1XG3jB+RfVe3QBLleMjq/k1uaz8CpG8dXSdQzJjHr+/yH3mE4rpo9ut2Oq7kUFXI@vger.kernel.org
X-Gm-Message-State: APuU4Z8YySDI4zzfyjy6RhxbqFnRB/TNVOjhbjTPk9X+J6gHDbGM4hxj
	rmfzbOvNzjcYT/USMMbwTTEAn0ds+k6iHl52AeMEuc0TYM0SqScRkb8ZSiDCZwi8tCkhSmaziRH
	JnEwXVMW57SQs3imJ2UAv53q0zKNF2nC9FGN//MP4e0YIxktnA76uJ+fr9UdFKsxQ
X-Gm-Gg: AZFdTZcaZTFY1bqq63/VMQe4RlyBLVeOuIw+DPP3PGFn5oJKD1mVZif/HwMOQ+bVWf4
	8D/gCdGo7wUX6sKkqMgsBqmuEWHwyR+vXrNec81ur2K+zjnXXIIiWU/tWBA00aWgnYLhbWeWQBd
	El5PWyKIQ24nfUd0dCELfqS9ShbBsxJpC+C8omE+gwaInRWRjE2XhxrobvPGUtlw9Mzn/5mcgbk
	Eb/SSAvSiVJyyUTyIH1bkF95ZKmbFlp57ENI4OdoFFllpOUIYwt8U1F1Sj5EG2Fc0aaqRIFRe99
	lL5+ICzvhiTOuUpFSKN1gVm7XmU8rehtvTjax2Nn1vJMsN4ggeetd/scCKkjSCN63F9BW96qcAr
	O4sMSqkuKq2dMZ/wR2Ynu5PAu61p+Q/1i7XYSt/gyoLaAg7SgPk2txcjDjXz0G/IHj4S+SkQPUs
	IebKIZT2ow
X-Received: by 2002:a17:90a:d2d0:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b3d064623cmr4717316a91.1.1795007354019;
        Wed, 18 Nov 2026 05:09:14 -0800 (PST)
X-Received: by 2002:a17:90a:d2d0:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b3d064623cmr4717270a91.1.1795007353575;
        Wed, 18 Nov 2026 05:09:13 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:09:13 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:29 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: nord: Describe the GPU CX SMMU
 aperture
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=953;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=X3BYyKqxKWnNq/2Ee/BaF5+6CSmMGjwe4nL62q2A2QM=;
 b=UkUP+L/Nz2kMolwrh3okH1PQP7XCpSODyv6+97tzssW3NKCY6eYnOj9m2p5B1domMEQKvaQWz
 SeiOJQK1+mgA29JPDjhLLxzxFan9XU8VJyen2q0dOtkyuDeuxgOwtLU
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-GUID: lUMYrbbioJ4M9Zar3uo34h606jN3D05p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfXxlpwVuSuzY5B
 0YQV9UUWxTmpY5wNNToV+UJtFa4DqRAtqANgcZHU1POZDvSFfCpP3NGhxY0NWzHfTm74oygaoD0
 Syr+6pIiSzQHlMZZYLBbSJrUHFVb1nA=
X-Proofpoint-ORIG-GUID: lUMYrbbioJ4M9Zar3uo34h606jN3D05p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX+Uo7S/i5Zx7K
 YKxh2a3XTazWA9WeR8Qh4hxNY+E6zK3yZGYuX6xo2fU93orchbDn1HVe7+7tMns/6z50Dc92dVo
 PTPRHaXwKEWait/qzzT9AFETWJ7wa4eIrP5hAQiPwfrq3bz162Rjt/rjo5WXy8hy7qW9OHjsY6o
 4zeCMyQ0lP8+GEYQJ8/mbGzouNLThG0OZnEg8c/wx4vWeYDukA0kxMLZ9OiGswvuWS6YJedJHMG
 T8+IoMirKVay62sktofc9TMLOTenkszlDrc01n1SsDmosctTT+aHF8Oy5r3WNbW8fvKIC0uRWGy
 TCYpbGi5GMSunQVA6f5vQkzAWs+dogSAPVCA2/m0hteZjZK+SjpzpQidCdDu8J68n8HB17R1fjH
 KHsZhxp42Omr5Vv6iEGAX4ikUhHc83bGs/J2pWJE2sTvd3kkEcAYbwcXOE6xFYaJIN9JV3wya5y
 jJvxcYSZOXtv+ATL2Eg==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afda37b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LT-FgXCurgc86i5H5_MA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

Add the CX SMMU aperture register region to the A753 GPU node.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 3e29c43ca9ad..cb5ee6b68779 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1717,10 +1717,12 @@ gpu_0: gpu@3d00000 {
 			compatible = "qcom,adreno-43051701", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
 			      <0x0 0x03d9e000 0x0 0x2000>,
-			      <0x0 0x03d61000 0x0 0x800>;
+			      <0x0 0x03d61000 0x0 0x800>,
+			      <0x0 0x03d60000 0x0 0x1000>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",
-				    "cx_dbgc";
+				    "cx_dbgc",
+				    "aperture";
 
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 

-- 
2.34.1

