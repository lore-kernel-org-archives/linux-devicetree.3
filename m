Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA3381AF0
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349356; cv=none; b=qLh8Wz3Y14oS5mp3w3vBkMwrwNQjPuBXWvfs0Oka0BQdCF/Ts2Ze2uajrRdeuU9lKIx+pT0GViuyTVYuRrWt/uEolZTi2ILqSuBj84wUMF5jEMBhwM79MvXnazicvwOrUcEvLKx2xZbW3jJHw8UHrdScxVpKui7u2k3QXEP0Rm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349356; c=relaxed/simple;
	bh=VjskW2CVk9l5hp0F2usSDqUNFGNQnoo2P9nCFonM/vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioAdXBzpRsxenm4oySNM37DhUnYfLJbvVdzk4PGh5SPUcFoefUqQ5XaGPSyYSVqVyoOvYMdnAPae+rbSJRBmISbackpCQ5BbNgT7RVKbAjq976dBiO3opmdT7qBvCczq0OM1TC/tPqvnL8EzpgI4V67egrQnCKsx2gsTUb7uy5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6RoAEn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YR0MUEVC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6RoAEn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YR0MUEVC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDvTQ91194765
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0yvhpRtuRtZgzKPGSPCN5eaFbXftzDfoZHnEo8WAUDg=; b=M6RoAEn1vjyrMrIT
	o+4LNw1Jt6J9mgBNi7i5J2wpJrakIvicRASNvkL4elhiAGmv+euDFBeoh9YCZicg
	MMsHODShoV1S+1a0n5o7ku8yRB+TObLa2gY7hUT1qWT2rVoD1PCLfk8vh/7Y6bBB
	xIh/tSPi5V6HH2pZUP0Ev+ZvE+tCLGI0wTcjifNTEvh2UE5q/5Kg5gysfsaq9+OI
	uQbbev5YtZh9JSouW/IDugYEne8vLf2Nygp3FSdqy/2bHAW6pyZbjmTzlcmzOolk
	YsBOfexvCo/bZgzko2BzEaFLfLmMc68il8B1YQuAECfE0hyhWhI69vpAAMnKnUvk
	eGNqmA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874m09u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:15:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806756ea40so792702241.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349340; x=1790954140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yvhpRtuRtZgzKPGSPCN5eaFbXftzDfoZHnEo8WAUDg=;
        b=YR0MUEVClVwu3sSzPOK/DUmsvssusIj+br3T4+l0V7Qu2JplekMEKNkTEtkDZyfHzr
         ts758IxhNEJC2iSJO9uP1bJhzzS50EIgPNvM2zdf54MCLtPdCmEwGXATDds+I731s62i
         ke6zg5nAhIQFQdoxkv6X9eJZQqmdBxUnyO1ucfbhNRzzywHdrfGyZQnp/ETHaZsrXntc
         jYiSN7Q3h7Z41qafTVcXcsWrbyiHK6qiChrughI/msg+VEcmjBonW502lGGZvIbuazLD
         lRFadahcp6hJMkmy8d5/aqSV1uCMJEUwQrHQT4BzXMiv9XB6kqB202wNZcx65JoHBEH0
         /Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349340; x=1790954140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yvhpRtuRtZgzKPGSPCN5eaFbXftzDfoZHnEo8WAUDg=;
        b=yO3w8FuQTjh3N3lB7BcjZl3p3CsnUxMLKqxOITApRD23KWryP1lJEPpA2RH9Je4PeO
         TMurHHiZP6VxX6wYMQRNhviT0ape4BO7wBzZD34jqTOEZYQEb5MBuDAj21Uyjxd9WscS
         4kjhQpd951rDf59MDvr0zROBro4djwYWoReJJfflQo/R0yLNgXIqOY3mGMIv2fu3nW2x
         NtiUKY72iYePg1qg87xRXNmYj1OT5CTzmPfFPYsLYs2ugmK9c+6S3VHFuA9tXi1M4g3x
         Pa37nyYLT+wCUsErBjl+Rkk4bTIwkFWEEdow/4omL+s7iyb7IZLlUqj939rDiw7HrguC
         Gb7w==
X-Forwarded-Encrypted: i=1; AKwUvByz+L7uGq0lqGyhPt0nKQIusy0fKdPRhXOKIYPHWdCkdOQYOISEa2ZgpV9jk6gw7LOgS6iFwaljw5FO@vger.kernel.org
X-Gm-Message-State: AFuF++l6zL1cCuWK56OZ83pqN3Ydeae6/SWuie7EFW+H3wNl2DAOzlWA
	q38xqfQ79bWSSBSiw3GWqaiHgOagSF5/cm5J7HOED8Byht3nmiSopynOwm3NsQ9fWKL7TKgo/cf
	6gPG02obXiQqsVb6CvEPYd5I04k496D/iyqAiMGAFVTUzV65aetNphz4ZW4EjHLuL
X-Gm-Gg: AYBFou1YN1IkASQDl8w7NmXb3J3vcMft74a3d5y3Zfa7FI5mI5n5gI8ns8BoMRde0el
	n5BH/oriEdQ0oe/voSINJzAHVq25SkKUZJ9zq1WSZy/tW9hAbWo6HHj9RS/51e9Jepy6LcwsfEX
	SY6GTcQ8oT+YVdSeEx8vUOAnUVMPzAT+L0bvDC4AqOXV/SKVGfZKOVF/NteCaynY4+PT1CrUGxK
	SeLCLUN+o6UbgYtBEjS6CjUkMsn5vBzW3GOsoVuMFXNKA9NmGFB2e51Jm6NIf5yJf6uzODkuppd
	ZRQwxWe3jQ4iOzU45ritC+qP9E6S3Swb4+ZtohykaTVmASSi/zbKSXUpVtWwuls+9NAum+ddHxy
	F6oy1XM8+ZNFrFE6hal5Xcolcrw==
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7af1f2fdbe0mr2665092137.36.1790349340156;
        Fri, 25 Sep 2026 08:15:40 -0700 (PDT)
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7af1f2fdbe0mr2665084137.36.1790349339673;
        Fri, 25 Sep 2026 08:15:39 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm67393105e9.11.2026.09.25.08.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:15:38 -0700 (PDT)
