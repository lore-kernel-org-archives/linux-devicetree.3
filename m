Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204163CB548
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339106; cv=none; b=nNuGC6vmeTDJki6AV4DrlFGvCtjla7S7sTTrDr6rOBIuBnHWVBKNsb2YQUPKvkRgGdYIPEy34a4ERWezUNJE0pfVjyjqAHdjeY5W0YswjRgeifasLnvNfmBBNLa4UNZ/JmiNlrNSJDa0Ow6BWNj88VyHE+7G8Xh74ZsQd5ShQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339106; c=relaxed/simple;
	bh=SfI7l0xdEyQtf769eHD+Hyb3vKC0KOiSch/jCl0cmkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agKayUwO43hy3W98VVt4ssZW+ah2zqUQWqrWfMbAp/kEF3JLzYkODHajtYx6qn/jvbyM6sSraA8QzwUTcBbjt9llnZYCB4vxNbl8Sa9R77eFp4G95vx68EKtV65yFChkoiofyZp0N1g7JVq87E+bTCfNf0Frk0cC5A2Zd3U7QiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQvYH12f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAFoim95; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQvYH12f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAFoim95"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Vxwc853881
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LBFg1pabf1pO113gxKvEtkZZTp0GV+XYusVmM24SSJM=; b=WQvYH12fQcc3EsZa
	lgr8TVOFnUWx3E70G1le0bn1hq6xSeA1V3269uvsRzR6cVrzW+rBL9J5ADgeqkLQ
	5Hw8Y8BdEarGVasVNDVffit8iNad9vSmLZAbRO56seNOOtlENcebx3Mxn4IIn156
	bjheJX9wDWP5DfkzdOE3UtiAnzn42RzC1aGDe3lUgHxdPJFkosI77LRZFWjaeNHy
	w4HFe5RU85Xd7WYjGxRJK4Q1L2S9YakQk8ZmVN4KmaHZ7RrEl0xh4FYX514lMk+F
	NT9g0o6Vd4h0/OnEFnUfqF65+xl+wv2zgkB2Bfc8bqbY/nTNc8p54HZ5CkxhanCp
	yE+TyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w30mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:51:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ec554a80aso1995561cf.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339103; x=1788943903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBFg1pabf1pO113gxKvEtkZZTp0GV+XYusVmM24SSJM=;
        b=IAFoim95EXvP05QeWMKU7t7T6veFS6bHEBWBh9ZwTD+sYOXr3+3vX0K/0gu2k1qEmB
         UtOv471aKD252j366Yf6KaXqh/e2H3H1KeiYSRhlLV3QkU+ivAhGTcQGQTXKLG+R3dPV
         WHp7G0+qfLHYdi8GlpkRc3jYCvifW7P0AB2tJEVqRtGVYlfHHq5/6UW3iH2V99/d9ENG
         DcWrK+nEPfm0kxNE00ehZgyMZTr1S5S59vNhWWOVbsfiifVz5fTipenUmKTHN2tDcj0q
         sKsw9rINaBGSMHUQszZjMZK7dm9+u4AxEfphy6rxd8ztkMJj5T1BeaRlMhKN9wYVzevA
         52Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339103; x=1788943903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBFg1pabf1pO113gxKvEtkZZTp0GV+XYusVmM24SSJM=;
        b=o0ZzVOmjVnM+J5sgV2xlGpIy+zBnuQ0kfY5SGMbddfAPRhem5+Se8EqQZBukDHDBKv
         E16R/JOA96ZZgZ2nIXKQwOCehk7W1EefPMxZ9yLCg7+b0fc70N9jNQuQ5I8Zq9LwBwW5
         BtkVZyjA8HzEdD4axy9LGcb2A9UAt2YSCURDwXkI1ATE/uPGpkRZorGwz7E6LG8LmqCJ
         VKyZoRXP3FINLOXFwLWEPBODS5Rfa2AevgMUvDx2Ljrc8GjjF4bnKMrtnvcuHoe1NukO
         yIYq3evPDBFJsaSbw/caDI0JuzUh3fsJj3+q0spRoXv1k+680viBjjcwneCBIat7x6NO
         t9wQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWT8dwT6swxDzxXcwdphr42fGOkYSm2vyHAtRhL6hy1Gy8clQWCoYHoQK8h/9v1YdGZP4B5J5oyRnB@vger.kernel.org
