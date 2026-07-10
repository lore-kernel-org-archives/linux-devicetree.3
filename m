Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79893B14A2
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665180; cv=none; b=YCTctWz7d5SmXC133sfrkER9eymOvLOBFE1TP3EBwxaF1agJ4uSLVRL0f5JbJcEx5XHP6cAv+k2oQtQMaqJk6+iHwVSxgcoGzECrdrWA8M0WOG8AVhw8jOgqnr1+pyyXEFEMYVCyxt5eYV4+hIzjB5dVBzpChqvL3Js6xy7WZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665180; c=relaxed/simple;
	bh=07CRYaFwVcxi7RFd2sA9/xbBpELq/H2DfkpGkFJ7eGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxcIi+eScF00Q8TAbKgqqrMiHa7RZ51OcDPokceh5hRqg6kTjCgMFvp0RZlcpUflXt4bAAfkqijoLEaMKoIXEU68qfhqC1QL1xrRXjl1TgrgNs6T3doO7I4zhd8S6WxbmjsXo9W8AbBd6NcNrtNG7TqWVYKo2Q7Cs/rzMm+d4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJ186v/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Io73CdqC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJ186v/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Io73CdqC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3miIl3847285
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njjAU7s9jTarzjwOlCAqHNCGF1bx0DdyM4v+tAuxULo=; b=pJ186v/tLcYTrcay
	FGdYfyJFJCJF52Kfa8SVy4YyOnsjjSXhxEIY0pEca/FDafdyRikiH9+zd4WhREay
	+1XdrUOejjzo2qzqTxYncNaAgF5c5UAjYxxIHWdZ6xCCLAV6OFDAv12q3DpvHlui
	XeAQE3EryGNKYSEP8HYQASOHnTKWOLrzNCutRcJEgGQU2KbW32ODeKGI+VnG9N4m
	U5amHpJVERLJ8h+B1k7l7K9EzBVEHQVLuWnx4G+z89s9CL+kbC4R8Oq9aHfxLviv
	RevcVztSQmnx65ApL8D67XAIQN3lYWBVnARAnfZYTDYOUZESfFMr5X19VV6C2CMH
	UrDMmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte1rbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:32:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso5668001cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665177; x=1784269977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njjAU7s9jTarzjwOlCAqHNCGF1bx0DdyM4v+tAuxULo=;
        b=Io73CdqCpddDPhNucES5pgFQd46an4kHqynnK+3SFyuzyfVbdGcNUqbLQw5KIwqwUS
         BAXXvJE4+gs7YGMtE9UgvmQ0seNscKsF7XeUTgp/+Wefl392QJ9b+Fgkkx2HXOvMeRLc
         qAVPbN59gcG7qJVv+xADPK1MxG/HcZswjGHzDp2h6IFNmH7npKDTnfBAXsGlnS/t6ncT
         U6FH2vgMN7vhnna5NuIsTHDVgzHTEfBMCiiaYXIYHcfyBy57Nj92+3ruUQkPsE/NA3Ky
         5gDJNEg2P5j0MprK4JVro3cEMrnsMkopx/dRFqy5m570xeQ7u6KnuxagXIe1v1TTmOeQ
         Bnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665177; x=1784269977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njjAU7s9jTarzjwOlCAqHNCGF1bx0DdyM4v+tAuxULo=;
        b=nKYSVika3+1nT6LErsTHkDc4PDxdSF6f2H44AylcCI3rhi6xQ+lZ3zJElewrn1Bh9R
         X6KBijpp0RHV/sJ5nQX3CLiY5kjHrO7bjMV7FUYljNQtbYYaDaBUkVDkbs8r/0BOq8G4
         7XrWR5ib8GHwo4qDAbz7Zs0VmBQjCQ1429XSkQu+2Lh4Nvkl1hkPWFh7EkzCbzr8KrvM
         6lpCajJGaPkL87mv0GsjezRYrWz19pbB6oX193d4BD+Mj7yM3IiERuia04f9IRFdKPqV
         tT6ckSazz771ggdrYmNJEHrixu8n7vq6OJLJ0F34RBftJl+D3Aplt9nF/X1Zzsf+9ajs
         FQPw==
