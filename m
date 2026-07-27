Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B1145FE0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127598; cv=none; b=cKh7odnzcIHCQaKC8odCw2EGrauKX9a1JXZA8ZN0RCjY87/BfTDFdY36ZwoSdj05JQR2neeiRpSbJ7e85/IAo0yFkpHCmzW7UCKn06+2q6R3QRT1oKKTZYqy8yRcPFrsfPoBy3mndbNJ10E4/9obT5cUABR8PGUzmG28/bSS3Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127598; c=relaxed/simple;
	bh=JaF/YXIAzejQKRXQjr+CL68SEZiMX62BCOhQjG3bHSA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=buBweT33QJBrKrOnr6yS5OJVbXZgU0BcjpuUHUiEwAUQb/b0KbEup8VZ1PawAmpPZAhledW50nOjxQUIYfYwi3wYi97v7cPR/XfPz7lN2gnUSDAAbYji9VWhswqsr13766M3RwFx0nSxSYascWLDnkI4D9doRC348BToN9TP+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzGzcvpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rg+Qju51; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzGzcvpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rg+Qju51"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1ftFm2137932
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3lY/jyvs336vWLAbR75IPEPMdm0ZegC/konam6GC2M=; b=fzGzcvpVmQVg/n2M
	4YrXzBUdzFTpKlBtfigt9fZjKO1KPOw+5AI8SbEkl4yAKphy6iBD6IJMqPwKP9Dm
	HMuWceSJV9cMBkl8fYdogd1JVq+cFi8NTVvt4s9bxsbaF+8Yv5YC5uCUnVDpJbf2
	WP7oj1GEF6hGlvkYeroqljOqPep7U2ZJszfGkl6bpf/mhOEaVN2zN4UDwyFuNY01
	ExQegxi+du6IDht2JPqmJGflr6JOCKuwnNtNf3NjduYxZ9A/dXHXvu8oi5OtmoQ4
	AZEGyGIMHckwQtkaYARFjlRoHWH9JWJZ1mx9jk6DDHh2w8T8aTYMGO9hYRWG5tcr
	AcAkuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7vg1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:46:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso4464029a91.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127595; x=1785732395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3lY/jyvs336vWLAbR75IPEPMdm0ZegC/konam6GC2M=;
        b=Rg+Qju51x3WV+BNCMfGGCCXgU93wyDhDQvPsbxG7DuuPyWM+hqNHr54DK8MD+jdIIc
         mZ3eh1EOSLufpUhps8x7UBcEZPMT34GF/vCinS6wXvwGJuPEJqU5O+Z+Lrz64xorzV4z
         +LnjP5lhDJ+u4xgq7zZWzm1qY7cOSbTqrbQPodLuwhDyWKFAlzTBd6goxiVMbWmeCxBo
         TvQLnn7nDhgxeSfL76mIWg1yLMvdJPNZDlJdcZIa8VozELBjE5DbV1gKIcPM0eOidnly
         pwGHqzmFRf2VAEll3lt/H9gfUJDs5ngsHM9sGGhDzjaFN5idG9Kc9gokIugXPgGvH4jO
         +0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127595; x=1785732395;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3lY/jyvs336vWLAbR75IPEPMdm0ZegC/konam6GC2M=;
        b=deHN2Mps8EbR5+H+DlL3rVB6wmbD13iQiEfhmjg2sr0d8c3Bi6qQ+ssABNRyGlbWYY
         JWt0/q5b9IIlskuJUSeN5kSzqRbP/StuUfpKDay2x0lF6zO75aYlw1XwOAGRwY2p1Xph
         cgtjuUyKV4Qkl/qqXF09TCGzM2gURtrJKGzJNCeP0XHyoR266cQz0btwq/QSCbw+KOro
         KZ4fJmepNhEMjbYUsPeVVozAJD9jrFwJ/Y8g3CSZGCAruY5hmCgfY7phnnaurzMig8+P
         Gt2QA8Y9BWpEpk9tghHtrnN2PUW//G6XDa9Sdy+pFHa99/ms2RRC4AIlSTXpbOobnQOX
         7kwA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx04y0iAejyDd3iRjY67xYf2URrmH1iWiQ8UEhEZ/+2UD27NQ5ivY4PSfpmkDL2LZ7/JDIgqoIBJo4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87HCaGzAvn/mE/C9k+ZV4kGzzWsSnghd/nooPD/feDIYyAe8b
	FXBbYVOSdZWcT7o0Iuskjn5VCPIx7cpTbw2Zw45qL1J5IflgTcs3I9isSrsxIt8ScNFJ1N+4vwg
	E7Lbz28T6Q7BxGRQ5R/Cn2e8TIHT+IJw8Q0o2Chk9Lkdr150MJ6fMAWiof41ulu4z
