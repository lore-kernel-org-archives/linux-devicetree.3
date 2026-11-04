Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816119;
	b=tdBMgDPhGDq3mC5oiPqKy/W/ZADAC5EcsbfWiKnyPlmexNDsq0pM7QYDPUgLOaXUGHfJ
	 AgVfl/8RtSZ5JHlig8a/sysvPdGSrQpfZhDOBfp/FEH3acjtqV/zccVqaFo7sFRFhtY+Q
	 u9+fcLosw3FZwuK6kuA64nrVUv6884LAvtPhQoUfgBsgatzCNsv5R5aGDGLnGiQO3ELtk
	 z9oCmt/p7lflCwpzksPCC+jCghtZyTQKVxn9USa2Mw0g84Aq6M9e7LSbYav/fgUGtTMuq
	 53SeVt9gHPiIckc8GDwTkjuJcRsplMf2W6B4bQl0CtE8RRlAw8VIa69KTsD6WdddrPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816119;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
	b=GGEor4/j/e8BjUtSnD4cEsDpf6Z07+ipUEOEKY/BvG6wJqtuAPacfJf2xlatCiP4ZIkz
	 f0S4FeAodfbXsFhTWlNOXGbI9w+8XE2Jaco9p2qO0t3CfH+Pt/PWfwc/+2aURaH/PT6mC
	 eXlH0NX+BryDTgfuEpprD5OrP1MUJnlSJDFa4qA+BGwJAAyEOSuj4WBBS3Ej9BtkpQ7EN
	 eV5Ju+XrViH9dFcFdK8bozGcfHPLePKgtOLAEi05XY0WBWno9kkvEExOs/NFHFfRjWCaO
	 6UDAa8/SSCywgz36fyBXiuu0ulDk/HhqZPg/4uXJ2jLYjuoI3Y7Pc+8gFld7m65yEPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gkQR9ahx;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD433606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD433606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gkQR9ahx
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso426689a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816118; x=1794420918;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
        b=m8EU4+tf9ooHUbuPeIMyXQc5gHXwluS2h81o05NwNgHjhzwLNOdkbjzstdzIkKIMrJ
         Mc9MlstvnZ+npIz3AHDzxfj00C6usNC8uo1/Npmiyl2AZd2vssWWRmgt64HssqJqnC0O
         pbwZwgHKJTHN2j7Nw+RRv9nVKyoeJ09hEkX+BcP4P/2kwam8aCk2jQnamqxQKlgsBlCN
         sSIsCqvGeDxvyrgjsESvulojym3+JLxqnvEiVSGiAg/MxR9E/J8OhPgPM52S1XAUoYXG
         6BMkelBvN33xvb0g1iPOwbUxa0M9juj17EDAZjrFDDe6bwCm3N2AgZLSqinVMHiJl7DA
         8szA==
X-Forwarded-Encrypted: i=1; AKwUvBw9xbiIcyp7nVlauXuARH7MJTDUwkd2VaRwzR9wdcCqBv4Sb3VfsluwiDEQUKMjcytCmqffhWkpXVwJ@vger.kernel.org
X-Gm-Message-State: APuU4Z86N9MIT107zIK99MbUfn8oOIsfHikcje6T2b/YjvxNHvq63o3z
	WTqzpGWzPp8uQ4BS5Kd8D46TbXvdbtT40I6cJViVR2X/sBVvUsFBt3y5n7rztQoulzlvQbPZ8Uz
	8wezQgZFOsiYMkgnxsRiSZNxUnbLQh/w9ClfpVXwsxS9r/37Wd//mN/nJIKlEN3rye5jR4JSJft
	gMdNA4Dtio78gXDobOHdC9G3bOMQAYSewnqfNo+3hRpx9HyKNfy7o5cC2Ji4xQ5B3DN3sNVS9d6
	EH5Swf+xYtSQnffp97B7A==
X-Gm-Gg: AYBFou3cXaMMDsi3/emWhoV4BSC/lfbrm99dY96BKZGmo/sMdOBQoXKM62qBX42otcP
	kMND2hGSBKSZWhArNXLli2tET8WnlFVbyeDNryE8NAAKJ6H5/2OA9yHXKXhHjbvba8/9BZSaMYI
	eiwShwS2QMeMsp7jV0ENnJ6yekL2++EhHtameXDLGyALaDmQdWaEvdyV0BOqaVoLlt+NBusWzIN
	vlpphFxB5WepyUFPwf/RLXHoIC+tMnb9nqvQsx9pcV6j4xzdlEJ8hF/WaGJCwJS/qPxFoimEHzk
	T4xFPXL/uIwJVhaqA8maPGvB5bjc0J4aGdvHyXaFzyQ+PMSVY1GMADlslkAE9Ceo0kSdDJXNwrZ
	/+ARYvYzyTZCaLOc3nPrbT/cK7EHGoT1VWRpE98zoFuHpEuEkXQwYcktZckm5zVfjFH76rggbPY
	bKYLZ+z2IOZsCE9cNiyCFtKVcRslAWq3DOgSUbMAkf
X-Received: by 2002:a17:90a:b897:b0:3b0:78c8:d56e with SMTP id 98e67ed59e1d1-3b078c8d810mr4853614a91.27.1793816117845;
        Wed, 04 Nov 2026 10:15:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b32a6ee3sm31870a91.7.2026.11.04.10.15.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c71966998so13808566d6.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816117; x=1794420917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
        b=gkQR9ahx8KkLNLX2VxqT2CbS7yb7RnubHfDIFTo1tRcDV5FPzbd1f5J4iLAArU7fEC
         pB+C8w7klgUmewJWTFTuuJY6hv7JF4GuOtiF8OKp+biPruGTrnpLIu9W5QMv4/2ge8M1
         p7SDSAdVv7mY9fIwMPzr3d+DsAi6lTYX83nRg=
X-Forwarded-Encrypted: i=1; AKwUvByiSB6pLMGhnp8LkzF2q3c1ZGKVtMiRjnE8tBC+OVmTQ8QutpT52aW64v7/uB4dw9lb90mVi72TPamU@vger.kernel.org
X-Received: by 2002:a05:6214:8110:b0:91c:61e8:f9cb with SMTP id 6a1803df08f44-91e792ee5eamr60525746d6.35.1793816116305;
        Wed, 04 Nov 2026 10:15:16 -0800 (PST)
X-Received: by 2002:a05:6214:8110:b0:91c:61e8:f9cb with SMTP id 6a1803df08f44-91e792ee5eamr60524216d6.35.1793816115094;
        Wed, 04 Nov 2026 10:15:15 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfba098sm25119636d6.12.2026.11.04.10.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:14 -0800 (PST)
Message-ID: <675d9836-4958-460e-83e5-159627c8b0de@broadcom.com>
Date: Wed, 4 Nov 2026 10:15:11 -0800
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
Subject: Re: [PATCH v3 2/5] bcma: scan: support big-endian backplanes
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
 <20261104-bcm6362-wlan-v3-2-e46562b2ac12@mythread.it>
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
In-Reply-To: <20261104-bcm6362-wlan-v3-2-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:30 PM, Alessio Ferri wrote:
> On some SoCs the bcma backplane is a big-endian peripheral, so the
> ChipCommon ID/EROM pointer registers and the EROM itself read wrong
>   with readl().
> 
> Add a big_endian flag to struct bcma_bus, set by the host driver
> before bcma_init_bus(), and use ioread32be() for scan-time accesses
> when it is set. Core register accesses after the scan already go
> through the host ops, which the host driver provides with the right
> endianness.
> 
> Nothing changes for other devices.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

