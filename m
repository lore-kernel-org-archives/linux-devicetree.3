Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D251B179
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908738; cv=none; b=s0ZLz/K9XZNV57jjbzHFL78stO+YBNByTyLeh4UC+5rytP9hVSIXxqFqU1rrgh1axuTIWmoOaPv4+oJdyheXb8cH1wc8t20UtX5FQZ8lEtN7BYvRrwO14o8f/0o26BzKl2gQWg05znX8Wc5KS7e9xtFO0+kqe9obutglLxVA4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908738; c=relaxed/simple;
	bh=r7QVfrSLTiR+kegZ6I68Q9BlO4M3bZUiK0r4CishVpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTVNyCUHQNedtLVG+4QRt0P0tCH6xJgE9n9E02WIEZ5C5jCjvH0gt5pzK2bruLmGGn0nA64JtrKVaUmJXbA79DCoLmrVRdLJ53zb/TZnURmttEZwHXrqyXiVbLjuJZJLVpTjM7WT9UMXCeFY8LsYmO+risxMWtIoT1EEmWrqpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gdISkMKl; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gdISkMKl"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso15541a12.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908736; x=1792513536;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IfIkoEO68eIyOaY2NwfRxWxBVADQsDUrhjRGOkEGZrE=;
        b=bxqm3nBSCOE2uwcLeZ/xkdU9Bue2Mr8UeFZfsPs6kFziyCG4AMMwvm3xzAkA7NAMXQ
         Tk4rehpMFaDrd0Ta8Icq0UbcLgBEluNJ/s2YCG6DkyTdnzcbfo7Haw04p6R36mcbmFTb
         JMCY63KRCJpHy5Xgh0WOtRCTA3RzBGln2++D+S9P5Uj0ZI8jpepd9bGatgt9ENl9GR+K
         fSkd1W908p91g8eNoWkMMzrdj2M5rQG8UXkNfrzbDAF5/5UWwLRBQDKJOXDLFoGT3w96
         Nh7BGUpdA3nWt5DO3zWh265FLHuf7O/z8uDJoqy7/RfHInFcQu1DpXjrQx03Z+Z9uT/C
         +ttQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrLncC8KY0aJnqzXGd8FyuGafpLj2u1CYKaqfV0sZVPT/EK7LyrpAdyBMOFCeFjMty9M7n+YBni9zh@vger.kernel.org
X-Gm-Message-State: AFq9FYIoYHivMQZIQlg501q9UrvkIX5jDNzXF1BdUDEs4/eciinIelBK
	+ITB5JYrYdmaKu9Hj5ufvMrFTKCSBOb8NUU2s7EUDRcyEriggK2wKTUHgjYGswcpydq0Hb70ZE9
	R3gJDBHWTf0/Y/aoCBldBTu1d73GVXClYAt6NxUdX3lc7llmzTjDF+FchYIewxS9GEmgXRihehC
	opXjcUxFL9E+8GLIrqIM+1MSGTnykuMlbtXO19U6zE0t6dy3PQmu7FNSQiQhzkNsx2WWGR5KqWt
	JC6A2oLbt+rPV9gldDAFQ==
X-Gm-Gg: AYBFou2G3OSzl3k0zumINVS0IETZC0kM+f0xycQXcMEZkuAE/wcBAbt4Y0yhE0eGgJ1
	Tcbag4Nn0im/Ni5TxTK2LtMm/JbTX915zDmjWWDJRPb0XytmxzdR/RmV0UGku2sbeDO+UVArnAv
	r2k69SxdQbux48DObMNmqSyjjQNObvIFpDjbTykYQfWzSJCOerXLfusScQLoCUY8TGA2enYJRdm
	l3yBckdc87ezJAbeINxM2BmpA6TPVtlLAFXITWPwJTP0EKb9fUiDGxOZ39V05UrHDrxSBrjdlk4
	Bt8F7VXe0szr6VNdJLr3Jv8WZkEO6i+xYDLQ4q/DlBCcpfXKMuVDEK3rsp26RRa17oGNfLfT/dS
	YSiFJLNZcfnmDQyVnY0jMzmrW/lVtYANXFRCk+QXH+QzuLgGkXvo3yrP4QOTtb60gOSQnvrZIev
	NP6F94IyZVdR+TXJ5R2fEczEpo7QUB74G5rvdnLHoDj/A=
