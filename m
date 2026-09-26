Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DDE377A83
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411497; cv=none; b=U1H9TiEwW6XKW/gmE+8SAXDK9JMvuCDg3kxkdurQMGAzpJli/vy+MOxH+WwXGAzCWeCs9T1fyaraSfBc2RsxAWyjIp3s+PGLTv3PoiWh/JTxhShXZ22fg9xoamLmA4uh+O1yDwqlTJPDvC7FNDnKKCDFWfD8PaVvIH8jrWKyCo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411497; c=relaxed/simple;
	bh=Q6RnljJs7WyPx6AOXst7N2sI/86ZVVHjCuJGZA0WIyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GshFzmXdjuk8k7JItAjrSnKet55jDcQCVRpn7JgF81/ARoISnrriS12F5QDaS7Jf1RDPsFy5tB9jDYv8iPqodYYNSye/tUjWlA7WbOPsGI1NrvSJw0nlvA0xid+SJoI+tGPrBdBezwQRVDNDoNM+Ef5cbW82btDKMOmsqr2ZciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGrfv/jC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOGiIidQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGrfv/jC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOGiIidQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OlqJ3745654
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 08:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDMHCRd74i0puiykqzpODlN7stDhp5bygZWJu+ngLkQ=; b=KGrfv/jCNTYOftza
	ccVhwEckMxWwHC/7q6pYTj2qroB8A3Me6GJTgtSLLcUxgmOQl0If4RxzzBrc+QEi
	HfiH+htNlRlPk5WurraDoauoFP84c6cJDmz/Dv6mC5SOZJ3QHczmxTMvjj4DAw8l
	O8LRLdPPPpMTh8VH7xvHI6clOH/rTvJ5XSbRUAoqyu+bqRHNN6isLzVFhyAfZjJ1
	G3LnUrIRbyVLnT8am/j/VlCe+fbEuH1hwimntESM+l4U2h1Z873oVssgXyw24b5M
	9Iv5tS5pkNnyaiV33EYI94jK3En1e8YL6zriIR9V4BmVvJ7uvCJTNtM3msq65U38
	mkz2aA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526gkwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 08:31:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2679196eec.0
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 01:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790411493; x=1791016293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDMHCRd74i0puiykqzpODlN7stDhp5bygZWJu+ngLkQ=;
        b=AOGiIidQ3Dp5ZDaVx40yn4cW7HSq4OJSjxVKfHELLdS8v3sZRPZgZFv5WKcfnXLvlf
         APPQMA2+ftM0A1UBaLDVmSSHY2S9+bEOeLptsVjIoXs9VErIqXqP1sbwiTBnMiYcNyHr
         jxIEPN5D0M7a8FIA26bko83hrEcer7O6rKWk1YgXTnivF7Q8XiPqb7L8S0Bnt+WLD7m9
         xu04nUZsvSEBCd6w13wpv7Br4JWr55s2lznVZl7n511/FBkbxHbAy6LuFChrtYr7rSGy
         ZIngFiAa3mfPt0Lx3owlRR+jHFv2FaYoTiw0Q/+cjoueUSRWPVqBHQ5qsv1CsP0rQxQM
         Ma5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790411493; x=1791016293;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDMHCRd74i0puiykqzpODlN7stDhp5bygZWJu+ngLkQ=;
        b=tx1cLampi9DsZe7U/zdKXmHJ/oc+QS0N5d+Z2LDn6E+MYq49e8uHnJ4zT4J47LvW0/
         B57swyy/OXtTnUKR9SWotJnEYTyiXFF3UCkwszKlWLb4qvWZJdMFioATPFhE6FPXJAGi
         79rbaknAhk7Zi+KZPhQOI5HUSP6vq+4tPYvRGJB9eQvSHOuUku1cUtrx4q+EU/pzLszE
         YdGSRlBrRKIuD4CCmkdynRoqyOR5FPO+d9V+/iow6Ab+aQJWxe0QB0un2nvs92T1IHi8
         BN7XZ4rG5mwtZrSnpC3Z/TQ7OalOV4xYD648Zq/zXU4Ev5YzlBkHd74ALDIgnIOPiAxl
         +X/g==
