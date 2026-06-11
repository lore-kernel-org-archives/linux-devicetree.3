Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3DF2E1746
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147437; cv=none; b=SeXh43bugymDktBeCdRPI85rEj5pdfQ6bRBKeEdGuW6qKand4hEoWVutXMVYYWJb3ZRsvcQaA3QYzbjnpOuMAtxerBYwwYbXZmun1mjhf2Q4wEK1Vj82kJdLs6ZBchaLxMH5M4A8PknawrEHUUW179gcHIzBAeQEbN39it+hya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147437; c=relaxed/simple;
	bh=/xDqAx/7oWtInGBo7t87Mo2o7EzRq/zRTqU+5rnPOvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He96pL1ezfCP+BIUzEZg3k4slMgkfOyWGU3NFY1iLNe2mO7qNFp874C8oL/JhcHikLkwub5EnmmNfVcMWcyWV9teyUkEm+msDDYI768NbfpZRM9zxRgUtuzkr77GOiTuPBaLEAGSmyqidk+aS33eQCybwU0sij1pJBW7S5uRhFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcH+fQ0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZLZku9o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcH+fQ0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZLZku9o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0O1713180158
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfOXY/bV6WKanzF7Cg7TmExSjsVgoEG3Y8BQ1vxwqO0=; b=KcH+fQ0TPi0X+nmB
	+/D2wqO1pwI3aRF9/pjdfsU8FHH9iIAihTO2EqVifeZQecpVKJ8t5WSbnShJHfM/
	MlRtMKnfmYAstu9Wn9qnoM7EvNsRxUJwN0FsrLhzqG92LInwz0+H9DjauVR9pnyb
	lMvnKeGFxcdSpGZQosBMGqdoQn2H3Sakc0sn8hU27KduhdU16WJYFW5KrkMLwGzC
	AE4EwnEb7d9STfP9QY2zxes7/TfCXs7aJ6j/7xIBCQ28TlMn+VwnwwLvEEFLhEHY
	W2xL4HDxdUF41mqMQzfvWqBDhHD8P4ifIUyoSEAd3TncAWp9b6KL74qCb00oWBa4
	cLY9CA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71hfj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:10:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bbbaf6b23so1498342a91.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 20:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781147433; x=1781752233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfOXY/bV6WKanzF7Cg7TmExSjsVgoEG3Y8BQ1vxwqO0=;
        b=cZLZku9ohUY3Kyh4kJ+N5u+FBb4tognclMkXq8Khwn+fFFuc7z0vl+U5CkTWeNaKbg
         zTcRzVlOT5f52BgR/ky9jgoDnD3PgDT/UZsFWjMjccxFYL3dGd1b2sMNiwbIGRmffLAv
         RYwx5yOJB+U6HVpcntj+61N4mUNfmWI3QtnayhQZ+lEpXYYP4kvysBkvliWr3I5/3tvg
         K9wRDIwzOB7OHZg1/RGSgbgtel7/2J/MErVCqN0vPzPRWFp+rdGcukk6wPXqbaYebECs
         2SGtm2L6SHnX4UMbutsWbGKEx1Yw4SIXgEuS/f6/l7qrWQS+SVwstv9x0kIfQlAYroXL
         F8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781147433; x=1781752233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfOXY/bV6WKanzF7Cg7TmExSjsVgoEG3Y8BQ1vxwqO0=;
        b=q0jlwaPMY5DZiZGVmLmIFHMXo/hH984xjGhy7K04Jf2btHi0EV0s0UJ87O3sweQBk9
         iFF8nN4NyfFxZm0MSH0IqmAH6bNZjX97cb8PP3Zx0rH+qqU+ejU3TCBVQQlSCWpI/pzA
         u3b2peFIkMr0StEBqK20fjSs+WN348bIqwPGq75jaa+BFve/1pWNN+wJM7EQr667UMBm
         yeTdvipmGesY45j7wht2fjS6smbC/qxDcg1kq9e/XcykOkDAwhKy0ibmm5GQVT8Vv7sV
         Y4Gc56GJ2OwESnH92lLMgn9n/YSwfbG6rFJG2toBjIfkpa+fWj/vmYMW3sfyJU7YYJ3v
         mgaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Skf2/gNNtgwptRtJ/UwLVwsmb+ROQ/bcLhOR1qrWhTuja0jH0zo6ohTiCFdcPO0Yedao1NraNJ7Th@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnkZqXXQ8M/FKNI4pTounRY2n6mqO9ZZVNetSxgp7/7H+3kup
	U2ar5KHWdVqh9NOquIfnnZ6c4Rl1gYf8qKwHiJsjLK3tvLOakyTswdLqrWgeZQn3NvRlEBWXBKC
	o1mm+WntjM2cy5DjYHESfbC3jX9nuvBvaLFqdHAgBx4CagU2UOzVNaAHq0V8Ft35BLv/jRJ1N
X-Gm-Gg: Acq92OGQuBZiJRZ6VO2A6abHEAmw9wVGr+Nthofzo9tN/5CmhlyYJN54tQqYLSKi1yU
	esu+Gmd5V/UaVJjJTobvAFrhr9Q/LQGShsqiuRVP35ERXAT+ivNo+3m1Dc1qUxv+1D28xr0/Vaf
	sEHuzgmXM4Ej6Rb1WJt0XKX7xgRLnfPSQFeNy/wOCsW/IwRTPRC4pe2nQ5K+snd47XV1VrrOALB
	Q2JEp8qOdOPrh8LHvhsB1W0FUbw8qIeqfHLSA2+b1BaUWj8YoWHkJZITOcnSLGAlI+AyFJikxjw
	YvJCh9/tE4aEoNmgPqCW8+IvzBBgjq0qkAlHbxmYG8T+mVNOh5Om1IA9MQqG3Wf/2sgvOViyG7e
	z7TJ97Ebqst0nIL3XTw/SeYVHPWKO8cbRHWCO2zU2jV54Prrxe8RFybgtXdk5lojj/DvZAEVBru
	i8OvnElsRYrynF+geJF8HlTWM=
