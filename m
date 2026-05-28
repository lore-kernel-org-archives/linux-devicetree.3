Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4A2E2DDD
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779937533; cv=none; b=Rwbslwck3OU1mE93CK+7n8oN1AfiRLP4DQawTa6nqRVmnp9kxD7PdMQlMRBgh4aM0PbyuRU/O0B573RGSeKgih5HXsrK11ga/n+dwyPgGe3+gWsbzR51Es9oX87YgEPSIr42LwVoOKdRbZI4xxNTLfWlv5NkGQPewxb1SD9yi/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779937533; c=relaxed/simple;
	bh=A3f4Q2Sld0W2xjtP4UNC1GwvsA1zuj4TCDEiKmnl92A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jeethMykKVchf84rRv9mc3H7iH01SScI0gUb/wHiEK4z4X4WRX+dVz2WT5xeuFFxn4vaDE5+vbFgcYR1Y1/pNZX2Opi9PFGVjO02bY3dqXP3mwRuzhg/q+7bApYIgtjuwipuMgMTCGfPK6dw7P1rTTV2K0vMksvbZdir/FZOFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4DITR6J; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4DITR6J"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304997cdb21so4796384eec.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779937531; x=1780542331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7M+KKNYPRc5CJ7Ei7/rAcbZC79wITZmeumvXSLTz6w=;
        b=h4DITR6JOjFcLRlOozshnletkobldGYmXbmQGiMNFzQTxn25hm1yyhpqjbDLphDmpj
         MuZdv6JFJWJMAWKnWWtkqMcJVff7x0kgWkLu5loMP7XDgFi5IbZ3l/xh/R6ioTueRW5n
         CxkN1lQ0v9h+dwO1C6NZ9alGDFCaKdw3H8JEXX0o6p6UuQoZpViJeSD9Gt7yW2rAqBVz
         qktcSd0yssuG7D9QEIE+Uc9+0Mgzyma/2DQpcdDXo0TZahb9CIFW4KN+ak45v3waHNFh
         C9uCFxjeOvBVvaRTbnuT/3TkesendNNKEqRJp3PQ8Spp3nqe1gHmXmHJm0+7G9vrT7+e
         kVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779937531; x=1780542331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7M+KKNYPRc5CJ7Ei7/rAcbZC79wITZmeumvXSLTz6w=;
        b=EFHzVKOk3XHX9CFEFWoUzNLOFqf5ASut7vGfAVUhX76dd7uoJOwsHx3ZVNAlUR8n3L
         8XRDpTuZtc8jaJLqmBWAHv6RrN40qrCzppCiiz8BMrr2jiDxjo2wWy+7YVchUhMARhRU
         4z7m6XQL4eRK0B1T38S8ypEZfKP7B3WwGQHep6Z87RWCNr8VVCSnvxG+5A0T6OsdC+a3
         fbmWpeCsQJ8t5yUHJV/QJdlJ1vbrNBR9IXwqI4DMJ2ynhSmKO9DRxMjDwoY/2+vKCDWA
         H8T7BMfKvxkmgz9QuWNoC1jFHwtMmr2e+wNvqUxlMTUIkJ6dFcFtXseRyxkZ08Q7LSRs
         FQfw==
X-Forwarded-Encrypted: i=1; AFNElJ+kq23BvKanWKip97Vz7jQVtb6s+Bdfyv2vECDdRj/efaXP1bbe5PAKBZdmVqpM16/ko/jvI4m5sdL4@vger.kernel.org
X-Gm-Message-State: AOJu0YzZPQYmtP3mDuiFwK+7H3Idy+n/+f0WHnk3yJNi8ResP8x00tmy
	oiza9rMzTC0KrWVuNvjWBnCdMrCDIkbpQbF/2TMpTh2WyTet3ZWRiZOU
X-Gm-Gg: Acq92OGZTw4jmk1Rfkuzt3yMPCBrq6MzdHH3pyD2S1B6Hff4hTxeq+yEAUvjMQfdM1x
	aQK9s6950sf6fHVUqy3krpgbetl9jBHwFifSMPVfO+OsUHohYz7b83WCJ+hjGH8mixPHxS/z80E
	lr17p5mcSUp1Z8uiGf6kX4Znk+laf8MqvYgMRvTzZKh4FFup/w/5wtIBroqMqO1vj0Y/h9f/zJm
	9q2ckWygcqd8O3TXO1tue/qzd8Wb/qExkRiUptCALLBZG8vAMkyFOLHpFIyhc5uJB2tCg1XowQK
	Z4slAaltaKlTveswo7CtXejIMKS9LxViSoLHDqE5Qj48wrIc8fWj+iTpScQ4XF35ImOwy8P79Oh
	Yp8HqnPzYpEy6n8faDuhpP097qtl7n20k7l/JlTETlD7yS6bKUO5I+a0O1tLnZBCzoGn09hXe48
	3PfQ1TlHnxSw1VKulGUE03YapAMU8IhJ3rubbSLLuJ3T44PlKjmjRGdvotXrmDnUJ0uVWA8qyeK
	cc9dFLMmn/moHtmIbzRDERnYvw=
X-Received: by 2002:a05:7300:134a:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-30449184a7amr11069090eec.19.1779937530712;
        Wed, 27 May 2026 20:05:30 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045225b7b6sm19413264eec.25.2026.05.27.20.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 20:05:30 -0700 (PDT)
Message-ID: <6e3b1279-61c8-4bc5-9f66-e437140d3074@gmail.com>
Date: Wed, 27 May 2026 20:05:29 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
 <1bf1558f-19b8-4052-9609-52039f820bbb@oss.qualcomm.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <1bf1558f-19b8-4052-9609-52039f820bbb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +	.seq = { 0x03, 0x0F, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
>> +		0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },
> I can't see these values anywhere downstream

Hello Konrad,


The .seq values concatenate spm_wfi_cmd_sequence + 
spm_power_collapse_without_rpm:
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3265-L3285

These are passed via msm_spm_boot_cpu_seq_list into msm_spm_data[].modes:
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3303-L3369

msm_spm_data is passed to msm_spm_init():
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L5510

Which calls msm_spm_dev_init() per CPU:
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/spm_devices.c#L221-L239

That writes each mode's .cmd sequentially into SAW2 memory, bumping offset:
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/spm_devices.c#L148-L162

The upstream .seq is the same thing pre-concatenated. 
spm_retention_cmd_sequence and spm_power_collapse_with_rpm are omitted 
because no upstream platform uses PM_SLEEP_MODE_RET or PM_SLEEP_MODE_PC:
https://github.com/torvalds/linux/blob/v7.0/drivers/soc/qcom/spm.c#L134-L249


Thanks,

Rudraksha

>
> Konrad
