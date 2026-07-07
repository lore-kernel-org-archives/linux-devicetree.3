Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB83B6BF0
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407079; cv=none; b=B554jvy2bZl3//e+u9SRdSwW7K4ER4/xbWaDaYHIChwHlJTiFDvLewEN6bVRBp/mQt2xkjTjC43pasmMiBr8h+LQ/wpi4sVlmDNwICLht/z3dLpo0am92i5NHY4bT7eKdVxU5P1mr6HpW9TdrUtg4utapCqOjexsl0Cznw/veNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407079; c=relaxed/simple;
	bh=g+2xhVag6spj4YNFX8Jx/a9MXzwc1CEg6FaBobY3B9k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VIiQE9QOLVmY6S32+LkykjYWbk49xiG8SJaz99eoDgo0vug0pXFag1lui8frpVFUA0tbxmg4v5KFAl2nAWQP4Ep+D6O35uu6RKfEUKJeDVPsM5DQTDOJIH2f3HRxNReNsBK3NION4xrhLfkSdQzkhU6vjG6JkSD7oaUoSd88a0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBOTGI3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lf0iO7zi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBOTGI3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lf0iO7zi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748u552688424
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 06:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=; b=kBOTGI3cGY5uuBJw
	nbmu4qxX2yCl8l0D7j0EX+FXMdVNRxRYznEUbjsuwK9ntDEd9dEpPT3arFbD2xcj
	QBDX5h+3EqNpcimdxYVjZtPicedOsQ6/qFtSe9dzPbcqEigB9+3bs9dHLLg8wkVQ
	Irnx23chKPAh8JnvA6BL0CRuGeBfCkEIEDVspYhZ8WaeEFOQ3ae1Q+V+Z7CYKnec
	SH7d80taHVlneKgwVKYcQ+oTKV4xum56FWHWgQX6ix0WaOF8z11kbEErcm9nTIGP
	q8X5xuRStivlW0N6x/qBLyNBL1ByfzMvPhn3/kZqApVFJwAtb+j+8AqIfSv/OmpL
	6ex9Vw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gvkqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:51:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdc8169a8dso4403663e0c.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407074; x=1784011874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=;
        b=Lf0iO7ziKUM7+x0SfvxYZO0ogzc1GCkKRRvPkRzK5l+T/ljAhlnFDOJGNJie7TNW2f
         37c1MCUrzuWLcOzDCCM5tTNdgsIVotF81urpZpUN8/CLNhVBANiF+QSRjhokJa4oZj9o
         tFwCdSol+Wu9xGOeFnfu8Upqqrf4L268Qxmp08Rndx6sG7eCKRsc/gre4JAPcvh/vbv9
         3I5z3rLG7lYigOEn7zmUf4pEj8o4mfI4nCN8v0fGGb6JDcqNo8ii20bmVwFvEkL4rgMQ
         ae+27hXTZ/QrIgh1K1TtHWgPoeKLtCSPYCBHirOeOCnQES0e1+s7LxFyjukgxnag7JgI
         zROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407074; x=1784011874;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=;
        b=Grmbiy8spkD2FEOhpFA7TYHEFqPIzMNWyG6tS1ThJrCMRF8qHkUGhhgfzKgjMuin4h
         TwhKG4ukHFU6ufKV+GcfYFrlQpK0iVo28ZnkDMFlOD0tXdda3Ub54tGe8HKpDA8fx7Fa
         4qtJyxqs+KTGcWwbtzqrk1vyjYaRMjqGT2b5dCUP0VhtStZNXKh2SL/prYywqlcVP+d+
         oW3dB7KSvbxBa7p0KWw9Gp6k0whQMVBp0wmJmtYTOy7ttJcOAQn6UK/Kcx4PR1EAQhv4
         rD1i6P5XTufQ97VXDPNY3I/1xDaxNAT2mGxjTocDzvHL1xb6VeSqXs76vrOra14vNhac
         2L+A==
X-Forwarded-Encrypted: i=1; AHgh+RqRosHEa37XED+w0QDf4INbOiVVt3teHsFAbgo/c9sh57UFBeX8DgI9aV51YQCJoWt59CO5prQI8GCA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuymzoa1B+SDuUbkZRRPI7P8wtwB9KpzePyvBvkX+V6XSq8M5v
	yC8gWob2SioiNT3Js5e8pSqlhXEhgMkJIuyKlFoXNK5zAY18NHc94hIqE+YwDC1S+dIWhD3qTur
	qQyQcsgftJwwAc1k7XztJuj3janY65J/ASxaYcJ3m+NLOuVYbfP8SmBj/QuVPK/rO1wZsqGDE
