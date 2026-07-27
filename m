Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D186C145FE0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127577; cv=none; b=IdyLToM8m4Vi5POdQrCv5ew7LqcNDmYB3kQXhnG6SAydD9HBbZgzc0pEDQyS9xVknAXLjAu8pQnygfbjS7Xmc0edsE/rBg8Fjw8QAXk9fpUdFH9fLZtiIMRCa9NpXcTvY40RLmDAyUb96f7xt35ftbneYyaZPPXyOefh2AWbYSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127577; c=relaxed/simple;
	bh=Ha/zBwZL4wQkuF4EAgg19Ivwv3Kp78CeujEdT7elYwo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qi4lHpz71HODo8haKpQl8ttEBEAGQpZytz24lNw4pTRSqibNzGAQB/g/+zypJwVhJrfROWGt4k4yDNyPkAKGtPbMP7p3pHjsyW/4S8N5Nup671nveyeBS4jSw87YpTV385I3qxK0s87iA1easFbXXtDTPy7YeAJPg3xnbTzaicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juqom7jR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgLPqtYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juqom7jR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgLPqtYu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1ft2v2572006
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ad7crtSP8Pbhq5RgxCkjCnjMpEkKStU/1+R1thT/yY=; b=juqom7jRlSCOIkoe
	waTGJPMUml16PFfK0vULYddZDRCaYugnRQdEylzdNZ/yCrzt/ujW+xc1rLq0K4ip
	e9v4kz1EKSRPblX3yXQDtivEu9VD2wJOPjcfz43S4vIoVYaDk66HKB72llM8fz/6
	dlx4oli4mbhEJPHXbTkAbt15PGbu9R/C3mdHy5uI6mCnRbN4K5mc84duR4fcZNBs
	LPqtQLXR33sFgeDjG9S1eej9sEDnM6KC4+lcyO3ltUrzD4dI2Sdyny7AEbObpt5i
	vrvfpEShPawIgwF2dTcDiV22PbqSnauk2PZr5Tq1nCWfiEx5k2afvm+Za0PMcb0F
	wiaIPQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sck07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:46:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so5975180a91.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127574; x=1785732374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ad7crtSP8Pbhq5RgxCkjCnjMpEkKStU/1+R1thT/yY=;
        b=HgLPqtYuHvykjhGNHWS8ADXs/sAs3qcWeUrmcF45YLJa8FNGVVapVFjvarnu98C+4L
         De7TG8NErf+qR1xSnkx+rqYdGxKlS5jA/IRIx+Nbwo6uYbdwCpakaLGLy2fnJ+Txd/I3
         BQ17VMKCstgZHtkMD5c9dHu6THSM/BMwRcdNB6XTyfBz7p2zTAHu5Hqftim0zwc+10eH
         SA2jbUGij8SCjUcdk4mSBRDdQkFFZgd6P4iLTLwndDNqTiQcYKknVugCKNl0ahDvzYhz
         o1XBeXfjVQIYfFFQ2CwCKNY/Di9ZYqaUVRRnQRKQMWuoVihRWvEcQFLu2T56EQ+rDly9
         lkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127574; x=1785732374;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ad7crtSP8Pbhq5RgxCkjCnjMpEkKStU/1+R1thT/yY=;
        b=VMIqqCLHiB3UQQLcn/Gq0bH3OV/KNr8/9drQQNdc/Nnd8GJKM+eBR/eUqYmVmPt0qh
         FW3kVAxs2M0midJ7JN1fFZKcDUH4EgNO6hvD7WkxUc9rq9Qp20DOXGd1sALTOrfmjQTa
         di3gbhiqjG14wiGL1g21WwCRXmdXRDTRNoJL3sKezD8f7BD7/tKknc0MjJrEXk3NWq3N
         1vEut2SJcSHZxfmW2t9CH0QDDnaoZjJErFowZ/jbPkx2vfQTaeVJC0ckz4bQo6Ep7hsO
         qTpp9H5My3r88RP9ufGBy02DUxFQy75pPF0IujrbkhSMKlCzSKsdqtma0mhylaKs+QjU
         iIPw==
X-Forwarded-Encrypted: i=1; AHgh+RpxGDf30wjr3pnHufiIAe+dnauNoARSjUp05OGAzWhcJdKJTXCvvFFsQ7yjWhXBe4KKggkk/tDTxAFn@vger.kernel.org
X-Gm-Message-State: AOJu0YyqbJMwXPtmpPR2fBIO7j3XU/zhUaSi6AIyyZLyuUAEUs0euIvz
	2q51fpyA9P65yZWYSqjR/6707hzq0PP7vfnCwmTYjpFxLbb4szQ3eHjHXDouoZENmYXfmht4HYO
	fxXbJ4hJYF6zTA1mYNeJvpjd25EwYnr5eXn358f1LzT7YaNk0CHsy4VOAK4oNwwPn
X-Gm-Gg: AR+sD11/ym3MRpx/V57aoDwjWj49j459+6Tz8dzFPJEEcHDbBD1nOgc3rywFeA608o+
	EqmW/xd7zkilfPk7D7V/qqzjkr22eHU9K1SrkQdaiHPC1LWLNa4lUbkjbcHRKDzQ9iKW7UptSRz
	2I6cb//KtRGWfqMCdwDwGEARGo9NxMWQ8Fn2HmMc0oTZw/fQBo/JkDBoG3HMWdRAN7L92s90p64
	+Uj2H4r6jtAUGT3BW6lMb1AdxuwD9YX/79tdIcfRJwwgsfuFqCYdwrF7IwsSIY2vkU/bjggslc1
	hN+GWhQhhokgSrGzFr0yVs9xEXkuTF0cWA4RO0aIX9AGw9PSjLht9zg/tNjBoNUk7RMziwpF29Q
	iNS8qyObjkZPNeZkwVpzwl9xV4BDXlINP
