Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72103E0C68
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271748; cv=none; b=dNJbQ9H2ZjzyU3Rzv14Uy6cojoNagXiZSRY+sAY2X3iBNq2trEzSfcDGviHk1+K4DVBFVwqDZYacToG61r2u1eXZcycqIlhrl/R7IHrNXY2zbBnqs94f2p10OaCOvoIclY4jqP24rgohs48Kr7c6SPxqQZVo0JsSS/GA6GHeOuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271748; c=relaxed/simple;
	bh=+FeoASb8ovnMoSwAHzqvf/4UpoY37EViOCEWLfpnb74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amjheyLgT6VB6+u0Zbyb8TkR/EnQsiZgMhHYdE9c1274bfvErxVR2Ou6Gny518cRRH5wX4Li7rw1PjEZrSmEos5C6mtq6Cdulq0ifykr7hJe/kzxRE2UsfStSX3sr7i2wAerjPn8qfLK/Yndx+Z7L8UXF/h8Fk0Hse3ljempgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5p0s194; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yz6oCRsw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5p0s194";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yz6oCRsw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HentH1662684
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 20:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VvGwdKoiuQ+OZDlMszXSVliH
	FXLgaU6CLyX9TMT17Ho=; b=B5p0s194aR8s0/a2ojrmD6M8cEfqeXH6atcP/8jk
	PI7SOP3XLgIJruTqRBntcvcm1q351weYMhw28ITDtVockz1ks+zO2bzMEdOdIGNq
	UDGERjRzkkJE5BW+w3807tfBNCF3LW4x/FdPu/W245IFQLgd8mHzstqkaQn4IEMg
	jIRyzpS72pIrfjjWSn+EWG3nc35zJUJkDtw95ScOVKMCkWV7nMjZspWmbAxgjA2/
	YylzbBv2B8qZUyruZcbwZeM5NxJbLU22XDuixULG5+VIZ4WTpnLzcLobzleAifFa
	GkoRZDIcViRH7JJTvew3PopGFUp6q9wDtY3Ke3swubKK6g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1men0gc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 20:22:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d601ba030so1746763241.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778271746; x=1778876546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvGwdKoiuQ+OZDlMszXSVliHFXLgaU6CLyX9TMT17Ho=;
        b=Yz6oCRsw+G+fr2Uo/C4HxfGxifsPewj8ASO4ZTXDa+sFnqq2ZD2EKV/IgTDtF2vc5p
         wWQSQHU+9Dn4+zi+fQLMMLk4xOjmbszN4Sx1C80iXprY58+QQRvYKZ9GnWa5BwIkmPCh
         2Sk40b/rQur2kHKn/LkD4JbaRLR3lzaozsV78WCkUwCG0TvBSi35YhsJ8cNG6+On9Ls/
         2L80zafucUbedA1RVVjew0LE0AW3U4w/rjVOYgXzjeH97vpN3qb6rP/929tSkuCrpWOx
         mj1GMyttheYXxRM1nyCXLtLhXt3IvsRaJihUEfDYpBVCaylHV86ZqKTul4x0QnTCsYdf
         b5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271746; x=1778876546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvGwdKoiuQ+OZDlMszXSVliHFXLgaU6CLyX9TMT17Ho=;
        b=QCCmKjLHfsJ9zw5WeE0NhDyPfAz8utC0MYQ9WAXPWoo5FGR6qe6MvKyODNNc0on1DE
         pD0ifCSwkv5YEfyF4S3hXq8Ns64HuwcJJj4eORtWFJlJt05SsEwxdqIDnwsTSNHewIXp
         WFWQgLzq2YLWpkx3jxq1EZrAMOEYKS1rD8kRiGB3uEdowvaLHTLPJUtB8HfjEFQ+30Uo
         Rk0kykdYW0zbj1NJalhbvLI1SxqdeNU3wL568EzFm5SjslXea0oAoheuRzaV+EKDW7BM
         4jE9aAmROF7CiZmi+CeqGERQZFIdZuiR+Mf2C1s3PFl4LQwJGyotKFhxuKIQruU+DVO0
         jUJw==
X-Forwarded-Encrypted: i=1; AFNElJ8m95C8+gQA2gA965Qp9CitnEmayCOUhmu0AqUdXBDUKIz8SoUmi0wgxOOsZzkNdSCI9PoQA9v4xIXx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5VDtv+IIaX9f+NjqPaDDye7QGLUnoXFdHSLLv4uPGWKzal+B
	IOlOxz9oO1dhEvEKBBccNkemUSBuM1awdm+ES4QeeGPS2tSQ1ev/eesAD5UWEVlrYOd5BvowpbF
	ymbqY/K7Y+2JhHWnfsobHgWyintkb/TQBKU3gyy5+DrtYVsGAeK1f/gFLdtJcoQRk
