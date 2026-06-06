Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6893A383C
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748893; cv=none; b=FdM4XlpQeNdgGyRVfN7wqsdOpIdmBCNM+L4mJGHica5/x0JxrxYopKrTo04d3yH9EyMbBVf/zwGgEerOrMHZksnjWt0r4K+F7UWozMrN91fUew5zg/q5x7t8a8yuJSyfR8zaCCNPwKcl+ZX/8ZVZZgSZbjQc1qvi3cppShrRZl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748893; c=relaxed/simple;
	bh=n0RMNufJCrSfWUmwc6w1chzCACxk2sx/6Ga6+jLMAAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHTjHFComdxF1JteKXnkUDUNxCrsv2cUt5FGgsyygE5pUWpZMAhjB7XFh1crYHA/KyZal0hDU6zqGYUtVVJk71DvBWLSgc8PoahYlzb4USKc4UsSJd2uSgn5HFPOUN9/qfPCrXxDvuuEkgMz6wD85zFIfVjWVqN/PrOCYPE5ZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1OjBi00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQrgaLaJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1OjBi00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQrgaLaJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGdI41311042
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oohZfX3MrAqDkrpy63hwj9NO
	UqH9OuxEKmUnEtM1Q64=; b=I1OjBi00f3LPD2gEfafL9D3UzAkSs4Vx/wJPVRbN
	Fm47N+FlsBxsqzvegmPdks+ZHV590tjEhrCeGnQvOkY28PTO0W6DdE6YYsHNFEsO
	EwbBw2sDzGVd47epfO9vfl95MV83rma9lPiDmG9X7FxnmZwCaQ9sg1PJbpwjbj9y
	Sz3YajYGyhjTCa+lVSDKSTZysJyGhYRZa92AWdJpWKG8JMj5yiIfKTpG8+xyfCjP
	VQGULcxE02OaGWE3+7cHsmzVX0QTpYG14i7xwZRtZtKDuNPheBCA8sKIMXSl+xow
	YTGs0OCUAhTzsQS13wDLGy7DO+8m69B4TmppFfFmsgPxUQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w16c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:28:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso1754873137.3
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748889; x=1781353689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oohZfX3MrAqDkrpy63hwj9NOUqH9OuxEKmUnEtM1Q64=;
        b=AQrgaLaJojThF3zG5l4OYKQbXfJsqcsvrZBJ159dcuplxhQHbLeHzW5t5YnPINEP2Z
         RGk1qi8c5GWE7WrcXpt8Qp4GmHILurPJ/jSvdVhfDvM2LIV+D5sh3u8bJ4zLrhGYyyAg
         eZkXN0juHclYiGOmQjIX58fc9oG+xc+FhevidJkFWmFN3KQmFcFrAtdEbgoKPYuouwsP
         Wm6TIVUMHEsGm3ozNADJDZD/FJlCeVf+loNtsQ73ZqvgZbKTOOUmrMmNJZt82zR65vAo
         oYQBEOwI5BK5wzFaQfJbGtwxLDgRPjocCWg/9UaIv7FVLtDsDfBNUftxWIWET2gryZtD
         +DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748889; x=1781353689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oohZfX3MrAqDkrpy63hwj9NOUqH9OuxEKmUnEtM1Q64=;
        b=NXZTVhv9ojxF3yR2Q3B/GJ9H8NgZJ0N8V0Po68lhqAq7RMx2OICN3qsDgEZyHsTaH4
         dxTVQ/kYD8f1xhJbViLrAZ1wq7mWrZpOejR0UdH00i8g5G2OPZdNp17/b46qxmk8gxAS
         cIpX+LNDYsJf+J6I9B66z0MlNxLyWBFcfQB5CUQWmCzXgzmpwrofCm3XSLcbVekeAMJW
         gRd8i1u9Hi6gQ8MBE5rFAmUyfeACRr98pKzJhvBLzkoh6e5NditgZhtLBb6l/uCsJvI6
         asmX1NB5UHj+pv7Sx1RGP7ve+sIwfZQRJ38BumqZWRMJ/xVPzMy63guJnLzX16Ew1HWU
         YCAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/dGiCllQ3kW28KEuQLUtcPXD+/3527Jl/dOs5x7I5lBzhVB+VFeq22QZoEjkTu1/Lin19CbTCceNk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx35dnZ/EOd0FZLIq7Su6Jn523/4WO4D/83jHoXJDGdQLuvAFIj
	w8LfyA5zHscFj/3JA7mc49L+pQJ12IrCGOndeHH5zL+6KtmG3MRuXb1TdeWPJdhXz/UmsZO/XYk
	gJP+3qIY9CMzT9HzuDKdAQlmHmkSkZc1wMnv8hp7u0vQS5R+C7EgRifywxiI/7W+W