X-Forwarded-Encrypted: i=1; AKwUvBw4sT9TjmQStrS0+KWRT1L5YBD8pPMRFEEoonaUYpicNggpM/q7lJUtzn2tBBIia8UCpaLq6z4C8oRE@vger.kernel.org
X-Gm-Message-State: AFuF++kFz7lincSTtSaUeic0kEkMsR8sQ/7UWl5yzq4Wj0IGcuqJnZVA
	/4NhCO/sTGERGHXuTD7iSuBoOBAeyKsRpPVMdDOMfFej/VetR0KD/SMpLHqteln5xFa+Z+KI0T9
	hLFqkYnM5Axc+7y6ZWmD0esd7kj/oSkIHDmxG394EjWgh6xAA06V/X1+em7H7KObQ
X-Gm-Gg: AYBFou1ktypLA4bREM2x0Rixtsw7VPxHfbJY2v0ZpoJAl4b6sRb4qXBtx3Nxj5TZxpt
	ejqDPuOPBkNNVbd5fBGAgI+GzQM9L50ntdJJAV0s6hlHOvy+q4hY8rOP5lzuS2q8bVbqOpJkxA2
	RuBysTV+85B5qUnfR8yD/tDGqeMsiZm+J9XoGIyPV89SfuPYodxd3/gnpzTHWxbInn3mpfAGHyA
	25gSrzekk5xT6zoZ+0DeAcuoU9ziFMk+oCUZuqP5dYXPjQj2xPMxFUFwjmqfApAuYnK+Nc//Z+F
	XZYg1cRTap3CRMdtFLP1AJWSjuz3u5iZpbCi3pTWZf18K2XtyRCE+29jOM4hUYIJjvJO778MqOW
	iKgYgzEvniTZePrr4bcpLd8JvsC5IKLc=
X-Received: by 2002:a05:7300:a21d:b0:341:b209:9163 with SMTP id 5a478bee46e88-342735521b7mr2073441eec.38.1790411491937;
        Sat, 26 Sep 2026 01:31:31 -0700 (PDT)
X-Received: by 2002:a05:7300:a21d:b0:341:b209:9163 with SMTP id 5a478bee46e88-342735521b7mr2073279eec.38.1790411486654;
        Sat, 26 Sep 2026 01:31:26 -0700 (PDT)
