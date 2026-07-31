Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E596D3546FC
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479129; cv=none; b=k3ofXfJXsypSBaZzDcOLNRAH00CgNGaWLcu1CHy4rappPVar+vhbVMNC4koizhtgIP3Uw6COaKCgZme+1rp0/UQHj1mxBwFXeYllq/f8FveX57w/rqQewhWxGJy/T+d2tsdPys1Yed+o4g/EEsrX7Q9x8pzN2uSPkEJwSR8WmFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479129; c=relaxed/simple;
	bh=G40H8QQHfAHAJaisLzUUvo4a5Zx0ASqBCxVychTBOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAsxlQQYa8g2qL4W6Vsy/gEz+Z4LJQijHfwR3qXREC4Uv4WmbUuX0IArjEpEJLvSHJA0WZysQEfvy9Buq49TQHWnF5Yn6zzKt4w5fprPvACCILPUlJ+/ZUTyDko2XK0PdL5tdy1RasfNY5nhn0G5ZSj2R1TvZwx2DZq7A4LNnmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/68/Lq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PW6kKFY1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/68/Lq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PW6kKFY1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4urK43277913
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POuVEWnyuiz3uY4rm2V7x5tcHzK6GruQsBn9X4SISsQ=; b=N/68/Lq+OXLYX+t9
	girjcHCqRc0iq5Tr/m5VddMQ9//Q+KJaemJfSLV7CkP8JO7otIq1vyrRFc0Zj5GV
	0IxFlWn7MBkTjQ19legTPKtyxeM/rLCVez9CehYXiHb3tiB/iAeScDQUFmKxUZVf
	LkeKO3N7Zer4kdQNHgDsYUywnPe8GrUqybB1LWMAatGJ6ljVEwLi2NDlGsQowNH+
	NzSToYkD3L/wxyab+NZxMr+fW44ISIBqS3JetNBz7p5j3gPk+lFHPISbPNUFstpi
	FDCQcTzWK6DCHhb+bBkoCx1a50HiUSdXTup4+alAkGk4g+5TvdQDGWaVyZl8vGu/
	KuJ7Gw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0f8ac3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:25:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so1351204b3a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785479125; x=1786083925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POuVEWnyuiz3uY4rm2V7x5tcHzK6GruQsBn9X4SISsQ=;
        b=PW6kKFY1eRWhV/fGERqd/eFSCmPkNpfbPxRkPb0sYeQCeFVJo3H5UQvJlO5DXXtArR
         SndkXQoKROvLlnU9yYo6rJorvTwCp8p6mRCDJr3flGSN+JbZewXMQZ/covIMxr/EMVaX
         Ahaj5SzfkYmyjHA9hUn8McV/A5Hr8sVFliK7XtJoB5cnxzsysGA7UQNFAAfEog+CM4mJ
         K1zCWSb6ssxqU/cmov+gdACnTbAKJYSGxQsD+Xln0NKDB6jyiUZ+Hg7v9FZq+JXGQNS4
         SAMHuUkqH+6N2A3wvzhcf3Y/ucT+ak5OzmVpTQ9I1XyrRyY11QFRBtl/Y2t6guTkxi72
         arUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479125; x=1786083925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POuVEWnyuiz3uY4rm2V7x5tcHzK6GruQsBn9X4SISsQ=;
        b=WDQkvxIzanHRx6rUfo1n3wdV4aoLIN+9YKOEdjUTWm8It6Rz9qhTIfm88DDHyWfUAo
         KLc9r1hYiVOjhbcCmduUeYocT8AmVGrdGbyPZl/Vp/xlVR1hlHbzP8li6x/42afBJM6m
         jwZw/eHQchOI8PblFsfGeEOzTS92nh8NdoI4vExzFjtWwENK7mQJlVnn5exlDYsiu94T
         GkfkQNye0GzDDM+nw9EtcfvsFyEAAiWuFj3qv3Rh9bEddrwdNun83hTxo3TLRizsOvbM
         9gCZx2qfhlk4Whe4dLJTNJ4mpDXvlCX5JWuXmiXvD6YK+r69Lw4sH89vjlV1YEHMRqQ/
         yG7A==
X-Forwarded-Encrypted: i=1; AHgh+RoNXDdWjxGbmqFqDz/31jllpkGo25721lXJbI/h/KktkwwueHz55UPNswRlvDhep9V47dynH0jYJ/Yd@vger.kernel.org
X-Gm-Message-State: AOJu0YySGgydWHvGOKJtTExXoNpLdghPwB/1aqZIILeronfrAosAZ2R2
	krrMNibVvcA/8Bf3BdvjprYNVIACxZoGrqbgXhREjLYLWuaKaxpT3tmm5fpyDS7zR+s7pEOUxDT
	IeNOB3GycjnDlnx18mmJyyy9Vm3qN7uiyecdgu4RDYWvVafk9BS1S+Q8ao4JSL7GB
