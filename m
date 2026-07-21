Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A946543B3F8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669906; cv=none; b=cWMzIoViB32RY3xU7YjIC0oIhcnSRIgwBgZ9k0RiA3nlFhTGepBzm8N8TnZ5NS4t5AyQqCMC7Rz2jHTKwLgnGt6nOrKqpOiZOTQHR3InYROGUxyhgdtelq4Gt80S+WaWXw6sYr9yL1RNIc7OzdPoEVo6HlAdGaavYsWxnvCMPec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669906; c=relaxed/simple;
	bh=J2VvpjPnsxjwupAxw1lEeUVhEA4+litNLFzGdsiAvLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYVRfc6QOlGxtWWHhz/0ZGVojFkkwnjQexouQLhu6EYmmFz8go5xEZppXTjIDQ8E7iFoG/qjFdr0Vslmht0Ma5nF09s9Rerdez+yyEqNLGAWW7m93TF8CYYGohyqfbKBW/CmCZF86xbxiDtt94GCofeftKzsdUjZhZ/fxDtJtbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrzEWghZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUGK6nla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrzEWghZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUGK6nla"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlV6G2580347
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zWNycNElywlrJIOOq7emCvBG
	Re6YJDx7/o3jeiyuC9E=; b=ZrzEWghZ+0i6C7WBJ9EkbnJV8kXMR6L78bqCujIW
	RcbuFOYA0ByGz1YivzqxW95wYH6eDcQg/msN6L0vnElzmtRrwgW21exSRXVAO/UH
	VQ1uG+qVlSS3OT55OroUNwDN91wSvXDkVkuHlurWLegBUPOduFeCQV2sHbzfI2o1
	QkRHyvHIBOtzW0Ofx8YyZ9uPyEdauEc8dKkk1Gvxh+JCnMQ9MCgKq+Ktx+Slm1m7
	k+KZizWIt06cxuNiNWJYmuwGMK5s7gMs9XcYXlsJPZ+0FoiuFnwG/w086Sat78sU
	IvBP0VI33SsoyA1U7x7DfwrkR0vSxffEIzBdv1t5OeIwpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e0ynf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:38:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so217486801cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669904; x=1785274704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zWNycNElywlrJIOOq7emCvBGRe6YJDx7/o3jeiyuC9E=;
        b=DUGK6nla03c9RezjHnc2fgx3tjeIckAIBaZG3+ZMvodU3XLaAwLY+0CBojpXwF3RYZ
         0XePTYbRXFW96r9MsbB/c6YAVT3pKUvvmI/cwotBh2TiYZgQDNMq2eexHxdt8jDMdHpt
         az1HiJpi3ooYCjuNEFmRaqB9z/Xb4V6H/CYu+j8W5jWXbwdhbBJqBMbF79C7za1ksgig
         DreBL7NfnApBH6haWHcjnDF7LhY+ZMUoARaN2dAdTf9HTHK8CyDJ7Z1HU2J7IwJ2cD2h
         IqF0wrSRVOKCfJnfrTRJDWIxy8qijucPmG90FGqS3IdgwEzwGq9GRr54QyB1gGkycPE5
         nt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669904; x=1785274704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWNycNElywlrJIOOq7emCvBGRe6YJDx7/o3jeiyuC9E=;
        b=oXpcLtr9r4aF2FlhHE3Y24TEc7OCHjJKRjBjMyOusL7v/BSvdfeSepBt+M2MX1nAtD
         Aw+5FbPHwRuNIoBW5czWyRRMCRe92pYkqX/XNChTGChZpYHsqQsz/lrTBnWVK0/Cvs0H
         c+W4m3dqfp1XnW3nG4kgSdKVhusEnDQ2ikrsdys3VyztyfL627U7kb4jHDK4cak0fIAH
         R6GY/c1gxSZtoVW7tSWq8P7jMyO90KyzJU2noNoTdKHFjeDRzes/a5dLGOTU7g1tMwgI
         6teWembBX4wWKmneOTQ+GyOQz5BuQiuUAauZ0QMcyNcvwIKp6jG05B7apGVQrzn3Vnn4
         o18A==
