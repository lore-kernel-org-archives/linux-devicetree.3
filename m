Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5D4E01F8
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772390; cv=none; b=damG0N764XxKwoijW6/b7/MHYiuQ5V7kG6P4p+7sr/ixiq0oso/HQY41/scKpLWeHm5+3BvlmD2XRLD4I8gBQu/YWDX/7xiXEe6id76YFj1Np87K4L1TPiLBWZ0o9wLYwVjwhJGELJIzv95JJlVetYMY/Gr+FhZLpbXzmEbOF4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772390; c=relaxed/simple;
	bh=5nKDNvtW1OUJP6Sb+xn+Ybf82dLM6rIu3idQhs5Kwa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHteK1ARB8+HdYF6KHrVT3by28Yeu1WABwcDAi28w3zJ6X9nDwxovVLKKHAFOg6R7RVZJdvoc3T9F5J6wkucaObYb2kIDkeR/yEVDYo3TJ8CPtnIjANjlVfzu0tyHzVf4AHOH7MQ9tpt8FjQGDEH+HUOPYy4U3VvLqP+8Mnnv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXbfSCBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXBmjcDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXbfSCBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXBmjcDs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7F2t225538
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CmPa0zk9SMg
	32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=; b=NXbfSCBfg1porQtZtgNlqqDOY8I
	LSa7oSLIBODYUWAR6YoE6rlvMLv2M4OI6Ir74xbvuwxugzwKRYtnd++SIZRkxmfq
	RthS6z1AaV/Ykedc+fgIS6fwVJBgbaH5DM0eReMiz23rjxMg847QCS2GYIefDjyR
	U4elJ1IVPsIg3gy8yXSomjkD1gxTsZKeCSZf0o4GKK6iB8TWMCIJafd2nGterpGF
	MrjjZScZfTGYC2JkNyoXyYr1YZlGWq2wbhmpN/7KpvkPBLt2z4Z4k6YBhWOhWZGt
	wyTAc+cyUPBceUUQQg3w5KJ0ytWdytvDt5yty3IUgyY+JYJ5evWiTg/5Ibw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh80wny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b497a7878cso626961137.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772384; x=1791377184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmPa0zk9SMg32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=;
        b=HXBmjcDsWWPGvanLRCpnwD9N5lCL7pjEABXCJYG9ivuEnY3bikhd63/tX53oReTZOc
         byALpj7wyRpUGRBCnbgJBGwUlem5unB5Wlscr1Bj+nK5qjMGJp/uIy7d9w+gQ2zWtvTj
         c97Y7Re8euB899D93DT/yD+SAyYaXdSuNLMUqRAYTxFnlZmFEHSAkRXhoLVL+th0LhVD
         e8j9fQIiM3/nz24cw26XsiFRpWkCfcQj1uxPK5dGUAzM57qIg+FXQWTsYMuZvV8XWjfJ
         Dnl6BEE4r49nv2ZxP5cNHhBNChUOVYjww6o5yaY42YHGma0trGjmpZBf7UG0R5ROUZnF
         p1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772384; x=1791377184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmPa0zk9SMg32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=;
        b=UTgNgKqL1ZLrYaMRpA6hGo3V4eOJ1a98TvS0euSAEBg2x7D7xnwpTWzYjPTfktFRj1
         go/w0I3qqHZczORwGqoEjEo2DVOW3L+8LUb3HJ/Hf0v9G80pCUTYi6G/GDFlK4PZm0us
         dt2E/Lzq2rsbNyVy4TFyI5sn0F6dWCANg2XDBWIWodtOjcR56VHg96a8a9S+MgMD21Pk
         RHdhas+za9B6dr7vcMN0xEHStycWXM513eaXFU0DJB+U6aZyRa77M6aco9M50X82FTn1
         MUI9871nUoKVd4UeNrB4kdoMya/ZAwNyyvt1kN4v3rJuEfXUzrfDBQ+Kv+dNevM9vRfC
         yXzg==