X-Gm-Gg: AR+sD1017fvqXmPAWEc2DmnvGMwU9qf6HS1nwc0rb9REmKfQVWhlkDCDynFrjCRY6u0
	jpzGcjgkQhCC+jjoyf7SkYMjoxDKBMy+KWea2NIgspqml16/S+Z8mFLHtUn77BynW+U1NpzPhNv
	FYhmzP1e2DNSAMunLI7u+yhFiC1KN6z6U2jDpQ+HGThUKHog8Cwsy0NmAQKUbqkVBL9tkXmkyzi
	icV+i8MWq4e1/qhSvtkW+sAF+NmnOwCqnK04L99JAxKpsVktuzyOJ2oDpLPqwD/118RYLc5iLpV
	Nte5Cp21Q5P+G2OpoN8a5s/PEmVdMQ7gnRywhG1nP7+KmWdrYK7nkXlLksCQ18gJVt5TlPLjdbj
	LCP9M9Lx3MS+B1tp3UpnXIbVfttmeWKM8Ndl1oaUvwSVC2cPBNJGDa27+3GzAC7oh7z9PpebNz3
	qwN72waYvoV+kN
X-Received: by 2002:a05:6a00:1256:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-84ed6bfcff5mr639592b3a.6.1785479125563;
        Thu, 30 Jul 2026 23:25:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1256:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-84ed6bfcff5mr639566b3a.6.1785479125070;
        Thu, 30 Jul 2026 23:25:25 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5e30981sm338042b3a.57.2026.07.30.23.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:25:24 -0700 (PDT)
Message-ID: <46f53628-ea22-42e5-8de5-a2a76b6360a8@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:55:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
 <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
 <3fa15948-eb8b-4f3e-af90-5b88fcc44d75@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <3fa15948-eb8b-4f3e-af90-5b88fcc44d75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MiBTYWx0ZWRfX9LEXrE7qb2Sk
 MzOr49ITWfKWD96cwJeLRhsRQ5SIwECG6SelaxVGwxmbu2mWOef9tyyO8PwzBT4Hy1g85U7VYq/
 pJ8wTn8r3zGtn2IJMQHfXBKDzp6OTbo=
X-Authority-Analysis: v=2.4 cv=HJTz0Itv c=1 sm=1 tr=0 ts=6a6c3fd6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=kfAM7XMfZeusFuJwEhoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: QtO9YpjwWJF_Xeiinf8fvp1vJfKF0XL0
X-Proofpoint-GUID: QtO9YpjwWJF_Xeiinf8fvp1vJfKF0XL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MiBTYWx0ZWRfX6rdOzJ5wQc8S
 Dw34DJbKpCdWbPhUebhnmghy70OVK5AR28/OZP+rhTuV4awMhlpJuoPjwzZFadE0P+a9e6S3muE
 k52YSbqSG8YkN33zfvk3A3YVd5VJWF3wA4UZ3RS72WS0fScSnjMtW8fLvBMG4NbSG448YP3/3Tm
 qUeVBm77C3TnKD6Eivc8MKZPXhbePrQRDi2ItLEV0lSduCat+MxyO2ZoxVlRodu8hMufM9o09Qs
 X3pFSXvNsM4qnRaKkWCtvoW5nKT/j+7UJ+MRYQ7ckle23lv1W5q9y0oW+WKg3KtwLc2oj4sGZ46
 STxIftLP7Vh5b976WaqBpl7KkGqR2hfjfv6bKLLAhBBVlcgxgzDX7c8j2x+myfPxTeO8RD+YMPF
 WEqvPsGgagg9pTO67bjFGQNmSj3mKjqnD99/1nery5bvVULrNpfqdysKxdmGSLnf1CU0Dp9dNIx
 +X+owm5PBUwxAH76mPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310042



On 7/30/2026 10:38 PM, Konrad Dybcio wrote:
> On 7/30/26 8:35 AM, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>> Add the EC command definitions and handler functions for querying fan
>>>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>>>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>>>> transport for the two commands, since their variable-length,
>>>> sub-command-addressed payloads don't fit the smbus block-data model
>>>> used by the existing commands.
>>>>
>>>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>>>> them in per-compatible qcom_ec_lut_config data selected via
>>>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>>>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>>>> geometry but are bring-up platforms without a calibrated fan curve,
>>>> so skip_lut_set suppresses the LUT-set command on those boards.
> 
> [...]
> 
>>>> Since the LUT values depend on each fan's maximum RPM, which varies
>>>> per board assembly, calibrate it at runtime: drive the fan to full
>>>> PWM, wait for it to spin up, and read back the achieved RPM via the
>>>> new query command. Run calibration in a work item at probe time and
>>>> after EC reset recovery, and make it abortable via a completion so
>>>> suspend can cut it short. Track calibration completion state so the
>>>> LUT is programmed once calibration finishes and again on every
>>>> subsequent power-supply-driven profile switch.
>>>
>>> I don't want my laptop to become a jetplane on every bootup. I
>>> doubt anyone does.
>>>
>>> Konrad
>>
>> There's no EC command that reports a fan's max/rated RPM directly — the
>> only way to learn it is to drive the fan to full PWM and read back what
>> it actually spins up to, which is what calibration does. It's bounded to
>> a 10s timeout per fan and only runs once at probe (and again after EC
>> reset recovery).
> 
> 1. please fix the firmware so new designs will have that
> 2a. if we're storing a LUT already, can't we store the max RPM too?
> 2b. if we don't know fan RPM, we can still expose a PWM hwmon
> 
> Konrad


1. Agreed, will raise this with the EC firmware team for new designs.

2a. The EC's LUT storage isn't persistent across reboots, so we'd need
to cache max_rpm on the driver side instead to skip recalibration.
Initial probe after a fresh boot would still need one calibration pass
either way.

2b. cur_state already reports RPM-derived state via the cooling-device
ABI. Is it worth also adding PWM hwmon on top of that?

-- 
Best Regards,
Anvesh