X-Gm-Message-State: AFuF++kUCJo6Zf4E0pLElLkRa4aT3sPNIu4iVxdCMW4YpyJIqEY5+7Yx
	FocvkQEmSZ9pgVF/2hMwAKuuPBPO77FwHQXhsF2b/wSfJC0hAVa4VfiVyvzkach3LrREPCkmx08
	b4h4irl1lsvM8ipClJTf94QJQfMcgB5MKH90L4EkW73e8zPk0DmFlQlWvni7ExRTI
X-Gm-Gg: AR+sD10Nx7miXwA+A37y+aJjJFiebLQIbOJTy7prNQqaJASiWa3uQ+GwR7/9/17Flfq
	KasIQEFufEYno21X20Y5VFuxXTDZnj+fyHHyWUIrQ+9WEHPiWjKaQqh9BRnz2fk03nDM9fyq+Dv
	/AzLJDNcMSUWfW48/tEPyjqy7JIur6K5O/TFmepnjvNGiVzkqJolTvKNXJicSc1G9d65RJXCHaC
	4J8CFg7abYvXsVZVKeEfjTmuWHkcZw87WFHVSHkNzxkqwRkZIoZ+V2b5qw6IhCOgtyCr5Hz2C3u
	khi5QVNbaCzxHelQ7kfqxiGvQ8gtSDjM6SXmnIbUtc7mKaTw3W2f28jRjY2ZgpXMywKZfYrwQTk
	dbnTYiaqu4FUsFcJbpWsBiw==
X-Received: by 2002:ac8:5a09:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-53036b9ffd1mr19442441cf.1.1788339103207;
        Wed, 02 Sep 2026 01:51:43 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-53036b9ffd1mr19442071cf.1.1788339102698;
        Wed, 02 Sep 2026 01:51:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm709891a12.21.2026.09.02.01.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:51:41 -0700 (PDT)
Message-ID: <ef06178c-5c16-4cb4-8ef8-3a7e1ccbf260@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:51:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in
 PM6350
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zEhcB-QsrFQHXAHUWWZQoES2751AUZM3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX54tMWAxISk2A
 jTP/1Zpom8pQuRe3qCl5UyO+IKyKWrf2sNR31bavpF28P7hrt2h7owGU1M6pqp4H7J2EJaUKvY7
 AZlvrDxYnZvNxDAkDSTFLtqYOLwXSKc=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a97e39f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=nApsJwpBuUEKo6u2QBcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: zEhcB-QsrFQHXAHUWWZQoES2751AUZM3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX+VCRIVPH1COd
 46HmujYA1cWSi3ASS5+1IDOho4lwPU74ZDhOJpdLqXuBOUl00tHy5UgYpomE9hHVqUGpIn0Rlhz
 GwPeE4f0ch5K+Us979t8wRNLCW1ux5MMo/CXvFY45xODz7pOc9fQ+todvdchaKohXRAW6ufrnR4
 NNa2rShgiOTWu10KhkLCLis7T8zt+qi9ekR4Rwcnb6PZt+h6zfUa/JTjKLAb/6RbCr3/HKDWf/W
 Z32z0h5xvHxW8pQn5V69wXORJpFMP8DT8+dKDdfPjWmnanWc7uMTu34DqEMrrRyAoN4b9PVoAu0
 gMCYILNH14JVc27R8x6A1xJQGhyz1DUK2Y+3wCjIiWAOxjbjRTEXsghdSjD6NeMofRVVkh/KMuw
 sMSy1SpmMl9+YWkjNIqqdJI2O6v28ZKXTOXI5wLmPEEvkHJ5wLEHzl5JndXfY7A/t5Iqy5aqIWl
 d7GmBYlclimd3yUIL4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020078

On 9/1/26 10:58 AM, Luca Weiss wrote:
> Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
> are not used from the rpmh regulator driver on SM6350, the regulators do
> exist, so add them with the types based on the datasheet.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index dd2265961151..7d20f3e47760 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1591,7 +1591,10 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
>  static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
>  	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
>  	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
> -	/* smps3 - smps5 not configured */
> +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
> +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
> +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
> +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_hfsmps510, "vdd-s6"),
>  	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
>  	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
>  	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
> @@ -1608,7 +1611,7 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
>  	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
>  	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
>  	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
> -	/* ldo17 not configured */
> +	RPMH_VREG("ldo17",  LDO,  17, &pmic5_nldo,      "vdd-l17"),

L17 (and other NLDOs on this PMIC) can do 0.312 - 1.304 V, whereas
the pmic5_nldo config allows a range of 0.32 - 1.296 V. But I suppose
that is something to fix separately anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
