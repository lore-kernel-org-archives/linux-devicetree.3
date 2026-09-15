Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAA63546C7
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481136; cv=none; b=J1gjqi9J7pNXLjDKq1tOheYHYPRcBk7neoMJviENHOHQSx5dL7fYh9YoJhrDyYpwyX9uujRSw86pcw0TTTNOlQEyTF3dvXd8LVpSUwhivG0NJllwrrZQUSdi4DN2Sot1Um6ON9/1Ll+ZXiHDFi6+dFtEU/Mw6s1/CmU/z9UE7As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481136; c=relaxed/simple;
	bh=NshLfx79PxnrJE0/5Fcr4m6nwAdQ30gIKulPsOZ+cMU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cICVijEkYdd8omkkSpWSXUdk26xISpQSG4c3hL2Nh7r3UXnT64M7mAwXtNvk6XpWQr9ouFZRbEEsPll4vuBBQWbvZqgHt00gaUiFMNNSTi1GdpcwSk6vx6yVEt+yKajyt4NtydLXXcZIujXW0prJyLOel0cKDRL6E4HFozo1Dog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6yJWMnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qs5BybRw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6yJWMnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qs5BybRw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD04Fj156070
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AdtOepO6CLMia926RowP3TKcd+bOiHq21Mopgiw2qU=; b=g6yJWMnG5cMLiX4q
	UgEUCdyihpj0buUOxOcCKcTnc/7RmiDmqLhyN0Fq1LM/MrMclNodfr9DpKMRkyrM
	9gc6Ye+uvogsGTlTFhNdsPyqtH8NMrLpfr4puDh9rYMbIsoD6JjhNOC0I5BvFNZi
	5gMLzms3xibt+q7YwZ7pizufzqnYl3nkPPtj6ZPY4quYU+d/yiW3DTZTueiXMJjz
	orsInwFRux9XieNHzFa/h2aJlmqljLYu0CF1nRK5Ueny2Ok5ZLEstiefptJ7lv+2
	8WPuWp0aTgohjzjrSxoasj6KQcJgVZMATEzm3CYlC3eSMsQVx3gQr2tmUzJB0p9Z
	Vl/D/A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jesy07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:05:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a0dc7f26cso6915770b3a.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789481132; x=1790085932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AdtOepO6CLMia926RowP3TKcd+bOiHq21Mopgiw2qU=;
        b=Qs5BybRwU3/wC9DU4M62eEratVKHxBi91bvlfV95bDaNsWhlRRXUqd9pOp8lHVdJ5K
         OLLq6XDk7ZdyKwg7mTkkMyqojbdnJ4ELP+0CC/H+BU0VkuNWNq1ec3TsXkQmUqil5tkC
         DU5rkP+tGw59amEtEJmv7wiHcMx66e8/pJmBDVHWFoY9QBqPjkQNlqfHPrHfuB64+eJW
         n6qugneCYRVO0PCIpoEWu9wSBm54eGZVueqfJ0ydOtYrCn59o4ddPDGDE3MNCObleTLw
         CHOnJwJLoyTkNvL5sEk/vDiQ5//U+Gw1Ztia42cBwqPAFdcQKreui/P+mY4FcLzzyodC
         fVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481132; x=1790085932;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AdtOepO6CLMia926RowP3TKcd+bOiHq21Mopgiw2qU=;
        b=qulD6RkNVDOJExcCV1T2B3UdCXQtvlU84C55bNloJ0rm4slxJ5g31m78mxPMDqRbbU
         S+NtOCwi+hnNcAXbYfpuGHRXANb4VXRwIPKoh6yNY5v5Eluqixz1qVIt2cmwH6TIFf56
         CjneA69NDMfT20Chu/RxzmP5K7IKArD3aO6T7HAzN+5Zq7oVm0nbubj4WYCBwwettqg9
         5IYtA6aextr4vXSDn8EDpw6zrc6K4p4UgDpW2MopXBzCXdIG9S0XYNxbK7MAI0n5iyQN
         vspYFJxBWyzW8p4zdTU1zRsU8NHm1Twj/67sqwgrWktYN0hcAfmmbb8LyI8lnKi64HG6
         4cDg==
