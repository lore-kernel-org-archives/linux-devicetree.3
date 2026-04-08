Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBDC27FD75
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640043; cv=none; b=I8SZmsJ+eXRhckAr0tMwgNDu31vNf2sMrq7f94fPCAwnfrfh+UTQX4v54k3ta9pFE8ThDKlw5I63XJgwqv8DSMzFqF6tZ7PfwePTzG/LxSZyrngsxh3Bo6FtmBffP9u7zCM6RjR7fX0tDcR/ZRNd3i8wTLqrxGxPtBT24PBGC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640043; c=relaxed/simple;
	bh=1fEK+3/IUaI6PtifAJ2tgPApAe8vnhtB5kNDXeehzzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7LO8pqycKPf+/tlSJPYh6RJaWExlQhTswzI+UL+3osUPCcM/m4gKF4UTfZlrtdGtlpRWrWmE74mVuGXuTEIEexFLQXqIdIEyWExwhOQmf2gSJDOgEI7FG6EziAV+DaUB6sOheWh1tq9yduphSe0AAFDimqGmwJAswlwV5bb5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4DAvfDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfI6n+t5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4DAvfDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfI6n+t5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385DEV2263869
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=; b=h4DAvfDNKDlR4sAy
	ZZ6qcNPxwUbDAsBIQCLqK20ilbf7/A1LN99AO8gEj7ml1YVzHCizEGrBtbWCnXgU
	AwD9jAyGTdgFtviLpWAJopm6CYLkn4G8L7jxq3/ejyd1bDZJCZWEwpjNITvjM2au
	QYk4Sw0Z8hCjkjSZMIQtNXd36XIVqJMzpf/G45y3SaA+wb5S/CRP5tyd+BacypCT
	XSsTcYNcYrt+bTvVaERG9ur5yDj9VlC+tNLPvrjhU+5nmpFkGhWa40X1fzGd6yuA
	DxVNGciUerA1HbMoF2SZNTrDl+oQBJ47wB8+ZtMs7s9qFZOvSCYV17iYfWIUYG9e
	H8YTcA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t22jw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:20:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso88692695ad.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640041; x=1776244841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=;
        b=hfI6n+t5fZqydA3iXu2mh3qmy3zaL9SpFZ4oaI4AYcLMEH7r2/dbVesTDYoW1eYusL
         qUl3gRZnuajmthuw5SlcXIDBvC+cTFjLQyaNRCOckxS2MIDVstbnYUUaemSF12iLc6IG
         64XOJ1Fj/ZIvSloZKn1G+rYHP+8DhSMWZH6oi7JisesTw5CptQR5hClCs/7ODbtAfU4V
         SWUgMzrxIvVW15D5GjDYTVythr0/UO8zV3gJa1wboX/OqWFuDOQrVmHuuefw9dtcXn0C
         4ARrHcHVwvBElNDpVtrQsBiC1R4cCr96wdKWsSXXlJFzt4gzi1HSE3GgIldNQwLwEbE3
         U7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640041; x=1776244841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=;
        b=ZxfFSkZfaqRbNysruj6t43hWMom32DzotvBB/SgkHva+FlP+mukNns8pGVrTgT2+z1
         N2NNvxmk2Z7HgtdfpBVBjRoPf4+67ZM9fcDd4YpDhIoeoEELIGYzOT6P7+CTS5SBNX1g
         rnSk9hXqBmh93EHVpMOTm32JYirt0GErY19orKwrsV4KvpVs0dLHb4qgRzBISg5FHCzd
         t7ZNmYtlneGNIbNSYg6rzMca78BU2oUxLZiPeInZSdSUg10d5tN0rfYLcStnHbgeV1ER
         J5o460ahhsEHk1IDrsxxL/zYUOPM/iklXaeqHW3nUesjkNIkL4r3VC04FisPX9UBytie
         S0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVJEeURCBlzt7EgO1e1MhCJv/aST4aR9Req5CXIGPvYcFm4nMOKQC6XflgOPRsL25+i7ecuRtdJZ0n@vger.kernel.org
