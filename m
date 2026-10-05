Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D9137882B
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184658; cv=none; b=p0UYwqQNs+gyy9lfPLnNhlFtWvJ/elp9AqARH1I6wHuuBhvHNVCi1X2LX/Nh4j+WPXfZsXQCeEyMvfAOE9bkWuROgs23DdrAe5xi9M9oauA77AHFSFQQfqDI5D7aPZIyF+gKM9jpXHeUEe26IcqHx0GmlTzEiCq+KRxIQ8JBCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184658; c=relaxed/simple;
	bh=xDSwLSw9jQjM4t1WpbTdcaKoUkOq1JTx7zT+H6MGRyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtBIOiE5h36YGaLDZZH4XeTNFd8ZVWgctbXA64/GBx6ybl0/kQJpeiK1fvaveP5gKyQgwjNjRi/B919OThZOB0GmP6qv3BbHqvwI0YHGRppfT4frXlAeLs1bmeds8BB3Dwn2tJ7BECyYAa7sJ10Ydeo63UYkkdLFgMNVyJgmUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhedRyIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoK8t1Iw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhedRyIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoK8t1Iw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510SgF497621
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=imz7x/wVPwZKLDpg9Q4Zq3lR
	2I09jdP4oGd3XJ8uP7Y=; b=GhedRyIlw7haVqBVnqmp2l7uifqO6PKbd9210YZB
	cSCFMhS/3A1YOL3KY28GZESOHRLCZOYCAg4b5ZQgOP5pEt7PQrfQCY9Yi5Hxisa4
	DZIZ+mDXEPoRwUSQtbc1hafFj9N0hvIBnGN/JoGOBgQ5enME2nSfcswJ71gTtnNW
	CQkFffhrByP2qiZZdwZgKyhADm2WMfwBMzb1VSP1sD6qubXIqDKKNoqI9oEINg6G
	9EHgH2fTGgBDYdb0uaVCuPcJCemNi6QH+nL87UcDRyp2noLZLP3c71q1FSk0IWWH
	x0rBrdLn51DAYLtN7JwxYOUscgKrZu8ifBWNNxCQHn74Yg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgys41q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:17:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337b591609so18116221cf.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184656; x=1791789456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imz7x/wVPwZKLDpg9Q4Zq3lR2I09jdP4oGd3XJ8uP7Y=;
        b=YoK8t1IwnJ2Hny5mEpEpoThDzx6n+joy8w6LeJk8a7GOC9JvT9VqEcxANga7pZhTIO
         sVUh4R8P0LC/JlMFBaLuoDNrfgPm0Ax+OWk+ENVIubqmBu/ZloKTHww9h90zCdwYhNsR
         5nPqqQX35pJd3hELv13JZ+lzj8MyciatabLag06VWuu3j/FjlDxpbnkx15FLiLNp0aDa
         fg2ZGb9vCH6+fSRFS4X0p/TwgFPig+AXlAwZnEEIcDmXIG26i24bw3YlBXORpWcbGEVS
         6cEqzZmLrwpT59F3dO+poKx+P95411WPx7gfGIySwl4ai4H8m+kgQaebKPCNvXmnV6mL
         siRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184656; x=1791789456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imz7x/wVPwZKLDpg9Q4Zq3lR2I09jdP4oGd3XJ8uP7Y=;
        b=OYfNwHKZzuQVRp0m9j2ZzYdk6h8TUix1Feyy5/ridKNqO6d7ZT9o3YgeqgyUkjTWq0
         7/QSP8oj68hgjKLU3YcrPPeNkRyXKwE9LEC7bb2WRRrzfL/uM6Lr3S60uWNMfSVwVHw+
         PZZx5Sq8E9KqfYuZ7oZ0VY5z+dNSIC/CenceuUkV7HdRtWmaS+BfmlY/t2fpU9lrBh/G
         vsMZF+jGKWlFZYg8MkhCChWIdrljfqBKXOvowhiUV12DZXgDZh3ES/SwGXhoHPhrB1Vx
         I7yzsb19zsOGQGDWkVwFfZJlO4I1rq5XhScCLhEKB9kEZ6zYT7BtlvfYmzmRjzg/+Idv
         f9/g==