Received: from [192.168.0.14] ([183.83.142.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm18998755eec.9.2026.09.26.01.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 01:31:25 -0700 (PDT)
Message-ID: <4befec0d-2e6e-ede6-64d7-58e1123eb1b5@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 14:01:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 06/13] media: iris: Route buffers to the matching
 context bank device
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-6-0322ca5dc10c@oss.qualcomm.com>
 <20260926064921.976721F000FF@smtp.kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260926064921.976721F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6ab782e6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=BUSZCRnG/G6/Li3ahCSwQA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qhz_HyYNjHwnG3y9hAgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: O90ywIcv1gc2FzjuxLYk4xrkUIVG6Agr
X-Proofpoint-ORIG-GUID: O90ywIcv1gc2FzjuxLYk4xrkUIVG6Agr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzMyBTYWx0ZWRfX16nIbTlM25rU
 Vd5roGosyKJT5+pxPqm0KU1pXd/oHvNbJPRb9NxvNsQUMtrsZaS+VsgRa92hu6zMq2E3etMOyoB
 GV2WpBA+Jef3nw7LXn/+UHdd3jKBKvgubSd1GIFA1kyVfnmNAU33Lkpi5leuTllzMqVxjhY2ZkV
 iGKNxpDspp3zJBpxan6iFiPbAo+4qm0iAIWGCoRDQLAOI5A1KLMEIkTcMVynsykXGXVTwmfESge
 KYaO0HXYbFTTXmHb/yVty/0yW8CN9spErTgZPsMoYHkJMXaa2yPoUtwSnJ799w/vgkocEVTBgVR
 26BMNtNaV4WJHwQqvoOlsMu94bHxFnTAxb+iCuBNBIS/kUXDeS7pw12Zmt0fpe46Y3ulkYftbRW
 Sydm2Nz6pmwDWrQ0TK3AR02X6xtI+evlNpZrc2q+9i5VklMtpDGoo9PWl2eOQYkZMqaXR2nZAtr
 RaSr9LE2GPrTbkHl1Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzMyBTYWx0ZWRfX/UJbCYKl3pGD
 nqEcZeQBE+Lmj8JXxXOqg/qTIw1fIrKVJdmyGffjJj95W18HZpCS4M+i+xtuW13CoXFsLFzeW+r
 v++BZiuZBIu7z1AIVDD4xNDv2yS8sRE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260033



On 9/26/2026 12:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] media: use-after-free of context bank devices during deferred V4L2 cleanup
> --
> 
> commit 720de65140e46882c5d0651161ef771fcb1189a2
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> media: iris: Route buffers to the matching context bank device
> 
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range.
> Add iris_get_cb_dev(), which maps a buffer type to the owning context
> bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
> NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
> buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
> BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
> inst->domain: for a decoder the input is non-pixel and the output pixel,
> and the other way round for an encoder.
> Fall back to core->dev whenever the relevant context bank device is
> absent, so platforms still describing "iommus" on the parent iris node
> behave exactly as before to maintain backward compatibility.
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index eb8de60c1177f..6e03d13ac1a79 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>>  				       enum iris_buffer_type buffer_type, u32 index)
>>  {
>>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>> -	struct iris_core *core = inst->core;
>> +	struct device *dev = iris_get_cb_dev(inst, buffer_type);
> 
> [Severity: High]
> Does this acquire the context bank device for DMA mapping without taking a
> reference to guarantee its lifetime matches the buffer?
> 
> If iris_remove() explicitly calls platform_device_unregister() on these
> devices upon sysfs driver unbind, and no standard buffers are active, their
> refcount can drop to 0 and they will be freed.

This is not true. Remove callback cannot complete if driver module->refcnt,
refcounted during open, and not decremented with corresponding close call.
iris_close() would call iris_destroy_internal_buffers() to free up the buffers
before un-registering the device.

> 
>>  	struct iris_buffer *buffer;
>>  
>>  	if (!buffers->size)
> 
> [ ... ]
> 
>> @@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>>  
>>  void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>>  {
>> -	struct iris_core *core = inst->core;
>> +	struct device *dev = iris_get_cb_dev(inst, buffer->type);
>>  
>>  	list_del(&buffer->list);
>> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
>> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
> 
> [Severity: High]
> Can this result in a use-after-free of the context bank device during
> deferred V4L2 cleanup?
> 
> If standard buffers are active, videobuf2 holds a reference. However, during
> deferred cleanup in iris_close(), v4l2_m2m_ctx_release() frees standard
> buffers before iris_destroy_all_internal_buffers() runs. This drops the
> final refcount, freeing the devices.

iris_destroy_all_internal_buffers() frees the internal buffers which is managed
within the driver outside the scope of v4l2_m2m_ctx_release().

> 
> Will this fetch and dereference the freed device pointer, passing it to
> dma_free_attrs()? Additionally, does the devm-allocated core also get freed
> on unbind, making inst->core a dangling pointer here?

Unbind will not happen until iris_close() completes(explained above), which
avoids this scenario.

> 
> [ ... ]
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index fcbc60016beec..064cf0a80748d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -108,7 +108,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	src_vq->drv_priv = inst;
>>  	src_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	src_vq->dev = inst->core->dev;
>> +	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
> 
> [Severity: High]
> Does this assign a manually lifetime-managed, short-lived device to the
> long-lived vb2_queue context?
> 
>>  	src_vq->lock = &inst->ctx_q_lock;
>>  	ret = vb2_queue_init(src_vq);
>>  	if (ret)
>> @@ -122,7 +122,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	dst_vq->drv_priv = inst;
>>  	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	dst_vq->dev = inst->core->dev;
>> +	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
> 
> [Severity: High]
> Does this also assign a manually lifetime-managed, short-lived device to the
> long-lived vb2_queue context?

These devices are long-lived when compare to vb2_queue and are freed only in
iris_remove().

> 
