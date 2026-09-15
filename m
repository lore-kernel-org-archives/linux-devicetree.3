Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CD348C6B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480961; cv=none; b=pa7iS3G7QbYTeF2AJlO/lkUyFgayBE2rpGWMLl0y5rh2YSLJgTvG7jY716CK03H2fEGi8q7Y3G8iIv0Al9BizJREMOmboPMVQlQPDcyoxtEne82eZ07/MXiPVDdH+2a/kc0cDjQ8Il2JGNGhvpXMzOhIJpDWtyOQDY11bL4rlOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480961; c=relaxed/simple;
	bh=m1ZCIdhEkGSNduyzeC0b60Lirr9R+b9XNCmxgkDimZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re3A7ywzZESJX5bCc8FAfMOAZ3Bp6btjmjCIhhGPBaRiamdJHgGo8vyb6mTSO7a921mQpJ6PGdgil3nxzRj1/dqaBqoUYcqXsMxLO0dej6LjQvwctNuY0/r/IZ4v/Xnl9KvmLKBjvZQYf/zdV6KRZsQsOUJv2VskJUalbpJzeSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJY+Hx2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cu/ungvF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJY+Hx2o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cu/ungvF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0HIu4181071
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=; b=CJY+Hx2oRYr80Rhc
	KiYdvbVTWdty+PzZgmTfAa9Dh/Q/ROzCfBFAUgeAv1JBOZFxEaBRNURyRGRHZV+K
	WJ302fRmEiFE2j4h7oZSq8vHSlREXf1eZGvHncBXLCM//JPJltGROPuXMzribKt1
	Be8xgSDVhxb6AqIAsvLAufhU6qChEqDtxRzypJA6GtU5Liz8z7KLsNze6KA919OU
	5pfxXuPmiXwtYIB5ikyt7+dl/BJB7HhhFmkpsDyojJMxsbEXLi9jFLk+1AGN0uEO
	gLyPJ8IcxCYewVsLRdbZ2oZtNSos5DIU4WDcE/l9krUNTgs7qIxjnsMSU0yIYw18
	Slek4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux252r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:02:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so10525426a91.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789480956; x=1790085756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=;
        b=Cu/ungvF17032433VnQIpda68L9MuxqTOwYspmAHU/jRlqD8FBxbYWtcnQH7AnHLwS
         LUuTAsY/TxTGcfR4mBtopjp8yHIQ9M1GSxgGYNxXuMvbdvObVoCx0bg1qShY8YqVZbMn
         QxUx+faQv45TKRulJnLGxEZMEe8T3pAvw8a1hCzbeT1Hxqx4h4kgpLoAE3b6xS0XO9gi
         eUFQ9PfS0DohfeT/IwOphGZKI3seANbtwlbz7gsPIulEQI8TyURDdsmYxCiN9mXBDqPu
         KyNGQvZ9dzDzVpUh/ZZauFlH94CFnHRYZ/XLvSHCB9GW7LZ1sQcXPtmtGNB5+QkdEM9k
         mUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480956; x=1790085756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=;
        b=UsRTnJpQXueI/anxVGonraauBdfUDsN6xm0grcA6Wy1XmYMvkA0yk8XCOdPV9DksC/
         oI9vl+5YzRp8S9JtAQWBRQP/yO4skNZs++LjYcM2pB/V1mj2CmrVv1eE1wr/yBwa9rDE
         h1ye0uU4r0SWtoslVQaS6w12HzG5m4fR5U5eBxFLoqUFsaV/NYTeVbbFxspN5xEPjLcI
         lLO76TDxNqTuOW1XFFQXUcLfMd6hOwYxuoHQQ/0baJhuvjJIfmItQ5t5xlz8KM1OefWt
         njWTW6GZfBKvPR3ebT87aFcSqbxbr1vDTaN2xPluK3+FKFPkOJNJjQojPtY4p5dJT+0+
         dMIg==
X-Forwarded-Encrypted: i=1; AKwUvBzDjwwOEQJfTvzZUJOeaXPkDwAjKnBLGnYfkKgvw3IgoBJgHn0rRXD2ae2qjVC3UR3Uw7dCa9oIOkAz@vger.kernel.org
X-Gm-Message-State: AFuF++mfpfZHQ+XuC9gsJSRVHVDio10eTFPVzM4IzpdSDYI5rkezPsN3
	3FEibweXj8IcjWNIu0cpOXA0B/yup+KFMIfTSR2XfunPKymdSRJAqcrIpWzx9pFHJCtOCcZGHMd
	54dwFV0qXsH4HJldLs7EsWEnUJlbY2WB5UHyyis2fF17bzg7wpWYiHcuQJqIgURFy
X-Gm-Gg: AYBFou0A4ZEqlQ1uO0VPx7XZzX5NwWJyCVsEhW5tbc8uk8WEIW0dNRy8KpWTTZifq9Q
	qGJIXBtQM3YO27l9HkzFHD8m58wudqnONURxf0835Oe7XlsmSeY2B2IiSy0WmkcwJ2LFvMt3ZXE
	hyAeQ5yFNzJ5ZHPVsRw1hyvJ4kPF2OMBWHt38TD79mmouE/56+IGZEUUv9cbvlHner1FKm0sAki
	pKj2Dolgq77KZfkTXypZnpmuHUN/OxtyJryUPzkEXD5w0Mwc1hwWhovifNMPBNZW/CbfuzmI3Os
	07iKvpWue3Zg5aQpS9EeVSDFX2Q2+iNeISImugFadY0RuuMSes4jBdfRY4D87fdJ0WGeduN0Hia
	bi6Gh0ipTYjrbJteBsVVcv8UcPEJtdu14
