Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59321438474
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118100; cv=none; b=G8V7EIXZXeE4S+Bkt5hWcEWBed/Eb1FNnLanY4h65nYptOohY8QcYbbIasTT89V7I3SFTusWhmka7uTCaV6gxpgHNbu17xcSiit32CBa6x3swTdJt4tmDIaeGWIAqX3DT7qW65dSSoRXlLCHSEPVxSxO5KFl0hb3qRpFjye/eEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118100; c=relaxed/simple;
	bh=0zuX5DJNZKHp/nca1largxbOdKJ+mhgJHK9PZiNSHG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vog/BD5BTevsA/QunZvFtiTcJTofYz7EIu7q1Dnma8yk5e6lLgFncohkLRIvrXuIFsxyhin1EFNIr9co01oBzksW20gRw0wq1g2CAzdqWdPeoL3GH4vq0k2JFqetlQ7I8Z0ZeQEzMaR2o2fopAOcFOIFV82unHKHCngWPZhehBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hl5TGG4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4XiksXL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hl5TGG4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4XiksXL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcwVI3629367
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r99kkd6fP/ic3KdRsaZChhsJWWU2ou3THrOWDdyMrlM=; b=hl5TGG4PZhUlgo7Z
	HT3WPYFf0997UP2SUZrwH/9wuu16nZ9nqptthTRfv6KYjxhrrQwkvhl1PEp3mVQF
	mY1mwrkFf6TQGHFABos1FUTDFjJPv4Y076jIzt5IXn4O28dHyV9M/IEcnMacsTCT
	uZx9yIeRzlENlsW2pmfmgEoQji5mx4YPeT98aBMPctOIBX4QfSDw4m1H6eaJKFXB
	/j4Q+QBPRpqNRsPG5DVFQBHc5N7rpXAxaSw+26Fjgace7c8WuLAOe+p1dB4QFugO
	y92Lt1yGczVFcE89Gbrqemi46o63LSpNyjwPgSiuOdvjeH6Uqf3M+BFM+A5nqL6o
	1rdalg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kummp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:21:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so4904720a12.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118096; x=1784722896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r99kkd6fP/ic3KdRsaZChhsJWWU2ou3THrOWDdyMrlM=;
        b=G4XiksXLWypGGPu7D7D+jmhwQj4C0h4YmaKvlKrV/0quOAqSCuXEvZNkT4pKJKRRiq
         2seITeRLTYbTQlEcTOKVulcTajzWIEzTk3B9rlfk0TtmdmNv2TzpuYaUmxx7NgwkhmKU
         OCW0vgtjt/l4AYMSlLBsK4I7cPMJV8LcPHYfkVUQ3s4pWfrd2VmN6jjys8X+F30CWSfg
         46S1Bml/WEsRobDqKdzhPUqgIYNBYN/i16v/LCpGhUpdDyLEHT2ixg9HoiuzUa6rT1we
         8kcYPqfOD27MePcGM2oV0Dg3jfclPcONjj/Mv5XM4+3GB/N84R3kyb6OVaP9B8AA+7Yx
         lg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118096; x=1784722896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r99kkd6fP/ic3KdRsaZChhsJWWU2ou3THrOWDdyMrlM=;
        b=h9Ys14xv0q73KTIgEzfLZIQT9EUTEpQ25955Av6J/GYzEzRHdDtGVQ4u4f6Bzf0byV
         GFBPuT4FGlDuIfYZdEOTIEjtEBPydJ1dIjm8+vtwdcyWZ+2jrVvmsuGXYox69JippDal
         ejdzsGadiHbBNUc83dX2a+vdvjJqpF0SWlAXMmDujhq+0LpXbsgy4F0r7wIbfuZ4ICqB
         NcGTOvacYJhRMvm7k6LR9mSfVEIMuaQMSYCOfEEjB54FKrfJkSEVUyvnhJTrRUso7gMd
         Ocy1ECzfbnJb0fL3H+o9RMx8JPGN0DAHvnPsZRge+L0lhEvOaYjLEohhDMmITfU32Olt
         O1Pw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1n7EZ+HynIcoTRHdcakFFfRmUTz3zJIi4o5vf22VwU1ztdcEVUUzh7c/4V8bAM+BEytAVYNT3aAs+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj1lpFRoTS4W6iTQXLJW2/R7E/NB+/IrxSaDBFvrA98cn2BWXO
	lpKL70ysaYQhmgb9VKIa0WgSgK9wq9fet9CuCkinAZrsLZdtEWST40fa8Mzik6eTXasWWST2cXJ
	wmu/00BuBEeaU0aam2Sg8eWjWTL2BMNEg76T4DPkPv/QQmGbdkK5RaMSjp2YGmTPJ
