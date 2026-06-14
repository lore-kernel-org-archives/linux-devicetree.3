Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C84156C6A
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 03:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781408332; cv=none; b=HO9f74RaoDGroTlhDVjA6jdBaQxKhRpc2FamU4Y0UayuaaKC/GwdIpsOxjlhQvLEnWJFFHbnaDO0twvjlq9bHq+RWs2IRAte7fkfpW+OE5634opJDSIvWM4dbo/GZ33yzaMN2cdIOEjqwWBo1/X48VU3rXgZCNKVDv0hvqHD0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781408332; c=relaxed/simple;
	bh=WLiWxTnhzrQgPu7cNyodDOXgCHLzQQEe2vLlFVSwvqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bk+bJk2Vb1AJtybs6qcSoxTRvlqr6X7BdEkX2SasoEve/LzK2vg6Nhm1Wj+SXeKNT7xOyng465ZpyqPwE/TJV+qf+l/e1ArByaEsf4oGHr2AqAC8GRj/XHkKoKYZR4+bOWg+rDmjgn8dLo+FCuReTaWFuLbvKlaQnB3HmdRFgWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqmU9Rqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bwhqh97H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqmU9Rqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bwhqh97H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E0fFsV082839
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 03:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=; b=hqmU9RqjIYtYVAKt
	35G3C6DE2qi+zkwOqQAjcrgESITOW8NyTkj7bl7U/8PntyYLtC/v2TW9B/M//sPB
	Tpm6ZoCFadAhlDwHdYOKcqaIX5QH4axia/11lASzhs6W34/iJqjZoAQ669/hS0YW
	KAYksgufdtFoiqfUMbtCqqV7ktNHAleHQAy2YRg9lsxSj9IhtLcZP6JBlUbXuM5L
	9f1H6uf9JuPGtptlfHSM7wRFy7jNuqo1zpPUcABIsMfm/5ezV+1OcVB/wN2DHE4e
	6gXccBWHE8Qjzs2MLs+uL+ik0mgkvnonHFBaGpAzmJX2/CbXQvH0CPzteoxyg2pm
	vL0NlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6akuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 03:38:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c73so3419045ad.2
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781408329; x=1782013129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=;
        b=Bwhqh97HSuuMG4+GIdC5EjKS6pma0Q9IEUEnk4XRPu8bmQEpTQipVE3XOr1Gotq16o
         ehVovTPy0zlRJ+8lcPAnh6FpOCWDntZpMHOQKl4V7FnO6F2flBCF/GmQ1yv80f9nuaOX
         MgCt19L/81wrFNut8ndnRLLHnSvTLFmONXGAO9YFeSHBvvL2LqgkKfc7WAP86asZpOKw
         vhtS+D+pYyF6P1w6CeRINlemG3H4Cll27O9XZqpuEOTYRzCmpzCI5lYSz6Hh/d9EDy16
         GQeTo4QP6xOHSkmZjPrbg90EZZMSxpaKXy4qEoY1hKt4mNblNM8pH/p9uIq05jPl2s3Q
         AWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781408329; x=1782013129;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=;
        b=Sw8VvHeinnekECj88RxNs71KI9d2jKeXIFiJdFu7bgcTyuQnEpVu1zHvuK/YkkVE1S
         x5VKOWSTVesu7LGbf/sqKK4dlonc13CIFEp20WhSX/sCSY/WcCQJ5n1AyXlsGUMhkbmh
         +fkIbZHavb7lPjENIfEb4HuI8hXpZEZYLGaGSLoJm81wBHoQj0/vdVKvTVxJLLyOrL/+
         43UL3Nox7jw1ZlFJEDAGZyFog+kwIPfDjkyQfaDEEntdpByYz0UAAgpH9VtlIOhLJ2j4
         Bz07SmKQMh0+a6rTfw+kBi3ed6lKQEgLh5fZaWI37ABQYDLpOUHVkj0Ogi6qaFkpXZV/
         pJSg==
