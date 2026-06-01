Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22CF1A6828
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 01:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780277039; cv=none; b=AZt8sa6zA/bQE3hF0wffJcQc4quI7z0qMLFaJSic/Hul76MTTbc/SLkRzYvQ15Z8qMfQ7IkRuej3NE+EIM/+pwTs0i4EEejcMUJ5lt5f90WE5qL/zhOMpKVdPccFTA4r8DtLN+W4sQLICtv6Lez2HUAMWKrGI5YJ3I3o8J4gdWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780277039; c=relaxed/simple;
	bh=5yvpq9pi1njiTI+tT9DdBKCYnpSV6j72X0isl/ZWYcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjh1LMCnzxm4fABrW4cFq37zK6en5Kg7m99Cw5OOGGHaU77YOG58XaGj/bPHwP4HSAPXRqnl/4Xz2N169HQ3SWgwFkKW9uoux+6xVSFX9HzILxR815UK1pRxNYOa+zoeapx4rIGdVN5gt3qlpLQNNFlVaTKK3nqwBKJZ1DH2CG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7ClhwIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzUnn8mt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7ClhwIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzUnn8mt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VKlvmA2539104
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 01:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQQ/N5JLV+fPflhn/nb0oSsHxPTvVt7khfwCnr2kKEE=; b=Y7ClhwILTxPJAO++
	x+fbkBA21A3z0KL5GTp7sKdpPwJvHOZk6O4/toVRLdgPbWdIcuzjrklxCtaa7kYk
	t39ZqMngz0bCf3j1EGS7iGD1jZCEivBQLvBeQmV1ELGcMh1Q2WHU3z147EsUhsIZ
	QpcHZXzLa1lY1zqy5+c1SHvkVSTAxjaqAsvN7BEHQFg4my15nsbNx2ucMaJEft/t
	ML7YkKJev8+LXyt3Et0jmR4vk46CvRELRLTAM4/tbGk9KEQTzm1jUJ4dh8YYgyBI
	0Z7HRKO+nXc7Gv/0zY8QD1IsLkyxacANy1hs/ZoqNioqQT7ORJE47FfGrqiV6GzH
	DRfgMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pnp34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:23:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso1125003a91.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 18:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780277037; x=1780881837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQQ/N5JLV+fPflhn/nb0oSsHxPTvVt7khfwCnr2kKEE=;
        b=GzUnn8mt0dFyLMvREAWTDwOCNHUtednQhiTFSqCzSdzTKrswCXzYBKZ8OU+TY0xkq9
         Cpafx/ePqZF9OcUXPAzO3SOYCJy6Q8Uq+VtF9TXt0jDYNQ/kXkiNjWdk7FT97l2oiGnR
         fhBcrGXh9fXvU01AVVaLPjWjmC24tUrHoOZO1O3Nl2zK87zSH4YSSQwWMhgBi5KZVr/b
         VLLHpZ3Qfve/cSPc8awOY/fImpVNP8M/fP4XbnhOzLcZ2tRlSTilrKaJ9tkd50S6VKm5
         aZOlVx1+/txXC6q0UxWHuGnN92oWDtQFtdoe1L2PJdupSc2J5wlU0ZzaNhdUy9zd63rO
         PtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780277037; x=1780881837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQQ/N5JLV+fPflhn/nb0oSsHxPTvVt7khfwCnr2kKEE=;
        b=CWd/LkffEm5TM30exPGbBdhOqlczCoP1LVKPGq8eff89dtl5mh+0kJjn/fLSUzaJtk
         fu6accapDlCJr/94Ea4Y9KxWrSY8LIhPnYfAJXAkv9h6z5u+wgJiPk4IkKPO+upYwIt6
         4wE49crjGfHDPebZIHMXmUVxBA9rPKdRYdq2RntciAxHPEOJqB/TzDZRNPogViHK9QVF
         3ykXa5jF9SzVXzO0hoOifjhc9lfZS7EOwRP8tcy57LAwe4fmVGjzYCsWPVZnzpyeG5wM
         c08exzRXEy5w3e4ZmCYyXFUSENn3j9NQNUH6AxxzYYi4EAgii6eDctLDoTN7wIK4p5b1
         2jDA==
X-Forwarded-Encrypted: i=1; AFNElJ9m/WlROUzdRs4jELmV4+cFUfDJ+MqA9QRdP618stVCydCE6awfNsxJlnd5MRJGpZaV6BJqbJszxnB8@vger.kernel.org
X-Gm-Message-State: AOJu0YwsqSe4/z3MKGBBF4HXC2sS7ergoriRksSB7yDanNfoZFDbqnUr
	FcCslpBS9s/CQHgVokR6N+o0XgMxU+7P7YBotfZ4b04feiJsJxo1Eyb32el3UjPjXzLx9ZXPs+h
	kH5PgcLjGgr0RfmEyo0XaWSr6hoPpbQ2YM/HdYcvd4lmYybu9keCO9qoAbjxnptPL
