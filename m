Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602156;
	b=YyWBRu9n3gYrzYeWGCHlAIPcF/QNfRK4+bnrp43VbUcNJQCFarXKiMLXRXsSpE7EWdPw
	 f9zWFavxfZidYuPOKoOnlN837Mj8SCPVgmIfvfRcL180z3YTKs6OS0MX7ioMUbJKBynkp
	 RmiAZDdb/g6d1XSqbe1XyaNg6M4TsK3QjvdS9/ml2WxkhA+pmtArxpp1/qrzeqhZc79it
	 pUeHCafvhQ8LDfaVH/NdHU+VrC+kSfZ++0ixmVUlX0bHbwKc10yDD2y+enaKQQelbVapQ
	 85ZJrRO+xUEUELQAhGNGdDSMlolWyIhviVROzPudsKzdNCIxIN5vWxBFhRAaILPsAqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602156;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=;
	b=zk002m/HB2eN09zlAqHD0tF+tzhAggYoWb/wVeSMNjI2iofCjbNe1u0y28dk3Ms/4Vnn
	 HGZY9To9EhVHXnLRyg2TCIVEk8WCfY/Zoma2P9SRnneh8jr9ZsVgywQdW3Dn9K9tR/meC
	 0IhWwU/nXMDAgmjZ1ay8+XI3luC9HM2mekMWy7rtumAQegUQYe7MCok/WdLoSdbnKBfNw
	 0lTLKZL7ZSzzNOM/YmWCHZesLQYxjHip8YMFx8vsGOJ31O4GX5Imy0eCGWZgilS0XZuQa
	 4DMYXWDgOEI1kH/2r7JjaQKMspo7/7/N6pergqIz+3QdW9G8bpdwoPS/Ow2LvN9P1Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ChBURhV5;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43906606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43906606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ChBURhV5
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e60f9af6e6so9066225ad.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602156; x=1793206956;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=;
        b=WJ5Evp0VDKfzPWi1pt+RjZimou0/2VfXu7x/3ndSD8AO1hsnoq34SuMG3yUj0knkls
         0XRxJ3cPG3Bfl7efqakdmz/h/cutQVQvo09pF2itGkL3f6Cc0DlxCKNZBC2C8E+paqm8
         xbm9p3SPJmJLBhad4UkjJ+w6MCbiMl8YU4LKRZTcksAViepbFejuzlplbBrkLkYwolWT
         TVIhuP7encjItCzu92qEFdioKL2V7U23l9aGDf865PEWATfprghV/AGJ5uzLTzNeGcIN
         DBWZQzBgTbFv9fkQxctWiux5sQTi7F4yBfB1+u7SkBQAmzMOp833+6d6dvP7TmDlTrTQ
         /8Xw==
X-Forwarded-Encrypted: i=1; AKwUvByubzcqBBaQbaeLfKgpRZnpW2O8Guv18bYwCi8gdzvdniKYjIL8s1Ejy1C2i/iWnoZSyfYvAa+iLCkp@vger.kernel.org
X-Gm-Message-State: AFq9FYLycR/8f+SiXtsCEgnv3kQLALKuwMT4SK4XXP0UKs9//Fh7YOos
	M27q5+TwXAULO+6SuZS94J52KMcbH6YH/no6oRUPpB7VchmCZkxo8XglSaM7Iy3I1zm5IFpjlYG
	MKIO0Xz6BWEpRHQqeSY2GNN07RdFEMSG+b0Jn5V1fV4kD8qpzh/tje5X+Z16p4o3qKatvA6ZIRU
	oUR+pQ/iJktCqupt/nlZIYScemJ5GHNaMEpvOSVNLXtPi5UhjKbWH3kF8qpaJ3H6Scl8337OaZ9
	bewLnb+T0XlbCKVUKbb7Q==
