Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69612853FD
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785476888; cv=none; b=EcH9yvNMf+oBH0R2gTUmnBtEKQYV0c5xh+ZPmBqLiJ/W5nWTsbjbp1p+XVkINQ3a/O2SSPHFoBlWTiZus/2jc0z2qBRzFIgVfKkYe/wBMMtkUuDIxN7tpiYSp3bs8HUXgchwxobB6dZ1zcmiXkhwa7MiemOFNm2GuMzvF5/AtJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785476888; c=relaxed/simple;
	bh=X9bI3KryGBVoO0zgYTMvyGaCEVM+CP6pWzGHPchLeoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHgYZmSnXwZXBqKgK5q4Nh0AnTyGKkMH3+2sZCrQfe7Sgj4t9ZjUR8MWZqlnQTMqgLNfvYN5z4LlQEp3usbocMshFnthXxiEBGLHHu39UimUiKPVmZH6D2bBtiPU0b7OPz6OoKceN2XgCrVqDSkVVcS/p87i73fT98mV3nFrR4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R59iY9UA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jv/bb6ei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R59iY9UA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jv/bb6ei"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4ugS52485566
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxBG5UieYyr/vXdsG/LnJem5I19aPI+KoHvdzUbIAeM=; b=R59iY9UAA6LL0jeX
	vPS9dAgtordx7E3wO9PVGdhIaaSRdfGOdMIS4Q391hFnNPL/CetEL4u06Co8xIJN
	vcImJarTdnVzs9vlj+bRZWEOd5LMqj4dqksT+SCMOWXG8IOESVjrYIo2qT7YJKgu
	J90yRHjTTLn6gbt8PPAjT/AT6vLaCcic3RcSFia1rR3SIMZr/Ak6w/vZmvtmhgDv
	fb11zOwvhzIuqbIrqDFSgTVKTwJK1JYEy9ptw0smiwr++AwRW7l8bxhy1InCC9Zw
	SVElY2uLLrN8CxnW4l1aCRvWZgIj1zsN0eN+tXSaMFeZInIFcGGaKS1a9XBWK6PD
	VpjfKQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frmr9085e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:48:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e024d2129so1259514b3a.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785476886; x=1786081686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxBG5UieYyr/vXdsG/LnJem5I19aPI+KoHvdzUbIAeM=;
        b=Jv/bb6eiu27MxcmuuOx95myZmN2CmQljZTnWNAvj1KiqT5RzJTFUzh/nG/i3zg8ibv
         KPEA1ESQD7BdJE0XL2v1au9xYGNWdVAGhavoO2DfB3srhu8r5uOeeGC2u7EXL49MGevu
         qwSmdrTeHk+eJWagZvuy/5gaa8LaaUxQ7sjvDFKL9BLtD6pXHAXCdTYumlIX8ifqEH23
         KYNbQljwr4laj8gHyp/uilgbpHzycK5eX2f+5DLVJ5U20Mloc6aRziwXmsabzQDxz/+e
         Mg1+2pHlloa0bbGuH3U7k4IA9JizXjCdT2TB32Y56HqoXmLQOzHAGtunRqnCPEe5PqhQ
         St+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476886; x=1786081686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxBG5UieYyr/vXdsG/LnJem5I19aPI+KoHvdzUbIAeM=;
        b=fj8UBEyS62364BWrG0JnLr/aPTfHrxmFRGs7fhWEmtV7H78OpRVUd2wdNfVRelOyQQ
         dH9I0dCpsMjPZlp9PjGJ6isrkTxPO5vZ3syuz7uPi15dxBpvc9iQwcyJgwNAzzL4OoVe
         hmAeFf5bX9VexjRqNoqI2x/0aVnapaV4sUc4+qV0N0d3Vo7gDqVoAx5VmunENZroaoqe
         95AeFkfdF+nUv5Y7iVmlMHbovWBiCDJsGlY5Xnu2l5F0uEZrgEU81ckF/yYTwpu+BzHt
         QJ6wJSQ/nT9eqwN3KT55kcmQ0JjktgQ89Yh8/gN4Ns5kwjdZIi0qOkrqZd413xZUT3j1
         nICQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaXX5dh4ALQHflNiJa3w7hhL//bSktODKBsoGDVLNhQGV9+FWeK2Q4ESzzo1GGkK8f3Xp5Nf4Rht85@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTGgCbvU2Pz4LuMk6nGSEBqloudNJjuhRP6IoHO4NK88K27n+
	q4h7KglfQH7cYuwcoloK9GEXttyUD7S/ZsMixHFw1Jt6u60fEgEgItcTF8rDH4oVLf9MxUwimZA
	TMzkU4iJjoBLKCLK994M6DrzsdFD145cQIPg8aHC/A5TNm35EjPZDNu3z5c+vk5G2
