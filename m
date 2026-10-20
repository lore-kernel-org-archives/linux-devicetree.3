Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510813;
	b=A8uVIFNbn5+5b833/kqlFg1x2IhJTrXm360d04SV8378BWhUSKBa31e6O4oCCFeAvYpV
	 32cgSZi9qhVc5TtHLXYMukoIljmrkAxPsjIUzqOvU1f46etqbtshqOYEqafcLiGRMXyJK
	 KF4/bfG9WEj+JIudrG6LyEiOlIqkc3CujwZUXGsq/k6WusYLLVZd5VqXW4CZbzlBov7U5
	 tuvL1XM6GivXbSMYGmKmInIPi4jRgly1Fc84GZ22zXNQcxeIhTF4WDmYw2VvBTX+W5Jyt
	 AAm7NsYbn+X+1bnHU44umgRdO9FGO69iF4cKP0SEWUMjIBbRvk2R42SEUdhBNMoMgNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510813;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
	b=bRbiuGqY/s0t8jVkDEozMIM60/+DzRih77HcSM3cLAiN6iX0DInNZoLuacqTOd6IAhRG
	 wb90Tba+aLupVjiXgX3Bo6hhfotR9bJ0AGr3FQvc/MNzXv9qxOTsvUFhFTayTCrSWnRpv
	 0J++JvacNp1m58WFG4SYLjQyopds1oTUvQ0KUdTTA4f2/muFCI9mY0+W2rAOdFSx4OtTH
	 NlR/VpcEQGCFJ8abbF17U+2gkzGlzCXhiER7148ckAA7+65P7j0w3zYjVLvfMwm6oeANa
	 4LT+HOULseIWE7RadTqSbzJRjfylb5AxBhSuHcpFw1/4TmFBc2emmkitf3otFGMWwog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aah81HL6;
	arc=none smtp.remote-ip=209.85.128.228
Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7EF606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B7EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aah81HL6
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-8b125371596so5189057b3.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510811; x=1793115611;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
        b=DY0b6B/vAsZJ/bESUlMIITQ2PZIbE2wLFIqHsIx4ZuXzUUb5/eILnJaeJS0nTzxdqJ
         7d2E7AjNazxhRzJ2p2kvKa5aNo8dXGg933BdNSWly3tZwb3zGbZXHvCUakNy4cy+hkZF
         2iWSxz3R48Q0235mUxWNlpzP1NiouUiE+D85CPkAykQy4GJhSVneU+7WkxaCPhwAxoM5
         Jn8fajfKACbB/uJqAvXIBVWgDhcPIfwxfuIsaIGxnkIhX3K5UCJXKiCFP8x2SAjV3HYA
         vcDgthbq/pALccawCgCxn0gSAhI6whyi4huEB1qasuGyGKmGKDNANhz0Orub3gPtdNvq
         YcWg==
X-Forwarded-Encrypted: i=1; AKwUvBz6MHH2n6UBvkJYP9CJVH1uY5VzhSKr4pNXYRuo4de/bOmnppRbiFqt3V77mdztq7gMapjddgLLaNkE@vger.kernel.org
X-Gm-Message-State: AFq9FYLV0pGBxQGJY5Ehu1JtDNrrIywWbIvKG4uAtox9cyCQZIag+AeD
	Fc9wWh81+BC+NOZovF7ZW4VUqI87JrO+D7jca1WbOqskKHR1JXY4vbdjAsVicgZDwlKi5BIzWbg
	uWD7j+xB6mIpdDB5jcMZRW+zlq3KzsASh1Q1E8qDMpmIWhNw9MBZhnqKh6lNQR/iJHrlsmUlhhO
	QdIURtId9DGrxk7cxbbCavBDeIf4DHTKSed23EOfMSUBSI7YqJhEQ5RUwRjiSymDRPBiqY3+yfn
	TfXtkfGj9RH+ETJTsuw2g==
X-Gm-Gg: AYBFou0Krn7WzelZYuBLysKYfq7xrrsuXqouCJRLJGaspaicImaYJMxpuSW9UwR91h/
	qRDDdS8dbHoftYMB2altEjU97H/rT0wXiDHeq6COOTfWXeE/rwPKvlVbVGXiQ49GhhrfYleZ7YE
	PBdkmSc11xi6mPK00fXg46NQQoMdHWTrwGLyVm0/hHxIaio+xKTqSU59SIDtAuIe3uQKRnADMIh
	aTypa7e7gNdmChIBepvfcOTDsmHJZgNuxrFfRfg2dAVfZ7A11OGVThJQwujnFocpG/1qKJ3KSsf
	feHYc7kndAj+DSn6TJ75R7UqSe0iQksyPBtvJbQUN1oUOeqW4c5IeM+fRw9a0lsajdhBBOhvPq3
	hCCp2wFyo37YjoVOr9pZZ6nrPa6cWTrytY9aDmpWbUrGp6oKTQvop1fd1LDTIni4iOZVOC+THkl
	XEGvfVlLxXUaY70PYKQ6uAyc2QxVBd9bRmxg5gxtylLb0=
X-Received: by 2002:a05:690c:ec9:b0:8b0:bea0:3130 with SMTP id 00721157ae682-8b1201bbbc2mr8982247b3.23.1792510811149;
        Tue, 20 Oct 2026 08:40:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b11b78fb08sm246327b3.8.2026.10.20.08.40.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a2035a4so16408886d6.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510810; x=1793115610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
        b=aah81HL6gRqNXvrP5L7v6k5a+60qbmtQH03lk76ig8ZV9PVTj9aAnIIOxAMiAoXX2r
         Cq5Tca3pH1IhRpKTnSZiQSwfGeoRjVwrV30Wc/+8hlGstmMEsS4s1cUqGQiSjd38qH6N
         wFqdTQEXP10z3j1lhSmZVQLldfCr4BJWVXIP8=
X-Forwarded-Encrypted: i=1; AKwUvBxJpDppDRidcAXVPq72Y2kVBPeqUqUnc4JEtwLBuISQLXICp8DMZ1xNwAaMrVJETVg0b0avb7bzofbo@vger.kernel.org
X-Received: by 2002:a05:622a:4c11:b0:535:b545:e926 with SMTP id d75a77b69052e-53686f3793fmr33774831cf.27.1792510810387;
        Tue, 20 Oct 2026 08:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4c11:b0:535:b545:e926 with SMTP id d75a77b69052e-53686f3793fmr33774211cf.27.1792510809945;
        Tue, 20 Oct 2026 08:40:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5364de4d690sm92439221cf.3.2026.10.20.08.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:08 -0700 (PDT)
Message-ID: <6125aa53-4fad-46ed-b627-e0fce7df7b84@broadcom.com>
Date: Tue, 20 Oct 2026 08:40:05 -0700
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
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
