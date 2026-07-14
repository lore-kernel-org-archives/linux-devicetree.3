Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9A46AF03
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036384; cv=none; b=t7kixuY7tm+ymx/wGIj3SAE/uyX0OZzOl/sq9o0ZpjTOrqeiMnObaW+8FgjJnuoS+l8UJJjhM77ReEnfXPSl1NVsJV8ycP8rRochpipLV0ZaBdF7k+JqjkXLINt4G9egj9INmJHi5eKT+n7xJaXJjEk6o/V1Dwx3KHA71yJLRUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036384; c=relaxed/simple;
	bh=rgtVPIByrm5QhUXkNl5htw/ray6mgETKR8qkcpSDwHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgt3i8xJiBCLh2CiWuJkEpYt17+Z+Ub/glpRw1pDf4cAs7jGcr63kU1guqWbV6GS7kBbjo7f2LtqA5eXshmek3m+iRNg3Z3JaclabH9ffcpm41RMFbi+M0cityIb2wnwq/auVLgjTgRCvA2Kv/LV6gXC+fn7r9BD7odCrPmSxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvJsB+JS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPhx95Aj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvJsB+JS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPhx95Aj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED3sMM721091
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBXnWw4WKjoF9a+U6zlcEgbK6XaGs4jX1fNJG3TIGBQ=; b=WvJsB+JSveo8tlRC
	wuH/lKDfnT6logm563jQoZv5T040Qe7O+BrBHTlTpOCTvYDIhEn2zu6EPMO+9gwv
	aVn/QnRShSvrjfuIzVksvo194rE1E03oo8LgW6u9ydLtMoWpaepC4waYJgx2V46/
	dTHHeTufWP6CS+KZdE1D8ufkn9zhfCJ7jMgVZL0FCXXdmkEB9Kvghxt9I7ukmNqy
	85efl5iMbspRN8IrV8m8Sw/rH5IxI310oGgFNrhvZ9/Md6CHPCG+JQyagEX7FJLM
	PlDPw1sD/HI1/LQzMgWWC4HkaHoAHG4KL0U5e9WYjwaZ3K7UDLKI2B662bwvN/V/
	5zgDpg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnur5cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:39:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so2367893a12.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784036382; x=1784641182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBXnWw4WKjoF9a+U6zlcEgbK6XaGs4jX1fNJG3TIGBQ=;
        b=bPhx95AjbUMprYa2R9ABB8uyipenRP+cyqxDfoUFPCFrdyXWtD0AN2djh/6m41MQp0
         ScBbGOqmI8tzn8joDDuZtsXL/t7iuuqMW55HXYnSM2SaA80peUKqQYMjS7GHusjOFj5J
         bdJWtFiIYoqkbUp4M8nDr45R5S2uVdx4smL6t+EfFGBHcb6r68hCNglFFwAH5dipuc1k
         eCrFHfdQ8ctTEaudtK3t/5YfgAQRZXaViSSX5l9h3BqYlDMv7LqSKsd+ayH/dMgIvkWg
         0p44j9hH65XPEKUCHutlcRolO/Hhn6YqauMPQJRQ6zooOfPbjIX/srSkraX4XKa4SDu2
         JyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036382; x=1784641182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBXnWw4WKjoF9a+U6zlcEgbK6XaGs4jX1fNJG3TIGBQ=;
        b=FbjKWHlbzlwPSwdaKv13GpCd/OOUal/Y0VLC+6ZsjhlARCH9udmwvmXYb5yevQLDfO
         shHTT07nZybwGVqZyEtJF2MTCkxII6wb7BLsGKpa9fqch+QhW1414BWpH53WtTs324Ya
         ovF9xmHZR/ngSbOKGiBLRgQDxMxrDH2ov3UXNYws1o/Ez4auD4OHFOo6BgZtoxcQjsGz
         EUYNYwo9YiTTDjsaa0l4st+g9kCcTUuEm4G5UIIZx6f9o6pnooFlOE2gB3eQK4un66gc
         7k1Ys17ZYzpx0cDxM3zqNrmeaHNffm8460JX7iVFNunljbFZTkRlEvbNMscy0RtIFRTY
         Y5Lw==