X-Received: by 2002:a17:90b:384b:b0:36b:5b82:4846 with SMTP id 98e67ed59e1d1-377a73e2c9cmr539083a91.5.1781147432855;
        Wed, 10 Jun 2026 20:10:32 -0700 (PDT)
X-Received: by 2002:a17:90b:384b:b0:36b:5b82:4846 with SMTP id 98e67ed59e1d1-377a73e2c9cmr539052a91.5.1781147432287;
        Wed, 10 Jun 2026 20:10:32 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3774f99cf24sm847549a91.0.2026.06.10.20.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 20:10:31 -0700 (PDT)
Message-ID: <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:10:25 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <ahBG6jKYdSAboWjs@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kbpy5ew8CoaCl7XCdCYFoNz7zIA7cn75
X-Proofpoint-GUID: Kbpy5ew8CoaCl7XCdCYFoNz7zIA7cn75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAyOCBTYWx0ZWRfXwUxBX5zBsyDU
 R13TbcgKmSXGPyjiGUzyR28oOQ86x0MDEQkXrgO24DkWVSF9XhLbN3dH8As0Tw8voG2EyXAGcsf
 89Pl41XVz01UJbowKnlpQs2R5wbfToJF8V49UWrnNWBgKjbf+ve+5rQMVv60T4eVwzcXG7PYgw/
 3Pa7Se4Wloav+zYMzMl5SzKymSaKhuE26XeT8s2Olk5tPd2OXIjNP6zqYqpnW4UPmvmVkapgojp
 +JIV/h+Xf8wqYSw3LyuN2Gra6pWbWSwBtd5sYSPYMfHS7n3IQ88sn0smdW+ua2vOublcB6golNd
 E2dxeJAKoxe05r+ufGngYB2ZhVTlxIyWZHU03JKUgtIYztzSj32OBScbT7w35JU4P2O/jy9ow4/
 eMwWeB1lx7eeXgLjn9xTcz3DvAAT9+MxETqBqeuFldAYJxzKRGs4giMq9PZnTt3q4zfSGZn2gWo
 2nRouqLsDTRWXdSWMOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAyOCBTYWx0ZWRfX919ZiJr+vOXb
 Qc+RLlkNTSPkvFxm7Lyd5VTTlu7R5HPqQ8itmgyCTmY/9U2fosuSyNbzq8Z5oHJbr9karcVmGT+
 HyJJOTuEW/wFg+Xv7Ln0ToIL543Ssmo=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a2729 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h3XtbvSS6J2BgG28aqoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110028

On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the ready
>> state is detected, it will be marked as "attached", otherwise it could
>> be the early boot feature is not supported by other entities. In this
>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>> can load the firmware and start the remoteproc.
>>
>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Unfortunately, removing the ping-pong functionality that was present in
> previous patch versions makes the whole mechanism a lot more fragile.
> I'm not entirely sure if this has changed in SMP2P v2 or more recent
> firmware versions, but in my experience the SMP2P "ready" bit does not
> tell you if the remoteproc is actually running. The problem is that the
> "ready" bit is asserted by the remoteproc when the firmware is ready,
> but it is not cleared when you shutdown or forcibly stop the remoteproc.
> 
> If this is still the case, you can easily reproduce that with the
> following test:
> 
>  1. Start the system as usual and let it attach the remoteproc
>  2. Manually stop the remoteproc in sysfs (echo stop > state)
>  3. modprobe -r qcom_q6v5_pas
>  4. modprobe qcom_q6v5_pas
>  5. If the "ready" bit is still set, the driver will try attaching the
>     remoteproc, but it's actually not running. No recovery will happen.
> 
> In this situation, it is very difficult to detect the correct remoteproc
> state without relying on an additional query mechanism like the
> ping-pong feature.

This a valid use case and concern. We had a discussion with Bjorn, and
want to take this scenario into consideration of the separate robustness
improvement series[1].
Stephan could you agree to have the basic function in this series can be
go in firstly.

[1]
https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/

> 
> You can make it a bit more reliable if you also check the status of the
> "stop-ack" bit. This would tell you if the remoteproc was cleanly
> stopped with the SMP2P "stop" mechanism. However, that will typically
> still not fix the case above since nowadays remoteprocs are typically
> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
> case. I believe this might set the separate "shutdown-ack" bit though
> that is described for some SoCs, I never finished testing that.
> 
> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
> tell you if the remoteproc was forcibly killed using
> qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
> solution would be querying the PAS API to tell us if the remoteproc is
> actively running, but the last time I checked I was unfortunately not
> able to find a documented call that would tell us that.

It is a state currently kernel don't know whether the remoteproc is
offline or crashed when ready==1 && error==0 && ping-pong==0 scenario.
If it is re-modprob, the software don't have any data and only the
firmware can tell us whether if it is active or not per my understanding.

Maybe let's have this scenario and solution discussion in the other
series I mentioned before.

> 
> Thanks,
> Stephan


-- 
Thx and BRs,
Aiqun(Maria) Yu
