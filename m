Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088C7145FE0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127526; cv=none; b=Q++U8+dsymKiHpX97EnZHFQ2OYAYqFDLzRlrkONey8mmHcg5UMAQaZEVJ2ZahWbQu5pWvmbrleuH4Wb42Q5HzgpyQDhpSg6cAtmYamAfSYGu9WKHRTQYoTCe+X08mTd3YoVT/9fiRyOZ/pbcOaDXyN+qRIECqADASWgZXBSmsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127526; c=relaxed/simple;
	bh=IxcDo9OPXVf2fP8ZallIA8YFo/sVVzixzWAtojbnx2M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LXdOlVgo22tG2zPfWcmN4WXmkPHwbjmUIbW018/kNnrD+UD3p74j/2XeKhxsQVQ4KzYkmNwQoH9c7XdIwFGiYhNfpx883hkoVU49fuyzadT2ZvZSNWOLfdCF8EfJyWZ3vaEnOVyF/4825U8JzZ7mQ9mYCZe/boMN8c9rPRPvgvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVnz3yw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSW8yiVA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVnz3yw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSW8yiVA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R3HGh73604391
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRxgyFNsXaEhoTYYcOEXH+pg+XAnAmR420t9dgNEeYg=; b=nVnz3yw4+Dn1DORn
	ptlBUctdgXjqMuxnN+tMW5TvnWiL+y5oDAku2f/rnPLEdOgL7HkxewMvOI5XdbKO
	pHRcOAZhtU0TWoTHIZrZbsEftg0KxExd3dfVOgXD+zdAOQFRi0pecrjlBUPf/opF
	9jkudf9ohiz16s+dSNrN7VhoJOdYMyDto2ZaLa1VEZOGZSoh1b36RuSBAGnUBFx9
	4bzbFKCIp1JvL/O3OFve1UjmpcSf3PZqVIBwbJmn+CVrs5dVuMyumdoGnoLxU1LS
	DhVHfFw8qrDUOPqkxSrgN6s+HmP1N0SQu3/EybivMeHfywo8ZErQj3Smo67XWY0W
	JS5Z7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wg6ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so40590735ad.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127523; x=1785732323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRxgyFNsXaEhoTYYcOEXH+pg+XAnAmR420t9dgNEeYg=;
        b=VSW8yiVAzgZbxbFARpmI04KDo5Z9LyaFqZtjHS+FQozPqmAGEeP3f0/04NHE+cZ0FY
         gibyY+rIAuGj/HaAPDqY/ZXd596tm8gnyB/T23ApG8ubaGlqVrtdQDoIDU0MOg9ud2SA
         VEEKiJLgtOyoMGX5ByhiIZ0p+yVJxiu5iCP7zbVyFRou/r5/RMOEeosT2BRIYVtfWlqJ
         EsnBQ4eV/4ubDC47CUCwPpWcVZFO76hDoxtlrXMWTNBNl68n7iv/dz6wSO8LX+unWmuA
         6Hc3qCeJvPEf8OToIoYeTvBTzMKVKq9wji4/OqBWGXNDMKMhKs99muy9fX1DBf7aiFYB
         tEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127523; x=1785732323;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRxgyFNsXaEhoTYYcOEXH+pg+XAnAmR420t9dgNEeYg=;
        b=iwaeIL6XigD0mAfWJYXOQIfX57kN9Agd+Rc1bNSjpQPVS9FOO58+AKmc7XglBdP8ON
         tFzHM4QSekuXIAWvOqyYvwKNQD8b3rw/sJeu66SwjLBy38lPS1E9wWGl5PKEyubKuf6A
         izlP6QM0V5LgPsH1VJdf3UQtnZmwwfuEFu0PwcpE7HLHcL76RlkieImF6jxS0Gv0Rzx0
         jQ5OfMWdMedqhMByNw+0jzWU0wIJHgQkDPoRDl2iZ5NYy+41+MogQMv4F0Ged15jX4Zf
         vA5QI+a9gSvps6mm8x5ISblU9+zxQFLqe+s58/5uG8aCPJ7nUHwOlfTLmqIVU1IGs8W8
         FpWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXyfLw/2gQcgT1EH1a98enI4NNATNgsRCgT/zROb7T8Sm6PJBP0/SUfFQ85aOE51YwZjfmq7N0OXGr@vger.kernel.org
X-Gm-Message-State: AOJu0YwCPPA6QUj891vaLe+F9+ccTx8gfL/ZQtF8MGRdzhdmynoML9do
	5PKPfZPw+QLZ6c2G9fVMQyh3sO005QCYTCcT8gjq0/xQo5fz39a1cThgsAcibkx+RqBVMTSodoz
	Bysz4UdQSgup+156yNoUTFcKAceF4v9Zo2gZlb2eCjrWjxgWmP2Amgvlg6CU9FmQ/
