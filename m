Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628821;
	b=z4Y3ffhV9rGBI+vyUFnCRRCsmQCg9pWdxVSZjHSzBnlVzKCfFuD47GJSxU1dL54UFYTl
	 qI78ga6Bg9sLRq/6I7iYbLLN1KqWTMa0QyQDR3xN7JZmVxu+dN6pBxebEcCEu6MHcoZz/
	 esVK/jY6PLDlvN+k1cZAkaxAEO9EwUH9pWOTo+nhC+FiuklKtymiYQ6sYjmRNld0tjW2p
	 mmNYvLg1LzNiQZFbJFd6pGnliK1NugT/zVo5kP0bBymdT3nSnRQ8wy8g7s76Qy5Hm6mll
	 tWtFqh++4lXg//ySCOLh+VhDW7vJ+PTGOFFvbVq+/SuYKH8tKb64hCgaEOV+IxabqFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628821;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=;
	b=apaVUEJWLlVdVJP24edqUP+aLm2nnPve95gQFwMCwkh8ymnZoRF2JaPYnnI0Y8TLeIJA
	 FAVhyB8LlghW8QavMzlDjy89A4r7w/MoJN3AiPVMAHPE1Mp2hX59u3Lawqy6HfoEKA6Oi
	 DxcIrFEn6s5pNTcc2xnydTIGTNR89UlTs9f2VTkfRcpuqsdduP8XWDdA8jqd0wQ7ud9rF
	 9B67wfWTNFEeT64Smo0y83VbuhUakbZP0ljJDQOJX5GqcIlQV9LiKzLVGBKXh8MbLCOwR
	 aUcM1xmNVjDbH9GTCKGAQuniV0xUsp+yhVoTbez4RJFU4QQCoqCGqdsXzW8uCGMHUTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G+Xn5VRJ;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D31E606A333
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D31E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G+Xn5VRJ
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso784849a12.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628821; x=1795233621;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=;
        b=S4NoUeo7Q4GssyEF0V11XF2u49ElQy4v7lJUl8UpBqsqguCwoTpUDSHPvcwmtN/a9z
         5JDgR9ib+uxLuFAja41Cfulgb64Lvr7D+54vO2MCwi1XUazO67QBQx7eDECWbkfDkFCB
         efe0zKG51RYvGYvA+5HCxwe5vrLdFVyzmN7jm/uNMx2gH8h1JEOoBW7rGdKDqcju7fcv
         LxzHnPc2rklSgrpwCpbdU24E8qSJinj1GOxInUIIft4EvXDIDMPDsgWEdc4Z+T39lHJo
         xfxQBHCR7rymSQ80S2w/NQ0AV/7Emiueo0XInu1kYZgsAArkY7DRw45GluLDHHjnmGDQ
         +Gvw==
X-Forwarded-Encrypted: i=1; AL+hErGBl9CwmgN07DoBKR8VLIKtI3XKRsVFRjS1SxMpuSDZokosDcXXIuAkJzxOsp6Dz3mXkUv3ecuYrb6a@vger.kernel.org
X-Gm-Message-State: APuU4Z+4td0BqaP4v0AQRb7oIRBzl7P/sDtNscdk18sw6hDZZHAPXTPe
	qgzbv0nEhlVTSY+5RCtE905PQhYkQ6ceHJHT40GsbkesiCoDNfZIhcIoqqulf+EUFFpA/rVIYpC
	Du5RYZzZ9kbnaMZ0/jwPqwoPJF1W/JfoHCnOkuX+lbd6R+NIbHlC9QfIAHtn0HRrXtHi/CUR+qk
	mlSXU9O/m1Ls6eukPhHh2qCbPTets6vJ2inaX+eC8XbvINnZH7mcDaIUWhJH1g703IVZqii2xzw
	7OY+iNlJbqEP4YTnGH2FA==
X-Gm-Gg: AYBFou2GX3bkOk9mbp+H9CCAMb707Ha06xD8BisMjQEG6mVCNdd5hXyVUEXRzAP8JN9
	ABmNqOKrRDWljHU+S5SatFj45HU50XIkj9TCQXM9fnTpCQcf835SIbklMBVCNo+Tf4LbFmK6WHQ
	r4KBjUzJCZuvTvjYD8mvD3glx/dPHoYzFq27nJgveQeCIIasCbxlbTx0KBeLcWA2HmbkeiIH6mG
	Uj5k+4aCv5nhyc00XNbA23V3kVpaQHTllVyQnc9CuGPf8tJTyZ/fT2S70X+dxuVM72nhXmFa0Fs
	vsXv07EYV6KiBO24IOLHk/JlqzheLS5xWdhw2UgQ648ZI4iJuo5//RSw+Rp6w330wPBVGtsY2H3
	LgIFObfAU26P+hXN4bdXOP3XCm6bb3zS3Nkc0lM86pcVEKQhuzGYLdztgcIhELvyeDQU2u2R5L9
	cl+ryI9VQIJyIw6n/G5oe6WTqo6GeeFDE//zJL2Clv
X-Received: by 2002:a17:90b:1dc4:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3b1b0b5e500mr4235426a91.60.1794628820519;
        Fri, 13 Nov 2026 20:00:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b1ed0b73sm3166903a91.0.2026.11.13.20.00.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:00:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3a348a6dbso3069901c88.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628819; x=1795233619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=;
        b=G+Xn5VRJmB6ZMK7HJv4pDsSa2izVEnKG1HHzKCr7vHntxo0adB2Sixg8/RReLF4uAY
         KpM1UAMXWnxnFPLJivlBYP9tmmf90f9gwMRvKmfmswg+k8sMw8BMyjVgPEI2VP95YVRO
         aDH8RXTGO4lLqwbTyVPPdaPUpQh/SWRx7+4yo=
X-Forwarded-Encrypted: i=1; AL+hErFoV5xadQbE1/rfZ2oEcUsWKGo0SkfJM5Dpq3vKx4qzyxsUvLohQFpxNtVLMXuA18NObpxYMJ1TAZCs@vger.kernel.org
X-Received: by 2002:a05:7022:6b8e:b0:1b3:a05f:8929 with SMTP id a92af1059eb24-1b50317ab17mr6582007c88.39.1794628818415;
        Fri, 13 Nov 2026 20:00:18 -0800 (PST)
X-Received: by 2002:a05:7022:6b8e:b0:1b3:a05f:8929 with SMTP id a92af1059eb24-1b50317ab17mr6581961c88.39.1794628817562;
        Fri, 13 Nov 2026 20:00:17 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm11737395eec.17.2026.11.13.20.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:00:16 -0800 (PST)
Message-ID: <8518ea1b-41a3-41ee-84af-7f41d8298799@broadcom.com>
Date: Fri, 13 Nov 2026 20:00:15 -0800
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
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
References: <20260911191823.80631-1-rosenp@gmail.com>
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
In-Reply-To: <20260911191823.80631-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/11/2026 12:18 PM, Rosen Penev wrote:
> Add it and set MAC for gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied
-- 
Florian