X-Gm-Gg: AYBFou0Fn6Ypcr+NVk1aiOiCkvahcvkdXGfT3fyAUpgZ8ZlO458AvHxaxPwSiMBHt2r
	BWMSnLCKVFDlOu16qhOqYsPvl6Zo3QfhfQlD7ljLKvTSw/krs+Gf8JfKiYiHVjGW4bdjALTFwlX
	wvBmwQSZm/uw44O+6PqoNTqX25piyJtIn/11c+IBq4B3962steMZ7zWqyxWe4GzgIFdlUHWcX98
	Kcv46vHwWXTVWmkEDs15W7qM3d15+EjINNi3VfusBPpQctbkcPap6oJ2UwvU5rozGKNKK4KYx66
	6MkElsavqcWTvKUrh2+VVEw2UjILGk7fk7mpwkdfvrI8e2HD0i3lO1BI1XuuftDGOb1n2oZZLLv
	MJyZwfWYFySRlj9TFFV2hqqxQXFvBB67NUOsFzs5tk9uvPRTLZXnOBXg4ccSANvjfqe/UUQU8t9
	koFP1wol6vkEugGLdmeB+MP3C2ebuHOzHNwPdM+/ZOVCo=
X-Received: by 2002:a17:903:26c8:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2ea439fbca0mr21594525ad.13.1792602154483;
        Wed, 21 Oct 2026 10:02:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ea3b456730sm375385ad.38.2026.10.21.10.02.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2026 10:02:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso1535738a91.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792602152; x=1793206952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=;
        b=ChBURhV5LulMs4bCnLVaVA3IZSXrCR45ONzdkar9U+u6fyCq99Qx7YIGf8ZuCV0UKy
         MGg6AtqyP5bXC430p3V79frR0vkY+UmlgcIv2phwi4+zbCnwC4+als8nIfvpBCjJPaWF
         VjEtuHH3JJA00xJTlkxXLUKArOc7MLazZ+hdQ=
X-Forwarded-Encrypted: i=1; AKwUvBxIKylPxPDpVDCz1YJSzM0e4oSP6Go2ssHGXvuehcjd7BFzXLmysFqtr5BGGc30b7bW+ehlojrWpCk5@vger.kernel.org
X-Received: by 2002:a17:90b:582d:b0:3a8:d71:5fda with SMTP id 98e67ed59e1d1-3ad870b2e7cmr2118625a91.63.1792602152117;
        Wed, 21 Oct 2026 10:02:32 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:3a8:d71:5fda with SMTP id 98e67ed59e1d1-3ad870b2e7cmr2118588a91.63.1792602151503;
        Wed, 21 Oct 2026 10:02:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890c56sm333869a91.2.2026.10.21.10.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 10:02:29 -0700 (PDT)
Message-ID: <45bc44ff-664b-4a18-bdcc-bb812220e2e6@broadcom.com>
Date: Wed, 21 Oct 2026 10:02:26 -0700
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
Subject: Re: [PATCH 0/6] Fix SATA support for NSP SoCs
To: linux-arm-kernel@lists.infradead.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261021165555.652102-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261021165555.652102-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/21/26 09:55, Florian Fainelli wrote:
> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
> which was broken due to a number of things:
> 
> - the SATA PHY assumed separate PCB windows when a shared one is used
>    for this generation of SoCs
> - the clock/reset (IDM) was not being configured by the driver which
>    meant that depending upon what the boot loader did, or did not, we
>    could have had the AHCI controller still in reset by then
> - on some reference boards, the AHCI controller is not DMA coherent,
>    assuming so leads to all sorts of timeouts, data corruption, etc.
> 
> Since this touches several subsystems: DT, PHY, AHCI and DTS, I would be
> keen on having Damien merge all of those via his tree if acceptable by
> the DT and PHY maintainers, I am OK either way for Broadcom SoC.

Argh, looks like I submitted patches 5 and 6 twice after I had 
re-ordered them, the correct order is in the cover letter:

ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
ARM: dts: broadcom: Enable SATA on BCM958625HR

Will wait for feedback and resubmit if necessary. Thanks!
-- 
Florian
