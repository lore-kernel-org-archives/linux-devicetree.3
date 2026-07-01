Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD9E3FD15E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922378; cv=none; b=AUY3XMdb1m5czanNUyUuP/5LHBUcga8Ri0HTXAVb6B5ziKNgkNa2Za6awNgkhpkLRX+w1Cb8HZFXqYQfLk5qd0q8hygNkWOzWRAsQklVW85PdJHlpIE8to56y25GKf+slJkAdgI8amqTcFIj3Vw5E2BacQYR5kzSAWzwRWEus1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922378; c=relaxed/simple;
	bh=+EDqlBmzXp4NJj4jM8XDEyAZhhoWP3EXfYKbXx9vcJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPa2CY83ceGe7uyYvk2KSN3VMrsj+atUqcDZEeKIFt52kSKsNoFj2HPqO1lfSxASazSsxGAbx06IzNjeGZYy3hO7S8J/6m/HJu6HULflLmLoLR7YJR/iya8MtZ5lFv5rtAorPsUmAhiVZdZNAweOqZKsF6g0PX0FCT6kNpJpTBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9C+/DmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJC2q+mE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9C+/DmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJC2q+mE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoB7c1513133
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJg2zighTM4yKm2FKnvodCu+Sz8tNWMUjR0DJFVA9Pw=; b=f9C+/DmOFRwljiQ4
	+p06L8p4ABT+krHZreXc6U7xpIme71uYYI1cEoFRr/ImXvdHUP4qwZbPkchTpHWd
	ohVLYWXn+ib9czDWe1FF96MdOQ+j0+Ba0EcWmukNpYpFUmVlECiLADnw/ILJ3ZIk
	aujGRsIZTQNyKFaWkcSTAeHX/GrjKrBLiWRDdpNskbuFhooc5Y5dX5Ci7BoEHcGy
	800OcJGVmYepjKWLyNj2kWXd0PsVbY96Ups1GIs+IE35gBzqibIeDVBYRwGkhm2u
	P+oYusFRzde4L5hlOn6oWs6I2+KpC8Nb9VYgZVEy22I6M9ie2f3BW4TRanbe3lTS
	XfIu6g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwd1ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:12:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so60671137.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922375; x=1783527175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJg2zighTM4yKm2FKnvodCu+Sz8tNWMUjR0DJFVA9Pw=;
        b=fJC2q+mEXyKTcHYKA0juKk2eXLt0zSj4aPYEbai6xxY7jemBKctjpj38grIa6XSKtU
         vv/EBvYW/YEEnrnncHycaz4SoJIMAB6ouhN7vKfqdYGkKRFQn5iiKkQfNKbaJ9Yu/Zxu
         u63taiGrn03pwTznttt7NoelJsJE8VWleIksboncEbW02oYaKazDIXZ6oWb7vDYwPDZz
         uvsEdGQvQbSBy5SW5tqZj2uTFAmfc8xMCOGplcqEr0GaOm/jj0jt25p74cwjhnsrauLr
         7hLUabC2hikFam7NFs30jPAI7/fkpQOBZ5s552Bxk2o0iMjEfyQrWgaDZGrWLG+KNxvJ
         MTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922375; x=1783527175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJg2zighTM4yKm2FKnvodCu+Sz8tNWMUjR0DJFVA9Pw=;
        b=FTToosk8DOq9ZGDDMY3alhA+TMLrJQ3vMNaWoyu8UBy874gkTlcT0/ym0FqNbcV/VH
         2P3eosx3t3DxmjOwWuojFdwTKPgZ8ej9kJ6SuIdOi0G2gOpNrhYuLqRZWntRPRzJr+Sf
         OCoKMzsM29hdElIbw/GGMZijorkrqnBymNjABydKEWd/jGu1Z2Y90cnyNCNH+pXRfk1D
         l2F/IdFOJZGhy3+xrRm2ldCHzFmKRFOdOroLCKr2o61MLjGxFErP4bbR+fuTzaZUNcIu
         oes3REuBLeDPBoqbGOge8CT9PzG8a2KTQb2tTbDcN+bTvXZwPwi/cIRTfJQXO5TGUvCF
         D+iQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUBRfuR03lUlR/BpZOid8MVTXaMTxCBHsYP9hT6+WrS8EtCTVU5vDO64AcgQqCLXUKXoiAA3tGAeXi@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvweS73JnsPXRR5PSStXVViBgk0mIGYJq9wAi/sKKzaQn2Rmz
	NthBel+SD+HKRjEAi/gdrzWWODFq89jXDCOO6BpdVjmQWkeppBuMrsYacNLK4oxP0s7uMfQrXmz
	/WqG3oK+TvDobp43L8EXLX7NYzNfuQdgMgKakLwIcWscM4YEe7KFk6hs1NdWrDNmk
