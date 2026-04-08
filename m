Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBBD2F3614
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654126; cv=none; b=aLf0yDva79czjDrw5ktHGOMc1/OJ+oL/QHFuxrRVvfTxe5dqTi87V3ZYjRvaNLQMWcRgdiNm+HqVWZRLM8srPAQrjnk6IlAEVx688itnmUcr5E40zMtiaz21B4PtAvzC9xTYKZt4nwjPe7DY8qA5o7ltDea8z7BHrvM3HT9woRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654126; c=relaxed/simple;
	bh=WKw2b3FSwa9eQdiAmEXghTEAkcX11kE2vpR3flmnA3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTy4sBwIWuv/JDe09HJ38Fid9jS+QdVCORnzUz4ELJKJ/XI7OHwmziYN4xyDQanDWv6BwGOm8l334d/dTdww3wd9XEzAVrNmRCXvwwxdoI7lkwWtxDvhFthx/tg3SIziIuHsaQHvtOycgoR+OjyAiLWK5viuUeHpTxfJ7sM0g5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmmZi6a1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUAPccZ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmmZi6a1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUAPccZ2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6388YnOc1796071
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 13:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GEteQTg38VOFlAPveazAOZENV7yVsPAb7+IVYkJJmw=; b=PmmZi6a1fRtGG6F1
	xE1cJN/v0PWX2VTPCVRU3MwIurl42/A48suwCfWyN0lAJxQwagJqVMIDqU69TWk9
	qEae8Wp88HQnb1tjAe3egguHktB/fLH4eHLtKunKQh3KlcCz6CtAW6iQ1gnB+FEU
	fTXJW0BUNaBESfPhbh2tVY/2DaE2XNe0El7JYsqwc2aqBNQxbIfUEEugpNPhcfa+
	bGYGUO1ypZrU0j0yq61VUk6ugO1yehFYZYcsbDk+3mYdZJl4is/sdAqqprBU3tyc
	T6REKmapRK6jx0twW4QbRsphm+TkxKNG7VFA0mJj1xqYz7uq49V6rM6c4i644hrM
	2Syn6w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd51dc9ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 13:15:24 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d848ad88eso437242e0c.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654124; x=1776258924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GEteQTg38VOFlAPveazAOZENV7yVsPAb7+IVYkJJmw=;
        b=ZUAPccZ27Rw6TujKXwe+5VCKUKZP0WdFTdBRyUuGhJvPIEu8QHegqYtaFxx9Romg4J
         I9c3EFPD240BhslcFeLhSSnmF5GJuPiZbZCgU0GNO/Z7+OIWoIEJL8T4lwbNFgoHoMnq
         5Wq1dgnzBXN5mhtJxOB/Lj4H450d1ZhHR5v/Vh6av/P29XPP78LdOk/lZhjFbueAX0n8
         nhXOHtUcHel/ElaLw6lTp+0SP70G7x1GUyovZGV7Qz8C+AZHB/yCDBNUrFMqr6ZFOR5n
         MfrhrpKD7RFN/lDwGDRpN706ruzvB4BsVWoiJ7CYbnQ7HQItkmF223AlldWAN8QiO2Ys
         YNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654124; x=1776258924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GEteQTg38VOFlAPveazAOZENV7yVsPAb7+IVYkJJmw=;
        b=nwyN26x1K2fKztA/vK/MMFsGfkwvfy4tcM/Gl5F5sf0XVCU5VTqX2gWfUZh2dhPaJo
         H07T2ZseRb483bHCFdr2LzlqzcBa4rdmMDDuIbHaLE2LS19HstNGvn/jR+dFHVoa1NdO
         om6pG7kzCQcyyLq6XLu1aS0XfffHyFCiWALNgJvkHYK/eUzN2o9RXZqgBiwpIaNl3yYR
         y4tOcYzIX93ik+PL4Gx4n26baJgS/JaIFzaaBwVwGY3XekC33H3oli6rSCeFF443A5JI
         bqYWUqEsJyYgPQHk568ZDz/ZxggG4AAemP6vAcwiIeXLXcMwxovCiP/yr3mm/vwFHsWi
         +6ow==
X-Forwarded-Encrypted: i=1; AJvYcCXgR6gn1tPordsUBIOze1RmJNfuL/6JL9XK86dbrlvcbDxu48fZ6SC/ZxH22scz2u036Rx3eHPBe4LK@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPNEH2Mw6AY0vOh9j2/z737pMXMetkLrzmmJVig5DSdFVibe5
	hw+xWHeW3JL//qinnqz4NyN9dh3qzmek29D3YbeuyPXhJ4KQVLuiay0S6KCJ9yKxUVvDS0fSODw
	LHDZA0XHyE1bfjUVOtp2s5Va1LJX66Iyj1X6SoFjcxkZI1jMGa7ZH4qwLJmk5va0X