X-Gm-Gg: AR+sD10kKXLEnRnDkeT4je+aXpw4EpDtmbC9y34ILGVRS9VP4gwnlGziGPGgdzVrBKN
	qV564Lgx+ohzL+p4hebSU9pc+KGsyhqkmKxfb6xdstjViGCaq+RMdvwev/K2SOpz/xCNyBq305o
	s+yeItdMEiA6Akv6YmQw4SH4AawjFhTUSzTCiJxMTavF0GJzRV6MGpupoc2Gu6bbUHJT65RFf1n
	ACg6JvFqAKs7vHgt1GpvU+WVthkOdB8y50Tu/h/dvK5f8Q6bt99buzRufAUcKp/rswArNvv92my
	UDB7evNofxc48Hq66EzxO0Csyo/3ixvVvQ9Ol+XAdliI7EwQBpW8l6Efft0ez1uM7ydTDAP0lRF
	TlYqTGmKSSsPdFl55J80g73DbMrgJf+RZ
X-Received: by 2002:a05:6a21:ec0d:10b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c67dd8a2c4mr5145410637.23.1785127523194;
        Sun, 26 Jul 2026 21:45:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:ec0d:10b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c67dd8a2c4mr5145388637.23.1785127522628;
        Sun, 26 Jul 2026 21:45:22 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm37991130eec.25.2026.07.26.21.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:45:22 -0700 (PDT)
Message-ID: <c4f53c07-2a3a-bff1-80f7-adff8cc40ed4@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:15:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 05/14] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-5-de451559e88b@oss.qualcomm.com>
 <20260726060542.712191F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060542.712191F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX1aD4wUxegiBq
 OcS25uEqTA/Va86FedV0eFtmxfyMD3abfRctvcQceTybmLaMHDtFQHpMgnzqmS3r1+MSsMTQHKf
 l8V7HbDD0tf6iBJ8dr42569wt/YD3G/hpQA5/3nyW6LA8YDOl8gLForSzteQop2sDxME9TdfBp6
 Kbce7K8UQtU4QvLZJhTv7rJH88lB2HxGj10t/nZGphCg5DY6wnAUGBWYUyVDfvVPuA8PIVufWwa
 XYcSILwz4d54QIBEKWH9VbrJ7jp4uBWbpA/wVE4p+5ZQQJVzmZmXijmNzayq65mtpYdeOrc6lIv
 cmADMs1yUkXdM1230pGn75X5VPCIZ5U/GSDOeBE4gUrBbvBJ6DL/ShCj2zxjAwBZu0oTR+fwPfe
 Br8QAJvkCSPLfMdv7EjJiUv3YyHcz+k+XhbLf1BVol9sXYUc0fEkbyChhqP8kgjgKW7gcT04YP0
 MHG5U7MoUo/aDGsgbJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX4W/TSDrXZS3p
 ydJFHtg7MfGGCV16FBg/e3PsjKhudXcmOQqKVEk3d7OrPUSlrZn79SjuwAHe/nNkcKF25EdPtXt
 eTETA4R4cZfqWyPIBIwgJmOSZ3M1III=
X-Proofpoint-ORIG-GUID: gFmS_2rFs-59b38TOO6DhKa0SFOCjjlZ
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a66e263 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W3MtZutHX8kjaUvpCmEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: gFmS_2rFs-59b38TOO6DhKa0SFOCjjlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:35 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> New issues:
> - [High] Incorrect DMA mask configuration on legacy platforms when IOMMU is missing or disabled, leading to DMA allocations outside hardware limits.
>
> Pre-existing issues:
> - [High] Use-After-Free in delayed work `sys_error_handler` due to missing cancellation during device removal.
> - [High] Use-After-Free and locking freed memory in V4L2 file operations due to `core` context being tied to `devres` instead of being reference-counted.
> - [High] Race condition exposing video device nodes before drvdata and critical setup are complete, leading to NULL pointer dereferences or Use-After-Free.
> --
>
> --- Patch [5]: [PATCH v10 05/14] media: iris: Skip DMA mask setting to core device when IOMMU is not mapped ---
> commit 618ea537a61c437b82cec491d04d1126e0ba8f26
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Subject: media: iris: Skip DMA mask setting to core device when IOMMU is not mapped
>
> This patch modifies the probe function to only set the DMA mask on the core
> device if an IOMMU is mapped. It aims to avoid unnecessary DMA mask setup when
> IOMMU streams are handled by subnodes rather than the parent device.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 2594f5a67378a..c40c4ec44e83e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -310,9 +310,11 @@ static int iris_probe(struct platform_device *pdev)
>>  
>>  	dma_mask = core->iris_platform_data->dma_mask;
>>  
>> -	ret = dma_set_mask_and_coherent(dev, dma_mask);
>> -	if (ret)
>> -		goto err_vdev_unreg_enc;
>> +	if (device_iommu_mapped(dev)) {
>> +		ret = dma_set_mask_and_coherent(dev, dma_mask);
>> +		if (ret)
>> +			goto err_vdev_unreg_enc;
>> +	}
> [Severity: High]
> Does this skip the DMA mask configuration on legacy platforms if the IOMMU is
> simply disabled or missing (e.g., via the iommu=off kernel parameter)?
>
> If device_iommu_mapped() is false, the required hardware DMA mask is skipped.
> However, on legacy platforms, core->np_dev is NULL, so core->dev is still
> used as a fallback for DMA allocations:
>
> drivers/media/platform/qcom/iris/iris_hfi_queue.c:iris_hfi_queues_init() {
>     ...
> 	struct device *dev = core->np_dev ? core->np_dev : core->dev;
> 	...
> 	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
>     ...
> }

