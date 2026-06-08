Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCDF1B6D1A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896921; cv=none; b=RFTO2EMXleKm+ZzOZcOxdcn2wXXC+ix3DMedDHYvCZnew9sls7A5pse9yVK8aSagS7xgkzpC9EXT1ZqYjMHbpYpHKhMwMauvyBhTkeOW8S2lIBzWMJj7Zru0lUGQ7VrEJtVipiVw9LUhFnMJNwku2fVUtSCmQV0ToFE9COYP3EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896921; c=relaxed/simple;
	bh=ajK/MgzUsib/wK0jgMBvRMOy/SUhm9PqzWecg2Dh80w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fceKjKG/VwCdKR67RFZN/yrHAAOJChc1Wcpe+Y2aqD5Qb5h4fBXcB0CCOSUtY+i5jj33FVXvZ77vOXsPF+3qB6g/dQicZVeveni73J55FP3WeSlwZ7MTJGMpxKSFpAZReHrfzTHdiYL9dDLGl2ETaMYmRayUXmbJJL0RUZHqLEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVQJD25a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlpyjKYi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVQJD25a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlpyjKYi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EAVS1534809
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmNTYkNS43DYDdo1gGNp5le1Bl+cXsQFT0BXh7TVrnY=; b=QVQJD25aLEbyeOEn
	UvxuCjhcrUoRh8sWeeBhK4Ef9SD4U4KIv6BOUiXBXBtnUplgaTNYSr2JiylXDa/h
	25h4pK48jl2cw77tmTNpgAaSbscDzL6+hOMZfPAYtVB9v419istpzDBqhQua4t6f
	H6G+x5NkUQax8Pg6JL/7LJooD+bPgVTpo5Cv5bFmqez90ACBc0FdIN37eUvrns2p
	sDJqXtswLHUewohMlHz+BZigribJpzE3Hq1Mjz/jhhcBuMAAtL/QY/gXSNaQdX1q
	Gz2wqH0JHzryvBPYHbKR/TsFdH4XhMLzRRI9pLzqxKPmg+DLDSfqNofA8/2jlSw0
	Mkr3iA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagre8u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:35:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842cb4c62f9so1175330b3a.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780896918; x=1781501718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmNTYkNS43DYDdo1gGNp5le1Bl+cXsQFT0BXh7TVrnY=;
        b=AlpyjKYiqxziOVgctKPqoFAPfoiofk3TNhR1HC4fOSMmWNU7jE9zQ33Lm9KHmwXSE4
         N6Mx44PvRHrQQYjCc7m7SVf8V6T805AMbux9qNcu5aLnXB9mD+TC/VPRvL1v4yOoxHXq
         WSA0PQ9HnWVI8C91DiK5zrTf5Wd0GnFA5WeFa7y02Ewr540ukz8dMpGDTu/fD8SLSs5/
         exBUfOa1vy3QOLXB6AybfoVG0R2Ks+j0CtAdIi68bonXf8DtKZTGZFjF7WhSV3MP+yQe
         IKhUiMnWlGtsDRLc8DOxRD2jWgX1EaPT82x3JaGd4uTICuWt2Tv7Fdyhe2FsEFL82CK3
         ruog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896918; x=1781501718;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmNTYkNS43DYDdo1gGNp5le1Bl+cXsQFT0BXh7TVrnY=;
        b=guAkEJEp+NjzhV1Tr+/oypLa7k9asoX+F7zeJdTxZE/E8Wu+WAFkPR1dKLy4Lot6q5
         gIrDit79IebZAkxLbcDNWFw+0KVdumVzKHOZUdkUVFuOyVwfNsT+JwL5sir83vTceprt
         61/IiEQa8mRTr0zd8XB1aJMOC45/1Zxnas8nnJuvzHLrxxqUthUhjPAcRvAhz86zssl6
         274VmqnoLTy/8NRJRmm2gWUe5qTO3ZyBtDVschBcYWeVl83a9BzI/VzqPChYIC1G5Q98
         A2UA0Fxkkz4dZyxQZJwt1NMsh+Ntuk2a6TX0jxwe7RvFSdlDOOtpLc/ALGOoZKf1Rx6C
         QLFA==
