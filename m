Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45B040DB44
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274112; cv=none; b=BdqHd8Ntl0AGh9oLaeJcDmac6gAa7yWnEszALxaUSCy3DGjtMrikxLS2nMVmqFiko0Z2Iy/tI8AQZzvmjqEogL+qC1barNDrGDis/ODhKjJUqzZlhWwQJx5iBT9gJjy1vM7Snxm0HM5ZRIkBcNx1QsNRKYvAEMSExArCMGaA+78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274112; c=relaxed/simple;
	bh=LP0uWxHLg2fsBUx+Nhxz5x4jEzYpXsVi398yoS5Be9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP1eXuI9X5ukKP3vygPoNW35kjDYEL/xCBzt4lCSFrBOiAvDZSYaIfjCxA3UTgG9LC0QaTF5M3pihPtMU1DCMmrZpEo7eQdIFsuWfld1Uz1l7SfCODR7saTIhRGUv0PSvB6MN5qMKCpNdaxn1UQo+5DNxdqaAFHekz9Wvg2a5Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmhWIFuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2iFRi5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmhWIFuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2iFRi5q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9NUA3004252
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 14:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CKlzrW5fENrSL+csftyJo750
	ANxO2VC1yaUCUp8pTAY=; b=MmhWIFuMCX93Lrfk4+dD6ikWr6fFT4whLHqEA4+r
	Sh6S6uBV+G/1XoJo7LoU9es4P80RrRLNPxeJ0AaZQhVCNWNmwIPTg6d6lL5s45xI
	fqBDc4K7H/HfNlE28Ho7GhpMbh0xD3MN1tEYjn4hAg0yO1163ZBUmoVZQk99QOU2
	KpHFHJOWhenRAZ/R8oPn6172CgA8+P2F3Nu5sqYdEjrGKD0+yjh5Nl8Uyfrm6sGs
	7KaVH1pJw3JOw2fIcD3DMuvRVo03uU36FuDEgfZrToGKiUBCwfoP5tnYnucRincf
	v9cccw+w4ngu2YKnSm62TWXmArnvgsWlh6px7yF4PP1xpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh2njc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:48:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390e7e4c5eso179258785a.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274109; x=1788878909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKlzrW5fENrSL+csftyJo750ANxO2VC1yaUCUp8pTAY=;
        b=i2iFRi5qy+YQuHnlNbzvlXmsfz8P+spL+CS6DRu5K6RPBEiqLHNav4MWoH/W9y37M1
         q+UPaZxBvm6CCMecY8jHie4JBeQG7e/1O/8XwSpIkVjBO4lt7OmVUZBlioFXWpHtIwmO
         WEEu9EXBALRX0AjcY2Sbnt+VWJec4mBSMRLnf1oDf3UqzKEPRCgKMjfOn5BE2MSa1KEn
         AzpE95AmfdvThFXvPp8QoeSD9lnMyUKqA1S+6w7PrZURLfNcPYXzT4/VMcIc9bwKWdrN
         lexkWGeLznqczr++h11TbaMCAH1g8Bs4DTB5fuKZMyd3LYwiuPZIA5P19FL+qyfK+ote
         XxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274109; x=1788878909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKlzrW5fENrSL+csftyJo750ANxO2VC1yaUCUp8pTAY=;
        b=AvPihJ4ZxwdY+lDQBZiUJvfxdACKIIKYHN4S/UV8/Ex7GXIscWTG/wSKhlI4xk3WYw
         +rkWs2MZ04SLrvzqExlyUVDALLyBnvItLW3zDMl2qOMNwEGpqzhWjT609M3a9MKkprZ2
         iVCbozBqC8Q32qyOGbYkD0byi1bYYU6qH2ZqYKivfusCOm7KHPwxadNj1Wz4uuf1Zm+u
         Y/7onM81+k7gOCISRbUP6yqBifOnrjUo/0kj4HaF4TyQkX+qCRJOboEH/Us1sPsfVe9S
         Zlo9c5UiM5b0hYej+qqNJW08KQxbQzUId4zSqahU8GfAANQWrFehoqXpQGefGMWSdUfR
         acSg==
