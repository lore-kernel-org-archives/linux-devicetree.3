Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5093946AF3E
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036634; cv=none; b=FeD6lxNcrswDRDG53Zi9kgghFMOs4BxULCfTu8BXVUQHXXKAlpEwXjgofXQGXOd5hkFQolwasUyfMZFfiU+qT6h0OPWq7nu+uMpCnYRZFvjatrWaiMYmxO9sGfXb+LqdhZrBfcjRZnQjs4B4U77+dVtG5UP/OFID8cgeG6gzCe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036634; c=relaxed/simple;
	bh=sn974e5WDmNcYMICp0xJMqoWe+B4MjE/CwpdLM3QRmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYh/16q8UJFHbc3Tv/44WXwbU9DEhAi0IN5FtGuRIo/wD3E1csDMaoTy+DoN9XFCrPRlstXmf355bAuPcRSSy1LkLf7Iz06QPGlhh2FzVwe1GCat2F7nMctl7ZtWqDggOT4zdefOKfea4H55j45s6TjtDeziBIP1QulmVgg6bIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSFVmZyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjfnId/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSFVmZyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjfnId/i"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED3dRw674000
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fqKiLsLflHibmO4fSr1YwmwQ5MUCGMnstBVhamro8ms=; b=fSFVmZykw31fWOtC
	kNFCqH9LBOTcqICF0Idzgz115VLXucql316I7BpcrMO8uLr/iuydgnsbFSRJmLoJ
	oZi34pTnH9mDROaP0rYYoxNkC71A2KxGZgjvjKQphrs1FKb5AcBDwsuAl2Qa9aQU
	FJx3ozeWF5HmOZWX32mbq+rAKwJwzVMN4+QxCkCbDXHlHuzHOJOxjSzVwF/uv/9p
	qmuH+WYxPTBIlZpFGWdsAyu9MqnX/HMsHRIvAQkkemyrkJ9o/3SX27aUEJZyF0HE
	i8id8ymtRgIk64qEjTTFtJqdg/xkH8DiovX6BkWo9etVq2mQmPZnjJpdkqmjiArS
	IGFr1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqr6q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:43:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484ba00601so1419146b3a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784036631; x=1784641431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqKiLsLflHibmO4fSr1YwmwQ5MUCGMnstBVhamro8ms=;
        b=NjfnId/iom07WXHqtWG8orRURdFNtm8yJ42fbHyVeb2kyPnAnit8Ut+apPIWv9FuQX
         Ds7oarlXDRLbZdz4YZKDMJ9E/b0wo0RcPHzCvd6yGai29BBbgpa7JMNNQTMBgL3oUseR
         jURYAJyOAedz4NTNycihPCigcEDLC82FEyIwyUqPb8SLjD7dmPMAPrTrajFTOkjvoRN2
         CCxfcgz2+hq773IR8DazNraugpimO+V/Szx5FM9QSk9qmPd1HxCCr3hDUWSlAMb0jYMK
         sgDZgv6HU938pJ4YPYWVvKOtJsWVtPtjyZ+aZmq9dtSdbaN4ebMoNgHdzuDuMuRCBc5/
         yAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036631; x=1784641431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqKiLsLflHibmO4fSr1YwmwQ5MUCGMnstBVhamro8ms=;
        b=QK/xQbnk590UmoPVVsIC9BNQC5NgvAud5nnAc0Esdmi+9lAbLn4EO72EEYr9YH4kms
         DCM7Tz+iv8E5kMW6pXDB+Iv4dV1i2rgAYYuqYuFbtijmvMQ0T06mf700gEfnrFVIAKv2
         urBUB4WDnPbhv8hoZn3oMeUpjnc0cywwCAdsG1mJGs7ipBjHzY3qPO7j5IitWub9pi3Y
         Z2UISAHqDPZ5W2GfkkyRj9B0Jz/4F9CtqdjNQANsk7K71CWAC+rTkmvrht1exyBP4CyI
         jDsaMGaqQkaIarjnDDK/IdHlBI52a/jkbpBqVV9M1fOmDq9sB7C3b+98knyDHUo9EMnh
         gv8Q==