X-Forwarded-Encrypted: i=1; AHgh+Rqyy3EE/Nh0zJ/Ugx9s/u2urVHnBKB5ioqtlera0jJlmy5STWhTIiW7MILhzdxGTVmH5sfRQ7h5hwzo@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfAfqMk8XDzEQLNoH56bxBj/5MRPyBMrZu+RUUC3h8FQhP0ZD
	Gw93mm2kgwnNB/51cydYp5oYEG9+jHJTW8tA2mk+my6pGsuoHZoRsfr3rVO1ZEZ2Z5Z0OdryNhJ
	u3tzLmyGxINE0Avh2zVc7LeTCvZiB1WfNA1n+IGwAXi6W8nKhIOtOYLtrGePk7Zla
X-Gm-Gg: AfdE7cnYluwRyAjANgB0+XNk5MQqEgqLsV+v1HPAuI9khI+VRaG41YOoGjc+dLMYUlb
	fpKrTtDduTUtxh9+BZ04g3brnV/z0Eiit8vEROVyNa6DLIngKL3Memlzt23HWSZOf4A23nwCKCo
	QFBJVjZNwjE9sz5S4WavZ56TnUP1d9jEeSEDQ9p/nCMIWNlEcP2VDuokVYTMv1NFoWoUBIqdNUL
	+BSPBte/OWUq/dqkufswwpas+aqCUbZI35fpFsCMmi7qwpxpYE8RsprVVbcerWCAu/PgkTOwvEm
	RVRhwXlB9YLJUI1iB+xkFdWFUkCuFsNJXreU/tLtZP0xZeAal3ZcQm85KW5h4/+ZHIZl0zkmvbP
	QQN+t9/B1RKUxNd8jNRo4FNqIaeUEo1KxeR4Z8LEAhbaaaA==
X-Received: by 2002:a05:622a:1911:b0:51b:f563:f613 with SMTP id d75a77b69052e-51c8b450a23mr100882091cf.35.1783665177201;
        Thu, 09 Jul 2026 23:32:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1911:b0:51b:f563:f613 with SMTP id d75a77b69052e-51c8b450a23mr100881871cf.35.1783665176789;
        Thu, 09 Jul 2026 23:32:56 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f7137225sm96922466b.53.2026.07.09.23.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:32:55 -0700 (PDT)
Message-ID: <409c36d5-d445-4ce3-aa39-34bcb859f74f@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:02:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZB7Q_HvhkZd56nW00dF3ppSOe6fg-OVu
X-Proofpoint-ORIG-GUID: ZB7Q_HvhkZd56nW00dF3ppSOe6fg-OVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MSBTYWx0ZWRfXwzWQmigVyT4a
 RgBHqwSQ8KYOteZHxs+2a62tM2CDA7J7DLZkPz9PxfBqIpMgBUTtU0yrMm28twYMJ2Dt1/8tAIl
 dq+WxNC1U6s2f13/xCKFJrtjG8dBI+TY9jQsmuKgHxPhy66S7s3odUotNz5aL/Khv6f+GM6+njj
 qaZF2Araj9nZ5CqvIU9MXN42QH8/py93WnML8WA9+BVJdubLGz54zme+f0xpZOhxlO55gCuOSIT
 4C//tUi9lO9ptCoAP6dx+yHqAb239vUIfJTlmFRczaF0w39LAUudmyHnPI0i9nZlAMPT20lg9pj
 JIg5RFSch5JtsNsplViRx7m2kGBvgQ2AgXYmQQ4OVT0bAa6kTJMXiFNfq/lVPMQZc8GOWyDmIbN
 xrIHAVCafdF5pTQ6922x08AEbRsLWR69FN41aUqc/EaicJFRz0e1mz3KGr4/X5jZ5UFXt5Q5HTW
 WGkCHRvcMo+lWpJFAOw==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50921a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=w9QpbRTAcXsmfhfIaDkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MSBTYWx0ZWRfX4kJN2pStb0a3
 sbq1g0Voou08FLgCXyw/YC35fPerLAiEKA55pqU7maHbFoDsMfcVPu7Hv4Xm5/m2UG5tvMqoUwq
 q6/Z8BYB2MdGL1GMIarGUxEJmNsu7wM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100061