X-Gm-Gg: AR+sD12Rantq28gX1jfsSKKT68h9ND9s/rKJ4jlFAIaVBbhJOcZvg/ml60bPfSSCcps
	qfubUucRHxJRKqC7lntel4MaZPIiZqPCwHjoju3NlJRJ3Hrhf1rSiebxPiDQLf00aW/Rvn1oaVM
	qYneVVswaeyri4sGG9Qt2TzwTtzJnaXkRx6P+vJKUiW0099dYfj2feybWk4J33ohjiXFy/35P0s
	xoIuxbhqNLOhqvkmuGMg4gf7UEmduHzfG9hVyg4wZQNwKY4MxQqakVUgfFkTPZLa4lYj8j9FIfJ
	7opa68Bd24HUT0+S8J7hjFdNzSh6p0iZrDtBPrn2ppcdjVCrb44uVo/N2Sv+36hbql/31pl668e
	/r6AIhJ6OPtCp1/KQN33NukZvK5Z1QIkw
X-Received: by 2002:a17:903:1b06:b0:2cf:84bb:1ebc with SMTP id d9443c01a7336-2cfde7b086amr67795945ad.15.1785127595132;
        Sun, 26 Jul 2026 21:46:35 -0700 (PDT)
X-Received: by 2002:a17:903:1b06:b0:2cf:84bb:1ebc with SMTP id d9443c01a7336-2cfde7b086amr67795785ad.15.1785127594713;
        Sun, 26 Jul 2026 21:46:34 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e261fsm29774567eec.6.2026.07.26.21.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:46:34 -0700 (PDT)
Message-ID: <c37f55fc-731d-30da-b7d0-141e7ddefbba@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:16:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 11/14] media: iris: Add hooks for pixel and non-pixel
 context banks
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org,
        devicetree@vger.kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-11-de451559e88b@oss.qualcomm.com>
 <20260726060345.01C021F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060345.01C021F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yGciy-ALbSLRrvC85BJy8MIAWEA68aWX
X-Proofpoint-GUID: yGciy-ALbSLRrvC85BJy8MIAWEA68aWX
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a66e2ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uuqggVgKC9gQnuY2d9IA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfXyWclwW/hU+yi
 ffpXT6ayJMqX/yxdChOvU2UjIyCiRiwPh8/GslFlRFRoi8sguF4H8g0gtNFahaNmi48Hke7lU4W
 g7rVcHNwLSQjzlSdqtGtGhJ0JWLyaoyR8boIG67i1Kx98JTpRzoxaDiXAgkitPwarcY13iz6zRP
 EqdSCl8jE0xkfF30q3zKFjIeBBCqV28olyLN5nukZjvl/xzW+OJaK0YuPHIfTvmg/PCh2AjGc8m
 9EeJRuQf32ISBB3Chx4qhWiOeMVLCMM3dqHHTs6YUvvlJ3lDQ7t8MAyVWIpwPWey41rLK9r14Pb
 ypGBG+9wNKKgradIhYlTw8VphzGTZHuYwIcGVt6cWxg+effhFl1fRUldYkMMzcfi1l3Rpl4jO8D
 bkpnwj+tIO0tekVACxCDTxHP/e6UODCPxUbQLx1TOm+nPgo8U8eA0tmZ8ujqXWdpaIp3iYsRKDT
 BDT2Q3lRkw5ROAyMDEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX7mP4Af08dR2W
 ibWngFnIEw0arUnyIW+dQ7P4w8LvoI4ft2cVsxum3nxSU0XrhTz+kJvmXBGR/McFgnqspUFk3Vh
 W1nOC+U8QuiqxPOM9ssYmZIUUwlhvPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:33 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Dangling pointer in `vb2_queue->dev` due to synchronous unregistration of context-bank platform devices.
