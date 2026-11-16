Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870073;
	b=fcK9/Rr9ycfzruIQgk2iWYC22dXAA/vIkOza/AVKP7f5SS6j+qBorPUKRsKcboo/D0VV
	 czizvoz2WINARoJjkOn1z6Z0jNzaU9ZrEUbmiYB4hRcCMdFhZ8hBKFt5nDjz2QhBfAZKa
	 cb2KbbEnvS/tmD3wH2BQwDNKPL8PflzUlhZfahSgdFIHzRAuRtKqWitv47s+dFpyjWYdB
	 +ihdibRk6R3Lb8Qsc/QXdxKsnXsbpdEsNmetxHrx9zOUcQeCr0NYvF7gJBumgx66+Bvbf
	 mQxG+L5065trs5sOlyWs1rkMBQccc2fD8CHs0sVmfc+ssOFcT8bXhF2tQKAuCF6QETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870073;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=pWuXA9s+Ah2/QUEIZsjHDshjibf0ro9jISPMeIrZQcg=;
	b=DzYt9NFG8FYL8sYY6sGfU7XPZu3MNOjePf05bVnyW64gr/oqE462VtaNWHSAJdzosChj
	 zqG0+IrG5KBK1r8k2NSvko2sMNfosv7GiRVY5bkgqRX6LktxF16gz+7eWJO6np6m5ZYz3
	 +Fwm0OAa4EEnipdjWdASVytXP3Dop2GgwW7MFS1qk57FaFneLyVB9DICV0ABDjKufmA6U
	 M8rrXk+mRr+aH86NEsetaDVHXM41HswQqXCUOJ4CypOcpQC9yHpb6xiZOAUmPcZ2b2AR9
	 w3ZKoeQ7vaX4WmIaSrRxonnPHJVS0SiV+gSVwTDASCxkOAb+ZdOY2p/SEarQGdJLY/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T3UK5PDq;
	arc=none smtp.remote-ip=209.85.217.98
Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D50606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D50606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T3UK5PDq
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-7d2da1667b2so3438076137.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870072; x=1795474872;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pWuXA9s+Ah2/QUEIZsjHDshjibf0ro9jISPMeIrZQcg=;
        b=CLqKWvumu68b7OaJ/zbTfFabY4mel8XjxsWlo88l2S3e4KFmMvNjhZmXbCAgE9Km0w
         y1FYrGogImzxIpYJ7ZxLMsprIVByCWz8xpB5n/xOKRAsrS9zB0+sjlaF4n7rPPBovdmA
         YOHpbrblLx7QPAYJyKov1IzPTi1ZI67KIRRTtpk+lBigv+hNLzcM+Of0VmEEkbk8vyne
         qt88LOOfnwKNlTEEtVkcYeSnYLMneOUmr1JxdfKr1ZNX341U4yF34VWu2YO01tSJ+1cP
         RjEIuYCXC/jf7K+FApc4IRIBQHfDwEOVcLAjAcn8G89bZjban4ydEwibc2NglshGt4K3
         lRHw==
X-Forwarded-Encrypted: i=1; AL+hErEKQJEDr0Cegc33K0va1PNIbmIAvzVaATMoW2pu/XWpyruac+ck2/Wn18qDp6LtZ/4L4Z6cbIFhNMHa@vger.kernel.org
X-Gm-Message-State: APuU4Z/8VHVxbGSbysDDojpQ3ETnJcFq0+5QvDao4IPKXNdL9hJLEOlX
	fYYobQpqaviB0S5cA+vz7dlAaQSNBcOGKkL/SIo8CKdZK2o4PLTnI4lWFXDztCi65CPG7B92o41
	dv8vD2O1NQyaHxtTwK0AB0e54pddq09BxEZEoAWPeVcDz/jCWDev5FfoeX6L4ycqSoPTbyK2xjV
	t2Ye9PbC5+BVW3E/GKq7UDnljsAMm35ApY46tQGVotzsYV5TvL7icI4FAkeTUa09GqcTURKCWgr
	7n6BgqNLwHJVWF4m9J9gw==
