Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC79F28642B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516282; cv=none; b=SzB0Zm3qzhrZrGc7xpjG027v4RDKzN7s5F9y/AkmnnkO0aR0ZLywXU5sLv1VB0SlNu/jIGIMDZnHeZJeamZLDGYOe8A0eYlMcCer1cKXHuofrNZjA8i0wXiTQZszmCuFlGN88ml6itHEc11XefdN04OOvbjh5RQUHy6W1rwMnGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516282; c=relaxed/simple;
	bh=DDt6TtWG0hhG2DtiJdfpnQsKiVKhcaQ8v89xQeqKKGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHSYSSow0UTVgOdqSSNzGDO30mD/k6Uo2vvBANBZIGm+Rm0rDtPIk/ccJavUKRYZqDz+kAWVkHr0eBoUZcz0UmyjHU0wOmIYDJ9Z4QN7YNhUGqTI/JnXT6/X1YMrl0w4j+IX8OexLWQem0FbAeojOmvGlPbR3SRiGnRvCiUAiFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePiF3qFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHtEsS9+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePiF3qFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHtEsS9+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D7usU2678274
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h/wmzSE05/8DzDlkm10pYIDL
	wkWRETXjBMhZD4v55iE=; b=ePiF3qFg1F4kqF818XnVQCwMT3fzwf4QIm1Cc2XY
	Rr4fnHtwwOZPTifzmLlTTKH3rb7W/ZLok4x/woxxbHO4YcZan/E3P0k3F+fQm9bh
	gY1/X/cdJxKml6pwguLmFsE/edgNu49rOdjn73Fy2FyZB9nT+6QrN7ZFEimXAJds
	7xJYEf1zVY0ZVMC2LOMfmNYQr1euTGIq+0OTnxyG9c/xm9sa2s8C7bIbgkdLqtTi
	GM7/e6dIFKze9/KPOAhh+eZLsqd6p1++gOu+8HkH6IfGbO+B0AiykQmbzUr2gPeY
	7s3FcXbOS3t+bY4/yDRcQZSUijwfD3KXB9B3HuYjsGGqdg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s80b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:11:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7c36621so82483137.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516279; x=1784121079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/wmzSE05/8DzDlkm10pYIDLwkWRETXjBMhZD4v55iE=;
        b=YHtEsS9+SqpL8UpDHpxac95I0GaWNQYmgePDqN5bRHG1Bjg1zlrkQCoQx/eKaE1Cg3
         eOTlhuW9VxuN+hAtZwFqv1iYfBsQXU8fKFS1uwZrx8abQfhPvo7mXpbBSg0LCMWqP3mD
         DX4BhzUGr0DMQMj6sh4H8F9vqXkvI20jRExNhjmFQSupndNa/8O6I90HQPpFfWwvjxWW
         Qgs0MtLpmMr05azZz4Zg1zxRlWlEHGoUQFCoAU0XiJULrSkAYcxNZVo7McJqF3DVhuyq
         MWHFtzQT+/1xjimetAeProXuooZPfrKkMrnIhiXog4Mwy3MxfbrxQaDaVFM7XlMNj3Lw
         4OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516279; x=1784121079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/wmzSE05/8DzDlkm10pYIDLwkWRETXjBMhZD4v55iE=;
        b=qY3WYzW7Onj/MHFvdfiltEifeZHlahGUeKvFg5VMc58qbz1CQjq1N3oufQk8zRF6W1
         x8ekISo6U6LvnML9TZT1eNfLRjOHzLN6CGUN2BvYpPyhZGhLvUhlcVZLbE0ehklEqc5O
         /xgqyEhOjpL9XcnJzdyXhUjQVecRq566MRg3jHDZhSvZeZ1QGQfPqeQmrtyVnxhl5vBa
         5UvN0+sv6+ifthxhEFrjEu1J1RJa5+59pEo6KUfA+XCL8C/4pAceWdE8avj6+mUhIg/Q
         nLNaPk/pM/eqSmVs4iRAXgAH2AtNrW+wpPMMbd03s4gZppEmMxQX4C4+/NTs5T7WpOH5
         pYHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmxMMkvmfRwJ5FixI/5zsXzwwhBZdxFGOdeq4fqQSdwI64QOlloCodoQGvTlp4mG+EjxAtHxuNfgY5@vger.kernel.org
