Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677EB3B27E9
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155554; cv=none; b=sBdDr/n3lAtjc2oSK/3UbOT1Mnta70yySd1UWzv943PGpxhdgiGSy6qXyp6BoxEvTHZH/7MTyMXjOjOlTIjT0cMpE9PZ2lNaYkvNh1VfhwSE+kD4bIFdjUgnweUFBXEkNAl8MJ3+eHDz/xuxvIHHzt9T8npGuTp8Fj8rgtG5Uls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155554; c=relaxed/simple;
	bh=oOScpENHzavLOWGVgafokoO2WeuQKSvCI7PDd6PCPyU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G3YakHAmEphb5dcCveZVO6kX6FyJnhvYU6Vi0d3yjSbyKbBFF/o6NvTMoEwM7wdSl2uOnDqvahoOwotdunfZlYzy1hpSyLMrpECbdvBbqEozQyKnk/Hv+Xr8WvxJXGO/3buwYY/vyy48x+y43U1WrJjPDSLDLTx28J9U6r5TBow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIjtoJj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTctfiPt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIjtoJj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTctfiPt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6YTj73425973
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEIeYgZn/55wFznsq6tgBfUJhO0jP3QkGZsmt7PhTzs=; b=pIjtoJj1Fwnf+CAb
	tjyCnKqkkQK3j/wsy7OKpGK6r4u6O14gyifM+LskH48V3hehqrF817ckWM4/ARWE
	xh1dKTX8b1KIWZzjNg5owyHPRZNe9DLtvaXE1Iaxf+8YJzAONMUDzYSlrJ8iEazM
	XfA4qsacvH611y3joEIhaomNMwy2TbnqPJXXe+/bs3V/q6jA+UlPJqLiO9KMWKiW
	NfSLNDRmT/7qQKUFnWoicPeqOCk9QhWi0kwXumf/peGux7T33ZaIvTNNHFvgI3s1
	eZBAQ87Wucwvm4DUcdHSUTZBXrg4/V4Hk/Z+Xc8Rtpt1Afvmkpygpep2lYilq8ZV
	ta6JVQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f9tat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:32:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f2478c37bso3526650b3a.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155552; x=1776760352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEIeYgZn/55wFznsq6tgBfUJhO0jP3QkGZsmt7PhTzs=;
        b=WTctfiPt1gpRqGKRpcTHX1vpH/P1DCSkomP2hhiE27QR27NTYzmCL4kmcIwbLK/dYb
         c+Ci6BQvuQ03u6OpUIgiVD2tc+Tb6pLfU/VcRpKca78ptlFlwlYmp2BiXn0cwYPKxyFH
         l8DltAvoVTz1lcSkmHeUr+i0NHtGk6og6AEU6eWfPKStiNqDTBtzGy9Omb0g+lrk6ry5
         CahOQsrpmc3ccK1pvjAb67KFvUlSmCfChiXZdXpx59DRoGJikLAj9qatxmu4kNCUVoc5
         EIIMCu6laGDuiLG7RLMkHDd4KeLGve/1rYOCGmnuiABq3i0R9aY21Zq0E4z9Shze8LTb
         WZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155552; x=1776760352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEIeYgZn/55wFznsq6tgBfUJhO0jP3QkGZsmt7PhTzs=;
        b=qb9nDSwWJZxuzx78+t11GU6Y4xYDuXC4fSWgUton9j3ctMqY6nCW5t91Wo82llH1MR
         Q2m9pC2a4klO0QzpyQuF5v/B/pO5qfHCm8AuZRsbd0kIyeFiAkcc32Z0WMlIRL9QcrvK
         fvYHwG0PDDrmFTK4YJjlFW5OLaGwgW6heAnhABD408oX7pmfym5fF8UMXNn/D/RJ45xN
         Azd/aM3FQMz5H/GNW3UHOGv/rI+KQvKgBdW+VUGYlAQf5QbSGc1C9zgdPugnMVN4HZwf
         lzv+kUB9SXK9W8IvHuoTCOPf8Ylhc5Faz4iMZbBClWRPSHRLEoStynPaYszzmC7Pmu8/
         WR9g==
X-Forwarded-Encrypted: i=1; AFNElJ8NyIqksfHoLZWqJNY9rDRDSaxhHHJX+agArpUmxG2Y9b1o+2MJhlZHf0NxAdYRZx2KVgd5DqaUTvZV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5W7/gBr4tP+mU6vXNQKYyAceZlTGhoZ5Og2J86NKIZhMYuqtz
	VzTnKJGMuoSSXP/Bjc2/1Kt2qOM+OVDulq/j+1zbItOizQk23KDa8xKk1dYXLeIn2Zqd62MSRYQ
	3OftFpnKyT8MRk1F+8yhHqEl2mhMSItVPJ7ofCkBbi+S78Af96kyCIG8n83JFq1yN
