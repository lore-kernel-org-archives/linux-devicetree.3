Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247F4F3EA0
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616349; cv=none; b=tql/vVXaTUTkMi/REd49qzrJ7cXN/fjKlImb6SAnt3l3F5osZhiuqdJoty1+mPwxwT+ud9eI67jiTR8YB2PKrAxlkE4Y7LBIPRQQIsPkMUZxnoT8v3IZlk65moHqG7bFPcqjoIyMYJGUqq6T2mlC7Q/e0mWAE6j7Hy+RtssL08s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616349; c=relaxed/simple;
	bh=1gRmMOSALOO8kWr+qFYo+vdYVpTz5xADVyG/bR77ZKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqKU9fNFxC043Ep5pjGURqiZrAOUAJ8v0x/XLRnMR+FzW4GTFoEmXceZCLlevJfj6LijdJ7ZYTX39KNNSxYx5lCQv4sI0MWdxLs2crhVqilThQIYzXycvP2rBqQqzSdVpZrncD5FLDgW3yMnBmUmfL3A1y69ofd3nhse5EFwgdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKxPE1KH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWa7eD32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKxPE1KH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWa7eD32"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe6sj1647296
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrlqumGM5X03kg0nz3nd0uynpjwzXPZ61drZE/UEkGI=; b=aKxPE1KHGDzK5rDa
	yfNLgL9PuOvv1V4ilVktiJtonWFzqVNM/KMd/TY+xCXb8PZysfUBirC5tm9K44yc
	XE5Rw125PK0r4Pce/0hJKZh6tx10AEaV9wVk15WzMiIC0DF+44FhofmCdS/qGfJC
	uqIpmAaciv3E//3eXZxpiKpp1bkas+95XtM9u8X1AqK3l4hBRYsjDATABp7mhDDl
	JxKcWpfL50EFRBy935GsTVOMqbFgoh3mLrZARTNe5vE396zCGmlRehznm9OC66Qg
	XoQSUBxlZ/f3dShKRQ7J6iPPrRAJ6evATMcSl222+jq8lA9YIbKBfQc/MGUgo8g6
	8avuEQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc1xmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:25:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so4709021a91.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790616345; x=1791221145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrlqumGM5X03kg0nz3nd0uynpjwzXPZ61drZE/UEkGI=;
        b=YWa7eD32SLsS2FBUEtLD5Ufc25cnDG8bmIlcZbDVCxcljcJtSOeXUUWJ28k793FJqw
         95xnAWefVW8TO7UhzRobPiZnl7ghVLio1BrkQlzu/6sqEC2WbUjNh0Y8pBMsDQjjsxYb
         ZJ5NLhChNg+deQwhBsBJrGFBCzgYvP/HvZtldpMXNmltQpqdEQz7qB7Q9BjiML87cyeM
         5J+4jVIn66FJvSRm0nOkN5R/wV1rDw4fRCGSb1k66mjOXyFBRSQ4qGiOSAkR+xzBRoSt
         s6K4YrqDIywWh+gt4Yx5GFBx5uemSP3kL25hFiXq/AOBphg4dWplZwaUqbkgjQbXqjuf
         w3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616345; x=1791221145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrlqumGM5X03kg0nz3nd0uynpjwzXPZ61drZE/UEkGI=;
        b=mnSrexJm+xyTd/6TwCufsoZADMTNXCEl0LMuLHXUaM+WXVX89P5NbBkJ4rjQMm7uBj
         VeOh+A+9GUFviW4yQgslGBCP+zXC/ikNM9tbIG4nFc8vZI14v9nPIVieYcu8n15j65ee
         /xoLf59HLCdzjomkRjd+J3PRMjrcE5i5kUFF4waBXzOobhourARbnDrpvvVLWJ+oc0yR
         8i0PJqDtIL+GXPpCNfyWtVdSboTb/NoIlriX//Z+qdA2b2yqrDkvCl35oK3Wp83M0vNu
         QcZW0nxB5YkTzvYUTFR0Ofw5LgL+E1HD1Zj+16uRPut9oSXuPVONUhOaBmx0qXGC2Mfw
         rWLQ==
X-Gm-Message-State: AFq9FYJk5FJDa6YHKPFP+KxBIL5ZWBIdNxOCwZ+DUDiIbnoBlgmaPH0p
	20JzUwMa4VH6Fc0KSZc/jmE740ffYBXXGrD9BNvKvtTnTU8KpyQU5MlY1Cv6m+W9wpUieOfeEg7
	d+F5qUO1cWwKq8RzrqoMUqjr1kL1+x7rf1Qr0UJS9jnB76pUxZQuQh1tuphJQhJCM
X-Gm-Gg: AYBFou1jM319fHB47+fVeyQFz8ZN1gQX1CQB7fQlpNRQDFh9ijNXOOJX8tbC5to4cNE
	9KSNUYy9GgxqspnujjIUgJ5roYUEY72aIhE0zoXdN7OZZC779QM3McQpY2kSYeI9wSdODRSkzG/
	NG5M7YuuheBIfBFtuf95gtqXJPynV6Engr3wBkV940j15/A33QbM8kC0McKx77fLNqLxUgJSATJ
	VKap8AOvbJ2gj05OxCib2xbsKZoUgTC7Jm+2O/pSqG161D8zqbbwsC+L2rQsqLjcvJ/ur2KbQN3
	MHIpE3iuerHG7qSvh0Y/QD1V0UesTV3aIpbUGo1mhjpoGBIHTnZaQMhteNLV5RUopsfLAYjPc9n
	Iu2/KiMhj3+kHh2Jmytl4okIK6N6okfLwGA==