X-Forwarded-Encrypted: i=1; AKwUvBwfK1AcJKZRfZIrFNgpLVhyxtaHWmDcnHWOFGVei16IjvDxBOuxB4VzR3XRRivXIR9hKdkBgVW/95s2@vger.kernel.org
X-Gm-Message-State: AFuF++mHP81/1SiuOiRrWa50GtpEvCz2kl04Kz+cgNjW/Qqv/pDXya5v
	H38XQNnWAq8ec28cwq2ooBvWERDUmI75p/gpmC7ejQ5EY2/1XNk9tNTXcQa2yXl5oH3VImrPMxQ
	3gjMPM2hw2rHWztya4gK7XqHPTgsdn/GRk8mbXOCl97PygEWkhrGAuJZMlReUK28n
X-Gm-Gg: AYBFou3IM6aYbfdOAmkUcYDdW01O6O8pvEZTzi8ojIT4bFALLBPQLWwAS73dP2j3aVK
	+CrISggsI/8kQpcv4rnjvCtFjATDwRiSkCZp+wtkwEShNhDUEGacAmZ2pIiJEHwNi61mnh+fOOG
	pJFINXNaKj6r6mxGaDzoPHUies+w5ZUz1DpjVjySxGspRSYcI0B55vWicvzwd3Vr4V8P5D4pQmf
	QMpx4h2kSCAvx68pMMl2xryhEWArWQV5lFzkUPh2Wa1CzCZFT5UB4sGjjGIOev+XIQA0FEr0lGw
	kTgSKqFopxYNgiWFhvDJbwLL4SiHBCvKOv5tDIjxlTO7AWsIgeRG5KbkGRZxQxDaqB/wFwraAjr
	NZnp5HKdvEtJYtWAb+uXQE1dRI8qR79vrw0zgtt9S0zoVYQrLmFjAwlfsZSYpss6Elyc2+AADFD
	pL+sM5NQI3aczR
X-Received: by 2002:a05:620a:28c6:b0:93c:b33a:5ee0 with SMTP id af79cd13be357-93e510817dfmr1146322785a.41.1791184655732;
        Mon, 05 Oct 2026 00:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93c:b33a:5ee0 with SMTP id af79cd13be357-93e510817dfmr1146320085a.41.1791184655217;
        Mon, 05 Oct 2026 00:17:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bb704sm3043111e87.79.2026.10.05.00.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:17:34 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:17:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
X-Proofpoint-GUID: iBgOEgNhj520oK4Qqw583tALO-UhuMwD
X-Proofpoint-ORIG-GUID: iBgOEgNhj520oK4Qqw583tALO-UhuMwD
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac34f10 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=unmdmSOhVQtIpuyIt4cA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX8K4e/uecflOn
 Xr2QGjenkogAMr1vu7HHT9PnP4Mx9TvJeGm612yAib34yagoLRZJa8v21rteYsFUOkXU8NN5GE+
 uV0fw698FfRnBrxdrwGzfBcP3zdZYmkFjfdxwlV8sHE5kTEYy89EOPcD0BC4r6NtcEQ/EjhIu3J
 QxydmSyjox2o9rv5NJBpjn0Rb7ahuZ3pepBwLbd3FxbS2nejWKrgxLygjX2Dg1WqE4/smP38R5L
 16bLk3p8/hoh9pw59Z360E4Natdt7dOLnnySPYkPwl9oW8tCQhrivD7oIUnQlkn4H1J/z311jfd
 l5zHAPCbD3brH4Zer3/OlYSCoL2CmP1X6BUWY8QK+GlP4rfuu8e6+eUFcPinjBMi3EQuAHrrU/G
 tSka139hx37jRY1rYazAOkkhF5ynPPZMtwHgJLv7TgVq8pxVv/OBDPs8PmPfp4IlqpvvMAttdji
 c7r/WvOCbHJ5oq49NSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX5Fm0r46IbgEH
 feGaQL1cgP28OlE7YNS9TJa16v3G0iAxEsWR05jQeomiZXTg64h4uSvArXnpyshubt9MqOcQlJV
 9Qx3w6FshV2u/J5w5IlXUCRmhxfjjV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> on this SoC require a dedicated init sequence and override parameters
> before they can be enabled.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index b6bbf2b570c7..8957f208bc51 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -29,12 +29,15 @@
>  
>  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
>  #define POR					BIT(1)
> +#define ATERESET				BIT(0)
>  
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
>  #define SIDDQ					BIT(2)
>  #define RETENABLEN				BIT(3)
>  #define FSEL_MASK				GENMASK(6, 4)
>  #define FSEL_DEFAULT				(0x3 << 4)
> +#define FSEL_24MHZ				(0x2 << 4)

Use FIELD_PREP, please.

> +#define VATESTENB_MASK				GENMASK(1, 0)
>  
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
>  #define VBUSVLDEXTSEL0				BIT(4)

-- 
With best wishes
Dmitry