Message-ID: <3d9d648a-26e0-4509-bedf-f3a75ba2bd9f@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:15:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260918134219.F23A61F000FF@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918134219.F23A61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 05C8KVhNf9Z40kD7nrDMhJqTriScY8yY
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab6901d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q6XjiywgsVnUag6QICEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXyF0sSqxwst5z
 saIh9Du5Tz8hmVpEQnhNk1I2cQLYWOMq69fvVH09vernFlX7VSKlMY/2Rm+CvkcwT59mDV1E4DS
 Imcbcw3RfdxUOyQr7TzMj336Y0dkcPSDVbO7ucM90bzcpsoOP4z4wB8JbqOo0jfme7DW104RfkC
 tTAVVL7LPU7B0lT/iYgNZoUPdtDROmNF3e4yKvgvDKYeJDzXcNWJcKh390TEBSzBhEGDtZH83ei
 Af7imUNO/hzvgshJODutB654jOqv3hrVylfwpyR63Cj6Ri3n7HOIG7+q04NzPnrCPQzlOkY+cyM
 rwGWkLvdF9pnvZok4J1niwv41TMQWD52zBNjZGRqTyBWR/P+VcqG25R11DB3ce530kziZhEfV+4
 tWDoAdhS9o/c26vxen72wCR3vlMrOXshqPk+3Tbva8FuiR6lSsNrTVzx3gVmzlrcU/Co/f2HGUx
 Y6MKVXIju1v7TfIX3mQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX2BEZqAxOwgFa
 p7IDZuxuk06eun8I6ciy5y+9/Yx8pMzWxqghfBioEpNOG+jfbVDPqx9e7LbFD35Gsbl/rqvb4MB
 2LeaIyocY6F9J2cSazot2uKdPKlwqpg=
X-Proofpoint-GUID: 05C8KVhNf9Z40kD7nrDMhJqTriScY8yY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

On 9/18/26 2:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] ASoC: SDCA: ACPI parser is unconditionally built on non-ACPI platforms

This is fixed now.
> --
> 
> commit b342382e9b5b09b26bd417be9cd5ee4c2d90de61
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> ASoC: SDCA: allow building without ACPI
> 
> This commit drops the ACPI dependency from SND_SOC_SDCA to allow the SDCA
> class driver to be built on non-ACPI platforms. It wraps ACPI-parsing
> implementations in sdca_device.c and sdca_functions.c with
> IS_ENABLED(CONFIG_ACPI) and provides empty stubs when ACPI is off.
> 
>> diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
>> index 4c0dcb9ff3b94..72c02943c49ed 100644
>> --- a/sound/soc/sdca/Kconfig
>> +++ b/sound/soc/sdca/Kconfig
>> @@ -3,11 +3,13 @@ menu "SoundWire (SDCA)"
>>  
>>  config SND_SOC_SDCA
>>  	tristate "SDCA core support"
>> -	depends on ACPI
>>  	select AUXILIARY_BUS
>>  	help
>>  	  This option enables support for the MIPI SoundWire Device
>> -	  Class for Audio (SDCA).
>> +	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
>> +	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
>> +	  (e.g. ARM/DT) codec drivers supply the SDCA function data
>> +	  via sdca_class_hw_ops.populate_function.
> 
> [Severity: Medium]
> Is this Kconfig help text accurate for SND_SOC_SDCA?



> 
> The text claims the ACPI/DisCo topology parser is only built when CONFIG_ACPI
> is enabled. However, the CONFIG_ACPI guard in sdca_functions.c is closed
> early. When building the kernel with CONFIG_SND_SOC_SDCA=y and CONFIG_ACPI=n,
> the rest of the file's DisCo parsing logic is unconditionally compiled.
> 
> Note that the related probe failure where sdca_parse_function() was
> unconditionally called on non-ACPI platforms is resolved in Patch 4 of this
> series, but the dead code and Kconfig discrepancy remains unfixed here.
> 
> [ ... ]
> 
>> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
>> index f39008ac0e7d3..1eb6418e132dc 100644
>> --- a/sound/soc/sdca/sdca_functions.c
>> +++ b/sound/soc/sdca/sdca_functions.c
>> @@ -25,6 +25,7 @@
>>   */
>>  #define SDCA_PROPERTY_LENGTH 64
>>  
>> +#if IS_ENABLED(CONFIG_ACPI)
>>  static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
>>  {
>>  	/*
>> @@ -201,6 +202,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
>>  	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
>>  }
>>  EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
>> +#endif
> 
> [Severity: Medium]
> Does this #endif prematurely close the CONFIG_ACPI guard?
> 
> By closing the guard here after sdca_lookup_functions(), the remaining
> topology parser logic in this file, including the entry point
> sdca_parse_function() and its helpers, remains unconditionally compiled
> on non-ACPI builds.
> 
>>  
>>  struct raw_init_write {
>>  	__le32 addr;
> 