X-Gm-Gg: AfdE7ckXlFD23vBEEEsd1yq8y9eD0yo7TGkOVkQCn0Wd7Y+VaeQbHZotlVGYGl8yKyj
	v1VQmIwAsyivNYoGyFzRSMyn6ntZCrCgk5Tgs34B+/it7oLQPDL6gMr7BpbMFdfdCwDufV59W31
	MK7wKVTxRa7jDJnF5aXdV+PT1IIh1JoDju4AMksaCfzqOxjjc+FgNL3n5Lt7l8uvuBCyepPBWBJ
	Ym63GralRQvE+Px0Jlrj1dNQ6UlSzNJrsOa/fsg3p2ogDmVv0a187cBNwDb4hRFLBEpbJWlW8ir
	6ofpa9xAXfBC32+R1lwQj39RqZuiuhSBFu410hmgwrVAG2dmCI2YmisNX48FeydezKzCmDs47Y0
	Y4FU4MhFc6QC09qWNii5XxEEHsjHQVKWlBoLk+M9I
X-Received: by 2002:a05:6122:312a:b0:5bb:d0ab:5ed3 with SMTP id 71dfb90a1353d-5be89743cb4mr2365521e0c.1.1783407074332;
        Mon, 06 Jul 2026 23:51:14 -0700 (PDT)
X-Received: by 2002:a17:90b:45:b0:384:229e:1d1c with SMTP id 98e67ed59e1d1-38757b81a3amr3675113a91.31.1783406719846;
        Mon, 06 Jul 2026 23:45:19 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a32e3sm542564a91.14.2026.07.06.23.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 23:45:19 -0700 (PDT)
Message-ID: <3d12c33e-6aae-4396-bcee-f4159a741cc0@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:15:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
 <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fknNgk1d2X0HY5vMz1Ygb7F_5nFq6Hyw
X-Proofpoint-ORIG-GUID: fknNgk1d2X0HY5vMz1Ygb7F_5nFq6Hyw
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ca1e3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hcMOYrp8kfDHR0m5M2YA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXzTlMHSVjA39m
 3WJd0G1KRohX2HSZe+mwrSBW65ZTf3mEcQaPexoyB7Kb4s0FtOw+nCCgS9O59PE7OlAN33NuTOn
 HyVW7n8CZRx5+fYReTMt+QEiRjX98LJ6c8MLNDUdKFcacWt26TskthjT7jULCjxLjAUlalo5TDt
 UPQ9milqJLKWt9LKlKa+zM9w1wcInnLWiVj7sBwkK+KT8H3EnauyDKVBb7EOzPD/pwRip82vQEp
 4P8sSHuElMVpTXBbgQ9L7N0Z5GXIZKY71FCQ9borK3B9hKjRXzmxIFdd86f+W8zewXkwuLEXSJy
 Ty5HLka1P+jF7dl+tFlJv47i82DIl/djPHtlah/PBTlcwWhXWU0n9MqkBy9uI5sVVTQ7auN+UI4
 Q1HA2DM83QP2tlAlDoPtzNp/YsNq69wcqrkbrTEt+Mzyif75RdPjOUgZyrT265WepUL2CG24XuY
 pXeDIdZei/fRI14/Fyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXwCcvNemC9lL5
 ExMwav6yoqcNka8q9dcK4SOlk8BfOkGppAFGLPEY34qbaZZ4xl+rHIJeIOPaaZ22WmNq+U1NZKz
 ICR1mPTih38WPMuBn6F/KFalW/mtE28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064



On 6/18/2026 1:55 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
>> in deepest idle state.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index 4ba751a65142..47e425003028 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
>>  				exit-latency-us = <4000>;
>>  				min-residency-us = <7000>;
>>  			};
>> +
>> +			domain_ss3: domain-sleep-0 {
>> +				compatible = "domain-idle-state";
>> +				arm,psci-suspend-param = <0x0200c354>;
>> +				entry-latency-us = <2800>;
>> +				exit-latency-us = <4400>;
> 
> The DSDT has "wake_latency" (presumably the same as exit latency) set
> to 5000 us, should we follow?

DSDT wake_latency seems to be entry+exit latency. Will follow DSDT in v4.
This requires update in CL5 latency too, for now will follow 2500+2500 split,
which is closing matching with actual entry/exit latency too.

> 
> FWIW, the 2800/4400 numbers here are the exact same as for sm8650..
> which doesn't sound very reassuring> 
> 
>> +				min-residency-us = <9000>;
> 
> This number matches the DSDT
> > Should the entry latency then be 9000 - 5000 = 4000?

CPU idle states with arm,idle-states compatible allows "wakeup-latency-us",  which should match DSDT given "wake_latency".
Using this will avoid such confusion in future and will plan to use this but in a separate series.

This needs some more changes for Cluster idle states with domain-idle-state compatible.
(cluster states do not support the "wakeup-latency-us" and still needs entry/exit-latency-us)

Sneh is already working on this and will soon send out a series.

Thanks,
Maulik

> 
> 
> On a separate note, the DSDT also defines:
> 
> SS1 (0x02000154, total=7500, exit=500)
> SS2 (0x02000254, total=8000, exit=3000)
> 
> These are obviously shallower states, but perhaps they could still
> be useful?
> 

So far SS1/SS2 not proven to be helping much on power/performance for Linux.

Thanks,
Maulik
