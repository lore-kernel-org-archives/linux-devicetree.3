Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449AE371D1F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567890; cv=none; b=cObhqQjNOySsAalZCJfHNJuaA/KW2m2Z2hZ2dW8SUC3/0MT0PDEr5FbWFwluK4h/6iPrxEMBBlrJp+y7bWt3C86osmy9B1UZtv2Lpx7yKGJv83Hd7iJ4/OP74DkKnSHCOGMu5wraIOnFenhbI4JMDESazSriEwGIWD3BD1iGcTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567890; c=relaxed/simple;
	bh=dXgnF758wbGBlQYz1pt2babWPV4W7MLM+v3OGrNIXzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROamHcGJSuVKKMqIjlMwaoJxaWgCeuIMlWZHZzoSRYp5T2OdsMRx+k5OyjGeWW7QA42gkvfb1oyprs33gXL7MpBPdhBvWdceENYkNEoUepuW02lH+0YPd6gEK4Y0j0fRzGSsKhgBM87AFyThwQC7WX31dcxrDJLCE1eDoh1mzxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PB5LOxcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyOxt4/R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PB5LOxcv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iyOxt4/R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxE4g884118
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wv1looJjod5t5ie+2ZQGALjK
	nlbUhZVcDCWAm+1jUjU=; b=PB5LOxcvCkbIO9+5l+e2KxY157t3BQ4zqM00qYEj
	lQTxeOXxI1ktkBFAwj80Ku4RpEhwbZSQrFvZqpGMDq4S8XEIYs9uXV6S9XfBcu73
	KzZnvfnDzl92z8cFfDIyEIKE/C7phlTYJ1ff/kVzTItKJUdksLMmVP5qOteNXC9L
	ZIXyN1OPV+SMjd77qGxrj3B3NYDaCO6c6cnw1w/hHBc4Dw0A817bKuLSB7/sLrm6
	P+o21zZGzhmvrot4gl04+wDLL9d5EIMf2iYmQHXtDwxltg3B92U7GdmTOdxmobMA
	ey1vpOzamV7DXqWRIdNDuxg59VV5ic5PZNtO4B3kJSAhhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73jy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:58:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158f07f5eeso645527685a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567887; x=1782172687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wv1looJjod5t5ie+2ZQGALjKnlbUhZVcDCWAm+1jUjU=;
        b=iyOxt4/RmE6OMn2Wg9Rdy5NQBep7TbdXlqwb4CaKbQMNbx7RZdBPkkCq13PsmeMgsm
         ss7jqjlXpG/5OAxgKNqWS2Om71D0VEh0DhjIrliRUosKUxPnPIP3+EcRJTQguhxFcZ/z
         0LieZY5+7F/fic/YRTLcLBbnINlKJL4YEdLZ4TvtqRUf/gyajTpcAUZUNyp+iF9Yx/Wu
         d+F1qUmSx9xCGMgWthyq5dH+phQ24M0JJ2i35hryVRUHrYFV+iC9SsB58lv08wcCXrqd
         HAy5n2PD1VzFfMxW25LOyVASHyc9K36qmErnVDRh3Wi7Zbl9IX8ReSe9ZMy7BEZd7vmS
         XYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567887; x=1782172687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv1looJjod5t5ie+2ZQGALjKnlbUhZVcDCWAm+1jUjU=;
        b=PuZL3LIv2oMqC76Js7zzvT/tPMOLvbS8DywWweXYT1Bls+sr5P+pKabZgYhq0KjjlI
         +irQ1tP0bQCRlAMqFxqrkOYh8hFOAeWjFDwQUyf8KXjrT2qpeDhrgEPDqYgksCSREUJs
         PV6VCDZXhI5vc7a+xqHZBlg7hAIw6vmDcCtw2HrCR2ukxbA/bjpTfXQ3Vb+vVCmCj+Fu
         CHHfrgOLAggl52ZjIf9bnn4YxINM4IfXpn+LGSqFT02l+I1biTNj6k98vPM0xQsTomym
         fQJexBWQTTvkdINKQ5BcarA8rVmHSJZwFKmMV6O9BVwhGjnUpY6Su/7hBOkprMulDtFs
         PhqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pZnjrIntfG91lTkfGTcElDcvPCS5b2QkYoyyOq6ukcSDKLJDa6qLL7u0LriphBNBTC4fmukCWxnuk@vger.kernel.org
X-Gm-Message-State: AOJu0Yweu48q3PMymG0Lz/TIR0fuUqvBK9FzBh+nzO2o1yYBV9FyaqhV
	EN0PTFoKmaKtPejzoGN+YZw2v9DkPs6cpi0ry7KIONkDr+MHc0IL2wqESS+T+7UC9rgUaZzuy76
	QHS8QnGFGTMgKwxuW0MhNYGBlNNwq3Ns4vLeh2wagASGZ49SEkWdMIx810PwTWIiA
