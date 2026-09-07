Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC0D46DFF7
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778296; cv=none; b=CC7odIEEgWrpPlC2x55DfsBn9eZORVeHID8ZIG/FoXMw/pzNU+s6FRFDT1MPrC68t/Y9zY2LbfJ7TP22w2McF2XGlnXw1Jw1IwlcvEpariah/P5ns6anzs1pnxEZBEKNcnNHNz3G7qBSD+T/LRwLwtBYsciTUw/6sTjwLuI2nGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778296; c=relaxed/simple;
	bh=95bc2dL3j7zvq8sUrPF+9bW5u8zLw6OG/1joY1aHH+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9OnwQMn1tm9t9ZsT/RO9mB/KjKcpxArAOrw69a9tYm4lw+XI+v6YDwyzQdjo/SxF6+UAaJEt2vvfYA9uSR1Nc6ftVbvpk94YiOVByTMJoxD80vtYQ8skrtsG3TMKzTzAL5mSfeaDAUxARKZjoxaOiPif/T/os0Vo+3BZzLMB2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnv4DWm7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4PhuG9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnv4DWm7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4PhuG9z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnGaM3863138
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=; b=mnv4DWm7lUIjYC0m
	1NpUGTYcRsRUhjgsEFdcrG60wh6k7akZ3QUT8+2Xvdb/VspS2uaPdXeWQ760SaAa
	KJW8QkR3JI7OnNu2LNaW49ydQHuNnm8h+g6rlkQjXlsyCeHre4gSIGeAPa+B5vVM
	SIbejZRUQjORITbNFGCE5Wcu2b3MLpYQ2V/Je9lFtOITNZdnlBXzLvnz0u+w22HI
	o6/rHA2xVPQ5Zk6sstDb8ZQ7JdclrduyJdnyr9gWAKgfHh5PHBr0JzBEMiAnIdRV
	EGv0XksXXUIN2I4Cu3ZBXPLmqWugV1zhORV3hc5qmZ0d8Uy6LbKfSaDsuQ1YuvNH
	7c3Vww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hew2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:51:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso417050085a.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778290; x=1789383090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=g4PhuG9zqQYUVKYsnYtY6qdL1nn457/SJwNd/qFjNJghDwQxBorywWasQvcUXz/Nod
         wDiCRokNb48H32hm4rVU7j0EzxHhfLdmjy1Y3jTdOzFd1aEBOwcH7HXiHEsxo3qbpEjZ
         ghA13ylhhISJXHDIfErNqldBdlSehvOp4DYaADqyqJkLaIyeJjG6xWdeySETmzsz7Jbx
         Gd2wikG5D8hB0hPWjitH+SU3ApeJPyXszsLxXrMT56NDA8PoUAIzJAg77tlPslR4EgNo
         xm4RTYAqh9GRLR3m0r/plFnwQCAuq8Pod0lzS5PaDyk28XSDJyvf7d24ZLr+MxhP7GY5
         UCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778290; x=1789383090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=TnrS4DxKgNFQT4CLe1gkzglzlyN8uCyHaDrrtZW/LTWZuhqJHkOWMkzXl9cuJo4Gp5
         hNs+/Ookh8h/88sJ5sV2khVC2JPKX+ZStEyie5DBzpDppn7E42U6+KsesBbn2hpF3oO9
         TTp9kahtV3cHuKtYIUtMdG2PlwJFvSdcNBvul1u39vNLjhYD654xztjtK3YFJdIm9TPC
         4K11KuQI1dYwJzL7HEOKSUKGP+22Ajo7pz8h1ESWjmu/8cjx7eMBxUVB8+Pi7Vc5CVWi
         59ej1lYUVJyCaZ6gLlT2oJioMQono32jbFUkHUMPq77hohahBgo76imhLEzE6aMrIVFf
         3l4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxC+mKkgDFX08I9+9gP2+rYfq1Qc5NK6wHDy8VOXQw4bJT2X7yx2kKA9S35xb5Sn4oUBOf5ursIsc/H@vger.kernel.org
