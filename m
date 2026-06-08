Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C5D365A14
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897275; cv=none; b=RINihhZVmg70wTEj4gyhau/47vp2zq5gHIjmMllTeFpD31w+/xHOkmz+5EBoIaHavl32C4dXM1kAP5OYeabPRikJMYBqLH/P2M8K1mKPkvJiwGS6jEq1mW10gX1paQWuMcia3d2T7R720o2IbhDQhyqSIq4N+pmbxvBRaWb+/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897275; c=relaxed/simple;
	bh=FJZJQj2R0WY4ADQJTBzk96MDj+UUFqh5UCbQFgrXHOM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TldbyvVLIpnlqpounCMwkLA83AwQRTQ5Xd9z6nRfW5odOK6pip0J7PkQkqBDuS2A0/6/zUObXxjY6+A9ok91N6BuXTI6UrM3k9cW4u1PGP7NXrYVZL2wnnOfQgaLNE3R2d4yxfDKhncvoJHddob55RlV73ewcriRnbNd1bI6mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYgtH6H5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iui3Mqmo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYgtH6H5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iui3Mqmo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GlAD1933588
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=; b=TYgtH6H5gIPyGS4c
	rT7mKiV0p6JI9OzJc8XvjpsvsTHKrQiqWdiTmqqygYfUJfJ2oJIq56SREB4BfX78
	vObtqXvSDbkx965dckH3qLF4u9mFnhCp4OLVNaM+P6gKLBeDnw7QLfetVJ5j/h6L
	ct/zM0kGTlXwxPumXiZSdg9kWLZgMZ87ckR5/bLMj7togwVQlHxSsCCb2Iqc05fr
	MmQ/dQG5li4LXwUMOjvlAChNqTG7yRn7e/apt8FPn/WRizspf/JQBmOUHfVNzydn
	l/nVobsFc+OHujhRtWEGKxN9i/4cREMambXEOYwdSP5jxXDNAgH1XOsUR3/eQTp5
	ZPQrAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6546-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:41:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32259e0eso53346385ad.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897271; x=1781502071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=;
        b=Iui3Mqmo4/NaMjNp+De7lrVgFieS4gWeauc7DjeiT7mh3qDYiIKVbCt2uJ+4jvpMFc
         gZOHIG6srX1Hv95UolV7YZac45/CcMcQo2qSkIOvF+3WunoSK03kUcQJ8hVmloNRymDN
         9h1DZ0BPWxlotG2/MaaYGwQu87LOKCNnfsfxe/QEEs4eL8yrR6OBTWTWl5abP9z7mANy
         7fMek5BmDNFOxv34y33DYKFFDT8JoDI8LWhg4v+rWzl0GKc1pjklq1huVvj18RRW78eY
         ZIqGaumHu4L4a404C/sXM13HGTrqBaqviSJ47qH0H/NIqJifRTZvGaWkypBQkfTrqR9L
         0w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897271; x=1781502071;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=;
        b=tSVFqkSvph2L+x2FSbdNjI/BakrfPJnhkClqkXOAeePnUIpxMJ5JYJeN3yFEO1SBuU
         1UL2SocmdCae/kp3XaAUySZaaF3AKYmRQjPsjokAJ1dSs/0+jYpv7peHaevwwYpYK7Yh
         WJ/qS6S/rg1bWJQt02rAgSx/+iE/axzRndyTK/l7wxkk09k/7ySsFI0GSsKFaiou46Yl
         1naaqkHDqPs4mIRsD5GmvqJnN89UiNi3QWuKe4xB1VelnhJABZkrTaYd9kRbMpllcGsC
         KS0LIko4go70IgsJf1Mrhcw6eaIzeDJ7lI4hTJyCKQPX0Q5P1IGjN2XpB4Ea/nA5ir8b
         u6Xw==
X-Forwarded-Encrypted: i=1; AFNElJ+e78MVMMVByA+eL6qutBzzkXjA6QTcRYbikNpZJLOTclnNJoNV5yqii/S+n1PJsNZWxVPb/iWLmaBw@vger.kernel.org
X-Gm-Message-State: AOJu0YzfH9YIrvsEDl5+w2HKzqeF93o9oZ6VSsUtKcm2cxTHtilXyUvB
	njytEUOKiBYuqSRp+j16pWRyQoKqWxp7q5acyGdhJ+r/4ImRJbLA63Pnyu5lR1WpukEyRyZH+fK
	N87qVSpNRHwPfx6/J0tfszppbZxGrH9w23BhMxA+rMc+CvXMmi7pgf8A1XWpLOWBU
X-Gm-Gg: Acq92OFiQ9dTyU3QxxR3h+cQQ8Yvv3VNKw3ArZ+8OUOuxhNiYwbO+xJNmI1VwZBrLXi
	LMmRl/dpyj6offhfe6VWyO87XPBY+FTrLSmzLjzwRdohNH6nzzbFH/Y6OeYbQ58oqnVzg/mrnpN
	9dGcjhJRNaSm6Cq/qQuxVzb1+1ccADZEMljwAum3YMFU5i+JSWvTaR8Um39OWnvG6UJ2t0CrTTZ
	HzBkeiLA8bM53WOOvCXQb5MHt9Xtt4LQKshuntEi5hP7qyBL1v0C6VtzNwEvX8i43Lfi7JGTF8Y
	YCAsQ9rtYo7GfqF005KQZnbQvgIXHTFgjZgBocJU0DeP0elcXydFkJ4jXU6fmF8pMwsyOrdKWpy
	pMMopYfexcitWFJ9yZIpO+/4U5zrdcEA/gACmM7fuKZ6ZRXFLNvI676XgY1tEc2W5
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr173997455ad.1.1780897270683;
        Sun, 07 Jun 2026 22:41:10 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr173997065ad.1.1780897270201;
        Sun, 07 Jun 2026 22:41:10 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c249aeb62csm42888625ad.68.2026.06.07.22.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:41:09 -0700 (PDT)
