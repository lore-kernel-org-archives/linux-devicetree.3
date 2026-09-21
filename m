Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4C4CA796
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005021; cv=none; b=H5Nv7PjrsJtXBKusqi+cx6ediHolmqW0yFTYC4kvtGnyFFZNGBiBctkG2f+tGURfyqp8TzRkinWkwNGd04y6jCkIK0P20fdiGqhr4icx9s6WTnIbWifDVBqZ+QNX8UcjBB5MUXHZKbxu0Y/m4p9c9aC5iA4phGZO9JuVDRgWxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005021; c=relaxed/simple;
	bh=Dzpg26Vur2DCvULsTE9E1JAC2Y7NSf6GVeoLlup85aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cUt7Ryt0533qT4jKkT4RMvrUwmGZ9ZnSaB0lR9s5m1jqtmfn5zzmOziEbkDlsH/fhRNvavBZih/5UmaF3at5nwkUT0/WctFsi0vUyJBCpm0TuK2b1FlOQrGVqGq879eIX8eGnWcQtGiEAJr/1pYD3gxJwqMDk6vVhN+H83TiPTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDrsthxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5aONnaR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDrsthxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5aONnaR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFANqL1437861
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=mDrsthxlvOiXcuZ0
	5dg3OoiMNx/BPRHwYpIBlUcJeEjqq9W5Jo7G8IIrnO9xEzpF5Aqs3p1b7+gSSzzJ
	mo7zBZfEic7jM10NNihAaWhGzgcR/exiCRV+P/TG94STN9XkOJVysr2sIbXbznHA
	QL755wSV1Bx493o2iwRCF/hOjPd/EN3JncH0FYXAcsQXPOFhQYvo7eJ0VX4H+Kxp
	pLUPIFkRXuTX05yF+BVKCHs2YVTvQH2BvafyF3TrHMgolJGyEBjvKceKQDfzoxmt
	rkShrZYqBI1gd6bYUJCcHlHQEPs/AI952GAkBwCwLJLdX3lY1I0nIlesCH6Xwp2H
	6jG47A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5jn1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79013d05471so899307137.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005016; x=1790609816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=G5aONnaRPaQ0YBZ5zBm8L7Uk9SgemRCmr1fn8d3YiOEJM8moEFN7u0U4PNrfKkGEMC
         2FjyTk5WsYsu57Ii5TY7uFLbkbpIwKG/MXmrQANrfTNf7Epv/u8iA5kH8LGHvkWOmvSU
         ZtPvAQ8UdrcX/9OJTJl2e2X5Lct9/KcXD1O6aSN0NpTQSyIiMBCfyHOggV5vSkWIZr09
         U37V35RqOwpF4lEKcKW0XdfCJDg93ISr1vuq2/2Aus6zHGwfIkUqS4HtVyytq1X8cmg+
         c8F1pOSBsBC4FntRU1MONTWRFb6b/8vj6yFdGzjyTFJEhwJLkdBlTkbEGPajNDt5hBQo
         tEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005016; x=1790609816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=m1M27Su1r32LROWWfHCjoSVy95IWgoes6eBGgrLYCDO5QVYjUeQXst1I+Lek7eaoIw
         BZ0DDSL12Y+9M0O99eih+b+bxDT7ZfrXry9VTj+gOuPNXsOPanhNeSR0lyUnh73H3Bhq
         Qba+XB9uYLLe+zWdNZPwaTarDgKfuKtZgTm7QKuQYMgVyWK4ZypKanTeJ8qOWsq8HT75
         YG5zLwP5LQpZJ+wA1A/OSb81Rmh4iGInPew8LVWvf7s40cjhTE1K8RsWtC1LrNRFJ42u
         JzGfbsDfQjpxsz96ZxjVhAOlOCMYKRKTK8HER0sZEgaC1aaZRf2b5qlVymT5TZm7Wh8N
         9CjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfs5LYjORWr0czXAdmImjUXwb5yXF2NHOzt/uF8WCIhiYqMbVpPsTX35AUPMhdi21TzFJjkMkwgMRb@vger.kernel.org
