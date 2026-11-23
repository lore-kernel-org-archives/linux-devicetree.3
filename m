Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450082;
	b=ONMGJPff9hF2s1F9pNu7POugU6PuOI85GAzDZ29HtcOFw2ZraZTNISLqL/fgcjZWYoi3
	 NqcGVnRApOxRu8UzEIj4ViZCIS9G+Get2PuHUuIPfH/16BzgV6jPXnzHoGA/K3Y/RW6FW
	 fqwd/eFlBnX9lorxXq8prdVVUkpph/g6lc52CgmeXFPv6l5vJB+Cv3+oSaeywsovPq7Pd
	 Fcef9Bxpb+wJe6TOSpYvB1gK5vzxOAPjfy7/lT/iFWDfAX+eClH7l68TOZdQwJE5hQYhJ
	 K28qICUleebxB08gLgVUCNbKAHPbviE1gkPyYQgOYrU47pB0diCJytbT3TNmppYAAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450082;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=;
	b=UDqQ3Gz6SWl40EnJA2AwRHI+4Hc7tyfoM4tr8n5dDjPBO8RTDnd/vlPxBRbDKcFunBjq
	 Jg4ITUnyw/r6c0e4qLHY/R2RCvpMwwpKowNjAK14w9HWtvKhqdeT7Jeoi2NzAVtyUfM05
	 +JAsx8RUx8qRTYe4qGkFKfufvj4u54L6CeaSzeP1Z4/lZvG+rO1L0zHb92P6bqb8kwCCK
	 T9LZw9gQSUab430eJOAC6Or7J4a0mNwiQWtSEMBF47oxjkQYJ3YtqB4mOtRLtxFKa9D2V
	 QCFTf2g/kLL6eeHN1MIEhnkjHjmmGJih0RCgAuY3cYUSOUgaGEsigG9HF2ga+igI8yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AGiitD22;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B7606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AGiitD22
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1320172a12.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450081; x=1796054881;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=;
        b=Nj6s+Yg3DNpjeOprjQHnpLx9uuaeoQ1WccOndMVkqyKEWAtMoAmOrDTDYXoLH47IgF
         3ZPlIWmmaQbTBSVNLG2Y8OS5LOb4DsVc1q88po/OA1pBfHhSUkpnsWX8bhe/vFOpHN5O
         xSyS4NASI5WLCLbs1HmkIFSHv/M68Kv7hs3rrLSRVRfCkqLFjfV2d0H/SeXVPl/L5e0e
         ZOFG850jzqoc0s+rsMth94zdkckKGQmtQkrlL6wdiNy2QaGfITQOEHn532qvUJJjFZ91
         cX2pjO/a8/uXvuwnK2qiHaljusX/1MXhdSoVVmmYDvmP92UNDwkctZ3rh0H08GO/f3tQ
         dSbw==
X-Forwarded-Encrypted: i=1; AL+hErGisMK/B+biAT9IeCwVwNE7agQ71rYxn3aqNS7gsD9O33cMzT+ZLF0W/Eqf2pxIT9gAZPlx86i9UtRs@vger.kernel.org
X-Gm-Message-State: APuU4Z+KwfUw18VAQ63wqUO3DpbiiR5+gv5kRGD0ydm+hl4j/l0tjWY2
	OVRLzidQlgfqCh9x7J5tqnYnlDYidYLBoMjzQnlX4Wvxy/vE6sbw09ZIXYjfu2JxVCXnbpRS1oj
	qDPCiC5wZ1KfTwoeTC7/sTX4rAP08sP7H+vWwRnPU+ztHXDNJHMF+fq+8HkOvHMgZZcVV9Sc8cA
	CqIxi/N3wzPoT0SW+Z8k8f1JbPc+Z/kKvZJnBDy96ffS3rPUs3P1fjxVEmctBTFg72uLdVIfgky
	g2KpJHQNNoZ3hQorj27rA==
X-Gm-Gg: AZFdTZcpkjPccEL66wMzYvS6GwsysONTBL6O0vxXXXUGItNv53SME/SNU0JZWlUWJNi
	RXEByWmO8tifawgY7+WiVJvKjYVUbDFFwUGd/rwMg3gt12t+rlGMTieAmxHPay45ZFn+Q0dhdNJ
	G+iv7erKLKa8h0C7HFA6Z9iD/229YAVSHWGu5bPlm2b0RgSC+HMa39aq0LPH8pitao/mivPIbxv
	+j7MsKRw8s1anqh0dyGoWlte5KAm5efvlR1q8r7bv9xDJ+RpLKwWrwpTdQ659zTkdciQqHnsnEc
	5me39ohGWZtnN0votpDo8oFfjYSwBkyBhaLZoejvExsuhzGz3rPIDsyWR3a6TLQBky9Eaz0xFzu
	g/GCEEC6TSFpPzF2L0UOLy3TpHgaUisAHZ8Y7rURoLF+6p3ODpGQp2JTG5DZxYejYekhKB+0mTT
	pESuOKXeh16FOm4PwzSDDFaz+k3l46bAf5/SPKvtJfbzc=
X-Received: by 2002:a17:90b:1dcd:b0:3b0:abb7:3fdc with SMTP id 98e67ed59e1d1-3b41c975c33mr10551730a91.60.1795450081177;
        Mon, 23 Nov 2026 08:08:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm9502461a91.1.2026.11.23.08.07.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:08:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so5240342eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795450078; x=1796054878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=;
        b=AGiitD22/FtMb0TzJkIP3n50RVc6+zoO1A0diNhOd/PV65ZGxiVOjjnt0jGQV8PofH
         gxHXDPJpoL8VDpRkLf72jx+vyBf0ZpmWQ1f8Rou6xW5pIwlAcQ8v9XZ+ffxkB8K9iMTk
         9+ZKioCtG1AiKBMhhl0lP1KkHmaIJ9p0DVdvo=
X-Forwarded-Encrypted: i=1; AL+hErHyPdTGHdVPQzoVQpJ/D95C8L2GyHzrfuAgBe6XxfFMBwuMyAcvJSfs7dKN+Qt8fQG186Gi2wToWdxx@vger.kernel.org
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr19381613eec.27.1795450078466;
        Mon, 23 Nov 2026 08:07:58 -0800 (PST)
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr19381556eec.27.1795450077586;
        Mon, 23 Nov 2026 08:07:57 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm38560278eec.12.2026.11.23.08.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:07:56 -0800 (PST)
Message-ID: <c5e542c2-4d34-4ee2-8bd8-e3b5b5296f7e@broadcom.com>
Date: Mon, 23 Nov 2026 08:07:56 -0800
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
To: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <179544998187.275844.18441245364658646762.b4-ty@kernel.org>
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
In-Reply-To: <179544998187.275844.18441245364658646762.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/23/2026 8:06 AM, Vinod Koul wrote:
> 
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
> Applied, thanks!
> 
> [1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
>        commit: 2a27baf6e203af422db2d84f9f382153612679a9

Thank you, I took patches 4-6 through the Broadcom ARM SoC tree.
-- 
Florian