X-Received: by 2002:a17:90b:5186:b0:3a8:6424:b1b1 with SMTP id 98e67ed59e1d1-3ab3ab30ec0mr11119201a91.33.1791908735515;
        Tue, 13 Oct 2026 09:25:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac5f23763dsm73014a91.7.2026.10.13.09.25.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 09:25:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e61a8eb087so1493875ad.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791908734; x=1792513534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfIkoEO68eIyOaY2NwfRxWxBVADQsDUrhjRGOkEGZrE=;
        b=gdISkMKlZxORIVyyJ47BQ0kVAyTmAqlwLjF4N+MNpN82tIHeb59CCUO6QAKB/ZxB5C
         mqsa7MXL//d3zeegvBi/93cl9TbhCzodsHy9oTYYI9t5VtPT3mdQGIY2mja4SwfO/UfY
         nkGIgtNHgnA3dhQ8r5vantODbnUezb3HI4ZTY=
X-Forwarded-Encrypted: i=1; AKwUvBwfcWIT1gcPFNyOdsHvzAW5WkgDzfB/fIW8UuDgX5Nh3qe3wZ54BnZVf7ZTl0t/5WxL7ZcFYgC2wjou@vger.kernel.org
X-Received: by 2002:a17:902:e888:b0:2e8:4078:84e5 with SMTP id d9443c01a7336-2e842cd449fmr109804195ad.20.1791908733614;
        Tue, 13 Oct 2026 09:25:33 -0700 (PDT)
X-Received: by 2002:a17:902:e888:b0:2e8:4078:84e5 with SMTP id d9443c01a7336-2e842cd449fmr109804025ad.20.1791908733119;
        Tue, 13 Oct 2026 09:25:33 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422fe6ddsm59426965ad.83.2026.10.13.09.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 09:25:32 -0700 (PDT)
Message-ID: <6ceddef2-09af-49ba-87c8-4c39e34d36ac@broadcom.com>
Date: Tue, 13 Oct 2026 09:25:30 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] bcma: support the BCM6362 integrated WLAN
 backplane
To: Alessio Ferri <alessio.ferri@mythread.it>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20261012-bcm6362-wlan-v2-0-4752da7e0982@mythread.it>
 <b7e21fad06d27f88b3c18060b4f4a69149de52eb.camel@sipsolutions.net>
 <20261013145630.52fdec0d@DELL-MOBILE03.ad.smart.it>
 <20261013181600.58ad8dc3@DELL-MOBILE03.ad.smart.it>
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
In-Reply-To: <20261013181600.58ad8dc3@DELL-MOBILE03.ad.smart.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/13/26 09:16, Alessio Ferri wrote:
> On Tue, 13 Oct 2026 14:56:30 +0200
> Alessio Ferri <alessio.ferri@mythread.it> wrote:
> 
>> On Tue, 13 Oct 2026 14:29:37 +0200
>> Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>>> On Mon, 2026-10-12 at 00:45 +0200, Alessio Ferri wrote:
>>>>
>>>> My router is running daily with it, using openwrt kernel 6.12.
>>>
>>> [...]
>>>    
>>>> This was drafted with the help of an LLM and cross built with gcc
>>>> mips cross compiler and checked with the dev version of sparse.
>>>> This time i also ran dt-check-style and it didn't flag anything.
>>>>    
>>>
>>> So ... are you running it or not? I'm confused.
>>>    
>>
>> I don't see your source of confusion: i am running it with kernel 6.12
>> and it works, but last i checked the current kernel is not version
>> 6.12... so i had to rebuild it for the current kernel and i did it
>> with help from an LLM. And also i ran the checks for the dt part,
>> OpenWRT build system couldn't care less that i didn't even register
>> the bindings, but i know bindings maintainer care about it.
>>
>>> Either way, I have no idea what to do with it - I guess Rafał if you
>>> want this picked up then let folks know? But the last patch should
>>> probably go through some MIPS trees anyway, so the others might as
>>> well go there too, I don't care (and don't really _want_ to be
>>> responsible for this obscure corner just because some wifi drivers
>>> use it).
>>>
>>> johannes
>>
>> The original code is Broadcom's. You can also ask Broadcom directly if
>> this is correct/sane for them.
> 
> I must say that i was pretty vague in the last statement:
> By "code" i really meant "C headers", and by "ask Broadcom directly" i
> meant "ping the Broadcom devs already included in the cc if they do not
> respond by themselves in a few days".

As you should know by now, the folks working on this never cared for 
upstream in any way shape or form, so using bcma and Device Tree, and 
combining both might be a tad too much to ask to review.

That said, I think you approach makes sense, but Jonas Gorski who is not 
copied on this patch series, but is now aware of it, should really be 
reviewing this.
-- 
Florian
