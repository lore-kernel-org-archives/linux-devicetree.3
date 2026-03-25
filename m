Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829213A6B96
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436469; cv=none; b=t0qg44A3rGxmBpf/shIbYqpAJgNZLkmRqyRpZFxLkIteK5EKnEUAbCbrnB3NBLMWqvFPjU5yaWJIjMLOrwiLQE8nzGvOyv3BtioScUt6yOM8xU3tsEs6kLqm0KqOPJu8f2KE2hYwWfJE1EGADE9gw3hvVNVBXnzmWNlhUj3EgPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436469; c=relaxed/simple;
	bh=rqGnXxoqdAugxHvA6CzEp0CYwxmp8z2ymbpkYHo4E4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qm4nPBu4WGdmWKM+wHZU9FyyFkDpDZ3CdKSHiJDGKFZtYb8f8HI3tzpxMrHK/hOyJRhqj/HChMbfhB1Yn/BZ1180TatDu5SIEogkOgW0LGIQUov+YOBqOUbjRaUwAZG7TC5UUUP2BL1M//BtvKhDAQXeFRhzGVVSEODBNHv6e7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LipQJGIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8xUJWar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LipQJGIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8xUJWar"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PARAj23110460
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGtV6zDVSwgBPYnSRKOHJUG196PP0EnvE8OiixR/6hc=; b=LipQJGIyEmtS1R07
	LHh+c2e4syDdNrMrv2NvjiCjcAF2MONhFi5dc3hgYPYo5/C8RrBaWe2r1zMQtRhm
	4pD0w3WG0/bEtJNQp4s2DkER6XXXfQQUrd1vBHHytJs12hzbNBTuSQnE5Qizc7K0
	VVVx/8qC578XCEhe/G1c/MqORtVpNddgv/S7ZSAQDgljZ/aCzaIJLArBRMgmiOpn
	xSh8nfQstCmJvwqH2mitLpKbYGzCQi4zoO4OXop+O3BRtP6ggzIPq13GmXSUK0+W
	Ca4xqIrKbkGxTg48/xbiwoIshr4qGEJBGRjoOpM9rivOdk97LhD0cev78qAARyuv
	uAw3kA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvv3va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:01:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60274569cf9so836459137.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436467; x=1775041267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGtV6zDVSwgBPYnSRKOHJUG196PP0EnvE8OiixR/6hc=;
        b=N8xUJWarQLBFlDFzzXErOrDpvB60X8LO189DcsW7qIapemhOcdXylTRPjdtwU7vL8b
         XT++fn+g0vArKMWsad26OIJg8W/DnrGpfWFcGrDfaGvbM6z4yt4r3TLciPRQHCDxXSap
         6N0tdVrGLYUcGRhEweAfPhKyIs0nGnug09gFwS6FrVGK8sjtPFFolltUhERXtBXD2c12
         v1K3BGd4Iq8pBkIcqKPaAtiOB1rqiO8ZNnQywoMlw+tg/CqpIyLbOGDP8tNHX9EfD/Ah
         pWlhOmiNyYc0X9ls1QnaQ+ruKveRjiZz05spzxuJhL6otDlE+Z+z3jxPN8ZbmfYyaeyh
         7nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436467; x=1775041267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGtV6zDVSwgBPYnSRKOHJUG196PP0EnvE8OiixR/6hc=;
        b=NEdzNab8EZNDOOT9OoXWpnEdUp5KPvoasI+Ut1nARFNHRfva0JOVH3EsryCqiCmBm7
         vQEHBhZ44a4rFqe7TC86sIqN3ePBuTMddv+F0j8xYXNPtKT83MdZ9z97tBCwq7vEo57D
         OJKH2pX7X87hrBuXQqafIgZZGygGvavRlvle3VFV+40rAyU7q4Q3JI9ZhrOU3qlr7F2c
         i1kxAOzhcW4yEtwGLQKx895LViJ1YAyf8xBf6QfprEvkCXV35PJ4WjGb0cFz0xSkxi89
         YNXluZSX3AOvJI2eKO8YDZcc+8pQsUvBZptA4jjvogyOD4bq+ehNqExxsVpXpSWVw9C6
         oiSw==
X-Forwarded-Encrypted: i=1; AJvYcCU+b5NUCuz56oVMuFNz0L1JTZ5P/Ezs5PrDLwKB/g2k+UzfikX28cOTyLNuqj1bUaC6Oi0wy3XO+Xmz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qgQvZCfp30jJ97W5Nr1vBOnyUczg+iMjFn/lmkr4elF0gzeM
	O0CHd1d0+u3FLy/EfOcuM20q1JLJpisFlR8CGYZAWzOQ2Z1IrIek3Xo5OKtp4MfFhxc8lT5dV/c
	GHNfKRuAbtntpfakfRoK4+hkHsDncdcgEGtKGtuBtqD1dr1TsnQbqUyYafC3P3rRA
