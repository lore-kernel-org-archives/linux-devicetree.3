Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF43A0EB3
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891118; cv=none; b=j1urU7eDUlV6lFo/u17UkchKEGS+c+omeCPHpYyOp/MMjickmw1jtxrir1tC7rRxC0jnppYAvWgO/Kj8J+XyIKdyyNDLQ/72VkRO1yCzS4PT8lDxNlOT2m3K/HbWICXu2byGwlko0SMiOGYECgzlAn9rWYtLb/b6MItA7+kjNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891118; c=relaxed/simple;
	bh=F3qtJ+0mswTvasfhVUrEPXonE05o5W9A1VPiF+r6U6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9w27C0NrC4cBo75tkxhRmnGw4f6mZUh5GuQBKG3U0bBk7J1rGrAMbDoiAF/u7OA1VvmhKhslF1zMmiODRq827VA0FoRvd9sIHCIKFa17Wl8ITWrtMdXfvJhOAoe46mDMHf/MsDeCsr0AmIK26BSKOOqAR5Y27V4AOg4/ToBGWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbO2GVuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ+CmHNe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbO2GVuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQ+CmHNe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lZYE154284
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 07:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=; b=IbO2GVuMXURSMRsF
	LRpjClDudvMqMNVJZqH1icTdQwvnrB335lkClOSpgpH5NxURfQyaT2VCpbqCbzBH
	5yDxZ1fHAGonqABfbe4eSPysXpXzJfnruVJv83g5cXB3Z/AxCbv6/cLfeTf32CqN
	gjzzqr2ANytjyg3uk5PdsTjnrofiVsJT0noHFHLe5en8l2wNpJLIt6vpgbgUWBLs
	qyBJKViRDXVa39/WDBekRvabw2AbW1Pnz8nfkltQq0NQ5tJk21NJIl1yZr+62u38
	ZOvkhuCqj3zBejzNgsanvCxy21S3m2j/iSS7ZXIXgSCzoqNeBQG8AFkyBJsYxG5w
	H88CXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j9133j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:31:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso10579245ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782891116; x=1783495916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=;
        b=hQ+CmHNeiMAMD+NsBYGAuHHn3Nxh1zgmYierXk85Q5xS5NrjFNmVI317lLgg0mhMUp
         iWzOxHl0Is2Wh1JhtQZnqAWJr3P1VJvmIiN6oNwUJ/D0GcQ/aJrv82tKDTqKHtj7dMp2
         IVwkOuVlIefyM+e0tLGkd57nm616t9nVCoWl2KdO3HvqAVY7WHPY7Y2G7V6aGUvQ27W8
         C1ovFPo9de7qNB8enZgQq632VudXMp0OktuslWl4l691VR7Va3wchssPS3RxyvyusAXC
         yP1mvHUDnkkrV0AyBq9Wal8mW71LdzIWnEBMSv9gXYzIUhLMKbsfwhgLNoPZsd9EpmHh
         4HYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782891116; x=1783495916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=;
        b=jTEifw5djKMKiwQd/m6i1c2d/Ye9I1YKS1aPYkOyRmc9zILEKuxbDcy7HdH7exzk0G
         9f/E7N4B0s0RfZUBzZ7mo6TFurQVJ13shcnXVxV/wQf1wH2mm3+KGR4T71Eu61dTqdda
         rYEvj4ZabJWRl1hgDRKAJknppQ1uflnDaNkwG/0HsH/b0GKuPHYy4hQGRB/RNyN3ecLG
         2KSyAeDhHcN8EhfJFlkA+UvJfGqPTypMCQQPLn87NSlFdxvzZx0mFWFIM5kJoUj+pQ3e
         78kci4GOBqxEswi8GSwMhfDDTJTyAyPi6H15Vh0kVy5hnm1/JPcrO4P8fqrScBUh9OIC
         b5jg==
X-Forwarded-Encrypted: i=1; AHgh+RoNzB+Q1zrgLfE7gTmjFIL+TJ2kOTgBrtNo2Rgz8wCp1IOTtDUj+Cp/yM2msxXm1n/JygYogK8QM0AA@vger.kernel.org
X-Gm-Message-State: AOJu0YxGAzfNwsJcs7bTiwz2/vok9SYvdO0GlycvAT+0jULrNs3EeQlk
	YtVDbR0rR6jwchJnvVsvDR6b+LhUOXWAUzD3KTvrAZIp2YKXxYlZ+4c0w9Q25lvaizRpRaEJnCQ
	H4q7oHDm9RV06SEe6J1S83PgWyqcKnGg2yY7ao1IVHoAGKbVUZWNprQCO76bJ00W3
