Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7923C1F2B
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 05:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328105; cv=none; b=pdqfCFaXzjP9hzE3aG2RocF+lggYgSVF4Ond0wonrVhAyQIb068JgCqFplAI/Snpcgrb5R+0owtaK2HDxfkC0Yg27h9BOPU2WQ996Nr3zCavV3T60jKP2lkJxie8E7E6rJQuYww9N6v9pZcr9Te31SgsNYQRkWZIgvAbIvY5lB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328105; c=relaxed/simple;
	bh=Blcvjy+XBxgBJqpr9x0RPT2zIuzswLyPFrCvpG/VRF0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VBsfQnYn/9dmyrPabkZ+cPwIuXziemRwUJuWh/8oeE6w43NgRRoR6ILgroa1IxUIDXILDvQfus5Mw1lCVyAjc2wbf7LK+FRkyP1DacHwBYBytNMqlbhobP9VNChfy9lYL6+VuodOEPM5hcCtcOwwwTsH6VouYhs5j3POh6cG44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnwFQ7Ju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOSfEei0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnwFQ7Ju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOSfEei0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3jeuS1350120
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 05:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDq9l4cFiEfiUPwPnQQipqPE6q9NXPAUQEm9JDbbm3g=; b=RnwFQ7JuzsD00bHK
	oaFxl/DyxH9/JQ3tVI7K4CiZKmQ0m08WYm3WhoIcJxkKMgVH9JPcygWf4g2GvZKf
	sE+9U9Q9ON/DrcnUgaaQCgZgk4ICGNLY216NvSpSKrYH5BLLipfM+LF1FjRIwFPw
	t6g7IGDpltloUvz3B3UOGl9CFYtarHRZ6jz0JNeOI4oL+tpXWnIRskuVcv751Zoz
	7Qk/mPMNuYFiUE8lc1hcBagcpGrjfXqTEG1HBU5c4y5SToJ1wLSVTvmSeSrqQgUz
	07YYLM3ILAuIzKOKOR7vp1glXrywkbi3eaz18e94qb4ULY5UJxQ7EA7qP/zQujuv
	YRFGNw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk68683-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 05:21:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f424d5bso1248801b3a.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781328100; x=1781932900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDq9l4cFiEfiUPwPnQQipqPE6q9NXPAUQEm9JDbbm3g=;
        b=bOSfEei0ucgEzUn3l3rBqqZ5ERRUjDYvOz86Er/YDHERcJi1owEFW01ne3CU09ViGB
         W/EhQO4CR4voeDfNwX+TCbfC485Ybb41voj0nwyopyAUuW/0suPARNdKvhsH6qufC2z5
         THcNfhIe9MZAa5o0kRxd21f+V0IqULN6TxCC+hXlZxiaCUuJII7HcGdxwQLopJ06JTkL
         077A5B0QG28HfSQpQEjBsobvawnG0KaxKrnvR6ZuPZXtrsxmBozIJcYsi0kIfIKpBWHK
         rTK3zs9uH5VlGUQqJAzr5vbYDWiiBm/jV7fD5O7bS5KmsxOveU4skx/rG5DkKVhn+nV8
         YF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328100; x=1781932900;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDq9l4cFiEfiUPwPnQQipqPE6q9NXPAUQEm9JDbbm3g=;
        b=gLxAiG9nMLTgU/4vKz/nIv/wVrl/u5zmn6WLZibgXbtA+O0qJt42Nvfb60BkfgYSi0
         l4wTkF3BTe6YCvZoV2fhfht6ObrPPv1wCQeERwCwn/hfDNXjteZJZwixH8Es0lWJ16bH
         IzFkZ3HDS63l4t9njNS0QJIIOWO+sO681KXdHzgJwsMab3IeVq7ulq8ezZDIH5jF5l86
         BHvRcLUtKIKsMCufyiGmmesZDhRXbJlSYMXh/XdnTL7R6UuflwiNpdxFOLJrgecrGZB/
         /7NbKVQvf2QKliS4Eg9FaC1H/hfe8c1uqNj1TagPEb5EQT6lc2eJ/WDX0S9lmkdr+8xw
         VaJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RmOjaom9wXkoP3RaTQl5/RRjURghjsgMosk3dP/Ih4cPmAjHp6wGlxYBMZf62W3aBcqRXbDNjVf7y@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+GuufIZhGtfnYsKqXy0hdqSZdwal6kTK9bAgmSdncn30NdEy
	0FD7VzJZ6LltJVsg8MBhtyIkRGXbDja+rqGOThjTuUM1i9qdQ4VP9ufMwjXSlOyKDosd119p1yP
	7siDXhTo2VZkJp3clEvqM7lAiCajbxCkS+8X5yPUXjo28gXjLq1HjigSIHxtmJwWq
