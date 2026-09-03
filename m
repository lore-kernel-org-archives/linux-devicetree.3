Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77876503BDA
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464348; cv=none; b=p84YMAypKpOhd8LH/LgGYHXnOdgkz/mALwR+0cTxpRXmB9EcBl6Z8gg6PjEQyGC2wREJWdFYFZa/9G2Mzq7B+B7fppEmk6u/lgLJ+WpqHuiij+QCrkCNfKGzDckY8XemEU1n7XNYMUWAEh/TK9lzT5DlgmNSlNhtCjdG3NYMjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464348; c=relaxed/simple;
	bh=uMPzQlZoWiQ7BjBIylcjQ7wrcTIdyU5CmvZNTVMatKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTZcPOlC6y336exf9i3xk9T+ynMfK/JHGXWeS9hW9x2ifv72hiRzZoazqsTHK4t/cM3ZMnavI5R1CNdygbWAnF9VA/wn/3obZYGa1RBz4ql/lu8/fHdoQ61lsYscLi3f2OeBl9m41cVDMZ1QCw2UlMk3r9SSvwZ06OWbjbOWM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hNLcKXx9; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hNLcKXx9"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8541875f596so116898b3a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464329; x=1789069129;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=brNSF6ql5aevmqbGax3CboePf220/VniLivOauNNsPk=;
        b=GwQUYiInoR8GwyNoRolCanFKMzX0zLrjYKs/7hn3ZpGKMpBkY8QsvNVcWDGfHc5rGD
         vRP2ZvvlbGt49hIY1CdD165WiO1Drs9tshyyhGxIF3lnOePxrKXSyP94YX1ICnn6y6vz
         ZKaLPAUcbub+fNLvpOGfjRJcx6LwNTBKUhNqCOTbMLuqkddqU8JDX284XLIKmn/XgVKZ
         HqKNeCe3jaKSJQ2P+HFVh/eFlU1qAgQiiY5hWCBEsWJFdLy710wkUwmnu6/GH+WLK1jT
         a1aVbu61ZxMopqZ3jOVF95e3VDrR2aTDkacC+kKK40Lw74d9tc0MvA7nllSNlsOcuhYP
         /Q4A==
X-Forwarded-Encrypted: i=1; AKwUvBzw5FG7rS+RL57f/106SDKFkpEMcvW2C8PYbtFexz1xAnQwje4GXZ399oVEoqXzfllS8H4kR1K19u+g@vger.kernel.org
X-Gm-Message-State: AFuF++mvoE5S4Tv0dSBF92NUFYHjY1W6jOKRqn85ODDn6mU3Vm7xhnJC
	HHTWUpYnYjWN0+fKxM2dMDC12nqIw3IyepkRiuqmBZr/mFK9MoUYqbJV0yk7yYMqU14d0QJ509z
	4OP9woqoIgAQOe5Nwonjl6y6ZPFcUY9mcgY2ynAf3SbzDz7CyfIddSwZ3VEWB7vAESXYNsr8oQl
	fDkTNwLx8309E2NsPK46XyOoP9Ihz/P/VC4kaeakVxzPkOS5iT5HBBafPJvuNAjrs9//Dk3RNOx
	5tFHe0Vqk0t4XpTsA7uMg==
X-Gm-Gg: AYBFou17hVHoXsGSsD3xBef3r/5zvfMPamtwhONljAGWGWRw1oGYFgmlr5TTWTnhzbu
	rjhpP85zGJ7t1A5y2+6sw+NJXLUDt1Fq2PKC2kl8OYU6Fkbmjhlb1weAKzoB0MaAe8jQnJXZE7C
	w/9eL13U7oTmN+2EQ0BmAVDp41+nuFq9gjlZl30wf9aEv/pkF+hvni62rcc7VaNGGWoTLxRtbb0
	wm//Nm3JpY837hWPlumM5IAodFh65MwmkTL1Vtdd26u/gKTaBkcHVwxQg4YNiAXd++owRL5awLc
	Fi14Ph2LaDXutObNdJTwZ+ejX6DFlowiUGAf6+I8vHMTxTfmuenp/bHRKkRy5wmHM5m16y3PJQs
	lZUnE6+NF6v1TT3TGKlizWWzIWhF9cxxAuuujV6GfG29aI5ojBhMjssdf9M2cEmvvCrhwwUZl+N
	xzB+wsgkfFfXKhdbsdDC9au+6+3qoLoVBNlcOJHMUq
X-Received: by 2002:a05:6a00:98b:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-86169c71e5cmr1405640b3a.10.1788464328755;
        Thu, 03 Sep 2026 12:38:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86150e4613asm204312b3a.6.2026.09.03.12.38.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:38:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce64c41efso8276481cf.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788464327; x=1789069127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brNSF6ql5aevmqbGax3CboePf220/VniLivOauNNsPk=;
        b=hNLcKXx9T/NDRxHQzcnW2grhPS+RRMsmUUkcRNwdN0IvtgeyL9E1mJCfu0wOzfkN4O
         vEFk7panFfVa1SylPAX1WOe+eJuyk80DvkkpM3rV8uu8b8E05G0f3Fvqd0eUB0o0GEtJ
         gH/i4QkfVBBlvrpIsZU9OVqb5Wcq+f/x61phs=
X-Forwarded-Encrypted: i=1; AKwUvBzBe3ldsajWwQLHXf/OnvdPDcNTLuB6Hqw1HVFjzDCKMo2jsvmP8hteoe5tP2mxyoFUi5OBrv3im8Uz@vger.kernel.org
X-Received: by 2002:a05:622a:2505:b0:519:f884:b587 with SMTP id d75a77b69052e-53054961822mr14588881cf.27.1788464325204;
        Thu, 03 Sep 2026 12:38:45 -0700 (PDT)
X-Received: by 2002:a05:622a:2505:b0:519:f884:b587 with SMTP id d75a77b69052e-53054961822mr14588241cf.27.1788464324657;
        Thu, 03 Sep 2026 12:38:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541eab6csm5221631cf.26.2026.09.03.12.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:38:44 -0700 (PDT)
Message-ID: <1f4a0df1-97e0-48e7-bd08-6b31c8dcd0e9@broadcom.com>
Date: Thu, 3 Sep 2026 12:38:40 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
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
In-Reply-To: <3ab273be-e811-45e4-adf1-75532c840bc8@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/18/26 03:35, Maíra Canal wrote:
> Hi Krzysztof,
> 
> On 18/08/26 06:05, Krzysztof Kozlowski wrote:
>> On Sun, Aug 16, 2026 at 11:05:41AM -0300, Maíra Canal wrote:
>>> The BCM2835 PM block has exposed a reset line for the V3D block since
>>> commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power 
>>> domains
>>
>> This is a reset provider driver, so not really relevant here. Driver
>> commit would be relevant if it was about consumer who implemented
>> undocumented ABI. I suggest to drop reference to driver and instead
>> describe the hardware.
> 
> Ack.
> 
>>
>>> under a new binding."), which allows the GPU to be reset without
>>> power-cycling its domain. Document it so that the vc4 driver can use 
>>> it to
>>> recover from a GPU hang.
>>
>> Does every device have it? Cygnus as well?
> 
> I'm not familiar to the Cygnus hardware, only Raspberry Pi, so I'd
> appreciate if one of the folks from Broadcom could help us with this
> information.
> 
> However, just like the power domain, I added this property as optional
> to accommodate the fact that the current Cygnus DT doesn't expose any
> power domain or reset controller.

I really don't know and have no visibility into these older chips, let's 
assume they don't.
-- 
Florian
