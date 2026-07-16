Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8241A3EA66
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784171760; cv=none; b=Jy1tyeqGBH1LXnq8HdOG4+Dg/q2Ko0/5WVRs8IHdSaroL4/DH61hthxZTH61MVDq0vhRgZFa97rJzhbRFJgrvP94jxQkQl/FqlLlKqsz9+IKQVi9orTfBf7IgKx94cixlDAzCEFFS3Y+VBx894gx6sqweWWgrtWbsElCrnY1BvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784171760; c=relaxed/simple;
	bh=wzs7eRnccY7xVL0hi5nxgDAwKdozrA3x3xgzSj7Kl3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJhbH/Ay9Pe9s7kSKV/6sKlbpm6K7kxSluopv7uexsVT6cu1DDkHkWrzvAvc67A6BU8reFNO21AKybyM44IQ5U/JOo+tJJVV85JBHKAhchrz5MFNEeQIC8Pxb6p8MflsexAI1MGPAUly6A9dH+L5HSzaUdwFmOW9EOexa180jyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlT6n0wN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHeP8Z9P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlT6n0wN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHeP8Z9P"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XfE9967143
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bh32wRuibasEUBhbRFIs3k6MEBIkIwy+v5ttkvaLEAg=; b=RlT6n0wNcpx2EfzT
	lYBSmfEAZwN7EZ+S2Xt0bAODZZOUDdXGp28aHlEyklQ7tlt2uze+99yj18kNfBoM
	c08PtqBVD9+ii0bMz+/Ovb0OHnKzopaULEv3RDtI0TAVRtgcT7Qz4f5ZvAAICZPO
	UtSKr7xjfBUVymoczbhA4xVYKxvuMNviBYWPcl1+R0N62bk7MPijO+9CBMHMIrtr
	QXHlOI7RThKGjhalUfB0VC1GxKw7aJ6NnvvEMnBlf8u8KV4j17YGpJP1TzZmt9qY
	DlxdmRPrrNOw1dByEJSF2KVpS+K7G+XlnbOsesynSztlphDgB5m3zMzsiNQZkVYR
	KvrBxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7kabuw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:15:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca5d2474c7so75116115ad.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784171758; x=1784776558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bh32wRuibasEUBhbRFIs3k6MEBIkIwy+v5ttkvaLEAg=;
        b=bHeP8Z9PsXnLUNiiBsp50eNqVRAxr8lNNClWBDaaUEyoaFN1iraWJpsK/d43eWKaRZ
         XOZXXnBwakxQmYp59e0++xnoCo3BnwVCTLw8GgDEsGYu8o4CfbQyIevgl0dcyY6/qoaK
         M0tw9wwU7TknJShGbqomtS5RmxjrQDPFgdfxM65V/r9tOgkGARFTED1y1nnP3PMFjU/w
         3j2nZd+WepN3csEpxEZrT7FJDENdR4QgyNcER/EkiNiCWFvNvVteyWQNO0LF/76sMAdS
         X9SYhbGaqBc9VJIWmXtWE693qq3DX33ZNtKsjyEKHtLjU27oPTBKmoZVO1Wf97jHKSD9
         1Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784171758; x=1784776558;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bh32wRuibasEUBhbRFIs3k6MEBIkIwy+v5ttkvaLEAg=;
        b=M5r2PFXPNMS+kIStXPZ1nJuGnzm+62UMtE/n+G7HOeSc3KFw452tjVYLDghMwqvPBp
         37LtbUGnPf8V6Iw8Vwjd2keC8VaPpgP7bwMqK/27rM6G5FuYyVhD0XQE9iyFZsdwYc1n
         xnDyOfIQfMeSSQG8n98E9jpPJf1EXb5nYFWQLgJqeh8402ATeH5Z2cXdd+Zn67R5BXjQ
         yd05bhZJFujNiZbRG5fI3CpbhBaUwx3ntC2Xe6C8oJKpD1GhVcotkuA32wiXPCvaKUhJ
         MdeZ3K6Vnl5RlKtddKSe8gqWVww+DLMwGcirNaIKfCODPWi3UcZ/2FmmssEpdVoKzvM/
         Q8iA==
