Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C93B14B4
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607732; cv=none; b=hFjUJfbCpsEXzhPWXZ9H9tZrSQSsttvj4Heb7hZVJX54wsZ4X33wikpS4rrK54CDAy2lpMb9r1wTupnrHV4pdEAXXGrISmDD2yUZhN5guOxo3PyVQma+tKGlSoAqK8OlKUUEHW0cl1bJo5z0Bn4VNrZk/xVx1Y2JbPminy1whfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607732; c=relaxed/simple;
	bh=kj9ICbrByWaOlIToQUaQzYGm0Ti3zSuSC7HqDM1vfj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDhRtOv3mlHcsrAo4xPDuR/f3jlsznNu3DPAyxyYceUxFo93T5DOtXz3y+3uWx3MkzU05Lic4Ybc68qWb/8OmoMT3WJd8wd6Xajv2FCK3DpQe9f+utgXzM6DraG2a1QhCELl3eKVpZbexMNYZtDwZDzDkkVEn5khnO+mEExl0DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkRnSBjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xj1KJG/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkRnSBjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xj1KJG/D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABROI3224489
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G94LMmeu4eZmksKIZ433voX4OApuflSFpNGDq5tGOoI=; b=ZkRnSBjmxjtNbFsc
	L+g4pmn8spfT0lilsFz1VmWx/dM6SYSYdmeeRSEYCq2eu4l9oP4+bEZzh3BDBOSB
	VYL7VpQDnSY6MycclA7CzpqDtI0S1YvRri5UKQV9SvVx0SofoMA+/uI30PtJoN4k
	MsuGKS8K5H4rIK3cMZFcvy8yYV1sLLgOJhF4uSQ/gGuQEw5PBxEmgGhINz+D/tG+
	egn3n5NC9T4weeKgskemTTQbiNdPXE+Qci9kk8eTy+z56EsnhdS6VAbJtrwkwM7D
	dDRvxsFuEghR27IBw/pGlnDXUjeMMoUo0TprCV2DeBLbqgGnRAU3dKdHMBghrbSI
	Ul4pKw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysrvp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:02:10 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43fecec85bbso147781fac.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607730; x=1782212530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G94LMmeu4eZmksKIZ433voX4OApuflSFpNGDq5tGOoI=;
        b=Xj1KJG/DMpYVxI7/M8s5ebG8rkyzMOimhQM868PJZcK1Eyh4HrsOVvA/GgRSQBwXVA
         EHorR5x5b8oZV1nwLTtNcSNbBHOF6av5fvUzV1BJq11xbXoKNo1Kne2ltj1425wTily4
         Q1IieHSCFAokBFpT4mv84VBIR8qkKF+5Y9rtyjsD1cUIDARAdZCbf2Nr8nS3EJczcng+
         SzJj7EloLCVVc8yq/Mi8airJ82LJinajx+Ikse7qdIXYz2c3rQlBISRebEsPPcBI1RHw
         jI32omC4L+ZyqhLHr07tSUyVY6f2cbeVug3NcWjjeFUYbfvorPYSXDPas8zwF09p3IIU
         lgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607730; x=1782212530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G94LMmeu4eZmksKIZ433voX4OApuflSFpNGDq5tGOoI=;
        b=RcNOEsgQhjWSIVKLE1LHQ/12nNlDWqklmcQlqjGWrMb+JK0IZm141npPmeEMQ/WGgB
         5AfZnZDKn2CFU4cq/HDsSo6yHoCWTjQIpyduoVuqZO+s3aC4ENQXT8MLFTtUGaRAl8u0
         lbJsrk1qQKfWWIYqFIGz0cdU5D2+JA133jsF2oE+beIQQtzLfWG3JhR3AYIEGG+ceKx/
         5qvBgD/KDkukCrW4mLgdyF7p7Ui1m5ilgR50yprubFtRjtGPiOZ7cQKOGRVxfN9qAT2X
         9X5YIeVQZbSMQCZl3Pab3zToKj4wioGW3ev+z7HIhW6w8cMc+YUWDRkh1LCNcdqh84cA
         Sifw==
X-Forwarded-Encrypted: i=1; AFNElJ+T6vZNHwCrd/898vNl+RHz811IjME/dPw8j1nIX2lquxBoArT09e0B6m5AGc/6YSLXi5CBJ1iGXw88@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Ut6rO3QWBgrf8H7BvzpmIsfl3GaJHoN7kY6CgNq3OroWqz2G
	vCSYKOIEUU9Yt1/t94BD42Qe3gk/YWyWA2ygq8Tki8qTXyJcY0NA0kU3xhejXrmrqjamYM3B8d/
	M0iYPisikXO04RjL+8xxitiUjvNIDAJJ9MF2DfGNSuIj6MqyM/04IUI0c5cUbUWo9