>
> Pre-existing issues:
> - [High] Missing cancel_delayed_work_sync() for sys_error_handler in iris_remove() leads to use-after-free.
> --
>
> --- Patch [11]: [PATCH v10 11/14] media: iris: Add hooks for pixel and non-pixel context banks ---
> commit 1f1fdc377aea1a90f259a986e4bc14be351b3bc0
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> media: iris: Add hooks for pixel and non-pixel context banks
>     
> Iris platforms use separate context-bank devices for the pixel, non-pixel
> firmware domains. Add platform hooks to create and destroy those
> subdevices, providing a interface for their lifecycle management across
> platforms.
>     
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index ec35ad4f86102..bc95be22ed96d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -397,6 +397,52 @@ static u64 iris_vpu36_get_required_freq(struct iris_inst *inst)
>>  	return max(vcodec0_freq, vcodec1_freq);
>>  }
>>  
>> +static int iris_vpu3x_init_cb_devs(struct iris_core *core)
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
>> +	dev = iris_create_cb_dev(core, "video-firmware");
>> +	if (IS_ERR(dev))
>> +		goto unreg_p_dev;
>> +
>> +	core->fw_dev = dev;
>> +
>> +	return 0;
>> +
>> +unreg_p_dev:
>> +	if (core->p_dev)
>> +		platform_device_unregister(to_platform_device(core->p_dev));
>> +	core->p_dev = NULL;
>> +unreg_np_dev:
>> +	if (core->np_dev)
>> +		platform_device_unregister(to_platform_device(core->np_dev));
>> +	core->np_dev = NULL;
>> +
>> +	return PTR_ERR(dev);
>> +}
>> +
>> +static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->fw_dev)
>> +		platform_device_unregister(to_platform_device(core->fw_dev));
>> +	if (core->p_dev)
>> +		platform_device_unregister(to_platform_device(core->p_dev));
>> +	if (core->np_dev)
>> +		platform_device_unregister(to_platform_device(core->np_dev));
>> +}
> [Severity: High]
> Does this code synchronously free the context-bank platform devices without
> waiting for userspace V4L2 file descriptors to close?
>
> If a userspace application holds a video device file descriptor open during
> driver unbind, this function will unregister and free the context-bank
> platform devices.

Remove callback cannot execute if driver module->refcnt, ref-counted
during open, and not decremented with corresponding close call.

> However, in iris_m2m_queue_init(), the context-bank devices are assigned to
> vb2_queue->dev:
>
> drivers/media/platform/qcom/iris/iris_vidc.c:iris_m2m_queue_init() {
>     ...
> 	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
>     ...
> 	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
>     ...
> }
>
> Because the V4L2 core does not hold a reference to q->dev during videobuf2
> queue initialization, won't this result in a use-after-free when userspace
> finally closes the file descriptor and v4l2_m2m_ctx_release() triggers
> vb2_queue_release() to unmap DMA buffers?
>
> [Severity: High]
> This is a pre-existing issue, but does iris_remove() fail to cancel the
> sys_error_handler delayed work before returning?

This is addressed here

https://lore.kernel.org/all/20260604054708.42426-1-dennylin0707@gmail.com

> drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
>     ...
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
> If a system fatal error triggers an interrupt just before or during module
> removal, the sys_error_handler delayed work could be scheduled.
>
> Since iris_remove() doesn't explicitly cancel this work before returning,
> could the handler execute after the devm_kzalloc-managed core structure is
> freed?
>
> drivers/media/platform/qcom/iris/iris_probe.c:iris_sys_error_handler() {
> 	struct iris_core *core =
> 			container_of(work, struct iris_core, sys_error_handler.work);
>
> 	iris_core_deinit(core);
> 	iris_core_init(core);
> }
>