X-Forwarded-Encrypted: i=1; AHgh+RoB+HpXV0uR1ekNYrUmoYCWF+VVUvh/zQj77OkdjF8t4BvExIWRwvNTT0Zkp4mMCmv5zcGM9kNxZZaA@vger.kernel.org
X-Gm-Message-State: AOJu0YwO7mmL3d5BkCNCOfV+wRW3PtoEkBx+9RFR0o7gyUiovKK6vOTq
	Kr23RPWFGK9wf1WpTSoi8Fn1X5fbJQlZhJBv9sxlKtwmlnB3OnLkxyWIwlsje+z/9/D0TiundQv
	H61Ek2wrLSbPyQqSsbbtfEiaAYgfKAaHVeEKL+i9BB6yNWdR0onq4leIPh31+zCVf2xN075/Z
X-Gm-Gg: AfdE7cmqeUV3PSMQ45E72sbPuvuGSRAmz8ha0lTkokZwlqmQDpXk4rtz6ZuScfCYVBi
	GqZvlhFgT3j55v37mE6/TI2NlBkCl2hA3aBApmeemmiWQmb/Q9siBnzWugbW6ok6dCjdeuip+9d
	ual3XFVVbKTU6tt7tB73v8fktGhT5b1Hp4bEPRLU9sVRzbbBLGxB/3GA0XeanMu+z7Xblze6dW7
	E2Fz4oj8ZwlwGmoYpPL6YUj+sBYMzkdj9bIKHRX7CyHEYOsnfmhWhF04cQXBsKAy+m1nYtE3qlS
	vDGNRShi94PeLkqawcZw4+P0w9INnXSNzByzvy+RRMqouNTH/aDJRd1QwdSgYh0V2/5MS+FmYhF
	yYz6T34JOlPtxZhkdLM8AL37W0dF41JXA
X-Received: by 2002:a05:6a21:b91:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3c3859bacb2mr2048583637.34.1784171758094;
        Wed, 15 Jul 2026 20:15:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:b91:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3c3859bacb2mr2048532637.34.1784171757526;
        Wed, 15 Jul 2026 20:15:57 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432f1cesm9159037c88.11.2026.07.15.20.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:15:57 -0700 (PDT)
Message-ID: <20ea6f1b-94f6-6a42-5b3c-5f19626119ea@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 08:45:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 04/14] media: iris: Add helper to select relevant
 context bank device
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-4-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142929.1E59D1F000E9@smtp.kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260715142929.1E59D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a584cee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=abcCcZLe6d7wP4lZq9AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: I3AoLUPYi9lQ9XQisRvNxpVR5R2yJ8p5
X-Proofpoint-ORIG-GUID: I3AoLUPYi9lQ9XQisRvNxpVR5R2yJ8p5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzMCBTYWx0ZWRfX9V7fMWy7ue80
 ifXj/5eDvpSVwP5Fe/4iL+i92wfvOA7k7qTEmyoocHMRv+5vpWdCvz8HSM0TxewFi4CtTyhp6to
 gr96HoJwklT5VXlepIXKkqKAu+EG6Ug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzMCBTYWx0ZWRfXwz57ITEWBTeD
 rEU/kG7HdP2uF0HcpiWSsgTuCG4q1au8IEDbGOlvPjCRnlXlOIYQtwzZBqGsQQv7yot0pnkfuQ5
 gUekhiDElD2aNfPvSmLTvNe7cPyra7ePLe6OOXuE00gzGEFipbUPx0VFK6Zxy8OV7TdTZ9iC0J7
 ePpDRIj/5iSjNcNVfebnjHegIg/SvBD5eI2KiYiGJQ/E+IW4cxCdwZNIthtNs2VQLIYtFHL/Svg
 Y6UxJECMX77jsQoGpner9iGcXNtqz7HgpTud1f36Mk/g1IosghPIflPCgYXF9anoti1CBVKmyfw
 /YS3oDJu/ohj5qsn5ZqjNSHJU57uuQGHJM77dn+G613lQL8dBGOrkIGPhCqSgkIt2+KRH4xugzn
 zB75ISNr/zP+oDlhxeYF80Uso4gfh/KhZtyL/7AOIg2YtcP83jqEP07d2PSYYFLG6xwjG9SMVyX
 Sto+M2Ak5mwPFLTpC3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160030


