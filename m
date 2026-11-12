Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491285;
	b=OBgpFhPmxZlMN6vTrN8O0h8ZqMlHYhHKIVpL8kwt++7wb2ifCcgOQbaU8p5pNBTfqJsK
	 kRwZWcp5FNk3CsqriVyu9IMJo+6SGCGvNv/5sA1ugPXMlOpeFOgEpsZPwxUqK9/1S+x6C
	 06W7rt+zWvEIyA5I4gRK7lNkAh8Xjwo3SnnQDNYcF9DSFIIeu8DHMpnQ3l8xBvmVgZVjM
	 QfmLRWytOU815mOMZFTImTE+W4tjifVSTqmZxSGarSGxTXtvZYd0z4NNnHLmLZXmb2Lci
	 fbhHf7zwP22SjRJ8tc4jjgfO7MQObLxTZVfPS0NjIuz4jR2LEp1rXB2krAbP6EmOnUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
	b=RFfl7ETOd0101mThehiAYHlY6L6ivQl+e7f8piWzXsI1e/5BQzQAzsV5ESTmNQ5LtTcg
	 mIzXnNFRgseieczlUec3w7Z9L7U36Ckhku3mxjC208ZhDyR96/SwPB5L/gl3t0eJJG1Wp
	 I+V5gQdlSzNfeXuwoehDIPYODy/uDanNU9NF1ogEq/D0lfNRjIr+c7eaAe97ZvzsRS2XO
	 b9opLRA/N7V0jjX4dLsX/TlgvE3viTuffTtx9L/GBFVa6WCOnv1tr55U3hnEqgeA/LVvQ
	 A/Bnf+9rSpenAh9IbT0pLR0QmnNre6lRlt+WAQHD4MX47aPLZ8dPZ98q1QhDa8Iy4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq5ed0vU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=be2W0OH3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEFB606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAEFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq5ed0vU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=be2W0OH3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAvJLv3476876
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=; b=hq5ed0vUkzkNuUs5
	mXglYr6PA/HYKeuC7/0cQzccV4zjo16sbgqlY0VQr/p4uTGzmXQdsEwYrpzn+b29
	rfs7sSQ85pKLLtRqrz0CJMMbwNPKz2UyHLJDT7dJlM289/k5AJTzDmTiXkaRSFVb
	Yb9UANoH7spvuqsMktXYVVGUaZAxSIGUdU71683lmatlu5MwA4MlYWsC2IDG3+hW
	jAPq/lRftHqp+nGO83WwxRognk073p3HuVJoxPVA+PkI3aUsVs0OtGYRMzKg9FYJ
	goECocsSKnSekf4xYWc5aqavga5TAqBN/I4WpOWq0fWd8ffby2UC44wNZOnjq8p1
	43J/cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuhs3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:48:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso133621685a.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491283; x=1795096083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
        b=be2W0OH36Sr+oIDxYJx9kEhbnPGhKxIqWsB5jS4QhwS0lAoiYWw2XSrh2t7gNR0sz5
         ETd36Vw80LM5r5AzM9Gf+HMzho12nbd/qXEaFN0bBP2FMwzCD8t8wga9vqWHGhQV/Vm0
         INAch9nBPIjJ54YDdn6XXIzLxvZMBodMca4OmWB8Ua34YE6ZlCqZn8M8nftisYGHlFEi
         5kWu3uXZzNJp8rOhjzuD790Bua5X3pSmLQfv6kYspUiWXdx2E9dsF1tMB/pUN3/R34yk
         bxk0Xq63VaR7KHcXe7Ro0mFW28crTtCJQQ6VMNkZUzxxwWEYLz6oZQPCiv3YdA7z9vOE
         Y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491283; x=1795096083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
        b=TCtX+uO1eMRN3bzbWs6wiPRVIgxhNRhgaNm5PRvuIi6fJ+4sXtwjjdXJsZqEEqvxGs
         QPwjlc+WHuOHE/3YeCnR8G8SOJorEk+nYE1/N3uLGcb0g96eTPzA6kSUrVVwy6Xzr3QW
         9p1lFsuTgEI9IRuz54puQOjJ/2EsLAZFeirJz7jOOuBMwH7zFB3QdEaEoVvpTbOCJCK2
         ghJqZtUgX3X8reJiTnQJNqDYGl2mtw86U+z00Yh90QWELRIdkNfYBoAnhvTf88yxfL4h
         OF3B/raWQrrrd8gDeSO3Tuzo2c6Z+ELhVI4QU1yagzwqr7ZQDqSuTu3PglyQ0Xbw0n0d
         zCTQ==