X-Gm-Message-State: AOJu0YybSOkMcT5Atckb4BXKovcAhZZdDZCmcvYX6cS+msEYn22Mj/6T
	mDpqAzzXAuh/hLduxBb5WPSshVI1BuIT40kyFF7zrJyXoG99K60WjR+Gl7fzTh45Zo3Udthuloe
	BPG+9L7b0Nuy2jKKRoz79XAzQ9HLlAFDSCDP+B+w4O0s74ZwEA4llVoYOiByAaFf1
X-Gm-Gg: AeBDieuKxvbin9BNWWy0dokmk1AOhviKltz68Eoy4q0LIe8FGsapMv96hM2oTUP1Tv0
	YKgXnWKfZKM9aTqQI9UQsm4MMc2GFw77ibanNcZvNw/zu5OhL3YhNoyFuprvGmRd0TIUAC0jJC8
	NM0rj2MBbp324hgKlTyFsXHBFAGTj3iQseTHlC1MqVVXOWFS0pCNMj9XA7Kih7YrTx1/ZVCnDLI
	aGeMxaXn8bO0PoLSpgQFap/RuQJVxw61gzQfYXKcsLvlnhsKfh8YYKjVgUxsI/FiFl8fH6MPfje
	rKH5Kg3VVRFWg12yBQeDCrS/lNHOq4/Sc6XJ4H/vEhmvSe1F93O3P8PZcCkY1c71dVhha1Ogx9g
	smlLiQG4XjhjSxdy21KU1gcTPrfeylqtQ54i0Ii84JUzi3cF5vbmB
X-Received: by 2002:a17:903:37c7:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b28ecb83e7mr183196345ad.14.1775640041295;
        Wed, 08 Apr 2026 02:20:41 -0700 (PDT)
X-Received: by 2002:a17:903:37c7:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b28ecb83e7mr183196065ad.14.1775640040829;
        Wed, 08 Apr 2026 02:20:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm193886955ad.24.2026.04.08.02.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:20:40 -0700 (PDT)
Message-ID: <fe1379a5-57f2-e618-dbeb-32d1c3c7536a@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 14:50:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
 <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
 <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d61de9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/ZU3Ovutwf0He1FzxNd9ng==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JisTeJLCnvBdXki043gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfXxAv4v10/h8hS
 4Y/JLzGZcRhwWqt2lCTOQa7BJStVmzBa+sAF5ObcEFDYZ3BihJtERlBQbLzxf6MkW34B8chcurn
 7k4hToVeDPm9gIrbJlKq/noMhNwv85bxEN7c2cs10Gvp4gHmxsnkwcih5SeFXoFA5a/PibOUW+q
 W/hdEWjIMgf9MVfE17M3oJnxrABgQKC9LWGGjEmJ3gQ6VupMPf7q8oWwC8uuvGpfZB/pl+K7hcN
 UhOw2GPtZJHkQ96+cIosqcVCat2jUPaGKTg9tIoya3gxaq5ybnPfs9SXad3p4Jl4dMO2vF5MtgC
 Co6/H7MOvGvkcKngOWrdmttm2aeLGNItRxPqVpJdGCSD0ywR/3ZaqOXjwgEWL6izl6agJxY9pnF
 B9AivJx466NKNvNstbyoIrxu8TNg+LZ0xr4weh/XmTILis0YIO1H0EFJMsmmcgVIOA9GoUBY2Ln
 tTi81ivzh8uFszlajjQ==
X-Proofpoint-ORIG-GUID: 6hmOJ_c-blHisD115ZE1bZUOTFJh8hTx
X-Proofpoint-GUID: 6hmOJ_c-blHisD115ZE1bZUOTFJh8hTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080085



On 4/8/2026 2:47 PM, Wangao Wang wrote:
> 
> 
> On 2026/4/1 20:40, Dikshita Agarwal wrote:
> 
>>> +const struct iris_platform_data x1p42100_data = {
>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>> +    .get_vpu_buffer_size = iris_vpu_buf_size,
>>
>> this needs a rebase on latest platform rework series.
>>
>> Thanks,
>> Dikshita
>>
> 
> Will fix in next version.

The rework series was expected to land in 7.1, which may no longer be the
case. Please hold off on any rebasing until it is clear what the correct
base for this series should be.

Thanks,
Dikshita
> 
