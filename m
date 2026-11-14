Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627589;
	b=qaU7TDIeKDeiOYLm/OfcPvdYHSJra4o3YY9bUFJdW/J1elOrAxC+zAbzYwYJ3Js2hk7N
	 rV4CyL5f8L0BXmKp2TX4J8gMG2KnIt8bZVBZRZ14/lZ/ltkAWSU0HKGHx61JF8QHdYaAR
	 Unom3JQZU7ldDxycA2YAbnHD6mRU5sV9rNV3ZVTf+uPbnKkCCgZBkOZxNCw2IPLxzI83L
	 Rnh105wXRcWW1F7Cw6xL+vrGoO4CYoMDpDN6BpfeBYPDyLaEG2IqMbIVWaXdjGxOBKl7s
	 XydmVcg2JhlvMS19fMDSgY6/Z898kfpj0krzDTYgE7KtHhDHqdJ+j2ZS0vzpYMv9gtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627589;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
	b=FGTRrFUIqBn/nCu+UEurzvsZc4oAPudWneLH67ZP6dz+QJZUuQdrKcNqqeqI9Xcr6My0
	 4BjyiNGvYnlIhPwYJFw5AfL2q0dGlDqxq9SWfnYVTem0yLQkzYDbhrSsZ4GFus042oeKi
	 NyczXjQbhs7M8rWBZFsIOPzz+6dyvNKLlkboY6ci6lsEjDCwcmWLg442vJseLmqstoVXi
	 59ckPwYs65WtHlRVfRb/zs1TJvm0EPGszg9ZMoZRZRQrw4WzcdNpK+Q2dasFbjsYvSIhJ
	 /KRQR10fCuQmLXsxiiaUORHskvbNFQ+qQXC//WecUPYZhMbOdgouRjVSD1guNjay43g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="SDFRs/j8";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E6606A333
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981E6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SDFRs/j8
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc147d86bebso887075a12.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627589; x=1795232389;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
        b=lUiuXnXTRyS41JlVqBl30GsmC46faxslm4tqtULZxsJGJF+rtk3LvlCi/o2BNlG59X
         /ZFOJkUPSFLIU+h41w9dEvGPGXO+S43sd5Y9F1TX71VB/aslisptMdq3T9JPLzDNzKgp
         Gq1pgy4G42wpfMZr15ebmKj/v52jl4s7uVe4qMAm0rs6VZ6yDubiBq/IT4YhSCn5cft9
         qTC9EEMyHocvSaPjokVFsI/mJkaZwi8l71yg3lFbfLadaCzK5RS9wapwoB4RnqbwFIxJ
         HnhsjAxGnnS9HgQBb6xZnIosVlmW/7AROJNGhZwSbcWB1HUfGgUlgMRRMn2KOzubS3n3
         PrUg==
X-Forwarded-Encrypted: i=1; AL+hErGdNy4nlSKTxrcda8QwQ0j/xowRQYvD2YlSNrP6dnuARwBpxgJ1uFyb4XtSQBvdPZHnPV0N02PTO4hQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/FOfDROxLUsvweyiCGOEIh3Q7sLcbV78lCX/4JvqHukGTdHNJc
	7cXY9kuqZTn1mqAmICJVtGdp8q0YihKk4sv1Vz9F8RofOMSJ1/+dwZL9PeD35YaemLOglvkiaQj
	qgUpt4gyv5d2f+haU/LERnCs8UYhXy8V0AhCKQ7vbiAqzrSaJYA6J0Q4V0otbskN7KTZ04i+p2E
	/JzfxBP368mm9zVLUEIt02gtf4CXLfA126RoaD81WSxwmX0zlQlE/c+8qn9hZbWbUCr7RoN25H1
	mEXpJXOVqcXyYTHtxP5tg==
X-Gm-Gg: AYBFou1dKPaJtfWgUJymHQUKRMAJW3M0E+TvGZScVP5thOp++ILZu0EpNAfuPgIjXXm
	ctFXV6OhCStYpQSWcgxrzEkN7BeuGOXNvV6yc7f1xzmGLFcYfqStcPzj6rnahqoDsEnC8kPnOZD
	YWOl2Tb09GdO0lOV330LUNKzjjhxyDxPUFs/0YFpqVWCfDsG+OkGZb1GxX+JEZkRweiuGxzrNAa
	3SvaOtm3XA+whiofXeRy5crf7dAEtz7RnTimP1KGeEZferIq7v7k8GK4NVntnbL1kaW3/kwbiDB
	QDdwo1wN1zVDCKN0SBzLm6fLZG9SWFhakIeQNfVXGbJWErhhvES1YqFFLa9VmtRi2ooaJUSDhLS
	BfX9VHV2zqBeiP6kR810pAvGBUlePL9cVwTzMJBVb25EPHfOrRovSTjLsduEB6KsLFHfF2zw4+V
	RXIBfUSLnobCjlZISz984jhA0eaAYnXFquGhfBmxkJ
X-Received: by 2002:a05:6a20:9149:b0:3e2:89c9:6a23 with SMTP id adf61e73a8af0-3f634856329mr6241742637.34.1794627588945;
        Fri, 13 Nov 2026 19:39:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cddc131fd13sm154240a12.0.2026.11.13.19.39.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:39:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so1221568eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627586; x=1795232386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
        b=SDFRs/j8g4/06YhWFLqs8QedRbXW2DtCqiGU7b62dfYehxGOBkoGNm0k1NhYXmxBwR
         Eyud54ZHdrV1F6CVpDOznznJ3vEHZ+0/7siXxTQdLJNUluOCCJ86hlai1MoVge1VcGcG
         s95ba3o4cFpRGrAM0uBLJQFQIip+xPkO1PpdQ=
X-Forwarded-Encrypted: i=1; AL+hErFZe/IlSSfeT7OYbktccyZ/MRurCgSA2Ar6GdxnsA7Uz8TxT397uHnTy7j/oZcHWzuJlAM4iJFLRdNh@vger.kernel.org
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr3720467eec.12.1794627585819;
        Fri, 13 Nov 2026 19:39:45 -0800 (PST)
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr3720422eec.12.1794627585050;
        Fri, 13 Nov 2026 19:39:45 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm12603206eec.23.2026.11.13.19.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:39:44 -0800 (PST)
Message-ID: <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com>
Date: Fri, 13 Nov 2026 19:39:42 -0800
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
Subject: Re: (subset) [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB
 clock for the GENET MDIO controller
To: Brian Masney <masneyb@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Nicolai Buchwitz <nb@tipi-net.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <179358503716.355577.9187303706042543606.b4-ty@b4>
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
In-Reply-To: <179358503716.355577.9187303706042543606.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/1/2026 6:03 PM, Brian Masney wrote:
> 
> On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
>> clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
>>
>> The timestamped MDIO write series [1] needs the reference clock the
>> GENET MDIO controller divides its MDC from. On BCM2711 that clock is
>> not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
>> a compatible match, and mdio-bcm-unimac's clock-frequency handling
>> assumes the 250 MHz of the STB chips.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
>        https://git.kernel.org/clk/linux/c/af7994af5228
> [2/3] clk: bcm2835: register the BCM2711 GISB clock
>        https://git.kernel.org/clk/linux/c/ab94dbf30233

Brian, can you also take patch #3, or you would have create an immutable 
branch for me to pull from. Patch #3 depends upon the BCM2711_CLOCK_GISB 
constant being defined.

Thanks!
-- 
Florian