X-Forwarded-Encrypted: i=1; AHgh+RqOWyjQL9PpFDdWee3Y14/VEoqdP+victtwsg97nQ9U7rNED0I2frpUD/FezHo5i953szdvRdEGy5x+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12mBC0zMX3WMl4bvEphzZEkDES1Wcxryq7bM2kks+ITQrawIk
	jk/WgDvIG1Wb9+0FU9lkGaq1MpIjzM+BUYaLYE1Vkii02mnRJqKWvb29fKACOXm1boCXSFlXls8
	Rj1tLiC02q1beoHva6Qz2aYbbmIQ1g8Wjsi8uHdv5Wsl5isTA3h2iQM+PcC+axt/M
X-Gm-Gg: AR+sD109X9Hq9ndxY7F/WkIFw3rStUbAstyTGrhGX6deWxtbXbkT43eGuxlHBZ4Vect
	g2xAcY1nLM4dyoyuE4soqxntdXAgiQXiapvb6o3B1LITLYdiF7o3wDmZ+f8N8+yHFV2TBQNF+bS
	H2N2uHkJpgRtGCXT1ulx7sq8qey55uQLPN9hS1aMCfe7ZKBWawqdc3brL/V4GBqAz01XAgpeJf3
	kTkcadgBg+F4/fhPYEdiWeEgCNb+qtovYCk+wwhoKuZpXKQGv2G6Tv7ltOa2iif0QmmutcGgHO4
	eNuR1C9RDkW7fWHYlL5n4PQmtndw6pRq+J86KzrGV5aTJlYJb0xBULdLrTAP8lM/j+sDt4apo+1
	BCUrIicR/i2YfVpr8Kmnzx8kDUl6VQ+vwAgWIDG/3nwa1FhWA6OLPFHfjRrYd20oiNlmm+xO0m0
	bVpHSwWSIojdDa8Q==
X-Received: by 2002:a05:622a:1188:b0:527:8770:8fd6 with SMTP id d75a77b69052e-527877090f3mr22435291cf.35.1784669904003;
        Tue, 21 Jul 2026 14:38:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1188:b0:527:8770:8fd6 with SMTP id d75a77b69052e-527877090f3mr22434941cf.35.1784669903294;
        Tue, 21 Jul 2026 14:38:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c5e37esm1179921fa.28.2026.07.21.14.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:38:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:38:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Enable USB controllers on
 Shikra CQM platform
Message-ID: <5s5iz4tpyy4ccl47rjhrkqlfbaw6khkhvi6adgjyupbv3c6363@zveeikvov5mm>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-3-2e7a092d7f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-3-2e7a092d7f27@oss.qualcomm.com>
X-Proofpoint-GUID: -xHqeM7polPw6ks24caKY3N3LjAcgSE_
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fe6d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=J2N_nXOhfcilw9lcM9MA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: -xHqeM7polPw6ks24caKY3N3LjAcgSE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfX1hhXQw6amN8g
 lbWy2UPQjZ9tiXsRhKRw4+x4mGKkMhtHU+DZDl7sXdlzaipSGcwRQYCCNFssXeFFyEUsgokPX5I
 DnNXPoC383M3/UYgEcjtgCr45DRmOp+FGGmvvMYCGJAiekFheegJJFevrTvN4nKSuk/+pWgL/IY
 WaytTxrJjt4VwaCCnBmCxSqUq0wiPJ6bwy4/bjfCSvsOHPpa1hkxp7cPbQEjYv4b/0d1SS6Pz3A
 PmRqr9SKjT9PG7xdSZl+9lMgahF8uF2ixORNzAM8ET6k4F+zxUjlYt8bIki4vUHLcvlwQCb2Tn7
 3AA4q9DPJ4k/t40u7LCYYSsN75RIFPRDh9qj/k5Inp8VtSOj0iafl4DwL+qyjNuyuacGGp2HGCp
 G+vT7WDcqYQvS44TQd53xBsQjOtM/9n5kdTYisM2NtsdRMoi1jvhM3xvHXPF3dk9yccBA4S+rde
 D8wXYz0sOBJtimyUC7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfX+dE5AN+DIOzp
 1dNTwZuNquAmzt+oLKpo59gPmDVZMXFbvzUmPFJ294hHmT2aHOaEtkCr4oRdUXVaS9UYrthQDN+
 Y7R39sf4RV7JISxD2EEjaDyotIpT1Qw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210224

On Tue, Jul 21, 2026 at 03:23:47PM +0530, Krishna Kurapati wrote:
> Enable both USB controllers in device mode on Shikra CQM platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c..e58b40389ad3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Why?

> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