X-Gm-Gg: Acq92OE7UlZVchkBozzBKP7c4BnmE6zpd9/XGAJlhZctGxEv+OPJeZivVDrEhGv8MgP
	ca36B3T9uYu56P44Fg3oZwLxBmYvRIItaFKr6VabaR2f1AOSIrStzIiRSV8Ugr0g2NnFzEpvRRF
	kY32cDy4F5eE+7U348MpYMSVrhQcgLj0St3gQx4LIH1KrZFuDdkrhl204xd3dAxMJ+ReQK4nBFd
	Y6+Lm0i+avHNsBRZyfor+WMGmD5PhleHR50mbC8/rpJL1poanaPjkRq+NSsFnRBrSKVEAHm0/I1
	hpFXjK7YJedpdfXpUUaD1DH7xlB4KPpiochtJxN2X5iMjORi4Nqic3jlLYB7mImgDvL5QZNf4wP
	CfRfwEkiK34yhfgVbwK4ClSiQJlR3sNID3U6xqt/Uh2umLFHs6ABRDI3NqJZC4rI1IrLiLZUAta
	VHKZz2qpRhfuOWspgfkgg181IvdfiEARt3DIH1doujsnLiPA==
X-Received: by 2002:a05:6102:1609:b0:6cc:f252:6929 with SMTP id ada2fe7eead31-6ff0285598bmr4103346137.16.1780748889289;
        Sat, 06 Jun 2026 05:28:09 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:6cc:f252:6929 with SMTP id ada2fe7eead31-6ff0285598bmr4103331137.16.1780748888840;
        Sat, 06 Jun 2026 05:28:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b98fddasm2401653e87.64.2026.06.06.05.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:28:07 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:28:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix gcc clock specifier for
 usb_mp_qmpphy nodes
Message-ID: <72heot3rh7mjhmo6vali7oh5ld2zpai4nakwmm2kajwbxheydh@xxk7d6dy6o4o>
References: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KZWxgT-ZbiyGO0Q_aBda1HljTDqm-It8
X-Proofpoint-GUID: KZWxgT-ZbiyGO0Q_aBda1HljTDqm-It8
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a241259 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Ic1KOHRaER9q49jtsWgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNCBTYWx0ZWRfX7l+hYlp8F8G7
 xWw7w9TeGf+yHBeQzV9YhSOmYyJlRcqswHRYLj2itz9n+Mn5KCXTWotLqyUsQFTOFLHkYKbUeHy
 d04aHMu9qaY81h5K5lbsM7PgZns++w3FVQ/YkQsfILl7c9YlUSaNi9dNMM+xFaSqg7rnuraoP6h
 +ETsIYE0FJNUy6tr3hyRdupn5xDvwvNnqLaawc7HGrxU/4UYeGO7ObMftx2kyBVsOqtiMLM02OX
 l9N2Hs6Kh1BvN241aGud2h6KxflfPtFWT+Wa1mSaM2/dGFOWRZ/iZyis5Cz4q6/Bq232VYUKFJV
 SmDeUPb7Hsw1NTi5FsmadA4hlsQaocH4M7HPsEKdxnwy6FRK85BCgWR3deBJYObjkXQrmgwLJAw
 y4lJMGwpmHgta/19ytZJFhI1J13mnAU//ILlJQdJ9gNhH2/EU83LuNpc/TMaIWgLOmivXTgiNRt
 dl/3UGior/+ATGoYSrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060124

On Tue, Jun 02, 2026 at 09:51:35AM -0700, Gopikrishna Garmidi wrote:
> usb_mp_qmpphy0 and usb_mp_qmpphy1 have #clock-cells set to 0 so they take
> no specifier. Drop the erroneous QMP_USB43DP_USB3_PIPE_CLK argument.
> 
> This fixes the following dtbs_check warning:
> clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], ..... [0]]
> is too long
> from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
> 
> Fixes: 4eee57dd4df9f ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
