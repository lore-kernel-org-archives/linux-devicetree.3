Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7413314D34
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110929; cv=none; b=tj0rSuOU72e/chLXEl6tYGcQhyqIqyrHexjXYtGlOxPcIVrDD24gVCN/dm8ev0cYvofLNjXD/yWv/q5RW0GzeE8ynu677z3snlgR8a+dwt+tdD+DTZxugE+4cJLKDA26OTls+cwj0t0m/Fzo/MXHOlAFL8Ockho4XreXVaYKCik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110929; c=relaxed/simple;
	bh=rYZUtLoMbkIwkI8yFMTr/hVq0ZeMXm4yVfo/qe4LXmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7DIL0mj6bdUkEn3LgKsnUQB+400wEsv5QeZc1aiE8rQk1VQuWQoM1BknPk7aC4oXBAuWihMIqdWIEZEh3Y3nxBaT/hz67d6r/nxWZlJqYzA2FboFs+Fz9arfH3PSTL6w1x+ybqHG0PfjSmu5hLENeDUVSBEbesg/vZyuycxpT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkVbzb/m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JC/weDX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkVbzb/m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JC/weDX1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPjKW1031220
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=bkVbzb/m/+c8R/ds
	OquV2I1Ep8YCvaIC++gxM4vg7K7PZSyc4jMj+AKyLx7efXnU0ngZBlfbyE/mz8zx
	QoBQ5aHHH4Omjfwr6F1zNttJLcZsyTllra9bIKwHyEXb4rO5nagPVeFhUP54TACx
	BN9fYt8B7UxDdMnN0szkJvvg0GJLKEAjAQ9/9220RZT361nl7NK6ut2o/3loNwy9
	ohJeLY82VilBIvVO6UhCaERmW7I9zGtDYy86C6yqUarNARTNCN+WJ3Btlw+T4040
	eI4rQ9QPKPG5sicGAXAes68UDQNbBYYCHYOHpDUt2rb4I3IVUCtIxAimKEXqF8P/
	pa15gw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bw1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:35:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so946817a91.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110926; x=1783715726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=JC/weDX1V8gw2nAvhbCzLbA9JUbJyDv2c027Sm5EI68htpYLqZGxdfgh4DJL4Ew0w1
         gdYXKQzndBfgGRsBcsoWjHl9IQcpdL/DsoNaC47nK4y81laLF+Lqmt7tbkCSxON1zbXv
         7aKDHiSgNROFfvAzla4H7M8tGvj2dRffXLU1MnNUyad2dZQeBRvh7I2gUyXviPWFvxKV
         evfRCN7FlEfvUKtEfH5GEUbamhPMorlC2PZjsTMFht6zElGKJOVM6r6R607sDP+G+rtk
         Uyn77bo+dG/uXPMjWxkBOVMLEDUAiHDlrxIFrnYZOrbtnILmq8GOYmBJp+0G7HXErwdh
         +zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110926; x=1783715726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=FXR9ediYp/dw2DImT5evJSZ9XB00YZwO4uwkjHxjdkOGSPnSbiObKx9Ss3hllZaO6E
         1lcb7JRM3KkSn2ZdKx0nCw6tIjy+gHOXCb0WJcQuie+aszXXgYdGLW8LmthauLOpPPA/
         PLFLVRByazJpJbbPonrtn18PwzBCKzFiv9OFdPLALWzako3FoYTVimb/a0da5z5rMFaD
         tIK05cSfK9Q9+VWa1UU7Q5U1JYlnAmO67dDFh9waLxBWpoEIEgA89QNedntBvkrnX7eb
         JWRxHrFqX9+9TmCKK+mPYZRKFpLZyL0x8Ab9tUJqZvRCtTmKJNpZvHwVjXR+IeUzIRWH
         SlQg==
