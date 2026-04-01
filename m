Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93070329C49
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023167; cv=none; b=BWfSjJKAMFsWiFG/xdMfMe2FWXCWNuTsCKRkgSM+DdQWQnSNzgQ4zctZIQxgAXhHJh9zhntmJgaHPnx9/rIs81lOBEZQfaf/4tCK8oCgVkRHtnkWLapqq1A13Rkne++qrqzyUAkzeJcT1impNjrfwdSUTrLk6xJRlRuHpybQXgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023167; c=relaxed/simple;
	bh=uAqnF5HZQNEEqlvHRtnLYcg05TKZBEbRd3bohfMDkzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRUkzfPHwma1SDH9aP+jJYdG56gtSYW0Yiu5zw+icHbPPQ3dIP3/TnbM1UoUkAdCfSK6Gxe42Gow+42/wjBnQ/a9vS7VpbedyLdUYOepOrM0Y01VfxyI8pvW9Dg8r9tovY13bjf8Ep2x4g212hhkw9u0tWR5nW6Tem/J9naRrLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJTV/9nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAlLELjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJTV/9nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAlLELjn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313mvRN1579389
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 05:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnn7XJnQB0ivTfZAs8ljRtbn7a+5VqmBZ2dne9oqXJY=; b=RJTV/9nkO5kYnt2w
	oHF89fgkY7m1W0OA4Ae9IXDvMqpTrPc72uGlS4XxCwdrBDxc93XeuEpvBwDt5/bn
	aC1vSOvjzSnZDjrRV1I0IB3m3hcbeB0guSGei2fSyN3YrV3Pn8o9mDybxpcgKtQN
	39SQZDe7W6l9kEshVT0dfWd4xZ1ANnSEkd3cZ3EEb23eW1PS/5WH+xDt05sfv2Ht
	jeeKVGXB2CJseGZMcSA7PuyqJj6XX03NCWh3MXVHgKISNCQmbHuz+JSLcAR+Z57w
	l8EigIKxxM9P/wrdKz3WjFDDA75VBSYU5ydblgUXLF4DyRRjN44/rG0Nbf2QFGI5
	rchvJw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2t0sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:59:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24e9b4d82so6436435ad.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 22:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775023164; x=1775627964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnn7XJnQB0ivTfZAs8ljRtbn7a+5VqmBZ2dne9oqXJY=;
        b=DAlLELjnFraXYWQ+RTC82u+CSrId6TCV+ABAL/PX9xSvFsoWhrzuZOOpX/ZhvSOusl
         0OVjUWG4NqvSjUynwJwLypP1kuHgqC1i3TpuWhSzQ2yTNoQR2z4XGFGVYWANA+FlBleC
         aPa+x3o/ULXSPLkLfn4Sm3iFU1Avq5FiYVfnJ80c+8Db8cIgqxWG1F3PK6KQughNzKYz
         Bt3OxGZQmEgSOy0eYu6Gjg9/Yyip/z0YUyE1EhZIP76cJVYI96G+QSW15oLn9r3jLmjH
         BLLUvFfsiKIZ0YqCX8kWtjqQ/egongdiGKQ8otku++85HK+l3K1E9bPdPDp1dHYDxIVS
         fxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023164; x=1775627964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnn7XJnQB0ivTfZAs8ljRtbn7a+5VqmBZ2dne9oqXJY=;
        b=YTIj4Oo9Ksw8T0Gr+m9GZ0HAG0cvtwErC/iFsF4DLkGylFMAxkQDJTyyIEGhFCgden
         AfuhrhpazrsQ8Y1eQeJcChZUKryR35w1CG9ergb+XXVpH0ErG4lPF1ZfC7RcacdJZ1f8
         R+k+XJXqY+taQ7UESTMyLSgnRjDlc3wYVIiZCY+QA44IgqBbCzimTjgcbR9FKEbgJkPp
         PxYCrWZrgNgX1E+TJYA6s/G9AWFi1EIn/RHR/o1popvEeCtYyhuFlKhcE/3HejWDDehe
         hcpfO4QKUsIkQP8HGmVpr93MJTeupgRREXjY79l2Hoc/YpPFSoPkgYxoAkaCj/Jb9rTV
         iNVg==
X-Forwarded-Encrypted: i=1; AJvYcCWCxxXeoskNm8pKra5UWCTCJPsjnp/OpmjnPuJIlo8uEXZCgR9JM4t6JAFNR8UotHqxBnwzHnsU28nJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+zWfArP5Ez/KBrRq0IUL4apzghAyWUlKomnPMDaPhUAVCO4ub
	9kGght9QxlxRgM+EboJ/QBcwalZ6hiFyiTweMK8qbmzI/lWnT7SPn0ti6ZeTzZTVjAYovlQvA3c
	Ex88LAdcgrAapg9Cy1GtR+Xw+JgnXIfBeaxJEmrWAJCMv2Xt0n9SjHE2ZrcFaZ73a
X-Gm-Gg: ATEYQzzXub1cayEsKKWAMONa3l71BqoIeGTNK6Gbdo8cb/ahLY3XAp0V2ASNlVau6X2
	/0WAHVdi3QXYqjMHl+ANNBsqhG5vOuHtmclvTR1JU+cSGJHeZAUYhxrnXh4J7gsQsU4I7j0/L1m
	Gps5m1hNaLix9VOcKzcylm2+ITIGwGQWjmAC/+a96DPSrxIKz48w6tUNnvTz+XZKhjK0gHRjt7x
	6Yfleb1YygxCR5awjW7wue1M7SlZED4vr3N20lGgkrAlu7Aoi1efz1P1UtJEyqni439/yxK8n3M
	bXvlSTRLxlrFSHxcJeBXfZAc1RUOItn/hFXKsgnK04+l7iUq9CPSdcEdx6fcO00zeO5QHFDEurw
	cvr+gt0oev4n32ayHV6bLKrTvgh5ehuzdsuVo61Su9fmjfN0vNH8=
