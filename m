Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0E261B8A
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999326; cv=none; b=io5JRs7a6Zo3q5cUU1TkN2lHFE8mxu7MxSZgqVSGcXpNYOL4z+5O29bJJFXlNKoXVdUwkO2VYynAtVUFniyraTC9SFtgCpZAdj0r4rGto81SmZg9K1mWJtejMlm6E/NIL5NQJMK+8kBeJ3gGcx1+PNUzICAzVfeAT0Czq8S0aSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999326; c=relaxed/simple;
	bh=E1/9DIDIMVTroh6AZSTdy0KhiA6AI5YzqTm9giWRgZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frIXifnNrwUjGlbTl4JPmNWEPI8DdfWureHsj0PU0nKsLVJDYj0Z6+CUoe/i+wcussBVLvM9f3AocFtLPGNoN0CkIzoFE2W90JelAMj8WF7Fs7f34EgPyOR10+5S8kfmjnGqrI9dsQw7+GQTdeRG+YOUSMhHsq588RpNoWlm+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4VR7ffB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMsWFrj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4VR7ffB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMsWFrj3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0XOi527915
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 13:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=; b=X4VR7ffBpKxKPjAV
	GAgRko8DSXI4y62ewp/0IhUfj/Yvv6lsC8NLfTDi8rf7PAqyoUnqgtL8IpQpbGF5
	heHLgxa7V37vo+/RfGsoF+choyY4DWvUK3evZ+KSO3pLOvyziTpRiMAuvcLzA7/x
	X02PzURiKbChtswGdXkxMJnmOx0qE0rY5AVxklDJQmVdFGbrEmdPw4U11URLWkB0
	+gk5utfZanMaK9xEcxoyPJYbAF0HbV44bbL6v9ViZrJ9FJTOC+WbR7nQ1o8SVbSl
	tMqreavqMJq55igFmCbwuAvkYfEY6oMo0ifFAyRyXCP1LKtniX7nM/Uc0vOAE63/
	BdY1XQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9y5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:35:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91ed0e140c5so383969085a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782999324; x=1783604124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=;
        b=EMsWFrj3i0JcZ0hs3z+3/zxo0co42g5COc1dGKSdR7YGuJicZ7iWEb6v1nwJBDAibI
         P+W+HLEEsxoBDUSx6Wmw6zOGJdcLzhYEgH+HFLUJyvH+amR10hF7Y13awXk8a8+y8Y2Q
         venSReUDCG04u5f9q+Cxek+9Uh6ckt13Kt+cjByYjCcO9LEW1xb8g5l3SGHRR07IqgQV
         xHKO/5myr5d3zN6QEb3nBNsbIqIJbGqV7G+CrGlDnyqGJkof2e+x1rLHMy+CdpWZNs0V
         9rrqWRdXBxTthwrKz/D4Bao1z99x4RLZpc+Rib8DuYs0lUaRbCspRKI+39hKgUj9NR5K
         p9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999324; x=1783604124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=;
        b=JV7kIRCvZJq/QiiaHw8PpygClNRxWmuYca4eQH6DoDFUg8t1/Ok/f0WP9w0LWOMGP7
         qN9nn7MUyZWujgltdjuRVxKfJ4JU6/xeWLLb6k/U2ba1iE1cGv2iWNcfT/smAafAhT7+
         RIndDaGbh21dlpy7eI76L9xTvDAHplkjkZz9bDIs4ongNz4bDSOM6Yg7GoCqz+Liuhk0
         UW5YC4UBp1qtCS9/Dw8mdjh+RvfqAb5sGpxlyLJrjRyjCMxtkMjcwTmyZkvCo/kRBdEQ
         63nV8NBJgrIInCBCDqgERcoLbY4uqljOdae1zCHwO3b38s1kRNc9RU2/24EpnOAAEF6a
         steg==
X-Forwarded-Encrypted: i=1; AFNElJ/a/iu627eVoXNuZh/FTILknvDUWDUeZ0JW02Acy6/eL+7BoqX2pigze2I3nJ9v/sQZWojq0OLAlH2o@vger.kernel.org
X-Gm-Message-State: AOJu0YwhoIairH8nTZEU2Lkd6ADyziVLDYQsMV/87ni4ebQQruZg/kcu
	k7IbDWGrnDTC+V1pWyK25lrsKbcQywYEFr87IWRv+fbgIPRPC/Ng/14PKy9Y24eZFYlwrUhnuYU
	vY0wKY3fgAXIdlJRoXcave/iflZWOyDOH+K/mjeJ432/Z34dIvQdJQ649UfRdEfvv
