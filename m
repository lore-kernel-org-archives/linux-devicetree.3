Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D640D596
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 20:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782072198; cv=none; b=UGjv7pbYOtqA7itXBVB+SNIHgSr/C8E1GITBJ2OrtEeuNlOhQw6Qm6NA//eENxMqeXJdwBkAf1EU/bSKIcMVels8wvLHJxKkrY/9YdT5DvP62RpyOibc5roc0vGFJ8nHvv6imyjAKCuKAFyeUeWs3oTsFM4jvPz3gu2rnV2loRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782072198; c=relaxed/simple;
	bh=ba5VjsVrTZab134SMa4yGqO7js1fxFOz6M5exQMcIxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWcRhKrBt2aVn+NJS0uauLR2MhKm1Vljx1MPmEKgm/0v4dkimvme2Vag1ww9zBPAZ52ntL4e1FjPph8f7BDX5l069m5jgw35JGUXC1c95ny3sP7hnE383jOCWXhtV8C4b9gOJzLMQkScnw0xwhF+iC6JdaBh6zIL4aB5XHrvE7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=L5nzbZUo; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="L5nzbZUo"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-6cd01f6c11aso1236618137.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782072196; x=1782676996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFedfW1nrd9LLLC/eei09ZbrjgG2pkrICFzK2gctJpQ=;
        b=XGw5zi8D2MxvWJIXzAp3aUB4b2KPMl1vsFK45LVhfm4zFNXUF/mtQ6hKj3RejSpbPL
         AmN5I8V1TZ6qbI823y2QQoA1iHmse6DB1gbQUohKqH6J4OqrcctOb1JKORVSoL2q+PWa
         GXhDFuzYhmjBQtFAne9lvyymkqLhvEzUg1SIo3PYmu0yHaFK7g66HTzazuQcVaZEifBS
         i/E0zVCMUnLBhKObZ1sLvhOJ5meCIXVsT+rOtM0JEX2qRhxt3dpATRZacvI/DIZGHaV4
         sSJKVgmcy2lHd6Z9t2fIWjTbvNesYTYSZrJWW2W8bI0epvxHoD5dS+k7mqBA1CZxkzk1
         8GoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rNpVb7SyJ1L5kQREeIXQv77c91U9rEIvtQ8+tfekn5+qlN0JDgb94fYdLtVe+shcN21dnIBEBwuAn@vger.kernel.org
X-Gm-Message-State: AOJu0YzJOW+hNlQok6VgDvwweSqBbpbOaXXZ0XZx3qK+EEt257QR/ExD
	eO8bEXT2iZxzj5F3Iw3RxS3zvzXx1SnnPXoo4qMpD3lf/bG80sFc5lWCVkjHzCVN7F49MlkGJeP
	W0IfgRUY3gatW16nnN2QLGNmTyAcX8o/wPMOjdykX6tQ2CSpNQUBN8FtemL8lkpCprZ5kg/r51M
	4wxi6QfQE5S8kIZMvRDBkfP3qrYtlWX78OiuZe75yi3itGlAGl386VXAy8bkoT7A7JNSmRwNrQX
	C7Xei2euCJmh+QjJtfV8GVK
X-Gm-Gg: AfdE7cluogs3YoSmG0ruG2UV2+SM/qeFtyD+f+hp98/Ezjtj9G4nUrMpCmFk9MJwHWm
	cWb8bqsQHuQtDLJoLpXkCxztpmO6TZvGRk8YMHkL4EnUFZTeUMpkksvGGabId20nsEAC4GXrx78
	wZsSYnZBSlGYFB+AymdbUc30Ds8Ojc26tPtdaC8uOvV7kpSvPvuvI0SKmecMX/0PhFqMdmv5sFH
	gcyvlc7tqSRfSjXWtWiWMwop22zkEXSsy13cYInPsElCU6JzZGMqxSWvgvXsyPC3sKbkKaUvWJT
	7gjtsEy1VMlSKISXiBHSaGzyOVFmcWhL5Kew2EBDWyor/17VbAE976im90Hk91DjCh1aGdQp7pP
	HdLSzh/vCheZr7dwJn5lWNUzUDEZUzJBnaUmJ3V7Cne71bngDMK3ZJ5qHrihtSdZtR33vEOiyZ7
	Ws6HYlvH8F1KdAUYD0KfXlwcd8pnnlbB09sYMLWw/Du+4xeGGEdY8=
