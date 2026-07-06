Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C8834402B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371921; cv=none; b=BOOfI/CO6RgeN/pXtA2HbBXSDqI4z7NmsHkie6xqakXudn4vWuQNmQ0TMP3Th6uwS8WPStNkL0zG2+tCNL+gMUdXEa2qGuuLzrRKW1ZcN2H9OoivVfOVgfch/4teHx6FGanZuz7i6gJM6EAlnNQtWcvoOap2MvrNi3ybT+3Lkk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371921; c=relaxed/simple;
	bh=rYZUtLoMbkIwkI8yFMTr/hVq0ZeMXm4yVfo/qe4LXmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQAah2wxj2ghJyHYB2eXSuq83q8Bt04pXpoT/NH3+OyESPiVXd5OymMEtPXfCZ+JfzUEj9b197phsOdJFSpvDATvWGE4/37JlVHhTQ5/n6yVJnBHCGUpM20Cd/Z+dJRx80sWTNmx+9G8tDNGBy1vVL2C0TwuLpf6FFvswCMtdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZ8j/Qwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+R9WczG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZ8j/Qwk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+R9WczG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEGdI1505078
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=FZ8j/Qwk9OdN6zki
	9ictFYTUl26CmsJYocIGqx+ILtabVxrVN4pGZTTBfkHVczbK30QYv1weMMzUgYo7
	jTvI15GrM1ZEeAKXZsWDSdG/v0AqxDI/Z1LOAL3S+tIvqFmjQddC0zSqrTZXrgk3
	MXvTtfINgtJVdUPKKTpJwB5X3aaEscjc1Dey6kaJH36Ejtmi6XyxullbdYrT6U4p
	HJhLF3n9kQmTMnjM8RzJBvmFfZIxZ4IgVvTJITr22wml8oU1r+X14PwhJAny0D02
	rmO0CfyqzN9iium7+AW3oW/jQHFlpy0SpfcZ37eGJnznIs1O2UN3W0TX8jAPQbZ/
	DUTOVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jsrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:05:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca3b314193so60591205ad.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371919; x=1783976719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=T+R9WczGv3Na8pnNoroarhKY4hyXUWGyo3gaVSe11d7YfmnQHLJxmhBlJR2+G9eta1
         W4I+PaUxEL7YrN1qxaxuA5y/33rmPsNrDFf/UhwEjdDHfee3mOQfBaIGwjd11b4XpNZi
         ppWkWDliyyLmXT/v5XUE2HfapRP/IyreJSYzNBeSDiFLDhi0lBS6p7aoKCroZQtKN5yC
         sHLx+fcO5TxR7N6YFVzSMiQC/nGphkc3Xi+Dvb1i+ZpZDr1IgbC/vk69/aVQQq5km1Mo
         zmb5IK9VOeqAwG4vJ02i+hVOl44mtakNXtk8VSPpCnlJFNQA/uGFDmUPySC/WA3m1vzO
         TT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371919; x=1783976719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=DUc8KPV6A9uKgWU7ps7gLZ+OUkqgLx0/sCIrKsZ9xIgZGbazInXdl7/l62xF6HgUey
         L8L7MM1fAlkudSzy7mJtmCzQfDsP8wfOZyhV2dFFTqnwiwjrvKyScMTFXmlhR4msPFjK
         JuUmsBxaWrOcRGqsG9QVdjfCA6wgC6j7j083jEGcybRcaxtrAqm82g2maGxoMLp45yvI
         +0cqIQPicLp6IR0lsdds1tg7YS97pXO0YcmUfQsq4JsMawqNIiUmA0NKGRNL2o8FjP1v
         /sn9UUUUm4vcMHj/TpppcwKnH7O0lb/n8DfwYTav/423WeR9lvjCLeH/BLVJebdMEIgD
         c81w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3Ys1nioDCEArVhzZ7H+LI0dHSzf9cvS4GjRkSU1DspEZycjVo2f2ykSQU/92knqTNM65k6ka8bl20@vger.kernel.org
