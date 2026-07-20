Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E979125228C
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556139; cv=none; b=LmOLiEsse9/dfm32nlvRGymT78ihqrJp1mSDFAfMyqUoApqd9/x1981O9pmek2qkK/NlSsCbypy6ZW2HeyHcernBfBsx5XmQWz6muByuYMfJdymbBiCvI8oeF+kQywOkUtmkJkqhJFLwtrU4sRJCn5VMm6CBdHKnMMRRYpUULMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556139; c=relaxed/simple;
	bh=k+xGFny4AtHUe/z+uwLMvqdlk5Vb4YYI1phGcXQdCn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5Cl+ZBzV8BGCEOiekWZYNMuMkaM23j3fxEkmnnZJ1F9yK6Oeyi/bfAYxgxEbAA+Tp2imucuwN+hfTEBOL6xoAchha7wDE/lq7Epd4vzKUUJOdM+dLhn5wikL1QgBwMJdeJkPOG7QoRe0OkQhOnQF1LO8Mftflu44pSmB9SdxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R37Rpw7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIzLxd4f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R37Rpw7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIzLxd4f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqdJj2837035
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lA/IMjFuXqZio4SG1SxOvRIX9lgOxQfU7bsItBl2BZA=; b=R37Rpw7p2eo+K9zz
	1lZS6+M6oW4KuoAgUKsix8gV9z/GuuJQyQjzWp1mqbnWhjSo5cEcK6Xz8480FtR1
	xTNUIfbMyuP9Exkg4DhLMjRMZyIgMG3KZ5/afIqcgoSr1t6XPUeqRgiw8p3zw/qx
	HYng2j94WVKO9vXsWm9fYklBgNdtS1+KFuB26wK6dOzvN4rj3reSdM8jkvVnpVzj
	GAxY9+vwExzEOBMTHe2keKVbasoFxpI3191zlvGXs1TpI073EmaW5wqIjEMTDDGS
	J6/s/VyNDZi3Sp7yqvDomuUH+VKsSUG49GFu7KuouTCO9DgoqM60rtrCbuMVKT4C
	/AU0Pg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxhhu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:02:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf9f78f126so504711e0c.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556136; x=1785160936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lA/IMjFuXqZio4SG1SxOvRIX9lgOxQfU7bsItBl2BZA=;
        b=BIzLxd4fxVRmCiXpsKPP/BVQ30OzsZEx0ZQyOWmGbaRG6JhihQV1PvcCqwRwf3r/CY
         yXO/TPDcAl9kSrxVQsnbmwpKlKy9GVPyRDUnCzhwPhO8rFuTM9SGENeO5Zyt2uEn4voV
         dMzBO44PNxKwkrHcEdbyfHUiZ4ZucIxDcsijq7QADD0OIABfCpFp0ahN2xY738WAcOxs
         3lbnGBmhDW9fw/mH1oSHYVrU98fiGAw7uc1hN4IeeWjheCr2Ey7LCDsw7yFIl1XMem8U
         13cllKZspB3/gz4C76p2n1sMeSS5oAkMLj4QAk4iOS5mpFAl2YOpW4gLD1wmosAgwPKi
         sA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556136; x=1785160936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lA/IMjFuXqZio4SG1SxOvRIX9lgOxQfU7bsItBl2BZA=;
        b=ASZFT3jnxhVFBH44eN7pvhr/OuGcsp0spukZ4Qvc2J02ScWhIPevi9eF6v7NUuixHG
         HNpCqZY0LhSHM1+lF6hkVIhRtH46F82PrkcmMtJaSDScnbnKlJUU5Fhu2b7+p8ece9Im
         3QMluZnAn5YXSbOGx8D0+H0242eWBoeUU8dByW5V77/99xxhWOackVXZ0A2WiuvcQchL
         0zSg6SJssbzL3dZ+zt7Uxx75TB3Bw8sBJky96TxelLFiiFCYTWKHhjLPmd2wYfCwODuk
         Vn+nn0dTyA4wTO/XZeo7p9PEWplACDBHdt/uPco8ujE0FFE8MWbxK+0n1X9xbAuIpplh
         ieDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkmABa54pb7Rr5e8I+jI+a9EQqf1OYhsWd1rWpgI62aQZ2BmW+bCJv6vKBiWkjX9RnjuVxxUFG5J9R@vger.kernel.org
X-Gm-Message-State: AOJu0YxloTDy0iFW2j8zoF3y/5rzKTGBFurMkg0+kcJK4sYdoYfbZeKN
	7G2Kf7KuzVVZUgAWVKTegEkTQ6xU+w26O2Q2OQFGTjU5JlDQA/HRTZQI7KyU9zW2vmRf+IlIcqM
	smJxFjJuSkahdqnHKfiSBjsM46e9bMdqSio9EpXMvMj1XzbUsTdlCDhHfcOqMAfXm
