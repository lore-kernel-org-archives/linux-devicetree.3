Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E336E465
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774204770; cv=none; b=fnqv2+zg1wCAwd5ekmLiGjPYwUSnDkuArIBnQ9mWo3/xVUWANAR4uMdptXmKG58DbIkrKevSdH4MBNWFl7jYx09wzWhNWV+QsOqVbvVMGeKGvpdojbJV4SFpI3FlpMYvJn9r0r0cgY5CrBDHr4wQT/IyKQ3FzsB5WLtVKJWQIr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774204770; c=relaxed/simple;
	bh=Zt+EaWqVvBtweXXGYKcTVsnrvleWheS0AakqN80P7Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mc5czXYu3Ffpmp/IbC+MVUJ7ggJuz7Vf62M4JAGNWfck7w6qRl+mAc04GWFpmQ7momSFMKDpxemscSoTuGHK+Pf+zgh2FB+sLDfrWrsRBp1y4KXowQGSaJFRm2D2mRR6wd/PfxfYkjd75YEXGyh8c+UJY/4j70Cpm5PqjTWUXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpSSIkDv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtRDPtWQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpSSIkDv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtRDPtWQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MBApej3451637
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 18:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u4l8bm4SCHPACZhC9On8nznk
	CMspsybNEge5UBh4STo=; b=VpSSIkDvD/T8bLmdFCHOPu55plFR4vLSltz75bvK
	JLnnLdAsY0EKVViPRTJ79wd0SDgf5lBvT0rMDN27skJ3Nw4ifKaX/k1cD7qM38GV
	rbt7NxlsTFwv8Nfq/PsA7l3UU4zVv7I5ZjqfxjSmkSbiCIp2olkhzOUX5XkTws1g
	+yI/novJqpO615T0WodNi2n0LWDYKEBz0dUPPlx3AR9CCLKJ5Rt+vbq7vkSUE8IT
	Dup3HbfWxnWCEk+s0gu86jEVKsvv2KUx98obXabDiwepSFAor/SJ/UaSVqfa51K+
	Dxr6v+PrhGRA/n0F7suIQaCllbhvZIX1KtywVogl0kr19g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvjucg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 18:39:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b5f675be9so33853851cf.0
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774204767; x=1774809567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u4l8bm4SCHPACZhC9On8nznkCMspsybNEge5UBh4STo=;
        b=ZtRDPtWQaPXt4Pycp72ebyTugSUxG5A0GNForMXn74r5xwP4MgKf6cewDxudc/yAqz
         MXyrVRfuHRtBtykzKAEiqNV9ZCOXGapBOcPnhvmRqmSpqKV8qTh1E3cC93VhgHFbTbkf
         GmzzI4BfXlc8pGuKBzIaLRCTmdFR5X9sKLpKRlkjr6Tn/yfLCfEfOhzKsor7bWNj4o18
         LmEmgEtu7IGXCZUnhS1WfJQ84mPgkol3x+ukTz6ySIsW4Ibxb+RGokxnUn3+wSvVtEqq
         4RVsiduJYTPtvFctlENjKL9fLEEx5AmjCc2LaxrMQbFNo99oh12YJ+3mux/uWVGNooqG
         wf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774204767; x=1774809567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4l8bm4SCHPACZhC9On8nznkCMspsybNEge5UBh4STo=;
        b=XvJZCllab+fuDGqk8t4vYP7GU+jDPPxvPb7+ECuGjti+gKuXtNSVpiM4bYgb4sojzi
         +k8i/o2Y5tLM7e57hHFo5L2qEVSVoMYR341GCnADXMQbOh2LD3YVgO1fDjf5gNwu0nWz
         bw+rKfFo1qOBZau1PSkc/RZIa+FndqwyKg3jPS0np6soiz6niL+9g4Qy0VflMdffUmZ5
         pfURhq/sk62bdjL51BxWUuuevE7Rl3IXIgCOsMutnKDzFaGsgFvyXEaJkhiveTI8+ME/
         BOlmplyae3Afqb81FQiPq4v9X5u6E9oUeBxhnm+rGVflJjW36wQk3F8fQ+Az1EisGDnt
         S/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCW3tY8rEj4mMO8dktDTG9EJ9MgkhmxB7b63y27iQDKGvqYftA+gOq0cyyDZ3IJsPf00h2MEqtIpa9Pw@vger.kernel.org
