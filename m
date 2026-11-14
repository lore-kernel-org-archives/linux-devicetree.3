Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628633;
	b=Ef9UNibGHuz+AUO0Dm0F1KonzIynDcBzcpniKLl0bHhuU1lMH5SW7xNTEJ4z8lxJl1r2
	 26WcQxHirW0LC0MTa6U8HUyAxsf0vZaXIC1CbLcmn7muBHuZLgwXD1IprvsKVrPSu7Vqa
	 7YlY354QR/U42aV5KSyF18DDXBY/f/qNl7nTi62d1tY1+/bpTYDyJB7TfoOt8JYgOC3DF
	 uvHVldYlQz82G0gHoEUGRNytX/jbiZK89Mluyl5A8j2y5IHj7CbblXmZeHUrbDKBaTGDb
	 Lk0snQtzoD5LOZbrNXWqFf4JjoyhAjXV9nDzWT/gfgcVb0V5QrKADb0ISDKZDBavn6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628633;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=xROQ3RNQSNgpJHqRCF6i131rXgPAe1NeEIM3oiMNbk0=;
	b=hB+jBWk5FkRYOMglcQQBajwyO2fs10BZ8BE/aMBBoBhtyhpT+hhT6lPUXoPRp2JNXCrm
	 g8o6UAHco+KT7jbpUKG1/UK/HwItT4feQ9GAv1wAISaadSsZnu/E6cdVZksciPksLIl/r
	 zQz2taOnBXJxjQh769U4VcGrOOCt4rzkDuNicJnfkpyeaF8h6Psu5Q7Hack1TBXH3Tc5e
	 KhsAV1/U8gNdB6kDj12IEhufVh4M9vAx+gGjWJisOSEUZgY75EWD+XBqEDYvxd/OWoqh8
	 a4SuUHjwv0FjWwS1s4xDezGB17rRySyfKzbSL9malYwQ71kibcZ+jYFrkfdALxVezCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=L8MdsK4U;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D1606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8D1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=L8MdsK4U
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e987a2ba0cso9000245ad.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628632; x=1795233432;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xROQ3RNQSNgpJHqRCF6i131rXgPAe1NeEIM3oiMNbk0=;
        b=LTegP7CLMLGB0tU3TDsYYn/02pgkusY6wHHmyoKlRT2X9udA8Rxd8FT7hZnYTPqTCo
         MxiwMb8zk3BqRQSRUAoCcFyfIXksdHwT0UWg6edfjsgrs//Z/5vkundwiTwVmG0Q5Cjm
         QQT32BEmDHb3ldySidhwtE8mi4DHwuIb4IKMoI5JnxwTemfIWHbT/+Z9ZvOnENb2MYJY
         oQDi2OEHk/W3+J6Jkh5lnmLTn4KkU/IYXYMFddrI+8EOqbp2OEo2VIEfMxNPta+v4ul8
         2f8Nqqo9gpT59OffC73C4+WUISjrkvRPY/vVRBnevGE/+MjL6rQkmNFcvvhAlVKyF1Kq
         Xe9w==
X-Forwarded-Encrypted: i=1; AL+hErFp+3JpKTWUwatOrpiQy+wLg77NIX3ricSAgb+OKsdNaFgZEu4UjNb78YKqR9EPB4YfuQBvvCPeJ4V4@vger.kernel.org
X-Gm-Message-State: APuU4Z8/DgkdCSpGgbnZzK8AXODsiJ47z2cLFA06S6GkzhuTho6QjPdX
	dUABn6IZdUy2KakHxMK8R/bAh+vfgxa7hcJVLfppJUcV5SBd8EH2DafjAPmGxYC4r09Z9cyfvAI
	mqrjEXajJFug1mZRrE82+u5KZWSZJrVyjy69IqwkCM+HIkfoi7wiS3C5QiLHD86stVxeeW1S27I
	2aF4u9CQOLCXbA3ZIIKIo7XeY6I3yDq9xjPzePNx18Z8RxsIUSlYLIar/n/yVQIEWKqEiSR9Keg
	9af6No790/s29fQEdqCWw==
X-Gm-Gg: AYBFou2TakUX2kcFR2h6TSNnoMg8Wk6mbX9ThtYQ9qGZSH9lrZzWU0ozxGd8AYg2ycm
	alZdjeT5zmC1U2zzCYOPZTDbc4D9IUMokI60x/cXq7CimFKwpD/8sCnyoxkTRAZv/2xof5YVCyj
	TBfX2ZovfDnAxKM01EcM0HoOzCNNxLXobf6hK676VsoNEi9+wWWszKwFmXW7KnVmTTTxqLTU3GN
	vrUbP17B8FLb4UIrKe3gP4v+w7s/doKxRUzRpcSiNrBJPzDpXK9Nt7SW7rKqijzd6K5i4kjr2H2
	RLIKricfnZIYoZMSGTGaL+hbP2mi+0ICOpz6E+bruIxEuAZbtZlt4riW2ryUujWTgl4ak+X1evB
	dzvsiLMdPdVHqwrPyvjTODD6YgR/0DHrmyLftOSFHQp+TtK0VhaYiTcX0nfrkZWPPE76/MYoRnc
	AEVu2dJkil3cW/euJzQY8mefE+sIzEY3idnuEuFbEQ+04=
X-Received: by 2002:a17:90b:3ec4:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3b1b0a1bdcemr4406540a91.23.1794628632245;
        Fri, 13 Nov 2026 19:57:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c1a3e7sm8943907a91.2.2026.11.13.19.57.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:57:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2092991eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628629; x=1795233429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xROQ3RNQSNgpJHqRCF6i131rXgPAe1NeEIM3oiMNbk0=;
        b=L8MdsK4UnFz9Dkf7zZfN5DMRnJRQqlhWlqtgOWtsaFc2tFfGM0F/zpTOGFnQIwpUVU
         fVYcNe0EWppNxFGcabXsrkqsqnB+QQnPgrQYRz84h5k2cneFhWPHNBmBIP2LmoP3Xd09
         m+SbuKS5Xokb6c/tBgjtfQ29MJIbGTQgkQr5E=
X-Forwarded-Encrypted: i=1; AL+hErFrdNj7/xvs/Eh/EVZ+K+bPHowAEvwWZyelkOTN2cKRaDIbH/Pk6qsJyLFkNZ8QfRtlWzw6XlUFYQXb@vger.kernel.org
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-379684ae78cmr3969384eec.38.1794628629202;
        Fri, 13 Nov 2026 19:57:09 -0800 (PST)
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-379684ae78cmr3969346eec.38.1794628628469;
        Fri, 13 Nov 2026 19:57:08 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm11370237eec.22.2026.11.13.19.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:57:07 -0800 (PST)
Message-ID: <c5b6fe56-c9c8-4957-8827-fcc6edb5e73b@broadcom.com>
Date: Fri, 13 Nov 2026 19:57:06 -0800
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: R7000: add nvram node
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
References: <20260911203522.105474-1-rosenp@gmail.com>
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
In-Reply-To: <20260911203522.105474-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/11/2026 1:35 PM, Rosen Penev wrote:
> Add it and set MAC for gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian

