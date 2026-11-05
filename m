Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869012;
	b=hFk7TqUUx8dYpHU2dSM7eyvZOwznFC4ceg0Fydm/d2syFqzEsg7krf2dbBnOuaiib9rZ
	 jm2HyKKPKsFvfmnfYOWvVLwENlc5GtMMl1Nrq48SM+tpQfV6Rgc7z7QWDbL3fsqWsfolw
	 fA8aar4j/Gt04o1hXXTBN+arZJAWSOqqusUEr2iL8iT3ifX1cPM3nFGtEGY/F/kwTcAuG
	 UtiKXtb7727gx785tvc2MSymmSuTyiZROHu03y6geq80qWob+wJNNBQ8swYfk1k3E9V3U
	 TIK2y97D5xYJ+C2v/ieeZK65w6ELz61raIk0tbdOahDocAzLTJfGVYeoi6Z7ukS4oyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
	b=vbmzHm5/8EBt4Eul/5244zmYLmeXjOJS5eEVPeK8WBE2CT7m5kxuJ/6Kp/8R1SPEdU0h
	 wW+MkKmra+Irb5g5nsrdbAaLZfzWyg0jtuzrVveG7Q/IchjjDAbmZY1xtHOUuGgFdXPRx
	 COt8BaZ/h3jV7RkdU9X9MYNCSQGN1OswaNmU1uY5tnLrZHTIqlKE5U7L+grHTqS9UMjGU
	 zJ3yoE2tU1q99yhhD8t78v8XBI9809HINBdkGPqOKV9dQbRMN6ovBW2hSmNJbGWkP5sDw
	 9E7SAx4VJZY3jvY7AB8aTl7cWHH3RLYgp2/g4NulrcFBXofboLXC+TO2R5+GPmofTMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFGku3p3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXRZPdzS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E39606A336
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E39606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFGku3p3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXRZPdzS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCrF942020
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=; b=cFGku3p3DX77c7Od
	hScyCf6gq+Ionde83X23nIUfLXVdmqqusgQE6NmZFxrGVZChKwXmWMOt+lCCsaCq
	rS5iVlzBCL3W26ai7m4EjDXwmrdC6MRQBbCIKtsEPQsBO3EfISJ8D8ZQNAicSpZv
	FDxFTLxesGz9rGnMQemaytfY88E8g59ck0Z/Zd5ua/V9DPvMdWlmexmYgA6GH1e8
	Nflk1KAdsKYadeBpXAziTw5UuZAf9cSfa+xtYMR1L+lOyi1gGoKBNPpilmUFXRzu
	2FjUKLJrD25/I/2NqfZnYl3gIl9E6ZIGZpxosFpJHcEz4D6HOtzGyBegQu8/BBrA
	YZDWDA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj444n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:56:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1609229a91.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869011; x=1794473811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
        b=LXRZPdzSBk6hG7METAaIvNcKTRuM52N7KGWPG89CSvwRTS5yOR77KVPvYpPijD20IE
         pUH5Aa0tHufuqs/vajUAa35IseanAJ9aqF9Nt0UZt7j+lG1Vur+Q1MjDeDqqVLmhL9Nb
         Bi0c4j/IDEApNQz3NNuE+FK0CwZwTmCTYl7SQXb4w7iKikjufDFoFIUuBffNP2dLubBf
         K27TEOcyc12Oc67libY8ljhtths3DZWi7Dr4BOWRKQEVb3dEqh5YdcZVcPazAsUQW5O5
         RceICo4057hkN+K5jEYWxDVFOCtiQmzlnWG7+kXrq2grI89W7c5E2ZbyXKfVTu/1LfL5
         lpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869011; x=1794473811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
        b=Wn9hnvR83+kVQEcbDKO3itsdtY7dmAMSTPSJZ5MfPYkrDDGx3xdgAuauLA2WBj5UzK
         Vek3k2csFUkYBFBhmPKcEfzB3H6cNDLtkVf1ihd5chAgl6MW3fHmJ4HMtEHP0DgMH5hi
         cxmLbk5h+lwul+DRplQ4tb/8Sd0BSPb/KPIyCbrQIYs0inR686MGJ77KgbXK3CqljnFA
         UuBeB5K2qCA2mFJ+tk1W42wqbjZfApSl5QIXHcWl9P6mA9BTbKp6XIzt8VwohAivb3zH
         25I6Nh43gsZ1TDf0J2UPWjGqOPLjpbLj0QT7XdtGJddPs+B55DMo0aulnPq0xbgSZBAW
         5Usg==
X-Forwarded-Encrypted: i=1; AKwUvBwpTb2C374TxXExVxhisuDTrpt5EjNF2y0Qqyd5mire0efZBowrGxcPWLtQQfy4gKdxIOxP0Z66NzEI@vger.kernel.org
X-Gm-Message-State: APuU4Z/OcFm0ouJlsccqFD+BhKGBeyyZJMMmpJC1xRpAB/LEMLF8bS/n
	KHc5Fm7t6RsfFYn+XJ4hQemB/+Az38bBqUb+DZwtSRcDjCU/+lXwpCKSAbqt/cXRm3fS4VrDUzn
	TlIYyu5SlMNbIu2g98eX+bsgrOCGFPEDgxqEqdof7216jI5eIT2j1I4oD/dgv0HWYAkhj0nVm
