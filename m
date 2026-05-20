Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA132D7C7
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319910; cv=none; b=Q4+yCUqtAU3FUimgbfawCHJXleWHiIa/xvk4WN65UqbBn8b6GFtVn7KTk9xB2doKnOLfSpd0Q7mfFAhhEe8/dKMdAULxKwrNx9Zxh7UX0+7qDDAdEQRSaxJk9gj+kgRC2zpkYuGcRlZEoeTW8ezMuWFStw9parmFjOcHsN7VKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319910; c=relaxed/simple;
	bh=GCdwdd8L4QYKV9g8Pk5TlKPm1MpJ1P+LBWi8O0BSLsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yjl+MGb6DMWgLQH0EVriQ8P0m/PY+hcNuZ4J9PUVQwP4topcPA7rAZU2Hr1FUeu0T7NJANl7ROJDwTrrrQorgKL10rJfKg57apCabvsFg2ohP8n7j/Kq1vv9o6RqAduBI6IukM37mLZGQeGk6x0Tpfj4+DfYUemGdfQNWcr2Hbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RPeE01F+; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RPeE01F+"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-367d88b9940so3550653a91.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779319909; x=1779924709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nvICw2ZiPKqUfY+3rSfqzqLBbnkDQZGCcIY6G6UcS6g=;
        b=m/h0j9rgTjxzBIyS7mIBnXrw7obOt087K1cb7+TFDpZbwWqPTAkho2GRy22ThWJBRT
         oYrkWy2RUmUHBn+t0pYNxGWHEaAfxP0haYKfGz2Xg+uN7Vb7lIn+fXjFYWnKhzTW2BDx
         vq0OjiIbc78riYru4Kg3oSk8/UpIlnMa7sgnvbLEdBwju55L0x8ephu86NrpI+xyZU3A
         msYzY+mdB5LqsQkPLVwQj6jr/ajwYshduSLVSlP1e1M4zgM60B1J+ziKipXjQCdsOPc1
         2d17QrgZ/9OnN/YvGWkwBp3n8xMAes0HIfe995geMtJGpZymwRkoeBZVte/3V7xCwhq9
         3xwg==
X-Forwarded-Encrypted: i=1; AFNElJ9LecgWOyH5GZn3yhGEFEZiD6QKSrEoM+GtDPfUcJMILfdCjbRghjfO0Cqe8Hz/iq+CVuJo7RisWtgG@vger.kernel.org
X-Gm-Message-State: AOJu0YyL84PEjMaMUH+f5oSVW/aDSSLV/KvOy4wTHW9BB5UTOiOkp67D
	63rzjf6/en0BKIGaon6JIn+zt2VJax6D1MLhVo1bwzLV02Sdw7HVVHpUdVj8Fy/E0cee9iK7oAh
	8xuoH4CbnAmpfiOSSeipoTVJ5wH4kWjIDNWxPstDxHDsMAqXYE1wE2lCSx5ALcPooqr2Kdo+z/P
	MlnLi9GLuGvZJMd5xK8rP1ueGSIix4ku/PHpYhK0k8t0U4cSspfCjZ+f61GJHbiMIiIiKc7Wfuz
	modzRWELKimNI7ZPWVXpA==
X-Gm-Gg: Acq92OGqRzigdTCzqesLkaSHR2rGbg+NGC4Bc4cVK+M8vMc2o7jt+ODkSdOJgSXS/Si
	Ebms66QhYK9/hz1nZ5il3/Hn77eYeSXh3e52z6GRBoOmaAaSWryNJAcdsRShq08z1XPlpPZR8Mb
	jH7j+pFg59UxHjjMkfNKKPaucyDbvIk3whutrhfHyT946yxUZap/jPkt7qAgdS0tmSPjAHpFlbl
	9qQFHBGqx1XwUoo1W6Z5Cukx1XsBQX27mXdJntJBjOeGJMz0Pw63UBtAs/hoxwwLb/6Leckz7pe
	C6gGq2WJ7ZS+cXbRPbkiRojmvYC0wBs+8gkGK+Wv+SN8HWTT3QXJXLOByQNJ3r3Rtdf6SdRIIOe
	TwAPKa84HFYMHVkh3Xw6Kug/GuLVeeHMDMitxBjHL7U3uwB9rQQboYA+HImXmcDNnEHkTzu4wCL
	qIAGhfka1QvvF7RjkkNObs1Sb8yb4hkr9a98ueYNBQKsryncW0hmSJgvl9hP/eqGne
