Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68343E5EC9
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475811; cv=none; b=s3ELPEPoeQQ6x3PsGA7sxOldxkg3B/z3kBJOsRaEcvFQTHGR6bEtHSSeqfhgwsFWqL9t5WurbIBPRPrzGM6Lo9U+ybYxvfqPExxI13VN+Ww4qExyC/8PvyeU+pMyyL0xPxvpWaZr0HTeaxYjXW0zyWXYjaPNYkeegK4mI9xkhN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475811; c=relaxed/simple;
	bh=CeYszsRvzpbKpefVJb4GjzWRZN48ZGCQ5z1m7K2/2dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxuLEWzelqnxSpNusfEqBo/LCZ5jdTJVn+VT7YJX+9P36m73+1HWDNaYgc77rLtF/xbxlgBB0FTHVWko/01Bz3570icP/ez78VWHK+wtWaUC138GbC2R6+rHL0AlVtqWAnxkwsA7lt4iXjI6HiovzYhj9Ee44rSGbGpRTV2AXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5p5xX+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bK4GYlN+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5p5xX+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bK4GYlN+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcdh0561366
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 12:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSiaVRVWFJVBQaB5XydkF7gUNK0imSHXFahJpoXMMt8=; b=f5p5xX+X6/f6fpdR
	K26gIX/+aXlqDiIERDcNT708mo921FaqNWz5VlJtoyNUgeHMZC0i6zE1dyucfOta
	7nkQIlRLOgiRHyWTWUD5k0icuPL6+Q88hpMnfaNiCvGozZ0f2X+SnovCks0Bu/9b
	6d8Hw45iulsDrcK8r/1bkeGImDEP4p83QKzpCDV2FpqdcbyQKbRKTxepPuHO0UTA
	ToqAUMH2SQtlXCUCzPGtydCpRaGNJtOrn9Jf+GbhCI1kEZ11EPWOY7S5Kimr85MZ
	GrplTelwJbDAkG6QVasDQ5zEOMGjDr2lUWkI3gdO7Ai6Nq9hDTnpfV35VBL9mxa9
	KgJoKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdta45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 12:10:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c8284701c2so2390065ad.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782475806; x=1783080606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSiaVRVWFJVBQaB5XydkF7gUNK0imSHXFahJpoXMMt8=;
        b=bK4GYlN+4eIl/Yt1SluCaeTydD+qYZnItKlvkgpL88yjpC1y5RDDVWy5qFuDAzGvXw
         NwTXfT/KCgcbAA5MnsN+QN3+NTBj11duL71AURk3KxF2ufCx1uihn7iuKuWblldlkqGy
         LFPHkBunja7h18pnzSa61C1wqRZCq8vRS3lUDFmVdBg4BEdJiXUdn6tLRoynI5HjALUd
         Ld/zQPrJ9L66YBsOs3fBb0eeYVKdM6PT0zQufUk7nsPmSeCW0oScQM4g3iS7IquPNyiD
         4VIUO0P1Eln4v5Lg8yip8lKwT5pJj9ZgsCvxLGl3KDkA9aemKsgivFKbpv0MtMsV+vqb
         HkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782475806; x=1783080606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSiaVRVWFJVBQaB5XydkF7gUNK0imSHXFahJpoXMMt8=;
        b=TxhKarwyD7bTXoEoNZI98Jn6UFovQEVBVevRj7u+iG1WgC7cbjhrxhVn+HqG1SFVeL
         DjRSdJ6BN+pV3MOJHqLSKXITKqdq7GlP1GBrvT0/rAahOy85U9mGTZJ29itgEXflJL2u
         rNy6DBxUTnY7S+1FQeV5BbVQTO4cP4xho/8DJSwYBSmAxZjWRQ/BcI23BWSbezX7dd6f
         T3OtAmEF2+tcSUjOVJIFRyWh77PzBvG9hPzw8mN3FuI0SMlEK95Vn9dglDtyLEqjIj3H
         CS6ggtpsoqn74xAQ7ajAkafyh8liNfmtedLKa0uRQE96ny5nIMQOZ5VSneNIL0R+EuOA
         uG7g==
X-Forwarded-Encrypted: i=1; AHgh+RqO9+PHWa8QeviWCcAN/2AdIDrpY/9VOnORR6U1BNwVJO1/LbH9dnQDhzb+AING6EEOL2QUpNWXs4H7@vger.kernel.org
X-Gm-Message-State: AOJu0YzHfUU/lYJoVcf3EKGECGqInnEHAGwn5+TmYRwUK4ixFTX+VSPC
	0TerSt76PukYmSaWtm9UfdiS3cO+q8lho2ZZ00co5IrAOgLrKjfI2Ws1Xc8McNguBKf2UlfCN31
	npMuXQhD1csub8MO+2wG27zGZ2k/pz+V94ldn3cRudPkNcltt+gnwlcpNVxZdxC5E