X-Gm-Message-State: AOJu0YwasyID7QVTcK1U0HsEM54eSI509yxRVQC2CcQRzaffjx4GtMTf
	RxnXzWwNkPlBIprt3Um5RKYlch3N5axnlD0oakAiGluZ9ERRHNQ4dyN/mjTnXa7KyKnflDoCBYn
	PgutV6Wwn/g5QYtHKke1LjiP/p/12hgzqYu56syeld1Xn4xZls3fHrb1ohLGfwD7BV8WitWfK
X-Gm-Gg: AfdE7cksbSOtEqUJTw9n00oC8OdLBY9/PdEjvujfMlqJmvt7YKT/NZWvVrNRs3xaO/7
	dVFf4i8m1h21Tex/mXjuiwL4toopjwE0h5LgWHkDygqnsfvtUkcqSTbuKCztsUnCGP6atjvT3ns
	jZ2Hggsh+zPNfAb5fh4XCnaciNKQfdQWzPRC7KpqpPTf5kOh3UBzfszIUGljthPUBoVaSeGt5MB
	++mQgZGTRizkwivy7v9+LJKut1Vlwgrs1wSUy0++yN+KLKpmkKh4A8PURCt95k5kpAAo/0hoCGv
	8zkw1lBCzpJ8c/eMkCBCFByVvWYVRIjSxBHPcQszdr0UW1YxFzd4NKZu8f5T/3NPe/vYQsuU+b6
	M7idhQtSiJ8lcU6VPI2vyRNzSqOrukEd/BeiZbJ6tPHw=
X-Received: by 2002:a05:6a21:4916:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c1108bdc93mr14633421637.50.1784036381524;
        Tue, 14 Jul 2026 06:39:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:4916:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c1108bdc93mr14633388637.50.1784036381061;
        Tue, 14 Jul 2026 06:39:41 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm75423219eec.6.2026.07.14.06.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:39:39 -0700 (PDT)
Message-ID: <1f8f65e7-2a73-4128-b48d-1a6edb9498b3@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:09:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <20260709135418.9421B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709135418.9421B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kReLeMkHGnYryuwefVIHmRsuorq1Z5ab
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a563c1e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RjoTav1wbh__A4LDucIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0MiBTYWx0ZWRfXyv6A37GDDqnh
 lC0/5LcPYZmjj8U/qNoauX8iPBqMCXoXMe2nM0V6dzYVhODpcKuPP7yaKIfZTPVEMK9/95shah1
 k8lV+ATK1IuH80tEkD+xq/O+qte5KGg+6RrMaFDMVyP41jb7fj76/4zK9akfrnZq7El0zNd+ULV
 JPlNZvtor7IYo/0JpxSiyyquzgyR7zHg1iup8Mb/MxYJyjydGAK88yH2phGPuT5L5ziC455T4VZ
 JuTkIc1Ql+NU6yfEJe/qiOzlEWx5UasMOeq4g660HSbM/Lhi6CdMHhiffCZHP8Fy9qkV3dki1Er
 qzGONZEueGU4DSH2Kwsi6VoS3gO54UJMUKZjaVboxEAEM7hMJKiUiLDBrtBPzE4c+u0wpO6XR1J
 r7BnCTv05LFXZ8WR+nF9Lklo+INlQC+/GKcvvtYd4rVjzbUHFAUHq0dTXb2dOc6MkCUr1MoZwq2
 tppD3ikSZbLC85cpkmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0MiBTYWx0ZWRfX04kkAMiauwGu
 xfAwKagQG4jtBeinrGbe100H92nO2Sv8GFCFDBSpEe0g+4r4svq2sf1j4S4dZSCB389fwQvyKgv
 GuoJCfpTFg/NJ+a4gO19YCLeRuXIWJE=
X-Proofpoint-GUID: kReLeMkHGnYryuwefVIHmRsuorq1Z5ab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140142



