Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B646138E5C4
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782712568; cv=none; b=HL29AnjqG9Y1dul4YLlLqScAIEE7JVp0VClhPa6SHSjaYCk4pXZRCE1sNj7O+GCp2YudoPWBUofZEf4ItIRnbXToKLPUvE2eFDUymaCLENIlPLpFCNrKhuyWyBwODUr+hZBwSV8ki8z7TS4cO5Aso/fqVsL4HNHHxk/YHSeqa1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782712568; c=relaxed/simple;
	bh=Mr7j3gKOAGqyiLE3oEXghtyLorH2MjCZtUHo1zFa/Z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isxQuP2gT14FkGw4ysa/qaqt+41pcBaa67TjJk6D+xH+V6Vv8F9FbCQd4FepG2U+oA5f4vSCainRqn9npL5vw4UH8/tLw8SpQD8Pc8SqpjPnWz2RaffcVzvwcgRMf6X1If86oCMTJJqAjAIajNZFhmXP7EygVtbVFON5g7tBm5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQXHEg9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbmnIBQA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQXHEg9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbmnIBQA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHqY1737504
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=; b=kQXHEg9a+fNPuipS
	9V91IUJn87aFL9Q9DdGquiQbvqkba4Lfm1qHDtd+5xCCLQUTeI2df28pwJWYZnMR
	oAOvV2juObyQl6Ali1aFka1AbQjULowB1dhywLLhhAhvNN9uZ0qgIPoZ+RpzWNL5
	XRPs94u5j472OvvX/spwsS8DzqqW12bDPa8wi6Loaiph6ZNcQqH+azrjtbPoQQU7
	Uh1jy3PQajJ0A/iFjxlAmppQQqd6BgTujNwu+s8tklgYSIZ4yNf8ToL6roeda64K
	rrrQMIRolZtLDkl7v8UqIEpDbA2czyJ98zgIs2pYCYMd9HvuEE8pRPEzZh3tPcJc
	WIRGDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmp84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:56:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37ffaca522dso391788a91.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782712565; x=1783317365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=;
        b=bbmnIBQA9GMmzLBYilEXRM/Wc8QV1VQ+n3G7WuRr+CxjCefjadSQ9TqkISOPfQQGXN
         QcnqdVKQQJ6n0TpjNfBw/50M9LGgOOQWXOXDO0HLCaYt1wVQATvdrI8wdItEP5xao3nQ
         zS7yjdCWVgxWiiI2kDQEGUr5ZB3cq1pXDmOzs+UTzH+CQpzi6S9u9mKWSc/wN2aaMNjZ
         nrENeAQFUW1mgdafViTYuqy0w3EOYlhqVvDpiFz8b+IQjZuSoYg/nAcRbjU8umJAtsxK
         Lg4UkGYp0JL3s8hMtSS0M9chRr24/4m24zZ3q0WyPNBTCwUAvNLqhLyutz5GBJEdPsPL
         UBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782712565; x=1783317365;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=;
        b=bU0F+YCJbg78CepX22KAva7OapmsJT2lKIiYTWw5W8BTIGT6B6VU/xnUeQY/ySlf+F
         2n/1MWHtZOBGD/DkgtnT9hrCJsDHtgynOxC3PnH7Pc3RsZsjkx0bXJ0x5F2+Y9Ye7Sj9
         XDk/Qv2kFIhpO3Esb4dboSUljkUog51BKzSd5jfKRRxw79LB29QvMH/7eQD5TD9acA0P
         B5XkTGXRFVrFAJv4W3i8rApkwLYHHtuKI2UWi7ANvhDK+14Y5xvfOw4H3uFk+Lum4sGl
         0xJFfk5IllgKDj9Lk6dZZmAdPbI8qySKJbTeKICLp7F71aKDJHToKiwLS2732PJzSdyU
         Al4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9+HGKLbb/sECZzu3dGuyKxI1RmILdjAkg7ZyTKmuhmc0w2692WSm8zBuGJ3lNevFheO2yQbEL74xwp@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDHgBO69t5KbQ9BUkQ19H1UJdf+Yuv+5CrFV5NyBJONKQWmiF
	Xbh/uo3/2BEqu4a7tQPaeV+vGA2Td3XacosfTlQyii6jjTdk/qdIb17+R1MIRt6TJspKUgxmYmF
	NRkdpxvaIOy++Vfx0P91UhQS/C3FLQon31eqjRd4PO6lolPkSeqqje9OK1Gbs8cLZ