X-Gm-Gg: Acq92OFkJ0hjXzQWX+VXr9xGSbkBQHs6bY1y0N1QNA2T9GfJpjRBZWuAW9verZLZjd6
	Ewp4VagNX+1XoVh87IN81vt3Vb8FfV3d3eNyA7JSoWQ282s9bUveanPxHAvX0+UxU1v4wfagmnV
	CZc24O4mNNywjbE8uxDKR3G7+iD4ftwTSlHdIJnoZlbVt5QLZZ9Ich06rPnyjvHMnxm7AgLJiV1
	fNFO4QPqgRKfril9IoBANb3p9UH/FtEd1kW2e1mdjKlZvOLjHOfzmTe2/ZJE5tGGW+BS9MneUej
	wKh0N6cFR686Z9G+NSjHIt2PTcr/LOZDys0kmKRT0DyCc9ByV0mskYAlkKyLSq2aZJsGfq7Bl+f
	BDXMML/92Gi7po5NMsVRP1TeLy81+4ek1JZ/zbc4jnyX29Mka2MB6waCgHupOVh32Vm/0eiCas/
	ThPfA68TCV42p0K3XYlEcm9XsZ/ubN7Onm+LA=
X-Received: by 2002:a05:620a:4725:b0:915:aff9:5449 with SMTP id af79cd13be357-9161bccaedemr2529199685a.34.1781567887497;
        Mon, 15 Jun 2026 16:58:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:915:aff9:5449 with SMTP id af79cd13be357-9161bccaedemr2529195285a.34.1781567887005;
        Mon, 15 Jun 2026 16:58:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b7a3fsm3080320e87.82.2026.06.15.16.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:58:04 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:58:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 1/6] arm64: dts: qcom: add PMIC5 Gen3 macros for
 channel numbers
Message-ID: <oyibcqgnr555bkzdr5hetlfmhcg74ldbd3covrflbqcaygs4oi@6vppubpkjcfg>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
 <20260615-topic-sm8x50-adc5-gen3-v3-1-216a2b5ccb85@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-1-216a2b5ccb85@linaro.org>
X-Proofpoint-ORIG-GUID: 0Iaqt3qI3LKwxAE3syZpSEUqN1ODghRo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX+U6SxqfaIJmZ
 trQ+Q9lyz56mVwt+RTzRg0ZRpCmK45INRHnz7RGNIrSuIAE2z6OsDv5tRDcQZQ/BtHoSkE+Uni2
 qAEGmLFn36jg2BLwGSEPGgTVIy8KLEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfXygktjm9fyXV6
 GDol4kXN+p+R7AovfHpQkkUt3mWCE5RJKL40pOMg4/NCc1HyUe/gGzMpPYiMFy/1a5vC134wWUy
 pp1rgFeUX9UXaZ5dRd6T2XLiIFMQHXxxWA9hAa2bCdi1prClJO3SfqXpOjqHfieZg0U2hGVrJo6
 eXXdjLs6714Axl+dsyk51Xa2VEURGww60/+832zPmhrIqBO4OFyNEdHVcUqX0OZ+ToykPq0YIFG
 DFpWwsQCpAXu1M0tHT1BvvFB7YyOjzYdx90ELhRVSrwRkGvA/GpqbmQd66fMa4pZUI8ve6gTW11
 Z4K4ZcKWmqMzg+ontq2VL5cwFKyNYiTiimbkmsO2fqwuciz+Oxn5MBC16UOIhlp0yPg95cTj/WE
 IX2qYZ7qBDD+dP/yEI9cUoPoDzpAPLBfFyvfE1e6JNI2PMkI7/zsG/TSyaiu04kIJ68ygVu6EnC
 hcSGR5M3HyD6aAK7u4g==
X-Proofpoint-GUID: 0Iaqt3qI3LKwxAE3syZpSEUqN1ODghRo
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a309190 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=DACwfw4lxhdAJLq7RHMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150253

On Mon, Jun 15, 2026 at 07:00:07PM +0200, Neil Armstrong wrote:
> Add the PMIC5 Gen3 macros to calculate the channel numbers which
> is a combination of SPMI bus number and a constant for the sensor
> type and configuration.
> 
> The macros definitions were taken out of [1] where it was initially
> in the dt-bindings include directory but since those are not hardware
> bindings but logical numbers, they can be moved to local includes
> instead to make the DT source more readable.
> 
> [1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h | 88 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   | 46 +++++++++++
>  arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  | 85 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h | 22 ++++++
>  arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  | 52 +++++++++++++
>  5 files changed, 293 insertions(+)
> 

After 's/ACD5/ADC5/':


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