X-Gm-Message-State: AOJu0Yywy2ovBe/zU7sjPy4yiQEc5eMbzO5aM/0/8/gPpWcBgWjT1pUT
	87XM0nKL+RpRP08+aVW69HQ1TEqTxNDay6iNud8QUWbhm3PSX/n35KjMz49WDWj42xGjXK0ep/j
	nnnhLsIMkYbl2s9RKHpY8Y1PQEqu/TDWik6soCvnfTl1qD8Y/ZzDdMs75GhvLY0Bq
X-Gm-Gg: AfdE7cnEhyRRZ71pKSKp/OzXDpRGZ+YDeFDfxxw8hYU10RO3aTNHpSavSa/ntwGYgdM
	j4pSclJJmecrNJeTRxWcPxpGWwXgj9i2C+Y5iXNaCWD4JRb1i13GCY6u3xUTX8QKqRzTeNl6UdZ
	H/80VCO6PbOqctHU6a3MYKDX3PYvBKgEfMZzQOCki9SoLNcbtytE0YNW4stDwEYUiXdPL+XYJeh
	WSLK2mwg/0bAZRhDKHO16qNS7ntqgRr0A+dAVD82rwexpVM2PAGKszmd3dAj1x8d79CyZFJ4YUA
	2O4/u25MDWjRagKWDkflOeD9IzKlLLFDg60aH4FtXYg+x27Em3CVk1WqZ7jvUwoVb9JsF3J1qGg
	N9PFfen+fdIMLyDMJLAUVdMs168ZH+KrAxZyDXRziirY=
X-Received: by 2002:a05:6a20:3d02:b0:3bf:e761:626a with SMTP id adf61e73a8af0-3c110a74637mr15662042637.38.1784036630909;
        Tue, 14 Jul 2026 06:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d02:b0:3bf:e761:626a with SMTP id adf61e73a8af0-3c110a74637mr15662016637.38.1784036630411;
        Tue, 14 Jul 2026 06:43:50 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9bb8682bsm20916154c88.10.2026.07.14.06.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:43:49 -0700 (PDT)
Message-ID: <3def9abb-ee40-42e4-876b-b865cee82e67@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:13:46 +0530
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0MyBTYWx0ZWRfX0K0343eWHtL7
 s9+Qg7BIHqnN59SXUEFoMhoWyUDWHNT5mrFTuasCj7YaeacvmOZnshVprgYDOUYQePOt7E4WyDB
 Y4n4ZsjxXfFaKplXJaEOIAxwTZ9duUVqbVdwgJ1rV/5PcdEdy01Oc32bGgqZmxpxcvD6hTTiiG/
 8aCw9eivvEKfNUOldzDh5tMR0lVAlhMw3Pi/Us1xTmJrbKHqpcToVOuKRlDn6VCLC9XQEBn3va2
 A9I84FCZGD7xf9+FB//bOVIf0ehSb1z/gzftFGcupo+jmDc1oQYgEtThWk7+zhxAXl4NEJ4Z1NP
 WP3hWwCpPTvXjsgv/vuQsYd3JT/sk+zdB5j5IJM9aC1VU2G8CuwcDqFJ/4liPKQZDGj1jmZzP/Y
 E7jdoOGprc0V/DAYcCDBijMK/cNInMuAARCTZs/6JAPkvZiiWYQRVAT2s/wcQP4P4YjnWJ8FIZ/
 i5cWSmphWKq/53llHjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0MyBTYWx0ZWRfX8Sh3GtkmmQ5x
 71M89vgw3XOiZOCJkzNsNXI8q4+KbhNibDoAL57SofDITCouP209FwBQD9/lJFixBJUt25q1lJL
 Lg6Oes8l7pdXjifPwY8i0jhE/x0I0b4=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a563d17 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iPUPAVrUwH6BrZv12N0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: MtacPacVOzJdXJys43IlQQYjwo6NB1Z6
X-Proofpoint-ORIG-GUID: MtacPacVOzJdXJys43IlQQYjwo6NB1Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140143


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
> the device after remove completes, iris_close() calls
> iris_destroy_all_internal_buffers() which calls iris_get_cb_dev().
> 
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

Yes, this is addressed with

https://lore.kernel.org/all/20260604054708.42426-1-dennylin0707@gmail.com/

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
