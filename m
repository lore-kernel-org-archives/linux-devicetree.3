Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0E35DA79
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127498; cv=none; b=a/G4tXzWGTgb1p5AQItfU01DqifiisypFW11krsKvl+zSjeAnuAhPgzD4pMhLHWHXcr57q3sS2ahkaX/8MoNOgZgbxsod2VdNcW7a6Sj4SKtBqIfl+1nwHi0dx1FXnElPBEST3FJs4AZrM0TlQCw8nSM6SpsV57pO/v/TsrSYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127498; c=relaxed/simple;
	bh=DJu0fphhdGpqRNcFSpC8ecp1oPEeAn4fhmmryomrNrI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sVEFu9eRbA8flBewAlDqsICCbtSgeZ+TSB0OVDPTTFYfhRprdtWx8uulj/S+wu25e2k+BfLAus1lmzo9S5znh1jAEMlyU/m9T9gcxerdvl/A7ANS7D6bx20H3lYlTaDj5jAfSDXtbOBqQ32PozqG5Hkmy7m9S/c+I7nQmJajqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbHpb2Zn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKQ8Mtmy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbHpb2Zn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKQ8Mtmy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fnex2571943
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bqSX1rauS7IdDiUq8LgE6Re8JbPIik/s914JJLeAfs=; b=gbHpb2ZnMI0XMyxL
	joue6o0m7Cv2LS83sx7nwmwOIWhCRkE4Btx6g0SCW/0kKR0LbDl0z5iHW0FMJuPq
	wltT/PfBFQxgoX+Pf9ZgxBB94PVm2+dXNkUSyMVd+JvGyzV17ih9XRSazbn2qUZ0
	qLKq8YbcCtI2rdYq5UUSrdwJ3e26uNvejOGqBo8qDp4MO9jvDGFaUWVSmx5daGSR
	vSJX75NaXwCLORZ1+XnVSmciiBSHoYHIKlHex1ewGkOu+pNjcd8Iy2ZGLk+VxRMa
	Kh/NzB863YpNRSxO82WpVXKUiNqTLvDlF9fbhTKrGuP3efhmhUrF2nb7eHV83Msn
	41zS9w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3scjvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:44:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3560628a12.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127496; x=1785732296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2bqSX1rauS7IdDiUq8LgE6Re8JbPIik/s914JJLeAfs=;
        b=CKQ8Mtmyp91KlG2jaCNSOSwV4mRsXyip5q+uDl2lNCHs2cbrRtEzUy0qLlxoQIduM8
         c4YkxmjIkpLMmgLfy/Gh8sdh+YE5knK2pMKxAZrhIfGETK7JCwZ5WlV5VRlYJiOvYffg
         YAOw7NMdrxfuexUR1QwdyGnhEhYTqV1IiUZiNmfW8iCLWVLDMWtOTamikRYXviXSEewP
         6S3HNnlGyL4G3gSg0egHbJ9/tEAaNfEoL/YNhd2DztcPkI/tQUIHVm0uyCsRHGbP/DIU
         0wb37oUbYC3jPzTkR5SdHaiuDsquNn/QcG7GAcYWjHMeFdSZVO6ZNRfP0vQQOAM96eYU
         fRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127496; x=1785732296;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bqSX1rauS7IdDiUq8LgE6Re8JbPIik/s914JJLeAfs=;
        b=ZudEJ6/zH6LM7QTZ4Dlk8H0UmaE55/jHifF5OWnlQpuQxVCckz4NFnJbyjo69PFe1C
         5TB+RslgepEPVR2gDleGsgF805TSc2iVOV8NBCxjyCRgK5nZx3bmN09Hkz+tbz+q9toy
         +sOljpborYd0/dkgDTU2gsiTjeBbhPMtQwpn8bws+TYkqrasJZrWKhIKLJ3PsEH4JyGD
         YtZgvYuWH/8iZtytb+wUPETBCu/GpiPTq2UD3MPL2RYvoxA0Fr2n8k9+sMpehaFl0T8N
         zn++lKqcaQSlYxIcgeJfUPAlXmDaCuz4oOFAX4VXqqo6/B+38yB3pDk4XbTGkAADohxt
         2ZCg==
X-Gm-Message-State: AOJu0Ywx4QZxB9SKDCedlyNhTy6R2TQcjrZiq5eADJj60oWtBNf6FQ1h
	hhcxK1oH7qu/kIYeY53nordc/Cg60xgBxutvj3zf7TtAdq1Cs/t7L98Lt/OSk9fhTVX2Ifnndux
	x0JYVCbooZtPZQ3oOIWz+XFGVEMh19dr+FhGO8R3sy6byoxx87gbW47TxcS+cQlgd