X-Forwarded-Encrypted: i=1; AHgh+RoXSGx30J02RXBm+GGhHPMK9u8k3qY9BqaxgubV6Jitdf/6hKL44vrQbSRZO+8tHK9ALMn+vaKLDiC8@vger.kernel.org
X-Gm-Message-State: AFuF++kbD6hoZt++PWbJ4FEodPc674udxClDtgbhIbW19M+s0mMvQhJW
	l6CVxKdJ/1zlKjAcknUqiX+B9bXed27o1Yg6dnDpT1vhBrL7ESVVbW1FUDtKAIufzTysTCQ6qE2
	LTOR5AGKkZZBPRYkoao56avU/7nDd1M7tlyrev8dm5519ivKs0kV7oVyzji4REMqC
X-Gm-Gg: AR+sD12Sc5Ub9nuBvtgN1YR2dTVsy8csI0eAVLQPS4423xMjwmzh6IYQH7TNkXBnugr
	UyBqYGk+Rk/kPKmP8QttUFbADDLNgdWBOKeI7SfcxcGSl/CzmOtsFKzOEZiUmLp/Whc42b3oWWR
	atd+FgLei6GXHpi2EdzzIFjQ++PL8YW7FWaT8+GQFd5xuwE0K5HVoGgGOW2dR/dBqyU7wECF57u
	ikfyMRte20xvPo1el0fLYedfJn0BYGiNv6NJptcjZAt0GJTYYHSOt4eOPHFGfP/l2suzUL58hqz
	AnWnan4ZZ6CpuDi8BuVzvxwPLaubVwnKv7oUiRI6T/wmbQS0lRps3XX8epgwkjmth1OWAu4ACUi
	l6i2h+UajIh7uHF4=
X-Received: by 2002:a05:620a:2b48:b0:936:ce17:dac3 with SMTP id af79cd13be357-939139aef87mr4237792985a.40.1788274108640;
        Tue, 01 Sep 2026 07:48:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b48:b0:936:ce17:dac3 with SMTP id af79cd13be357-939139aef87mr4237757285a.40.1788274106763;
        Tue, 01 Sep 2026 07:48:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e9cfsm5661978f8f.22.2026.09.01.07.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:48:25 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:48:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
Message-ID: <bw5js2yqngqpy6i6rli6ufaaiz65bqbpcaiyfnaur3miuiaq3v@4qjmukimdbn4>
References: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX+prvkHpy3Akb
 To9hgdM09TO9SafoSj0aGNITPP/PJ+VA1JGhTRo0d98piTk8nZjmlnVdKyY0TsoxzexkfhHykyF
 g6noloEteD56XFC30pMKMYxefbEXl7U=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96e5bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=gvnL6on5FGTgUggAsZEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 7m5rGYhjqPehszB-HnfMLL07ATXDfjmY
X-Proofpoint-ORIG-GUID: 7m5rGYhjqPehszB-HnfMLL07ATXDfjmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX/DOl9zrtREFy
 DR6Rjl0W5ywtnvTSFdbEIMhn18v+m2sM9nJciMb05eUoDCLC6jAyC2JCm8apHPseNY7ZdSzgENJ
 BCW1w2bxKwBxi4S7kMtPOw3LioOcfePjYNqdF1JdMAn/SnQSPKp4WlXhD/h5IJTaCjVs7z5+nrH
 J63Uo7Mp0JS4npeI3u07PRVnZC3IKPFmm/ov3oJF96kxLvIFtnWIYOG6jhhZyo9e16Z6xbNVwbe
 NLFomn19Lw0TzBpp57i2rgpaWkilmXUJrfahRAkPln+XLRLu2+J5q5frew6OjPY6KV2mRVtk047
 EWIHDFAaOXxJn0LLCIGQaWAdJ0ga0R2p55lEQqS6tLDrWaJqYqextS22ymKX1JVtd+ltmD8AiUx
 lKKzngVtWKMJehYFVHaUc/6fl+FKtd6rVTn/C+WNArZo5UrglOWRsc8gZGqmoRDGh0OXS0O2TNt
 ezVfoyctvUvxGECLbGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010131

On 26-09-01 11:06:13, Luca Weiss wrote:
> Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
> one should be enabled at one time, so disable PMK8350 PON and keep the
> PM6350 PON.
> 
> Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