X-Gm-Gg: AfdE7cklVgEkZdL4lkNu2HOjfCEP6zJV5BhjdISBYqUPUzGSOujuorMOn4m0AlfY2W0
	/Brdq5ms+DcpRTM168z9aRiYmF1F/6C+3DPMdyZzCitDS7JJ8LXyF4MhZgnoUzm1g3H5zwlsj/C
	DhLP0+6YKFupFUtSOBaJ7EiJDdoq1/wjiO0W2J0WLcjZ60J7bmxZj29APKCfdR3SPk2yxj4vxFk
	aj3PFNR/oFBBO+kxlnUwjoHgtRURpNKFNVQ1GzcdAw/O2X7TzFbLlowJvjAe1WogRjfY9xnqZix
	TYpcKWRcytc5UoLYv6iS6jU8XbgUiuJe5BJBQPET4m02H9hKaBb0h1GBwRlBvp+1TskENkfxKGz
	OhFivwVVnGb1V7EYLELqZpAQxqpz4ja8rj7vDVsRKIzMH9Q3NaPXtlvAmZtl3sm6zM+QDYf9Kwy
	k=
X-Received: by 2002:a17:903:2f8e:b0:2c9:ff83:41e3 with SMTP id d9443c01a7336-2ca7e6e1653mr6427525ad.21.1782891115649;
        Wed, 01 Jul 2026 00:31:55 -0700 (PDT)
X-Received: by 2002:a17:903:2f8e:b0:2c9:ff83:41e3 with SMTP id d9443c01a7336-2ca7e6e1653mr6427055ad.21.1782891115085;
        Wed, 01 Jul 2026 00:31:55 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c2e8sm26960375ad.43.2026.07.01.00.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:31:54 -0700 (PDT)
Message-ID: <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:31:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mSTIKRpY0nUcP9iueq9fVx86GNXhrdjB
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a44c26c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=TEn5Sf8rmKvuiEhX-CAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mSTIKRpY0nUcP9iueq9fVx86GNXhrdjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX47xm2T5SevC3
 EbDMJmi8GpFZz1CPiuXPvYvyz7AFmdsFTctgqmPjmWsTpO2orhr3/uLMvl/W6k9aFmU4QWQIyIl
 oV/ns4dPCyCeJHCucT4MMhjNeYTmefYwb8PNyJPOYbi/p966/VvLdqOed0duir93FYfreIHRCah
 pjvm6FhzGXhsdjl5y9K1kWW1jf1XBcOwN7+L4pbsrHpoy90lFKNIO8181wGQVXZXenkIyXePwqc
 pZBooz4a3CgoqqIxx3D3zyz/ATdpX6NZleMIYFltU8+alZkFmJRnHnLW3OaPLc4Vtklz+9AUbnc
 WUI2tJC6V9c8IYgeHeT6CPH/Iib2qzfkJ+6PqpiVmFUGE9pe1cTH5bK4+J6lSAvhCoDrq7Y24vi
 BV/qC9/a3gh+I/qBCb9xzfM7TPoL+kqkPioN+rf3S/zzacsHjZn/HU9Jkl6KzwoBiJRcf1tKEbd
 YURk9NB/2cza1/LjOXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX0Aai1SKG3w9b
 Q2SkeP/5bdWbYQp+ljU4Jbe2owQ1bBPdXHS0kbPq4Fowdjk4OYzdu/PSlmMzt+4bI3WBZZFrIiQ
 AioL2zhyfIryXSK0FRtjfsdRVoJjKJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010075



On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 09:16, Jie Gan wrote:
>>
>>
>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>> AMBA bus.
>>>>
>>>> Convert the compatible to a oneOf and add a standalone
>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>> created on the platform bus instead of the AMBA bus.
>>>
>>> That's a Linux driver specific reason, so not a valid one.
>>>
>>> Describe the hardware instead.
>>>
>>> Also, you do not get other compatible for the same device.
>>
>> The device is intended to be discovered and probed via the AMBA bus.
>> However, due to a hardware issue, AMBA probing does not work correctly.
>> While adding the arm,primecell-periphid property would allow the
> 
> If this is not AMBA bus device, then drop primecell compatible.

Will drop the primecell compatible and update the description.

> 
>> existing AMBA driver to bind, but I think that's a temp WA. As
>> Suzuki/Leo pointed out, we should not add the property to pretend the
>> device as an AMBA device.
>>
>> Instead, I introduced a dedicated compatible string so the device can be
>> handled by the existing platform driver without relying on the missing
> 
> As I said, that's a Linux driver specific reason, so not a valid one.
> 
> Fix your drivers if you insist on that.
> 
>> AMBA primecell identification. The purpose of the new compatible is to
>> clearly distinguish this platform-specific case from the standard
>> AMBA-based implementation. Or shall I re-use the existing compatible
>> "qcom,coresight-tnoc" as platform standalone compatible?
>>
>> We already have a similar pattern for the interconnect TraceNoC device,
>> which uses the platform-specific compatible string qcom,coresight-itnoc.
> I do not see there a fake, duplicated compatible for the same device.
> Can you elaborate how is that relevant?

Will fix it by removing AMBA related description.

Shall I update the clock name from apb_pclk to apb as a platform device?

Thanks,
Jie

> 
> Best regards,
> Krzysztof