X-Gm-Message-State: AOJu0YzEFtIEbXrBwlYQI0nHM7bmI/wQ1r5lSoEPpKrC2lzAFzvYYT4t
	jTxBoMD5p6mSd3CsEq4vVT4b0+uCWWIZp5XloJVAotSY/8xxRqjRiaqnj+AlEdk4cgW1semHq//
	n86W92QQu59kUtdaZhZh8uXyOXeZm73GveeexBA0M0GU1ud8rkMh8LLuAn1/+jOvE
X-Gm-Gg: AfdE7cl+NGWPcVs2EkPMyD+f2lCVwRHpYe2CU2vfD3A27R7OvOuMzNFC4soeD2+jcIK
	1k7PUk92EReZu87y9BlMrybdwBULA1Lb64jrwHD44l3JUPWqJ3qSKjK1H03DAhRj14WHOu3MfNM
	9NhzRWPLo/et/jt+e0Kxwe7blKQnnCmNU8rovZSkyR/tZUacJ1CI5iCqzm5Whe/+FenEJLmt1X6
	B4VozkNBV7c19GzBEAPUCrwPHDMVpoMEcNFk1eqNHhWnxRSsulMD7H/u+cWgt4SSdHjHQbN+lLS
	yOaewq0zsL2ioAocmxG788HvMXYg+8la5pq0iwmkNdgXz7WI/YVGpPbnWOaGlYp4+WwpvqixOFS
	4ml0ILf8m61Z0mGjf4au178+WERBn6AGUjfBhO442uo1YhSwFqN1a0cn7RqpEL4rTFifcz+oUQY
	JphxzNxd2uz7t4NXi+PTM3ku3k
X-Received: by 2002:a05:6102:c4d:b0:744:d5f9:ffb1 with SMTP id ada2fe7eead31-744e010f965mr1025643137.16.1783516278923;
        Wed, 08 Jul 2026 06:11:18 -0700 (PDT)
X-Received: by 2002:a05:6102:c4d:b0:744:d5f9:ffb1 with SMTP id ada2fe7eead31-744e010f965mr1025601137.16.1783516278020;
        Wed, 08 Jul 2026 06:11:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c0117sm4528573e87.62.2026.07.08.06.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:11:16 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:11:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] phy: qcom-qmp: Add v10.60 register offsets
Message-ID: <fonaxuf2jc2lpzf66vwwudtjjy3fy42aizuju55wpu5tr4xbun@o7yth44bfgdr>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
 <20260707-hawi-phy-pcie-v4-3-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hawi-phy-pcie-v4-3-8d9cc6324947@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX/IG8KItKwE7d
 jpKq1un8nMwTrjmLvxWDHuaeZJnXzB9bmw5uwdd7mOkUHLwi1alFNk+dm6vMimvew/6H71nwuRN
 RpriCxzNEbrByhq7Z27aZ4dn4M0G/7c5VxVDRsl928QTcyglVU6lyfPUn4HL1RBKx4fKxkrjMcw
 skjeEeF3KynMYqpwa+0gAQe0zMS2tZGIcvTqmFb4vFzoMU1JqOlWTfYgrOr0PcnsPAFEhFH2/5B
 RQonnnA4g6YqXPi8M8jVPoekfyWHgFoPMCm8LqlZZyOm54t7ZaluJowFgNpuvLd2o8dHRztP+l/
 +/E211sWMnYseOvw0IWpDDcl7oCXEL1venh+spCvFzayxqxQbZHy41dv+mLSXzvO7ucApXQrToR
 jDn1p5zR/59wwQdSDTCzJT75/LPGA8RI68hBeVxsLNW6aGIepow2nt/GlAwvO4oaqV4HOxl5wvP
 L4UtfuvKzgnmjVjM7TA==
X-Proofpoint-ORIG-GUID: lmz4iKU4kJLQ1ShbMHi2QflUW0uSwBls
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e4c78 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_DP_PzDrpJ8qHd2sDw8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX2I8EUt+Zm+JD
 Z+ccPY85zZyzwXpQkGrwxEUzOK+DQlZrcodTBaP0JYwEzspsu/iSGKW0qOmhNhJKuGzHtgAES+T
 eGK6lG7YentHAL9jeVzW5Va2IY1zuSw=
X-Proofpoint-GUID: lmz4iKU4kJLQ1ShbMHi2QflUW0uSwBls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080127

On Tue, Jul 07, 2026 at 08:32:48PM +0000, Matthew Leung wrote:
> Hawi SoC uses v10.60 register definitions for PCIe Gen4 x1. Add the new
> register offset headers for all four sub-blocks:
> 
>  - QSERDES-COM offsets
>  - QSERDES TX/RX offsets
>  - PCS offsets
>  - PCS PCIe-specific offsets
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |   1 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 +++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++++++++++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 219 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