X-Gm-Gg: AR+sD10XzUB6sRlS00VKT2dmkRBM2wb5Js/7wFFSnpPdF/cl2OYw7nOVdZMn2d/DJnr
	J3buhjTS7R9Z2mdd2DAy3mYgzKBiCAkievQrLNmhS/lsDVaOrweVnbFHD4pEvb+rx8W+c53eclt
	DU9UQQEATKxmJRJ65DIBiP9OT1CZCwZcPzprxOtFX/zoPxGGUUHxxo5upLZdeGBQi2LwLivInZy
	4KNHEMhl/tDa/KtdaPg/4wUgloF0HvF3iV81+E4zNGx780z0mR74CiHf2iDz+gG3xWv84Az4i9b
	4UttUboJuyLuEIzvFwpogpNdj+PbVjpFQcqIKlKN+H7srp4rHo+q5F4RFUdZsf5TYcwJFi5WG4J
	qknz5Vzw6XS1ZUIlXCSJ4iRAnynm43Wi7
X-Received: by 2002:a05:6a21:4584:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3c67dd6a0a1mr5354585637.30.1785127496304;
        Sun, 26 Jul 2026 21:44:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:4584:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3c67dd6a0a1mr5354575637.30.1785127495877;
        Sun, 26 Jul 2026 21:44:55 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm78908471c88.15.2026.07.26.21.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:44:55 -0700 (PDT)
Message-ID: <3cbd26d2-fb86-19d2-2104-c10fafe91080@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:14:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 03/14] media: iris: Add helper to create a context
 bank device
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org,
        conor+dt@kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-3-de451559e88b@oss.qualcomm.com>
 <20260726060308.649101F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060308.649101F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX50hnjAa4BtBK
 ArBlanQa5djFI9CEyWMBNcEosK87/w8wJ89STssusSaeJWWEg/H4D4wMEOySk6O8g4/zZPa9PfD
 ODIi7sX1Ut3FrS6rysS9ZL/NVVABWjrNzmjmAPWnausDJNGLf0YlQbKGQ8162FdmpQ7jfT4DkET
 JKf0DrA/v9UgXsMzCjLuGJGh5HkaZePDccC7TqHInMcj59Zu8HP50M59ffAOGCNOU5eaxykgOqJ
 YnmOsez+FiY7mcSyp2tKfSKi0G5gt2hXRapRzyj6+M1rpkifQKlDErDl/AtmS7bNiCqTvU/cuu8
 yx210BxYnev2X245usSdhfSovtMGowa6jnLBJ/H5O5hAVFM5aq7kSn4mfobNQE41x59pbEb4y6+
 0rXRzZ3rpzxDp6KTvvtQfuvTDKskmSfi8ZzAqU0KuGYPCxULn1eQ98odz7fwH66Yv8nlr5SOhW8
 DhmXxlsXceBhAFPnQMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX+LS3UK0+9K9R
 nvNwMYA2vu8+ONiOSA44yxlHuvcILzeNM0eosc7g4MIFb5l1FyqZkj7f5WwLsdaORD1bic0+3Qd
 4jPqclN+uCczNtr2u3iYnp0uu3cr6Ec=
X-Proofpoint-ORIG-GUID: 12R5S4VSA1utdNbMulUWY-UJOSLFyjMl
X-Proofpoint-GUID: 12R5S4VSA1utdNbMulUWY-UJOSLFyjMl
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a66e248 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qCBZZcZFAZ3g1NYsHNkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:33 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The newly created context bank device is never attached to an IOMMU domain because `of_dma_configure()` is not called.
> --
>
> --- Patch [3]: [PATCH v10 03/14] media: iris: Add helper to create a context bank device ---
> commit 461ae3ede65da976a81591c71089c7621d163869
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> media: iris: Add helper to create a context bank device
>     
> This commit adds a helper function to create a context bank device for the
> iris driver. The subnode in the device tree is registered as a separate
> device so that it gets its own IOMMU context for mapping pixel/non-pixel
> buffers.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> index 773f6548370a2..a685915a19e9b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> [ ... ]
>
>> @@ -141,3 +142,30 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>>  
>>  	return 0;
>>  }
> [ ... ]
>
>> +	pdev = platform_device_register_full(&plat_dev_info);
>> +	of_node_put(child_of_node);
>> +	if (IS_ERR(pdev))
>> +		return ERR_CAST(pdev);
>> +
>> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>> +	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
>> +
>> +	return &pdev->dev;
>> +}
> [Severity: High]
> Since this subnode device won't be probed by a driver (due to lacking a
> compatible string), it won't go through the device driver core's
> really_probe() which would automatically call platform_dma_configure().
>
> Will this newly created context bank device fail to attach to an IOMMU domain
> without an explicit call to of_dma_configure() here? If it isn't attached,
> could subsequent dma_map_* calls using this device bypass the IOMMU or fail?

This is not true, please refer the other path

device_add() (called by platform_device_add(), which
platform_device_register_full() invokes) unconditionally calls
bus_notify(dev, BUS_NOTIFY_ADD_DEVICE) in core.c. For any device on a
bus in iommu_buses[] (platform bus included), that fires
iommu_bus_notifier() → iommu_probe_device() → __iommu_probe_device() →
iommu_init_device(), all at device-registration time, independent of any
driver binding. And iommu_init_device() explicitly handles exactly this case
dev->bus->dma_configure(dev);