X-Forwarded-Encrypted: i=1; AHgh+RqX2xrLly4WRQXItCt+EsQIziAOiJNA+AoD8LSsHTl3o6z6Rebj7GBV5DkW+Q0qBhNvkKZGX2UxiWLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2noMDFMr1JzyVnpfpwThbR4WVS/W23+nxMrqGoLOmwODB5Mxf
	WFICnr2zhDyYSX+vSC+SflLke1pbxIeLFP0SaOdFp8CcsHgFkhKkh9We46QhZM3bWDboAeB/mDJ
	9s066h33dPUNgcmRPmwMD+ChPuUSgBt66/zFByAWef/Dury98+Vncxbx3ggUDWUrZNw5vCbiv
X-Gm-Gg: AfdE7cnV9JIVwGfsv32SLuGnJUbtku3HV0uDstKciVCXOQd++ZhdKJjBZ243CLRIrnu
	mwfb3AFT9o/JAcDzfQJNWnIPcMIWKUBVsGsiaYCRQ917coMT2hM6bqEkV4ZleVX1j0irTx09esg
	+DGyz9TDoDR6lkfMzHjd4Pp3Uq8TjlSzTACB7zW7HwU5bvSJbzWhiRuA5FAK8MQCVAombJWiBOz
	ofagx+8nXJyqoHsO4JRjE1H9B37az1YEz5pbjkFfD94syTGa8mE6xxf4TO/vVN2O1TtPSaHdA6N
	KoZXY2RicunKjevGNMaQsiJWPvNjqc1iOGGL2Q7BjFhymEy9uCL4Xd2mchY1FXuwhIJjH4NMIX+
	JAKOdLk7UpMSWuIDcv9c5HU7pFWYSvzDyAN0=
X-Received: by 2002:a17:90b:4c4c:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-382800d2225mr1038713a91.3.1783110926370;
        Fri, 03 Jul 2026 13:35:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-382800d2225mr1038664a91.3.1783110925866;
        Fri, 03 Jul 2026 13:35:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:27 +0530
Subject: [PATCH v4 1/9] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-1-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=366NlHMFnKH7Fuj62J9JVaF1Nr8CsES6ABTopFiQsD6b4y9xxXYodoaDhxIvDxQzXBPtTPNRB
 4O++nujOYdvChSFrKzJQei8xwwbHJTOg5lXp9iD3kMBWnYPuMWgEJpm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXxjWSxekm95Yb
 TJBE9SXmqGKEOopsi1gLerMhB9PwmqVLr0MJqsLWsHRpLRulxaxQgeR3i/SVxbk3e80WEP/2p9Y
 PpPUBB/cfnVOCsdmBp5IWIPhNbtv9Y0=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481d0f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lQqIjGt0wzeb6muPP0rcPJmgUSZiz_8W
X-Proofpoint-GUID: lQqIjGt0wzeb6muPP0rcPJmgUSZiz_8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXzwe1+Oy/oZHj
 UVpNjX4oFDP+thBvXZ7JKmF/QNx2NlIOoEvoUvUOIW6pW16ildxdQbiDZCxnsSzV5rro3PjRYJr
 sYasPnVeql32nH+bLgDbRVxv1tB+ZkE/Gc613k1mynO6/nhrlq0u7uK6JsmS5cqsDcZdR6Tb2lq
 Yl1mkGiS93oUsoHJ8qhSbDHPuHWOxNymvpdTdePnn+DdKpZB7gWouwHf0lKd2DgdQVHg3Fq911M
 m16+Ek90RZe278xw7l8trldk6vz8cJFvLTufEzPMHvhM5xTcxaivLtfaAatH9hJFdEN9zOHYSLm
 1XcgVTLlD6yHq/rUon4ZIWpIM0EohgnFYMTYqRX3kmtR4SVKt0gnvxEAxeDV1+FxGnR9Hwxw7ZA
 AxQLzq8CL9bxO6x1O7k7VU4z1qu3hPOKrA6szKmzc5hXckDi/wMk3LuQCrt9YE6pB+GYGiqjSmV
 2R5Xp4FuluRCZP25pSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030208

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