On 7/9/2026 7:24 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Unregistering context bank devices in `remove` while V4L2 FDs are open causes DMA API mismatch and IOMMU faults.
> - [Medium] Hardcoded platform device ID causes name collision if multiple Iris instances exist.
> 
> Pre-existing issues:
> - [High] Missing cancellation of sys_error_handler delayed work leads to Use-After-Free.
> - [High] Use-After-Free on `iris_core` during deferred V4L2 close due to `devm_kzalloc`.
> --
> 
> --- Patch [6]: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel context banks ---
> commit ac38538cd2eb8a1aa776f7262b1bd953d7ac3a78
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> media: iris: Add hooks for pixel and non-pixel context banks
>      
> Iris platforms use separate context-bank devices for the pixel and
> non-pixel domains. Add platform hooks to create and destroy those
> subdevices, and wire them up for the affected platforms.
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> new file mode 100644
>> index 0000000000000..bea904a9249ba
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -0,0 +1,71 @@
> 
> [ ... ]
> 
>> +static int sm8550_init_cb_devs(struct iris_core *core)
>> +{
>> +	struct device *dev;
>> +
>> +	dev = iris_create_cb_dev(core, "non-pixel");
> 
> [Severity: Medium]
> When creating the child context banks here, could this cause a name
> collision if there are multiple Iris instances?
> 

Ack

> Looking at iris_create_cb_dev() in iris_resources.c, it zero-initializes
> struct platform_device_info, which forces the device id to 0:
> 
> drivers/media/platform/qcom/iris/iris_resources.c:iris_create_cb_dev() {
> 	struct platform_device_info plat_dev_info = {};
> 	...
> }
> 
> This causes platform_device_register_full() to assign exact names like
> "pixel.0" and "non-pixel.0". If a second Iris instance probes, wouldn't
> kobject_add() return -EEXIST? Should PLATFORM_DEVID_AUTO be used instead?
> 
>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	core->np_dev = dev;
>> +
>> +	dev = iris_create_cb_dev(core, "pixel");
> 
> [ ... ]
> 
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
> 
> [Severity: High]
> Does unregistering the context bank devices here cause a DMA API mismatch if
> a user-space application still holds a V4L2 file descriptor open?
> 
> V4L2 file handles can outlive the driver's remove callback. If a user closes
> the device after remove completes
This is not true. Remove callback cannot complete if driver 
module->refcnt, refcounted during open, and not decremented with 
corresponding close call.

> iris_close() calls iris_destroy_all_internal_buffers() which calls iris_get_cb_dev().
> Since p_dev and np_dev are NULL, iris_get_cb_dev() falls back to core->dev:
> 
> drivers/media/platform/qcom/iris/iris_resources.c:iris_get_cb_dev() {
> 	...
> 	return dev ? dev : core->dev;
> }
> 
> This means dma_free_attrs() is executed using core->dev, but the memory
> was originally allocated with the context bank devices. Could this mismatch
> violate the DMA API and cause IOMMU unmap faults?
> 
> [Severity: High]
> This is a pre-existing issue, but does tying the iris_core struct to the
> device lifecycle result in a Use-After-Free during a deferred V4L2 close?
> 
> In iris_probe(), core is allocated with devm_kzalloc():
> 
> drivers/media/platform/qcom/iris/iris_probe.c:iris_probe() {
> 	...
> 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> 	...
> }
> 
> When the driver is unbound, iris_remove() returns and devres frees core.
> If an application holds a file descriptor open, iris_close() is eventually
> called, which dereferences inst->core to clean up sessions:
> 
> drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
> 	...
> 	iris_remove_session(inst);
> 	...
> }
> 
> Since core is already freed, won't this cause memory corruption?
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but is it possible for the
> sys_error_handler delayed work to trigger a Use-After-Free if it runs
> during or after driver unbind?
> 
> The sys_error_handler is dynamically scheduled on hardware errors, but
> iris_remove() does not appear to cancel it:
> 
> drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
> 	struct iris_core *core;
> 
> 	core = platform_get_drvdata(pdev);
> 	if (!core)
> 		return;
> 
> 	iris_core_deinit(core);
> }
> 
> If the unbind occurs while the work is pending or running, core will be
> freed by devres after iris_remove() returns. When the workqueue executes
> iris_sys_error_handler(), won't it dereference the freed core?
> 

Regards,
Vikash