X-Gm-Gg: AeBDievMnRfy0+99aar8EGecpY7fcd3/e12JKqpqk3mKZ74BnD3JZeRIj9Va7EQMLaq
	eIlhdKg3jTu9ZXN3+Es4p+5JUoXXvR9NMOcvShJV7AYxJEOtz6P0EbJQP7a85BckJ0u2e996gxE
	CE9TdruS/hTK1KjCwyN/PnMQYkkR+w1gwPr0794kjJW2F2EQYCsMxXbqgkOtVwQnkGbcsnDm1l5
	UDuduW7clOwJpW/3/HT4J15hlLHwfB3lz+BJLCdIYCqCXtIvXgr/VOZRG5m61DyJDYi8xMvssgj
	W+9mdvDDxsVTeVbCKmRUyTT9xR5L4AR85nq+2XeUCNkujPbc/t537HPVfH+RQ21gp1SZael6NY4
	ZcZXjHFMRk7ddkxNgjbHh/fgt77LjyExpqxSdQwm4A936H/lxjWSKpU3J9xIZJYSQmVd7A/0uZm
	w9CpHOeoF6NfZZrnNMZFS8MxWMjw==
X-Received: by 2002:a05:6a00:8c83:b0:82f:1b50:d2f2 with SMTP id d2e1a72fcca58-82f1b50e2d6mr9600308b3a.18.1776155552019;
        Tue, 14 Apr 2026 01:32:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c83:b0:82f:1b50:d2f2 with SMTP id d2e1a72fcca58-82f1b50e2d6mr9600284b3a.18.1776155551545;
        Tue, 14 Apr 2026 01:32:31 -0700 (PDT)
Received: from [10.249.17.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c311a06sm15356803b3a.10.2026.04.14.01.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:32:30 -0700 (PDT)
Message-ID: <fde95cef-e704-4fa1-a8c9-4047488cd9a5@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:32:24 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
 <20260402-lurking-tested-marmoset-f315b4@quoll>
 <9bd4e289-9cf1-4502-baa5-d85cf6e07df1@oss.qualcomm.com>
 <fc1a1d5d-7802-4584-87af-db7ba7343b85@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <fc1a1d5d-7802-4584-87af-db7ba7343b85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OSBTYWx0ZWRfX2cOYC0GIdM33
 3Ald4FWI+iaHbOfUkVWl+cKNUb/25Y+o85AqYDRm9beX+E9tNadJdNWC1apsRYjGdXoQFyPj8bm
 Hnlcwp3ab+gAaoc9j1sh5tIAen5TosTeb+nd2n2NX/FtbSAgUq88nMjF9juBkRb0WXz/fD8h2wA
 vv6vH0qaVx1f44ty1VBPdwTG7ng0dsZ9lpDFI6dmDp3JLhsMoJZHgHQVpz2EzJGXMGxoIUa1+Mj
 mrXmtk8hlQ0K45axiqbnsVw9k4QJyldcF1oA+f6EahsjZgbZpnADFXKGzoaZx6P/AqmNQk5A+ho
 PNA7jF2S6DfovjBsabdUJY1wM/VAwkIZsCx8SX5Tp2WFbG6zTqlXh/lVM57pszemDzlz9poX4Wp
 WsGmmgOThqx0ZdNjwjtsC3zz42kSx3zkso4XHOMN7TSs9DecaxD00fmqtFUanAgycGoIkZHcUrn
 ua/dzT4uzWcUMo3IlDA==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddfba0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Qnz2KnwcCDuQAHdkxh4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 00NHLwzq8niBx79Q3EN2_cgLPMb02eyU
X-Proofpoint-ORIG-GUID: 00NHLwzq8niBx79Q3EN2_cgLPMb02eyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140079



On 2026/4/8 18:41, Krzysztof Kozlowski wrote:
> On 08/04/2026 11:16, Wangao Wang wrote:
>>
>>
>> On 2026/4/2 15:08, Krzysztof Kozlowski wrote:
>>>
>>> Why no IRIS_HW_AHB_CLK in power on sequence?
>>>
>>> So if you rewrite the code that you have list of clocks for hw power on
>>> (IRIS_HW_CLK + IRIS_HW_AHB_CLK for all variants, +IRIS_BSE_HW_CLK on
>>> this variant) you could have just one function for all of them and
>>> devices will be fully compatible.
>>>
>>> No?
>>>
>> The original patch was to add the IRIS_BSE_HW_CLK operation into the
>> common API, but Dmitry requested to separate Purwa's implementation out
>> independently.
> 
> So you don't know why you are doing things? I don't understand what sort
> of argument is that.
> 
> You are duplicating code, while all this is simply the same logic -
> three clocks which need to be enabled.
> 
> Best regards,
> Krzysztof

Hi Dmitry,

I think this can be moved into the common code, so that any future 
VPU3-related changes will also be applied to purwa. What do you think? 
If that works, I’ll update it in the next version.

-- 
Best Regards,
Wangao

