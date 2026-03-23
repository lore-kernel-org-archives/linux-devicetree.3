Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A1F38B7A6
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261613; cv=none; b=DimbiHVb2xB0aBEOk1Fwqt94OhLDHxjJS0SU5AAItXTaF6P1R03LS3x6MtVkWHLqxYjv1Cvf6QqDF4pqgFvcu+S4HHynU/dtsnoSNUVWtgocTVsEzBUgdqenPsW8rYeKm5ts2SbWxsyxvgj+RAwqaSJnr077QqWuk+KMdkg87qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261613; c=relaxed/simple;
	bh=AhgCJKNKN2SuSP8pwgCoCXs1i0KPrcbie5088lH6RpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dp84L+pJ7UCRoYmzK6BxFkovqFEskhPfPM0tMDfnW+3SyZ8loFmzDwffyFZd/YyzSxOR5PfJQHZGtN4v+zLxJ1J/8QFCcuCvosplut7RKTSwNRo8fRSK9V5GZgJHkRcj+MlZBfT3oBO2WZ7aa57/eHn2+h9SEsHZulXZMNVC5nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diytOx1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyFeLaRY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diytOx1S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyFeLaRY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N59sdN1916089
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5VbwRrC9FShcy8KwaAgA4sWuLUfupsur8ObOZmxynw=; b=diytOx1Sdh3WsFHi
	Cd7Lc6Jg/HWQZthIEO/UAtGuATSFQankHaEpNVlBF9vV+zfEW53La4NNp6+Xqatm
	v2FHXaLNvf8VzuJ6PgoSkoJD95nmO79eUDNRluI1bMXOYejWQDl5rdtHXsEImJ+S
	ZB/cMvu889L1xtlEsoc+DnZrgXWtPSymeLX77JpmLfuNDC0nUDBQZCpSK2RihOHq
	zyHIcKQg8wIwhyLQD+ZaD1wtsKCJuQIN9Ur7/m77MZ/TOgDrra9PnH0qALvnDS6i
	/6TaB1f8OL6OnwkYuuedqGRrRu55OGOqjEYwFQKLS6u/qo6qy08ILsGgOAYRYqNZ
	fv5Y9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng4xkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:26:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso40590881cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261611; x=1774866411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5VbwRrC9FShcy8KwaAgA4sWuLUfupsur8ObOZmxynw=;
        b=hyFeLaRYYcRje62+hQUQslfjhxyUgBht02Rg3O43TnMm5w+V3nwRg1JGSPL2iLX3gw
         s0Cq2SHN2Bu0oRkOFVm1zBOnFwr+DK8obGAkVUChLmxoKj0/QWB/Vk/IoljTRX7w7StV
         qLiKgIayNlomzktKFK/lgcMTRH1aJZspDBCC47gJWaeVPKDGmzzITBQj2djauMPY3kgY
         ZXVJmBJnU6Gz5z6q72ODDYlAJ9Ozo5d087JRJSFMVTOfrO36QbIERNSEZqImaO6au/Nf
         9pcUgZbmQTmI+ozXNAnhL0iyejJQnuo/sflppR1vJJRcAfcDuMtIE5rL2rKBeB3q4ys2
         i2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261611; x=1774866411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5VbwRrC9FShcy8KwaAgA4sWuLUfupsur8ObOZmxynw=;
        b=LaixyIvDGwwBLU3MrJ2xCWuGplNcB9rdng0XQY53qfmjMw1wc30jDd5Byb1EtIjDEj
         XSRsA6QOQ38T3Dq+KmXB5x4qfvisQrWBxtLtJ+BWNQ54+nm2tlvd1Ds0zb1mcU07LaQ9
         lXJMCR3kL8wu0y5/ZiTNpJvdjIlR+fomK0tywBTnpAfPfInQCjVXGX1sXaFftIw/WlQN
         3h0yuqwQcPpDB6iDuGn5czSNStHagvRIvSUfjh1T8utbd/q0NuSN9fGPcjH9lekvUu+N
         ziZ5znwUXZIYjIVOV5GGhNKWjGpxIdPlQq6pf4IOmBHBjtEJ5GtVENhHfDRFAuDXXqc7
         36YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpE3vS+CX/syqWoMLeX+V3A6agjSfuLzmEfUomPrsCeADQo2qtCW10tQWuk7wSx9COozZSaWD8ENoi@vger.kernel.org