X-Forwarded-Encrypted: i=1; AKwUvByQN4Z99XZs4ZBRnXZfksRU4NJjJTT44GODh3srD9YAHT73O8S7qHHWZpbkIztZx1Y96o0k4Z0D2Yp+@vger.kernel.org
X-Gm-Message-State: AFq9FYKBmQgJVD1oCUS2avRZ9spPZ66uaU3iGL7upvBxsuK8BdyHPcB3
	w1oooq80uZ6OER2HzsTyDYJhk04vg5v5dCEFgQmlLe9T/DX7ThqTpdEEyHDCZ6twlklELO4QLy3
	NfYR6qnT0eSF9hnib6c+HxwtLIYnr2d8XaBFbHrs5PD0fk4Om4Fwjm6+qEVpNZZMB
X-Gm-Gg: AYBFou1X2k19J8vAi4bi1e+nYRgGura+O5vmvza4CbG73+lfr/MJzWIolKA57oRk2/K
	KLHUVnM7yBk9fzFOak7K8ug+J/PB9KxUalVq8koN89SnNuhb/NRI2kAKgv2S3q/v2JWWrI014Ch
	C2K8VYE2LDDy5i++AEc38wx94eikerbIhDLKnc71mL8ZnihKhJS2mzisVLcNTxpNPnFE7OakDzJ
	nEpBPxSxEpi1ZWIQ1xEarXC6MgyXA4lkIZ1/VXCjr/hGcKQEaKALjevEH0/ngnM1LT4Rf4SuCxY
	cRLKUPXmpRl6ag/OONv0Nh3sUz9XyNVMgqN2MFPCntBEJrIZ7RrmNpaAwwGRmWvqH+moY/6YgE8
	GKP15LK7GA38Z
X-Received: by 2002:a05:6102:5cc4:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7be726b9215mr191799137.9.1790772383915;
        Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc4:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7be726b9215mr191776137.9.1790772383393;
        Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: defconfig: Enable pm4125 audio codec driver
Date: Wed, 30 Sep 2026 13:46:06 +0100
Message-ID: <20260930124607.1109167-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX8gR+OWaxQcrw
 hnUXmCrZLIuhUF6iI8dgQMVzTNE1EobGb1i8U/fH3ZujLrBf4KXLTHUp7Khwj5OLf1TC6sXpB62
 Ar4ixkNi61FgoJud2Vg7x8cB7utHFosnX5B0X7mvn5228jGWkZvMnS0W7WhyBwGe1RmWDVMtflT
 7SLfhAS3UivuDzOIU77enY6rnDLp8npMb9mxJPYSraqCucmCyyR6QbKbdjoghBQ/+Fgeghxcikc
 VtiXh8XknXlq5gxBwUVplwbjlQ/YGEC36mWrL6Ty25VRMTOEj7O3Gv4k8qxFqVHF40WAh2NddOQ
 nkncYjGxoBM8oB7HTgCD6HGuLCcLUrea77WA0YrJreuYzud2fnj8afSLAw8e3g2QuVHS0tOAHOE
 DrC2KmyA7GTjQGvwunyczT0oYNp9n9NWQJrYQMs5FYSV+kwx/HMVVtBdDAD9R/+2XntXz+jtrP3
 pj4FromuACUUTaaiavQ==
X-Proofpoint-ORIG-GUID: A4rjk-gZMt5mwZpfkkwu_3f-ffDnQCVn
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd04a0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=I744n4YQ6ztvz6u6AXgA:9 a=ODZdjJIeia2B_SHc_B0f:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: A4rjk-gZMt5mwZpfkkwu_3f-ffDnQCVn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX7D3TbwXhvT5W
 DUrGnWxXdRHN0bp/3jln0+nkHccGP16zIw+Qwzn4Etm3MeDNviF6ip07dCjXRylk61vbO/z4sXr
 kuXwMzX8L21I8X7MCyneEsXhzjC2Gxw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

Enable pm4125 audio codec driver that is required to enable audio
support on Arduino UnoQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..6c41348d1abc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1172,6 +1172,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
-- 
2.53.0