X-Forwarded-Encrypted: i=1; AKwUvBy9CDffIaN4hUM82pI4W786IS81mpDnQmPV5JVTDjYIxScRuyiyYNdfMbWFBVlVjNQ0h5olqVsDrPPD@vger.kernel.org
X-Gm-Message-State: AFuF++lPU1WSKadZD7957ZPDCmPULLtaZXt4JWl+2ZJTW9fc8P5uOzQG
	6zFYAdXFokSK4Gd3Zpkm9QXyEvY9JmxUOBhiE0mvp6MP8AtHelij15BIlCHnuamONlhsap0TrEi
	U39uiJC6Mj7PgCwWaAykhIUU7suAFakeyEFZtJ6wPfUJTB2BnEPQR0QS53NuldWKSPrKaEQM6
X-Gm-Gg: AYBFou2kyjuQ6iT8U/wzk0ihjmyKBHU/tazq1mxXZZHqJ25GOgqtql7Q358LKDWCRCz
	LKT6NYNn5W5SkLBaMeyceepJJRvAgU9+3FTelBZ/ZRpbFpysLpGIUXgnw8TMTwk5YasXbhuw0j2
	7sWtbCg82Bgx9u4sOBPOREa8eMvyfsvHdRVFtl0vXoQKfBAh6v7174Sbl+ywEcY9zv+37cKFPk5
	TlLVGlJgbuaHPAwydk/HhvZb/Eh6HtzNwJtIFmpoPhj6mEx6Tt+erFW9Y7S09d84NxyMdyJ7bui
	5B9UaydC6/WoTQ8llb2xNE0wMq1d04MCEPG6Xub2OOUcKwjsQrcktDFfvjA0qonrPdgAt30Eil6
	tRADmAIRJZoYRawWzj3OTq+n0fo6rpj9d
X-Received: by 2002:a05:6a00:3995:b0:84f:a82e:d32f with SMTP id d2e1a72fcca58-86f82e5bc49mr13252815b3a.3.1789481131984;
        Tue, 15 Sep 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3995:b0:84f:a82e:d32f with SMTP id d2e1a72fcca58-86f82e5bc49mr13252736b3a.3.1789481131402;
        Tue, 15 Sep 2026 07:05:31 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm6368827b3a.42.2026.09.15.07.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:05:30 -0700 (PDT)
Message-ID: <aac5b5e0-89e8-4b78-b93b-ed97ade4f1a6@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:35:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 03/10] firmware: psci: Introduce command-based resets
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
        robh@kernel.org, mfd@lists.linux.dev
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-3-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914151400.D99051F0089A@smtp.kernel.org>
 <0f5a8bf1-9ac4-4b0e-98cc-5bd833896413@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0f5a8bf1-9ac4-4b0e-98cc-5bd833896413@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwNSBTYWx0ZWRfXxUmEAIC7X271
 76ZL9Ua0BSdwG3twoQ9t57ish6Bid1434zjfUCuBLLcB6K1O7kVsJgc/RUMaXklIZwbklg211L0
 W0ZNmtQ7Uab495b4elDAF5AhC0KrqJQ=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa950ad cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ez_dwArMwaZOn3ezCW0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: dwEtGPG2wZ6XigmgMSc5XHvg8ylpkhnA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwNSBTYWx0ZWRfXzx8tBBgHuso1
 MePnKQFyR2nW+94b/Pe4m8vC0Uq2O+MtLSdDQ+25EWeRYehQh1no2mJ5OA/JivKzpc2hmCsuFXb
 0IornvssV5WtsZxULDiwVPNpcxw5vk4btKAkPGUnx3sEfG0s3pkrV5PUhbBFiakxkbEvnT6SjeK
 N3wBHoncdTl0omwsKldOZEkr4yE0D9MTCRqsDfZ4vGkGmAlUokkHrmC7cWXiFGhHleBwXXhbs8n
 OHAV4rRbki9f1/CRnP9XlhVjM23MYrCsTzbbUEY9FQHIXVbXqFeuj7aHVsMAg6+HUCm6ovdnQO9
 7rFjjiggdG+lO+jxaGY+ludoOzBOxEuXLg3PEAcw0MBUSdL2BCM2PU6iEJKceTWMrGUenZfEUja
 VoKKHQfalFt6ecUgwMO6wPqdOwav6mC2P4e4giRRpUOpCKCRnyzamrhSLuessy9xv6N1/Sd77xX
 4+MPQLlsVXUtgvjh65Q==
