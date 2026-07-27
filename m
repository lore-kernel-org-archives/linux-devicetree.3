Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com [209.85.161.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87A423E82
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169946; cv=none; b=Eo6ra7WkJdxTZLkS4O6wvYFi+9yQAGw2Wb13IXXv3gK8XQMp2rS9wE9vglFMg4eXcdxgzysxyQvZx0I6pa5DbLqqwG7ksZqdvbUYJTgG64kogec0BmAbB5q+Y4GcrcPbpRpZNKfu7LO2CVrk5UFo+9wgWVV6OPxJacLSeyHYUcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169946; c=relaxed/simple;
	bh=DO0rDL1M9DxhufQnAwNjtAk5N42ePPbeDba7uVvp0nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfgJzRjoORhu2Jxlqmk4soJhBDOwG1aw7qveAFdTx71mNQFtWrL8o4LJ5xQMfrUHMwDxvMB13++19eB1+nuMe0+MaCcAhpE8xAMOvJ5ESpRuMBMyj4eY2QjlbJiOYVg783iO/ojEvanxYwDcVMyItN+gsDiWldmmEWetf2mS1/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SzCfC2TX; arc=none smtp.client-ip=209.85.161.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SzCfC2TX"
Received: by mail-oo1-f99.google.com with SMTP id 006d021491bc7-6a198cdc4e4so1292578eaf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169944; x=1785774744;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QHPzcDe9whvn6csisg2KBrBErWBPeg/nrhsmnx8o07w=;
        b=ouE9DP1Yka9NRJY0yKdEqtGNt/4Al63ANZ2i5IVgj2xVwoZul5f1MlHbFhLl3BrBVb
         axql9vgFbQRwBQsEAPWqDXu6BuLoZ2llwqglz70z4D1LUXSK88pzQGJDN2Rx1Bfp5GA4
         JRkW+U6p0bWowKCPBBwMiLFFyQVCiG1sLQHZlhm0xDU/JJvvTyEpRvItbcat4Kvn6YgO
         5Tw4I4PGleU9U3/mEnwi92PUKQ3M86/WY1ObiJvqd/4J/ZajAiNRPo9kM/3OT1T0dFpP
         KCMVT4OcyPqjSB9dlTpGXk51n7ERaNiw6HHvIs/MKh4WUQKj1L3/+sLf6G/9Kz0Y/vvz
         fx9w==
X-Forwarded-Encrypted: i=1; AHgh+RrNuQX530rauqWhOQB/l2Eg2IHHPa0alwKuw27Vd1oAyju7Kq1aITLRGUFrvi7pHxZVLmpdsOyfwnZv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1B81+0iNNsrJfTzRDTr9PGvAKdaj0bw+cNmq6hMMuXWwDAhm
	DJskuEr6efo8FIBjSky1KAFnE39ajeUdtiGG+heApt1jJ4guEiD4ixZ3uZUpeedKLQ1bgXCfnkB
	gBt9PVnCuHoIv9mj6jz/hAmhHLxURfhGEX+j0T4LFMQrc2IVx/gjEvmmmD+V16hePdOBsj366ND
	G58w+inyPYq2au1jH3MWZuQPMEH6o1oc5/bmEcp4sO/v2riHFzqhAD3wSVhCq8oaBbJUK/jS40H
	XkjlVtZIYoyt9LxUcRfTw==
X-Gm-Gg: AR+sD10ON44yUCUKU1aOtl3rgkTVzuzDO42SnlIbJFz3oIIjdruRi4NMLfANUbh7A9J
	Vcu9M0HLfOa9aQvE/yilU+dOLxPGxMfgKOxXAW+lLeJ/9HQmHMJ+0GXi8jnRgrrpL2orh1aDjkW
	NeVOxh8wWPugAKknrh1gLouAbQRWcUyCaowRQucMwcKdKepMj4MhNDTend2tkmal/zjVatrZQ08
	URG1YSKGQs+KYMb+o5fz3e/g4QeON27HwH7l3UVZqZvdowVujz2FDm1bYoS+XjTLd+GJq6+EwIb
	JFIXkqGGsTMj+BSgdg+ZTrQ6OIwzF+nvOuuwYI1rzKjITmGGp//L6rJCbQkJEQ/746Xtoni4v/h
	6NEoK2P4oM125leM+ZkUuGYB01vBwWkKFPp9W6aG5Vw5xuxK78j2rAUOjiO89TZz0ZfYePBdRQc
	OSmDR2zBK11TaZOxkJlQBvoI73xLdK6gJahqcyK26I
X-Received: by 2002:a05:6820:3090:b0:6a1:3fff:a863 with SMTP id 006d021491bc7-6aaffde7b83mr6560288eaf.49.1785169944236;
        Mon, 27 Jul 2026 09:32:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6aaf9338ecesm311122eaf.9.2026.07.27.09.32.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:32:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so115642b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785169943; x=1785774743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHPzcDe9whvn6csisg2KBrBErWBPeg/nrhsmnx8o07w=;
        b=SzCfC2TXgtz7Wt8SRpBmervYb8p2qDf2Rxmb3oDjBTAV857zXUVZ6oGup/mSClho0+
         WhWAYExzPJWTZi78iKw2Nz8wa+HJWhSDjWJb2SEXuwTEB57a9ZOXnx3k/5/0MOxL243n
         2fBCZWYYbPwpOZBOoztUPVGVc6vvA/xg95K+M=
X-Forwarded-Encrypted: i=1; AHgh+RoUeCuZZwT3Afy6PrPYkI1o9UfrRp2V9LW+u6E00Vi9x/RD96G66LCkuq8rJlEKHns/jOZ8XUuJP4ai@vger.kernel.org
X-Received: by 2002:a05:6a21:497:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c67d9b1dd2mr8795675637.4.1785169942651;
        Mon, 27 Jul 2026 09:32:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:497:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c67d9b1dd2mr8795637637.4.1785169942083;
        Mon, 27 Jul 2026 09:32:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6054598asm14918234c88.1.2026.07.27.09.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:32:21 -0700 (PDT)
Message-ID: <7ae25c84-b960-47f8-b930-a36d5edb89e8@broadcom.com>
Date: Mon, 27 Jul 2026 09:32:20 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA6300: fix USB3
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
References: <20260725215809.9464-1-rosenp@gmail.com>
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
In-Reply-To: <20260725215809.9464-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 7/25/26 14:58, Rosen Penev wrote:
> USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
> to do so.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied, however your patch did not apply cleanly because there is no 
srab label in my tree, can you submit that patch as well?
-- 
Florian
