Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816152;
	b=h1sh26aA1OCq+sIW5QwRFVoajo96hhCXswqpSCpTuaPa4QEGBOjPJG0AjUbK9z4fdlex
	 ItbiED5qOtHBRZoVjNReK0xoRgFkkaYL0aisXgQIUiJvxON7xwLxa6ONIqfS3b4mjQeW/
	 W5WhQihExApqPX/yjuK7biIWeVTXU0qCdcnwbBGTjx9tp1SYc0BBOyW4iG/NLMaTgNYrY
	 DXEKvW15RxXhzPN2EXRU6mT47IyGS7hJSzBQ2N7xJKqSqWAHP536w5TsmDWd0BOCBPhwD
	 dVbURaqzQGHJ6kt+MwAaPR6GMNlqBwt0Y1D+5Taa1VzypsEFJjEkHeq/8/vtobBsklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816152;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
	b=UT1rwRbJP6b1I7pXYVk/ruiI6PM3AR7lA6yY0rtblZqvZfB9emWdUZeTdUQuWSAfCn7I
	 XncHHna/V+1bvfRNrhUuTQ09LxlHxdxUNAsUYw3qYl7cRIgMU1LWeN5+D26rLUPuoUTmr
	 ecw3Gq8/4F/sKYt7Hdn7Zk1HbVQeUTrxOTzdNsSB6naNQHbVnsKKuxpEhMGEjJxk8PT37
	 TqJPWvHvAP4EQpoUWa3LlEK6Za5KU27IgOkerglPo1P7DO6YM0l6tSh7CD7PltTi3E45B
	 PBH4S56ivFFfGBl4Je/uRJNBY4WKJYrNSMIjx4kX39h1x40WxiDjWeyHJNnO5YNxCvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HL0miFsj;
	arc=none smtp.remote-ip=209.85.219.99
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71237606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71237606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HL0miFsj
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-91c7a706b1fso27213796d6.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816151; x=1794420951;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
        b=bxec71l0erBB3fu3ZnfXPr0orKSloPZlCxH1MyC2hOfmHxAHXpHpBpTPY53llRhI8y
         6BwAtxaOQd+g0MJEsuL2dJqpDeNYjfPS12NiKPdtChSIisJQWNROmmDF2lg5McCKF+81
         QFoG4jGGJ8dfqLxw3px861/aopWmOb+q/pRGjcdWz13jDC7pt7kY8Ta51vKCPC1TTL73
         6oTqQsY1y/R5MObw3M+o0dg0DdLI2LLKPkSGFLp9hV33vK6lyrnDwnyg7cmL38xqYRgY
         mk8tqrmIPKocS+71OILUr1NXbAZ1Hs6U5s5+1LdlNIKiE486sqqCl9sSt+1GuW8hkalZ
         WQxA==
X-Forwarded-Encrypted: i=1; AKwUvBxsp/Q291VvpIo0i+BRbgPJcms+7RHcKjma5aVnLBXdzzGhoOWFfmG92fpuQzKelVhG8jF2jBdCcw+E@vger.kernel.org
X-Gm-Message-State: APuU4Z/rujZprPc/FtGO6s9OaWQ08LdQidqDzInUCXCrHlkXG1uFs67I
	+DXgQEIuxyeuuHgYivYoe7em+fMjiqmx/4Sj7bwGpIuf0SnNNf47/axnaBzyZ+2X0FL2myzZt2e
	C3E7Bp9ZamoleyFv2MYSfNHXls2o04v36WlRNGy2yO5OOG/YrxtNczY4CBtegddK6En3iVCzy/K
	di2W1U5XLieF02oiEaEBnftkNPMvonokBOhFeV+UT8m6kzsxW1EZm8G7R4v8Y4D0/Lzwd4kbVWP
	z3RbMbSe+vFYMbftUzphU95