X-Gm-Message-State: AOJu0YxKoeV9nXauPtYpkihu7G5xTd2e4vt0JofLGTB7cfwMyAr+LJmd
	qb+097xYgf57uwIm98m8Va7DvN0prPhPkUVV1oKU0oQOKLzwgwepbFpimAdTj7Jm/0fJVM1HzWe
	8T9K0DfMgjqVlQ5Us95OOISlBhGY5dnKN1So64xIkjkpsGZV1pu8ULvmwQQ5z2S1R
X-Gm-Gg: ATEYQzxG08g01fIgCO8t8iht/jJP1jmcEAPnqxev/UUD4xLeDi1qXKVsES4cMNY3RKB
	yuPF13+FVDugl2avkWV465CyMHN+KU0VONu87pQp+Ix9QFL8izZUp+/+ROLEWaOEMnePREMR/0T
	SVzY4GaMr5qGBPCnRXzrdYgJ6z7cavS1IkLFrsJeW0OEkourih7bogrmqQSX6/0nAliRjvgpdVk
	BDBYKtY0r5mZdm+xDwIhLy3GzeqRNkClesAN6U3d/VyP7OTk9yappZKXknYUQ9zlfH9QSmd3NP8
	Fyot6u6S6+9wi03V1qewWGsTVxscyVrGv9dHqrmfexZLxaslFe2xE2DtQd4zzVtk61LdJNLmUto
	xIv58+o4PUIDyt1dC+0JmAIagdTq59GpyB9nVaNf58ncdyf57t6AzPi+g1uYOMO0ywjp62oW0D5
	yB4hXDfsy/7WlxTfopG68grPwFGWnyVL3Tih0=
X-Received: by 2002:a05:622a:2448:b0:50b:4dcf:4e23 with SMTP id d75a77b69052e-50b4dcf500amr68016241cf.1.1774204767085;
        Sun, 22 Mar 2026 11:39:27 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:50b:4dcf:4e23 with SMTP id d75a77b69052e-50b4dcf500amr68015941cf.1.1774204766613;
        Sun, 22 Mar 2026 11:39:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192db3sm1917430e87.3.2026.03.22.11.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 11:39:24 -0700 (PDT)
Date: Sun, 22 Mar 2026 20:39:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <rdi7toq2eldu7jylyaihdizf3beu7s3vk7bm5tzuqjnc6fogsz@l6e2cnujllgu>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE2MiBTYWx0ZWRfX1s9Dw1xbUb8W
 PPBv6AiSusFdZdT+rFyPjPxmplRRwUXRQYv5Zy9JvnHwvAyC5/sCBf2YGdIXzoGDlAPJiODTpP9
 pperRiUcMu/Ilq8LeHvN6w05Wrvh30JruAnY8eESfsYUlQIE4aEmGKh25Fha9nHUxYwaLm0dDz0
 wzN01sQjYC5TFZmGxVA9yh1j6jqxfZRUctlAWj/bVhzE2Arl2bHmx3Y/teq+eIwKlTMLYToneYE
 wP11YH/xG5/4UUCOYRgxil9zMlSqA9QR5KpDMe07sA6VQg8nJH7QjBJIhC1GMk/jO+hivOaHp13
 dB36TERFyNdG9qgXI58hCjf2hHl8y4CRI1KcHPBgJYBMLW95b+jmKfnRzECuTL9u6AjU3PPvX9e
 2jkjkAuRj2ONxIQjVctvCdCGcM4+9h08ZdizmyXaz/Lh0cPw8CEPgm1xEvD7GPxgFl1FGv1Z7Sg
 76rbtJI/p6N6gMHa6nQ==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c0375f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ac7HRrgMY6L2oGsqopwA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KyPWpkyxat_d-lNS5GLRcWwa_Xctglq1
X-Proofpoint-GUID: KyPWpkyxat_d-lNS5GLRcWwa_Xctglq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220162

On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> Recent discussions off-list highlighted that the GCC should vote for the
> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
> aggregate the correct load for the CX rail, potentially leading to voltage
> drops and system instability.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