X-Gm-Gg: AfdE7ckDfiYxywZcigC59wD6voZPezHo4Nt1j9nXUpfWDN8e54gMi6KJJq2i5OdR8Yq
	L1lU6fIEgCQ5a7gRqqgjiZNT8eA0dcGynr0y+t25fM2/Z5qklFBifAabEueK3+bYkZqq1GlVXZ+
	dZvtzgp1zQ9Q00kxk8h14wjU1fZhmjuIizbF7BdivCFLQkh6ROrCWOZQilodIzn9dYylPCFTaoy
	6g1JC3Qy0oULLDRMmcowTp/2HYk4MWBgAJgI2fuJ5pQJ9Q3R1bVqgQef1+HO8nLytzQnFdGL/3v
	p9fj7j/lTDp/DRHy+uPfpdXM4NDYkcMaEu9sFuK5EyTqlcGEs/hjFZ8uqSw1AuT4/OM/zo8DnD8
	e/dUdUN0kVydYKjb/CDMt0HncWSIYYcPw54d82boLf9SOcJXPbsd40viv4VZsNS+SUBaRj1EjQM
	BDZ2asQ9WI
X-Received: by 2002:a05:6300:220d:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3bfa69914ccmr1239040637.54.1782712565069;
        Sun, 28 Jun 2026 22:56:05 -0700 (PDT)
X-Received: by 2002:a05:6300:220d:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3bfa69914ccmr1239006637.54.1782712564508;
        Sun, 28 Jun 2026 22:56:04 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc91f6dsm7072662a12.27.2026.06.28.22.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:56:04 -0700 (PDT)
Message-ID: <1714ad84-18cf-48d4-973d-b5e454d27c6c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:55:56 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, ulfh@kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linux.dev>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
 <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a4208f5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=-HkNxc-VA3X1G4HRPRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NyBTYWx0ZWRfXw6z3AvHVIhPO
 SrKoUFSM4mUeC8suHxus9Ajg2ym72/PAEI8bLqgtPvqOYnRHrA54TVjrIUFMmosg6yxleEMKFLY
 HMQ8yQzTrNcL6ObF7r1VEGHzqzuihn4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NyBTYWx0ZWRfX1e5rs2oA8Rhc
 2fssU+3rQUAjzL4dBVEydTKabouPLA6U643Lhi38TYoeFXbs7zw7ou8biT4Z6i6VaY5njR/GAt0
 VxCuuUZ5Q1tW66OHi7VBJhMqKJwYbQeaS54i32cbxmZVWJXWhBq744fy8eh0ParpmySb8LxqsbW
 KlYxcNplq9drLPjI3Hhhr67UnfIBFdnZH16pr3pc38ezTpz0Ytr9n63XFrkp40+rHopjZKnMWHe
 v2wMJcbylLk0iSKW4UeBwo/7CPtRSfWOAJR3onjsGt/jmvnz7NYX8Zp3g4bGiXaRT5uGovWIUPT
 SpNR7UQWg++9D3AGG9g7vgAz6YEM0Iv3cbti0iZ9SpZXQ2+kRg3AXbC1NJl7zIHhfVVm/gfyZqV
 C5wujYse+Ol2tTPke0gAixQYWo/VJ9AAXJD6Jp4fu7ENeOmiquiahgANS7TNJ2xWvde3teJNILc
 HlNNyAMTGTpw34dnRLA==
X-Proofpoint-GUID: HyHFsItsk9HYUVgTm5JYmt_0uMnTt6Qp
X-Proofpoint-ORIG-GUID: HyHFsItsk9HYUVgTm5JYmt_0uMnTt6Qp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290047

Hi Sudeep & Suzuki,

Gentle reminder on this patch. Any feedback would be appreciated.

Thanks,
Yuanfang.