X-Gm-Gg: AfdE7clnD04IDixESS7apvg1vkvuPuBR9tivzR61BggjerqyUDvuXtg7GcJL7BOrrhc
	WKRgnc4Ex/j9foO3Bj1/iQu+ONULawk31Q4F3C6PYC11RfC7RRHI6PKwk+cqH0jE44mmmdSBah0
	mcNOVIz5SQNoaJVmtzRM0JnEBpraf01BTCmHVhSSwjWHs8cLf4oXCG9tlCXunMkJ7Vj3Enlgvs3
	nZeMuFucZlJI7wkHoTL2MW3XsLvIIPYxMfMiehdmiCJHbELgy0J+vWlMT10Z7fscBHUZVkEa8ys
	Qj0w6HgZWX5+4yY64vXVz335fLmJoVIFQ5P+ANtI2L6TnqomvF81egwG20wccXjXZ3yHf7lx9qS
	eJTkAaXIvELzEL0uWSwToTGOp
X-Received: by 2002:a05:6102:5246:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-74ab47556bcmr132797137.4.1784556135857;
        Mon, 20 Jul 2026 07:02:15 -0700 (PDT)
X-Received: by 2002:a05:6102:5246:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-74ab47556bcmr132743137.4.1784556135195;
        Mon, 20 Jul 2026 07:02:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm482769766b.32.2026.07.20.07.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:02:14 -0700 (PDT)
Message-ID: <216e23f1-2074-489b-bbf8-0a781a57eb50@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:02:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
 <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
 <al2iDH2b_YxdHfLO@QCOM-aGQu4IUr3Y>
 <d5240c7c-6450-489a-97a3-c774deb129b5@oss.qualcomm.com>
 <al4qB8gIyLSjPBGS@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <al4qB8gIyLSjPBGS@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e2a68 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AGgUKOJZDmLg38P9jMQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1NiBTYWx0ZWRfX4lpvqh0VJfBk
 /vfCXhNcQ62br/HbwIEN7gEpyjPN9d/8AVgbS1FT24hv76nBqAqiTnKX32NmsL/37Tqj8675L7y
 aORMOoWel1+Iw0od4akmWdf1JaBl5SA=
X-Proofpoint-GUID: MsgIN_HQlbJmQFVXtNlDcVXvQMUFw5j5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1NiBTYWx0ZWRfX2EsHULE5/CQ0
 1rkopk4CZs9NfrzBl3qhL2MBm87FIyA2aI3f5KLEVdOEiTa15y1IL7qROevmF+eyO5f4MrmauMF
 Zt8pL2+vkL+qP3LrQtEXAN3avtCJwiACAA++QBS9klL0AG1Q3OEhVRXZC1z8rbbS4KkwWhY4Zys
 hZerDoyZ8DxW8+d+aG3TCMshxpDAgrD3y1aelwd57ilIKxGfjmTM5yhoqTL4D0lV0dtM0Umdru1
 YC6Xtq7B8SmJ17p/sBYLV0DtQNlnaivGBuPQu6JHuzdzBfypzI/NvUtuHh2igzQCQV1oXEAh3en
 KEKMBKXVOyG92G5kgSQWe89V7iiaTELQQyAqfsE7QLEwKBj/e4VZDJ5Znd0D4aSp5TBoZ1g3j1n
 jeVoNlVMPVgC53fpAeUvKNb2MHc+jhftjAg/FY9MMo67StyJ9Par5Un29ALhT5idxTUPOjO0/pF
 +jS23H3ELm/noHESzIw==
X-Proofpoint-ORIG-GUID: MsgIN_HQlbJmQFVXtNlDcVXvQMUFw5j5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200156

On 7/20/26 4:00 PM, Shawn Guo wrote:
> On Mon, Jul 20, 2026 at 10:40:09AM +0200, Konrad Dybcio wrote:
>> On 7/20/26 6:20 AM, Shawn Guo wrote:
>>> On Thu, Jul 16, 2026 at 07:14:56PM +0200, Konrad Dybcio wrote:
>>>> On 7/16/26 4:26 PM, Shawn Guo wrote:
>>>>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>>>>
>>>>> Add initial device tree for the Qualcomm SA8797P Ride reference board,
>>>>> which is built on Nord GearVM variant.
>>
>> [...]
>>
>>>>> +&scmi15 {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&scmi23 {
>>>>> +	status = "okay";
>>>>> +};
>>>>
>>>> Why only these ones? Can all of the SCMI servers be enabled?
>>>
>>> These are the ones that have actual/enabled client/consumer devices,
>>> e.g. scmi3 for ufs, scmi11 for uart, scmi23 for thermal sensors.
>>
>> We normally refrain from enabling resources in the DT only because the
>> OS (really just Linux) doesn't have the necessary support to cope with
>> the ""complete"" system description. In this case, there's a firmware
>> layer drives everything and handles on/off requests gracefully
>> (hopefully).
>>
>>> We can enable all the SCMI servers, but I'm afraid that cause kernel
>>> to map shared memory and issue SMC calls to discover protocols (like
>>> power domains, DVFS, resets) that have no consumers, which might waste
>>> a small amount of memory and boot time.
>>
>> Please give it a shot and see if there's any immediate
>> problems.
> 
> Sorry! I have to take "We can enable all the SCMI servers" back. I just
> tested. It seems that NHLOS ABL doesn't like the idea, and it
> fails/refuses to boot Linux Kernel when we enable all SCMI instances in
> DT.
> 
> I can try to figure out the cause by working with Auto/firmware team
> internally, but that likely takes some time. Can we address this later
> as a separate topic, so that the whole series doesn't get blocked
> for v7.3 merge window?

Yes

Konrad
