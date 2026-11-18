Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003654;
	b=IenxDf5KUsqQw0oN2UrZHcq2uGtJ+TEHPOxFQtlDx0EDsgCHdiFvHck0pgxA+Cqm5yek
	 Obsvt8YDfDBQK9k24oZGQ+RdrH+gGrz63nybZdNdohUoZLJM5I/NFXWAEMpVRbIOJUPLP
	 H+v/+Fbt33z/tKziVs3j1htmEn6rlknrC113oRrMTITMaExk7TrYlg87SnA8/Eog/0uO5
	 iYhSJxfIeqb1QamEN/gAx2baQ7HtniTD66EeI298BYt6GyGskmbI+YblfA8BSR5OH5yow
	 5IuyNBfJjoe+Y7/VsDjUZ1GQKyq7vslkX3KAugcfAYyPLhzakH1alf/IJgwBwl+DHmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=;
	b=PAzFOT7Dx5J23DRe31SuWVXHmE9+4wNNku8SRzAKuQ11Q/WOkFiPZ4GbNZ2nd1zVeMzE
	 beFB+yTwtUSSSmjrOzPWFImPDDa/5zvDxbRMrhXy5CQK6qi5Dbbw5C6FsUtVbQu2+w9gy
	 ygd2hYyJWfrY5DeXRIozrKoGrMrKWiUvQq2Wb/XFbJkNpKSGn9Rd5HL2feg4k2O0wGdZL
	 cVRlyGWU2GUx9xyXj07PILx+ar6+c7j/YSO4t8xQl+XE7d1u21nbqboqKkrEOl28lE3Wz
	 ymJqeCpssvyryZniz61yRdeAAvx0ixLFxUDvF+oUmGysqBklMKMlM9g3mP/8a+Z+xZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m58+Jm/s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vyyb8pc4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3F9606C3B4
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A3F9606C3B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m58+Jm/s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vyyb8pc4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBknQk2003919
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=; b=m58+Jm/s2vJ3gqKq
	VaIH92ZTzASJ8eohtgzW4HaXPbcN4/uG5hzGXLarxQPmRO/bzpvmqyjUIrp4kfjr
	hKXH33GInbgViG+pEmT72S9Lp30a/zFDeJRk2IKV+e+qqzp95GZ9Ulns1tixorkw
	hkPS52oR7qvebFIexEgTea9dL/4n4h8h299CPEL3JUda3yWx7bDpBrYFPYtWN/cX
	MXQcnKiHhnjLpSx0AWDdcX3D9dl4YiTbR48sNKFHwkvGGK+8A/kG7rR+E/7Q3H8c
	uVxBfrJnsaAlNGD6acv5biTuOwrXR0kV+HXmQ+MZ5/dDgnjeZ4j6lvmGZJmBzA+F
	bWHALg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbaw6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so208773285a.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003652; x=1795608452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=;
        b=Vyyb8pc4Ftng+mzKMnYSOuPdNdrfMvLK1KZhQUmwXJOBzVvDVb2DTRaITs7UNrUTKO
         fojJUwFplWZUhIrkDnMHQjb/7XLTs3/q2Pw6CsVDufChAEB+fD5oqgXVmWCORA/YEiFe
         m4DDSWAsYcKa27ifTQdPhKhtdTYidGhWlGyWKtEjHepIeqqgQrC7DaA2L40XFrH6OCnr
         /mTRfHAmBIUBPkyXKgftwdBAdd39gNP5+JUCjkTjYammNHIJ8U+LrJ2yqCGJBCpObgNW
         sUHVamInHgKt9puGRmkqsCpvVs6GwwfAhhjZTMasMFbhBSJ2iHf4/YeixZnFN4AoMGsg
         COSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003652; x=1795608452;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=;
        b=2B5SeGNJPA3flJXJIPCrOhL9pH4LnMXLJdaOBS3OTf8I60WhT91bWUCUj48XhNTii8
         yYKiHlpoDS43Ni5ZcZBUwSY35fnP41juOjLZh88dNuCE3i/waMIbSkihUIVTHBSzbrMN
         z3yrn6de4+iLkgx0rAjJaExmwphJakFCMsvHLxyFpT+Ha0xt772VBw89SeBk2WeV9M8R
         OAFFJTCikTowVFfdczSnBQPpkB4jPX+nGUbgvs7Q4TkS6bq7pq+SczENWSsyt84FyEfc
         EtEns3YPYedu2yf5KGYtQkre2GY0xKpC2v7ypuqgVyD0nJY7EvhZSSaNWW1t5EF5e6N6
         RWlg==
X-Forwarded-Encrypted: i=1; AL+hErGJzmIhOc5Yd3Fz8qNu1EGZfXfaOgv4EPYdSsdzV4QuODrg1mqd2227EN/Z9cvUxvUoHojXWqDLY6s7@vger.kernel.org
X-Gm-Message-State: APuU4Z/HSpxRQalfI6YMxz14AMLQ37VkHzZci5w6dev8ERmul5HrAwDc
	FjVEl7OZ9sQffvTiTz0+V2JrmrL027QOxT3Iplhj94reddfk9Q0mcIErBWoR/k/V6z28G1l4QIA
	ozS7p+fTW+Pf/68I9V2hu8E9nrnVmltSHbx2licmKOGCc1uXSCFeCQt55u+xW/yQ9Pvbqrv37
