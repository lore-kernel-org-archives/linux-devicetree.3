Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF5399017
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161948; cv=none; b=nFxrYs65sVvsfLneR7S2NGblL6gxiBoPaExDIgOe4GLWKiO+z6kHoUj3izJDqPKyexvc2KGqB6qV6L6GubYNPWuolC6tEGXoUSEEHbQsVQkoMbzKxfyhy988kSqfPUbIw/G4ybVpdtmvm1JlxaobQxVNRLd5Np+pOO+IZSKPm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161948; c=relaxed/simple;
	bh=vHpNUdCQGHAaZNdSG+mvjt0jTKa8gfvBh1rwe8/TOWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxcC7SJf5biKZri7wbgXJ+C7HR69alhfm108QrASfb/Bu9v3FcO8ZDWQyw/1bnL04CcOPyXmUFuY1JGRyb0Sdm2APoZ2TDK5nWm4zSS55IiSdQ7dAMBQknQJEpJH0Bqq7Yzsr5TA6dab8JoMTFip1KxRP+IiVrQWEguKGwDcS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cjwg3l82; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkPsZMiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cjwg3l82";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkPsZMiF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EA4D9U030219
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zsIx2znvs+AjtREQEwKslkZcBJGZR0bgCFbyOd4+ICE=; b=Cjwg3l828OoUJkU9
	b8tyfPSKQJiNyLKHeURk3WQLOOWUJVs7M/wSb9LCQDkUb5oGTU7d8ZPiuu2Qrwrk
	gH49fC7IZfTseEXR7pyaxtLSmO1xqz+y7XS/KPHVJRiFnG7Hhgi/GG1vpLWFz7n6
	ETYEA0rt7Y3qaG07SB0rHzpLDCZ/xwAm8sU88pAFFKI4g+y3s0rWJKMlktUA4aoO
	6jdO42M/JplMouEWuDhjx196BE0OZgGg/vp8g3u87aNYxBkY5o8aFn/KPSTlKVT8
	KIMiYRXQ/3shM9bmD7Qjc95+Z2nokMGYMmTEzcJLuCjJwz7vVr8zpwDwV0s1JBqB
	AmJfQA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmg1n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:19:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acaea1ff11so4074586d6.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161946; x=1776766746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsIx2znvs+AjtREQEwKslkZcBJGZR0bgCFbyOd4+ICE=;
        b=WkPsZMiFW28Tr76NiaTklbTVywTFlmnWq51XYONya7uGYUejFVPUjCbPN2vtb1gJ/q
         omFBR64HRKaE0j+gFA38LMzvBXvqxwEe2iKrHGCRJVGJvNk7ptW9NE/F3ovjWyAKK2K+
         Z/GD7Jr5CxJ6nsidDzArcvma6zdcRSNH6rUcmOmgckBT6e3IX60Gx/2uoZqJGeW3DYaD
         OrObUAptsv5xBwu0uDSjQOQjSjUCMq2+1YwSA7VbnXs4J2VSkyBk99UqUVs/wc8WfZPt
         WWMMD5bkPrLeIGtErdBockPtz+OvKJrMf25t5UAI/PFXT8tDNb3zooBYIPdhXmeqfGU8
         Awrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161946; x=1776766746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsIx2znvs+AjtREQEwKslkZcBJGZR0bgCFbyOd4+ICE=;
        b=DkyeDk7Dxe45Cpvl8iwhH8j+npTmvB6Dcs7WgKNv/si0OsOWm/lgUVr0dVQEZam4m0
         PKuIm7ni7d21MAw7WiSZ6uqSlK5BNjR0nUZinxyNQEra40rLFLoKq4pLfqP84XzHgxke
         KIikEwxygna0ZgKEf6yto6imvuHoYU4A5wcUKSqN5o7GXPZzmoyo41P1OyoXnVOEeVEZ
         h7B716/n++KsU9+BnzEVlN2pVoAPRABHxAI0rrYwdzKVbq1Ye7mb/1SPMad+MEWr2gx+
         R26aWUlSJdGzUotE1jX3Fj+T+wxPv26/uoR+ZW/PaUudyQgdXXCyBYwUF+bSjg6ZHpQ7
         S1tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/btqv3H9sRE19GSwVcuBqxuMXGhxLvNNxCwCqVIf0cxzFfpN4E60ZmOCrYy6JMZLwBkmwq0SkNXi6+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhtx4WDYnAhpgjF/3Tp5yrbJYoij7RoKfVzF99XrV1cP+dxSl6
	2woofsz5BkWFWlbccbPiq0ivEfJYOgvnpzkeuCJy1LuzGXDcZ7FV+14jbV17gOgHceLAmleYmu3
	9tQLhsp3zjozI3QbobtYOEvY5uLU3/7nObYIkXezex72QUwzO4wCz/EIeveOzc2bJ
