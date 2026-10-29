Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312179;
	b=vZGIOqjjLAEOQ+5JAUi42DCCicSvgAgK1ahTPEUW8g5zDX4bKsZL6EJTptM53T7zqw5s
	 NbZWDHksS8eyKeWlTXzKOfoiWOsSwpiUdJio0OCk+jmGTAPpp7kcESJ0nhMnv/JhZ6GoS
	 8mvo/+ePAzOV6+hpfkLbR7WmQiuViBoONpJkGyzgYrwJ1Z+nApxJtFL4+m9JO5speh0s3
	 IGtO8TicNCYjfNgUjXIsn2/143o84vjcSAD1IK5Idp1km3gvCMsN+as9UsyiRSw6NcSUN
	 9HPftQGfwG9q/kvEkpDxYFOYATnM6ZwNPQi1eaqT591+ovpW6gO1YgRwZkfuehTA36g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312179;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=;
	b=cF+Y4ZnT3xfbN4UvRQBlDdi+FRy5Y5zHazg32lt9PaiXYPdxK1w0Gxou26VFwK+lWZ00
	 q68dtI3PlaA+l6U3s9Oyz66wRxPYNYvxREpf9CYA7TjYjawxfBbdov2JkebUebzD9kvt0
	 oxZHQk6V52sIAR2a1cLzq81eWPbiGQV8b9b8atpr4AAc5KwQCR5mAfKd4JizqaftHWNjN
	 zcvyYrk41RHkX3q6CysZugn+aJyRSbPDj3L4RAjZx5PflyT7UpXRFbjbPUnnS/pB60dCt
	 4QnYF/omA1KOf2Q0gtDujt3Ru8iUxpfAXrlchFG2ipwN4HwKSp/w7P0151Y9LcopVJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BqyRQEyx;
	arc=none smtp.remote-ip=209.85.222.99