X-Forwarded-Encrypted: i=1; AFNElJ/vsBqYP2EbpiHwWCwyT0l7NTdSknzxskLdvWizgzUIsydTO2RtUZBuWiiV7qQlPg0e0cP1WyGRV8Fe@vger.kernel.org
X-Gm-Message-State: AOJu0YyrZobUj4shH4xwXWQS0easQqQuBKD3hlpeM206vJ0KTokXoXgv
	X19AAXwm7tMl9FCyVbR5u4B82Ry3WU9Ah8xQWeqcE2gX945dkpCCkkQfUIFW/a9wWTE6cWQ+lLl
	qicwhtH3P3Q2cGY8VXhaAjcjNBbF6tCWs/fsct9S2OtELhL7s+Cr8a+Hs6/+pRGBn
X-Gm-Gg: Acq92OGNGnwrgsW7Az5/yV4xr17lmKVhmB3USz/1IAjKqZedaq7vjWeM5ND/zA4X8su
	4pF0tL6jN3VBFbwVSjtjBnw27pagDykkNWiGnGMrERtpqKMMIHSWgbUQcfsSOHoMpSq8NnvVY59
	4FjWdpvnAUq8hBeg4CYKpaWwypSPD76lj5ojmocW2riieQvWaKbA/1L4u7l4h1NFUQpA9d1iZnp
	xdk46SDowsYKl9UxXuZTYRr7fQQdIgHi9Aufb1AjCIqwK6i3m86xQ8KRtKMyewmJhLzwwAiTDJw
	/1Dkgh0qTo8IeJ42203p4fsl5Tcma9hSdf5OlZK3uR1RbAcMjiFzGpQg1FNhew0UKmOFr3jtvjS
	oObOX4eqood0pt6R/9R05Dydj9V80ALNu0VdSlw70frdeIA==
X-Received: by 2002:a05:6a21:6d90:b0:3b5:52b6:f641 with SMTP id adf61e73a8af0-3b78420cc46mr4683325637.4.1781408328858;
        Sat, 13 Jun 2026 20:38:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d90:b0:3b5:52b6:f641 with SMTP id adf61e73a8af0-3b78420cc46mr4683313637.4.1781408328271;
        Sat, 13 Jun 2026 20:38:48 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f896sm5703024a12.23.2026.06.13.20.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 20:38:47 -0700 (PDT)
Message-ID: <cdf6db72-244a-4e18-bfc2-4ad52f9b8777@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 11:38:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
 <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
 <aip7feoTn0ncwzL7@linaro.org>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aip7feoTn0ncwzL7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDAzMSBTYWx0ZWRfX96vjNhHT8Mnf
 LcX7sRAqc0LpQYrftWOTnMmwktLELkUURTRyLMqNkxropB3l6z4/aRWihduH50kr6kPr+4s9SR4
 veMp/hWLbRTKE48B8i8OYhFKnjeRBKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDAzMSBTYWx0ZWRfX7xgIJ+28C9s0
 eBjtGGni06J22xO+AUzkPwL9R5+9QwAl0JSInu0F+kVhhbB+lYvOkGEmPhRgXlor7VTPKPjGDFu
 hIRWysHU9SPY5mRUcQuYIitZQxRusP0dQYPrbZFweHGa/hRiEZK4mLAl8OtVdi3nd8Spr0ohx2R
 isDcZsj2mMrGAd8ZFAvV8ctxXWG896rg3/TUjGM+yP3040vcveULQcxyUr1X8P9aOYgEqYPbp9u
 a0ElJnNNvV4picZsSpUYbAVZmSbpVwU/ROgj72fDBVJvZ6sIIg5PAmzaP3fjLo/Fu4QuYVSDQY5
 7bKszy5Omp7+/cw1pAMmM4j9Qjigqlzq3vdP7f7u6KJqGWt90ZFq0OlHicA0RYzhNy/z0D0Gl3c
 72YnXWJ4taCOAQEGC8FFG1/DxPPCVWbI67cgNmQD+asGJkTPG9IB8fCUo/D0rMn/DvOe0cUePL9
 /z/FPURXrNlIzYVuqkg==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2e2249 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bdzlAc8VpKKGP06_0pAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ua4ENlwbsgll9aJ5D-Wnqt5z5j24YMpi
X-Proofpoint-ORIG-GUID: ua4ENlwbsgll9aJ5D-Wnqt5z5j24YMpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140031

