Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865225;
	b=IMvr4ccNzrKCx35mgV9lUx+Tcqu8X7NtnM31fDGyt1QsOhFS49OjPSEYmbcM2TV9dUHl
	 ruChqCDGhZpeeheAC4Kcng7hMIa3wPqTvSSLYClJDOEzVBz4Kfv8VVXWm2Sgssq9ZWoil
	 5Ty8FuIBySy//1rLnhdJhz5T97lKWZiT9t8AzkMHgwM4LAla816+t65qsQriRzi7lQTxw
	 3VPbjNub4lITNiU3DQY3BF3CYR2ypuCr0a0RDuFyY3NR9VZKszGHEtMukF1KQf03kBE27
	 79FHx7GiKOznLYsxcYO0Kbk7R9e42xfVrh/5jlnCLRbl7PkwSVVOX7SSNtTBBeu4tqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865225;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0JvW8IF6COnoHXfD/gXX4jw2XsooyjMWzCMm0HDO8VQ=;
	b=TkvNxuTjD/EiLI1SRePtu8LNmCwst6P6vJPCYw798M+ZK1igzwy8jLw2B7C/AIVRLQZM
	 8Ku4k8O8v61Q5/cZHMrC5QDNZzHHrO9PWOW/ae1dMswgtm7Tt3+pk8IqdDnLj1GFGFgl5
	 C6XGuK0/p2Xyikx9fQu8Xwtc2JlMOC9w1f5dwmfDMcP8vo88zCc9haT12KbbVbnjLVD1R
	 fhrVOAq6Hdcg22n270TNf7GIuccOfEZaasVdN3x3VSHlxh/Gw8oTNMI92D5g+1hmgeAnN
	 Q/s/AllH5LkvnyL3S9HolgGFwcM5V4nYvEmCPMbnwVa9v5egZ5E/ci9LO/JXISOqEvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HAU8m6aX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9KXO2Sy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7F606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 07:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D7F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HAU8m6aX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9KXO2Sy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UPMP1018262
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 07:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JvW8IF6COnoHXfD/gXX4jw2XsooyjMWzCMm0HDO8VQ=; b=HAU8m6aXJPpAcPtZ
	qKIDkHCtzE+nEw+FZk1rvPH0jxb09vavO0jeqgmuxTRc4EKzrBcfSf7XkQs04VMu
	QLanCBXJYWCB6zxt8d2PV5N7JLQrBelK+2vCFdC3jUzUcM07ozPnQQpOEDnY2i7c
	yNT1J7j8ODB97GNlFvM5ZQOFX2QiHzFIHy0RJsg4yd9QPwBDGyIvQe9QUljvG2xN
	Nj+sg2yIZNXjWJ3kefC7lSsGUSrOb9houpYh03xREhAhXb0V4/OhxPxPTzDwEiOJ
	4V+XavhuCAS4pwKz3XPoxtsY255TzFePRk3LKHHGD26xnB0UQp2LkHSBEL0reawe
	3BWX0g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnkwa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:53:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b09b223c70so982248a91.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 23:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865223; x=1794470023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JvW8IF6COnoHXfD/gXX4jw2XsooyjMWzCMm0HDO8VQ=;
        b=C9KXO2Sy7c5MyThlVv0/uJRH2V5bFRDxyuNOEgfznyMSuO112VuW5z2tbkcgNZwPYZ
         VhFL3UUkVdGKVicNdajC3EBQfyEwBE35OBGrBJnStBvDk035C1V8MVG8FvsJvf+7EYju
         3Y4zsoCW3To2UV43ainna5nOO/dQgKvabqPwA5DbUMFaRcZYY5tmzfQaF18jhbxyhDyy
         l9Ce38n8RLV4t7fG65HLuMye9VhYdEYSmUBa/gn0sFjwRGm4PgJSFlhH++n4xv4F6/3x
         kZ9PWs3FVh7y+T0ufZheE+fS+QpMH463M2aDSCzEmz84/OFbTG77SxxO7vZhJiZeFcR6
         xPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865223; x=1794470023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JvW8IF6COnoHXfD/gXX4jw2XsooyjMWzCMm0HDO8VQ=;
        b=Td7wT5ZK6KlfZzBnCigwsKX3q6Zbfi3dR8tckaKgiPC1AcpenDiHXEjThaLzYWFmbv
         viG7Eej9bzYdnktE+4G0vC6sVF+YyPkzoM4jnpujf0fTJTSelsssHZrE/g9sXPV0NnEf
         VuduO/q2fHLXngNrwgyQcqUnd30r67NlDqGpj+MRf7sBaW7vwZZD8FgLr0uY2uEM0gbW
         ++EIG16xMIoznbKESKQH5h/6wDLjc8FyjwRU8Eickjh7Z9Iiy+zAIkXF4loIIeVf3bRH
         fiu8sYfK+HCmeVoNjjk/pWQMPjWjNEHvevVTSueRFrx24b17As6L99tijD51W0XB1soj
         wSYA==