X-Gm-Message-State: AOJu0YzSUbzYsDRADToycjBHqVmVKTvNRvwltntp9UsxVq3ybLcFLSGc
	F+UeR+PIBrKEPWyxAoYQauaJXvfzoYq97ckr4olgu66j6TAjissCuIE8FU65ceuccbouz22q1u/
	6gu/OKaQYIeMeLtqqi6krg+2HcZ0aOFsR6CvM+x0LWyqyxMF3726uVpCd9Rh1yZ7B
X-Gm-Gg: AfdE7cnYKsBiZrE36L71cLADR19ugKQ+MgVQti5sFKI9b8Gwjsm3RyAc1Kfzq//IErY
	OvLYSoo93zma4CDbhcHjjSD+s9L+P1AE+1/Or0JchrFwMxMFBUwjaZCyI+kKPYfXZg1QB+W0+xq
	lwb7VLeo8+eDB7AtatGGEqNZ2qYM2LQTyNULPUHOVSLdpZU1Rt7zMq+qeslYyPptqfLUPuyGfTi
	ZbqiXNMGuDNZGlNiW6VmF8aZT9bNKF32IxQsl1Pmrpm9aPVblTMnd9iAgCZGFASM6mvEnkF+7IG
	RG97MPZT1wHipWneXexNg/raycIL9ZEviI1c0oJkbjHuvAl3asXgk5ws5WTBn6IRiBhf9if0yXy
	KLer04wJ4ZFJ8lH+f+5rf/toQKYZ3WJB1d5A=
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr23764995ad.17.1783371918737;
        Mon, 06 Jul 2026 14:05:18 -0700 (PDT)
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr23764605ad.17.1783371918261;
        Mon, 06 Jul 2026 14:05:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:34 +0530
Subject: [PATCH v5 2/7] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-2-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=vX6elNuOWQ/4xTG/AIha28ryHCrqCz3yvhkLfw4vwe9YMkegmgcm19fBeyeVORd5TxSW+WwUC
 /8wVZA0zXpkD5agy1gfq/6ZA/4fyK4Fhy6L2Kfebx+YnGBJfWNznNZy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c188f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX2yywjEJHMc6r
 iWCmdeZhHlVEOD5+T36CN03P0b0UhQvs5qaexBiWu/91IF1SDcc3qRndWmlQ781uaQCxw23u2f5
 tTNDrdo6e5WfLx4KLDVuIOdvtxxci1oCsFh4eAaMj1i5B6K9YHfcEQcJdaLXQCTGLGTZ15eCVuy
 u11a8cfb/lcAVwzqHr6hXl1iL8iEdSOF84pY+iICUhxfenTjgNI5u6aym8GbYWHqHjrWCjP6cDL
 z7SaRTQ57z4MG5PN45Jde1l//wOGlP5pDt66BJItCnW9iDXiXDYxL6Ft8894CnomK5g3Jcvje7U
 ysuhzq4v628VgQpjWWWZ5ndPXsenGBRpErs0lv0iXTOwOiP4J3VF/5dpovlIitcXn3+deWbGLfc
 qnPvAbSPJ7w/YnGU2SzdMYv/5wLE27iO8SAl5YX296tRJJvfrRbp4Ib9VJk8Mv7ZS7l8Qdvix+W
 hQsymUABCu1mkopvAvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXyUzJPOyz5VaL
 F6Tbl+yfRSUOrFEPF2IkEUqccYR0nROMCP8Klwu3iSBy5cvqu4DYX+z4V1Me0aCT21wQuEPAbqG
 UFc5f5GPFlDwl4UOwSh6E3OGG/Gfp9E=
X-Proofpoint-GUID: GN3FeAi53y-QwY3QDJN2tsxovdGbC8OO
X-Proofpoint-ORIG-GUID: GN3FeAi53y-QwY3QDJN2tsxovdGbC8OO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.54.0

