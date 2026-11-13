Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566703;
	b=yV1zWh1GRcvbNOSsHybwjdOmubGsGuqJDFNIPcktqO83MVubbTDYuzyz2IWgLT5O5hG/
	 db+SX8+4Xt6Dw5ejJEUFxN1sR3/9upmLq/6E3sZ+EDoeCathulkqKaE1pMsqcX9pEcgzO
	 EtU7MFqU+t0pPwlOxog6r6pBl6CR47CsCsk7+bNsGCpP8FsG6sczh6iUnuoQOm0lZdQFW
	 qFRyYyhHxhBwsZdPm/Ou3yEqBSbZ9XDHYsPGRT9FFdJMoHjnDI+08xOD+migIpCXfp2uk
	 soh3AaD1UMP1RvxFzCLgxwQr7ZefY1c5P7cmawzu9Nb53ctQ/zv8aEFFwBwdJtLwaHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
	b=RJcydawz4Q4NWmGISesl2j6WJacyroDQdFy7FdrvHGGlbyjPL0fS5OzHAoLw22Gi7mSr
	 YLIy7ybChzotMeYcEqUNBk3TsXQ4OX+XI6HQA+GSeVzi7cVpu3HbFq1s8EqjMWHoy8kkS
	 ppnjCdRquih9whZRr9xFpWvEpzrvj0C95zgcIT7LLxntFqGIl1a/UHBfakKY6E1DHIzjY
	 rW0aJSdZZmqCdGhilkRWBcGyrhdP/SGtD8QrgEyzLdxCecHDo06G1h08jOfwbnYfKArbt
	 lNCRc4xsPC4U54Mu2DPu/4PtmqUGsVXYmO2nyXpT0DiE3NWRGFS7olEEgFxAE4t7ZVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QLA7Mo6c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG4j4S70;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59862606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59862606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QLA7Mo6c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG4j4S70
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V3J74101740
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=; b=QLA7Mo6cLIZZjf82
	qk7w1ss19fAqrQxUtYV2M+uEjrZ1uu0mFeG4b43NEscXVF+9pW/XHNwLWpcQS77s
	6dmMqW2NsMZ4g+JTwFcrpCcXNcdpoCNp0b7UvYsu4oSeH3/3J2aOFCZQSZVKxFTR
	TxpthXxc9bCK4PNfTGuX64k6qH9U7q2JLwmdyR5qtdQnfYoNPB96bnJ9IiTY8sjt
	epv2ng2Oew3L1krcTqeUps24WdNz4upXKvskRDifvYEPXr9OYKlXDo294hkCOfws
	uYUpsV+KPrHmtDgus0b/4a8ZTLPFRTgpIV43Qlqz6fIf6fj96mL7yMxei8O4slDn
	ZcXEwg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjrx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:45:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso916246eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566702; x=1795171502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
        b=fG4j4S701Kq1/hZBqE2+DKp2rEL9Mlw8nTrVVMQCMtSpWkdJPmLjEPKtYHeQ0sSap1
         WIAlFvoXMYY0nS4x4savN3Pz8ajxvRUjRfo/GwxoKVf5uge0dmAx3LLBBXe5BYuHPO7E
         1Gy/t3WdMQoSwgReZWYG2Ol+lV3/fV0JIfqdMjjlrpE2C8PCDgTTiZWy2EcyAElKqh73
         gWd00HbK1yAAxYwYANAjuae292RZWzulssgOrsCoTiW+mkslQx7FGR8YjSAL28+crycG
         lhRxiSzbb5MvnKd3FYN0hiE8OykROMTXWC16KqcidZ9pHrdRGKPGzbiKcYH3YJ6jbCb2
         Ltxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566702; x=1795171502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
        b=QXwMbbGcWWDTgwMgpQupLtECvSYpyAtdgO5CEh8o9O+V/85mjDPsZ204i9Ghev0Pi0
         OaA5QS2KA9PANAGLMkLWCc1XHbV87yTglBMcmiUZKuYTgw6tWcKNMRLYzNuRxSW9SRyU
         K5ekQULxHHIRKzlUIxrEuyeRn6Y5Z7gE6tPAt8HeFkw7imkKZAvM8wK4Don9+qZQFEqf
         W23hPgZ6gFPvscbyy/ZNrwxY2HneKfhWt5lmKsQuPZ0hiG71zXcAi04aKlrXMRRBR7ro
         csU8N3wY2P6aDdhs1XgqERU/6GG1YDudhMrW8Lwlu/2J9tQygNYVgxZEL8uB8TTXFhyB
         AGfg==
X-Forwarded-Encrypted: i=1; AL+hErHNkR3/YAb+kWtN4ybpHPkFOko+PC6AIyG3HkLXXJO/qwwlWQCCLLHkoPH0u6N/P6dRncvYS9f061gW@vger.kernel.org
X-Gm-Message-State: APuU4Z/NHdPGeyL6uAEOxUH70XL7Kbo0+JjXjCvNhp2opO4IFIg+OhrG
	nHw/oRsNTX2TpRPw4Lma8vtjtrixWHEPa1S2omNah+XU6XytrOENLXV+4vbDfMg8eWU1Cu9nWg/
	ynWKkzs9m3YoP6ooZwRqqhX5Q2IunF2v5f46syIE4dsZz/J1IdbLh+/JFeJkfFuBQ