Message-ID: <820d88f6-23a1-6371-b0ac-90b13c493ab3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:11:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 10/12] media: iris: Add platform data for glymur
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
 <20260603144621.5230C1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603144621.5230C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a2655f7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UNkTylL0TICJFbUdM8kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: R1VC0QB7xGoiWsVRYXqUKYANmteq834A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX9ulSBhsbcZm7
 LhCauge+nv9GRwToztJNb5+GVMPLiGvo5MJNdtlihLy2Kbv6tyOigCZYONy0lyTOhqZIWlEQ6UD
 Mq9FxeUROfTtEKpORG6x3jvTZ658heOUEQYzM+6++GsqcCwMxrHLdxB2Y9eTRUBCxpHgyEWm1pD
 gjmuKW1xp2jmqoJXQx0v49to1gYeP0fpWxa4Tqa0c0MrPSD+Vt+eJoUbEU0fx0Des4HSCWG2NC4
 m0Ds3GVQK/8yk2LIPL1MTBLivI7D+25BVTn8l7ZEdKTEwXubkvnbNv3bP+qIK5ii3MTLfuw75Yw
 tYU91bJukBXUjFKf5qwD9++wgueIwC5hGU/NPkRnhpMkpoNpLTYc2aso/oVN6xqOQfngjxjEnqp
 99KL+yl87iCjuYzsmm49lhc0nbfucoeHQ6AlMENOkFa1c0LtP0HbIEg9ANOgoRRCNelAr90esSY
 kYM5/SL/UzPyE6m3l6Q==
X-Proofpoint-GUID: R1VC0QB7xGoiWsVRYXqUKYANmteq834A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/3/2026 8:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] `iris_glymur_deinit_cb_devs()` unregisters and frees `core->fw_dev` but fails to set the pointer to `NULL`, leaving a dangling pointer in the `core` structure.
> - [High] The address of a local stack variable (`fw_fid`) is stored in a permanent device structure field (`dev->platform_data`), leading to a dangling pointer and Use-After-Free once the initialization function returns.
> - [High] Silent cancellation of IOMMU deferred probe leading to improper fallback.
> --
>
> commit 22223f505726fa5c0ee432b64a8712aa1e89468b
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Add platform data for glymur
>
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> new file mode 100644
>> index 0000000000000..c42ac99870ede
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> @@ -0,0 +1,106 @@
> [ ... ]
>
>> +int iris_glymur_init_cb_devs(struct iris_core *core)
>> +{
>> +	u64 dma_mask = core->iris_platform_data->dma_mask;
>> +	const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
>> +	struct device *dev;
>> +
>> +	dev = iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
> [Severity: High]
> Is it safe to pass the address of a local stack variable to device creation?
>
> Looking at iris_vpu_bus_create_device(), it assigns the passed pointer
> directly to dev->platform_data:
>
> iris_vpu_bus_create_device()
>     ...
>     dev->platform_data = (void *)iommu_fid;
>
> Since fw_fid is allocated on the stack in iris_glymur_init_cb_devs(),
> accessing dev->platform_data after this function returns might lead to a
> use-after-free.

These are sync calls, It won' t create dangling pointer de-reference.
Making it to global variable is not required because of one time usage.

>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	if (device_iommu_mapped(dev))
>> +		core->fw_dev = dev;
>> +	else
>> +		device_unregister(dev);
>> +
>> +	return 0;
> [Severity: High]
> Is it intentional to return success (0) here when the IOMMU mapping fails?

Yes, intentional. When Linux runs as KVM managed, the firmware device has a
stream ID mapped via the iommu-map property and the IOMMU mapping is handled
here. When a hypervisor (Gunyah/QHEE) is present, the iommu-map property is
absent and the IOMMU mapping is delegated to the hypervisor. So returning 0
in that case is also a success path, not an error.

> If device_iommu_mapped(dev) is false, the device is unregistered but the
> function still returns 0. Without an error being propagated, the firmware
> loading logic might incorrectly fall back to using core->dev instead of the
> required secure firmware domain. Could this lead to TrustZone load failures or
> IOMMU translation faults?
>
>> +}
>> +
>> +void iris_glymur_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->fw_dev)
>> +		device_unregister(core->fw_dev);
> [Severity: Critical]
> Could this unregistration leave a dangling pointer in core->fw_dev?
>
> Since core->fw_dev is not set to NULL after calling device_unregister(),
> subsequent initialization attempts might dereference the stale pointer. For
> example, if a later call to iris_glymur_init_cb_devs() fails to map the IOMMU
> and returns 0, core->fw_dev would remain unchanged. The core might then
> proceed to iris_fw_load() and pass the stale pointer to
> devm_qcom_scm_pas_context_alloc(), causing a use-after-free.

If context bank device creation fails, It will end up into error path and
won't reach the iris_fw_load(). And I don't think so that first time iommu
SID is mapped success and next time on-wards iommu SID failure case.

>> +}
