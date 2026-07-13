Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C715733ADAF
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959331; cv=none; b=dSBzG0XCn/c5u0DEegcpRHQIuhIjokAYtFDoz8bFEAeNZDVPYdn1WiVef9v9YF+1ExEEgKzEq2qRBf2qnTJ6p/o/0QcNSCy5VCVbbzAv5uYsttIKie416/rmgF5yvS9UJ6pAnpmhhzLn3H9wlUi/LWxQxGSGKJZrcSnihL4Sbf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959331; c=relaxed/simple;
	bh=3FiHp2DLPHbLKf9nZlqaOddp600zsyxJUAaYcOn5hbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iwms3IVe46bbb6tQZuy4ukWf8WUh2wen1CYZz3kf2MEGF2Zj30kwQoSqa2ID2OflyJe9kjHo4e9O0q6z6JDYNdXIXalaRpwUJ1gfEnSMbgVCzHymS4/4L8YjKuqSfETW32nMtRdGRVqnWKHroYI/q9M2YVuLBw3Ph/KTJoWx3Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eHB0qf77; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eHB0qf77"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so2142032e0c.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959318; x=1784564118;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4myrzpcV5cUM4yz59ZTbnlSvPcHQdnJLHv+wrB4J8no=;
        b=NgM+aP0yzixgj7S5iTn+Co6Bsj3PJNcY6p8I1uuZbZ5JQWOSuUl0XF+dhwl0nvJ4Nv
         gn9fvEMUVCTRcRnVmTgOHb2GQDYQK70XaU3064i3Nz0I+5dEYhVnQ93QBchVwwyRR8m0
         yIQXojc633U1TjCDyMnlvEAqcTcHk2aS4+KuNpwRa1RFBoCMHFs/XxmNlDMy0NJXHscF
         ifKoRnkFIQ44JarU25LKN6QeiLeyj5ttzQcsNX5ZtkEPQK26jbXNrtYGehRCH4m6uCLh
         xYPChlMs/HtGhqOvZK6rhTwBjp240ont2/3u8mMKz6E5ACTkwC2qcBger1iKU8cEsruF
         DAxg==
X-Gm-Message-State: AOJu0YzV4JijiWpVCNd1ag3Pt0A1nnMXduvc9Wjf7NQ/ZBm9SYiprF3s
	4cG0IU7Nls1h5qJZffqPbspY4K1xm8ojO9g6Qy7NvSomWV2dimWlwIdOH40EWEYJB5vSP9zibPx
	XBk+Kh1danmwooOoJb5ewJCHLvpMmaRLxDVzr146bdCeuizCbt2duJg88iz8SpFzofhP/EXN2eo
	5PzKCbxG5qIOxKKflWM01MPRAis/boAijrGqaeGXtYpsNkArnuT6GL+JC5BRvTUy60pJJipZLis
	eo6dciBcvNuksqfRHUdLQ==
X-Gm-Gg: AfdE7cmH4FAq9a4rfVRyw8jwjafZLxC6k6vpk2Q3QwUnuSdKAfgdoWERRk3izGUvzbt
	9Ww/0nYHrsp2gIJhwbxjtzuCq6WSk/bZluKfzAsgryRZ8OeIsjoc2OfwEEhNK4AbQOrxdwQMeHJ
	xNO/Fp2f7UskhsEvuvGYJ9addtzvGIfdHX/1ZFCA2idlozd+u8KOZNlVOubTfP6YydtewnRyP17
	rzhpXzccW88rUImAVazGfJC4NzKyVL0fXmSUaPbORVEMLO3tbpNlBE10Cv7lHAA4e61x3ld8Y7m
	D98RdeetXQ5TE8V4T+3gumHFoU87rjYApumDEqV3Yohw3UJZbK5LzKSE4Oe3tNb7DzWAOG63rAJ
	PPFkjDXKuIkH4dwxWCnYrm7WIhf/9d5j5hqs5RJW4qlTiwjbWJ5/EsZg1zAgTm9HNPh1/EeAAvt
	E3XAeLuI1Z3i4Hh1BVQ0UxUoaG6cX+rt1ccCj1tPFNsAGGkgH4
X-Received: by 2002:a05:6122:2086:b0:5bd:b27c:bace with SMTP id 71dfb90a1353d-5bfbf3c04a7mr5492965e0c.14.1783959318427;
        Mon, 13 Jul 2026 09:15:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5bf6f8283c7sm1580877e0c.8.2026.07.13.09.15.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:15:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso2678344a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783959317; x=1784564117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4myrzpcV5cUM4yz59ZTbnlSvPcHQdnJLHv+wrB4J8no=;
        b=eHB0qf77HT+WuboSq4ZgSH2BDxFYosjBXknh/LbK3iyxhPgad69JC+Y8MuBmTXi7sz
         i13KRsZJx70pDLVvb3AHwrYT8OLj22v97E34WiKzm5Gn6Hm1c3v6RvqAE8S+6i+1XH+W
         Hq+fkEOBprAPHnOocaaTf2tcWXGQaoE+tWGcU=
X-Received: by 2002:a17:90b:4d8d:b0:387:e0bb:57fd with SMTP id 98e67ed59e1d1-38dc7ba2aa6mr8816597a91.36.1783959317075;
        Mon, 13 Jul 2026 09:15:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8d:b0:387:e0bb:57fd with SMTP id 98e67ed59e1d1-38dc7ba2aa6mr8816545a91.36.1783959316473;
        Mon, 13 Jul 2026 09:15:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm29475375eec.23.2026.07.13.09.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:15:15 -0700 (PDT)
Message-ID: <c131f3fa-1918-49ec-b083-11ceb03eb40e@broadcom.com>
Date: Mon, 13 Jul 2026 09:15:14 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Daniel Drake <dan@reactivated.net>, maz@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com,
 andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
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
In-Reply-To: <20260619204832.586079-1-dan@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 6/19/26 13:48, Daniel Drake wrote:
> Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to
> EL2 virtual timer when running VHE") causes boot to hang on
> Raspberry Pi 5. The newly-selected EL2 virtual timer does not generate
> any interrupts, even though the GIC_DIST_ENABLE_SET flag has been
> confirmed set via readback.
> 
> The reasons for this failure are unknown, however it is likely that
> this timer was never tested. Raspberry Pi's original devicetree did
> not include this timer interrupt; it was only introduced via a
> suggestion[1] made in code review as part of the upstreaming process.
> (Current RPi firmware versions do include this timer, but only because
> they rebased on top of the upstreamed devicetree starting with
> Linux 6.12)
> 
> Until more is known about this non-firing timer interrupt, remove
> the devicetree entry to enable RPi5 devices to boot.
> 
> [1] https://lore.kernel.org/all/12363be5b11c752b7155cc0c416fdfd2@kernel.org/
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
> Signed-off-by: Daniel Drake <dan@reactivated.net>

We know why now: the interrupt line was never connected in the first 
place as this was not identified as being a requirement *sigh*.

Can you amend your patch with that detail, re-submit and add a:

Fixes: faa3381267d0 ("arm64: dts: broadcom: Add minimal support for 
Raspberry Pi 5")

Thank you Daniel!
-- 
Florian