X-Gm-Gg: AR+sD12ubFIIpt4LYVvxTCJTri3CL3eJj5D2GLVPi10vjOiY7my8kyWO7kc+ToKuRJM
	iGnF6Ce38igtVC0n8ICbzAGikPaqrujYZoye0UHTWpC75oIzBzsFJAYfW8ehxxJEfxCfxYJ7Rll
	idJaxjwqzANKc5uQir7StAu/4sGHclYq8qCt2gacIQNmAH5Z3E5qr/n3AGchnQMZkch18jBBvoj
	AEb21OTXAbaMzY/WQYvfoNM6E+OM8jR1c4RnAPYhKAsu6g5TZnn7knNPTnwID9/0y0rJwpOcE5P
	0gY3KaPTMZCzMuq/jIPmqr2agB4QgZwSPFXVc3HxfIEf4neNjuAQ2EJTDPazw6Dk3QFcnKvVWe/
	0i/REv+ItqUWSFo1pGCzu86xdfD1s2qKkRZWdkpjo3fy3Q0amIM1AuMvc9Fko+AtXP4wP/u6sak
	yHa+PhePLS41Bjkw==
X-Received: by 2002:a05:6a00:4b4e:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84ed6bb1f27mr583244b3a.14.1785476886258;
        Thu, 30 Jul 2026 22:48:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b4e:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84ed6bb1f27mr583219b3a.14.1785476885870;
        Thu, 30 Jul 2026 22:48:05 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5782ea8sm309379b3a.1.2026.07.30.22.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:48:05 -0700 (PDT)
Message-ID: <d3094d80-c51e-47c3-9359-2d28d6d47c8c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:17:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
 <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
 <9d9eaae1-97e0-492f-954d-d683f089ef78@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <9d9eaae1-97e0-492f-954d-d683f089ef78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sHRLOnv8ve32r2lH9HPVzvuPhbUKvzHs
X-Authority-Analysis: v=2.4 cv=FMsrAeos c=1 sm=1 tr=0 ts=6a6c3716 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4dpkOlLZqYEDTin6f6AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNyBTYWx0ZWRfXy8MUCdlyiYsk
 Af4GUNzLtANSu0sS/+Q/075LbKiN8B3pWPvkBOqVitXva8leqt51gdP0I96Qrd3vJ3JH8r1GZui
 0VUHTIgOlggXHOYuyAdd1lo0ItXuc77DTkN5llanJcYkKNx3y5NrifK2fhC1lt6vgq2PYZj0x8y
 mXbgKdzktuHWty9JimRRM9IS+YVWuBvfvnfRQANQJWt4rli1Xba2Dlf7dTLpvu4vhE5RXpWlOpR
 Xn/t/7/xObHS+PGviCXZuWvG9DcYEERWjGzpxfOjrvZpI51qDQNwGvswzmFK4uGqIzDAQJEJ8AM
 22vooQIoBdwLUC+T9K5PaS23MxsipHYk+7/PLffB0odhTKtJY5es9AYvKPwFZvIfc3IDv4tcP7A
 j87dZ6zvPLrHA7IFVjw6UBb/xfOfFOWHBXogNUr68tjBUVLPrrPNH18LtWoVryQ9AfMg3c/5Mpu
 4ZRzZ40LDINrCJRsKHw==
X-Proofpoint-ORIG-GUID: sHRLOnv8ve32r2lH9HPVzvuPhbUKvzHs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNyBTYWx0ZWRfX9UZ9r//y0ulz
 WjI9OswyFVYrK9WCNy17MVat1Rr4kQulosGEJdTYauaoJh+AYT2IAvy5tbSGrrI7LNz6Qdo82OQ
 NnD8JpVPoOs7Gfj5oOQXpTpH94KE7pQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310037



On 7/30/2026 10:34 PM, Konrad Dybcio wrote:
> On 7/29/26 3:03 PM, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:29 PM, Konrad Dybcio wrote:
>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>> Add the EC command definitions and handler function for reporting the
>>>> SoC junction temperature (Tj) to the EC.
>>>>
>>>> Discover the platform's thermal sensor to zone mapping via the
>>>> qcom,tsens device tree property, average the junction temperatures
>>>> across the mapped zones, and periodically report the result to the EC
>>>> over SMBus using a delayed work item. Serialize this and the existing
>>>> EC command sequences (firmware version read, thermal capability read,
>>>> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
>>>> since the delayed work item now runs concurrently with those paths.
>>>>
>>>> Re-arm the periodic report on resume and cancel it on suspend to avoid
>>>> racing with the modern standby transition.
>>>> ---
> 
> [...]
> 
>> Agreed, will split the devm_add_action_or_reset() conversion into its
>> own commit — it's an independent correctness fix (also disables SCI
>> events on partial probe failure, not just on remove()), unrelated to SoC
>> Tj reporting.
>>
>> On the -13 during suspend/resume: that looks like the SCI IRQ firing (or
>> its threaded handler still running) while the I2C SE resources are down
>> for suspend. Will dig into whether the IRQ needs to be quiesced/disabled
>> around suspend/resume here and follow up.
> 
> I hope I'm misjudging here, but if I'm going to talk to your agent
> instead of you, this is pointless..
> 
> Konrad

I do use tools to help format and reword replies faster, but the inputs
and technical decisions here are all mine.

-- 
Best Regards,
Anvesh

