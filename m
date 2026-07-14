Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080B81F192E
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036953; cv=none; b=EK51r/D0haUrIsoZ6L8WIN+n8DMfw9fAFntBan5khROkJP9xvzZR9Uy3LTTeuiBH9V65Hqkb8wFfbS/lOJk+Cual2nfh2hWSO5LWDealXpS++IH7Wp+SCbhVHghkfHTxiQafXlitJUfnwoPXYTirrG8TYAN5H2KSyhk5EqTsMhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036953; c=relaxed/simple;
	bh=SClfuac9ud29KuSYJXQWNmV3qEKxt55agw1QUKxry4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYffaRtABrvxdSDb2ZnIXBdbC3oio4QEwJGtBapknmpiujZ/j6pOLAoA7UHhaQnhz/O2ur0yyDGalKGBe1pEtuZ20oO72kCtzOg+dnY112WO2lWXsiYhXGhaEckygd+JqcavG1swmk/sCs38FRTkc1zyTRw3fNG0xzp3ShphIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9Sf7JRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bvg3oZ8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9Sf7JRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bvg3oZ8G"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBodKi263204
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Zb4BwnO9hBkM13ut4Dwv+PbiVMGnlurvOuDF7WQ+k4=; b=m9Sf7JRGshn4edY6
	lHUhOJOVk6HwqwDHCLCJRLlbkiNMJajnrLITC9Onpi4dWXhgYHriPkp7yGfvnv7P
	y1Q0UxzO9zUyRK6tmMMkXP8Pl8hT6RWgkCBUmbYVwQTUdTDG4RInKd8KRYPSe5XW
	HiCtmzeTbSSm1Los5a7I2xv2/YfguocNgPG7YR89QZfe8R/n2GxRFTdBl92Tev5J
	EAW6Ix8b0YDCGWHZcidSng1VI9Lr/xmIVsxfbvdUbHEorwbVyOJhSZwzNr+wUev5
	G8EfEGdnQWjDzhQJuvWIjdrgICADWB2sJovKBzYFiRoEguSYme3AmyvPTaZQSWYJ
	SOwHCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk0gau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:49:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso11173675a12.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784036950; x=1784641750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Zb4BwnO9hBkM13ut4Dwv+PbiVMGnlurvOuDF7WQ+k4=;
        b=Bvg3oZ8GNBL7rYw7GXBSabjeoOhsXazzfFpjSf1ll2Eas+NO2jGR+LU9ZtuOVezwmU
         OacqKMpqyAi1/HLa0vfHYkqX8BckmjYnOIk2hGoAGGXhpNRtDt9DSa3FuXQeqxyxSTUa
         snu+a5WEiPjEdJM7OjsJxs/SE+wMSt092nc0k79LhwcCyRED6f26DEdPsNrZWSqpIj4o
         AWASKDYkEG4EfsQRnII6xix05fYB2SvMUBg+qlW8nO9F1Tsrufhh2pePFsk9HSPFqTby
         dSjjxxYxF90yuwOmxNOCrZI+XZbUDGl8tIGoyy6YZ/TqmDCL3qTaFns5Q/fv5bJ4Ff3A
         Q56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036950; x=1784641750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Zb4BwnO9hBkM13ut4Dwv+PbiVMGnlurvOuDF7WQ+k4=;
        b=dpU9hnxVW2GdjzxSYu7svVcAYNRKW85/WCiX6lUfqz4450SOURrHAZmuFxOxMTVz2J
         duZDgACnrv4Q0JFBtLewy7ddLW+RpJ8uQzUnpKX53f2O072upniW7YDDUns+btlHfjNm
         jvuxwfU5NwWoRc80187xks5S3MPVC7uteAnJy736YLXLhX6ja23OOV2ycmt3iFTCb4Ck
         jZW2MN6DgJfucGl95QsbMUuuzxzH3uqSNXcMBuvHaeiknkCNQrC1aB1xtjcuhstsBDQL
         YvJa+gvTmmheavKedtY9H4kLy9QGws1cqpMVDOAUfO0m3IYvUwSpvlOmF09MY0AZAjjt
         d8zA==
X-Gm-Message-State: AOJu0YwJLXwaRODKtEiBBfcn7eVeiXhtshFvg9QMCy6RdXU5QCfbjQ+X
	arbIL6CdgQHjTCgu+mktCElfq5JFmNorWpNyH3FYc6YDo7I+riVtsBms2HgTTpog7PA8E6oZPNG
	BZSa4Oj4S1knKxrIHJxrc4SBKNANUWnwVv8x28qJTR+oUmRmJWk25KGhGPZ84My83