X-Gm-Gg: Acq92OETJI3GbwODV/ZuumIQ1Y3S5OEoaOaDLL8G4viiCfmYnoG44KPt2MVZf1KgHOe
	QceQaFWaIETHDYNLjNX/Z51NnzqK3wU3daBHzMCSsiPg0lArPiP3ATk+iX7qHQf2PVCN52n+rfz
	N9GlYnSijFC30/PSxJeu0SFKG/YnfQ1sOTeJVs9d7Uzx9RUgGF7AvtGR+Oa5vQ48DbpoLJrjnBI
	+q9gmX/nsUBA8jYdzkOsVfMLdqan6cLhoUNDEOSqVFsFHlP2x9adFIqOlpiPP9DKvFP4YDvkdrA
	XJmHDhqaYJS2aa2huTQCz4JvIyE0DcZ3Kq0NYeEUhn6mX4F2jx+LuLQHxUU+MzNmA/n9PU2RgQc
	RRlq1FZy5qXGkMPHH87x+iQU/NWp0GQK7qodQmrph023Afg==
X-Received: by 2002:a05:6830:2706:b0:7e5:68be:ee7d with SMTP id 46e09a7af769-7e7847a4867mr8582241a34.6.1781607730101;
        Tue, 16 Jun 2026 04:02:10 -0700 (PDT)
X-Received: by 2002:a05:6830:2706:b0:7e5:68be:ee7d with SMTP id 46e09a7af769-7e7847a4867mr8582196a34.6.1781607729642;
        Tue, 16 Jun 2026 04:02:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b240bbsm640579366b.18.2026.06.16.04.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:02:08 -0700 (PDT)
Message-ID: <65995138-0d0b-4b8f-ac13-8daeb82d1767@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:02:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 5/5] arm64: dts: qcom: Add device tree for
 SA8797P Ride board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7zbv9xbU2K2ZikLQwkMgD1Zmmd23K49d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX0FzWn2pVaf22
 rV15j9ewXxQ8VsZ3qt9Ekk3BIcBEGFIUKPbctFXhdHlNGJTDrJeppixjouqdVm+Zl7cjztWsxZd
 9Yi3COE5DvYb9xN5kbaPThacz1D8AiA=
X-Proofpoint-ORIG-GUID: 7zbv9xbU2K2ZikLQwkMgD1Zmmd23K49d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX9a7IMBrmtrwr
 aJZAdIDdR8EjsXwMO9qctQpCXpx4Hzn/ZW0sPh7gOOfaDiDmNSRWILbygAEhD5Id2J13QFonyTt
 +JrlaVNuH2LTT499bRYIfeTKQ9hI5tfA8dZdgcUCXsHj6gKYWYez5qJh1NQjxgfLedJWgDbAjmM
 jo35uiLD0TI1veIzn2dW5xwqd3bm9IZW2KYo1HyCakVccCBL7U/JkDs45vPI59VY1wPQWFuWVRu
 m7dVGVn8fyXXzuRZJRWPGuP/wGQYAyuJvIbNAVzwsIF+VaFdsXMReDYXOHzgJxDET5/QApfe4hc
 eUw9Ew1oX0wWErMERNMF29k/dTIeEK66/Yfoh39y5DTCTerBNDu1JqOhzFll5PIU32CPqP+7YoP
 Hrvq75bt6boUCHkK78yIMxJoWEgklsyqRaVZ24SxC90XoR2tCt48l2i8Bouvzx+95lkbfLC7KmH
 H6bkZl2nCV4tvTru/vw==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a312d32 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P5_WXVEU6eqHpsoIjFUA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160111

On 5/26/26 7:13 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add initial device tree for the Qualcomm SA8797P Ride reference board.
> 
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +&thermal_zones {
> +	pm_kobra_thermal: pm-a-die-thermal {
> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;

0 is the default value, you can drop these lines

[...]

> +	pm_kai_0_thermal: pm-e-die-thermal {

s/pm/pmic

> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;
> +		thermal-sensors = <&scmi23_sensor 4>;
> +
> +		trips {
> +			trip0 {
> +				temperature = <115000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};
> +
> +			trip1 {
> +				temperature = <135000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};

Do we need two passive trip points?

Konrad