X-Gm-Gg: AeBDiesJoNHXzbWh9zc5gKurg19XfFFtjZmra/sIpm1URyuiLxB+/o64wa36uZ9v5Ov
	zVs5uq3HyWXuCqt21hL0lfuZmy/wyxCQGL7iMEs6b7CCuxldQmABJOJBSeXdB/YFnmQL5a6rU1a
	+x/frwnmgXXcnFg1f4Zg0T72I/zzy9vXwLbdgBD5FMkdxe1hut/Fb5slyHl8+WwHRfKfk6pdoro
	/QGd65C3Z2d9GB6HAl3+38WEfihvnIG7jSe9CwZFKb1udlSyLKbY+nAWDIe8OCLsHxYh7Gi/Oag
	a4BoTH/WXoFLVWQdnhZEfdXVWofpzyj+2iRJRfZctGtp0faFQLK+67m1qlsLmcZ8Mq6/NKDpVaX
	0a3n23eQBC1d7ZuanQxUUrv428XRFtuewrgYJp6UMO1brSoWKfKVCNDX0fbyvkZk5GaDIBHTgoy
	L43O/EznmdHjXPDQ==
X-Received: by 2002:a05:6214:3211:b0:8ac:a0f4:5aa0 with SMTP id 6a1803df08f44-8aca0f45e30mr113540546d6.8.1776161945824;
        Tue, 14 Apr 2026 03:19:05 -0700 (PDT)
X-Received: by 2002:a05:6214:3211:b0:8ac:a0f4:5aa0 with SMTP id 6a1803df08f44-8aca0f45e30mr113540266d6.8.1776161945415;
        Tue, 14 Apr 2026 03:19:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e43sm401628566b.13.2026.04.14.03.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:19:04 -0700 (PDT)
Message-ID: <6187fa72-d14c-40a1-bc03-ba43860d0e27@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:19:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8750: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-6-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-6-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NiBTYWx0ZWRfX7Gch9yyqFf5q
 mhISNfb8Ve7GVuO6e1u0vINbpX8Ic4TvbUsyAjUupX2XMWYaJk2TCmih+jF5H78Lf6aTAjuu2T1
 DDsbcckYxSqtFtdCFfah1ye2vN/qGeHQqwD8G77kUhMx43kSLxcfdFyAUALBG4ZmQcsL5k98Pnw
 AtMANMm4vLB9c+1Mpi/CpmjzOmSKY8H3soxn+7UAXb2ghEn7M43fPXjA0P1vsEMPGyJLmVSrgNM
 OYyrSlRebZbYM+6XvG7EG4uosnWE70up1w6KfNe6qlFS03NZ60JBzlMzIzlpKgOHatVqhGXupkf
 6e5pZeMWgY+QDEVceqjLyfdHbLTTdPPMbC8Oi1R7Yi5C8HgVXXCaDpU1vbTKdsIY4PQiV1wMUeh
 qgLsDzHIEmxEZdWVfbKUrE1qZ/h8m1VgR5iCshsz/dKt3o9F3DqhBZT8AlmiQSCGU9IxHGWt/VY
 8AG03yV+apGJmCxO7Tw==
X-Proofpoint-ORIG-GUID: N5dsbRTbJ3SQCGW_Z0rEblCOvhUKzsHl
X-Proofpoint-GUID: N5dsbRTbJ3SQCGW_Z0rEblCOvhUKzsHl
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de149a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uGyuuOI-cJ-b_BVNecgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140096

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the sm8750 device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

>  	tpdm-cdsp-llm {
>  		compatible = "qcom,coresight-static-tpdm";
> +			label = "tpdm_cdsp_llm";
>  		qcom,cmb-element-bits = <32>;
>  
>  		out-ports {
> @@ -6814,6 +6839,7 @@ tpdm_cdsp_llm_out: endpoint {
>  
>  	tpdm-cdsp-llm2 {
>  		compatible = "qcom,coresight-static-tpdm";
> +			label = "tpdm_cdsp_llm2";
>  		qcom,cmb-element-bits = <32>;
>  
>  		out-ports {
> @@ -6827,6 +6853,7 @@ tpdm_cdsp_llm2_out: endpoint {
>  
>  	tpdm-modem1 {
>  		compatible = "qcom,coresight-static-tpdm";
> +			label = "tpdm_modem_1";

Please fix the extra \t

Konrad