X-Gm-Message-State: AOJu0YywNqOwDeCOyqQgM6xW3uqG0l+7oQKHo/e7vVdBCqeckJlUnNVk
	JpjICFzPqtssAloDwaeluHyGMk3NfEeVDWAbal4ykEtRFRwZ8G6pAWCuBOsRIrNMtqbmynRQZ5I
	g6CU5A4L+PdmqsD54JlVmduQPJc1BtNNyT2HZtT/OGSG0YaIX69jboz3bW0LYEB78
X-Gm-Gg: Acq92OGKn8/lZEp7Ou5Cno4yu7WZAiS5YS3SyNDdP6gOl+tknv3mtRuYc6MWKxZkgo8
	Ctj+0lyp2JsOTyrmiN7LTDhhkfiGoXuJz51BQ6D+hukTDPbP0FpUYBecScWGW9IoNl7g6r0vjjb
	mtO1Tq86fLNFhMEs1FtsObUrZtNs9K3JUUVzVZuYEEBuxpy/dJtwZatyiMmhBzmUDmzN2gJych8
	ofCybe//pEF9O4+vDc1p+lT/uzN/s4y2y+zqYy8BnqYypI8e5keqD4b0vnwqoPgx5ZKyPftQBwk
	Nc1eM5KunRN7GpReCvEd2/Z4USuI4ZvDUxmySDZS8f5WI3hR+CZ5RSiC5HvkTbZHhsiVg/rr1A9
	WDIW9jH1XthXXJX7NhJk7yVFbOJjwk+TDzq1FS95ILpypkbmlRbYELm5mXLTimL3X
X-Received: by 2002:a05:6a00:1405:b0:842:3841:fdb9 with SMTP id d2e1a72fcca58-842b6823968mr10391550b3a.31.1780896918523;
        Sun, 07 Jun 2026 22:35:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:1405:b0:842:3841:fdb9 with SMTP id d2e1a72fcca58-842b6823968mr10391525b3a.31.1780896918005;
        Sun, 07 Jun 2026 22:35:18 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm16516904b3a.34.2026.06.07.22.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:35:17 -0700 (PDT)
Message-ID: <b386dc91-9c01-90aa-1c43-5e7e19b24a82@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:05:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 01/12] media: iris: Add iris vpu bus support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org
References: <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
 <20260603144559.8D4D41F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603144559.8D4D41F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OCBTYWx0ZWRfX4lGQ79V+gZx7
 pjuHhMBDfNP263UtvMrMOFiW+uVdRyF33dDDCW4rtp3U9OfHd2qq0m/y/P8RbbAxNnfTRdIWtP0
 mwIVfkEAztpKny1qObtSx1GZdsKpSzrtjfsOgSwXgmOlCr3LHPFtaQ8Ub5zCcvokOTznVlHdHpv
 mJApVaTcwPhK2YkIHS0sj0sD3KjDUz07rtuD1qfSZqQKX0AYGgyulqfvaBuRfCz7myuaTurxDN7
 DTAi60W2QFLdqHli1yRZch1pWIrVZ+73PvX1a7pqn3u9L5ICKBr/YL7hb5SHVTn8T22Fh9jYJ+7
 WMKVRAy0oBFkALGwId8jezboqvREHNkM+eG3GnZo0RuVAHbZzpYrY/Un0Pb6YN7LnkgrzQLFnIM
 wlKStGLFLJzL0w/pCkAYBqaDPScQjgwzEdhBmyZZq/r0HPayoaRpnjSH1bwlstoLvk+PUHv5LaE
 y4RPuTe0XxmHB64YmZQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a265497 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4g8LxGlkCGxlFnDR7hAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6L9JjRm1CD5MCgHKfG10zqNWkuO3NVa8
X-Proofpoint-GUID: 6L9JjRm1CD5MCgHKfG10zqNWkuO3NVa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080048