X-Gm-Gg: AYBFou0fjCyCv4Qvr2OidAeAzK2ONeDRETwT8jGNPRWWruuHrhhLUbrxADIhO/HACnd
	ocOx8Kh5XCpir/i91Mjm0xw3an9U/q5exv2EztYAMptfQYaX6a8qozSLv8Y067tGuE/HA/fRW9H
	Z1AxsaZWTExpOSnI2AbQ9kaMapbhWo39bln+ghqNXYiw8tKlnHQMbY5F/XrEp3o9cOYH4FgYL0I
	impf2AkmSl+ixp+VAeerdXkk5Lh6mnBn59iVBo5VrbpOXO9k8zpeJ9wTUufHNP4TwaOe8hj+Mav
	ImF12KWZBgyrPRO0iA6LlWzn50raSwt9I1EzuYPFlT+TBIM0gFSVU5t2Le+ahaoNmozM5/e3Mue
	e0aofeZGhMsdplZX6gCEfNAjCFeZD/9/e6UothtvVKCY7x50vKAUj7VVG3rxIHglLlNAhGqwp2o
	nikWLK4BY2aOIC/bJklgD2J6FjsU7fAUfC1LaGL87W8g==
X-Received: by 2002:a17:90b:33c2:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ae897e076cmr13614227a91.54.1793869011141;
        Thu, 05 Nov 2026 00:56:51 -0800 (PST)
X-Received: by 2002:a17:90b:33c2:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ae897e076cmr13614209a91.54.1793869010516;
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
Received: from [10.133.33.106] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31f8804sm2910640a91.17.2026.11.05.00.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
Message-ID: <f8ba83df-f149-4703-b0ed-a7fd00608cbc@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:56:43 +0800
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
Subject: Re: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
 <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
 <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
 <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
 <4edbe80d-f1f0-4e85-9973-86da7649e9bf@oss.qualcomm.com>
 <1a83f9a4-73c8-4a13-bd53-2e779f6ade22@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <1a83f9a4-73c8-4a13-bd53-2e779f6ade22@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX6p9Pz6svdLjZ
 VMHMvatHt3bEp0yEKOvdfigwQtlVpDuOqmqishCCiIl8SaSnp2FiQsmbSdk8WSXeMPOzFOJekAd
 KdZD1EmoRtluh/oRrQwg57IrnRM/sHIt9zK72EX7QIedI3FxfoqLDKPlnI5l8Ajg4CNtuQvMAN0
 sISBGLenD5yml8xj3s1sSsfH+ArYMSFoDMRo8SVRinxzWfShcKajzR5xq70n18gpKV2VH5puG1c
 +LQHhQ82PdJt2PiVhRonuGn6GKMf9EJJ1rfTEYXxKzGAahp4n5mwiP3mK3wyFSXIYJyzq8Stupl
 k07eMHV2ZhAnTQkK3zmWpG/NbVO9rdm/+x1+JJZKBUz+YslD38OopzvYZOrrD6VxTYUw1KM7j3D
 JKfy9qXOqkx/CCZYKY9Cr0mdrjB9skxGevNlpNY/EBzrdr6EjfpJ0PWjv2jYd0r47QVSyF903P9
 zO+X79VuE191RckJAfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX4tWLjY9Rm61A
 VnwZafQI8Mi9gk/1nw3ogF9m0+Ogj85AdJ2zfUHvODCmjhyFxIbWzJilwgWABsGGyujIOSWg1W2
 VzV7ML0knqUzfk20oiSa8Qf54Nt7XxY=
X-Proofpoint-ORIG-GUID: -STgb5cKFLHHVLQjNwTLys-P42E-TQgn
X-Proofpoint-GUID: -STgb5cKFLHHVLQjNwTLys-P42E-TQgn
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec44d3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=yLkMS7TIAoMVBHN_cM4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035



On 11/5/2026 3:27 PM, Krzysztof Kozlowski wrote:
> On 05/11/2026 01:48, Fenglin Wu wrote:
>>
>>
>> On 11/4/2026 4:44 PM, Krzysztof Kozlowski wrote:
>>> On 04/11/2026 09:29, Krzysztof Kozlowski wrote:
>>>> On Tue, Nov 03, 2026 at 08:51:17PM -0800, Fenglin Wu wrote:
>>>>> Add binding document for the haptics module inside Qualcomm PMIC
>>>>> PMIH0108.
>>>>>
>>>>
>>>> Why are you ending this? On what sort of ancient, downstream fork are
>>>
>>> s/ending/sending/
>>>
>>>> you working?
>>>>
>>>>
>>>> NAK
>>> Best regards,
>>> Krzysztof
>>
>> What's the concern on sending them? I don't understand.
> 
> That they are based on 4 months old tree? Or half year old? Or longer?
> Try yourself. Does this apply?
> 
> No. And if you tried to work on recent tree, you would understand why I
> am asking.
> 
Thanks for the info, Krzysztof. I was working on the tip of input@next
in September. I understand now that I should rebase them before resending.


> Best regards,
> Krzysztof

