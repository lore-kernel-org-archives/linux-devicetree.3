Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C848AE16
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635044; cv=none; b=XieMDvs5Z5s0FSu0VoSIAiwushjgc856SUW8Y2fLp7JKF74OS92VJWNF+imyIz8SrapWOlDVZe7GZbHSOSkov65zN/QqiC4dvKg+fpb3E0eDcU8r9ubivFP/VQ32l4/utN53Lq/wKLAXX/JyBc2F2ScG97hugNVni7/7qN3BobU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635044; c=relaxed/simple;
	bh=1jija8OEh1ywAonQwvSdwU16zTNI3SofStphjA8zOO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+7mj49+WJ044TemLgFQZjei03F5ZcvguGBN/TwrOxr26yVmfilnSt+6sbIYHpnkfGn8wYbVO4MvUkyMRcRi9y9w+x0D0aBtcmnxb5O4QwFPmNbO3RRVMu63Ic5UjLuqFk57oeBJD+0NQTd2neKkIrxSFQnkkrdyNWO51zYtQ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxEWXsvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pa18d3kh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxEWXsvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pa18d3kh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARuer1252105
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qjUmcggw2BDTIheMS9xNdAXdB5QLoEoMkHyDe70LSo=; b=AxEWXsvmLnem4C1t
	lwyJ1oFsdXoZs+pr9V/XnenoxPka49AiWHKB60eTSwguPTKPDgWCs48vLJJaYlte
	NUwKAeh8LTvZ4LsgfPutKBrV8gO6Pz7FOpWio+113sV8ifJpE6ByVc9Ns+qgXk2X
	l0a3nUkpevNjtHaNfyPmExkoXroVoEiJH+OzePReWoWmfm+ePUU0JzU/TTM8MDzi
	laIclFSU4IeCBPtQ19Qq4CBlevRlQKALv9vlJxioNs9oFNfN8ntucBQVW1u9jVaX
	rb7oQj05ajoTan9+B2M13vdtLiVHfNAN34ffeGvosnDf+aS4we6iuqVzuG6Upmut
	KChK6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvccb5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:57:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso214410885a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784635041; x=1785239841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qjUmcggw2BDTIheMS9xNdAXdB5QLoEoMkHyDe70LSo=;
        b=Pa18d3khmcm43ydtGEGAC50dPYECvHnfiCysSBJwOYG7dAfhjaBNG/34+q+F5QXlpK
         rUedYKxhfb2l+KclVtvAdK6hHkFcstdGpFFnoDuoca7wcT+HPzIq4f6qY92XwOt37myZ
         H/bZJaWimiNNKaGh7auEwqD2PqK/m0cZP7pzTkd35mCSsiBQ7lR1GP2gzasl4eYLRUoS
         iN0qD5lk906MCWs5ismXUZgVPxDI9iIYINTi5iV0rYqwf74GGqxfmJtHJ3sTUePg/xGO
         NrE/M0HFyP6nRQfdk5eXtjAkUWE0bbNnWVwhOaHfZWeINXJbm2n7brkZXvw39HEirWhR
         wMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784635041; x=1785239841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qjUmcggw2BDTIheMS9xNdAXdB5QLoEoMkHyDe70LSo=;
        b=Oaof+pdkHnwBp/kScSoYOJH9hDMfywpVP4VktWnpZDLjb5cVbic3jq15TBvkbNBNG0
         xTyz2nax3m2r4qD4wkmf4oc4B3/VsRPlJSpKcXLC3SRzMxfjWJxXJvIgUYIoDV3JPjJW
         1IDkwnkVJiyxBGsHtHckchNPRzxDiNE9suKdoZFGXb2WhUn1q3dKyLJHcWSmNQqwBNGl
         Vd+86Iqu4uAmty6nOFC6Wo5Qh47CyH1eWZXM8qEkI70F1IN7wnoWnhgR8Is0iSl2vvtr
         K/X7U8r34iyazoYl65mYxxfAeaIzzhZtvFdFImqxtEQDuGt5s44pqWbkuZ2rXDcbmTeL
         VjCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKdm3DRJxCqFk4WxjPFqjkW1Rjhez/NPZrY7KRMp6fBsBocM7kH+xcf5aLcX+1j2PDDWippVVmCLFu@vger.kernel.org
X-Gm-Message-State: AOJu0YwxkFTNvowJydvxbRSll3RIPdmAt3Rd7ViZfGguj6GxwD2j5oXo
	P8wiMZzEtRbxr1xkOUHebrgAFx5D7MkP4GrNY+ivdUsXwSsGWbr+2R/sWRfttsxcSjodOYEpxc5
	xIt6zhdJJwkMWgo7FRASkQYz8SPsF72rEjoRZ8dZQ/HXzc9aCTDGZ75MEmzECsUWw