X-Gm-Gg: AYBFou0TehfC42SKhVQQiZddgPUh00EpoeEBZ4c9rWeOhFQIZd+MTWuozSFjGO03ZzX
	c0gnoMkmEFK7u/rOMeFlClyeHAFRUMaHLomGOJhx1L5EO71MAW6Hf9w1HEO5BBHYbetR/RST5b2
	C1J/QvzN8z3Ei0vgo8apNLgSAW0dQGj2NK3wSIL+L3ZOacpmZNZY5byYcUHpJwrxKczWwfVpy8V
	9vKxiz9mPdEavGhMkLQIWfwNCfGL+wUSsSLxvkiVuqBv0dUWNnhepjONFZhyZdj2sxgnVdnloHC
	tTBwmXHswsZy3rswdQbr1qyR7QpNLCqzeChN6vReAcZhMP/2ThHmpmdx3gJzIOVKzCNp4apR5yU
	pH3wY3BmGf7yZEWeHQlv9ZnSHa1afmorUcAcUYZpPGEw2T1vzLsfJIVxxaOFi8ke0TRvSofgiNt
	cMRQ16MYvrSzvzk2jM3p9a+6baGi92s+piNcW374S0
X-Received: by 2002:a05:6214:5c07:b0:917:99d1:bda2 with SMTP id 6a1803df08f44-91e94321c22mr6189236d6.8.1793816151208;
        Wed, 04 Nov 2026 10:15:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91e7e8567f0sm503426d6.55.2026.11.04.10.15.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d2a94abf7so468797eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816150; x=1794420950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
        b=HL0miFsjjSv/CpcIZvjozOqslbWgvwdETERSoQyxZWMArhUne4FYR8HI7sww73FYyY
         EDsPzEWXEnYRKC7dWJ25onLVOA/iTK5NeNkPYcIKmzue754w8uaF2Z9gkdGEwoLgiAlG
         sY07/JG7OJiLR2TbVPHP+hbuw1eBoKWOvkpZA=
X-Forwarded-Encrypted: i=1; AKwUvBz3kW5wHI/2oEMReXRhLqkYsP9uYWRnH4hU4gN0NZhdZC17pksyNTEdgFXaZCXdskmLpABkKGKIgCpk@vger.kernel.org
X-Received: by 2002:a05:7022:b881:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b24f4d380fmr308746c88.21.1793816149706;
        Wed, 04 Nov 2026 10:15:49 -0800 (PST)
X-Received: by 2002:a05:7022:b881:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b24f4d380fmr308704c88.21.1793816148953;
        Wed, 04 Nov 2026 10:15:48 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm10038316c88.13.2026.11.04.10.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:48 -0800 (PST)
Message-ID: <1113b8a2-70ce-40ea-b8bf-9a40c8116dcc@broadcom.com>
Date: Wed, 4 Nov 2026 10:15:46 -0800
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
Subject: Re: [PATCH v3 3/5] bcma: scan: accept wrapper-less cores on
 wrapper-less backplanes
To: Alessio Ferri <alessio.ferri@mythread.it>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20261104-bcm6362-wlan-v3-0-e46562b2ac12@mythread.it>
 <20261104-bcm6362-wlan-v3-3-e46562b2ac12@mythread.it>
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
In-Reply-To: <20261104-bcm6362-wlan-v3-3-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:30 PM, Alessio Ferri wrote:
> The scan drops every component that publishes no master or slave
> wrapper in the EROM (NMW = NSW = 0), apart from a few known cores,
> because without a wrapper bcma has no agent registers to gate and
> crash. Since usually bcma is loaded early, it ends as a loop-crash.
> 
> Some backplanes, such as the integrated WLAN of the BCM6362, have
> no wrappers on any core. ChipCommon and the 802.11 core are gated
> through a SoC-level register block owned by the host driver, whose
> aread32/awrite32 ops emulate the agent registers, and core 0x837
> needs no gating.
> 
> Add a wrapperless flag to struct bcma_bus, set by the host driver
> before bcma_init_bus(), and accept these cores without wrappers when
> it is set. Other hosts keep rejecting them.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