On 6/11/2026 5:10 PM, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 11:10:25AM +0800, Aiqun(Maria) Yu wrote:
>> On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
>>> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>>>> Subsystems can be brought out of reset by entities such as bootloaders.
>>>> As the irq enablement could be later than subsystem bring up, the state
>>>> of subsystem should be checked by reading SMP2P bits.
>>>>
>>>> A new qcom_pas_attach() function is introduced. if a crash state is
>>>> detected for the subsystem, rproc_report_crash() is called. If the ready
>>>> state is detected, it will be marked as "attached", otherwise it could
>>>> be the early boot feature is not supported by other entities. In this
>>>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>>>> can load the firmware and start the remoteproc.
>>>>
>>>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>
>>> Unfortunately, removing the ping-pong functionality that was present in
>>> previous patch versions makes the whole mechanism a lot more fragile.
>>> I'm not entirely sure if this has changed in SMP2P v2 or more recent
>>> firmware versions, but in my experience the SMP2P "ready" bit does not
>>> tell you if the remoteproc is actually running. The problem is that the
>>> "ready" bit is asserted by the remoteproc when the firmware is ready,
>>> but it is not cleared when you shutdown or forcibly stop the remoteproc.
>>>
>>> If this is still the case, you can easily reproduce that with the
>>> following test:
>>>
>>>  1. Start the system as usual and let it attach the remoteproc
>>>  2. Manually stop the remoteproc in sysfs (echo stop > state)
>>>  3. modprobe -r qcom_q6v5_pas
>>>  4. modprobe qcom_q6v5_pas
>>>  5. If the "ready" bit is still set, the driver will try attaching the
>>>     remoteproc, but it's actually not running. No recovery will happen.
>>>
>>> In this situation, it is very difficult to detect the correct remoteproc
>>> state without relying on an additional query mechanism like the
>>> ping-pong feature.
>>
>> This a valid use case and concern. We had a discussion with Bjorn, and
>> want to take this scenario into consideration of the separate robustness
>> improvement series[1].
>> Stephan could you agree to have the basic function in this series can be
>> go in firstly.
>>
>> [1]
>> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
>>
>>>
>>> You can make it a bit more reliable if you also check the status of the
>>> "stop-ack" bit. This would tell you if the remoteproc was cleanly
>>> stopped with the SMP2P "stop" mechanism. However, that will typically
>>> still not fix the case above since nowadays remoteprocs are typically
>>> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
>>> case. I believe this might set the separate "shutdown-ack" bit though
>>> that is described for some SoCs, I never finished testing that.
>>>
>>> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
>>> tell you if the remoteproc was forcibly killed using
>>> qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
>>> solution would be querying the PAS API to tell us if the remoteproc is
>>> actively running, but the last time I checked I was unfortunately not
>>> able to find a documented call that would tell us that.
>>
>> It is a state currently kernel don't know whether the remoteproc is
>> offline or crashed when ready==1 && error==0 && ping-pong==0 scenario.
>> If it is re-modprob, the software don't have any data and only the
>> firmware can tell us whether if it is active or not per my understanding.
>>
>> Maybe let's have this scenario and solution discussion in the other
>> series I mentioned before.
>>
> 
> If you add a new feature upstream, you must make sure that it is
> reasonably robust and reliable. The other series is about generic
> limitations in the remoteproc subsystem, so I don't think you should
> move QC-specific parts over there as well (personally, I would have
> probably kept all of it in one series to make it easier to understand,
> but that's subjective).
> 
> With the current firmware design, it's hard - probably impossible - to
> make the status detection perfectably reliable. I would therefore choose
> some reasonable compromise to start with. Given that Shawn (and actually
> me as well) would like to have attach working without firmware support
> for the ping-pong functionality, I think it would be reasonable to start
> with the basic detection scheme discussed above, i.e.
> 
>   ready==1 && handover==1 && fatal==0 && stop-ack==0 && shutdown-ack==0

Ready==1 and fatal==0 is already checked in current patchset.
I am not sure about handover state, may need double check.
stop-ack/shutdown-ack can be added per my understanding.
> 
> The ping-pong functionality could be added later for platforms that
> support it. It would be good to have the interrupts already defined in
> the device tree, so you can tweak the driver without making DT changes
> later.
> 
> Thanks,
> Stephan


-- 
Thx and BRs,
Aiqun(Maria) Yu