X-Gm-Gg: AYBFou03cjbdWU+LdU330iRaIxzux+HmDU7Da0GIn7Je1EGAT+GVtJbqj0QYDIh5gw9
	oXSrpCH0iT3KiAtGJZkw+zq7UPiH2XiieXOS3ixxLBTU57vuodDiLb2/1jpLs1fehYIu9AkS5EK
	2KuBJRj7saxWoLVM5/um1xD5TtdXKwFTv+9Moa6f9HNxuqtwkGr1DO6To7ViAN2vxAzp8Q5V8re
	I/++oOMLEkyx/XAeRFBxV0pLydSqn+rMEeH+FJJ/dMgCFXEfdogP7jwhALqz7YPO+ojt8+FTcAZ
	Se96aVfTxc7vO/HiY7xo+sfVU+jtQgSWa8BTy0Qyg9+k/wMgaAt6x2g155jYIZdMiI7zh2Xc7ED
	tkVAjfrjQ4FgnnitWAxUQd+giKHhCIhOur0B8DmLKCvqbXWPzSTzbngTrWR/5yZ/yXQzIbSNBuf
	KK0Q==
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr1882075eec.32.1794566701695;
        Fri, 13 Nov 2026 02:45:01 -0800 (PST)
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr1882040eec.32.1794566701053;
        Fri, 13 Nov 2026 02:45:01 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm6746586eec.5.2026.11.13.02.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:45:00 -0800 (PST)
Message-ID: <a476c249-74ed-4b23-bca0-13b8ae5a2888@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:14:53 +0530
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
Subject: Re: [PATCH v2 02/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm QDU1000 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-2-d5f575010427@oss.qualcomm.com>
 <20261109-sticky-caiman-of-research-65e9a4@quoll>
 <28202f96-f234-4c7c-be6b-3019e119bb0a@oss.qualcomm.com>
 <c068e21a-6dcc-4080-a35c-8f604646aef8@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <c068e21a-6dcc-4080-a35c-8f604646aef8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfXyCvKf/dDNi0g
 iphlxWR/4tRfDZc2Gl0W0ag8oj1Mv9UopI7gh9Otl/KC7MK85D23TFsPtjO2gJSPBnnJnUAWjI1
 8nAy1CnXJd3Sl3ngCrWYcIFa5I75DZI=
X-Proofpoint-ORIG-GUID: fgVAN4QfyTbM91JY5BdMLJUPQIUB-x2f
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6ea2e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Z8WexQQaEhEqRXIjmLQA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX12DESZYSgVRB
 zKYZ5+yhGSJkuAbutldZ1/Q6v7jrqGjtI3PXB58n3D3qX6aZgRVLGnL8ZZbc/V4BzEl9acbyPQH
 po+TJRTvKrjCaBo/oZ3T/8tNuI80iNZoP7yVQ5GPMSICmQQ/351y+c57IciElGHnX5CzedJdkVu
 41Nyc6ZqElZz3pfqgq6HY/mQw22Bgkr2M+dCxUDPpp9WJmtdZ2wXisy6OFJQOVq1VBkNSY8m91S
 EuBkEIw7dbfMN7G2lT5uVcNJJ2yrRS7Ws+d0ImGu/QpoXtpTmeIR66sNEJqa44mVGqQp2aLdRCs
 DhR9112Ny2CKkhOWlgzs0Z7zu7rmaPDPHp6CiQuWPyphOpjCycc9TexNGVxqnV6MMXKV2/bWcG2
 ppjiQ0XfJasYmb8nLdwNw3z7bdZWQJ2S+e8i0a1nTcJGfltRCspnxa9IgJBDEbDPqHp1z3NIIkx
 5mpzgUshbc3tyZFIloQ==
X-Proofpoint-GUID: fgVAN4QfyTbM91JY5BdMLJUPQIUB-x2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130042



On 13-11-2026 12:35 pm, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:32, Imran Shaik wrote:
>>>> +  The TSC block is a timestamp generator that maintains a running counter used
>>>> +  for system timekeeping, and is functional with just the AHB and counter
>>>> +  clocks.
>>>> +  The ETU block captures TSC timestamps for external hardware events. Each
>>>> +  ETU slice binds a slice number to an external event selector, and
>>>> +  generates its own interrupt when that event is triggered.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,qdu1000-tscss
>>>
>>> I failed to spot the difference against your binding at patch #1. How do
>>> they differ?
>>>
>>
>> The ETU interrupt wiring between the QDU1000 and SA8775P/QCS8300 is
>> different.
>> The SA8775P/QCS8300 share one summary interrupt across all ETU slices,
>> and the QDU1000 has each slice with its own interrupt line. Due to this,
>> kept them as separate bindings.
>>
>> Can add them into one file with an if/then on compatible if you'd
>> prefer. Please let me know.
> 
> I see, it's fine to keep them separate, but you need common schema to
> define common vendor properties.
> 

Sure, I will introduce a common schema qcom,tscss.yaml with the shared
properties, and take care of overriding SoC specific constraints in per
SoC files.

Thanks,
Imran
