Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0353313277
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 21:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042785; cv=none; b=XddfDPiLHKHSSStASWAGrpPs09MbitxdIeDzCJ5MDaKZ1yYIUa3Tf71MG46z8+yhehUtdF9UsO6faKrsJZzsRuq8bty4CU2b7ywFRWo/TjX39GUDoCac4Tqs3bX4U49K5Ld3CWdSO4S+FTL78gjXBh26TqBULfrAuPSzpaZBpAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042785; c=relaxed/simple;
	bh=6/lXTW6zQqWoLRO8JN7ZdjuUOAjMD6l+BwQTXbJ1Zoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNweSc+g1odNPexMLH/XerPmd+a/n3qPfrDefMfo+uMxzBzNSh9H1mEzOCypQTIPb4AKQUNNViR5Hx9E4U+8jN1UoIy5ojM6h8FQQCwYXjZzm739llLrZJ3kQCqe/M7sjj2Cc/x9FSagBwDXPhHrWwAGJPbq841MTtVSHI5PC3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JJGNrQlJ; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JJGNrQlJ"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2b0603ee486so16924825ad.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 14:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774042783; x=1774647583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMrhHMUEF4qWeI2j/6cd5Vd34+1pgF96m8XkDOfl96k=;
        b=RYFTnk/TrjWu/wJnUzyxmGqXRZnGgh/8u/PNZMSsMV6XLA+UqU+akfjv7egFY0xHGK
         PDKqSCMT7uoH7p8PEPI1pXTAhVarAuT0AaJ/pF9ZCcqSEJkftKWfjvybpuoP0WN5mgR0
         6hmN/ls4nL2XQg93/fsBC2px1Y1BsynLWE6LFNRSY3Wqc5RigoDy0TEFSQ//w3ZC7pfl
         RsBQC1Xk1sUY0I1uss8QHKFvXIXgh9tUnejSzZwgBrCoeKWiaxJft0da2+1d8v5+vY/n
         jDBaA7K7gpPRIhhTx0x+87HoDIzXJnDpbAeAaUDiO3F1tKiNCVIOl0UOChKEdJSgm740
         V/JA==
X-Forwarded-Encrypted: i=1; AJvYcCU/LXLymJGL0Kf2sRs1PT+aApI9pI7Tll90XAb+n1pVpEUq8mGy8tOLeEvI3eK1xaEKVKinxFKrN+O4@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2jN1OFTBhcLzZsvEdV7nrCAH71uObX2BxhHh49xXLexGb6GY
	Apsk1gqjxax2gPo00szYirZvRaY06BHcnuK+63RGhDXG5epw4Tjh0TRoiXpz9s5T0Ua2i35y89F
	uYtvZNvZJ5u2KbhVBfSGyhNfqkiqOQLn3419SLxGoUa8VD9V8lUZNRygT5/cVtv53qC2okjIfHW
	x/O2j6WtmftEtduRHu4qGh3p9F5NaVTykA/oWJGAV1kb9AmMULO9QCQ/yX6GSM2PMPGANOccdGa
	w1Er31mAAbNIs00vDe5nA==
X-Gm-Gg: ATEYQzykncHEsoMh0+A2FoUHCTLE8fAdjO7+XpmK9Sh9lODPiGWOKmJCm+p/o6iqWge
	DEfbisJlHltKmzCzRvEVw9UvWjeLFKB8NYngEJOFw5iMDa75LW5fMnxa6J9dtp6sX23gjb4DKHv
	a2/DS7d6HlWDsLLG1eJs9egTj0sGKmyU7/zjGW+DJAnRBZiOx1ccTvcW6uEMp6yhYdqfOcCugi5
	xojImATpkvZ1YWH/z653KSJdkstKH732+dTG09w8kL//82DMoAU9o3IWvIGrl3FnWowN9hS5j7C
	byXTtuEJUBcKwtZ7/YaJFdhNy/Vte7vW9+yuYEVKGCy146RWKr3y5MRUAV5Z8MN5FKe/1/G/dU3
	sR72GuLAvz3/ywhcpikceumdACJNAzRH7pWxdRpENLMZ+KsDmWCsuoP37X+3vQgZoksAm5lSU6g
	xX5gl4iy9IJw3PFQf2BbaPXvszDS10H77MRFEjrrgZuAMk6wTpzYFIGgPp/KAQ9w==
X-Received: by 2002:a17:903:300c:b0:2b0:72cb:737 with SMTP id d9443c01a7336-2b082769f05mr27150305ad.26.1774042783151;
        Fri, 20 Mar 2026 14:39:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b08350c4a8sm4128035ad.22.2026.03.20.14.39.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 14:39:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso2007502eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 14:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774042781; x=1774647581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nMrhHMUEF4qWeI2j/6cd5Vd34+1pgF96m8XkDOfl96k=;
        b=JJGNrQlJhhykYB4Stqaw/MU4HWhkkQZv/XgmK4VGQNVxLmiSO0Xg4xKJuaRQoGBwjQ
         zDDCBTikzZar7VJ1mqQbzeI8NJbHCADLCGN2EuTkZzhyiRmmAe/OE7O2H+Hjwkz5QWfd
         Qa85qsg6xVloEtwT3DD+qak1Q+kMR6zmXnA4U=
X-Forwarded-Encrypted: i=1; AJvYcCUdi1w/G6bwIy+G1lbfuBaRBxo/LKKIctzWTe25H2hQYwK8SwsZNSyWlTiPxZo+6He4U2c4HgOVBQxU@vger.kernel.org
X-Received: by 2002:a05:7300:cb87:b0:2c0:ba91:48b6 with SMTP id 5a478bee46e88-2c10976028cmr2168712eec.26.1774042781487;
        Fri, 20 Mar 2026 14:39:41 -0700 (PDT)
X-Received: by 2002:a05:7300:cb87:b0:2c0:ba91:48b6 with SMTP id 5a478bee46e88-2c10976028cmr2168694eec.26.1774042780822;
        Fri, 20 Mar 2026 14:39:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c74bsm4983556eec.17.2026.03.20.14.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 14:39:40 -0700 (PDT)
Message-ID: <fff10c34-6253-4608-b969-98a7220fc9c9@broadcom.com>
Date: Fri, 20 Mar 2026 14:39:39 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: add root pcie bridges
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260302000736.592422-1-rosenp@gmail.com>
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
In-Reply-To: <20260302000736.592422-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 3/1/26 16:07, Rosen Penev wrote:
> They are always required and instead of duplicating a definition in each
> dts file, place it in dtsi with labels and work based on that.
> 
> Also changed each bridge@ to pcie@ to get extra dtc static analysis.
> 
> Fixed bridge numbers as a result.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

While you are it, can you fix this warning:

arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning 
(pci_device_bus_num): 
/axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@1,0:bus-range: PCI bus 
number 0 out of range, expected (1 - 255)
arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning 
(pci_device_bus_num): 
/axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@2,0:bus-range: PCI bus 
number 0 out of range, expected (1 - 255)

Thanks!
-- 
Florian