X-Gm-Message-State: AFuF++nTAcf2e/TAzhlGc5sXMT/ApTIYyWf6TMEn9uHSjMbRPUOBgAIK
	SKkAQSSBIOBdQkTaPnpb+FQMCmsxFJo6SViQ+a7FQTpVQ9uydMXalF31533qGd+WQDYqgU/ChY5
	tzyxYMlgnhkwUrUVyhei0/E27MaJ5g1946l2FPsx7YD1IurheIYoZcysaGkxWgTCs
X-Gm-Gg: AYBFou1qgMUgYPrsIit0TmM57C/MSySTYzdhPeoRaw4DaykU/B8FrVl+lPycXJ19psg
	sikmiiOqpBMEJBXFVcPDdu//Bfji1mtcoeS45fS0XA6N2lzmaIrK+NV/HIXvG7gaNjxHynXWWwJ
	Ov970HckBc8Ity5IUsPqUhfb2QM7TWDpnn4hb7Nzonlb2TwODmReUw+9M9z+60Ub4rIGBa+rjG2
	IePif4aJrIpl4TL1qz/BROT4lIAph+WHbhjgjVlHS0py4V3eHtcGrUdyzfwCMsbSABORjXjGI0g
	0hY5wd5wlBgXIeNq+e2wGNNYgxqQ8rbquvVN41VOkF7A47UtHJxkclOm5e0M9rYoc6PwTO0Yq/O
	Q8536DEHjW0EGrhee7rRJ3azlYYXb0+t7F6ybjfb74Frh1A1J8KDJ3eMRA16lRrWLn9WYPKtPcN
	H2qxug4ie7vERCLhXaVsl70Fq4k/JEX/96Lj7XHOkmoZRRG0e3A/o=
X-Received: by 2002:a05:620a:2ad2:b0:938:39e7:725 with SMTP id af79cd13be357-9398044de6bmr2002578385a.32.1788778290151;
        Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2ad2:b0:938:39e7:725 with SMTP id af79cd13be357-9398044de6bmr2002574085a.32.1788778289725;
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:18 +0200
Subject: [PATCH v6 8/8] arm64: defconfig: Enable CAMSS OPE driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-8-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e9732 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: G7SehsJ4B9LFFWtBBAkS94b5BgN9Bl5S
X-Proofpoint-ORIG-GUID: G7SehsJ4B9LFFWtBBAkS94b5BgN9Bl5S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX+zj/c013PW2o
 NKuNL8gaHKPcrR2r8cvHeK7WP3irX+hoc49eBayKJYd9d2Y2ViogrWXf0eiPaxJ8slMJdZOp5Cn
 emaAYGIKhzTSwvq9f8MmniWPXukpZJk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX2wJxdSZPbye1
 m696WJtQ9W+wtGtvTqD79xxfBXmxFzmhL42Hc5/x6+YLbykbRamk4Ob/tk48BpXtWaU7qqcWInZ
 YrgxzhkHlpdeKcD9luw6TWGxsNVaQjY1FPy7tRsS9X66VOEcudqIMTROEdbONJsFJc8w+CGbh+O
 Jlu/GaMPB5qfFetMOOU3MywVgs+yqoj03PQK6yw9OKxFGQM/+NzuDfCccOzNj96uHnNg2pdhgUw
 M7nMSedb9ULdFkbk/NT7DEv4mLn9fjE4Q9RbPgdXtrD9aDrzN7Y3z/2TLiJXhQZ856XjKTh3Ngg
 ev843gUkhIg7pGXXzMbW9A9OIcOo2xMAM9u6nXMuLKx1d7tUND9oIzqN2JMBg44VcezuuoZxjOT
 Z2x2gZ3pCsRBUZAPWGtDep5GaPE5X0+of808t4/JEBO2G7m2a4iyxa7dDJAidJj6a35X84NWPW/
 P9DEdDgOim7xchEZgnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).

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