X-Gm-Message-State: APuU4Z9ytAyaxdJMb1suB4WMFMrpkSUjaBVSCPM8kWofL2F9c2lDP6Le
	sZixPFyxrEkb3Q8qLuC/xedyz4T69YA9grDdWW21L6307lUaxuaYX33d5qQ/tL5wPvnzhWS+qA0
	xEjOg2U44TKYTrM8ApMvSRlTTZpTv6T3TyfSrZaBqk0eqaVox9s9nTJ56g7zqF6LV
X-Gm-Gg: AYBFou2aJuHFRQ1r7lDATz28CQoOwjdLAaNLjbwvVv/DUvsMyV+F44OLzR7iRPKGCpP
	ELok1lRdF6JlYASP1g3ISrrb7Ry4wcY9LJXJyXgB+SMeqynyZLHd2PAa4r0t6G7gm5a0pi87DPB
	kPDfyVV7RY6dZHWbtCB1BwHDs6n/4/huxZnnBr9llDzBtkLyS6/lc024XKMrbxprmg86FJqJ5bX
	koslEAQIp2gogCEWc6QMhl4Hcf9CCQfhBigRSo7P12W3UwBShDMqU369JICEBWs0sRyNYFIaQs6
	MQeJJubfGBc1eVQj1Npzukb61ceHIyxRe6JFYCnFzTnKNKdQI87a8f44G5mr28n1XbeNt6hdwxB
	ruS2Os43SDyck5xx6Sk3sZNxpNRD4kSTHniVMMnT3KplIOxuYwufm/NymQWNONA07gMwQ7JmP/b
	YXtQ==
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr15111292a91.29.1793865222688;
        Wed, 04 Nov 2026 23:53:42 -0800 (PST)
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr15111272a91.29.1793865222024;
        Wed, 04 Nov 2026 23:53:42 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46443d6esm1892088a12.2.2026.11.04.23.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:53:41 -0800 (PST)
Message-ID: <343e9ddb-3233-432c-998e-c60310403de9@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:23:37 +0530
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
Subject: Re: [PATCH v2 2/6] thermal: add hardware-binning trip-point filtering
 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
 <20261031-thermal_bin-v2-2-d76fd073ae98@oss.qualcomm.com>
 <sashiko-outbox-191983@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-191983@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfX1Wtx0iOsU1iA
 jnuP9v8YXybwtijKucFOZBON82i+Vd7QhTupwYRRSGd4vjyRS6PXkWxUHxDUbbhHSl2jPir1A76
 MUe+qKYrGB66niCw8cE5zOLKQYshl0c4M/Siu8kZt+md4gu+6aLF0DVliGeEJih6hnKcpZtcdc7
 RlJsV7WZU4Vv0uqoFskKjcwX2cy3C+VxYcqL0BI2J2WWzM2lvJSIoMfmj64EXNdrd/eZTiuVZw8
 8Vf02ThsHlWS0WSmit7TYwcG81dStPte5dcQXqIkzwjtDB99dDuuEuntDDnNUUkfGa5OoQRM7Oq
 eaimC5U9AzWbH/rfhNSGYYaVPZbST22wy0uKt9gCVML8TXukry2ehhT9GtoXGvdvJtslJUbo6oc
 DDEDbkAmeM4Mcj0fKVPvM/AawcmmUrcGRCNYAiq3t2Bfm7CVnkyUk4yKbwxfJOc0I4pJh6UXmOv
 K+tSxfF1XYklHpMbP1Q==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec3607 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vQfh6QIPCeOzBlGDQxcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: e8ebTLh3TeV4Zbn4vO8va8bkDBPM9sX0