X-Received: by 2002:a05:6102:1622:b0:728:4383:c831 with SMTP id ada2fe7eead31-72a1d634920mr5647891137.10.1782072196285;
        Sun, 21 Jun 2026 13:03:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-72ba1876855sm500991137.4.2026.06.21.13.03.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jun 2026 13:03:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49244130073so11952825e9.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782072194; x=1782676994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hFedfW1nrd9LLLC/eei09ZbrjgG2pkrICFzK2gctJpQ=;
        b=L5nzbZUoNJq0LUdDUaXVmZjUE0bRPxTUm4cSlTNun+XGY58Fmy0vLxEhtIt+4QdAca
         RNblrj6B/L7wDwapt/aAFJb0pKUZZhAU2ztiM/1VYHIjIqHOlfTyXvOZ2/Mgp9RFq6vZ
         5yhdOiL0XP9ZTHLxHcDtWLwD+XMXfmE35OuRE=
X-Forwarded-Encrypted: i=1; AFNElJ89ROjpnf3mnWN6v8sfjS++FXusaff4PsJhoDa/OXfSmVlnSTI28HqTOSrlUOhuFZ5HxsC0fs/tLqPy@vger.kernel.org
X-Received: by 2002:a05:600c:4f43:b0:491:89c2:5aca with SMTP id 5b1f17b1804b1-49242592576mr160876355e9.30.1782072194205;
        Sun, 21 Jun 2026 13:03:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4f43:b0:491:89c2:5aca with SMTP id 5b1f17b1804b1-49242592576mr160876045e9.30.1782072193724;
        Sun, 21 Jun 2026 13:03:13 -0700 (PDT)
Received: from [10.225.97.41] (aerospot-mask5-183-2-inet.hub-one.net. [149.232.183.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924594f8fasm148093855e9.0.2026.06.21.13.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 13:03:13 -0700 (PDT)
Message-ID: <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
Date: Sun, 21 Jun 2026 21:03:03 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Marc Zyngier <maz@kernel.org>, Daniel Drake <dan@reactivated.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com, andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
 <878q898ulx.wl-maz@kernel.org>
Content-Language: en-US
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
In-Reply-To: <878q898ulx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 6/20/2026 9:49 AM, Marc Zyngier wrote:
> Hi Daniel,
> 
> Thanks for posting this.
> 
> On Fri, 19 Jun 2026 21:48:32 +0100,
> Daniel Drake <dan@reactivated.net> wrote:
>>
>> Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to
>> EL2 virtual timer when running VHE") causes boot to hang on
>> Raspberry Pi 5. The newly-selected EL2 virtual timer does not generate
>> any interrupts, even though the GIC_DIST_ENABLE_SET flag has been
>> confirmed set via readback.
>>
>> The reasons for this failure are unknown, however it is likely that
>> this timer was never tested. Raspberry Pi's original devicetree did
> 
> The timer is part of the CPU, and there are enough A76 implementations
> around to prove that it actually works. The same can be said for the
> GIC400 this is (supposedly) attached to.
 > >> not include this timer interrupt; it was only introduced via a
>> suggestion[1] made in code review as part of the upstreaming process.
>> (Current RPi firmware versions do include this timer, but only because
>> they rebased on top of the upstreamed devicetree starting with
>> Linux 6.12)
>>
>> Until more is known about this non-firing timer interrupt, remove
>> the devicetree entry to enable RPi5 devices to boot.
> 
> I'd like to understand the reason why the timer interrupt isn't being
> delivered *before* we paper over it, and not the other way
> around. Each of the CPUs definitely have an EL2 virtual timer, the GIC
> has a per-CPU interrupt, but somehow the two don't seem to be linked.
> 
> Since DT is supposed to describe the HW, I'd expect someone from
> Broadcom or RPi to shine a light on this issue. Integration mistakes
> happen, and we work around them (see the handful of Samsung SoCs where
> the timer interrupt was simply not wired). But we absolutely need to
> know what we are dealing with beforehand.
> 
> Finally, just hacking the DT is not enough. Assuming that the timer is
> indeed unusable, we need to cope with the fact that there are DTs
> describing it in the wild, as nobody should be forced to upgrade their
> DT in lockstep with the kernel. For that, you'd also need something
> like the patch below (untested, and in need of a proper commit
> message, which I expect the SoC vendor to provide).

Daniel, do you happen to know which 2712 SoC revision you have, whether 
this is a C0 or D0 stepping?

We have an internal bug tracker item pertaining exactly to the virtual 
timer interrupt connection however it affected a sister chip (77122) and 
not 2712 AFAICT, now checking with the design team whether the same 
happened on 2712.

Thanks!
-- 
Florian