X-Gm-Gg: AfdE7ckf6OqCblnZvGgr5HfPf3qt8qa/knHd8CP+6oknC79Odj+as/XqsuLTK6S0bv7
	f3qwfs9Xbq17ZunBPTCz64cb1nn/fFRFFh7yT7y6ZeSWqolkktOvXfDyOdPEQHf09s7LEZjbTs8
	yvHgUqbq/RkX/8BEBM/D8pyoad0/zJIpUqsR73bphDGnuQ/D9u8xAopMshD0WiWuty4MdI4Sc4x
	HQC4pr0Yac2bVrvDestZiCpIaYEkYFzZw/xZyGg2zeWMYyQLipUo1RERWsdR1bR1RGTGCfBj7Gt
	pnAa0T2FfZCfNU5urELlz+GE/6Gm7GsAuDT34/zjowK9G4YAPUijVEWYoznitnvpnSsY7AKa8X5
	qQkydjrVfcXqBoAmtNXm5+9Im
X-Received: by 2002:a05:620a:371c:b0:92e:6485:f640 with SMTP id af79cd13be357-930e7051f8emr232653285a.4.1784635040935;
        Tue, 21 Jul 2026 04:57:20 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:92e:6485:f640 with SMTP id af79cd13be357-930e7051f8emr232650685a.4.1784635040424;
        Tue, 21 Jul 2026 04:57:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fff537csm5702136a12.25.2026.07.21.04.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:57:19 -0700 (PDT)
Message-ID: <4fc9743d-3d9e-4130-9ffb-b64318a8373a@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:57:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,bam-dmux: Add
 qcom,shikra-bam-dmux compatible
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>
 <alXhHH0mGvFeUMd7@linaro.org>
 <3a32a44d-4044-4270-beec-565171ad4bff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a32a44d-4044-4270-beec-565171ad4bff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyNiBTYWx0ZWRfXzqgztrpApO/O
 +vf12TxrTcqAFcb5CKJRqtjTSyYnhvfIRaQeifShj80ZtnnnHyifCngwRAqKR96XVrqCYYSZRad
 IQn8ymIspB4Qw2rSghE9j44dNoNTrWs=
X-Proofpoint-GUID: VIKFLKZK19bhceCKaQkA9OWex_qlsPgQ
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f5ea1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TTPXGskHRsZgtGffa1EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VIKFLKZK19bhceCKaQkA9OWex_qlsPgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyNiBTYWx0ZWRfXzRiQWmwCjxqg
 m5KhKCa6AoEl/CYUrRmqantxiHqkTtQVcxDceAQdSTX/lWlBJ0W2FvHSvQ+lpSZ+sNFu900qBHt
 M0HaMqmViJhLMQTn8H0GpIdULTewAvPjPWySo8hTYZydsIlZbCvP3aDVMwwnlM40JBJmkOsoKG4
 8Smd/LiFjSqlL2/De6GzEGLX/k1ydpH4h59sKRcScRZke/Kn31sDZ4BN2H5u59tbf0LkgE2py/h
 9bSxit7V9x1H6xSvht5Z7eYMVO2AdT1gJIK6x3RY9SutPPc7aAsPoXMKegz6ZXWTe1o30wxeygo
 NoJ3nvH+oTZv4dwm7zfM8UnTnC/iJywMMhOGoWWfgqdIUHZHXqhCVQURmpPxZq63h3uWkrv77l/
 rZ83uY0LNCxv+/IxOzjsQbmrq0AiTb53rvExepdASD2CACQXnyhKr2c9m1VbF6sNLhmu+gYPd5Z
 vRTqNDJ2Rp2DSqCBsDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210126

On 7/14/26 4:03 PM, Vishnu Santhosh wrote:
> 
> On 14-07-2026 12:41 pm, Stephan Gerhold wrote:
>> On Tue, Jul 14, 2026 at 11:02:31AM +0530, Vishnu Santhosh wrote:
>>> On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
>>> the XPU enforces per-region access control, each individually
>>> DMA-mapped RX buffer consumes an XPU resource group. With only ~16
>>> groups available, the per-buffer mappings exhaust the table and inbound
>>> transfers fault.
>>>
>>> Add qcom,shikra-bam-dmux as an additional compatible for the Shikra SoC,
>>> paired with the generic qcom,bam-dmux fallback, so the driver can match
>>> on it via its of_device_id table.
>>>
>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> IMHO (the DT maintainers might disagree) this is not a different
>> BAM DMUX hardware block on Shikra, just a different firmware
>> configuration. I'm sure the existing SoCs also have those XPU blocks,
>> they just don't make use of it.
>>
>> Personally, I would rather describe this with an optional "qcom,vmid"
>> property similar to your bam-dma patch, allowed for all SoCs.
>>
>> Thanks,
>> Stephan
> 
> Thanks Stephan. Adding Konrad (Cc), since this compatible-string /
> match-data approach was his suggestion on an earlier revision of this
> series send for internal review, specifically because BAM-DMUX is a
> singleton per SoC.
> 
> Konrad, given Stephan's point, would you still prefer the
> compatible-string / match-data approach, or does the optional
> qcom,vmid property (matching the bam-dma series) make more sense here?
> 
> Happy to go either way once you've both aligned.

This all depends on whether the DT maintainers grant you the right to
introduce a new property and in this case I very much doubt that

Konrad
