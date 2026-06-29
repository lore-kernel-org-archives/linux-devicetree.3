Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D5840D568
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782698907; cv=none; b=EIml6Alksg2jvZeVT6GvjSOjAD5pHI2Ib+j53iD57voOHLSAr1VsQo1yjKuhMH7VDPf0DJxTJ3sPSRMmUkk8CljZxkM+/EANOldeUMLIoZNEVWFODBMaQW9CVjoGZsQl8YRr8pBCDI//okQ8JJRvcjLt1W9A69QBGM0n3CSslvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782698907; c=relaxed/simple;
	bh=trOx6KMkTWjUnkalk6/gDNlQpuLuChdQHMKM6WK2fMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/ECgi2CJDlTgolqjOGYrf9T0qEV22p3om0TOhm3WB9k3zv7jHV7uFjZuCXrJl14jLVMZzAqvQzOnC+6jarM1ssw//YSe+QrbsJX5hkdG2yusWA5X9exfER2NN4tB6Qh5y6n0gqm+vk0tO7e1AOxQD3mX+MZg/4gnBvMzUkCjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLTkKNL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXcl8dLM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLTkKNL/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXcl8dLM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SMHhX0952202
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=; b=WLTkKNL/4couuf/g
	52YliDdMBEeXnXG9GQVG/EBQZLZJWWenPC7RNUWRCVkvpzRBOzFh7wheO2cetdFA
	ehSCQ4sckaeTOSOUB4QyGGplx/wx+p0wGqz+hv+fLPSd0RzwpZt23Ct777WyjJSs
	F8Z3UBSrMWUIHfhgcLTLg4QQE3r3awM79nkV5BvrubcGx+Hyhv14VKrdA+mw3bBf
	CFlmHv5P6j3tQRoWRre0cMuNJ5u098X7GcGjm0lj3kcnx5tMEoNLumzKQen6pvAN
	tFkU5IbOqAyGXTMTAcAHnkCa87i0iv+foCklUhvOsZmZTuGBuZwyeIsxJf6ijF1t
	cFzJjQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf3xer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:08:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845c605617dso2183966b3a.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782698904; x=1783303704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=;
        b=DXcl8dLMR0vVyNfdE71uEFlTp9ToeXl70M3GbRG3OFK/ihS/FZLyWqXvh61yNDk5me
         CG/3XgW5HjdwB98PtngGp99HWOlPXDr/bPSc/wKwJJxMQosQlbw5d5jFc9jl0jZlvUOC
         qxKpwlrSPQ449e0PY/eQCWcbrSSv+3JMWuMaiaRT0yfhSr7OMedhZ1Zbb11ivGgDGw0D
         5r99pZR+WjuodrKnbnjR4uOIPCrN8pMkVgWjO/TER6hYhftWvrX5TMUaBiuaXe8cvX5E
         BLxXnHWkwyLTn2WOOFiw9v0KiS8MNeWo54B/yyfx0RVWmhHj3+nu0n5er1J7ad+31U1v
         AwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782698904; x=1783303704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=;
        b=AD+mLzjd23k2nqsNrid7aox0fVCgLe37y5c82LBmnXDK66hWKz9Ik2uiFnHO2e/sHX
         4ENoLgu6FuVFEH0FRv2NocvJpf+6itnp4R25Hgj0bEwLmb68C2ot5VUhpAz8OG+7tc9y
         gUwO+/Cup/sjs9+29RgYEvgEuWcDFrZaTetH8v/DwW9XY9SytzrHDVntGH37NMn30KcN
         KEAESvSB3/2Z+ZP5tSudysIU1QRS50m/9fkfypY3KnuWqBsGBM1zyj3CAuZvNLcmpFpL
         qboImcXHxjipElpe5KaE1+exRBlYKBrEBNCpGW7C5RRSXUS+mPHfOVsT1f1mzlUfWqKW
         qxag==
X-Forwarded-Encrypted: i=1; AHgh+RrwY3KfhAZt98laCzG2REzcQ4fw4Rcr5qo8ULC7Vda0s+TWFNwVYz5TYhVWtgPSaxfqN3ZmEsDW4Cbc@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSRMlRclCh7Gq7GANqyG+BZcBNYepFmUl1kX61nBT9uujBDHn
	V5CVvqFFVjI0qmdnXJ9EmYjrWWpzz8yvUalM6w92MwoORKIjA5TTQIQxBAWhNlTAAHFU2AwWbzK
	fjVVZ+GOeKFWVai123lsBhbNphwFR1CP9FoEbIYhSEgbx707yoyYeI79aEENL4hUN