X-Gm-Gg: AfdE7cke+mjLssSdChctmExD4HPr2zAa3UCIGs7ue7Nfy6WcpDAxylt/fo6ys4CbcgO
	XLM/NH4GoCYUy2A6GmjIU06FkTWyYiMCd8iim+B3AjMfNUfCANTEH9uR1fl9jH8DJSqixJ/hSsK
	0kpeFtkb9B89jEWxBrq1l4qowLQn7khn3n938XI12uehmxk428oMElP32SugfFT1T4rivVPYu4T
	hwjrnUWQhAOwHmH0SqLHX5dA1ImFJIc4X5Bc5WF/ev8QhpB108ZBp6g0qGuecIAkA371r8wp16E
	dpuAvt/T1V98R9YrPF+NfO9MBM9UZY8ZjHOjs8CV11U0W9Rdxl7RvfMytIITL+LYRpr3DPgs2I1
	Hc/QVnujlrahLlFedIkxApFDLPc2Z/UGnX56BhVmwvSIBLfQebNROvkxghJhgx2WmDNyqf1Q1Jw
	==
X-Received: by 2002:a05:620a:2a12:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-92e782408a0mr785675685a.19.1782999323814;
        Thu, 02 Jul 2026 06:35:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-92e782408a0mr785670185a.19.1782999323377;
        Thu, 02 Jul 2026 06:35:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c635c41dsm95373005e9.5.2026.07.02.06.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 06:35:22 -0700 (PDT)
Message-ID: <2b51d68d-9f13-4b21-a0cd-32b78ceb5755@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:35:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
 <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0MiBTYWx0ZWRfXzbQ8Qdljco9S
 /iz2yBmRCaREEIf0tMA/J0vBkNZRWZWmNk+iAejRLi0aBhmSRhoXyNr0032XsurU1BiviRuOFO9
 i7W3tixeriRQXQR5Ep1/B7ElZXafmpt9Rr+lnoxMSeQPJgcpkVG/VTMnwqGKGE30JAAzLL8QDrm
 uw04fg0tBA+74IZ00I5A25N+NwOtygs0b4nVAgDcdnGKzos35DIkLdRu9kEDX+9NIHTFpF4m1Dd
 BWr7aJQ8NEFbb3ZV2+spOGBGMXnikRTmWfYkLxTrhgTQjODi5sBIPvoazeM+I2iu3lZFNw+vumi
 odZ6cTNK2kKE4KE9BZynxPpOeCAnwxVxDopJjHjJlGfaNQwi9Afzx0BkUrsill2eO1IDJ5WLg/M
 KvGH7lVuhnQ2TgHvYGwN9GBF5ul3sHlYz9l6Rfp4e471hBaMQJxnDy5G4S5SqhTXbBoTpWNgkDj
 /QvWGrHrPNhMw5CUW3Q==
X-Proofpoint-ORIG-GUID: 62xIcHijUy9B08RPMpyr6ZNK474SUYLQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0MiBTYWx0ZWRfX+5zUdsnN/J4e
 waTsPr/TjAy9tWQwvfYEdhX+s2Wupe9OiOAZVyP/24k9SPLOn8PcilPlANd/eG8EJvHlaKLwdYY
 3RQll9gH82MnyNFch/+gSq74ZCd4Hbw=
X-Proofpoint-GUID: 62xIcHijUy9B08RPMpyr6ZNK474SUYLQ
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46691c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3fF9mxJG-zv1VSP5w2IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020142

On 7/2/26 14:17, Konrad Dybcio wrote:
> On 7/1/26 12:37 PM, Daniel Lezcano wrote:
>> The Lenovo ThinkPad T14s embedded controller exposes several platform
>> temperature sensors that are already used by the firmware for thermal
>> management.
>>
>> Expose the EC as a thermal sensor provider and describe the keyboard
>> skin and charging circuitry sensors as thermal zones in the device
>> tree.
> 
> [...]
> 
>> +&thermal_zones {
>> +	ec-keyboard-thermal {
>> +		polling-delay = <5000>;
>> +		polling-delay-passive = <1000>;
>> +
>> +		thermal-sensors = <&ec 1>;
> 
> Do you think it'd be worth to add dt-bindings defines to avoid raw
> numbers here?

No it is not worth. Usually we put raw numbers and they are untouched.

> [...]
> 
>> +		cooling-maps {
>> +			map0 {
>> +				trip = <&ec_charging_psv0>;
>> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +			};
>> +		};
>> +
>> +	};
> 
> Stray \n above
> 
> Otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for your review