X-Gm-Gg: Acq92OH1zrgy7uDKc4c+onYWA27V0RhVDaus3sKtZRtkVB7Uk/SQ23aCBX/4KdcxLih
	QQHq3wpRxd/Nxo2XqSmQPn1YgvO8XV9lNrh5fgupAayVN0ANlXqmLzvHvSdBEtTCajKnft7T/h6
	/3RLUYNC5Z8+bKGoA6/2jHG2JEinCk+Ku5NW802UageFW5U0Ncct1OHV2TvcDU83NrnYoshGIMD
	iwnf7FLxDOPGSEDTrcLlGjIntJkPMNdQGVub30gc0CHljBDRa8hzEqiEPt6kWB0e4JB/Q5uDSjN
	rbkWKPU76jMitAqhxFjGGQCPK+RgObOZb7Qfsuw0YmK50NmIMIApxqvsGMi5BLF7Dxd+7OhxGWC
	tvOtmVNDwip5VHXxMSOhsbuCgrR/mroMOgtMtUrsVmwGlWZs/gfTLILPBPzi+tf68f7MtOkurqS
	ccQgQa+3QqjKghceE/AY9ud6xx
X-Received: by 2002:a17:90b:2d88:b0:369:73a:326a with SMTP id 98e67ed59e1d1-36c501e69ccmr7803020a91.13.1780277036603;
        Sun, 31 May 2026 18:23:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d88:b0:369:73a:326a with SMTP id 98e67ed59e1d1-36c501e69ccmr7802986a91.13.1780277036195;
        Sun, 31 May 2026 18:23:56 -0700 (PDT)
Received: from [10.133.33.48] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc660da67sm8964023a91.6.2026.05.31.18.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 18:23:55 -0700 (PDT)
Message-ID: <e00a4089-021b-4c26-8a6e-ba1faf86218f@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:23:50 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
 <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
 <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
 <moeb7zqqhengrd2nrqyuqydyq4pk4imd2uylmr4tf2ypn65h34@z33iifvtf7al>
 <20260530-wise-discreet-woodpecker-3c7d0c@quoll>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260530-wise-discreet-woodpecker-3c7d0c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lp7as8qoBt9Zwn8dHAu6lq3XKLGbt6K7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAxMSBTYWx0ZWRfX60VyiUzTyTg/
 4nwTgr5wsYEhBfzzBqUMLo3WOzHntMexbaN6wf85h13NgpVTBJqjytpvfwOl17nY6SMDmdfawsO
 XoSgEh46CXHHBxrTWLzGMONXzuDxnpX9MlUD1D26d1fCHOOaMp21q8+U8wMxtnW3P5DC3CNDwhm
 rwtDAPHff1+G0wRUYJiBhU/yoo4sbv0ZN32PEetnmLgA+k89bLvuZ27x6bJe3rEnXAFk8Zb83Ln
 n3zCkO7xwZC9VbBr7lGWCEPSVDay2KPKG7wQ7WubAbrcm9loPk1yazjtLYRvSwKunZYtLUO3PGG
 X7xihSlCuxojZL4oPo0oNLRHNPf6MdjJC/23L+jXpoeHNKOuZzlsBeLWJo+YW5OGkX9jxeRsZkw
 HituTZG5lJEAYOHVoobWEanzmLkJsDd1EpyFtMhqx43uPGLucrLgCJBh/l05cpLK5etnpgO4+sV
 0sEc0H7UqiXjs/Zer5Q==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1cdf2d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=BeV8J-Av9qvwb3kx9y8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Lp7as8qoBt9Zwn8dHAu6lq3XKLGbt6K7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010011



On 5/30/2026 7:20 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 01:08:54PM +0300, Dmitry Baryshkov wrote:
>> On Mon, May 25, 2026 at 05:37:23PM +0800, Yijie Yang wrote:
>>>
>>>
>>> On 5/25/2026 4:37 PM, Dmitry Baryshkov wrote:
>>>> On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
>>>>> Document compatible string for the FastRPC interface on the Qualcomm Maili
>>>>> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
>>>>> fallback to Kaanapali.
>>>>
>>>> Can I assume that it has the same bus width as Kaanapali?
>>>
>>> Yes, the DMA width for CDSP and ADSP is the same. If you were referring to
>>> something other than the DMA width, please let me know.
>>
>> Thanks for the confirmation.
>>
>>>
>>>>
>>>>>
>>>>> Assisted-by: Claude:claude-opus-4-6
>>>>
>>>> Claude assisting to write a one-liner patch? It's becoming ridiculous.
>>>
>>> This patch was generated alongside a set of Maili-related patches and was
>>> not created specifically on its own.
>>
>> Okay...
> 
> If a human cannot write and validate this one, I see as putting effort
> on maintainers.
> 
> Dropping from patchwork.

I will write and validate this myself and then remove this tag.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Yijie