X-Received: by 2002:a17:90b:1fc5:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-36a451497d3mr463029a91.9.1779319908647;
        Wed, 20 May 2026 16:31:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c82bb093521sm1488811a12.3.2026.05.20.16.31.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2026 16:31:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f2d983d109so879120eec.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779319906; x=1779924706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nvICw2ZiPKqUfY+3rSfqzqLBbnkDQZGCcIY6G6UcS6g=;
        b=RPeE01F+1f2p8F7+1v5vGonpjuZ+20Hu5T39tmMQgB6pJOW/I/fR7AtfCqES1AnWcx
         GerQcMQZ2jimA2bJcJYD1nmZr9MJOeKinaEJKEZH7ScEWPQXxa4hWu8t5OXH2KFig+V0
         zzvm28WJJuPoAXOCPJV31Oa1KusyRB8z5AK0c=
X-Forwarded-Encrypted: i=1; AFNElJ++d3JdWqO04nKqx+bM+OOMBWdid/BjZHCJwZw+VfyOzDbSJfwVZ5tBTnbaneP8jECNGBXiIWlqaxNE@vger.kernel.org
X-Received: by 2002:a05:7300:ef89:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3042f439717mr408632eec.3.1779319905742;
        Wed, 20 May 2026 16:31:45 -0700 (PDT)
X-Received: by 2002:a05:7300:ef89:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3042f439717mr408577eec.3.1779319904722;
        Wed, 20 May 2026 16:31:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea6dsm20241408eec.4.2026.05.20.16.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 16:31:44 -0700 (PDT)
Message-ID: <394b5e02-1aa6-4efe-a5f7-4468d1f82172@broadcom.com>
Date: Wed, 20 May 2026 16:31:42 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add RP1 PWM controller support
To: Andrea della Porta <andrea.porta@suse.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
References: <cover.1776932336.git.andrea.porta@suse.com>
 <af2bsEdAhYY9c4rb@apocalypse>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <af2bsEdAhYY9c4rb@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 5/8/26 01:15, Andrea della Porta wrote:
> Hi Uwe,
> 
> On 10:30 Thu 23 Apr     , Andrea della Porta wrote:
>> This patchset adds support for the PWM controller found on the
>> Raspberry Pi RP1 southbridge. This is necessary to operate the
>> cooling fan connected to one of the PWM channels.
>>
>> The tachometer pin for the fan speed is managed by the firmware
>> running on the RP1's M-core. It uses the PHASE2 register
>> to report the RPM, which is then exported by this driver via
>> syscon registers. A subsequent patch will add a new device
>> and driver to read the RPM and export this value via hwmon.
>>   
>> Subsequent patches will also add the CPU thermal zone, which
>> acts as a consumer of the PWM device.
>>
>> Best regards,
>> Andrea
>>
>> CHANGES in V3:
>>
>> - Refactored all the register macros. They now have RP1_PWM_ prefix
>>    and follow the register name.
>> - Dropped the tab alignment in front of struct declarations (use a space
>>    instead).
>> - Added a check in tohw() to test (and bail out quickly) in case that
>>    period_length_ns is zero.
>> - Probing now returns an error if clk_rate > 1 GHz.
>> - Added a check on minimum period ticks. Return 1 to signal round-up.
>> - Fixed inverted polarity detection on edge cases.
>> - Fixed rounding errors (in both tohwi() and fromhw()) in inverted
>>    polarity calculations.
>> - Dropped a redundant check on period >= duty.
>> - Replaced memset by inline struct init.
>> - Disabling a channel now is faster, skipping the duty/period/polarity
>>    setup.
>> - Fixed an error string (s/Fail/Failed)
>> - Used %pe to signal error string instead of an integer.
>> - Added several new sections to the Limitations paragraph to better
>>    explain what will happen on edge cases.
>> - Maximum period is now U32_MAX-1 to allow 100% duty cycle on all
>>    selectable periods.
>> - The hw period register now takes into account for the extra tick at
>>    the end of the period (subtracted one to wfhw->period_ticks in tohw
>>    and added 1 in fromhw).
>> - Added .remove() callback to free resources even if the driver is
>>    not unbindable/unloadable, to avoid accumulating tech debt.
>>
>>
>> Naushir Patuck (2):
>>    dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
>>    pwm: rp1: Add RP1 PWM controller driver
>>
>> Stanimir Varbanov (1):
>>    arm64: dts: broadcom: rpi-5: Add RP1 PWM node
>>
>>   .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
>>   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
>>   arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |  10 +
>>   drivers/pwm/Kconfig                           |   9 +
>>   drivers/pwm/Makefile                          |   1 +
>>   drivers/pwm/pwm-rp1.c                         | 414 ++++++++++++++++++
>>   6 files changed, 500 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
>>   create mode 100644 drivers/pwm/pwm-rp1.c
>>
>> -- 
>> 2.35.3
>>
> 
> A gentle reminder about this patchset :)

Hi Uwe,

I would prefer to take the DTS changes through the Broadcom ARM SoC tree 
to minimize conflicts on my end, are you going to take the PWM patches 
for 7.2? Thanks!
-- 
Florian