X-Gm-Gg: ATEYQzyVry9FgqBmyWaMYdOzRafq92pPBa2hBiZgdAIZugYc2keyIS38u9uZlJAOIfJ
	DIWubbSr5ZYJbsBh+BqWs1eiRLKbvTnBWdCrSKfDx7LYYdhcvqyhwTEgT4wmbTwUFEeLepV4eQK
	ek6SP7E2uN2eqRTmhNfg88rs/kQZxJMtni262PEbpXxbcPS4AfrMW17SpERUfs6Omb4ZKvvyg6w
	gTQDRBnNabSvuj0JIgjzK9/MECvP5cygm4Gd2BYPh5I4SqINMBAfG01c0q9p8UsLQBa/qEQAge2
	nSZ0aGYG5VUOJAZIsblV9rFbDh1SitC1y8BUEN4RXUJRFnbDMarYWdFiUOrG93RqsjGmT4/73VM
	eHLr0Ocjpxbc8ix/yEb7OJwh88gLxE+oLJXuWH9vkM1vglHiVP1YQH/vv5G/TslqElp2gOd02WR
	ypfP4=
X-Received: by 2002:a05:6102:3106:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-60387269985mr490671137.3.1774436466782;
        Wed, 25 Mar 2026 04:01:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3106:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-60387269985mr490634137.3.1774436466209;
        Wed, 25 Mar 2026 04:01:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871003sm785427466b.54.2026.03.25.04.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:01:05 -0700 (PDT)
Message-ID: <df041143-46a4-4cfe-a587-a613242d4bde@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:01:03 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] interconnect: qcom: drop unused is_on flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-3-7892b8d5f2ea@oss.qualcomm.com>
 <3d75f9fa-f744-4437-8c68-16ca751193ae@oss.qualcomm.com>
 <ky6o64toksq4ozbbad4i7mrmrqjkq5ffphrwdruejq6godxco5@ds2een4mht2v>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ky6o64toksq4ozbbad4i7mrmrqjkq5ffphrwdruejq6godxco5@ds2een4mht2v>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OCBTYWx0ZWRfX161Jmz3rFQee
 WbwvvomfAJgdvpz0dVpl1HDmORagJUDWVUmexUxe86oEQZgI+y7tPvRdLZHMa9bc66eE47K7mq/
 ZUqRwvGreF5L3ITrlEEdTdPfvthCUNXizcTiD6CDMy4HlDaufEBq3CagJUSsGqlWKlNKIEWs4XA
 WExkTA24zS6cChwL3LiY3nuAuaFBqKVDC9D1yQVb0cXKb0hc3JscMhBUmDet8FwLWtXV0bFHKgw
 pD3yCaQC9WORZzoSvBfr1V2qHh027rUhDR9YhqrxXc4w1thPntCsUA5xFR1JqDhGZrReC1z7PsM
 hmyWRACdju4Q9/yZYVAYks8PQ3R1HGDCsYZhSk1RKPSVwZeSt0/0d2//Alp7sVTtSnCfYGz/8ZN
 JnXlfOAlDz+8NOUlcqXyHBCiTaonTsyWI6g/a9SxSIP4giVaVC02HO9uNX2CtIkHxQzx3XKQ715
 bsAzLziZXHI7iKH4KeA==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3c073 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=14PZQ2iapyptJwwRuREA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: QfJcduPMlF6yDQTOmHyDWp7MDu_9aTR5
X-Proofpoint-GUID: QfJcduPMlF6yDQTOmHyDWp7MDu_9aTR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250078

On 3/24/26 12:12 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 11:26:47AM +0100, Konrad Dybcio wrote:
>> On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
>>> The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
>>> clocks") has added the is_on flag to the qcom_icc_provider, but failed
>>> to actually utilize it. Drop the flag.
>>>
>>> Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/interconnect/qcom/icc-rpm.h | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
>>> index f4883d43eae4..3366531f66fc 100644
>>> --- a/drivers/interconnect/qcom/icc-rpm.h
>>> +++ b/drivers/interconnect/qcom/icc-rpm.h
>>> @@ -51,7 +51,6 @@ struct rpm_clk_resource {
>>>   * @bus_clk: a pointer to a HLOS-owned bus clock
>>>   * @intf_clks: a clk_bulk_data array of interface clocks
>>>   * @keep_alive: whether to always keep a minimum vote on the bus clocks
>>> - * @is_on: whether the bus is powered on
>>>   */
>>>  struct qcom_icc_provider {
>>>  	struct icc_provider provider;
>>> @@ -66,7 +65,6 @@ struct qcom_icc_provider {
>>>  	struct clk *bus_clk;
>>>  	struct clk_bulk_data *intf_clks;
>>>  	bool keep_alive;
>>> -	bool is_on;
>>
>> Hm, looks like the clock vote is kept all the way from .probe()
>> to .remove(). I wonder if that's really what should happen..
> 
> Well, it's probably up to you to decide. I've a bit lost my way in the
> vendor's adhoc / bus / etc. code.
> 
>>
>> That's what drivers/interconnect/qcom/holi.c does on msm-5.10
>>
>> Maybe "iface clocks" are only needed to execute a ->set() on a node?
> 
> Hmm, I don't know. AXI clocks seems to describe the clocking between the
> NoC and a particular device. So maybe it's required for as long as there
> is something using the NoC.

I'll keep this on my infinite todolist

Konrad