X-Gm-Gg: AfdE7cns8Dg7zW2B/x9MYbRmlX1445XajhceZyZWYwOPbc3bu7P72Kngvdot0Ss3Y81
	07u7D9xuv3+5c2oWQKXFZFSvDsKAjFm0iqgU4m50ov0lqR2RXjq4r/4WZvI8KwNtG1/MhlZEGY9
	maWmRi7pmnwb44EkRV5mgUTduxwSO6Bmr7dsrAnCiTTB0phKw0sgltp7LxxQPp5E0vRQNpcupC8
	UPmSsgUQJF5cWTgHJCUUdFDvAOPyxXVw569JkUZwqrCg+bZNbPF3VkPcWE3GA2lTGjBbPM7l8pa
	pA83YRZwpc+G9B5NPB3uQksnt9hBjkjNEYvTwKLx29lrfYfJDBrF+LWJE38uw31JgRG6pdQYb1h
	OqUz81KPFpUUy9Ok8tOsb/b8SDFwFwWgCOIY=
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr407489137.4.1782922375386;
        Wed, 01 Jul 2026 09:12:55 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr407475137.4.1782922374997;
        Wed, 01 Jul 2026 09:12:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12891785f2sm297128966b.61.2026.07.01.09.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 09:12:54 -0700 (PDT)
Message-ID: <b461c125-947b-4e06-b502-abb354e0cba6@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 18:12:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
 <2cb32deb-4266-416a-8db7-1b3b46b52162@oss.qualcomm.com>
 <843419F943CDE487+c183d00a-3967-4ba7-b6fe-fc50749701b9@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <843419F943CDE487+c183d00a-3967-4ba7-b6fe-fc50749701b9@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6yCgxooMIZspCnMX1_uG9nhH2Mn9TfB-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MSBTYWx0ZWRfX4xiaHSqThYGd
 C7qxezS1y2wQao0PxMvesvWDoJTBTwfdxKWApf//g/Xcl3ECHVTxb71PGUOLXQG/Y+tbUya8fCY
 WEIJamYkBiYWqqAfsaSABLozCntyRxA=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a453c88 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=0Miry4rRAAAA:8 a=NEAV23lmAAAA:8 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8
 a=cDOuU2R2u_RE6FqNeRIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=UT1Yo3WijKgCWNxi40OF:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: 6yCgxooMIZspCnMX1_uG9nhH2Mn9TfB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MSBTYWx0ZWRfX/Xta4JoOx8d8
 4GRZphJy0Gf5Sb3M/rOeyCy85K/Wwbm2s3QfS/VLDDWly44pLO33Nm8YttYZKZ/ikk5OlfVgXKi
 y0CBNW/CGgyTDtKDv4dIfya4YdMKK/s0Udd6n2ormA9QZTT5Bp7Dld4gesG8apMcgTNYsf/7DGj
 u/vtYApNIJ+T7jHNn+0TjY9/4vdBPnYtHeiGkX0nBslRPXGOIzggqTpI8wf4NCcWPgeWYBs5w7N
 UDZtMcqG22HDiMcrUq1HDfZ8OlM7UZBAE0oLuCg8bV7Th5CjWiKUJwot7EcXp7J2x6ZWLNtW6bu
 P+3u6qTt+Gc9l1mGetNBslG/Vz5W7v5Rba7dnBMr9mdDLMLzCqVvRkJuhZestcniB+TzeI93KVu
 nfLW92+nUAy80Bcwml/+bT1HgqMVm2EdBKv92yCsYMt/b2+NrE+Y5cIgl3R+7Bd8yyM91lUNCEn
 OUNdobJzVuBGbX5qxSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010171

On 7/1/26 6:04 PM, Xilin Wu wrote:
> On 7/1/2026 11:10 PM, Konrad Dybcio wrote:
>> On 5/7/26 4:29 PM, Xilin Wu wrote:
>>> Flatten usb controller nodes and update to using latest bindings
>>> and flattened driver approach.
>>>
>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>> ---
>>
>> I tested this on a CRD and an x13s, both work fine across suspend.
>>
>> Turned out in my local experiments I made a typo in the name of the
>> interrupt that was carried over to the big node..
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X13s, CRD8280
>>
>> Konrad
>>
> 
> Unfortunately as I mentioned on IRC [1], this actually causes random NoC timeout on reboot, which seems to be related to pcie.
> 
> [1] https://oftc.catirclogs.org/linux-msm/2026-06-11#35405057;

Ah, you mentioned this:

https://gist.github.com/strongtz/50bbd71a9f41d0d1aa9849b8cf1dce21

This is an attempt to read CONFIG_SPACE+0x0.. I don't really know..

Maybe +Mani or +Qiang has seen it?

Konrad