On 6/3/2026 8:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The dynamic device's `platform_data` is initialized with a pointer to a short-lived stack variable, creating a persistent dangling pointer vulnerability.
> - [High] A devm allocation tied to the persistent core device causes a memory leak on every firmware reload.
> --
>
> commit 5c9139b17fe941a07d06bbded6b06a8c47d21867
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> media: iris: Add iris vpu bus support
>
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> associated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
>
> Introduce a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>> new file mode 100644
>> index 0000000000000..e3327b227332a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>> @@ -0,0 +1,61 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/iris_vpu_bus.h>
>> +#include <linux/of_device.h>
>> +#include <linux/slab.h>
>> +
>> +static int iris_vpu_bus_dma_configure(struct device *dev)
>> +{
>> +	const u32 *iommu_fid = (const u32 *)dev_get_platdata(dev);
> [Severity: High]
> Can this dereference a dangling pointer if the dma_configure callback executes
> asynchronously?
>
> The iommu_fid pointer is populated in iris_vpu_bus_create_device() directly
> from the caller's argument, which in iris_glymur_init_cb_devs() points to a
> local stack variable. If this callback runs later (e.g., deferred probing),
> it will read invalid stack memory.

These are sync calls, It won' t create dangling pointer de-reference.

>> +
>> +	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
>> +}
> [ ... ]
>> +struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
>> +					  u64 dma_mask, const u32 *iommu_fid)
>> +{
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev = kzalloc_obj(*dev);
>> +	if (!dev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	dev->release = iris_vpu_bus_release_device;
>> +	dev->bus = &iris_vpu_bus_type;
>> +	dev->parent = parent_device;
>> +	dev->coherent_dma_mask = dma_mask;
>> +	dev->dma_mask = &dev->coherent_dma_mask;
>> +	dev->platform_data = (void *)iommu_fid;
> [Severity: High]
> Does this code store a dangling pointer if the caller passes a stack variable?
>
> The caller iris_glymur_init_cb_devs() passes the address of a local stack
> variable (fw_fid) for iommu_fid:
>
> iris_glymur_init_cb_devs() {
>     ...
>     const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
>     ...
>     dev = iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
>     ...
> }
>
> Because the device structure outlives the caller's stack frame,
> dev->platform_data becomes a dangling pointer immediately after
> iris_glymur_init_cb_devs() returns. Should the value be copied into the
> device structure instead of storing the pointer?

These are sync calls, It won' t create dangling pointer de-reference.
After iris_glymur_init_cb_devs call, driver is not using the dev->platform_data
anywhere else. Making it to global variable is not required because of one time
usage.

>> +	dev_set_name(dev, "%s", name);
>> +
>> +	ret = device_register(dev);
>> +	if (ret) {
>> +		put_device(dev);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return dev;
>> +}
> Also, regarding an issue newly introduced in this series by commit
> 85711dbb43a8 ("media: iris: Enable Secure PAS support with IOMMU managed by Linux"):
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> index 1a476146d7580..8bdc9273036ce 100644
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> [ ... ]
>> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>>  		return -EINVAL;
>>  
>> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>>  	if (ret)
>>  		return ret;
>>  
>>  	mem_phys = res.start;
>>  	res_size = resource_size(&res);
>>  
>> -	ret = request_firmware(&firmware, fw_name, dev);
>> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
> [Severity: High]
> Does this devm_ allocation cause a memory leak on every firmware reload?
>
> On platforms that do not use a dedicated firmware context bank device
> (where core->fw_dev is NULL), fw_dev falls back to the long-lived core->dev.
>
> Because firmware loading can be repeatedly triggered upon firmware crashes
> (via iris_sys_error_handler()), these devm_ allocations accumulate
> indefinitely on core->dev's devres list without being explicitly freed
> in iris_fw_unload() or iris_core_deinit().
>
> Will repeated firmware reloads eventually exhaust system memory?

If the dedicated firmware device is not there, will check and skip the repeated
allocations.

