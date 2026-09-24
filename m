Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BF14078D9
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241375; cv=none; b=hpimHYjm4Q8eBs+zqO5Rl0xaS79cWSv5/cG8wxeZiApAmV3qyofa7oeFHo6dt/cE7MZpZ6ik7x+zuSEO7VUF5cbaA990Q2CdTSBCY4jPwkGMstQ/hw0qU0E5XJ4sPmQ8iJzzxD3y9+O1gL1kzglBY1ma7IeWjxlG8xSQ3ipl3VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241375; c=relaxed/simple;
	bh=vewmRmetomWN/f0y0O3jROqLs8JZarNqoE74wYalsqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlA/FJoqVaQt3HOLGxyg5C9kSc+04WpbvUu5h0Czhoi6Gjl8FhqMO8p+BJ6XwMepJMkSFKZGaYF3qfePwd47mYz7DVMNHg8yiZadF+Rv/k4ZMddfkDFxYSJGTg0k3bEv83mgOmnFvWi4+QieRh2iRUKMLyKJ5D7F7gce42QrPaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZeQjDsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctTlX+sh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZeQjDsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctTlX+sh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eKiU1898759
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O64k/r6CyhxA1FU/Q/Zk3HO6+8HRYJQe0QxJg2dFEd4=; b=jZeQjDsbU6lJlAS5
	a62BH+U0Kce1JfWh2cdG5byqLJ7NWSU3oLWYj2IHoMipay6S0vMiPztjwIP5ePR/
	jVQ4mlwRJfD/eZv8oC5nZKMr8d/SdcHG50fQdepv3qeSMgaUe3xdGq8KKPsob17K
	UF7VlSEK4ez1F8oSsH635l6PhkeCGmUNRc2Y5/LfILkE6RSvN/Yn2eHLnFnLLZOn
	zWEm91ry9PMKNl5FYqyrDWsgA+z6vjd+xlz/V8ThgSnaS8qE06trV/wM7hyjFRA3
	+Fz1iiE8YNfbFyM7nqqaC9001Sk/VgEq8Q3dS+xhpxm9mAVPtYPhTJ1q2jwE8uE5
	7/b5ew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb64uhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:16:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f8e7ff71so48551485a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790241372; x=1790846172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O64k/r6CyhxA1FU/Q/Zk3HO6+8HRYJQe0QxJg2dFEd4=;
        b=ctTlX+shB97ninlwNeuR8mGrbeFcwJzMTuI2Lrs5ycb5vR8vzbFLjqHm7cFXQHThLq
         KyGijPaEFrlncbbaMkfGwpAF4d9u6+4+rsOWIjZ8hiBEeCDqPUTDc9q59VyPBVRuWPyt
         lcR5jhwr4JBQVhQgah/6ZQwv/PAuunWg6479EvVGFOUSSEN2lhsuWZThCRM+4+inqosd
         S7fmWbBH4JeGKsa5ZGt+MSi/KlmrTs5JBgNd4ldGRVN+OMmMRLYWHiKRw0z8e4BJorun
         FqdtJE37Lqt1coXdFJ+tPSmkCypfNtY45s0mBa4BU8a2MD8fLrXY6FmNa7mlmKs3PDWe
         3SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790241372; x=1790846172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O64k/r6CyhxA1FU/Q/Zk3HO6+8HRYJQe0QxJg2dFEd4=;
        b=BAMTH/XiPunWc3PtRiiXIR25nLfp7qqE0qAdRrlj+0+60/QCZeMd7BPv0mzQ1GszTR
         7vUV9uKSlcye1YMh+2854HmkrzQtjAXCXwXCqiIbxoV694ZGT3XCr78+nI7a4JH+gQrz
         5ThJi1pPrMnlv972ur5IOQrWwl3knPw+APSH44gMaJMsbVAvAFd+ij/qL6ySsXcgeCw5
         hEr3CEKpSn4eP/epAmQki8sFOBP1eR0Ze3+6Vcu2k4ka0Yefzq/8KWCnLBYE8LeQfFg9
         zJM6t2cDBupSVcfsSdRAG8yAPoWKkIIMLD/Zdq/PRwyvoYrlT92uISjHvI6sbp7Gihn3
         tBSg==
X-Forwarded-Encrypted: i=1; AKwUvBwVt9pn1ag3eg6FgY0p1AdiOBXjit70nvP92tXYaXZg7ywDH55caO5VSnElK3PG6WZcgyzFMFED8nN2@vger.kernel.org
X-Gm-Message-State: AFuF++nlZdzRq/dzEYZoc/KsxlU11vSb+rr3SVziNJt86oGnCRijEvSe
	DADC1l8zA1ptJUgYNoqTxfIp5AR6fB2jqouqVsal3HzxTEt6olapmDlwu6WoP0WzueArCQ4Cz/Z
	7ZUA//uCUv6cHz7qSsHDDBoKD2IBk4BQQwSLGBjNNUjChtPvp1obe1jA4y4l0h0Pn
