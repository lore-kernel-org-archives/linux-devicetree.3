Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628782;
	b=hooGTKs6qLqy4rNA9vLaBT35qXmtWNCdXmKEhHDCsX9Fa3v2nJRcdNOUe4ISJhPsJbKJ
	 irYDYLzvt4hyJKBj00ffPwq/KVc+UVJj8ySSSFly0DdlYv7aavtqoXmnf3r/7ozs/AJBS
	 7Ux7A5zpQPJiEgH0g0pm5jwFims85Dz/j3ehX5wAklS2uC2Biokmm7ayGfhXEmstHGYve
	 TjYWtULyDrZev+VEjzrq7MJX/vRLNK0wiLVQ2jfE8z2nHUf9lZXuw4fT0XJ4TxjYmJEGU
	 qSUOcoqkcuX8c/D2OoY8tunB8EFKdMlFtX5ivNCU4weAAJU9gjzh+zb5xmg2BDR5yPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628782;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=lylGBZzawup/AWIpS5YFKvFiPE0Bmxf5IfPeVlOTz+I=;
	b=rc86+6n4ZoSkTluoQvRxv9YUVQ2RIpAX+ymVw9BxfgTOBlq953Jz3V26u1cm/FoYKpFf
	 E7drTT8Ty5bZrp7L1e5XvhPv4fVLs5x1uIsWl55IqCWDM95kn4zMVR9J93FJjNIfZZYOg
	 AWHt60CJf/T4Ix82d2Ggvc6oQ2zyYDNqFQlE2ZVmRWdgQ0AKqviV/R8c/+L/h7ZBxls0q
	 hcxJ+fz+cSbcfxyzIHxFQ4FBbPmh+r8iw//HoGkgVT+FAmBxcxzRwXI1KAqbTG0VvqTpo
	 sKu1OujCLCcIykciBywq3Qv6fVPN2LtVdvT8ZsFwgOgpZIE6ajXl85YrOE0xeFLgFOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PXAxSWhO;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC57606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC57606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PXAxSWhO
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so874593a91.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628781; x=1795233581;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lylGBZzawup/AWIpS5YFKvFiPE0Bmxf5IfPeVlOTz+I=;
        b=NKTm8hREM2Ussfq6zA+aF62QuaxD0esHgNI4w3O298PlrqAP3BzObNfTMOHVd3Eevz
         yJBiqtuWoPoPtZeTgLbE1KfflZVQK2kUrifQgmxairf9hEz2Zpaugzm1g2fznfZoVYGS
         SnwsIuQjAkiw0fqyqJOCvFPR065h8wGinw252RevLrbbyXFlhZexE0Xy7lUtSMjQYiD5
         L8bvuWAvOZJYH7Pd5/zw85i5DOOr/5aboYp9rfTdaPQzMkxq6MOiMElBMFD993W/3TCF
         almOo824ULCogXAkO3LETkgggpIKPcnoFZQP49Iy6+sgn6em/S8i0Oq97IxBeLuZFfnB
         Ef1A==
X-Forwarded-Encrypted: i=1; AL+hErFy9P6s5RD+KiyMN74ce6CrzjopLpkbY0UpA0/uwwctLorFW4fzOQ8e4o5eFgJAEXwSoTtys5isrLR7@vger.kernel.org
X-Gm-Message-State: APuU4Z+dc0hjeoNovE0Lav0ln4B3DGSZcGKRuamI9/X0Pfp/WgtXllZ0
	BzHLeiQUFmuUxiDUX8ByAn6Iysy7sFRJ8167uoJ9kQgX2DGNR1jHL175gfD+NnOdJGSfi7uTkqh
	Qf5u7WT6ZeI8aTTRRnTWXkhur4Dg3X67xv7Nm078xMs4Qj46CfNkdy2WUf/d5H5VIcSgFbOW6aB
	7m7Jp7QxgSKIESc9wdQkuOlDMliawvyZ9Sql0gO0gVXnKnLslUITmOAiD86wDUCAyCDtXRbq8JY
	bOSVe66wR5IdGPH/+UqwA==
X-Gm-Gg: AYBFou316SjhSzPvlfpp1GmsE8CUi++pjtMZkIUn4HicPRjhx9R9dPpzyeqscXUg1OL
	nIkuvmVKYC38+cklzDU6xX3oc8J58/dXp4tZaCRu/nGwAgQLcxn613BI7OMikYFZU4Bwz/iyX9H
	uNavv3CY06D5Y8JODLz1wGoHgFvfTvigOIixrZo7bSDXvj/WVc7SCDnYDWJoYM4P//ZUHA1nifO
	UXrGXbGst2ozDN3ZAZwpUveT76v7HiDcC75G289nlasYRSc+H5PCvAHHXzfkIzlMmhZiUjbQClP
	xFvOotRlgqj2YHFsn0Zm7sS94pMgq7ePKfxMYt+czKvwzMWCs8sWs6SaAeXfLCVsLcedm/bBuNX
	DHqZo5k0kRPICAzksUzGOI66ft78c1DGPHb/7GoqnI2K/Kcb1qzZ5Rm56Dpy/cbT5GeeuGTvuiR
	VFVv6hdw4hFI26CLL+lkIXCk/R9MOkklttGPgBInH5
X-Received: by 2002:a17:90b:4a88:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b1b07fecf9mr4425636a91.1.1794628780793;
        Fri, 13 Nov 2026 19:59:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cca69asm9062137a91.5.2026.11.13.19.59.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:59:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so1914706eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628779; x=1795233579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lylGBZzawup/AWIpS5YFKvFiPE0Bmxf5IfPeVlOTz+I=;
        b=PXAxSWhOYtLENoAbHC54R0Zqh8gfugV24Fvo/cq9IvBR7VEmj5acefkn5oDCLh2KAw
         G8tM4c7LjETt+tcGGUPoFUWmO84UaGV25IdCybrGa4YwP9MG3tlrUVK2dOy4Jsb2xuFW
         hGMfrg+KLJ+8+7rMlPDBh3qWOp5b/YWGlB4YE=
X-Forwarded-Encrypted: i=1; AL+hErH1yhA/tljYV8nvKUc9JYPjggh9uTBP3tDDEa/jaU4nwVtuxe2Z+PljP/Vb/O6kNVh2/4myMBmCai0b@vger.kernel.org
X-Received: by 2002:a05:7300:e9dc:10b0:369:f9c4:1fda with SMTP id 5a478bee46e88-37967ae8705mr4719417eec.27.1794628778838;
        Fri, 13 Nov 2026 19:59:38 -0800 (PST)
X-Received: by 2002:a05:7300:e9dc:10b0:369:f9c4:1fda with SMTP id 5a478bee46e88-37967ae8705mr4719367eec.27.1794628778162;
        Fri, 13 Nov 2026 19:59:38 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm18028089eec.18.2026.11.13.19.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:59:37 -0800 (PST)
Message-ID: <8aeb2baf-5379-410f-a86f-a94c4c601a71@broadcom.com>
Date: Fri, 13 Nov 2026 19:59:34 -0800
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC68U: add nvram node
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
References: <20260911192012.81280-1-rosenp@gmail.com>
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
In-Reply-To: <20260911192012.81280-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/11/2026 12:20 PM, Rosen Penev wrote:
> Add it and set for MAC gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian

