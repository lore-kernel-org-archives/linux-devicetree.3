Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD341A508
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480449; cv=none; b=h0kh0gHb1lgAHStBaUA2Z0lPuziE9EXuBi+Y6xEyt48MEKa084wEoHReJTEzVkZrOoHgySosf7pZBGZrmbJNpBMKiiyDoGLeLr6Fn7xDaA1D3IflG1QoZNSnUtBm8HnApu1koSul972ahOyRwGhr+TmILx5vpoY1naT1+lp1d98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480449; c=relaxed/simple;
	bh=IgGN+5+YmfJJcGSHBWqndzTYmB4KrkfLtNFAsLa+jZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7M4wB8Mup4vyuAkmx67pTNsA8NGa16T2GGMwQNuUzH35sPGVTmRME9WyXU2zROi5TOuFcm+CQK4K9LJ5GFFqyrREZU565cq/t+FjFvpNT3tkuVaO/QvKKOXrJkxZfPLq7KZ6+gsoeolRY38NWXOACoyzpSIA9SIGfk2YCAQ+Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okm4aCfP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fAsKe4AL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okm4aCfP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fAsKe4AL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxrDL3862606
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxQm3zX3lZmPGj0zAESC7DaQsGw/tmySviRI16wdemE=; b=okm4aCfPc0ZMdbOZ
	aO6UCpJ4muHIEjyrb5RdC+dV+6q/YEz2XtV8GKbzlRXERqeNjvWyEmJiR7utMlTS
	oj1kvcyWXBhCd4+/yMHOrqRS1CPbKOUTKeTgTsaOisKxACB2X6JE3tfaIOUfTSvL
	trU9ugZPC1T+BP0rjp7AJBtv1r98v1Ym8CbtgTgxuLYLL0oiH0GCmuwgDUlk6/a+
	+hyGWr7udanqXM+kZ2bHWXYkMq+0S1A3fwqS6g0GG7zjTsngFKKcqMOpv8z28QQJ
	+nvK/iFdgU34+KteGRftQP42SN2ddFubu3tnPRoSnQZIupV5OKoE5mwRIT4HlzbB
	fCdD0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc1c6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:54:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3d832827so55527555ad.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789480445; x=1790085245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxQm3zX3lZmPGj0zAESC7DaQsGw/tmySviRI16wdemE=;
        b=fAsKe4ALAZlTTmsiTpGH+bFk+TqPCP8N2k3M+JceSeraEUR99kgNIB2HFkZOUJKemN
         fH3Z2kY2Iks5/VNwwZEkuFqgWgqyX+q1nvyHJQHDBwSdTmTIJvmvKdinWdMr6CBLZVTs
         0FFsWn1RvbEOh4E4Ua3ukUb0wgEJLqnaTiXQt9bkxn1txHSZt2/3oWiPdrL+Al8MM3ds
         JgaLoETfAwNCKtJaRGWMOnRgKuYwEMopZmLvRx0nBbLyZyN7jCM9BeKA5sSA8VbvrhdU
         0jBM3tEVAsmlRuxcQ9kLMlhO8CXFlhhTo+qHj+hzxwzss8hgWFp4l6VT/wnb73PR+PTR
         aQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480445; x=1790085245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxQm3zX3lZmPGj0zAESC7DaQsGw/tmySviRI16wdemE=;
        b=LGS7gw3uVSJqUMYVe2+0l4ATlPUdsrXNOj0JTW/WpTVZz0eXyoQN0OVfAl+tRlENHr
         ZC8K/Lwg4M7zrWk35dAnsDcxsOmgHMm9Uo1+F6Co5mRnX7BeLhKoCxK8aYgSiAN8QBj0
         lNOp/ekdpGo91z32wNP4aXVzDtk9BTpDRD46PG6i5O5busieQGikcKbiiSONAlRwxk9s
         wYJfJ+/+CZIIoBXis2JsVCFIApcYY7pwlMENu5X8QuKQVdF0AFYC46Yze2e5Ip9Se3p/
         yR9wnuAHit258Dh/6NXFqm//sU+I6BjceMgiacxu+bF86M47kJZtJPXAzTa7wcRIIdXI
         L/Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzTfyc8VjbCn8H8cKdhkIF9+Ht3GDDeuvCB/pWIbMrWzfG/SWWRk/QNQwPNaAyTa8saKzZADqntUByX@vger.kernel.org
X-Gm-Message-State: AFuF++muTXe786ax1wtF51Bt2SK0lgXGv9+626tHFNVm9boWFSLVVC5c
	D5mIjstyQakxKqwp6sVq/V0XjBKivuPqdVSwQy3WCPgNHRQ1UTwFSDTaic1/MMmkX3hDuRXpPfE
	QDkM933gUc+fnVwrrdUSV+7BvBScyk7QEUYGTmM1xrNc4F8CQWbzYELUmvxo1KvHW