X-Gm-Gg: AYBFou0v70H4mafdjo+6aX5ePqbyn+PupzcxAte3noB/XgIqYRdTJa0q6OVLBPlTf85
	bC/XWx/Wkwqy9ZXKjB8teSqC5zmef/pfBa5ASGgePMcGXOQY+4xdb3skfmpRI9Ra/nqkUe8pCpc
	AfSdfpylWu++PIl+jVOpLaDHHIkGLLhzDwo1OWjLSVDK3Mjb53G49f9apwmjA0kJiLEJ50eLx71
	CroOFBIb/tr8k8OfP2PxwuNnicih2dx3OifRNO+dIcBPNgepYqcASdCR6sXCa3TyxASYBtpLKPB
	2uFHkXBdg+wsc8mebiitR7sTkgyqtEfFWXYBWL4B9gNZqXD1AbcMAyaKCLCkBqI1aodxghkRkH4
	GvzTSgWBpQHpDySO3QwtB3Q==
X-Received: by 2002:a05:620a:4482:b0:934:95d9:85fe with SMTP id af79cd13be357-93c363bb776mr190961885a.3.1790241372027;
        Thu, 24 Sep 2026 02:16:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:934:95d9:85fe with SMTP id af79cd13be357-93c363bb776mr190958885a.3.1790241371449;
        Thu, 24 Sep 2026 02:16:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6d9732sm264583366b.60.2026.09.24.02.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:16:10 -0700 (PDT)
Message-ID: <6f7d4bc6-ca16-4293-938b-0e5b7ddcb44e@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:16:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
 <16f1b504-c414-4072-98d3-49f60d552028@oss.qualcomm.com>
 <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
 <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com>
 <09715ff3-df00-4ba7-8d9d-52b15e8b86df@oss.qualcomm.com>
 <CAMRc=MfqztXugCfGQ9_x8spNeWGH6C3dHLzdknH42Pt8WV8HNQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfqztXugCfGQ9_x8spNeWGH6C3dHLzdknH42Pt8WV8HNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hBHeedDqn5dA-cz9wqZzpeXaGYM86IQr
X-Proofpoint-ORIG-GUID: hBHeedDqn5dA-cz9wqZzpeXaGYM86IQr
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab4ea5c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OIwW3chDm1YJotNPmsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfXzao7aj3Plurz
 5/suO0Y31oQNOFsQqoVEfSaJCEDefiaLtE0u4+rEQS0VfyfyFHnct8Kbo0E90f3W7Ou80J2sxDK
 NnARZwDo31AH7Odhlqq5xCHrJF+XAR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfXwQPLEXKYYk0K
 Zq2xNP5c/+RYwfxIIL/T0iUGWCoxqP1x6JVtm6yzQvaYsQo723WTBY/ZNV0kNs1/YZcMsI1aOkB
 e5NxuplDU5r+z4FWc/gWR6NCUBjCBw11drwmfmSzao5It7Gcea5N7ROBzNWFO/HVfOqJD4ogUwu
 WdK+8Ois+DSZ/3zJTfP/+ffQQ/Z88eN0dbWZgvr0SwHlDw55BUvbCZ72cF2GXi3pQBXnqvwDdIS
 AYFIeznnFNV3QhwgQahCTP2IFcVzu9IHb9z5ljbiKwKjio0INi2jYuDRlVZlCa1VZbrjbjINGhm
 rwtcLFsmGHGg37xEUM6+MSe6Jt3GXGHx55EEmwnE1x28Z9eGshxRV7/QMZG3M2YcyJW7joEvo6m
 UUW5cQxd5CP5PpOB0qvtFew1VcAzbHyz2WpXBl/Y+Wa0MGY/PcEotTYoNwZE3KguTMz57AcA+zm
 hOhqruEmZM2prJ9BIuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240038

On 9/24/26 10:55 AM, Bartosz Golaszewski wrote:
> On Thu, Sep 24, 2026 at 10:50 AM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>>
>>>>> we should be keeping GPI node default enabled similar to common QUPv3
>>>>> wrapper node.
>>>>> status = "ok" for all the nodes.
>>>>>
>>>>
>>>> The pattern across Qualcomm platforms seems to disable the GPI DMA nodes at
>>>> SoC-level and only enable them at board-level.
>>>
>>> For no reason - the DMA engines may be reserved through TZ config,
>>> but for the past (high) N years that hasn't been the case
>>>
>>
>> There is a reason to reserve this from TZ. Some use cases require GPI to
>> be available during early boot, before Linux is up and running, which
>> necessitates keeping the GPI instance enabled.
>>
>> Also, GPII is allocated per SE, while the GPI instance itself is shared
>> across all SEs within a QUP. Given that a QUP typically contains eight
>> SEs, it is likely that at least one SE will require GPI operation.
>>
>> For that reason, my preference is to keep the GPI node enabled by
>> default. However, if there is a strong preference to make this
>> board-specific and enable it only where required, I can work with that
>> approach as well.
>>
>> I think it would be better to align on the expected default behavior
>> now, rather than revisiting it later once additional users start
>> depending on it.
> 
> If I understood Konrad correctly, he too is in favor of enabling the
> GPI nodes. I was about to resend v3 with that changed.

Yes please

Konrad