X-Gm-Gg: AfdE7cmqvwBDJps9zarAEEZF7APWORt6Zc4pmeG4yOysz8XLxkjrBPiVzDNo5Oet6Tq
	Am59Wm8d1jgK7EYJn7YZhyOJpi6PFdVjxaaRLHR56HIMJB0WcjOzdyygqiMsgKERZIqR6OXY93U
	fLreO/lG3ZoRh4agpMms1aXJ0bneV9HbFt00Q5wx+ZXLjBOCvelSIV5/WKIDqpCVffL+/c9JJjz
	AzkuUESAoyU0IkTe1OzuSebg1OirHjvqRmRhuA7GTJPxDIqNBR+KdtKTBT0usePqTenFEs6810J
	/Yyh8dKMvd/06azJ43EfLaMirj7uZ5PgC2ebdGPWwSNYiKOTEHhzwuiB+qO/4oDQnyca6eLgRYf
	llh4F11aBZiVyEVvDsR8X2Pixo1QxGzWNvdmtnWYDGvoLJQ==
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr19971631637.74.1784118096154;
        Wed, 15 Jul 2026 05:21:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr19971605637.74.1784118095674;
        Wed, 15 Jul 2026 05:21:35 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a5174sm1122535eec.15.2026.07.15.05.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:21:35 -0700 (PDT)
Message-ID: <a0450bcb-330e-4842-a9a6-1dc5fd83617f@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:51:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
 <20260714173038.50B121F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260714173038.50B121F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a577b51 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c1Io3eFXDdE26PNcJJ8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: FfU4S3iXRNoUbCyXhJi3gJcWq_mXJJWj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX4KNYXf63/Cpl
 8yyvbwzoOk6l+AfHH1ejo2M2bIjPh6/0vQQi9or/CnAaeIjaXD6zaNmKSqFu+a7V9FQDoPxXlDf
 CW8B+pobOgwqyvlyFM3P5K/vIZ5vOvw=
X-Proofpoint-GUID: FfU4S3iXRNoUbCyXhJi3gJcWq_mXJJWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX9OQ2wNk3o6GK
 UQkkgf+qc7rMY4kHrgbu1xbKuE5lu+Y1gQbYkD0z221BL9U/bzloDtgIQhSvFG6LMRYaO37fYyH
 jUA72yAa/E/+ISkHTaZFEUF2v7FIFHzOUf+KwOH6u6hh5afQkclL+vnu6UQdaj93awP380bkZPJ
 YSxMzolamFVjjfWIFCGIN3hAPqfMzBtFWLZ+/OOS6NTyYQs9B3G1IMdCo3i+FM1js9LWxVKlADY
 BWMrcoYOblXpHzDOBS6r8NxzotPjq/kkMdPQy9L87ojvsyxXTm4GUTbcUlJgHmDvvrDPrp338G3
 1X5DZGxGACop2QrO/BOzrTHPxUKkzxzXpOvRK+P0BajofN2jOpma/R6hdGsa6I0Z+1b123nSjNQ
 G1mAWBHOldgZ/LU+dpH9F+lQWgUuYmzexuioS7d4ejCZPLa5hIvgO0xR5EkFlgloxEJ8+p8GL/o
 GFHNNL1WCtDhoGtqYDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150122



