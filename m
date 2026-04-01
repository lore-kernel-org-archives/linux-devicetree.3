Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0F03ED13B
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042391; cv=none; b=pM1lKITlhk7F2vFiEI+jC4VUMjh5YjaxGvSZaKze1s3YYAYPGobc/autZ/ea17bxPjd3iRF47kaEXiQeo2u8yMDQNh034i3rtHR95uEqgperivMm8e2eoCAX69SuyzgbzGz1NNGmvmnsrDrI24wDLW+G2W/dak45lC1bqifbqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042391; c=relaxed/simple;
	bh=h6UvdN1diC3gwBaxtKABz+/NIwkGDI1M7yQxwQ/tZCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6rzJ32xqSlWY3lNTf+WhJn+CQXDH+2EsSuVV9R2yyJ/2tPTqOdBQILsst0bdvK6UYWuCKwKuSTM8Wpw54b0Xg2MPt2RKw6kF6bsUpHYMn6BCAgX2QQrhCHnYNIQqXUzczYITb4bTL6Ja4JfT1Qsn/Eld/1r1j8wf+gut+b87lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZrVeqHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTOSlOAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZrVeqHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTOSlOAh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317ax8C3081559
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XaK7wwNaMiRNcc/GM8vijh0s
	2knYzFFIEJjv9KzlP0o=; b=aZrVeqHvsMa/wYN/l160imS7m+RMYtBKuC+i2VUx
	hc13ZToO/5IM2aP2ZY3g1OhBYs99Xg5XClr0FbmpxquqNFEWYsk1XVwzEM764vkH
	c3rfcoE/erppVPl/wn1NgpdLatjoE8/uF8FfK5U+5L/A4d50wzzKT0GF5GTVXFpB
	Oh4GY6ErHbCsbbMI8F+L3fiW5ojfrZ9bxh6WCAvP05dX6e8RD20486C18h7PvRU5
	t5Y6wqc/aSlSvepceV0eDZqBvAApEjBhqtTMTaoZHtiwDji4xbb3TW89EBwc0tdW
	CZ4CGSspNOb2MEL8V/L62RUyK/Gp6HnKFudGun5ihgrjlw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkus0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:19:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so214765281cf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042388; x=1775647188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XaK7wwNaMiRNcc/GM8vijh0s2knYzFFIEJjv9KzlP0o=;
        b=iTOSlOAhxRBE2pAP6XJpuyiNR6QOhxbmqrLE6KF04mc+KwsnXTV+5RbT86Rm992HUK
         mfGkghThhLlr64r1nL4ZqXWcoK05G2iPH6/+BPd0JFouDMTajN2ODtrNmNY7+ev06yJQ
         siI+ndX/gGnB4QMx0V+YY2pGRatUlb3xdRIVQjIgKSOXiEoYaWYCFwzRwURagBGxq/6R
         3hZsdJCFmhDdvaZ6kFFzJR4fWHuEqKhSky245+BD2qQshyjUrarVN560DZWWx/+dlVJG
         MYqgWCnws8lEyp4DoVj9ULOGoTh56F2nA9L1UJHB719F1I1rpJ84grtsvQDgGTP8DmGP
         p4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042388; x=1775647188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaK7wwNaMiRNcc/GM8vijh0s2knYzFFIEJjv9KzlP0o=;
        b=iHAfnHBYORSFc5eeEtBtBuTj9PtxI3cUQYCPUrP3ly3WIWkRNW3m2rwUEV/uXeti7w
         H0LRpHLwtxgIwkTgVD7aNXRVSoxbpZnKpSzdIdQHrMs+Iw+NLK0+Zi7ErHGNYbWZHrW3
         QcZiub0DV+7tzw2A+TESyR0yYGlC5uE85wTa+4gPJirkVspx2DkuGMAhsy4ejFdFuLkO
         nemzYVHyXKolKpych0mU2etaNWrUkuA03dtEBjdb93IT8hFtAkJ1fKJzrVfEnD5O5igT
         yoD4a+IVafGPb1AMoQHwlvkra9N0cOYCi7au4d3WZQKcuoWdHDVcLOhjozHokM+xiqJj
         eHlg==
X-Forwarded-Encrypted: i=1; AJvYcCXAm2tDFbGw+L+mF5miYQx9od94e6laWRh0mwWz7nR78C5r5Ekj2P+L5+KB5o8rQF798HmLlHCpKQeo@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5pdoZdHii2P4M46M4G7RRopkT57gpsyu1Ovl2co4XKqqOf8F
	AXSRwTkV41TkJHjbPkwOzrTCt+9w/ejyeb6if/L5bfMSArhiMu0Uy28iKckcbkuiAa9Ty5hij4C
	KS8wZKJWyolPoduhfsuXZAqi3jAd9bopzQWc9bHQh+4Utxi92+MHQ6fBCFG9OKT8A