X-Gm-Gg: AfdE7cmxTaAzlDplIIAxACxn6l3MMy/shVmo9ZOAS/m5sK8aF8KgKEOkjMfuYmjoQCb
	SKb6IGA80jL7ot/JXHLYkzKUsx4Ek6dK3WPwU+Ew/CSLDssh68BL2CiL7Nfr214C0WRWxni70lC
	Mbk/ZWGtS1ZZuiFFMyMoRWxKdWCyEePnyLzP5/KzKAn9WJQMHft5AS5I4K47IBWkaWSFnoklFC3
	SXzxPMzwyJyvHLhdcGYNkUPmv+ht9lbY4WGqFHQn37pqrxvXnljXH0SboLAGVz57Ac14zVxWy1F
	ozAELD1+7zu2W0/71V+Uv+LRRdwtsr36Hu+TjIFnKO2hXOKpqWc0XHdM7NLPSed1MswbcRUs+Zj
	Y0mhuGex4DvmSXKyK9nVBLyRboj+1+KZf9QnUVr9zb3s=
X-Received: by 2002:a05:6a21:9f17:b0:3bf:6c08:fb9a with SMTP id adf61e73a8af0-3c110a1e166mr16324515637.60.1784036950525;
        Tue, 14 Jul 2026 06:49:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f17:b0:3bf:6c08:fb9a with SMTP id adf61e73a8af0-3c110a1e166mr16324489637.60.1784036950055;
        Tue, 14 Jul 2026 06:49:10 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm48909158eec.28.2026.07.14.06.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:49:09 -0700 (PDT)
Message-ID: <6c060ba3-7d98-4699-8203-435264097482@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:19:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/11] media: iris: Add helper to create a context
 bank device
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-3-72bb62cb2dfd@oss.qualcomm.com>
 <20260709131006.A21C51F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709131006.A21C51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eLm8aTd6caG_sieD6OeoSLLqK8JsVd6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0NCBTYWx0ZWRfX7/IL8xppps1i
 G8qbb51Sp5HsqwDxX3mN5vFxasxgcxNjqM1SiO4iB1nuXIxGdoUE5uM2D16uZjqUUiFAeHLzid2
 e0XQN1J5G23REnKJwBi6/tLm4gOjy3zlBcDt47866OKHaI1CLezSbhDRhnp6CplJjkBa/TlYcH0
 YjIoXkUgcls1Kei4fOf4R+mqHZkPRwJjXcrQhMr2tmGmMS9LFnhbFjExL5RgcrpfDMfNMRUeGxT
 TAx2tBC82rRjrEyE9W0c7yQ31Nxh5/bxRvYVtJq1nYcSC81aOKkcyJdRUtrXQcGJe3wzO0pJ7JH
 B7AQVSxHRucxz7p11gacVJfMzT2HY1lRIfFP4yDk9+a32UaSvsejk+8ddl+6sRvHYDvsXZZBRPe
 ebjsQlKyYdflkq/6fecpcZKEl0UmTtgbGIu4nOI/KbHDZZZ1nan40QFiSWP5vXbVgay/VZAG2zx
 dOhzN9fwzZ5KvWB3CDA==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a563e57 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NdL5NlN59Xxin2KEPb8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: eLm8aTd6caG_sieD6OeoSLLqK8JsVd6G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0NCBTYWx0ZWRfX2g6Ml5yTnWRW
 n+U8AaLu1oZkYq7FIBcKpGVLsuIHqMP3U14v2+u16CwWRXsM9iEV8UPHQMWi4xdF2Es1mQw4h5C
 A/ALO9xwUeBbcAhfn+jbeth+bnco3H4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140144



On 7/9/2026 6:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The context bank platform device is registered with a hardcoded instance ID of 0 instead of `PLATFORM_DEVID_AUTO`, causing sysfs naming collisions and probe failures when multiple instances of the Iris core are present.
> --
> 
> --- Patch [3]: [RFC PATCH 03/11] media: iris: Add helper to create a context bank device ---
> commit d34d83e19b25d09de0876c75096c26d30aa90223
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> media: iris: Add helper to create a context bank device
> 
> This commit adds a helper function to register a subnode from the device
> tree as a separate platform device, allowing it to have its own IOMMU
> context bank.
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> 
> [ ... ]
> 
>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
>> +{
>> +	struct platform_device_info plat_dev_info = {};
>> +	struct device_node *child_of_node;
>> +	struct platform_device *pdev;
>> +
>> +	child_of_node = of_get_child_by_name(core->dev->of_node, name);
>> +	if (!child_of_node)
>> +		return NULL;
>> +
>> +	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
>> +	plat_dev_info.fwnode = &child_of_node->fwnode;
>> +	plat_dev_info.name = child_of_node->name;
>> +	plat_dev_info.parent = core->dev;
>> +
>> +	pdev = platform_device_register_full(&plat_dev_info);
> 
> [Severity: Medium]
> Does this code risk a sysfs naming collision if multiple Iris instances are
> present?
> 
> Since plat_dev_info is zero-initialized, the device id defaults to 0 instead
> of PLATFORM_DEVID_AUTO. If the SoC device tree specifies multiple Iris cores,
> won't the second instance fail to register its context bank device due to a
> sysfs naming collision in /sys/bus/platform/devices/ (for example, trying
> to register a device named 'pixel.0' twice)?

Ack

> 
>> +	of_node_put(child_of_node);
>> +	if (IS_ERR(pdev))
>> +		return ERR_CAST(pdev);
>> +
>> +	return &pdev->dev;
>> +}
> 