On 14-07-2026 23:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The `psci-reboot-mode` platform driver is completely unreachable dead code because it lacks an `of_match_table` and is never instantiated as a child device by the parent PSCI or MFD driver.
> - [High] Lockless read of `reset_cmd` in `psci_sys_reset()` can race with concurrent updates via `psci_set_reset_cmd()`.
> - [Medium] The `PSCI_REBOOT_MODE` config is set to `bool`, which forces the `REBOOT_MODE` framework to be built-in.
> --
> 
> --- Patch [7]: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver ---
> commit 05cd2956034a357b1e7d5eab96bdce4575604285
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> power: reset: Add psci-reboot-mode driver
> 
> Add a psci-reboot-mode driver to handle different types of PSCI resets,
> including predefined and vendor-specific resets, at one place. It registers
> with the reboot-mode framework to interface these resets to userspace and
> passes arguments to the PSCI driver for command-based reset.
> 
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index 124afb99febe9..93e4029d95060 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>   
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
>> +	select REBOOT_MODE
> 
> [Severity: Medium]
> Will this force the REBOOT_MODE framework to always be built-in?
> 
> Since PSCI_REBOOT_MODE is defined as a bool, selecting the REBOOT_MODE
> tristate will forcefully upgrade the entire reboot-mode framework to built-in
> (=y), which overrides user configurations that might prefer it as a module.
> 
> Also, since the driver source uses module_platform_driver and MODULE_LICENSE,
> it appears designed to be built as a module. Should this be a tristate instead?

kept it boot by design.

> 
>> +	help
>> +	  Say y here will enable PSCI reboot mode driver. This gets
>> +	  the PSCI reboot mode arguments and passes them to psci
>> +	  driver. psci driver uses these arguments for issuing
>> +	  device reset into different boot states.
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> 
> [ ... ]
> 
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 0000000000000..955ed68f14026
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
> 
> [ ... ]
> 
>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
>> +				  u32 *magic, int count)
>> +{
>> +	if (count < 1 || count > 3)
>> +		return -EINVAL;
>> +
>> +	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
> 
> [Severity: High]
> Can this call to psci_set_reset_cmd() race with the atomic restart handler?
> 
> Looking at drivers/firmware/psci/psci.c, psci_sys_reset() evaluates reset_cmd
> locklessly:
> 
> 	if ((reset_cmd.reset_type || reset_cmd.cookie) && !panic_in_progress())
> 		psci_handle_reset_cmd();
> 
> And psci_set_reset_cmd() protects writes using a mutex:
> 
> 	reset_cmd.reset_type = reset_type;
> 	reset_cmd.cookie = cookie;
> 
> If an atomic restart handler like psci_sys_reset() executes during a SysRq-B
> emergency restart and interrupts a CPU executing psci_set_reset_cmd(), it could
> observe a partially updated state.
> 
> Since the 64-bit cookie may be written via multiple instructions on 32-bit ARM,
> could this lead to torn reads and mismatched reset types, causing the system to
> hang during emergency restarts?

Will evaluate this.

> 
>> +}
> 
> [ ... ]
> 
>> +static struct platform_driver psci_reboot_mode_driver = {
>> +	.probe  = psci_reboot_mode_probe,
>> +	.driver = {
>> +		.name	= "psci-reboot-mode",
>> +	},
>> +};
> 
> [Severity: High]
> Is this platform driver able to probe?
> 
> The driver lacks an of_match_table and is not instantiated as a child device
> by any parent PSCI or MFD driver.
> 
> A platform driver without an of_match_table must be manually instantiated
> (e.g., via mfd_add_devices in an MFD parent like psci-mfd.c). However,
> psci_reboot_mode is not listed in psci_cells in drivers/mfd/psci-mfd.c, nor
> does any code call of_platform_populate() on the PSCI node.
> 
> Does this make the newly introduced psci-reboot-mode functionality unreachable
> dead code?

This driver probes via psci-mfd.

thanks,
Shivendra
