Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974953AB269
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209664; cv=none; b=DoL2K43ZFEtcHIn83AAfRdHq2U4Wdt8pQP4TUUm7A5C3yeRair6suqHiwK7WUFtkEV3V0cfoxyFHwhaiuWWwRNxQVyOpzzQ5w9OUk93rgDzrl/34Uzknh6hoGilbvgHUW9Cbcy432VSHZbm9aqhwI2tJ4HPdvw/rWvuMW73eBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209664; c=relaxed/simple;
	bh=qk3lT3olDBBLokiRR2lO7JyOH7ODkiiWpCLirs3Cqb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLEigl4Lk08lhpOxq6Wg/LFTodXwLNIPW7ZOwl8LJcLzdzg6eVsGKRssvaf4pgR3CGcT7vQFdH7BdsjujGwhjjgbfO9gUZ9aF2CtHFSxRoJA2/01uy8A6Xu6tNVuqMbqn/piu26O+iHF9SN3xfij3j/mvLnL6+9UiS2svaHpPWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e61j/WiX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJoU1gVy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e61j/WiX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJoU1gVy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Qbg1527152
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wj06zXyDmvIwudcWq/amFKW9
	T7c/rNpW6WT3H/BxWHk=; b=e61j/WiXDqo48wdSrw1+vlefafJpV4HEgMuNyGe/
	BvpGA6tTKsx3aMhAtNXxnoFxQuoy/8f7OZt+cDe0ES1hn95LncnqK9WWY2VPh6Kg
	RUJaxlzaLbYKjMDqZRNYJrak7n+mf5HzEtpjClyUxJlAuGKFN+5lH3eZZ0KkafDn
	cO2Jg60r+VSESbFtBYiQcmD9BVrHMVk1DxDrdsU6jzdtROFtVg2Svfb4opS7JWSr
	OHxKqUD007jJ6ECa3VbV9zRGzg5fV0KL3VXfpD9dw/uwSw7EfT4KEpPTcIMJ3Qnm
	VSkBWVojWYcSb2xvYHBaoydaP1DWiLA4JSJAKRiIUuGTsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29urexs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:27:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51772325a64so2325501cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209662; x=1781814462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wj06zXyDmvIwudcWq/amFKW9T7c/rNpW6WT3H/BxWHk=;
        b=bJoU1gVyT005qE0RX37zTVC7O/K0BzTZONDyVwwveV2YlXG7JKPDNVN+JvF3ZTz2pc
         Hl4CQVA746VT6sDiqIMwKJZHKQzPXzFJUgw6RCpBTT2VaQBGnTVvU6r7m5dLC8t+RlPn
         wPRDwf4e7JD8AeWvlGBG7XhU35sC6iaqxtvhJ4O+gZsjzy00tf/h3Z9x4Ew4N2u/UxrM
         z+D/ghhtcNBFKie88gEw0Uty95PBmGXZ45toc4QPUOtIhoEjCG2DQ/X1lFOiQS57GdOV
         GWHFD+r6+Avi773Kvdq/uF0ziGDHYLpUW0A8oNMQkwTICM2cB+myEDbrTllozTMxONg1
         eBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209662; x=1781814462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj06zXyDmvIwudcWq/amFKW9T7c/rNpW6WT3H/BxWHk=;
        b=Wm/R9CLmrq8of9bwawcLhRYKZKUFhaF/1mU1hFpExVdxbI0vU1IWpT4htwzIstxnKm
         kIuxSNfB8quUq8dOuAU6SzF0IoMza0Ow0EAEffLc6ivGI6Cd7qifSS1+etrhQ72hM+6/
         AY8c227YNe1R/EnXWPfVOMo4AjNHrCIVRxlzqQp5cTwjAzfVchFYuJ+YsUHnHC7Tr86k
         X4fmVuu28P9IXO7JzFZkKPtkSLybz6/EdatwQ0iA6rsuftXWOZ8DYFd/coS9O2qG8g2X
         Dm6C8L/kYxlTLc+CcFwb1tCGoyZFSQ8LOVn2fDM7IqcheVKdmQ/w2vMWKC1fNEIyjP9j
         h1hA==