X-Gm-Gg: AfdE7ckq9/83sbU0Vk5KdoZem+39ivuIf2R6d2JA7rZiaUBWwvaMnatGgHXZZrf/TJo
	KpcK3qXABqNWRubCdCzMIpa6AW4myj/kTBq1TRGojhuk8FH4Gjp/vupWCREZf4r9AbjMtU7cpFz
	Qw06nrt4XloES5LkcmRuxpXnTDI0Pk1cA8z3jHr1j0yLq67Nue7bKb9IBMXC831t+PP27FBRKK/
	4Xa9S7eYgoqTxGFNtVXSp/b/blQoMEBMjIL5Z1Wo+hWKFq5ZpygJ+lDzdUfsugkPZobO27XFLk9
	BOIbfybN9TIUjQJuGXYBZzQUNHfYMmFho1TVHTWDVU6wQ9/j6gKSF4XmO2l/w9Q4sb1Wth1IvK1
	ZgkYX5PzUVxWfLo1czBIRB1e3J+oHrQOsXT4fMYRpbHU6DRWR6tsYJGzazKqFxXowBxnkwe3BPF
	U=
X-Received: by 2002:a05:6a00:2986:b0:845:ccf1:49b6 with SMTP id d2e1a72fcca58-845ccf14c44mr8944866b3a.45.1782698904520;
        Sun, 28 Jun 2026 19:08:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:2986:b0:845:ccf1:49b6 with SMTP id d2e1a72fcca58-845ccf14c44mr8944844b3a.45.1782698904079;
        Sun, 28 Jun 2026 19:08:24 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40ee417sm10426170b3a.40.2026.06.28.19.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:08:23 -0700 (PDT)
Message-ID: <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:08:17 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260626154949.GA1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNiBTYWx0ZWRfX22hAr8pihU0q
 DSkOURiDwkI3o5oaL226stAY/dnC8Za3j2Uln2cKX/2ZoTkitoRMm86uDpiuBCi1BG59W5u2PRl
 L8WLWs7fZVZa0cvxsKfgSJn5f1MmBqw=
X-Proofpoint-GUID: 76oqcY7_RhrUq_OE7AhJE3VmleunAXWQ
X-Proofpoint-ORIG-GUID: 76oqcY7_RhrUq_OE7AhJE3VmleunAXWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNiBTYWx0ZWRfXx5AXGgET6R3t
 t0N5ApgqgZBXN0vci3W75RBe8TIu/vxU0hV8O3ugdY868U1uV9sZV5Y7dM67gg6me7M2CDxuCIy
 Z4S7Yjxc0iqpmVgCdpJuul2iX/+/DghymoYwCO2uyevOMCBOUbz9X8mY4vynP0hygojCdkYHMd5
 ZI71F3lM6J+Ew+89AD7Xs92AWakmmGWfj06kfZE3P+C01uEMG8S8DCb5+i5CZgGxsQCASkVcIXq
 UCIVJ7aR91m7FXRJbeThZa7KDUW4ObyqtFBhKXwXyabp8W4sgFR197scDEg+QJBjIxhWLJxj0mY
 cWz767BCZulq4Dp4RZrwzPWfFmmpjvH6sIiIqTG1Ys38T8p+C+Sr55h/aV3skZxKuUXHR3B9cOz
 eXOHapHRk+5VOC7cs4lZiSvlqARFyw8nDMHP4+ZeoKIx1luPdkVhZDV80U90T7J/4qAl7rSAn2R
 z7jbkvhKkEfhzxDfzwQ==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41d399 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=AzejHKQscgVUoiqplJQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290016



Hi Leo/Suzuki,

On 6/26/2026 11:49 PM, Leo Yan wrote:
> On Fri, Jun 26, 2026 at 08:09:58PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> I have another proposal: what if we allocate the ATID in trace_noc_id() when
>> the device does not already have a valid ATID?
>>
>> Possible scenarios:
>>
>> If the itnoc device is connected to a TPDM device (which has no ATID),
>> trace_noc_id() will be invoked via coresight_path_assign_trace_id(), and a
>> valid ATID can be allocated for the path.
>>
>> If the itnoc device is connected to sources other than TPDM, trace_noc_id()
>> will never be invoked, and therefore no ATID will be allocated for the
>> device, saving resources.
> 
> TBH, I'm not sure I can make a judgement here, as I don't have enough
> knowledge of the topology. And I'm not sure whether the listed
> connections cover all possible cases.
> 
> I also found commit 5799dee92dc2:
> 
>   | This patch adds platform driver support for the CoreSight Interconnect
>   | TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
>   | from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
>   | it does not have aggregation and ATID functionality.
> 
> With your proposal, wouldn't ATID be allocated for the interconnect
> TNOC while being skipped for the Aggregator TNOC? That seems to
> contradict the commit log.

The ATID is allocated to the Aggregator TNOC during probe. The "WA" in 
driver definitely break the original design.


Can I fix the issue by adding "arm,primecell-periphid" property. That's 
would be the best temp solution as it avoids breaking the original 
design of both the TraceNoC AMBA driver and interconnect TraceNoC 
platform driver.

The TraceNoC device here must be treated as an AMBA device and I am 
continuing to investigate the issue with our hardware team. We aim to 
fix it from hardware perspetive for existing platforms if possible and 
ensure it is fixed in future platforms.

Thanks,
Jie

> 
> Thanks,
> Leo