On 7/15/2026 7:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Using dynamically created context bank devices without taking a reference via get_device() creates a Use-After-Free risk when file descriptors outlive device unbind.
>
> Pre-existing issues:
> - [High] The `struct iris_core` is allocated via devres but is accessed in V4L2 deferred release paths, causing a Use-After-Free if a file descriptor is closed after driver unbind.
> --
>
> --- Patch [4]: [PATCH v9 04/14] media: iris: Add helper to select relevant context bank device ---
> commit ff67c19893e13d3ddb40ea541f363dbf54e13228
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> media: iris: Add helper to select relevant context bank device
>
> This commit introduces a helper to associate the appropriate context bank 
> device with different buffer types. It updates the internal buffer allocation 
> and queue initialization to use this dynamically selected device instead of 
> always defaulting to the main core device.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 246ad0abbac35..249c9f1d0d5da 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -545,7 +545,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>>  	buffer->buffer_size = buffers->size;
>>  	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
>>  
>> -	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
>> +	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
>>  					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
> [Severity: High]
> Could this lead to a Use-After-Free of the context bank device?
>
> When a userspace application opens the video device file descriptor,
> iris_create_internal_buffer() allocates internal buffers using the context
> bank device. If the driver is subsequently unbound (e.g., via sysfs) and the
> context bank devices are unregistered and freed, the application could later
> close the file descriptor.

Remove callback cannot reach if driver module->refcnt, refcounted during
open, and not decremented with corresponding close call.

> Should a reference be taken on the context bank device pointer via
> get_device() to ensure it outlives deferred file operations cleanup?
>
>>  	if (!buffer->kvaddr) {
>>  		kfree(buffer);
> [ ... ]
>
>> @@ -682,10 +682,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>>  
>>  int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>>  {
>> -	struct iris_core *core = inst->core;
>> +	struct device *dev = iris_get_cb_dev(inst, buffer->type);
> [Severity: High]
> This is a pre-existing issue, but is it possible for inst->core to be freed
> before this deferred cleanup is called?
>
> In drivers/media/platform/qcom/iris/iris_probe.c, the core structure is
> allocated via devm_kzalloc(). If the driver is unbound while a file
> descriptor is open, devres will free the iris_core structure. When the file
> descriptor is later closed, deferred release paths (such as
> iris_check_num_queued_internal_buffers() in iris_vidc.c, or here calling
> iris_get_cb_dev()) will dereference inst->core, resulting in a Use-After-Free.

Above reply applicable here also.

>>  
>>  	list_del(&buffer->list);
>> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
>> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
>>  		       buffer->device_addr, buffer->dma_attrs);
> [Severity: High]
> If the context bank device was freed during driver unbind, will passing the
> unpinned device pointer to dma_free_attrs() during deferred fops release
> cause a Use-After-Free?
>
>>  	kfree(buffer);
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 14d63dc76c9ba..26df872fb4fa1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -107,7 +107,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	src_vq->drv_priv = inst;
>>  	src_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	src_vq->dev = inst->core->dev;
>> +	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
>>  	src_vq->lock = &inst->ctx_q_lock;
>>  	ret = vb2_queue_init(src_vq);
>>  	if (ret)
>> @@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	dst_vq->drv_priv = inst;
>>  	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	dst_vq->dev = inst->core->dev;
>> +	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
>>  	dst_vq->lock = &inst->ctx_q_lock;
> [Severity: High]
> Does assigning the dynamically created context bank device to the vb2_queue
> without taking a reference create a Use-After-Free risk?
>
> If the driver unbinds and the device is freed, the vb2_queue could still be
> accessed during deferred cleanup when the file descriptor is finally closed.
>