X-Forwarded-Encrypted: i=1; AFNElJ/RVNnHJu0+QvwuURMqg116wYjKiHomU+YaJaRt0COshpuPtFDRDzFM3jn3BOkdiOx5S2wnaLWf+4vV@vger.kernel.org
X-Gm-Message-State: AOJu0YwHhlYQWPwlzHwN4U9LzzlaIWrGWDVPtUTgMrEnCVuitAvm9avS
	8GhryUphZH/sqfMUbylE9RI8xOQwRgv/mrArlfXZg/GtdSYtWAvyYNplZ/m6qjFB9nKWpQ0IKwn
	AoY1haMpv82NcqPd5nH4M7NgXduSqw7FeskMXSqXd1G0YK1ixTWoqww3cXs+jIQhFHIMqJ52s
X-Gm-Gg: Acq92OHMCx8K9D6ZlUKTzj28oZiUn1mPVft4YHBerwT0wp4xjNUC9GaVK8cknVUcudd
	S+Y1ZhC3kD3BC1Gbus0FSsr24yPVj1FqpF7bUAHlW1okH3JPBb1T02YMLPRa1SbLM9OrJ63jNqw
	LXxizpah4wcBM39pE7vV2SvRxmCHDQwD7D9ANtDfLNReq3kWO3oT5u/nxhOZ1Ae8zUVjuQqGSIu
	xa+jARcGcn7rKZhO32xzMcAxqKdeM/p7d/R1FfpqaB+qoeWul6i8uQiEFCiRZ0ePW1bHyoFDSdJ
	g1MkY5Ge1l4HXjaBq81HRjx+qPSPnYlmqcbk7xjPcbOlEsyodsJ/3F3ZgsYaJmBmIdD+r5PS26s
	Dj9K18WzvN6FrGqJa6fdeGkP0J+C6t3USV7qsIQhr8b/WyOtl+Nxmv780WfBPeJKpKRD43c3Wg9
	mB0FmnATlY6g4QSxzr60F0n7IuhiDyXehFzB4=
X-Received: by 2002:a05:622a:28b:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517ede505c5mr69204311cf.24.1781209661839;
        Thu, 11 Jun 2026 13:27:41 -0700 (PDT)
X-Received: by 2002:a05:622a:28b:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517ede505c5mr69203861cf.24.1781209661412;
        Thu, 11 Jun 2026 13:27:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cb3ea19sm126223e87.18.2026.06.11.13.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:27:40 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:27:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Martino Facchin <m.facchin@arduino.cc>
Subject: Re: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Message-ID: <zdb5uxiwny434mkz3jmllgy6iivlspslycjxpiz4otqvwpdpvg@rpofwue2zmbn>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX7ZqyetLeC9YL
 JCKqCQgWi8JT06uoJHKYG3GBhdR9ECPRCofuRTznHJOTI33azBjhleDUA7wN/xpLTCIkiVmUr27
 PurdeQZbUO3ewW7JP9FcLUILvS85DPQ=
X-Proofpoint-GUID: yPqRQd8OP02dXT6gUWgjOyekKPmSDG0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfXzxqLplAMnds3
 IvUUesvi75+xhdcKLJhO2CJOAE+PwEo7aCQGYSmOpHPKpMI6a9ti0sSDMySleT2RXWHESNS72Tl
 x+ZhWbkd/bORYEtFyLqlCS3iz1+7NtKYU6tLYnvnZsPWoSnSme7SWtpTJANI7bsJSmKBhYoI6Dk
 ogTI4iOXyxHDSWvXaYFdO7xWme+3dpgX0SWGOuQijMIHX2jG91AKcFY0nXb/IWi9n+J6vi/DxqU
 5Ne6KW372pHlcF7y8OpgCMAIBrxQMP1bQm1dchMCmiem8nAyJ39lj0LjQaLoTC/TtAQkGYhYI+N
 rIRSn9vkUurGHXff/PYyg9ESquJQzNpL+eukr83+zw82PFYsni4H3yTSgpghUbgOVU5rWB76UNl
 JOrQtkolEdZa/EClDLahHHp4yCDDQdPzCtN84tc8iJL9WgylPRi5yqBHdJRwAMXiymGPVdJG4AF
 Ht4o2UOLZPnO1L2mN9g==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b1a3e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WU7lJWFF_htWD4kKYEAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yPqRQd8OP02dXT6gUWgjOyekKPmSDG0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110205

On Thu, Jun 11, 2026 at 04:05:25PM +0200, Loic Poulain wrote:
> From: Martino Facchin <m.facchin@arduino.cc>
> 
> The INA232 is a current/power monitor. It shares the same register
> layout as the INA2xx and uses the INA226 default configuration, but
> differs in its electrical characteristics:
> 
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/hwmon/ina2xx.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
