Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254068;
	b=CKp+8H3zit+xDUWJ3tvhyMM7kEPDjpzkX9Caow1KfOqbJW/ILQteJvnozXvlRa1JI6lS
	 B4OEJqKhXOE7bszgZ3UbRqcCN1+fjHTJthsMENf+2ZbLzXmzYgY/oFPfMlZ7tmPcrunpj
	 VWfHDGEzK3BFNPxUeOjUJGODs4nsaNImzeoDtXoH7cQQVtkVFGy8cWgCroMUhMq1ly9JD
	 7asppYs0Hoc88NeEuuZt3HFA9qgQY1hCOO+DJHZ9TJlUNzxwnvp8Fh/OAXqBfnQCd02dw
	 +zqcL+PEDnF5yI01vY7sn+VAebeLwNBZ+6Sg4DmX0M3gNaCnJXNpAx+nIqZxl4Em32Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254068;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=;
	b=trjh7q1jNc3HWN5aqs3qc7QMHxmRfrGUJSKldL+gpT6er55kgBcqI1vuRg90Mxj9VC/y
	 +ZcW6KUH8vZiz0MAx3SMxwnxSThzwC5vDKcLqYD3WZ6x1ljoFlnIJUjfUwQJ+T0hWaVgM
	 Mw6nGq8w1tqgV2cqx2MhJknETeZHD/wu7VDWigT3X+CirWwiono3Th1BRbssMZgYvuldZ
	 LaYiQAE1Jo6Q8g3V5NaLApPHuxK7yM37woIjBnilX9OjQAW4XPtQnXf3v0sHzpTFkIrjF
	 C933TP0u2w7sM2kGKFX1NSQjoI/Z6nDO/MaRjhJ1uQ0jRFe9f01ukON6I93uTXpBxJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PTbkyRRN;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E1A606A33D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 19:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E1A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PTbkyRRN
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so502888a12.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 11:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254067; x=1794858867;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=;
        b=Uw1Xh9v15h4OJVrKms0rLSz68jmgZPEkdaWXe4/nIDB/7hnGOZjQq7gCszSZkVhGL4
         o35Vre3/tJd6bWVJ7b2RxliJUAvUpHeBK/afxyBXHb9Vg1IHzcWk1J+CEjzAc9TjtG5T
         8reCqtkRQkOKdoNKWCPQFn0eUMOptwJweLjJL4LNaSXE0gbFuCjGASEpHLoD2t6AN7pN
         sai9wzgzUTuZFU/w1iCCuxtgS/7q5zhdPEH7JCDxJcCjuOLvLU+y+Hj/wvYMeRk6N5uC
         69/x9/2z0TFw6tr89MvscmSCP6VZ3B2Jdd9Gh9qFuFiD1dez8czZelJN2mIsoudGSnTh
         qQlQ==
X-Forwarded-Encrypted: i=1; AL+hErETeV/NG15HoVtkI3G5CXtKpI5aUVyQIr/W0x3+H14AznNOypffQeEDVIvxGgymhVUbu6dxSIRLTD6j@vger.kernel.org
X-Gm-Message-State: APuU4Z9f7EgV4XtcMBXA1vkHsBrel9Hco+mY2xO382+BSZHIGYr8IJbp
	2rnBdSNtjytwNL1MJMta/y/KSG6TBaLKwJ56CBGJGRHbwYPqlagD6XI6tgArJiqyqTBoZsextUX
	uMtxEyUl09uRuyTvoeshG5ngUDzjttslNXfcTZzOmQv/u1SqoZwXQPFkMVIYj/NUC39Yfz+fuQo
	e2AlBep/C6IJ9hXEUlmT2duWhozZ64Lz7X4RJoQk9wAmQZgPMarpu9PZlj0k/jPutsWJWGr+Iw5
	8NtwL8sXxTrh1GP1Vdsrg==