X-Gm-Gg: AYBFou3/CuffHwxNkzBUW8u5MtjIYuPi/d1Hm/6kFqRB9IIyrGkJXrIyy9WiiMgMN6O
	ckyyXgn9nTlWQOa6fxPItcz3Dh9qw1cmiQ2Bt88XzcfZfwlHpTy+HAGW8Wa2kQRVVrJT15B4zul
	SQ4MuAdb95E+lgalastJNOzltvPBV8ShEgOLvo0SvMPGxd+kLZh7gAeFQOBZaYB3SYitKhlHHAw
	TqRJqoD1rTQzX+ewdLiSJ/5l8vAh5NfC7UyJT5PDri9u3qNhaQti17EltLTG1iUQhjj720n8jPl
	H7SImskiRMOxH+drRSUdgETSb07YA0timklafCT5pu2MtSRr+5RXBuYveiMhjiWstvPB0oic47w
	zHLP9fJ8cMRY3Uz9g44rMr4FerYMpWMljBZdnRb1yix8vXrEWCdy1EfS72KsIFpbVrtuQEUaQhr
	M=
X-Received: by 2002:a05:620a:1a07:b0:93e:60e8:c9ad with SMTP id af79cd13be357-949995f6f18mr450726285a.12.1795003652099;
        Wed, 18 Nov 2026 04:07:32 -0800 (PST)
X-Received: by 2002:a05:620a:1a07:b0:93e:60e8:c9ad with SMTP id af79cd13be357-949995f6f18mr450720985a.12.1795003651629;
        Wed, 18 Nov 2026 04:07:31 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm3923461f8f.12.2026.11.18.04.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:07:30 -0800 (PST)
Message-ID: <8d0810f5-e90e-4a70-be9d-89215d02b74c@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:07:25 +0100
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
Subject: Re: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented,
 unapproved eeprom0wl alias
To: Marek Vasut <marex@nabladev.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
        linux-kernel@vger.kernel.org
References: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
 <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
 <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zBhzR42ayWdC5HQM-s7FR4zPv35PFetG
X-Proofpoint-ORIG-GUID: zBhzR42ayWdC5HQM-s7FR4zPv35PFetG
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd9505 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tsTWcAnlPx0FCvilErIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX9gRT7M/AJQJN
 6YgNg11MGYGa/2TXkEFrKLcm+C+ItwrhcSzTx8fj5ggdxnhecTwKhi9q8dlJcddCT+ZKbiOoIsJ
 RH6OSWAGMvmcIVb2nJBBdocx3MhD35Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX/5pmkiqfQVmU
 9R4mXQ2FT/SrfV5S7anFXo6p3paE4M/3kMvY0BCAJaReJDeAHVHRTpqNWi/EYqI7bTBrKyBAeZY
 qWFy4lu59OWhAXj0aeqvpfnx/sF8VQbS91pEqx5nD3zBPltu11EacOM/BRsnC1ZvfEc/kETvZ64
 IwhmJHmpEC7N5RMZieS7tVGIAzGN/ZbAJ9s/nM7PfPtdYRU9wR/cH9PgHtArcOGXIpKJOkshd7T
 Feg4BFY9Hier1zrdytS18FWARl3BVsCRuf3wu29LDJ8ZgxsN3LCFFyzSdP0oYF0s1lkZa1WA3GW
 LhKdprm9gEUrQ52XU9kSIMfVCd+q4QJd2RVtgMqXSQgfIQNIneobOHzncP2lt64R6vS0zd1mXbM
 KTIL7GIWGSzz7Ib9pN/lax0/+8SGwxXqsnNdUv4p6blneS/ciZVTZJENbTouEAYITNf5kOVFZz0
 ebDuqIoCnKA+TWjpHRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048

On 17/11/2026 17:24, Marek Vasut wrote:
> On 11/17/26 4:13 PM, Krzysztof Kozlowski wrote:
>> On 17/11/2026 14:41, Marek Vasut wrote:
>>> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>>>> The eeprom0wl alias was never approved by Devicetree maintainers,
>>>> because it was never documented as actual ABI.  There is no in-kernel
>>>> user of it, although there might be U-Boot.  External DTS users cannot
>>>> rely on undocumented ABI, thus these are pretty safe to drop.
>>>>
>>>> No new custom aliases are allowed for years now.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> index bcf63e2ea989..5795b352fccf 100644
>>>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> @@ -10,7 +10,6 @@ aliases {
>>>>    		serial0 = &usart6;
>>>>    		serial1 = &uart8;
>>>>    		eeprom0 = &eeprom0;
>>>> -		eeprom0wl = &eeprom0wl;
>>>>    		rtc0 = &rv3032;
>>>>    		rtc1 = &rtc;
>>>>    	};
>>>
>>> U-Boot depends on the alias, so please don't drop this one.
>>
>> As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
>> user as understood in Linux kernel policy "we do not break users".
>> Especially that U-Boot does not even consume that DTS! We do not break
>> U-Boot as long as it is about documented ABI.
>>
>> Here U-Boot won't be really affected, because updating DTB in the
>> kernel, does not update the one in bootloader. It does not go that way.
>> It could go opposite, so from bootloader -> kernel, but not the other
>> way around.
> U-Boot does consume Linux DTs via its CONFIG_OF_UPSTREAM .

Cannot, otherwise it would have document that ABI. That is the
requirement of using OF_UPSTREAM - you also use upstream ABI. You cannot
use upstream DTS with downstream ABI.


Best regards,
Krzysztof