X-Gm-Gg: ATEYQzwOY5br8CZvLXSODGsuwCvE/srfjubapz4d66qjY+6tQupAcQjr4JLHg10uJeK
	k9O2iUhyW/oPjxDee5wu9BlIu6SD5a89FsKyz9WpOLaBjKTl9w91CfIsTqaj9IjrIQTE3sdqa2h
	fEpKsP3uV3UCVV+vdVPa0yylFeYxl6E+Mwq5Uxm3ue+tBH9KKpdNcnnVdhezSqU6h7uFXkPrc7i
	yXveO7+i3qcClWxfxWcAVUmlbyjES60mRWZrUjegHaj69LPvgRg0h1ep9d+mBkqpT7DvpRIheRl
	5wkGQTb88BnH0F+eabjvI/f/qHKXbL1bAEfdGXYA3SgmHIdQjafv/4j8Wpg3+ZSGnHdYynjZsTs
	a7Svt3kPoKvip2BcGaasYG97cUcjxTKd2EPxANujt1HNy986HknSQw85Qrm5TPxlGwd0LPwhjZT
	xu8auf1e01GpxbaBSum9fxbO8uf/hOFGje+Uc=
X-Received: by 2002:ac8:5a49:0:b0:509:3211:dc72 with SMTP id d75a77b69052e-50d3bbde905mr44427971cf.24.1775042387873;
        Wed, 01 Apr 2026 04:19:47 -0700 (PDT)
X-Received: by 2002:ac8:5a49:0:b0:509:3211:dc72 with SMTP id d75a77b69052e-50d3bbde905mr44427711cf.24.1775042387249;
        Wed, 01 Apr 2026 04:19:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444bbbsm3258558e87.38.2026.04.01.04.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:19:44 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:19:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8960: expressatt: Add MAX17048
 fuel gauge
Message-ID: <llxbcvvmxhlp6nrc6ifdixjiumijrp7is4lnheqz6rrm3yqu6y@lwa3v6vxi5kp>
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
 <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMyBTYWx0ZWRfX1JbtBBm6hGkt
 UFd3GljU3FmioOTBxAI55esP8bAVWKIEwBkDsQQiDIdmPMa+ndFytRV/Ull1fRRAfkBmmOwpw2X
 V/+hWLbSG/OhBCNd2sg3+yy25nxqo4XFtPOttZqzGhdE1xcpNoLJNW9CfWLxluAs1LURbU0pA6C
 yy1w4V4UCDbWKd08r/6LD/TqYRsGJqwoofmApFTiS7Kok+DL0WE5gkPgjHuLk4od9niJQl2Wjlw
 9+1yWuz/kA2C511bN7o2OUpHPvPDb/1PLpnK0U96OIJfpt4w6/Bc3+AGJ2jxjzCxj1bo2Cqbo70
 v16bsFob5qQykYIZv6nirXhh6BL/OC3QrgOsv5rrEpyAfY5C4rlv+Yra26e3I16s48N+HA3rpU7
 GpiZ2LqdI5Rwgube9LkJx2w36MyJp5/7Z3ay1dOgpT2A4N0gCwa+l4OSH7CyNzpeFchjKUofrSI
 NteljWzC4h6QSJAzgcQ==
X-Proofpoint-GUID: k-dtC2NOA6dPks3jvuCrbQjtT7caDBmr
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccff54 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=OQN141zOAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=I5Vm2pmwM6l8vRM9G2sA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: k-dtC2NOA6dPks3jvuCrbQjtT7caDBmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010103

On Wed, Apr 01, 2026 at 01:28:50AM -0700, Rudraksha Gupta wrote:
> Add MAX17048 fuel gauge support.
> 
> Tested by comparing battery capacity readings between upstream (mainline
> max17040 driver) and downstream (Samsung max17048_fuelgauge driver)
> across a full discharge cycle. Upstream reads ~3% lower throughout. Both
> track the discharge curve correctly:
> 
>   Upstream:   95 92 88 87 86 87 83 82 80 68 60 55 50 45 40 35 30 20 16 10 10 5 5 1
>   Downstream: 95 94 92 91 91 89 87 86 84 73 64 59 51 48 43 38 33 23 17 14 12 8 6 3
> 
> Each pair of readings was collected by checking the upstream capacity
> first, then moving the battery to a second expressatt running downstream
> Android to check its capacity. The battery was then moved back to the
> upstream device for the next reading. This swap occasionally caused the
> upstream capacity to read slightly higher than the previous value
> (e.g. 86 -> 87). When this happened, the reading was retaken after the
> value settled.
> 
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/arch/arm/mach-msm/board-apexq-battery.c
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/drivers/battery/Makefile#L5
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/arch/arm/mach-msm/Makefile#L308
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
Nice!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