X-Gm-Message-State: AOJu0YwCC9a0ONp1d21iWCOp1HO7kEeIh41c0+qNXgaBVKEGbKICYyu7
	TCJZN/QERPyh9ip5lTO5/2ST/9yZjQ1jWls2f2EXY5ol1haNUvfNBZuNX9k/IkNdWmRMWGBw5o9
	HetVkjLoIYmdrUhwsAH/RGcyZNrNUiEbdDXMcabFzPKv4CJ0M+nVD7WLzdDjaNOnE
X-Gm-Gg: ATEYQzxB9KSkD5ACXcBVCjdnCAZafXWMSq1lPvMM8PFmQZ1JNifMnse0IkMLw1pX65L
	Q3fherj9yVVZKBoY38m3C8HwHlKhsahh1AnWKbcEW6Xz0amS6QHV+RxzaRKiMqezVUKkVNgTCDW
	kCwnTjwnRz6H0oQVGyhlQyhYlIGHbdnfNGl4Q8VrFaft7cOI1Rtk0iAPuBz8EGewiI7+uavwVj6
	tIPLHisdXOn2ynBWOEPdax0LsqVmtjmqituShAv2illOrdik5853cYIjvw1CfaHbR0qAVL0c+oI
	EyQBJ2o1I1moL3MBrytj3ZIOHR4F+r4hKzxgnLa4bp9lr/e61P+/dyQzdbwp8TGeEqlGlur7Mdd
	e4bnCRZzcpwGC++RgyRdQOV10GqKsjUuLo0gnSZQPEz47PLUQ9RGeo1tO4FgCYSHZfp+INigoUL
	OMLCA=
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr4089251cf.9.1774261610849;
        Mon, 23 Mar 2026 03:26:50 -0700 (PDT)
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr4089151cf.9.1774261610373;
        Mon, 23 Mar 2026 03:26:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm474908966b.1.2026.03.23.03.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:26:49 -0700 (PDT)
Message-ID: <3d75f9fa-f744-4437-8c68-16ca751193ae@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:26:47 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] interconnect: qcom: drop unused is_on flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-3-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-3-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 40hgTvsL-T_1J1JRH2hJmfWRvsqcOauJ
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c1156b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=E8RJyoIzjAt95Q53sUsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 40hgTvsL-T_1J1JRH2hJmfWRvsqcOauJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MSBTYWx0ZWRfX5HCr/MKcFzGM
 ic122x/7nNIvNrkj/IqXgPnROFb8qtQoiTwatI0F0Ni04j2RaT6KkFiABKfxSgE0mnCEvNU5AO0
 e9EaDmUq3e1SXzAaFozBqulmx+/p6JwP5N26/v21B7v+GWK26OUON+g0RUjLIdqP9i+S8Jv0GeE
 DE8pM+c8xL0Si7YIjltlJpSRsWUvwTMztuOmybFW6Bb5HLiPN8hmNeGvIhiwyeOrgFgZ6ZE/xih
 JOU94sKuMqtDDxCuIyM1ND+n2uNWJzCqySwSXbX4vM8dDUyql1HUXwGeKY3OlSCTrgTc2Cmqsk2
 ZaQnrVvobWz0rw2wXuP7sJykN59i5k9ntrNnyMywtid6kaDRzhevU0kR4kVflpTs8PTOVhDdo/U
 5GWb9Y0hIc6sju7M0W/2T+QSXOY9vN44x3MF9OYMRteIRgJKpAmGaSLv8jNmTa6Fz6dMiOiF+3x
 gnGez1KC7Wj5A8al19w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230081

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
> clocks") has added the is_on flag to the qcom_icc_provider, but failed
> to actually utilize it. Drop the flag.
> 
> Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
> index f4883d43eae4..3366531f66fc 100644
> --- a/drivers/interconnect/qcom/icc-rpm.h
> +++ b/drivers/interconnect/qcom/icc-rpm.h
> @@ -51,7 +51,6 @@ struct rpm_clk_resource {
>   * @bus_clk: a pointer to a HLOS-owned bus clock
>   * @intf_clks: a clk_bulk_data array of interface clocks
>   * @keep_alive: whether to always keep a minimum vote on the bus clocks
> - * @is_on: whether the bus is powered on
>   */
>  struct qcom_icc_provider {
>  	struct icc_provider provider;
> @@ -66,7 +65,6 @@ struct qcom_icc_provider {
>  	struct clk *bus_clk;
>  	struct clk_bulk_data *intf_clks;
>  	bool keep_alive;
> -	bool is_on;

Hm, looks like the clock vote is kept all the way from .probe()
to .remove(). I wonder if that's really what should happen..

That's what drivers/interconnect/qcom/holi.c does on msm-5.10

Maybe "iface clocks" are only needed to execute a ->set() on a node?

Konrad