X-Received: by 2002:a17:903:1acd:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b25eeb97b8mr58989615ad.13.1775023164374;
        Tue, 31 Mar 2026 22:59:24 -0700 (PDT)
X-Received: by 2002:a17:903:1acd:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b25eeb97b8mr58989265ad.13.1775023163872;
        Tue, 31 Mar 2026 22:59:23 -0700 (PDT)
Received: from [10.204.78.131] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279113fsm136283885ad.60.2026.03.31.22.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 22:59:23 -0700 (PDT)
Message-ID: <b9ba144d-cf68-4aa8-947f-560b241a1b7a@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:29:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
 <acoCFMdKRviiMZRp@sumit-xelite>
 <3447efbf-2720-4c9f-9a74-ca9baafa96ad@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3447efbf-2720-4c9f-9a74-ca9baafa96ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69ccb43d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=3eSu6wPcG68MjonYX6EA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hleWXHj8FAJnc4f0b1itkHHNFhD7xPb9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA0OSBTYWx0ZWRfX4pI4nIhbHJao
 z509zlCjCdBt0TKbiS/cPMBvJOsew7GVukB/thltr2icyapRTiRYfdbnoX8gtI2LzQlElk8aN4t
 Y8ACdMqFaeKnqJSWv72alUrIJR+6xwDEgGFYH0yG1VWUP40n5p+Gw4YdZz65ZAr3JERLp1pY8u/
 lbvIsvNUdP3C7wZMcF3515FeXUOdqGykMUfB7MM5RSfsxqcHF220EV3208HrJYrQEDmKtVYf32S
 K6d0HW/vyPmcGgSz7xO6nBw2RiaTLHM6A6SakdKLM23EA4OxXanxV8L6TYowrpWcrcusQgQPd0+
 SnpvmmtOnd1b1et+L4Csi4ozGBgupRyle3PxUzyzhR51kUUYRhKuTcSfvko2xQlos9RkfxXkAhJ
 y6V4mNfLsQ4augf1QgYiV8IQVpNmjFLG/A158DN4ciIp0kUowPv/3tfa6w9eiEDxLaPtcACtJZw
 8Wj1AYkVcjhN/oTFtpQ==
X-Proofpoint-GUID: hleWXHj8FAJnc4f0b1itkHHNFhD7xPb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010049



On 3/30/2026 4:07 PM, Konrad Dybcio wrote:
> On 3/30/26 6:54 AM, Sumit Garg wrote:
>> On Tue, Jan 13, 2026 at 06:41:59PM +0200, Dmitry Baryshkov wrote:
>>> On Agatti platform the ADSP provides FastRPC support. Add corresponding
>>> device node, in order to be able to utilize the DSP offload from the
>>> Linux side.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Add more FastRPC context banks (6, 7)
>>> - Link to v1: https://lore.kernel.org/r/20260113-agatti-fastrpc-v1-1-e210903ffcb1@oss.qualcomm.com
>>> ---
>>>  arch/arm64/boot/dts/qcom/agatti.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 41 insertions(+)
>>>
>> This patch causes a critical boot regression on RB1 as per the CI test
>> report here [1]. I see this change already landed in this merge window.
>> So, either this commit has to be reverted for v7.0 release or an
>> appropriate fix is required.
>>
>> [1] https://github.com/qualcomm-linux/kernel/issues/359
> Why has that issue been opened 2 weeks ago with no action since?
>
> FWIW, copying the broader log from the LAVA job:
>
>
> [[0;32m  OK  [0m] Reached target [0;1;39mBasic System[0m.
>          Starting [0;1;39maDSP RPC daemon[0m...
>          Starting [0;1;39maudiopd aDSP RPC daemon[0m...
>          Starting [0;1;39mAndroid Debug Bridge[0m...
>          Starting [0;1;39mAvahi mDNS/DNS-SD Stack[0m...
>          Starting [0;1;39mBluetooth service[0m...
>          Starting [0;1;39mD-Bus System Message Bus[0m...
> [   17.318840] qcom,fastrpc-cb ab00000.remoteproc:glink-edge:fastrpc:compute-cb@4: mem mmap error, fd 11, vaddr ffffae380000, size 262144
> [   17.327877] qcom_q6v5_pas ab00000.remoteproc: fatal error received: SFR Init: wdog or kernel error suspected.
> [   17.343248] remoteproc remoteproc1: crash detected in adsp: type fatal error
> [   17.350567] qcom_q6v5_pas ab00000.remoteproc: Handover signaled, but it already happened
> [   17.358869] remoteproc remoteproc1: handling crash #1 in adsp
> [   17.364730] remoteproc remoteproc1: recovering adsp
>
> Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> <ded>
>
> It seems like this only ends up being a problem once the userland
> daemon starting poking at the channel - +Ekansh, have you seen this
> before?
Looks like daemon attaching to PD is causing some DSP privileged PD crash. Checking this crash
now, will update here if I have any findings.
>
> Konrad
>
>