X-Received: by 2002:a17:90a:c887:b0:3a0:d5a9:d15 with SMTP id 98e67ed59e1d1-3a0d5a90e32mr7092876a91.57.1790616345211;
        Mon, 28 Sep 2026 10:25:45 -0700 (PDT)
X-Received: by 2002:a17:90a:c887:b0:3a0:d5a9:d15 with SMTP id 98e67ed59e1d1-3a0d5a90e32mr7092849a91.57.1790616344471;
        Mon, 28 Sep 2026 10:25:44 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.235.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986ee2f7sm482725a91.16.2026.09.28.10.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:25:44 -0700 (PDT)
Message-ID: <18a5d9c1-1ef9-4dea-8ff1-78d298a6465f@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 22:55:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: sashiko-reviews@lists.linux.dev, Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-2-b24e2348e8e1@oss.qualcomm.com>
 <20260928062639.3753D1F00899@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260928062639.3753D1F00899@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6abaa31a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=0iu8UVjuSkuIMUlAYuuJCw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BXv5m9y5FIUjoEO0wCUA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MxD9VzVeWwGm9BMQN8jTowVye0oUFfl-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX3yRdIY35Z5gf
 ewjmweczsf03veix2t3LyvjwXjP25Eoan3S7R9Scw2U92H5KQUAt4xJLlxGlDS0aEI44/rYTzU6
 X5lEB7xR6S5wHNcGXvYkv2SrtQuhambGnC4F5WNHp+OU/oiZBuFrki5i4QDVfLf2bDzO978oJGK
 0P3D7vzMURAdfPrFLhNaaUx4YI1QaJUOmeJDzeeNn+rTr1GEHJxGPmPKVNIVIRWJoBzXhD656jW
 OnZCl9n0vs6/jK52S1v719AMy6SR6xJ9hdhz7AB8LJIK3PQZObwnF+GDhnNkhL8wAKiPx1I2XT5
 ItoOfIufpnSCCvunks5R9+c5Po5wCoN3B6CYVlV14zIuO0m6BebPVBMjR7hSXdqeC4nl4774vnM
 LXyKepw7uJeSBOdSPe+rC37tuukge8IZ+85HaGaPw6P698GB6Tj0Hs+9elACuF8YEo1b7N8VPjF
 56oWQcIa4peiXCbbHdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX+s7eOYvCYzOY
 xBx4691fJuNf5q7MzC9dWmCBEoZGS+9JB3Hsdu+8kMPsNMmfo17Uk3Qd3Elw3wiJgFl7kiWlU0X
 o/699YK6HbSoSE937mS6zNGi6Qbt+G0=
X-Proofpoint-ORIG-GUID: MxD9VzVeWwGm9BMQN8jTowVye0oUFfl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280069



On 9/28/2026 11:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] power: reset: reboot-mode: duplicate sysfs entries for predefined modes
> --
> 
> commit 613bc6d4edd9d0928986367eb5de6c3fc84d4d4e
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> power: reset: reboot-mode: Add support for predefined reboot modes
>      
> reboot-mode based drivers can define a reboot-mode by adding it under
> the reboot-mode node in device tree. This limits such drivers, to define
> any predefined reboot-modes statically within the driver and creates a
> dependency on device-tree.
> 
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 328fa37598df3..fd61de2263836 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
> [ ... ]
>> @@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>>   	return 0;
>>   
>>   error:
>> -	reboot_mode_release_list(priv);
>> +	reboot_mode_release_list(&priv->head);
>>   	kfree(priv);
>>   	return ret;
>>   }
>>   
>> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot)
>> +{
>> +	const struct reboot_mode_entry *modes = reboot->predefined_modes;
>> +	struct mode_info *info;
>> +	size_t i;
>> +
>> +	if (!modes)
>> +		return 0;
>> +
>> +	for (i = 0; i < reboot->predefined_mode_count; i++) {
>> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
>> +			return -EINVAL;
>> +
>> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
>> +			return -EINVAL;
>> +
>> +		info = reboot_mode_create_info(reboot->dev, modes[i].name,
>> +					       modes[i].magic, modes[i].count);
>> +		if (IS_ERR(info))
>> +			return PTR_ERR(info);
>> +
>> +		list_add_tail(&info->list, &reboot->head);
> 
> [Severity: Medium]
> If a predefined mode shares a name with a device tree mode, does this
> unconditionally add it to reboot->head, resulting in a duplicate entry?
> 
> Since reboot_mode_create_device() directly iterates over reboot->head and
> copies these modes into priv->head:
> 
> reboot_mode_create_device() {
>      ...
>      list_for_each_entry(info, &reboot->head, list) {
>          ...
>          sysfs_info->mode = kstrdup_const(info->mode, GFP_KERNEL);
>          ...
>          list_add_tail(&sysfs_info->list, &priv->head);
>      }
> }
> 
> Will this cause the reboot_modes sysfs attribute to emit duplicate string
> values (e.g., 'normal normal') to userspace?

This is documented in header while adding pre-defined modes.
Should a developer/SOC vendor take care of this instead of making this 
code complex?
Will wait for more reviews on this.

thanks,
Shivendra