X-Gm-Gg: AeBDieuwFEf4uO1S/zeFDTeXZiUCs/WCbtvQpyl124VURykKsk7O5xWHIWGJ0g5EWVU
	ucuaEGPDVpsnLYLq2qsOALbBXtyBEgx+4lFjtEu/2rsUzlsq2sNhpI1ZI1j+kY01kQcufYifbd+
	7ePk+YPfXei4nSMYEHvlk4UBmBWxayI/PGE7jXQbS6e9NidbDtGkw/pzJiGbQdKa/tScZMw8Qp3
	jUe2CkW+sNIeHNyZjferjHI70Wav6RzgkqSGXOpUbZ4eYhgdFHh4tkY4TTi6rU/NalzEK9hBuGg
	ctrzPf68GQRjlkqLMVL326Fm4zFoAr46E/mgm/Lou/0XvBGSfaeXWWum/C6ipKBNxp5dGnQpRv8
	Mv77BwaoPJNCPzhz5tC4RKLA6siGa0+wVeKKxsNirwdfXlY/r29QP+dQet8yX7pL7rvYEfusSf5
	evbGI=
X-Received: by 2002:a05:6102:a0e:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-6079973d057mr455251137.3.1775654123658;
        Wed, 08 Apr 2026 06:15:23 -0700 (PDT)
X-Received: by 2002:a05:6102:a0e:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-6079973d057mr455235137.3.1775654123132;
        Wed, 08 Apr 2026 06:15:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c96asm44670771fa.40.2026.04.08.06.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:15:22 -0700 (PDT)
Message-ID: <285a6169-61c5-4230-80d4-795c55155838@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:15:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: Neil Armstrong <neil.armstrong@linaro.org>, jsandom@axon.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
 <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
 <ce9061ea-8961-4d5a-bbb0-b4f50b7e6d29@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ce9061ea-8961-4d5a-bbb0-b4f50b7e6d29@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BQl4_IQcq5WEgWcU1NxXGtrgXJiEMIFK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMyBTYWx0ZWRfXyuCl/p5+ySsJ
 ITwYmW1wjCSzFZp1HBmTzzWaerFg6e8iySRS4WjHW+ijGteG7BADlcMMam+P3qGKzJiki7rliEY
 vljmUEI5v/0CdtK/mj+xuAjC95ujsxvA0448T3/l4bf00vP03tqmUg1dsChMAHRZ3wf3NyqFhBv
 V86aApxcFnTjKF8KdXIOF7rsV5eAFABM2+oFUgXHz/LpelIiM8xNDFYr2hl9T/5WUOB57+2Cwar
 ZJfNhk11TwyEs7/CvNQ+UGdck3WIT2lJWGKuWv+27Rhu13xAv4hS3CuvcL/j0p5gqhw4vg41SsP
 RvyXdjmGlXO2tsP+i+o1gwrj3O2tTmRI/Kki/SclLPQuyOu91fMZrzNO2XJNNq8JkqBC4q8pwlm
 BHm+MNophEYkJaFkdW+ioqQepo5rbEIRBRh545ThfNZnRd1S8G9pQ0mxZJ4oZJQWlRu0PQpSk7+
 NBPuNGCcDSkoRXicZzA==
X-Authority-Analysis: v=2.4 cv=AcaB2XXG c=1 sm=1 tr=0 ts=69d654ec cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=h77gEMGJAAAA:8 a=lEVunVoeGWrKdAki99sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-GUID: BQl4_IQcq5WEgWcU1NxXGtrgXJiEMIFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080123

On 4/8/26 2:35 PM, Neil Armstrong wrote:
> On 4/8/26 11:57, Konrad Dybcio wrote:
>> On 4/7/26 5:46 PM, Joe Sandom via B4 Relay wrote:
>>> From: Joe Sandom <jsandom@axon.com>
>>>
>>> The RB5gen2 is an embedded development platform for the
>>> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
>>
>> [...]
>>
>>
>>> +    /* Lontium LT9611UXC fails FW upgrade and has timeouts with geni-i2c */
>>> +    /* Workaround is to use bit-banged I2C */
>>
>> Interesting.. I was under the impression that it was only an issue on
>> RB1 and RB2 boards.. perhaps we're missing some magic register write..
> 
> On the SM8650-HDK, the HDMI i2c is shared with the battmgr in ADSP, causing a lot
> of issues... the only solution is [1] to declare the bus shared and use GPI DMA.
> I assume it's the same here.

Ohhhh hmm.. doesn't seem to be the case on RB1 but I wouldn't
completely rule that out either (maybe something is poking at the
bus regardless of its usefulness..)

> Sharing the same bus between APPS and ADSP is a weird feat... It seems that having
> 26 i2c busses and 212 gpios available on the system is not enough.

That's only the tip of the iceberg..

Konrad