On 5/25/2026 9:17 PM, Maulik Shah (mkshah) wrote:
> 
> 
> On 12/19/2025 3:51 PM, Sudeep Holla wrote:
>> On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
>>>
>>>
>>> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
>>>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>>>>> This patch series adds support for CoreSight components local to CPU clusters,
>>>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>>>> domains. These components require special handling due to power domain
>>>>> constraints.
>>>>>
>>>>
>>>> Could you clarify why PSCI-based power domains associated with clusters in
>>>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
>>>> OSI mode was originally intended to support them? My understanding of this
>>>> patch series is that OSI mode is unable to do so, which, if accurate, appears
>>>> to be a flaw that should be corrected.
>>>
>>> It is due to the particular characteristics of the CPU cluster power
>>> domain.Runtime PM for CPU devices works little different, it is mostly used
>>> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
>>> framework to manage the last CPU handling in cluster.
>>
>> That is indeed the intended design. Could you clarify which specific
>> characteristics differentiate it here?
> 
> Sorry for coming very late on this.
> 
> This series is intended to handle coresight components which resides within CPU cluster.
> For the cases where cluster is in deepest idle low power mode or all CPUs belonging to cluster
> are hotplugged off, access to coresight components can not be done.
> 
> The implementation tried to address in two parts,
> 1. Using cluster power-domain to know which coresight component belongs to which cluster/CPUs
> 2. Schedule the task on intended cluster's CPU to make sure the CPU (and cluster) power is
> ON while coresight component of the cluster is being accessed (using smp_call_function_single()).
> 
> The use of power-domains in (1) will limit this to PSCI OS-Initiated mode,
> to have this support on PSCI Platform-Coordinated mode too, probably instead of power-domains,
> cpu-maps (which also defines the clusters) from device tree is a better choice which will give
> the information on which CPU belongs to which cluster.
> 
> (2) ensured that scheduling happened on intended CPU and while the access is in progress, CPU (and
> cluster) will not enter power down in between.
> 
>>
>>> It doesn’t really send IPI to wakeup CPU device (It don’t have
>>> .power_on/.power_off) callback implemented which gets invoked from
>>> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
>>>
>>
>> I am quite lost here. Why is it necessary to wake up the CPU? If I understand
>> correctly, all of this complexity is meant to ensure that the cluster power
>> domain is enabled before any of the funnel registers are accessed. Is that
>> correct?
> 
> Yes, This is to ensure that CPU (and cluster) power is ON while coresight components
> for same cluster are being accessed.
> 
>>
>> If so, and if the cluster domains are already defined as the power domains for
>> these funnel devices, then they should be requested to power on automatically
>> before any register access occurs. Is that not the case?
> 
> Cluster power-domains will be only available for PSCI OS-initiated mode but also
> will not help for cases where all CPUs in cluster are hotplugged off as hotplugs are
> platform coordinated.
> 
> After discussion with our HW team to automatically request power on for coresight
> component GPR [1] can be used but they seems not working as intended on the existing
> SoCs and will be available on next generation SoC.
> 
> [1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overview/Granular-Power-Requestor
> 
>>
>> What am I missing in this reasoning?
>>
>> The only explanation I can see is that the firmware does not properly honor
>> power-domain requests coming directly from the OS. I believe that may be the
>> case, but I would be glad to be proven wrong.
>>
> 
> please see below comment for more details, This seems not a firmware issue.
> 
>>>>
>>>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>>>>> power domain. When the cluster enters low-power mode (LPM), their registers
>>>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>>>>> out of LPM, making standard register access unreliable.
>>>>>
>>>>
>>>> Are these devices the only ones on the system that are uniquely bound to
>>>> cluster-level power domains? If not, what additional devices share this
>>>> dependency so that we can understand how they are managed in comparison?
>>>>
>>>
>>> Yes, devices like ETM and TRBE also share this power domain and access constraint.
>>> Their drivers naturally handle enablement/disablement on the specific CPU they
>>> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).
>>
>> I understand many things are possible to implement, but the key question
>> remains: why doesn’t the existing OSI mechanism - added specifically to cover
>> cases like this solve the problem today?
>>
>> Especially on platforms with OSI enabled, what concrete limitation forces us
>> into this additional “wake-up” path instead of relying on OSI to manage the
>> dependency/power sequencing?
> 
> + Ulf in loop.
> 
> Current platforms with OSI enabled, Linux PSCI do not implement the power_on/power_off
> requests, as far as i know, runtime PM was never meant to implement this part and
> pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is only used to convey
> to cluster power domains about a child CPU/ sub domain being on after it has already
> been landed in Linux.
> 
> The standalone invoke of pm_runtime_get_sync() from another CPU do not really turn on/get
> the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug paths to enter/exit
> low power mode.
> 
> To put it other way,
> For a hot-plugged off CPU, invoking a pm_runtime_get_sync() won't get the CPU (and make
> its cluster power domain) ON. In order to turn on the CPU, one has to still request
> the online of the CPU, say via sysfs command echo 1 > /sys/devices/system/cpu/cpuX/online
> which would invoke PSCI CPU_ON function and the power domain for CPU gets marked as ON
> only after CPU already landed in Linux via psci_idle_cpuhp_up() invoking pm_runtime_get_sync().
> 
> I used specific hotplug example but same applies to idle powered down CPU (or Cluster) too.
> 
>>
>>>>> To address this, the series introduces:
>>>>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>>>>   device tree property.
>>>>
>>>> Really, no please.
>>>>
>>>
>>> Our objective is to determine which CoreSight components are physically locate
>>> within the CPU cluster power domain.
>>>
>>> Would it be acceptable to derive this relationship from the existing
>>> power-domains binding?
>>
>> In my opinion, this is not merely a possibility but an explicit expectation.
>>
>>> For example, if a Funnel or Replicator node is linked to a power-domains
>>> entry that specifies a cpumask, the driver could recognize this shared
>>> dependency and automatically apply the appropriate cluster-aware behavior.
>>>
>>
>> Sure, but for the driver to use that information, we need clear explanation
>> for all the questions above. In short, why it is not working with the existing
>> PSCI domain idle support.
>>
> 
> Explained above.
> 
> Thanks,
> Maulik

