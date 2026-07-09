Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF66D2673AA
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603146; cv=none; b=K65OHl2B0MSU/ZoKudxIVHK3oVARFavzCyTpCLWaamKdVYL0vcqsfCWZl1UaywhBzdEFDV3vYFSqen0ryIZc8aRwxf/fPmMlaDgd2EgGoATtaRhN8joHzFZPa3cN6EH+/Pp8T/vpQw2xwzUtmyURJHUjFRy8azn37nqZq7AZuHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603146; c=relaxed/simple;
	bh=qLpZfRDck2P9S9s83qTaQY64G0xBp+roc57MfR5tjJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m081+kqzaI1jI5E529UA0kQMia1bB85rGot+nF+vuBJSG1zpaWzaGUTXK99/e+TaH25VaiAcwE1nHCtq70OE2E5UX5g8DERtLiQISyF6F8YqooonBlXWq381MByHIzA4UKnqJey9CarGTDk1hMTbe2jaa762mXzSgVWsZDsmru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G1T6CsPE; arc=none smtp.client-ip=209.85.217.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G1T6CsPE"
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-73791ee3612so1227078137.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603144; x=1784207944;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=teJf0/XACgISKIz8PSaK7HxonkgpEyyYx2fgIQwMoFM=;
        b=X9/g2GfBdAzs+vuEFRfBY2McCvoFAf2Z3Jt9Tk0L3O7R3oF6wP81gx3SVRyawCEDqx
         v6FjbRn8drCion6GXUJhm5iuYEhdCFvQPqNHsIp/rPuyBK4zmwud1CijYdWxR1Eu0EsO
         v9833Nlqj8izw8N8CpKNWzFO53UlYLFKHv+CQzsriBME5aqvGk8GQAZvqyoNF6/eg8W5
         xvSEJ1Nf6SAv0PmNk9E5uTTRpqX5PMBWnA5V0geLj9YDrTT3lkr/lyzmepqnQpVc+bnh
         SDfXtwHxK6YBLCqEYBk9HoFStOTeAc61jvQ5Rcr57TgW6yD3qiFxnuFHd7oGXVQDNCaR
         YczA==
X-Forwarded-Encrypted: i=1; AHgh+Rrhum5YEYeVyGpIU2VINhxXPMIl0KEJmYMdgnlELgI9SjPJ0sTMpuBK8+UglpzGefN97dd0ncRcZhJd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw63d0k0y+xIg7PB8zx0CqxpQB/+HXtThqklwGjYqsEfkHHKC29
	Jbt/ci/BKU80lFFhmqHRB6rzwzMvlwJIyQJWvIilj8P/I+5Od8RXKtJzQeGEw2TUaOIvm5pAuDv
	czPxAtlQ1UZK40qPcnF0xllWgPiXlZXqggOmbbFgNhP5ChKbIFJ72x+dGP9xTSa9KsXvyPDQEYL
	5R9lwxMwYjsjbydFeh1CPsuOaY6dvFRpkLS+XSu52lMzQn452u1fw/D/vq4Kym2IfDKpypVPhBs
	vclEefOI6cQtAc9GRNaTECz
X-Gm-Gg: AfdE7cmzxWx4RTXj1qeSQX4sm55zIiFz6KVrRpVnnLo6Acskfn/m+TLe41JkfieVhNj
	EaS/bg3i+fEopQy12V6cuWTZSciVUDQ0t/u+AcmpFrVCncwOlIgs6cnpA1yQ3l6zS9kroU2++eP
	thV7+l2x9sP8bDuvRDJn/dvNE0tt+grszPkqH8At/g3lhEyxG9sjnjWIKo3x8FiWCC8+UTGIIRS
	XoCV7Q+p22wmq74NuRkkJnCYmzIR7tl60IE1YUBO2sIJaMXtSz91r6hDuQBeWcMDG1i/Nmlih+k
	F8CzAzxFSkeRUL6yBAkcvLObTwyrpbY0zNsymUIYUdrrqUJNOLdFqo5rODi8/Q+7Bugfl5bNG2g
	Mr+stxruTswAcl5cvGEIYYsSp5GX0RE8JtYKiwy1eDyg3KrrLti3VSQn25vNjhK5dK7daXUbfcn
	U2qMsr4mpM8k9BJYnqYBSOoHvBpbepuDEBg6Gyxh5WJ9K6rV+N2P0=
X-Received: by 2002:a05:6102:4246:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-744dff2cefdmr4498442137.17.1783603143623;
        Thu, 09 Jul 2026 06:19:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-744d675efbfsm455700137.0.2026.07.09.06.19.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:19:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-475e540a0ffso507978f8f.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783603142; x=1784207942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teJf0/XACgISKIz8PSaK7HxonkgpEyyYx2fgIQwMoFM=;
        b=G1T6CsPEUnSliXGmzNDkIRHNzIci5C5Pe7WjjRG7cm5++y/FAwTTI3Bv8k4vN3bOGh
         tW0TFaxshk1f7LGP0SRkR1pTHfJ09IaNYUjBm0AMFNgU96zOfMipG54jl1woDHl/ZcCe
         Mez7KFa2FuBctKR/CLwniOBGk44n974Zd6f70=
X-Forwarded-Encrypted: i=1; AHgh+Rr12nT88Vdr62o1+5VcjUJ7ffP084U4uSuPmBTNhtcI5slyh+MoGY14Csg62zxdCJldfpQv9xTdtDLL@vger.kernel.org
X-Received: by 2002:a05:6000:2907:b0:475:f0c2:5b07 with SMTP id ffacd0b85a97d-47df07a47c4mr8080472f8f.61.1783603141878;
        Thu, 09 Jul 2026 06:19:01 -0700 (PDT)
X-Received: by 2002:a05:6000:2907:b0:475:f0c2:5b07 with SMTP id ffacd0b85a97d-47df07a47c4mr8080420f8f.61.1783603141327;
        Thu, 09 Jul 2026 06:19:01 -0700 (PDT)
Received: from [192.168.0.105] (88-187-52-200.subs.proxad.net. [88.187.52.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm52289408f8f.32.2026.07.09.06.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:19:00 -0700 (PDT)
Message-ID: <f25e0d6e-941e-416f-8c80-2c48e1b90498@broadcom.com>
Date: Thu, 9 Jul 2026 15:18:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Daniel Drake <dan@reactivated.net>, Marc Zyngier <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com, andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
 <878q898ulx.wl-maz@kernel.org>
 <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
 <fc88dfa5-30e2-4e94-907c-58de0cd8447d@reactivated.net>
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
In-Reply-To: <fc88dfa5-30e2-4e94-907c-58de0cd8447d@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 7/6/2026 11:49 PM, Daniel Drake wrote:
> Hi Florian,
> 
> On 21/06/2026 21:03, Florian Fainelli wrote:
>> We have an internal bug tracker item pertaining exactly to the virtual 
>> timer interrupt connection however it affected a sister chip (77122) 
>> and not 2712 AFAICT, now checking with the design team whether the 
>> same happened on 2712.
> Did you receive any update on this for 2712?

Not yet, no.
-- 
Florian