X-Gm-Gg: AYBFou2mxH9RcTa8st0sxUW6CkEcak4O5AXs6vdItQysnWnKp0RLjeW0sjmlGQF1l3l
	Q64Lyjj4hGuO4gJKBHuTesNZPL9csGwKKZxyFsV8eZpG14qfN4uK1PGHpmzWQePeSZvjX5rOv6u
	WyDCKTLPcTjo/5UhzOaJ7wbAshGU98u39CoS6BozrmBqn2OfWiH/UPMTRw5lmy7Js11lG1tKNnv
	i5BFPL2fF/THmDYpiS0NhiBVXmRmdPbiLFUCZJaS5X/rlOThEk+yfFHPD6t3OAclLUln/pARywQ
	JSUyRUyCY+P9wC5HfigFgjBCWDAHFmqIao/2cCH65XzMADIa0KS6X/v2P/HsgxGlzmJ72yb9k3c
	12wbYMpjagUfwUyLyTnbWb64R+zUtJ0abJIHLPs4PTMr2k7ZCipVnAnObd3E7y9AXbUz5jFpT1d
	5VodT2iYYSI5w9weBkj8ZFdHnK1tmCFU16Ifm2dzTh
X-Received: by 2002:a05:6102:330e:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7d64d815f68mr4644981137.30.1794870071663;
        Mon, 16 Nov 2026 15:01:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e333cc8a4sm118977241.0.2026.11.16.15.01.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so3631773a91.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870070; x=1795474870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWuXA9s+Ah2/QUEIZsjHDshjibf0ro9jISPMeIrZQcg=;
        b=T3UK5PDqbJPYKe7TUcM4XXfhqrZ6nllNXZPBKnG83r5Jo/UxV0ZunEqbYgcDLcq3xr
         nM+o+rwFYnIwZYD40Tzb0Q/VSAArvGe112DUeVp/e6oHfKiQqFF+HDGvpzHr0Z3ws1hw
         PCYpHbGYiQqXuDeTHS7F2BzC+TBf00myjv7EA=
X-Forwarded-Encrypted: i=1; AL+hErHudwVyxRdrnkox8lRuDeSaF1uU6fjI4jDy8WtPWY93SbBjzduWFcPHtTplRU0ly1ouDv57UQ7YTR7w@vger.kernel.org
X-Received: by 2002:a17:90b:4c49:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b1b0a3a7fbmr11705200a91.31.1794870070204;
        Mon, 16 Nov 2026 15:01:10 -0800 (PST)
X-Received: by 2002:a17:90b:4c49:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b1b0a3a7fbmr11705167a91.31.1794870069689;
        Mon, 16 Nov 2026 15:01:09 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1096089a91.0.2026.11.16.15.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:08 -0800 (PST)
Message-ID: <3f267167-02ab-484b-8b2b-b68eaa493e90@broadcom.com>
Date: Mon, 16 Nov 2026 15:01:06 -0800
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
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <179358503716.355577.9187303706042543606.b4-ty@b4>
 <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com> <avopEsR4AqMUUKBU@x1g10>
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
In-Reply-To: <avopEsR4AqMUUKBU@x1g10>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/15/26 13:50, Brian Masney wrote:
> On Fri, Nov 13, 2026 at 07:39:42PM -0800, Florian Fainelli wrote:
>> On 11/1/2026 6:03 PM, Brian Masney wrote:
>>>
>>> On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
>>>> clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
>>>>
>>>> The timestamped MDIO write series [1] needs the reference clock the
>>>> GENET MDIO controller divides its MDC from. On BCM2711 that clock is
>>>> not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
>>>> a compatible match, and mdio-bcm-unimac's clock-frequency handling
>>>> assumes the 250 MHz of the STB chips.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
>>>         https://git.kernel.org/clk/linux/c/af7994af5228
>>> [2/3] clk: bcm2835: register the BCM2711 GISB clock
>>>         https://git.kernel.org/clk/linux/c/ab94dbf30233
>>
>> Brian, can you also take patch #3, or you would have create an immutable
>> branch for me to pull from. Patch #3 depends upon the BCM2711_CLOCK_GISB
>> constant being defined.
> 
> It's a bit late to do the immutable branch now and I don't want to have
> to rebase the clk trees.
> 
> Can you provide an Acked-by for patch 3 so I can take it?

Just did, thanks!
-- 
Florian