On valid DT, either subnodes with iommus or a top-level iommus property
will be present. If neither exists, the DT itself is invalid per the
schema — that is a DT error, not a driver issue.

> Without the mask being set, dma_alloc_attrs() will use the platform's default
> 32-bit mask. Can this allow allocations in physical memory regions the
> hardware cannot address, leading to DMA corruption or hardware faults?
>
>>  
>>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>>  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
> [Severity: High]
> This isn't a bug introduced by this patch, but does iris_remove() fail to 
> cancel the sys_error_handler delayed work?
>
> drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
> 	...
> 	iris_core_deinit(core);
>
> 	video_unregister_device(core->vdev_dec);
> 	video_unregister_device(core->vdev_enc);
>
> 	v4l2_device_unregister(&core->v4l2_dev);
>
> 	iris_deinit_cb_devs(core);
>
> 	mutex_destroy(&core->lock);
> }
>
> The driver initializes a delayed work sys_error_handler which can be scheduled
> dynamically. During device unbind, iris_remove() is called but does not
> explicitly cancel this work.
>
> Because the iris_core structure is allocated with devm_kzalloc(), it is
> automatically freed by devres when iris_remove() returns.
>
> If the delayed work fires after the device is unbound, it accesses the freed
> core structure:
>
> drivers/media/platform/qcom/iris/iris_probe.c:iris_sys_error_handler() {
> 	struct iris_core *core =
> 			container_of(work, struct iris_core, sys_error_handler.work);
>
> 	iris_core_deinit(core);
> 	...
> }
>
> Can this lead to a Use-After-Free if hardware errors race with unbind events?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is the driver context
> vulnerable to a Use-After-Free during V4L2 file release?
>
> Because core is allocated via devm_kzalloc() in probe, its lifetime is tied
> to the device bind cycle. If a userspace process holds the file descriptor
> open and the driver is unbound, iris_remove() returns and devres frees the
> core structure.
>
> When the user later closes the file, the VFS calls iris_close():
>
> drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
>     ...
> 	iris_remove_session(inst);
>     ...
> }
>
> Which in turn accesses the lock inside the freed core structure:
>
> drivers/media/platform/qcom/iris/iris_vidc.c:iris_remove_session() {
> 	struct iris_core *core = inst->core;
> 	...
> 	mutex_lock(&core->lock);
> 	...
> }
>
> Should the core structure be reference-counted rather than tied to devres to
> prevent this from being triggered by unprivileged userspace holding an open
> file descriptor?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does
> iris_register_video_device() expose the video device node to userspace before
> drvdata is fully initialized?
>
> drivers/media/platform/qcom/iris/iris_probe.c:iris_register_video_device() {
>     ...
> 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> 	if (ret)
> 		goto err_vdev_release;
>
> 	video_set_drvdata(vdev, core);
>     ...
> }
>
> video_register_device() immediately exposes the /dev/videoX node to userspace.
> If a concurrent open() wins the race, it will read a NULL core:
>
> drivers/media/platform/qcom/iris/iris_vidc.c:iris_open() {
> 	struct iris_core *core = video_drvdata(filp);
>     ...
> 	ret = pm_runtime_resume_and_get(core->dev);
>     ...
> }
>
> Can this lead to a NULL pointer dereference?
>
> Additionally, since iris_probe() continues with fallible setup operations
> (like setting the DMA mask) after registering the video device, if probe fails
> later, a successful concurrent open() will retain a reference to the freed
> core, leading to a Use-After-Free.
>