X-Gm-Gg: AYBFou20IcpkR9S6LulRJ2SO29AEDsc+oztDJMm4leTLPglu9KUSckufxKt2RQfzZZC
	+dMdtgO/tjm/UWnBiIqbbohH9rwb7XsFbwX4/WXPEj5NG3ESDVvYHoPkSvjiDTL6X4EDJnlogaA
	B8SOFU43xq1Fm2Kl5EDGD1lw1lXuy48qk2G5usTxozKcfLqNFhEGeoITtHiQ4lYbZkDLSJzVVDj
	KpB/2hvvR0pYdfZ55/eyCo03Ae8+7D70ZwfBRaOPj4ACiiZDzZ58r8Lq75I+v1QNEzpYGwVWQHu
	2Bxhs+jCGc8n9FPjuFuB3g8mmhRxxnjCY1PzpXeAwUPps4C1K2zBixSoJZ4io4g4nVSjTG7A4HB
	dV6MccBFGvrxm0CFL0r0QSat25cH/HKx8rDRgVepAMEm8PZum3AuZR4t2JKvCXlTa9Cv2Oemzxe
	vKFAK4wjvwwkXStBP79KA76C7AEnuuG5c9mO8FSeqJ
X-Received: by 2002:a17:90b:134b:b0:3ac:b6eb:e0dd with SMTP id 98e67ed59e1d1-3b166d27e85mr677959a91.50.1794254067360;
        Mon, 09 Nov 2026 11:54:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b167086fbcsm333510a91.7.2026.11.09.11.54.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:54:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53639e47be2so24289941cf.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 11:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794254065; x=1794858865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=;
        b=PTbkyRRNtXorzLDUMXPvWYmRMckrSY9NagEPII5JArgXpXwzzmDG3cM+YEwiO5xeu8
         /GfgQtf+2tk692WRhLBFbBSjM9LKoZhUgCTqkyawYidOTopwCyuAah5IaUKQQFbHOB9g
         4mqs9Oz37nxgwXDABJ90tjCyU1a5oHKrht5u4=
X-Forwarded-Encrypted: i=1; AL+hErEW5ZHb5EHYiSPaoPZNQ68sMYZsvp8vaOxOIUQXohZSQQLoc8a3asmad76hTPAYwlE8xXxoFowk48i+@vger.kernel.org
X-Received: by 2002:a05:622a:13d3:b0:535:a5fb:67f6 with SMTP id d75a77b69052e-5552b54d50emr5422581cf.66.1794254064846;
        Mon, 09 Nov 2026 11:54:24 -0800 (PST)
X-Received: by 2002:a05:622a:13d3:b0:535:a5fb:67f6 with SMTP id d75a77b69052e-5552b54d50emr5422271cf.66.1794254064457;
        Mon, 09 Nov 2026 11:54:24 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d8397sm3718296d6.18.2026.11.09.11.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:54:23 -0800 (PST)
Message-ID: <41d87d75-9fb7-4537-bfcf-c00831da5401@broadcom.com>
Date: Mon, 9 Nov 2026 11:54:19 -0800
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
Subject: Re: (subset) [PATCH v4 0/6] Fix SATA support for NSP SoCs
To: Niklas Cassel <cassel@kernel.org>, linux-kernel@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <179405555432.938034.8271032337892944854.b4-ty@kernel.org>
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
In-Reply-To: <179405555432.938034.8271032337892944854.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/7/26 04:45, Niklas Cassel wrote:
> On Thu, 29 Oct 2026 14:25:07 -0700, Florian Fainelli wrote:
>> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
>> which was broken due to a number of things:
>>
>> - the SATA PHY assumed separate PCB windows when a shared one is used
>>    for this generation of SoCs
>> - the clock/reset (IDM) was not being configured by the driver which
>>    meant that depending upon what the boot loader did, or did not, we
>>    could have had the AHCI controller still in reset by then
>> - on some reference boards, the AHCI controller is not DMA coherent,
>>    assuming so leads to all sorts of timeouts, data corruption, etc.
>>
>> [...]
> 
> Applied to libata/linux.git (for-7.5), thanks!
> 
> [2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
>        https://git.kernel.org/libata/linux/c/262e3bbc
> [3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
>        https://git.kernel.org/libata/linux/c/14d30246

Thank you Niklas, Kishon, can you take patch #1 through your PHY tree 
and I will take patches 4-6 through the broadcom ARM SoC trees. Thanks!
-- 
Florian