X-Gm-Gg: Acq92OGJajwq3jFZ84LZAPZ727bVvdErufCITPtnV1oMfYfR1JRYhyUQDV642ODfffi
	2CdcruXGsAB2DAhnZTpj/59BWqrLZRpysIvlPEg8Eq9pIZmmGl1wt+aPXRdJh5knRRaNfm4IOjZ
	fodUDXze6npmzIvEVGVCf5VRZvhRfY4MC39jkKJGHnbnGS9pGpjKy228BBp9BL3MvMDLZacz7Cn
	0gh/U5gsDN2vYVZJCVl2DasP3SF4l4VSo/+KEcQSjZNSEADWlvcaaUV6jtKS4iMm9ZyHxbKdSSz
	DEf6AYsNgC1zY5/ENsY90YzJJtyfuIC1g6ht17TqgDY9vPXuk9A56owHK6rO8wOteEZ7h4PiAdm
	ii7IFMvOmllbD7xMl4iN+I9YRMX/7pLI5k1kzfJZn+6qfdmdeFzHWZNl76F8L7mlRju2y2t2Dwk
	3qsDfYXqQ7E6GMvjZUKVjmd4Dclxr2n/QyJQE=
X-Received: by 2002:a05:6102:4a83:b0:610:5b9:dde6 with SMTP id ada2fe7eead31-6313e95940emr2510648137.6.1778271745775;
        Fri, 08 May 2026 13:22:25 -0700 (PDT)
X-Received: by 2002:a05:6102:4a83:b0:610:5b9:dde6 with SMTP id ada2fe7eead31-6313e95940emr2510629137.6.1778271745340;
        Fri, 08 May 2026 13:22:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8b3e75c31sm263763e87.18.2026.05.08.13.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:22:23 -0700 (PDT)
Date: Fri, 8 May 2026 23:22:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwMSBTYWx0ZWRfX+8URuZtXIihI
 36vKgofE1JddDmPmPKf70NKK4sImD1s4it2ssxRY487bwCeOxaBAZlFfmLe1KWDM9g1uU1lajv4
 5mOfDSAt0xwkOfvhQ2bIQgr1BdC9mS2kabSrjXC5kLGM1Ex4g6fR9mlI4eJov1o0rBbaw0KRcd9
 O7Q9rDUTyzmOshKBXxXYmg64/BwaXIvty2/n1ftZTTeHaFCt78qbkNHgy5ahCJgkPs8MbPlnXIg
 lfZTDGzB/oh15OvVEn+n3DfSCnzj8aQ13eYvQ43kdeNhFtzBXswrOiLegPngVsdne5sEzfo534u
 6ZKIFEngVunXNFT9PGZ0+rWZq6tBZah+L+j77MM33pRnroAD9YBOCNGyxkqWZSx+uK7TSQ7zoNl
 nhhfOdhLRSKMdFnZIYgGII9Kj7LN2OJ5dtmO2AxlTO+rhkn8tAGdgNB0B913YZ4DlBTbSdRcwAG
 Ja2ABQS5rIAVQgzCWWg==
X-Authority-Analysis: v=2.4 cv=LORWhpW9 c=1 sm=1 tr=0 ts=69fe4602 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=z21jRD9xLDxBhwdHImoA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: DY6hgW-irG2ZXJYpIs7B8IKY__hPLLd0
X-Proofpoint-GUID: DY6hgW-irG2ZXJYpIs7B8IKY__hPLLd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080201

On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> The current clock and power domain enum names are too generic. Rename
> them with a vcodec prefix to make the names more meaningful and to easily
> accommodate vcodec1 enums for the secondary core for glymur platform.
> 
> No functional changes intended.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
>  8 files changed, 67 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 55ff6137d9a9..30e9d4d288c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
>  
>  enum platform_clk_type {
> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> +	IRIS_AXI_VCODEC_CLK,
>  	IRIS_CTRL_CLK,
>  	IRIS_AHB_CLK,
> -	IRIS_HW_CLK,
> -	IRIS_HW_AHB_CLK,
> -	IRIS_AXI1_CLK,
> +	IRIS_VCODEC_CLK,
> +	IRIS_VCODEC_AHB_CLK,
> +	IRIS_AXI_CTRL_CLK,

Why AXI_CTRL is better than AXI1?

>  	IRIS_CTRL_FREERUN_CLK,
> -	IRIS_HW_FREERUN_CLK,
> +	IRIS_VCODEC_FREERUN_CLK,

Can we at least group them too?

>  	IRIS_BSE_HW_CLK,

Is BSE a core or a codec clock?

>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
> @@ -206,7 +206,7 @@ struct icc_vote_data {
>  
>  enum platform_pm_domain_type {
>  	IRIS_CTRL_POWER_DOMAIN,
> -	IRIS_HW_POWER_DOMAIN,
> +	IRIS_VCODEC_POWER_DOMAIN,
>  	IRIS_VPP0_HW_POWER_DOMAIN,
>  	IRIS_VPP1_HW_POWER_DOMAIN,
>  	IRIS_APV_HW_POWER_DOMAIN,

-- 
With best wishes
Dmitry