On 7/9/2026 6:44 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 06:05:52PM +0530, Vikash Garodia wrote:
>> Iris platforms use separate context-bank devices for the pixel and
>> non-pixel domains. Add platform hooks to create and destroy those
>> subdevices, and wire them up for the affected platforms.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>   .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
>>   .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
>>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
>>   4 files changed, 80 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..fd6bfe7e786be3f8a4885296fb11ba430ded6fd1 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
>>                iris_hfi_gen2_packet.o \
>>                iris_hfi_gen2_response.o \
>>                iris_hfi_queue.o \
>> +             iris_platform_sm8550.o \
> 
> No, it's not a separate platform.

This will be dropped, given that the callback would be made generic for 
vpu3x and would be implemented in iris_platform_vpu3x.c

> 
>>                iris_platform_vpu2.o \
>>                iris_platform_vpu3x.o \
>>                iris_power.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..bea904a9249bafe1dfa11ff39155d1930402bf7c
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -0,0 +1,71 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_core.h"
>> +#include "iris_platform_common.h"
>> +#include "iris_platform_sm8550.h"
>> +
>> +const char * const sm8550_clk_reset_table[] = { "bus" };
>> +
>> +const struct platform_clk_data sm8550_clk_table[] = {
>> +	{IRIS_AXI_CLK,  "iface"        },
>> +	{IRIS_CTRL_CLK, "core"         },
>> +	{IRIS_HW_CLK,   "vcodec0_core" },
>> +};
>> +
>> +struct platform_inst_caps platform_inst_cap_sm8550 = {
>> +	.min_frame_width = 96,
>> +	.max_frame_width = 8192,
>> +	.min_frame_height = 96,
>> +	.max_frame_height = 8192,
>> +	.max_mbpf = (8192 * 4352) / 256,
>> +	.mb_cycles_vpp = 200,
>> +	.mb_cycles_fw = 489583,
>> +	.mb_cycles_fw_vpp = 66234,
>> +	.max_frame_rate = MAXIMUM_FPS,
>> +	.max_operating_rate = MAXIMUM_FPS,
>> +};
>> +
>> +static int sm8550_init_cb_devs(struct iris_core *core)
>> +{
>> +	struct device *dev;
>> +
>> +	dev = iris_create_cb_dev(core, "non-pixel");
>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	core->np_dev = dev;
>> +
>> +	dev = iris_create_cb_dev(core, "pixel");
>> +	if (IS_ERR(dev))
>> +		goto unreg_np_dev;
>> +
>> +	core->p_dev = dev;
>> +
>> +	return 0;
>> +
>> +unreg_np_dev:
>> +	if (core->np_dev)
>> +		platform_device_unregister(to_platform_device(core->np_dev));
>> +	core->np_dev = NULL;
>> +
>> +	return PTR_ERR(dev);
>> +}
>> +
>> +static void sm8550_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->p_dev)
>> +		platform_device_unregister(to_platform_device(core->p_dev));
>> +	if (core->np_dev)
>> +		platform_device_unregister(to_platform_device(core->np_dev));
>> +
>> +	core->p_dev = NULL;
>> +	core->np_dev = NULL;
>> +}
>> +
>> +const struct iris_context_bank_ops sm8550_cb_ops = {
> 
> For a long time I have been asking to fix name prefixes. Now you are
> adding one more. No. Please write it as a rule of thumb. All new symbols
> in the iris driver should start with iris_.

Ack

> 
> Moreover, there is nothing sm8550-specific in these hooks. Enable them
> for all VPU3.x platforms uniformly.

Good observation, will change this something like below;
.cb_ops = &vpu3x_cb_ops,

and the callbacks can be added in iris_platform_vpu3x.c


> 
>> +	.init = sm8550_init_cb_devs,
>> +	.deinit = sm8550_deinit_cb_devs,
>> +};
> 

Regards,
Vikash
