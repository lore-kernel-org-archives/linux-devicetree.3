Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809453;
	b=dObZI2GWvaec7kwiIAOz+KRXJlRhkPJQFlozWcCM2P9wEfd3ADJPw+0Q6BAzXIxTaX7w
	 8WVKuKDa1bDKMEBAAdLm2RCWwxj1qCaPmIe0qlUBXHrtRi2XHCl/XnaPDaR8+/hoK+q4r
	 rX1XW7VBJOD65HJrGYIxIB8tognEjEyV91yGIGhYtbZr3s0ldMGJzX1MAY/fAmb+2N0TM
	 AknPKjBeA/eFeAWcBDQ3r08ZCilMqMy6zLq89xa06DY6rHwZbkxjUF/y4dX7UQcSKjV3L
	 AFgd74qeIJnS0f1YWU0qtQ6r8qHSTfRzBaBU1HnnM0i4AMHStjzHhWkqKlR2wID4MNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
	b=DRtKI1/TyxGDVFtGZ0B89SA7L9HvRyEnGogXOGJV+CtTtA1Lmy0nCtja0+eL/Wrzv8Rh
	 UkHIe358XRZwW8XggEiOvOb5jmUWotzUoT3//pcwcREOAzZp+ymsNsRYflPv3v/vRB+ly
	 1b86pjlXhn196LqSBNB8HI530PYhKshPXPkwbY2z5mmkj062bVVR5Y6X5+7fD5Sk/lq4F
	 cETK+LJTyg7g9v/WxB2oKMznug2KENqKGtGFj7glh/00bRcXMs0DC3dELxvCbjlwcChDW
	 GxawXZPubbkLeGONVHPMIFotAkKZFufoNYMlaac+w43CfVMXG94uB0KW3QlaKMjDwDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OaQ5e15P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pg4ocbBf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1357B606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1357B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OaQ5e15P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pg4ocbBf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lcei214185
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=; b=OaQ5e15PJX8yGqJ5
	bsHWfMCv4B1VKFn1Z7HYMNi2p63/ZRu/tfaDIBawEwUx6vE0WEpxsqbsFjMY1Prg
	hAUMdyW9qSoVA0q0XYePoQZ3A8igSVgPfqOz4zle51bjeoyR7gvwiM2XJoWBrvUT
	wHS8XRtE+FwnweUcXGU6FSwxPL+Y2/tzs+n0Di32qMbBH8BcKdQdkwJHtM88CVxx
	6oIW88BIuINX7f9L7STw1BjO6eGJ4KpC9yhvNV9ay5r97i+zROQIPu0a1gOMhH9O
	TMa291/2Xp2gD7UUHQx/TPIBQfPCyYe40tc7HnY/GceFLzfgUCYzFZA9hkWitIe4
	SUCgIQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqn63p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:10:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1252482a91.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809450; x=1795414250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
        b=Pg4ocbBfgHsQpnJrUYCQ9dNO+rkbUb8EYQBGaux1/iOBGMFH27qDHLWVquvfuK2LOY
         F90imcjdefXf6QJ6WLQ3jKI2pg+SZnXH//gz+4DjBd4ps/DdsSTj5lHZMER4BbQJgoJ0
         apcHTAke4qsNFWlNIh/xWyrS1WfVjAO1MbnbxCvcROTHRdWx95weTr8T00SjZUi775c/
         Kbzb08vMTjGNCmhwBwLpMUQVeYulypMpLlaxiTaOo9uCx/p4SGLJQty0vqtz8HX4+SHN
         432nsiJyjCGD3Wo9SBD5rarEniK4sy2iqtoMedI10c15Sk7wnxTjHE6xmlyEwyVH4MOv
         jFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809450; x=1795414250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
        b=iQjCr4BIifARE1YxMhK3jKp59u/w4JAFjIkEO0YoFbvYYwCzlBx7w/v7zsnthyS1ec
         FcdMwS40OpdI72HQ/I+odLP5SpJid8NxEbQsGldDXkp0Wuh8Ze/zVC7kOYmBJw7C4IlF
         BT4KaFl5n6iALj0UIzwYe0SG4dOuFg2qi8qZp9j+2s6tqexRZ9/pnv+UGcJ+ta2+Jk66
         G9Pc33eoz45Hz5eGevou9+iTIv2o4A+UfZEfZH7q2U8OsHaVKDNKNEql/oJE9pBEVrCR
         KZIo0tdnH13J88GF6449jjTAc86OK/SVIU9P9LvzhLxIggLING/AO18YA81ya2Kk9yY+
         6eYQ==
X-Forwarded-Encrypted: i=1; AL+hErE5RwOJxmIsxg7cqSiYpsdV5MQ/SDtCWvPu+l4DABmfk+HJJiec3KplzyoSeppvInM3+joK6kT//OTX@vger.kernel.org
X-Gm-Message-State: APuU4Z+XPotHrpK8iiymLwHq1dEZbX+TNd8WALElF2A0HQSr/ptUGGkj
	+ipczoqhkVq59lvkkyLgtVNNA6/Zq9Ja0n4+Eon15GraBIPbeUo5dBZFhfquo27Zk07hLv1X7Hd
	pDi1luM6/BD/wwozVut8iJYQGpnsmmOJdw/NZ1SO/XFq4/XrD5SqmXX9sb7rsJAlY