X-Gm-Gg: Acq92OFVzhM+E2MhN2/mWZDV8G53RYRNH42bCtIkG6VrcYrFElKTUnjTxheeX7rClIk
	+c+mgoeIO38uXy9eLQYvBLUf325f/1Yg63UGtBqEiQxEMbxpCby1Ifm9nPVLFPhXhXVNKoaLBDR
	xWeKI4bO8S9ZrpzxWfCCryUjeEOW7LhhEWfGDs8+lWiRjt0jILFy3fZM+5jmVghdvHZ32MYNCxS
	CpzwJ9SZXkfFhQlvq8IyVWBemf3af+xVn1jSJ3/9IkKMnTU8P30dIP1yuhuPJsFtzLve3A6V8/f
	B4NRBuAHuyjANyZiiU2K4OcXWqgiJ3UhuM0jOauUeno3aJB/S6N3lkLQhUW4ty8eY4A340Y/qHy
	JENOzmhRt/0JPXeQiMt7SxMxO5fyk1Lo7Xmou+4f2MQG+VEK7R7U=
X-Received: by 2002:a05:6a00:1d9d:b0:842:66f3:c51c with SMTP id d2e1a72fcca58-844e1a9cae0mr2821033b3a.40.1781328100081;
        Fri, 12 Jun 2026 22:21:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d9d:b0:842:66f3:c51c with SMTP id d2e1a72fcca58-844e1a9cae0mr2821011b3a.40.1781328099614;
        Fri, 12 Jun 2026 22:21:39 -0700 (PDT)
Received: from [192.168.29.77] ([49.37.153.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc825csm3757239b3a.36.2026.06.12.22.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 22:21:39 -0700 (PDT)
Subject: Re: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
 <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
 <dc833e56-e127-47b7-9ea5-58d6d2cc193a@oss.qualcomm.com>
 <c8da8a89-e372-ca87-cdca-396c754ef5d7@oss.qualcomm.com>
 <1a66f1a6-840b-4de4-8e65-a3456b654044@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <91a90c37-f93a-17c8-b4fb-290759645977@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 10:51:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1a66f1a6-840b-4de4-8e65-a3456b654044@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA0OSBTYWx0ZWRfX21S7vE9jOc4S
 u2ro+GZX+o6eoZQrVhDYiIoGKazBlR6zAZjzaNeeDPBuOBYfz/TlSS3k0hldIwp2ib7ej0gGk3Q
 3SfRNPQaoqnq4vhl417JvS4tokZPaVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA0OSBTYWx0ZWRfXzbfEox2LQDpt
 81p4aWclPwFoLNOUHEzFiMNkI9pgT+f6ryxGH9pygb1mPuHhd9Wadgwp+Z5ByvR8xVdaWCZjjnh
 UgeXJLcAsjocmg82/6N9RpHSKxMaEa7qZboMmzi069MtHrMGAfwMF2rLMMaSaUfkBp0iG4m/mfU
 Ktdyqx2zqkTJAYiYkMX3hAF/cgznY2/7di1pJLDN1sLBLCMHgy3Ga/SmCzd5ZmN2iyAeZuzNUrC
 3GE83Zh5f9VhAVpC9rpPzez8wsdMGJ5V7JwkHZGrVrj3b6KrEo4DMqHIXFtspYBVi0n8azHuTSZ
 BMVpWUNvw/WBSMNqpT2RtdXrCA15MTSt6nYjL59YVCRYwOwgQDv6Tk6ASqbKO22gKQWqunEzmZ3
 uvA8U0xtDPOIFprNlWUt+Qay6kgPwaZ8rcazOaDchuv2z6+prb82YKbed0PRpgdjxDsem3DQkAl
 CPs5ZgSV4eLYtTD4g0g==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2ce8e5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=tRFsQi41DlxDbhtE/tdDLA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=T5N_DjmhZ9PfKkVBC14A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tNvluJ787QG4n3oVchHxHxY95CPLmXmR
X-Proofpoint-ORIG-GUID: tNvluJ787QG4n3oVchHxHxY95CPLmXmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130049



On 6/9/2026 5:19 PM, Krzysztof Kozlowski wrote:
> On 09/06/2026 10:18, Neeraj Soni wrote:
>>
>>
>> On 6/8/2026 11:40 AM, Kuldeep Singh wrote:
>>> On 08-06-2026 09:46, Neeraj Soni wrote:
>>>> Starting with sc7280(kodiak), the ICE will have its own device-tree node.
>>>> So add the qcom,ice property to reference it.
>>>>
>>>> To avoid double-modeling, when qcom,ice is present, disallow an embedded
>>>> ICE register region in the SDHCI node. Older SoCs without ICE remain
>>>> valid as no additional requirement is imposed.
>>>>
>>>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>>> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qualcomm.com
>>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>
>>> Link should go below "---" to specify previous discussions.
>>>
>>> Usually maintainers add link of patchset being merged here while merging
>>> changes in their tree but authors don't add it here.
>>>
>> Do not see any such restrictions here https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
> What do you provide that Link for? What does it bring?
>
Kuleep highlighted a concern with the usage of "Link:" tag. The link i
provided guides on posting patches to upstream linux. Wanted to highlight
what i folloed and I did not find any specific comment/line in the guide
which prohibits author to use "Link:" tag in trailer section. If there
are guidelines otherwise please let me know and i will correct and post
new patch.
 
> Best regards,
> Krzysztof
> 
Regards
Neeraj