X-Received: by 2002:a17:90b:2e4b:b0:39e:d2a:e2dc with SMTP id 98e67ed59e1d1-39e1104906bmr1919278a91.12.1789480955885;
        Tue, 15 Sep 2026 07:02:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4b:b0:39e:d2a:e2dc with SMTP id 98e67ed59e1d1-39e1104906bmr1919233a91.12.1789480955433;
        Tue, 15 Sep 2026 07:02:35 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd561e2af6sm46699235ad.70.2026.09.15.07.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:02:34 -0700 (PDT)
Message-ID: <0f5a8bf1-9ac4-4b0e-98cc-5bd833896413@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:32:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 03/10] firmware: psci: Introduce command-based resets
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
        robh@kernel.org, mfd@lists.linux.dev
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-3-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914151400.D99051F0089A@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260914151400.D99051F0089A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwNCBTYWx0ZWRfX0VEGo31dKOBU
 1pnEnnzXiXs9r7yzk0Xaucn6TLZRY+Zuph0WHK0kN0GzU7C9YE61jf5V53RK9IcpaJ1kbH0raws
 ZTQHHQU8epRR6HdD7CvljHYOYq6iFTrMj5xx1qEQW8KqDcY3JWcUK43B5tiFK+MI73L2A2nzzIK
 4j7kSVhB5JsPadoWCo+RkNifR9UDDNrSZOUhM7NHRUhDBOAqjmIqkLevVZtfmGhO4OPagWqCNh9
 w4527dWeE78d64Ar5/ngtQ0Gh+4ma074Sd7Cd9Q76tr18eQRTRUut+IvtABGdz5P2zVoSy79/D1
 yD032JkyQXTDBban6WAD5CqeXtlGWazbx06qhlcPE7D5ebaTWVsPgZjfZEZMznwP+FFQtmIzMDz
 EHV5Z/O5YU1k4zBjRjq3Jlb4FMEZibKrHSKdLrYHtkv4CTsFeqnJ+EsVrTH5oY4dzdv+riD4EEU
 mrBP72o+TeK+ciZjQHg==
X-Proofpoint-ORIG-GUID: 9iJpFDR1ROERpYJb9oGkeq2K1G7MgevI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwNCBTYWx0ZWRfX1Z38lEZwXqgA
 lNFaFlIKNP9jH1TeEmR7yGIYq9wN0+RZTNLqlX77+B6v5MNCj1kshJdp3ZXUpYBI4jlWdXMIfod
 P7Tv8R5ckv4ECDvKC5G+b4udSlhBfjM=
X-Proofpoint-GUID: 9iJpFDR1ROERpYJb9oGkeq2K1G7MgevI
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa94ffc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zKE4ULxP5i7x29BA47AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150204



On 9/14/2026 8:44 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The restart handler `psci_sys_reset()` unintentionally skips configured reset commands for standard reboots due to checking if `data` is non-NULL.
> --
> 
> commit 15791809d0deec27e24e64483b3317dacb5842a5
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> firmware: psci: Introduce command-based resets
> 
> This commit introduces a command-based reset mechanism allowing reboot-mode
> drivers to specify custom PSCI reset commands like vendor-specific
> SYSTEM_RESET2. It defaults to the existing reboot_mode flow unless a valid
> reset command is configured.
> 
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index e73bae6cb23a3..d489ba5d147ce 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
> 
> [ ... ]
> 
>> @@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> 
> [ ... ]
> 
>> +static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>> +			  void *data)
>> +{
>> +	const struct psci_system_reset_cmd *cmd;
>> +
>> +	/* The function psci_handle_reboot_mode follows reboot_mode based
>> +	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
>> +	 *
>> +	 * The reset_cmd is configured at the reboot_notifier phase.
>> +	 * If panic() or emergency_restart() occurs between the reboot_notifier
>> +	 * and this final reset, skip command-based reset and let reboot_mode drive
>> +	 * the reset flow.
>> +	 *
>> +	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
>> +	 * calls to reset the device. If it returns, either the reset failed, or the
>> +	 * command was unsupported. Fallback to reboot_mode based reset flow.
>> +	 */
>> +	cmd = smp_load_acquire(&reset_cmd);
>> +	if (data && cmd && !panic_in_progress())
>> +		psci_handle_reset_cmd(cmd);
> 
> [Severity: High]
> Will this check unintentionally skip custom reset commands during a standard
> reboot?

By design - Normal reboot with NULL command should go through regular 
reboot flow of psci_sys_reset.

> 
> When a standard userspace reboot is triggered via the reboot syscall with
> LINUX_REBOOT_CMD_RESTART, the reboot sequence ultimately calls
> kernel_restart(NULL).
> 
> This propagates down to the atomic restart notifier chain in
> do_kernel_restart(NULL), which passes a NULL command pointer to the notifier
> handlers.
> 
> In psci_sys_reset(), the data parameter receives this NULL pointer. Because
> of the check for a non-NULL data variable, the condition evaluates to false,
> causing the handler to skip psci_handle_reset_cmd(). 

Yes, do_kernel_restart(NULL) should take regular reboot flow and ignore 
any pre-set commands.

> It then incorrectly
> falls back to psci_handle_reboot_mode(), even if a valid command was
> successfully configured by a reboot-mode driver.
> 
> Is the data check acting contrary to the commit message's goal of ignoring
> reset commands during panic and emergency_restart?
> 

If the commit message is not clear, i can add a line to it, stating the 
same.

thanks,
Shivendra