X-Gm-Gg: AZFdTZdiBKy9XRFaXcu5VDF8hUKBDRolbJNOxE19eG9ub+GD3bIUVIqsPUS8bi/eDpU
	tNxf5gLl01sCZ1kgYspoLOMgce9HnmhA+OTb6uio5DPCpHtrgWWK1hqhXqHjQ4jpDr0GfP8gdom
	oCEu0fj3z3SmcaFSuxCJ8kX+Z2QJv6VHBLNwJ/zNPBHa+pylcIcUNrYxRhuuftsyUw5q2CmumpX
	JyHmauWts8lDaJCRtmOnF5vqNWWrYqRXmavjeH5G1r5rOs6Qg01KL9bFf2cTsmzqDraKzr45TXD
	klJd8zhzLlUcC8rZo1Ae1Dm5cTB6n2SmFiILtnssbCx3DSUdR5ikmlzFRjyJx/DWHV4ZE3RH0Sj
	EHF+XF+im4sdkP2Xr0f6Xk+rVpjEMNlXIGKIiVIPhMKvqOFGvc7arHulCVqE7ShrrB5LaUj9J+K
	o+3w==
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr8961211a91.44.1794809449709;
        Sun, 15 Nov 2026 22:10:49 -0800 (PST)
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr8961191a91.44.1794809449195;
        Sun, 15 Nov 2026 22:10:49 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27cf1sm21087463a91.12.2026.11.15.22.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:10:48 -0800 (PST)
Message-ID: <bbf095b6-83c5-4d77-8837-873e29d093d0@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:40:45 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-3-4549cab1c8e4@oss.qualcomm.com>
 <sashiko-outbox-209409@kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-209409@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa9e6b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m2CrskostU30fZ5MlgQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX+ZfeEJzkzYH6
 UmOMojjACKQv0lyO/ctICQW25GNPL9QbLRrQr2kkU1EzRTE5VXTfBqWWgPqUss3v4GQhBSY6ftd
 jT6NmxByZXWquDRNLOFuUI5JQ7q/txg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX1ydEQ7abpvPO
 l7ARptVQDlp52gopk7hvNGQGaYBQksBaHgFF8Wvn6NBHglIA52Sr4eQuvKNaxhl2fsX6xUOoca5
 Fqy6AO97D5ZYf257+6M2wSgJcCcQGCtYtCDZ7LgB7IQePfjkzuLsbjomKMQkCtlccdRxfmJ1p+h
 NgH+/NybmUYNvHDzmbz2WBLlaPAX48C3NfKyPwAlf+S/3RMLS8GcabEqiLHhC8Hs1viGqe6tuCf
 JEUx13DtZLA0u4JCYL0yPyMa0M1N/9jc4NIA39nKkGFfLSBPDJNA4T1TSe10LeUbmBK+0pUAdPQ
 MTKE41wIyvg/I9JgWCg0qj7Tcvi4IdLhirwNkkbHIybJ66RTk1WmH+FY68rlupjxcRNVsKzA8PB
 tpil1rfl0XehWPS1qplx5SZ0RS9Ro1eQtT/Ep7EmG7uSQQskVy4qwD+Fqv8cfTI/72GQNLsUJXF
 osShhCOCDYB7Y/ea+UQ==
X-Proofpoint-GUID: uuN3wX8jl9i99GgWaXYgVRCQO7jg22eE
X-Proofpoint-ORIG-GUID: uuN3wX8jl9i99GgWaXYgVRCQO7jg22eE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

On 11/11/2026 10:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] regulator: pm8008: wrong hpm_min_load_uA for PM8010 L1/L2 in
>   pm8010_reg_data
> --
> 
> commit e894320c5a690e879a2556e289265d1ae5f7176f
> Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> regulator: pm8008: Add mode voting support for PM8010
> 
> This commit adds set_mode, get_mode, and get_optimum_mode support for
> PM8010 LDO1 and LDO2 in the pm8008 regulator driver.
> 
>> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
>> index 0ea4ac016dc22..395d5582f6af0 100644
>> --- a/drivers/regulator/qcom-pm8008-regulator.c
>> +++ b/drivers/regulator/qcom-pm8008-regulator.c
> 
> [ ... ]
> 
>> @@ -84,9 +97,10 @@ static const struct pm8008_regulator_data pm8008_reg_data[] = {
>>  	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
>>  };
>>  
>> +/* LPM setting is supported for only N-type LDOs of PM8010 (L1 and L2) */
>>  static const struct pm8008_regulator_data pm8010_reg_data[] = {
>> -	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
>> -	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
>> +	PM8010_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges, 100000),
>> +	PM8010_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges, 100000),
> 
> [Severity: Medium]
> Should hpm_min_load_uA for ldo1 and ldo2 in pm8010_reg_data be 30000
> instead of 100000?
> 
> In drivers/regulator/qcom-rpmh-regulator.c, pm8010_vreg_data defines the
> same PM8010 LDO1 and LDO2 regulators using pmic5_nldo502, which sets
> hpm_min_load_uA to 30000 (30 mA):

It's possible there was an issue with the HW document I checked
in this case. I'll update this value to 30000 as it's known
to be working.

Thanks,
Jishnu

> 
> drivers/regulator/qcom-rpmh-regulator.c:pmic5_nldo502 {
>     ...
> 	.hpm_min_load_uA = 30000,
> 	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>     ...
> }
> 
> With hpm_min_load_uA set to 100000, pm8010_regulator_get_optimum_mode()
> keeps LDO1 and LDO2 in REGULATOR_MODE_IDLE (LDO_MODE_LPM) when consumers
> request loads between 30000 uA and 99999 uA via regulator_set_load(),
> which can cause output droop or brownout under moderate loads.
> 