X-Received: by 2002:a17:90b:4b09:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38f296554e1mr7048258a91.25.1785127574506;
        Sun, 26 Jul 2026 21:46:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4b09:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38f296554e1mr7048246a91.25.1785127573988;
        Sun, 26 Jul 2026 21:46:13 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc413766sm27798309eec.8.2026.07.26.21.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:46:13 -0700 (PDT)
Message-ID: <05ef095a-62e7-7393-79cb-2ee4839a1a79@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:16:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 09/14] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org,
        conor+dt@kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-9-de451559e88b@oss.qualcomm.com>
 <20260726060329.24B6A1F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060329.24B6A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX9gdvawKKlDeA
 nCwJhE6Pzi33rqNmloxeSmiFx2joksN6HAFxC6JHxncBTr4pU2tDM5bEjtXeIRck9UV/4jvpDsJ
 gTNYnAkGLewAbrXJhh3IgH1/9QvpTXIXUkBuHaj43ewwQ9qc+jST0E4EeVpK/lwP+kIXMppAbxB
 fk1q7XJnNupZXY4JnRhi1s5BLmicnJRwtEigFG1AuS4TIxu8K8Cw7KududfCiII6VAnVucu1Rfd
 u58dxnlTqiMwP/U1w0i+xRvbo+oC0K1MjqJA3zEMOB7A7Lmy5SLD1LDbLyEq+UlNnWxMu5rhY73
 IznZjyUnnJNHeiRgZrXAzHhupm/OfHC7cvHQDjwCLawQb33CCef7mcxpfwa4NHmDGF2UDARPEwZ
 CP1eQroZHNigfGTSIC+JE7vLKrj6fvMxAMHtG0vbAegokD5EXdrdIA9LUyyqwbLbKaIs697wMNa
 rVE/L7dfHm03cSyxQiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX2Hdk3BR9ICNz
 iKNgliDb4RhK7xwan41ylQD8gLh/NWZZA3OCFrKyl2fyRtis8Wcj8mE94l6BStQVK3wtpQnuB4O
 VXYo2hv1IE3zZ01A/tWxVbWg7x01pZA=
X-Proofpoint-ORIG-GUID: fFRz7pUYcyrm0rmFGMxV_6YhIY3QtubJ
X-Proofpoint-GUID: fFRz7pUYcyrm0rmFGMxV_6YhIY3QtubJ
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a66e297 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8c_RYdDnr-vbwd5-3K4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:33 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The newly added `iris_vpu36_ops` structure, which contains the fix for the Glymur platform, is never assigned to any platform data.
> - [Low] Bootup register programming is improperly placed inside a memory map setup function, creating an awkward double-write pattern.
> --
>
> --- Patch [9]: [PATCH v10 09/14] media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup registers hook ---
> commit 5b1dcdb0f86534dd18f11d0f09a2cbbcb73f7014
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup registers hook
>
> This commit adds a platform-specific hook to handle the CPU_CS_SCIACMDARG3
> register during boot. It aims to fix the VM count on the Glymur platform by
> writing 0x0 instead of the default 0x1.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 1b08461ee4d70..5212f7d4e606c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> [ ... ]
>> @@ -361,6 +366,7 @@ const struct vpu_ops iris_vpu36_ops = {
>>  	.power_on_hw = iris_vpu36_power_on_hw,
>>  	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
>>  	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
>> +	.program_bootup_registers = iris_vpu36_program_bootup_registers,
>>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>>  	.set_hwmode = iris_vpu36_set_hwmode,
>>  };
> [Severity: High]
> Is iris_vpu36_ops assigned to any platform data?
>
> Looking through the driver, it appears this new vpu_ops structure is
> never referenced, nor is the Glymur platform added to the driver's
> of_match_table in this patch series.
>
> Does this mean the promised firmware boot fix for the Glymur platform
> is currently unreachable dead code?

iris_vpu36_ops is assigned to glymur_data as .vpu_ops = &iris_vpu36_ops in
patch-10. The Glymur platform data and of_match_table entry are added there,
so this is not dead code.

>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index e690c566c8751..72eb8f6240b70 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> [ ... ]
>> @@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
>>  		writel(value, core->reg_base + SFR_ADDR);
>>  	}
>>  
>> +	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>> +
>>  	if (vpu_ops->program_bootup_registers)
>>  		vpu_ops->program_bootup_registers(core);
>>  }
> [Severity: Low]
> Does this create an unnecessary double-write pattern?
>
> By placing this inside iris_vpu_setup_ucregion_memory_map(), the code first
> writes a default 0x1 to CPU_CS_SCIACMDARG3 (which is a boot argument
> unrelated to memory mapping), and then immediately calls the hook.
>
> On platforms using the workaround, this means writing 0x1 and then
> immediately overwriting it with 0x0 before the firmware has started.
>
> Could the default write and the hook be moved out of the memory map setup
> and organized to avoid writing to this register twice?

Platforms that require 0x0 simply override it via program_bootup_registers.
The overwrite is harmless since firmware hasn't started yet at this point.