X-Proofpoint-ORIG-GUID: dwEtGPG2wZ6XigmgMSc5XHvg8ylpkhnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150205



On 9/15/2026 7:32 PM, Shivendra Pratap wrote:
> 
> 
> On 9/14/2026 8:44 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [High] The restart handler `psci_sys_reset()` unintentionally skips 
>> configured reset commands for standard reboots due to checking if 
>> `data` is non-NULL.
>> -- 
>>
>> commit 15791809d0deec27e24e64483b3317dacb5842a5
>> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>
>> firmware: psci: Introduce command-based resets
>>
>> This commit introduces a command-based reset mechanism allowing 
>> reboot-mode
>> drivers to specify custom PSCI reset commands like vendor-specific
>> SYSTEM_RESET2. It defaults to the existing reboot_mode flow unless a 
>> valid
>> reset command is configured.
>>
>>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>>> index e73bae6cb23a3..d489ba5d147ce 100644
>>> --- a/drivers/firmware/psci/psci.c
>>> +++ b/drivers/firmware/psci/psci.c
>>
>> [ ... ]
>>
>>> @@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block 
>>> *nb, unsigned long action,
>>
>> [ ... ]
>>
>>> +static int psci_sys_reset(struct notifier_block *nb, unsigned long 
>>> action,
>>> +              void *data)
>>> +{
>>> +    const struct psci_system_reset_cmd *cmd;
>>> +
>>> +    /* The function psci_handle_reboot_mode follows reboot_mode based
>>> +     * reset flow and psci_handle_reset_cmd uses reset_cmd based 
>>> reset flow.
>>> +     *
>>> +     * The reset_cmd is configured at the reboot_notifier phase.
>>> +     * If panic() or emergency_restart() occurs between the 
>>> reboot_notifier
>>> +     * and this final reset, skip command-based reset and let 
>>> reboot_mode drive
>>> +     * the reset flow.
>>> +     *
>>> +     * The function psci_handle_reset_cmd invokes non-returning PSCI 
>>> SYSTEM_RESET
>>> +     * calls to reset the device. If it returns, either the reset 
>>> failed, or the
>>> +     * command was unsupported. Fallback to reboot_mode based reset 
>>> flow.
>>> +     */
>>> +    cmd = smp_load_acquire(&reset_cmd);
>>> +    if (data && cmd && !panic_in_progress())
>>> +        psci_handle_reset_cmd(cmd);
>>
>> [Severity: High]
>> Will this check unintentionally skip custom reset commands during a 
>> standard
>> reboot?
> 
> By design - Normal reboot with NULL command should go through regular 
> reboot flow of psci_sys_reset.
> 
>>
>> When a standard userspace reboot is triggered via the reboot syscall with
>> LINUX_REBOOT_CMD_RESTART, the reboot sequence ultimately calls
>> kernel_restart(NULL).
>>
>> This propagates down to the atomic restart notifier chain in
>> do_kernel_restart(NULL), which passes a NULL command pointer to the 
>> notifier
>> handlers.
>>
>> In psci_sys_reset(), the data parameter receives this NULL pointer. 
>> Because
>> of the check for a non-NULL data variable, the condition evaluates to 
>> false,
>> causing the handler to skip psci_handle_reset_cmd(). 
> 
> Yes, do_kernel_restart(NULL) should take regular reboot flow and ignore 
> any pre-set commands.
> 
>> It then incorrectly
>> falls back to psci_handle_reboot_mode(), even if a valid command was
>> successfully configured by a reboot-mode driver.
>>
>> Is the data check acting contrary to the commit message's goal of 
>> ignoring
>> reset commands during panic and emergency_restart?
>>
> 
> If the commit message is not clear, i can add a line to it, stating the 
> same.
> 
> thanks,
> Shivendra

Adding Lorenzo and Arnd for views on this review.

thanks,
Shivendra