Received: from mail-ua1-f99.google.com (mail-ua1-f99.google.com [209.85.222.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43003606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 22:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43003606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BqyRQEyx
Received: by mail-ua1-f99.google.com with SMTP id a1e0cc1a2514c-990703f817fso46478241.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312178; x=1793916978;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=;
        b=GEQOE8g5MEJn8wGErrtS56i0QHWxhMnAOztYEb8C8dLDmguZhSW14Cb0X08TqfMPaU
         KW+kY1vC7dPsZ0YAiAx2EAOX0cWe6fRnnWtELBdmRfz1xKr8IVtCLBxJ7RZKuY8sz0gh
         QwiHwB0MZ2fPjr0rLXrmII9IGjJuii/uYic17RA0O026RSvJgExC1yIw6c2ns7j4oSab
         0+ISt/nCSPguSKitwFscB0dzUf1t9NmbSzHUTUH97WhX7LlYuCaDm8xSocuB7dio1BnO
         JEO3JJUEW3GW5l8aSWe7Dn85JjqOfUFvcv7AxAQRn+xeBWv/EcfwUQH4F3vzqfQMobRZ
         8AfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzspy/BojcxRUeWGANGQqGWomYaYzF3EUcrFRnSmHOLEmzAgG4WqnNokmhi9FJblpNjUekR5OhTRmCx@vger.kernel.org
X-Gm-Message-State: AFq9FYKGufHJSDPgFkRifsLW077vJxIiAWO8UIpG/IuUcsnvnuiXFhOL
	y5m0l9RRQ9JFptQr10NMsm0WwX7D8QZkr7A0NmXAIRpokcQ7kX38lOgJDu+kGK0rNvA+mTfIYDw
	MF0WOkp/Rtlh2ad4XLnLz6LoRUnVeivS2wcPyiOXPCz6hRwheI5gQd8+YRs9ShTo1ftd66dK+xm
	oV+g8uyUUe0sw0Wzqre6r6eg7dHhnU0++X27BJcClphV62Y5wjp+jYELdq7gnMjipNyjOItPXfo
	mHMZm+qU0ZbweqkP7BETNQS
X-Gm-Gg: AYBFou10Nihqfl7oBLGbneiu2kry5xLdyMJ/91oQRULhE+PV4XSgj5YmTEVelhIIYEZ
	NwCI+pSz9zxvYK8XEfD6hNPbG626L782ex04tXFEZ47Q5Woh4khu+IGZylkxvfC7erRIhyrMFbO
	5aBHofnUhM1sX4chcyXkCTYyH6iVWiNHM2ZSQ7JK4Qg4DUfeaIPCX71LsQYaSkyV+vxMU5nw0jL
	G7ghxbKrFFZzbJfPCm+EppWwfgtotnKYBvc+i+xMoLx34AvLmDt7gHHeTuMUsUn+BHz1q4l6Eqf
	0pYFyrL3DB3h3rAbbAXm1uTC7Eb1IU+T1yrIuoqxNL7FOV9dDq+h7ol1ivjzR/PxMe3s0pkVYnj
	gr8v/JCbQos2ORHW4vvHpIKPTg5vfc7h6Gk57eGC4Fnp15DObKfZ7ASIzIMUX7RmPRsO/S14kwR
	ZOikuKwJ9Y1OogU47Mb2KNsvvh202VSJ4NX/k670ff
X-Received: by 2002:a05:6102:2927:b0:7d0:57e3:d496 with SMTP id ada2fe7eead31-7d072672bb1mr361303137.17.1793312177981;
        Thu, 29 Oct 2026 15:16:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d07756ea12sm300137.6.2026.10.29.15.16.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:16:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9197553d398so2760226d6.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793312177; x=1793916977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVlfSCWJXlxUi5h4K2zIp1TD9fbr12DYIgegOsMHeHw=;
        b=BqyRQEyxX0trni4vJiM/yz30UGvfYRCpekk/vop/glatauNQs4SBfXYnAb1DkPRsK5
         If9N0EyeVckD3PNu0qL/zeXHVdjVkVOCjoqehI/jRltyj8byoH3HHJAy8hQFeKyct7Mb
         l0J5KUUPmdW8PtY9YC7EZ4gyJcaQgBQmY3x0A=
X-Forwarded-Encrypted: i=1; AKwUvByNjGmfVgFGPamv8BRpPM0e8dCCr6M+c+H1KWXmcxCD8UYjgmf3Z1PA76f2Q1v4SZLO+PkOGqZwgo1W@vger.kernel.org
X-Received: by 2002:a05:6214:320f:b0:91b:80ac:66ea with SMTP id 6a1803df08f44-91ca4b09275mr5812006d6.24.1793312177168;
        Thu, 29 Oct 2026 15:16:17 -0700 (PDT)
X-Received: by 2002:a05:6214:320f:b0:91b:80ac:66ea with SMTP id 6a1803df08f44-91ca4b09275mr5811296d6.24.1793312176571;
        Thu, 29 Oct 2026 15:16:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca689d34csm198336d6.32.2026.10.29.15.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:16:15 -0700 (PDT)
Message-ID: <04b60565-5aa3-4859-abc2-0291203371d7@broadcom.com>
Date: Thu, 29 Oct 2026 15:16:13 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] BCMBCA PMB reset controller
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
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
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/14/26 02:48, Linus Walleij wrote:
> This is another of these big upfront design binding and driver
> hoards that is the consequence of adding new SoC support. My stake
> is to be able to boot and test a full featured Cortex-A5 system and
> the BCM6846 XG6846B is one such system on my desk.
> 
> It's been cooking for a while in various prototype forms.
> 
> IMPLEMENTATION:
> 
> Add a shared Processor Monitor Bus (PMB) driver and a child reset
> provider for Broadcom BCMBCA blocks. Support BCM6846 XRDP and its Runner
> cores, PCIe0/1 and PVTMON. The PMB bus driver uses the third generation
> Platform Management Controller (PMC3) keyhole interface. It owns the
> register bank and serializes complete sequences for child services.
> 
> The fixed SoC transport is built-in and has no sysfs bind/unbind
> controls, allowing delayed recovery to retain hardware ownership
> until a busy transaction completes. The reset child can be modular.
> 
> The series contains three bindings, the PMB bus driver, and the PMB reset
> driver. Describe PMC 3.1 as a simple-mfd with two system-controller
> children and a bus child, each owning its register window.
> 
> The bus child exposes the PMB transport and contains the reset provider.
> The parent uses Broadcom's "brcm,bca-pmc-3-1" compatible. The PMB and
> reset drivers support only the BCM6846-specific compatibles for now.
> Other BCMBCA SoCs have different reset groups or PMB interfaces.
> 
> Use one reset specifier cell and define BCM6846_RESET_XRDP as ID 0 for
> XRDP and its three Runner cores. The vendor sources describe individual
> PMB device addresses and reset masks, but no ID for this combined group.
> SoC tables map IDs to blocks, register values, timing and sequence
> callbacks. PCIe pulses preserve lane-selection straps. PVTMON uses its
> analog-acquisition reset. Consumers must quiesce every affected user;
> these resets do not replace clock, power-domain, PHY or UBUS setup.
> Power-cycle operations for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL are
> left to power-domain and platform power-management support.
> 
> This series is based on v7.3-rc1 and is a prerequisite for the
> forthcoming Genexis XG6846B Ethernet support series, which works.

Excellent, looking forward to seeing that!

> 
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series.

Very nice!

> 
> MISSING:
> 
> I did not add MAINTAINERS entries because I don't know how the Broadcom
> maintainers feel about it. Tell me.

I have no objection with being listed, I am more familiar with the PMC 
present on the 63138/63148 than this one but having access to 
documentation and people helps.
-- 
Florian
