Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE38A497B98
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409495; cv=none; b=UNSajR0wH9pFxkTG+voFQ1jNitYSxCxB8zsukM+qKKEHcUWw2MjUovQ83RAq9OM6RGUGyDpQhPmgL5cGGHq7ohJZHQdkGsmkEZVkIK0oqRRaOUl58HYbIpjSehLowEhWjua5gd+vUdyIznk90kR7o88kWcZAN7d37F2bU9DF+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409495; c=relaxed/simple;
	bh=QQYdtZD3+J7cXnwbnS2g9PaVOGFzg1wzb6Md4FFZoUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUOA5CrM5vLYUsHnHWDwScUvZVN2C+GRGCpq7yOgQhQHXM0b0aZhtBkYkUSSnxQlg28ISCz+8OKkzgBaaA0ZKGgJy/lBJhmGHxISRfhjLM7OrP0XLRfcvWh4dWGvthtek9knsWs1L4i5/h3T5M2onMKLGQdIMAYpMQFr5vVCrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pIVHT2Ep; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pIVHT2Ep"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=V26hn6RdtcapGyB1Q9qAVqrG5Fqfq9J1gaqGxp+1q+w=; b=pIVHT2Ep+LpSFgehssJGFbwPQx
	n5ugHjm2ebEQeYkuYKkV6gfrpW0KaNopeDqn7eEWZtS+o4Inos+9TM/Ew3wQG6ZyGeARc3AE+LGbJ
	5tR/0hWBRiH3lpc2gCcj0o8jkrMn6bHcn5Y9lV/21AMw/zVCDuDlIddvtfoEFD7WfGf7Uh0RmUZFM
	qhBPGHeNTcQvEAGCXLlVPKnkDd0iwgjLphnMhPiCyIeG1vyWN9L4glPaB30V1Hb9EsKbL6juV5AV0
	r/R3Ard185iCCuqvMmEIhy333bMogejlqBu5l7AqApq+WHOqH9GbpIqqOS3OfaC29aCb/VJjxoK+t
	20NfaQqg==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x6B9F-0021te-1b; Mon, 14 Sep 2026 20:11:21 +0200
Message-ID: <ff452f18-7f4f-4274-ad95-9937af972353@igalia.com>
Date: Mon, 14 Sep 2026 15:11:14 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>
 <20260818-idealistic-chivalrous-sawfish-08ddae@quoll>
 <3ab273be-e811-45e4-adf1-75532c840bc8@igalia.com>
 <1f4a0df1-97e0-48e7-bd08-6b31c8dcd0e9@broadcom.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <1f4a0df1-97e0-48e7-bd08-6b31c8dcd0e9@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/09/26 16:38, Florian Fainelli wrote:
> On 8/18/26 03:35, Maíra Canal wrote:
>> Hi Krzysztof,
>>
>> On 18/08/26 06:05, Krzysztof Kozlowski wrote:
>>> On Sun, Aug 16, 2026 at 11:05:41AM -0300, Maíra Canal wrote:
>>>> The BCM2835 PM block has exposed a reset line for the V3D block since
>>>> commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power 
>>>> domains
>>>
>>> This is a reset provider driver, so not really relevant here. Driver
>>> commit would be relevant if it was about consumer who implemented
>>> undocumented ABI. I suggest to drop reference to driver and instead
>>> describe the hardware.
>>
>> Ack.
>>
>>>
>>>> under a new binding."), which allows the GPU to be reset without
>>>> power-cycling its domain. Document it so that the vc4 driver can use 
>>>> it to
>>>> recover from a GPU hang.
>>>
>>> Does every device have it? Cygnus as well?
>>
>> I'm not familiar to the Cygnus hardware, only Raspberry Pi, so I'd
>> appreciate if one of the folks from Broadcom could help us with this
>> information.
>>
>> However, just like the power domain, I added this property as optional
>> to accommodate the fact that the current Cygnus DT doesn't expose any
>> power domain or reset controller.
> 
> I really don't know and have no visibility into these older chips, let's 
> assume they don't.

Considering Florian's feedback, what would you suggest, Krzysztof?
Should I document that not all devices have a reset line?

Best regards,
- Maíra
