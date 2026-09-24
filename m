Received: from mail-vk1-f232.google.com (mail-vk1-f232.google.com [209.85.221.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B046A2E2665
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284120; cv=none; b=gg/2urroEzNRrtTFf0papLVL1UVbmRjMD9fBm7wQadIS0/Z2TOAl281G1/Rgv9xEaOhUgqAbIB4rjpql6CGLszaNG4WVnfaYRH9gs3uZf95V6K372ao2Cshg2WRwwo1wDeeukYFmzZtl1oSKjqvH/fF7hkGKUlsF3yoGuKZkJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284120; c=relaxed/simple;
	bh=iFA4JhXbq1qLV+Uw4ikJyL3iIiT0QhtcLZXONqEw3go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1MD3JxPnlT4fi7+9JqKwOI3hZP/Kp42Pm7Y0b9l4OXbL+o8kNcFGL/N8z7e1+COPVAKIecVDWFQtMe8n8PBLPzs8ATq4Y0YTFDcl+X6Ksfll3YII/vwWVIUwjQ9+/9UrlV06SIJ7AViTIgUZ3BwyI2rwHpSVkoPJhPNIOvIAbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FvB/i3e1; arc=none smtp.client-ip=209.85.221.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FvB/i3e1"
Received: by mail-vk1-f232.google.com with SMTP id 71dfb90a1353d-5c82e6a6a2aso44971e0c.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284117; x=1790888917;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UAD7zwQqN+OPa92RBnAFe2Ct2f8yZB8iRkC4rSgwxKA=;
        b=k+A98EnzJchNmq6h0cLVI66UqD+3jACMAZoafphqTfVkLWBfghz+6PUCCOB7fOPNnu
         85Ufosh/A+jLZNkGTqkOJEqGdzmBbPzo5DOtxI3+yNlk8j9lqitLekYzPZsGDp5LpB97
         gDKVcqRWYoCM/fASUFHzhuLN43uniEAwDy0fyV28gIxgjB/uPqpjyAWG6Qf1doTx2lU6
         7YC3aYcMElMH7o7AlKeWKFgNF+jpBSubF/TssOe4ZHVp964LATMeURyTknM64SzsKn7T
         Z6W/x66ND7T2JFX7Ip8BHccjQrnawY23s+WGpWs/wK9hs3KdbHpMIc3cRE4gofqKNMPP
         Q2sw==
X-Forwarded-Encrypted: i=1; AKwUvByUqkSJODUBFNbuU0x5MsPcxEGD2F4qu4mNah3LPn3CRRsxwl5PbPdIP6MHu5a7MgyOsKRlGUeBX2eM@vger.kernel.org
X-Gm-Message-State: AFuF++leaMFZXfl0rVNJx9mZTq5NdS3ldfHICaprEPtfiFVTXFmztv2P
	svDMJ0MTPzIVJHEr3pBW7yOzTD7mWljAdUD+IIUY3IF7lGmbzE0cnJzilXcuNWpfqKiBf0OwNh4
	cj7zug6xGOraR02A/IaXTfGnjRaV3ECcfXvZzKMdvUf7NNQqmwXzsHT6nrKO7wrlfU8ysrtvm+B
	K/3g+MFVb9qW4l0SVITxBoxaQp7ZLuSLWLQ+FDAaX0sMHQL92FIi/VAbg4u/zFK2NCF+FBquLUm
	8xUQgz8NwEzUFPjhEbyarcf
X-Gm-Gg: AYBFou3QPyb8CZWrjxLnArrNIsM4AxgjXLKLU6i6IbFyeK29cYV31Sd4p0vOvncZ83R
	ea6zTPlx+TJGZy32V3aO6zf+y1TkYlcvARjuUShVdvQ1We/OS62+atpukFrdVSzXKbgHpMcsV7l
	Psk/ytjlbfDsmdMkRjKIswVpsyNW4T/0LhELau11uq+QRxZy4F02Sevca6oi8kta/tWj+PJv3Z1
	6mVO663IS5gKxRvYswlUEEQsM0x0hZhseY9uLUrtRkDtQfXs8Emb+tNjd8vIz45tAqQGffkpaQ9
	FMs1l/b8Iimkn0vzOvFlkqD9iMifhwZReVFz8Zx3Kagb1Tbcqcuke/afhFDwbP0U12UoGTlNnZX
	sJTvL6hQoIZL37RyD3n5QSjDADaU226YsuPNJ3EF+OOqoaoYk1t+ctl367gTGwYE9XCWMqQgSLb
	YL1XJr2KaWjhNRTr/YmBhO0i5iggh61hyORBKsE0iHGt0=
X-Received: by 2002:a05:6102:f12:b0:7ab:d3f6:6225 with SMTP id ada2fe7eead31-7af19738629mr1785095137.0.1790284117328;
        Thu, 24 Sep 2026 14:08:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5cc60ee4ba4sm157969e0c.2.2026.09.24.14.08.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:08:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ffe24490bso6039281cf.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790284117; x=1790888917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAD7zwQqN+OPa92RBnAFe2Ct2f8yZB8iRkC4rSgwxKA=;
        b=FvB/i3e1GtM0cMB5ViTmkhD59P03z5UE6Adj6x9DusGgzWZVIoRf9MGktZvjXs2j7A
         9IK39wwx/V4fK0vTyn51I8IELv7Wk7Lj4wNh2UqLWQ5kzGXLurOfNyZHV2JPRWk2hzPw
         Z6+jrRdpB1v370tOZpXYTI4m6BwCOblicZCoU=
X-Forwarded-Encrypted: i=1; AKwUvBytzg5c4SpPyqD3Wlb6fZZgQxXIhtt51vQgaG+RoW818WT/6nMQGhSoxgazTMXB2xgUO10rLMzVvp2Y@vger.kernel.org
X-Received: by 2002:a05:622a:5814:b0:532:e568:7edd with SMTP id d75a77b69052e-5330b6cbdc5mr8966761cf.55.1790284116621;
        Thu, 24 Sep 2026 14:08:36 -0700 (PDT)
X-Received: by 2002:a05:622a:5814:b0:532:e568:7edd with SMTP id d75a77b69052e-5330b6cbdc5mr8966321cf.55.1790284116200;
        Thu, 24 Sep 2026 14:08:36 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330c0a4084sm2150791cf.23.2026.09.24.14.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:08:34 -0700 (PDT)
Message-ID: <ff78ffe0-aa86-4679-a983-12d393a0cd7b@broadcom.com>
Date: Thu, 24 Sep 2026 14:08:31 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
To: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <arUJxhEDFYSIUp4e@8bytes.org>
 <19ebea19-c7a6-4135-8abb-1f139ce1f74f@reactivated.net>
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
In-Reply-To: <19ebea19-c7a6-4135-8abb-1f139ce1f74f@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/24/26 14:02, Daniel Drake wrote:
> On 24/09/2026 12:30, Joerg Roedel (AMD) wrote:
>> On Tue, Aug 25, 2026 at 09:56:03PM +0100, Daniel Drake wrote:
>>> Daniel Drake (5):
>>>        iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
>>>        dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>>>        iommu/generic_pt: Add Broadcom BCM2712 page table format
>>>        iommu: Add Broadcom BCM2712 IOMMU driver
>>>        arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache 
>>> nodes
>>
>> Applied, thanks.
> 
> 
> I'm assuming you didn't apply the v3 version of the series, since that's 
> an old submission and you also just acknowledged my plan to send a v6:
> https://lore.kernel.org/all/arT-U_Rp0ZFMyCD7@8bytes.org/
> 
> I'll go ahead with v6 submission now, but let me know if you prefer to 
> handle this another way.
> Daniel
> 

Joerg, did you also want to take the DTS patch through your tree? I 
would prefer to carry it via the Broadcom ARM SoC tree to minimize 
conflicts on my side. Thanks
-- 
Florian