X-Gm-Gg: AfdE7cnZELg4gzbjoHQljvL+c1gZ+sc7vg4/pjvfHPUxVFhdymDRqmgXnMq3Z5GZQpl
	fva14qquc6MUZXBy6oXgmlebBPOaNZxHgHISDYPFUTDnZ9DYo6mp/lfyfYefuupikmi++aUqb2l
	4MVNvfayrWA7mCoyp0h5MYDdvCudzIO1D2R4SsCspeS+F36FCBwM//lbBtJhAhzwEwzbSsWtSGm
	+e1uF/B4J6SCC06qKxHUsflVEaPJtGq+wET8k9l2fAsQTt7uEzKX+8NQNIv7rG/wPIcbRNCBryk
	n9+6L7kMB0iPjla3Y1lLaXer5m+DFIO+5ZyI6TcThLah4TIyaOrNgk2VmzbMqNoC4eBLHr9Pzo2
	4IrY7zVTHBGzJMAnL9JEzchJmvnYtwNCk9O+b4Gde82jb3gzCNfuF4/YIiAvRk/jA+g0acTJMUy
	s=
X-Received: by 2002:a17:902:c40d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c7fca15745mr69578235ad.21.1782475806132;
        Fri, 26 Jun 2026 05:10:06 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c7fca15745mr69577975ad.21.1782475805623;
        Fri, 26 Jun 2026 05:10:05 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ae5ecfsm38353295ad.21.2026.06.26.05.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:10:05 -0700 (PDT)
Message-ID: <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 20:09:58 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260626103015.GE575984@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e6c1e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7eVLfvEy65BM8Fiv0Z4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OSBTYWx0ZWRfX6FpnkU/v1fB9
 9iaNPj/lxXn6RdPtJgH/QqefEdhA9ADKcwl0FiD/y1L1NHVD4Lozkq6bEnhqBdkUBVjcOYUa4Py
 UMff/9R0oDRxQlRHd+h7+vkHgBh+7Y7YgCzkQLiazj+MSppni3gwR9ikrh6TNW46KAcAo9j0/Pk
 vl77ONr06exnvXJ8+IAFmwRvDydEHL+Zv9qcqUB5Q4aViS+hLY7U63GiAKCpnXVDBEPgOrS5BtM
 Dyz4nI7aY9GTmyAskv5vCN4rKW8oNIZRwDp2AnCtGzOgPvsfNtokFLebgX3PAg421GETGwet+ab
 IkzAuz6iwn1Lei6I4csMYc4ZGt6WSPUUlJ/bQ4UPCa2R19ulN9v6srMLO1uwmutE03NRy9DiVzG
 aAL209NxgDKCkvaS/ZAHEClMMyCVYtwJJJ/6ZhQ8n3wGajRd3LhyfNJD9zkPlc+QY2b9wwwpkCx
 7O2l/YYji240kL9XkKQ==
X-Proofpoint-ORIG-GUID: I5C8Iahy-160NlYpVzslieFBba4pGK1n
X-Proofpoint-GUID: I5C8Iahy-160NlYpVzslieFBba4pGK1n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OSBTYWx0ZWRfXx96qHjLL/aJO
 z+6dvpuKusgOguw9mrZDlywCQG8lxVjCSoc4oCgphEsMhOeRbY6do3aweEc/jyY9wO9qgLHCdHk
 lg0rY35LEPpkn0mez8xLbwKxUC8pdog=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260099


Hi Leo,

On 6/26/2026 6:30 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Fri, Jun 26, 2026 at 10:03:41AM +0800, Jie Gan wrote:
> 
> [...]
> 
>> Hi Leo,
>>
>> To be honest, I would prefer not to modify the interconnect platform driver.
>> On some Qualcomm platforms, multiple itnoc devices reside within small
>> blocks(one or more than one for each block) and are connected to a dummy
>> source. In such cases, two ATIDs are allocated for a path (the dummy source
>> and the itnoc), which is inefficient. This is why the itnoc platform driver
>> created to avoid this waste.
>>
>> The TraceNoC (called as AG TraceNoC) is a generic TraceNoC device which
>> connected to multiple source and link devices, aggregating data from all
>> source devices into a single output path.
> 
> As I said, it may be fragile to couple a specific device property (ATID)
> to the AMBA driver.
> 
> You're now facing a case where a device cannot be registered as an AMBA
> device, so it cannot use ATID. Likewise, I can imagine in future where a
> device is registered as an AMBA device, but you don't want ATID.
> 

Agree. That's possible.

>> This device is implemented as an AMBA device but lacks proper hardware
>> configuration. As a result, it must be handled in the driver as a
>> workaround, which unfortunately breaks the original design intent.
> 
> Seems to me, it is not reasonable to pretend an AMBA device but AMBA
> ID registers are absent.
> 
> How about add a new DT property ("qcom,tnoc-enable-atid") to force
> enabling ATID?

That's a good proposal.

I have another proposal: what if we allocate the ATID in trace_noc_id() 
when the device does not already have a valid ATID?

Possible scenarios:

If the itnoc device is connected to a TPDM device (which has no ATID), 
trace_noc_id() will be invoked via coresight_path_assign_trace_id(), and 
a valid ATID can be allocated for the path.

If the itnoc device is connected to sources other than TPDM, 
trace_noc_id() will never be invoked, and therefore no ATID will be 
allocated for the device, saving resources.

Thanks,
Jie

> 
> Thanks,
> Leo