X-Gm-Gg: AYBFou3MlQExIJsUACyvoVbTO266iyCICMgXrSw6uObDvyKnyT0H59ptJLzbiA5XJGK
	g/9wveXmqlVvm8dxUiU7kiYpxLg/cJ8nU3W84xW+x2fYH/cQXI2ntYZ92bVPyfK8nsfvuq3HWs8
	Dtz9TzN78YTUwRBLS8JslhJqf3unMoYPyhtZGbGeyN6uXMM8B1X4kE9UNRz5TL6XgdP/Pj8fTGq
	4XRLXl3nM+ZAoVsq4g7Ls1TqQZLuoI9riL4UxJHKBSURw3rBx9FvY3v8kDCFLE3GqCkRVE3PRnZ
	bzTYNTqrGzH9flOdJp3sgxrCOIUCFhWIyCpVAwKGWfX8aLKU/Wr6m8KtUMJMKg9j7GQ7AByiiNN
	Z0C3R7Sq8UpLOcEo9c6Dao11SMPGoXRpl
X-Received: by 2002:a17:903:3c67:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2dd6c6c0cd4mr148378805ad.11.1789480445356;
        Tue, 15 Sep 2026 06:54:05 -0700 (PDT)
X-Received: by 2002:a17:903:3c67:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2dd6c6c0cd4mr148378265ad.11.1789480444875;
        Tue, 15 Sep 2026 06:54:04 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce9837esm69650865ad.21.2026.09.15.06.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:54:04 -0700 (PDT)
Message-ID: <abc41d74-c267-42bb-8a29-513e4e54be7d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:24:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: sashiko-reviews@lists.linux.dev, Sebastian Reichel <sre@kernel.org>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, mfd@lists.linux.dev
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-2-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914151237.911CA1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260914151237.911CA1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0VtwZu4NPb1YzybKVD8xWL0WGN00t5bt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwMiBTYWx0ZWRfXxZpgv4sR8z4r
 Cpw6bTCB98j68fZlEtOT4MBq04VvgiaeIo9KD+P3AvkEQsNqnGYyiavwATNnqW8AOb4+grPxPfN
 PXqDdc6+TKTje+/KYRe/KMa/83BRcGg=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa94dfd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dxk7UDr9idcWiZ1mBXQA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwMiBTYWx0ZWRfX0DzBmo7/hdD5
 z5ln/1yMSM2OzvwhWGaUv90bgoPZP58E5miqwl5Q22bZkZSLppVN32zCCdn3f039+p3Nz0fPG7l
 tc9vUgkiGuVa1FTf3/6QUrzhBudMgXv5aZY2cyntwgFXitV/y2+AMghw7yZ0GH0qEzgrZSsItUy
 9nZKjHKJe9fcMRt9O/780JfARdcjDUfSni+MqL1P3K10FROyr+dQO3iwEMXYes1qcxVbduFHJh8
 LVo+tvIykl630Cd2TqSYgPDuXKIEfR576rz3rLXJyvQnb9wt8wz6OQVN4xZMdeiToay8TEtS2Pj
 7MgwhVa33TttNIy/fx9VHOY8glquMFQDadrY71js1NTVn/24+f2lvJIuPjWZyQPweJ/NOrCfY96
 Xac5NH7Dh9wZmq4fEQe7lqmqLtDa/fvIQOGbj3NGHNEwfSlC1UIoROI5X8YWzKhAzt5DzKPJIc+
 5bNx513YTp6G7Fnzodg==
X-Proofpoint-GUID: 0VtwZu4NPb1YzybKVD8xWL0WGN00t5bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150202



On 9/14/2026 8:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Predefined modes overlapping with DT-defined modes cause duplicate entries in the sysfs `reboot_modes` attribute.
> --
> 
> commit 394fababa44a1d093815c91cc11774a6de1c1f6b
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> power: reset: reboot-mode: Add support for predefined reboot modes
>      
> Extend the reboot-mode framework to support driver-defined predefined reboot
> modes. Add a centralized initcall to initialize driver state along with
> predefined modes.
> 
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 328fa37598df3..fd61de2263836 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
> 
> [ ... ]
> 
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
> Will this lead to duplicate string entries in the sysfs reboot_modes
> attribute?
> 
> If a reboot mode provided by the Device Tree has the same name as one of the
> driver's predefined modes, reboot_mode_register() parses the DT property and
> adds it to the reboot->head list first.
> 
> Immediately after, reboot_mode_add_predefined_modes() blindly appends the
> predefined mode to the same list here without checking if an entry with that
> name already exists.
> 
> The duplicate entries are unconditionally propagated to the sysfs structure in
> reboot_mode_create_device(). This will cause reboot_modes_show() to print
> all modes sequentially, resulting in duplicate strings in sysfs when userspace
> reads the /sys/class/reboot-mode/.../reboot_modes file.

The reboot-mode header adds a note that DT-defined mode will take 
precedence, if a duplicate mode-name is present in both "DT list" and 
the "pre-defined list".

We can add a duplicate check here, but would like the view of other 
reviewers on this.

thanks,
Shivendra