X-Gm-Message-State: AFuF++nsvs2vmfNRlWgd0K+n+H4ZBRDmgkxxzqXPdiyml7lhIFOLfgF8
	z828ugTjJn3aCQ5E5ahs5tG16/1VrZSj3QdbFFOI/VHJ/+QzzpPspaYeL3Jd0dI9sBOwLG0Ig9y
	+n/uj27PggzRYClzcMCwRw71Xlcvm+QJHKlP419iXw6sdxCVHPr4zMU5GH/Ww2y4X
X-Gm-Gg: AYBFou1NL2TN2OSQHkp3HnZEPLi4Z7ig20ho8yv4zCym73chP+ERQd8zP4sa8rZzaY/
	0H5w5MqzpfJkI7ONVtG54uzBwPjlsq+dmsIQeA0QSMkfFuf2O/JG7dO0faDtf2G0yRMma0hlQXy
	MAbZilfFk2eAm7SAiZq83A6N5yuSW7b/RfS74S/HVwmwM4qF1TC/QbIvJmw7C2xZ+6HXRMvr127
	maGo9aS3r/GCDb88zl6Ur1TQmF4PMzvDFvWBcBCiq2xiZkn5M0Csa/irnVMCHt1kIqnjFCckjmz
	qFYY7YdC01GSwDqEAM0O1VQWZ7Pyjf7J1g60Rmb8NcOZVDj0QX/gcNwoy72NxMYGhcMkwJkZ0KX
	bOgEn+chovf0IE8ftFJCMtAWilPU3lMDwZ287BS4b/6g9TY5YLFQzYPriWT79BZYIqCFP3dPf9G
	PUESBh20dHvYfv264btvd+Lcy6OPkZ6A78vOLXAncPadG8ikCAcqs=
X-Received: by 2002:a05:6102:a47:b0:7a6:e302:e24f with SMTP id ada2fe7eead31-7a6e31243femr2983735137.24.1790005016123;
        Mon, 21 Sep 2026 08:36:56 -0700 (PDT)
X-Received: by 2002:a05:6102:a47:b0:7a6:e302:e24f with SMTP id ada2fe7eead31-7a6e31243femr2983645137.24.1790005015014;
        Mon, 21 Sep 2026 08:36:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:29 +0200
Subject: [PATCH v8 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-9-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab14f19 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: BHE-4OXnMN68ibeTzZ4tpi1Sc_Ijsc38
X-Proofpoint-ORIG-GUID: BHE-4OXnMN68ibeTzZ4tpi1Sc_Ijsc38
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX3PL7HC0QCgQA
 ht6Xb6ZrOvRytl1OOxI6V1aJbwXBu2msRhayxq4zev3UAJ342CfkG7Otf/A6gVTEDhw6VC77sqI
 F2OjoeLQhELPyg5TF3EhDATWlLEQkj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX97yAafH1VzE8
 bvfxzMNAWfE0tSnU0+ru23Qro0x7+y77nLv4/A6oHNGgfPgIvTI3wsBzLWASi6PyqiaJyv0WNTB
 tErdv0O+XuG/cA99I/cBj1JXjDHpmzFx3xT3vgxMlyuJykouKOWtvAx2TOYNfK2zEYe697lFQZt
 amEdu7kq3Sj6la1jRqwYE9CDOcTcBA1+qEql2yiSzY6pMindvhGLYksQnIgyhr83BGdF88fy8Sk
 9aZvWunk8uS8TiA3wO06RfibpL+kG9J+iHLZ7Y+9rj5YQi6oygVuvd8VJHj4sdjwycxsRqTRJyy
 W9fnRJQI+2yXEUp/u8wqCY/JA9rCvxDVP3bXpvSz728lLnAkR7PwRdw2yoh1l5tFk38yXvLgV12
 nvRJ1wJy0lUh9lt82fbYOQn6OUW0F/sy4ub6GR0NsIsiNlClvfbW2pFACS/fJMPN/+q1kIJ4x5U
 GLwZOXh3tnB4rA+twhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210227

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

