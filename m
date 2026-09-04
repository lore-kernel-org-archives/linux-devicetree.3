Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEE443E2E
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 22:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561095; cv=none; b=p9U9yf1AE6oZwZTmtQ8irQvW7Y+wBfDXuE327yLUpmLRLbrEqLG/8jHEZU1m5i+pSMNpFxmtYOoK9Hv4TExWdPluKnX/aDjCFf9KX0OnTky+Cu9pH/Y3T0uE6tamNFyhUScpfIBCokcFX3TNdWGpGv+kgTwsESeftSrf4gweBF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561095; c=relaxed/simple;
	bh=Qy/rrlsC2pBGv8adU6DP3A1uoqHQiz3kyPblKRNTvvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EuTSGSxeNZgqKXPnUh8iO/GWR9kA3tNe1XKKQKSx/KnvJvAofAPl1/tBkJ8PsM/IHPvZ0tlvjoGMeBhrdRwNwiD8PdhW7MPViucWq9Lc0XCBr4WcyZ/O516M7cjXVnbD+pp6Yt5aL+k/gn6bV+mB5qaom4ka00pCwSWvjx+C42I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=J4NBHowH; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="J4NBHowH"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso1644909a91.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 15:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788561093; x=1789165893;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X+ezEGSoxt4OIMmPGd47wsxyvlI7VYsc+xC/7giRRKU=;
        b=rCFfw0lBcvDjwtMyfpzeavbAGMZJDqAo3wzMqTKct4aSz6qYHkfw0IOb6lGEBumEGz
         wTL8d3j9sKYbWSVm/vpq2CPwzwHZPj0tZzNiyc9SSgH+MtPZzlVJ+XqpHJBWE11s24eM
         bGXUraz/nhTgkBsEC71jkrdI1mN1I8qCNc7tHdtI8197dAueUvF0wNHxK7u3LkN2UTkD
         Cwg1yXLuaQtDcOjYJK7AWVwec0kVlVlFg8pm7idoKQGgfzVQhv8LSl/wLjQCK/eBd6V+
         TTNXiHQ20tw0NU247eehsrDAWVMTPcay6Qj1hFJVrVZr5MTJlLXVGXIDyjG9hJQXYD5W
         oDEw==
X-Forwarded-Encrypted: i=1; AKwUvBxjcDQm2vjavcpHOQJHqP7npXpfMPjlxfZwu1KZaRuw+kxuUNfNY1+/9RCoow8QgPEFHlyl/TarESe4@vger.kernel.org
X-Gm-Message-State: AFuF++nnXGjulYWCv6GQ1mHebmyTNumJUJcj/CkzUeMFGYVDF3o7o+8k
	JNJ6MHOlWjOop1CjANXs0kPFKH16sInErSxsoR40B+lBhHURKqmmUTaWhhnCSdabTq8JPoHAN/e
	FWGzXgi6o22h/jkzfyNmbzQVkadsY6A4ujkYtpZ3O/WwEsxgA78t4gmwUMqwnb5O36wHDUlFlzf
	vII+2LMWHoCaQd1aerUw8H4LYBIFpXwbrcJJg3kqSlV39xdxjBbp4xQW/fynfS+EeYsiF43w5rj
	Z4p+ZjpVvQucZFRvR0bnA==
X-Gm-Gg: AYBFou1jLzxXwAHdyuTwqkalKGq5k+2p4amQxcNPgzIFrY362k71FT6gst7TiPiT7NP
	gv+w9Syot5gmlhuPzHon1UaMGnz/P943n+f7o2/uGQWXYXyQ02aNfxwX2KNQCQ2UVJ3ewLDHgS8
	JwcnCE5GBqgGuvSRL7yOcL/bU/PyJLMHYTd6w8Co/nKJPD1GRmcd8LPuk5SpShdnG0TMCAmIWtC
	QTH0+DvS+3ZUaPcUuzmAPxF+pxBISxDvK58JKmsCdfaecmFInHRoqtNsL1ZxtkUz8fW1Jx8FUiL
	PaBbInT6bg4XTSPl1a/W40lw8R6JoZlR7UBGhxGNicyI15jSnbp2Ue5VlCRg4sJ5QcSAqGoVl+F
	7lp4D5lU2JOKt5OohJMrzD87e/zM/pXcOoyH8JlPnGjFVmakGnfFsTS84kSvK8KMo5Eq6a79X0q
	jhiU/GTw203O0jVeAKcfVcyS2JvWwz+MGzLCwTRXWH
X-Received: by 2002:a17:90b:528e:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-39b25ee67f0mr13190480a91.0.1788561093161;
        Fri, 04 Sep 2026 15:31:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b2610af72sm2139164a91.5.2026.09.04.15.31.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 15:31:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso204833085a.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788561091; x=1789165891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+ezEGSoxt4OIMmPGd47wsxyvlI7VYsc+xC/7giRRKU=;
        b=J4NBHowHpE+owMY1YuxBkadPax7uae1s2bMq24lUdAW3mrTD+0mdJBWXhBVsKHbI14
         MLKPX7Je18jLnu4aONGQZVVSn2PucKJ+OlR3DPmcN5MNpABSZEdpnRPAOLoYl2MfMLUL
         BpCYRuMBJF8R/f2cBQAEdS6/r2DLMjKluWJU4=
X-Forwarded-Encrypted: i=1; AKwUvBxXOeLkbki4zBQJ7dBTJ5QDBWWNxrZhU4Gmntmmax49bLGQJhNUjpQ4NR9eB6R5UuW0WS6aSwHpUadP@vger.kernel.org
X-Received: by 2002:a05:620a:aa1b:b0:939:6dfa:48fd with SMTP id af79cd13be357-939804fa8d8mr821111685a.51.1788561090775;
        Fri, 04 Sep 2026 15:31:30 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1b:b0:939:6dfa:48fd with SMTP id af79cd13be357-939804fa8d8mr821058085a.51.1788561085504;
        Fri, 04 Sep 2026 15:31:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9ee8a4sm320403985a.3.2026.09.04.15.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 15:31:24 -0700 (PDT)
Message-ID: <ba415e15-8cc4-4fbf-a624-e1776a23392f@broadcom.com>
Date: Fri, 4 Sep 2026 15:31:22 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
 <apqej5QyjOHu702A@apocalypse>
 <i6fbcajsiol77m6x3dbcay6bgpxwhy5axayb2633yklxl6rswl@luknor3eryoo>
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
In-Reply-To: <i6fbcajsiol77m6x3dbcay6bgpxwhy5axayb2633yklxl6rswl@luknor3eryoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/4/26 03:54, Gregor Herburger wrote:
> Hi Andrea,
> 
> On Fri, Sep 04, 2026 at 12:33:51PM +0200, Andrea della Porta wrote:
>> Hi Gregor,
>>
>> On 11:24 Fri 04 Sep     , Gregor Herburger wrote:
>>> The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
>>> Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
>>> the spi interface.
>>
>> Just a nit-pick: in the comment it's stated that the spi interface is enabled,
>> which is not true since rp1_usb inherit status="disabled" from its node
>> definition. This is fine because the user would probably want to enable the
>> spi interface through some overlay, so no need to resend the patch (at least
>> for me), so:
> Indeed. It could be rephrased to:
> 
> 	Add the rp1_spi0 node and its pinctrl nodes to the devicetree to make
> 	the spi interface available.
> 
> @Florian: Should I send another version or do you want to change it yourself?

I used that as the new version of your second paragraph, please let me 
know if I should be making further adjustments.

Thanks!
-- 
Florian
