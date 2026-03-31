Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7222B3D7D70
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 20:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774989582; cv=none; b=CByuSWOpdQX8UxxQDTOc5xaQd3Hu5f/sxXPKvRXGPjcEMkNNOQyuJBZ7fqZgRxeKE2zXjd64Tte9F8fqp17Gq07Oo4F6OnrvO+eQ12CF0rFhSKMwBA7Ya6lJF92sGhQaw6aWxsQCKT3Fqznk2C6qt5NyrlSa1SZg/Bi12tgvRnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774989582; c=relaxed/simple;
	bh=HP1NLiOIWXUdUXadhKy3DijqQs/PEm5plRHuOWWD/BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5eq3wKOPpj91TrQUGQ3vlSJubcpyxwOAcmCNG4QB6lgAmmIyDP/uo5a8DR0KzfMlfw2V6A+kPW7o/j+gMfvvsxhJsY7gxWfUA64FET566FcSV/KFgVSiWTsOj/qx0DnO8UE/hyGeeMubd4h1uGrM3VVp85IrrWkkoo3oHCpWKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CTRkJ3IM; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CTRkJ3IM"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12732165d1eso8507542c88.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774989581; x=1775594381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=;
        b=CTRkJ3IMN7i/XoRdB1K+rf2onpcDln3f0S4hMewFb693btI4RnAK98k6Cd1RtdwCS6
         T3adg85a+zsXFYbMMbxLhHrHsWdF5HN/9wbLJsTP3Q5Xyv+LXT0ei3yBnF2P7dy/MUxa
         sUtM/CCTUJKlUC8DRQwyEW8Lnbl1Ao81JtXVfv5EDwsBXLqWKP8+lhltkcPusl1hcwim
         4qMS9K/EFViUXRObHVm5qPhl4/iAvSDst3ixS/OUPoSmMItwPT0o7CiLhSvqaaxTu0P0
         HoOT1k1rhM7cYQiSHX0Urf4NGM/6EFfnh/wZ+UDqqeInr3BnFCBQnIJupRDDaCw6oQc1
         fguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774989581; x=1775594381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=;
        b=IBRO0jXbztvXvzANQccpMGJpbe4PmreLH4UYkECln/AO3UMK9DAlhd1xdw5FenEaPn
         5HwPHsoq6Q448wuwx8V4RGEcSwz+wcZ6GBqUnua8YekORwKnf1Ndc1pyvomfxS9FSbr4
         XugmefxTe9CAf3somncvKXPljkpL/FHyQix1Rff7CsDCTGvdPl4H911RXSHIvZo7Aysz
         kLVo4ds5pkUI7HDg8y5pE4RCerq2mBK27eT6F7VzcCPWyaxmBFqXkUYA83NDwTA/9yUR
         nAxbxT9ZYuJUlYPSxwDamnCdoerP0qmW8FU+GsSqj/d4ebTzegly8w0LBLlOspR+ZiGj
         gT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQupnnz31wuuDem7Hg4wHy7sMIWprlQyw7T5dwJwv34llSvr7oreXi9X2yHRYmN/NlGRPXLzeXwCQB@vger.kernel.org
X-Gm-Message-State: AOJu0YyWuRVzNJ7gcsKfAkCzEXI6WK/Qj7Rec635I8ADYzkMhNWIRZj7
	M8CB9eG1n0vhePKBZZl4LNoBAAho527aedapV88SHX95V0i2KB+mz3lE/gSFhnYbJQ==
X-Gm-Gg: ATEYQzy9iM1EF7w9LWW6VB8gWytOway+pNc1mKwnToVIk0pRX+GR5aD84++V93JmGUG
	AEu1U3VQ3JeOaUVq7e8LpOHKUMdfTfXR4XFSu4k19NptIt4PIt0u7BJgT67cTGIcgj5/tR0nohJ
	bCDaJc5upmsIetoasqvRaLhpwlgiQQLiKlw1e9WtJLi6hEI73ryp5MYCQFDfFbl2K2wvs+WTIu4
	q9xOqOlgkx7NU+LXDYhzyTmZwgAzsTwvfuomzl3FTumKe6iwrnQ2cED7jJVY/d+3QmGhovwg72+
	/yStsNYAL1sRitj8vjO9TGqG+vTUI6B2lT/5YATRKvyIPRlF02qvmZ2hyAP9DEELunocGcWIOLB
	AwluxfOgPS4NYYuMbsmzkwkmEjELPw/2lKZxjAXIF5aSuEg1cZksQx9eIf3ddKwykvVvSBsxILG
	OI9bwatoZalKj64LLkx2hBh30wiR/oiX+w0IDCaHdaQqdR8sp2a6FtLAFbBiCKlfZY+neYw4oe2
	rRrbrQB152K2w8NKzGfIotUJQ==
X-Received: by 2002:a05:7022:41aa:b0:128:d494:a1ab with SMTP id a92af1059eb24-12be649eb12mr512442c88.15.1774989578723;
        Tue, 31 Mar 2026 13:39:38 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:6a92:85c3:5cd5:d23d? ([2a00:79e0:2e7c:8:6a92:85c3:5cd5:d23d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm16792226c88.10.2026.03.31.13.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:39:38 -0700 (PDT)
Message-ID: <e5384261-7a9d-4c24-8387-6002268f5c1d@google.com>
Date: Tue, 31 Mar 2026 13:39:33 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260325-max77759-charger-v9-0-4486dd297adc@google.com>
 <20260325-max77759-charger-v9-3-4486dd297adc@google.com>
 <20260331123138.GE3795166@google.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260331123138.GE3795166@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lee,

On 3/31/26 5:31 AM, Lee Jones wrote:
> On Wed, 25 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:
>
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add register bitmasks for charger function.
>> In addition split the charger IRQs further such that each bit represents
>> an IRQ downstream of charger regmap irq chip. In addition populate the
>> ack_base to offload irq ack to the regmap irq chip framework.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>> ---
>>   drivers/mfd/max77759.c       |  95 ++++++++++++++++++++++---
>>   include/linux/mfd/max77759.h | 166 +++++++++++++++++++++++++++++++++++--------
>>   2 files changed, 222 insertions(+), 39 deletions(-)
>>
> [...]
>
>> +/*
>> + * enum max77759_chgr_chgin_dtls_status - Charger Input Status
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE:
>> + *     Charger input voltage (Vchgin) < Under Voltage Threshold (Vuvlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE: Vchgin > Vuvlo and
>> + *     Vchgin < (Battery Voltage (Vbatt) + system voltage (Vsys))
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE:
>> + *     Vchgin > Over Voltage threshold (Vovlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID:
>> + *     Vchgin > Vuvlo, Vchgin < Vovlo and Vchgin > (Vsys + Vbatt)
>> + */
> This comment is masquerading as a kernel-doc header, but isn't actually
> kernel-doc.  Either change the formatting or adapt the formatting to use
> /** and use W=1 to check it.
Thanks for pointing this out! I'll fix this in the next version and 
ensure it's a proper kernel-doc block.

BR,

Amit

>> +enum max77759_chgr_chgin_dtls_status {
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID,
>> +};