X-Forwarded-Encrypted: i=1; AL+hErGkkmNrpVmIMpiJH+q5OwR7k4BFfUG2van738xZhJtCmHGzsnv2NgcZht5dm2VoiOkm+ULrNxR2cfyE@vger.kernel.org
X-Gm-Message-State: APuU4Z/VP+k501YsNkDJZibbuQ/BHA1ydprO124NttLwRND0MGEu1a4q
	6xVyezxLrg+EVYSRPZyCQHT6IrWBQad/Ovhx2ImE5PCSV9H7ly9ttSKLu3+6uc1MOcqlN7y1i0T
	Oxsaj8hTFHj7hELcUeLNZeUGSMuH0+wZYL5aQiGajU2BnJQgiBp3TuetZVsS7olNNYjEkHa8R
X-Gm-Gg: AYBFou33O32H0vWjhLsur7I+YaoxDrH1jGUaeZ+J+pKwgV2K/2OXA6qE0Xma5Mc6aSM
	5Y46sQcbFbWy+SB6mXq9Xh/n3L0pKZSEV42Hl6MYeWmFEjj2fY0w6cnFkgRzGn2RaRHRgLGT6Oz
	xcASCGqTqeE+lxm3BMZ9zn8fMWvWXrYTXdSnuYTmDpZQr3qLeH4VD5K+2AiBUzjqXOeMHepD2RB
	H3kF2JsnlqS54zCZR9uSuaeEfGCgX74IHxLdLWqlWl3N2YQcfo60YjdlYRrEA6CmCUt0ZxBbpBx
	r6B2Wtpks4ZDxehTsnXpyz3/vBKXzTTY9cuU/ZQNKAZwYmlmgtq4ySP8HSo+H36N8H2NxxQmh69
	oIW2CCDo1s55webdwOb+e5TPTmaIxg5w+hqHIwPF4FwDusZEFM9LAzNb4iSOU1cDkw3CCXND9jI
	p1jOQ=
X-Received: by 2002:a05:620a:1b96:b0:93c:9c0b:3898 with SMTP id af79cd13be357-947affc1c3bmr930695485a.59.1794491283062;
        Thu, 12 Nov 2026 05:48:03 -0800 (PST)
X-Received: by 2002:a05:620a:1b96:b0:93c:9c0b:3898 with SMTP id af79cd13be357-947affc1c3bmr930691485a.59.1794491282604;
        Thu, 12 Nov 2026 05:48:02 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c16be05ba1sm325697e87.50.2026.11.12.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:48:01 -0800 (PST)
Message-ID: <c9427a03-8b45-4e35-a29d-7ebe30f07ed7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:17:50 +0530
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
 <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
 <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OFZ03L3Y8HDF1lBoePaMjb89oAXfd9pR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX25eiZ+FQqmXK
 S/zeTn1VM16iyqwfdCElqnhTKehO78UZtv5eKABsOdIKM9td3OHoHJR5ZklCSqF488SIGeXM7q5
 rNONHdow36oaOdgxBNi/YZkxBieunM4=
X-Proofpoint-ORIG-GUID: OFZ03L3Y8HDF1lBoePaMjb89oAXfd9pR
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5c394 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=dNOB8qFnOFInGeeiHp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX3fKF8B63g6N8
 aoQu/y07AdRS0idrXPqyNojH1wdf92CdazQxzdNaiZD2n+khKgY09kv0HO9t1Q/x77FL9TMOrgn
 K4MWLIL83LqIv1Ii0mGEKdfW8CfaZU32/FWdD3cZFZzavhfgWrF/3R6PtMlB7wi1pIq/lviWBCZ
 TkflvZCBgy3XyRPwJSVKDpeXlQPjxtlvgGQrFIw1E2pNOAJe16T4atjFOi4rNKuxfazZg+13sOF
 BmpySSGIihVVg53/sqJW16SsNYx6WyDMH5pzbBljLzvnl76UVXKJBlhhXKEWtpoTlTxQgJdriE3
 p1F2NtokOgto0v8YM7QtyccOEMVb5yH2FADzf0ZzFmO6IEEmArZtqC7J//OUaVI8ZI4CFf5hRt+
 2vsJvJp5PF0rcYp4l0Ao6hf3+D3/qH/PqJJcttEqvVDLVrwQtGqn1evUNPVNm0yS7LPaNszbcUM
 oMNyRJdMJ/AAoq+/6Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054



On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>> protocol ID for QSPI.
>>>
>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>> we add bindings for it?
>>
>> Hi Krzysztof,
>> GENI firmware runs on the serial engine’s programmable sequencers and
>> implements protocols such as SPI and QSPI. Linux configures the engine and
>> submits transfers to it.
>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>> this ID into the DMA channel and selects the corresponding descriptor
>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>> I will clarify this in the commit description in V2.
> 
> Does not really answer. I see no reason why GENI firmware needs ABI for
> Linux.
> 
This extends the existing GPI DMA binding, not a GENI firmware ABI.

The third argument of the DMA specifier in the dmas property selects
the peripheral protocol. The GPI driver programs this value into the
channel's SCRATCH_0 PROTO field and selects the corresponding transfer
descriptor format. QCOM_GPI_QSPI adds the QSPI selector to this interface.

My reference to the GENI firmware ID was misleading. I will clarify
the GPI channel requirement in v2.

> Best regards,
> Krzysztof