X-Proofpoint-GUID: e8ebTLh3TeV4Zbn4vO8va8bkDBPM9sX0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfX8jvaGKVGIvX0
 wJccJiJ18G3TJxrQjxr6TLbJKTh8VTAO6UEdtrGo2plaIDe1e1WbgyI+oQeM9cYdPJONQQVG/zd
 v/KUU1fioPKZaixJYkKgCy5x0vfXP/U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050031



On 10/31/2026 7:10 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] thermal: -ENODEV collision in thermal_of_trips_init() masks bad trip types
> - [Low] thermal: redundant hw-bin matching and dead code in trip temperature parser
> - [Low] thermal: duplicated devres logic in devm_thermal_of_zone_register_with_bin()
> --

I will fix the -ENODEV collision by returning -EINVAL for invalid trip
types, so -ENODEV is only used for intentionally skipped hw-bin trips.
The duplicate hw-bin matching is intentional, the first check filters
unsupported trips, while the second selects the matching temperature-bin
entry. The devres comment looks like a cleanup/refactoring suggestion
rather than fix.

> 
> commit 88b6a2a4f7fe7c6179c38cf14f96ebaa3d58c33a
> Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> 
> thermal: add hardware-binning trip-point filtering support
> 
> This commit adds Device Tree parsing support for the thermal-hw-bin and
> temperature-bin properties to filter trip points and select per-bin trip
> temperatures based on SoC hardware version information. It also introduces
> devm_thermal_of_zone_register_with_bin() so platform sensor drivers can pass
> decoded fuse bitmasks during thermal zone registration.
> 
>> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
>> index fe47d74b7219e..c5ec7d2a38caf 100644
>> --- a/drivers/thermal/thermal_of.c
>> +++ b/drivers/thermal/thermal_of.c
>> @@ -60,18 +60,165 @@ static int thermal_of_get_trip_type(struct device_node *np,
>>   	return -ENODEV;
>>   }
>>   
>> +/*
>> + * thermal_of_match_hw_bin_group - test one thermal-hw-bin sub-group
>> + * @np:     device node containing the property
>> + * @hw:     hardware binning info (must be non-NULL)
>> + * @levels: number of words per sub-group, equal to hw->supported_hw_bin_count
>> + * @group:  sub-group index to test
>> + *
>> + * Returns true if every word in sub-group @group has a non-zero bitwise
>> + * AND with the corresponding hw->supported_hw_bin[] entry.  The caller is
>> + * responsible for ensuring @group < total-cells / @levels.
>> + */
>> +static bool thermal_of_match_hw_bin_group(struct device_node *np,
>> +					  const struct thermal_hw_bin_info *hw,
>> +					  unsigned int levels, unsigned int group)
>> +{
>> +	unsigned int j;
>> +	u32 val;
>> +
>> +	for (j = 0; j < levels; j++) {
>> +		if (of_property_read_u32_index(np, "thermal-hw-bin",
>> +					       group * levels + j, &val))
>> +			return false;
>> +		if (!(val & hw->supported_hw_bin[j]))
>> +			return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * thermal_of_trip_is_supported - check if a trip node is valid for this hardware
>> + * @np:  device node for the trip point
>> + * @hw:  hardware binning info (may be NULL)
>> + *
>> + * If @hw is NULL or the trip node has no thermal-hw-bin property, the trip is
>> + * considered valid for all hardware.  Otherwise, the property is read as groups
>> + * of hw->supported_hw_bin_count 32-bit masks; the trip is valid if any group
>> + * matches (bitwise AND non-zero for every word in the group).
>> + *
>> + * Return: true if the trip is valid for the running hardware, false otherwise.
>> + */
>> +static bool thermal_of_trip_is_supported(struct device_node *np,
>> +					 const struct thermal_hw_bin_info *hw)
>> +{
>> +	unsigned int levels, ngroups, i;
>> +	int count;
>> +
>> +	if (!hw)
>> +		return true;
>> +
>> +	levels = hw->supported_hw_bin_count;
>> +
>> +	count = of_property_count_u32_elems(np, "thermal-hw-bin");
>> +	if (count == -EINVAL)
>> +		return true;
>> +	if (count < 0) {
>> +		pr_warn_once("%pOF: error reading thermal-hw-bin: %d\n", np, count);
>> +		return false;
>> +	}
>> +	if (count == 0)
>> +		return true;
>> +
>> +	if (count % levels) {
>> +		pr_warn("%pOF: thermal-hw-bin length %d not a multiple of supported_hw_bin_count %u; disabling trip\n",
>> +			np, count, levels);
>> +		return false;
>> +	}
>> +
>> +	ngroups = count / levels;
>> +	for (i = 0; i < ngroups; i++)
>> +		if (thermal_of_match_hw_bin_group(np, hw, levels, i))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +/**
>> + * thermal_of_trip_read_temperature - read trip temperature, with bin support
>> + * @np:   device node for the trip point
>> + * @hw:   hardware binning info (may be NULL)
>> + * @temp: output temperature in millicelsius
>> + *
>> + * Tries the scalar 'temperature' property first.  If absent, falls back to
>> + * 'temperature-bin', selecting the entry whose corresponding thermal-hw-bin
>> + * sub-group matches the running hardware.  Returns -ENODEV if temperature-bin
>> + * is present but no sub-group matches (caller should skip this trip).
>> + *
>> + * Return: 0 on success, negative errno on failure.
>> + */
>> +static int thermal_of_trip_read_temperature(struct device_node *np,
>> +					    const struct thermal_hw_bin_info *hw,
>> +					    s32 *temp)
>> +{
>> +	unsigned int levels, ngroups, i;
>> +	int count_hw, count_temp;
>> +	s32 t;
>> +
>> +	if (!of_property_read_s32(np, "temperature", &t)) {
>> +		*temp = t;
>> +		return 0;
>> +	}
>> +
>> +	count_temp = of_property_count_elems_of_size(np, "temperature-bin",
>> +						     sizeof(u32));
>> +	if (count_temp < 0)
>> +		return -EINVAL;
>> +
>> +	if (!hw) {
>> +		u32 utmp;
>> +
>> +		pr_warn("%pOF: temperature-bin requires platform hw binning info; using first entry\n",
>> +			np);
>> +		if (of_property_read_u32_index(np, "temperature-bin", 0, &utmp))
>> +			return -EINVAL;
>> +		*temp = (s32)utmp;
>> +		return 0;
>> +	}
>> +
>> +	levels = hw->supported_hw_bin_count;
>> +	count_hw = of_property_count_u32_elems(np, "thermal-hw-bin");
>> +	if (count_hw <= 0 || count_hw % levels)
>> +		return -EINVAL;
>> +
>> +	ngroups = count_hw / levels;
>> +	if (count_temp != (int)ngroups)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < ngroups; i++) {
>> +		if (thermal_of_match_hw_bin_group(np, hw, levels, i)) {
>> +			u32 utmp;
>> +
>> +			if (of_property_read_u32_index(np, "temperature-bin",
>> +						       i, &utmp))
>> +				return -EINVAL;
>> +			*temp = (s32)utmp;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	pr_warn("%pOF: no thermal-hw-bin sub-group matched for temperature-bin\n", np);
>> +	return -ENODEV;
>> +}
>> +
>>   static int thermal_of_populate_trip(struct device_node *np,
>> -				    struct thermal_trip *trip)
>> +				    struct thermal_trip *trip,
>> +				    const struct thermal_hw_bin_info *hw)
>>   {
>>   	u32 hysteresis;
>>   	s32 temperature;
>>   	int ret;
>>   
>> -	ret = of_property_read_s32(np, "temperature", &temperature);
>> -	if (ret < 0) {
>> -		pr_err("missing temperature property\n");
>> -		return ret;
>> +	if (!thermal_of_trip_is_supported(np, hw)) {
>> +		pr_debug("%pOF: trip skipped: no thermal-hw-bin match\n", np);
>> +		return -ENODEV;
>>   	}
>> +
>> +	ret = thermal_of_trip_read_temperature(np, hw, &temperature);
> 
> [Severity: Low]
> As reported by Sashiko on v1 [1], thermal_of_populate_trip() calls
> thermal_of_trip_is_supported(np, hw) before
> thermal_of_trip_read_temperature(np, hw, &temperature) and returns -ENODEV
> immediately when thermal_of_trip_is_supported() returns false.
> 
> When hw is non-NULL and thermal-hw-bin is valid,
> thermal_of_trip_is_supported() already iterates through all ngroups
> sub-groups via thermal_of_match_hw_bin_group() and only returns true if at
> least one sub-group matches. When thermal_of_trip_read_temperature() then
> runs for a temperature-bin trip, it re-reads thermal-hw-bin and executes the
> same thermal_of_match_hw_bin_group() loop a second time, leaving the trailing
> pr_warn() and -ENODEV return in thermal_of_trip_read_temperature()
> unreachable.
> 
> In addition, having thermal_of_trip_is_supported() run first causes malformed
> DT properties to be masked:
> 
> 1. If a trip using temperature-bin has a thermal-hw-bin property whose length
>     is not a multiple of supported_hw_bin_count (count % levels != 0) or fails
>     with count < 0 (such as -ENODATA), thermal_of_trip_is_supported() returns
>     false. That causes thermal_of_populate_trip() to return -ENODEV and
>     thermal_of_trips_init() to silently skip the trip instead of reaching the
>     -EINVAL return in thermal_of_trip_read_temperature().
> 
> 2. In thermal_of_trip_is_supported(), of_property_count_u32_elems(np,
>     "thermal-hw-bin") returns -EINVAL both when the property is absent and
>     when its byte length is not a multiple of sizeof(u32). Checking for
>     count == -EINVAL (as well as count == 0) and returning true treats a
>     non-u32-aligned or empty thermal-hw-bin property as matching all hardware.
> 
> Could the thermal-hw-bin lookup and sub-group matching be consolidated into a
> single helper so each trip node is validated and matched once, and malformed
> properties return -EINVAL?
> 
>> +	if (ret)
>> +		return ret;
>>   	trip->temperature = temperature;
>>   
>>   	ret = of_property_read_u32(np, "hysteresis", &hysteresis);
>> @@ -94,7 +241,9 @@ static int thermal_of_populate_trip(struct device_node *np,
>>   	return 0;
>>   }
>>   
>> -static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *ntrips)
>> +static struct thermal_trip *thermal_of_trips_init(struct device_node *np,
>> +						  int *ntrips,
>> +						  const struct thermal_hw_bin_info *hw)
>>   {
>>   	int ret, count;
>>   
>> @@ -114,9 +263,12 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>>   
>>   	count = 0;
>>   	for_each_child_of_node_scoped(trips, trip) {
>> -		ret = thermal_of_populate_trip(trip, &tt[count++]);
>> +		ret = thermal_of_populate_trip(trip, &tt[count], hw);
>> +		if (ret == -ENODEV)
>> +			continue;
>>   		if (ret)
>>   			return ERR_PTR(ret);
>> +		count++;
>>   	}
> 
> [Severity: Medium]
> Does treating -ENODEV as a skipped trip here mask invalid trip types in the
> device tree?
> 
> Later in thermal_of_populate_trip(), thermal_of_get_trip_type() is called:
> 
> drivers/thermal/thermal_of.c:thermal_of_populate_trip() {
> 	...
> 	ret = thermal_of_get_trip_type(np, &trip->type);
> 	if (ret < 0) {
> 		pr_err("wrong trip type property\n");
> 		return ret;
> 	}
> }
> 
> When a trip node's type string does not match any entry in trip_types[],
> thermal_of_get_trip_type() returns -ENODEV. Previously,
> thermal_of_trips_init() treated that -ENODEV return as a fatal error and
> aborted thermal zone registration with ERR_PTR(-ENODEV).
> 
> Because thermal_of_trips_init() now continues on -ENODEV to skip unmatched
> hardware-bin trips, an unrecognized trip type property will also be ignored
> after partially writing tt[count].temperature and tt[count].hysteresis,
> registering the thermal zone without that trip point instead of failing
> registration. Should thermal_of_get_trip_type() return -EINVAL on an
> unrecognized type, or should hardware-bin filtering use a distinct return
> value?
> 
> [ ... ]
> 
>> @@ -510,6 +679,46 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
>>   }
>>   EXPORT_SYMBOL_GPL(devm_thermal_of_zone_register);
>>   
>> +/**
>> + * devm_thermal_of_zone_register_with_bin - register a thermal zone with hardware binning info
>> + *
>> + * Like devm_thermal_of_zone_register(), but passes @hw_bin_info to the trip-point
>> + * parser so that trips can be filtered and per-bin temperatures selected at
>> + * zone registration time.  Use this when fuse values are read before zone
>> + * registration (e.g. in a platform driver's probe function).
>> + *
>> + * @dev:         device structure pointer to sensor
>> + * @id:          the sensor identifier
>> + * @data:        private data stored in the thermal zone 'devdata' field
>> + * @ops:         ops structure associated with the sensor
>> + * @hw_bin_info: hardware binning info for trip filtering (may be NULL)
>> + */
>> +struct thermal_zone_device *
>> +devm_thermal_of_zone_register_with_bin(struct device *dev, int id, void *data,
>> +				       const struct thermal_zone_device_ops *ops,
>> +				       const struct thermal_hw_bin_info *hw_bin_info)
>> +{
>> +	struct thermal_zone_device **ptr, *tzd;
>> +
>> +	ptr = devres_alloc(devm_thermal_of_zone_release, sizeof(*ptr),
>> +			   GFP_KERNEL);
>> +	if (!ptr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	tzd = thermal_of_zone_register_with_bin(dev->of_node, id, data,
>> +						ops, hw_bin_info);
>> +	if (IS_ERR(tzd)) {
>> +		devres_free(ptr);
>> +		return tzd;
>> +	}
>> +
>> +	*ptr = tzd;
>> +	devres_add(dev, ptr);
>> +
>> +	return tzd;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_thermal_of_zone_register_with_bin);
> 
> [Severity: Low]
> This isn't a bug, but there are a few small duplication and documentation
> items worth cleaning up:
> 
> 1. devm_thermal_of_zone_register_with_bin() duplicates the devres_alloc(),
>     error handling, and devres_add() body of devm_thermal_of_zone_register().
>     Could devm_thermal_of_zone_register() simply call
>     devm_thermal_of_zone_register_with_bin(dev, sensor_id, data, ops, NULL),
>     which would also remove the need for the static thermal_of_zone_register()
>     wrapper?
> 
> 2. In the kernel-doc comment for devm_thermal_of_zone_register_with_bin(),
>     the function description is placed before the @argument list instead of
>     after it, and a Return: section is missing (which triggers a kernel-doc
>     warning under W=2 builds).
> 
> 3. Documentation/driver-api/thermal/hardware-binning.rst states that when a
>     trip uses temperature-bin without bin info:
> 
>       If a trip uses ``temperature-bin`` but no bin info has been provided for the
>       zone, the core cannot select an entry; it warns once and falls back to the
>       first ``temperature-bin`` value.
> 
>     However, thermal_of_trip_read_temperature() uses pr_warn() rather than
>     pr_warn_once(), so it warns for every trip node.
> 
> 4. In MAINTAINERS:
> 
>       F:	Documentation/driver-api/thermal/
>       +F:	Documentation/driver-api/thermal/hardware-binning.rst
> 
>     Is the new file entry needed when the directory entry right above it
>     already covers Documentation/driver-api/thermal/?
> 
> [1] https://lore.kernel.org/r/20261002-thermal_bin-v1-2-5a29be7e8ec5@oss.qualcomm.com
> 

