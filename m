Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619F511186
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466215; cv=none; b=oCHnaPXfnR8p/ctQoaud//BXwWSypynVv79yneYGS0jLcJswYcq4hI2qj3duxyw9ZmyvUaaYP0kNZEjTtr+8GnV5sjLGD/KG/NktvOdIafx+pdJ+AprrTXnSz7gBWrojTU5tJToNc5w8aKJ9kDckT97JaUo2f3oYoq74nTJqYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466215; c=relaxed/simple;
	bh=E1U5hho08XEzApGAbtz78unQ01JG6pZApPq0d7d4OYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MQ8Tx1KMWyiQ41SsoUaAz6atzRa7ElJeXfP5yOLQx30sZuEw3EaDmku967RkChAU7/uA2D52ibW68xic4HwKxwLKW29KacdjORiPCcadmZtA1Y9deMscNJAU4D3g7fADjcMfx0H+/4LiLc8Ia0hE96fO+9/4iZoB0RGggHB3E00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MBXWNDbB; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MBXWNDbB"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-85377c8bc96so248443b3a.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466196; x=1789070996;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H8F5ngdEDHcCWWcWsAIIbVDmiLa9rm9VXg/s743ljT4=;
        b=pNP9fa8eEuenr3R09dsfA3bRWYybHkI/y1JbgcMBbFuukvbfq82yDHYG8efYe3ELGr
         U2608jsdtFzlvYpBuuefADrIS3teckMFnqmzhpCRBVP4e0YwYMEU7en8MXDCOYV9OBoS
         5L2AtckAwr44zIAOhr8TcT052MKsDIg7SNU5jZesY90g5pT0jEnDK8Jkt91AFTEY5cZ8
         hV2nAMRUuSrCGN67CYV8FjY2HCxS0y6Yj7PcMjJ4s4UXWBhWafyaasKgZOpyyN62ewXN
         wszzb7J+myczb2gv7bzjhnfoCGQ1Af8EhRLTN4fFdkbgcUjOijaGotPuQVaXymOzxVCw
         GydQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXJGIWOxRfcfUc8qYJc5nCp8SbJcXNnWznpeu4A+Uvh9hB06JCnS8x5yrPcYnte3N8vJH1JAR0NXWz@vger.kernel.org
X-Gm-Message-State: AFuF++kK/g039bQRjiWAQEj9tXQ4vwiZNvDgQDI2Vbr2Jv//AcbNwC8Y
	gLJt3YHHEQIkIlmu/GUvtEawv0U9bVhqnI3fZ9WL7ukKjhRMqQ332kxRw7RmvilFZdI4TXPC0YA
	YEqRJWFJHdTYOnnARo4q9fzul1Kds/qSgY9Kq3r2Rcdk4cdlQYCHQlaqLdSiuWzGMYJew6+n++P
	S34YtSmWJ+BjZrxSfVdnE0K3xZKjQyeBjUH3mLoi9cVvxfK5Yc0n23uRLtgBbgFU7jyFpnaioL9
	Xhf+YUy+SYlSR79nAts8w==
X-Gm-Gg: AYBFou2nR8oJLip2XNUDN9NVDdJamZiTYxjrdqdgKGGT5rfhgKK08hFcvrZE9u3x7rD
	zNlGnqCqc1OEbpXewC/rR4gSfhIpCYqKH6T21DF/gozM+LfQ35T1WiPmazo0axs9c0n/t4UVzpi
	LQY2YLEjs4ZW2/EBVjkM+cUFNyNGxEOQgONmeIO0P1j0MFvWyrspRFB5hng7u0h48e4HVhI2HaF
	6MuJTmjpHl0TKFUfjAUejP9HDkNFkCvdwaVo27/qDLy8jwd9PcoDaUjZZ3i0aU0R1qF5t0ss+1U
	d7cPcH8GaHWnsVe0A+oU7sMMonM9vELZVUqt2czuZ5Xn2LLFF4KzrsA1mua/TWZbgWKyGAn5zkW
	+UjLzhb/XZl1I7suwU+wm8NSu17KHb28tERCGlN0+oIdWOlVI5wU0sBJXeAAQ0OlZkAprSycxyj
	+dwjw++JD3KPvxNG2r28R58RMYuZSTHoPiZVOCx+Nw/RA=
X-Received: by 2002:a05:6a00:8d8d:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-861662d4c0fmr2270575b3a.4.1788466195733;
        Thu, 03 Sep 2026 13:09:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc45512cfacsm48158a12.2.2026.09.03.13.09.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:09:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so361480a91.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788466194; x=1789070994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8F5ngdEDHcCWWcWsAIIbVDmiLa9rm9VXg/s743ljT4=;
        b=MBXWNDbBdgYRsb+TwRU+YCBT2vRXIAJHeboPbal2+w4748Anks2ZPE0jpi4vrhXWjn
         y7DcWIeg6/CtpdDjvxNTQ6XsV2ekA9gHXy9RgMsvGvLN5/WjRk8DYefaFoO2lGHo2YGe
         FpX3q+zbMg8OXss25ovtzpfg94i3bFfFNfHi0=
X-Forwarded-Encrypted: i=1; AKwUvBwQdN4wdO1QWTS86+ISBMGVgslHdSE9anhZ6f78TTovjAKBoDoUCa/mLwKBX95v41iU1+evaqFpZ2rH@vger.kernel.org
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr1546089a91.6.1788466193823;
        Thu, 03 Sep 2026 13:09:53 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr1546001a91.6.1788466193375;
        Thu, 03 Sep 2026 13:09:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm1148434eec.13.2026.09.03.13.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:09:52 -0700 (PDT)
Message-ID: <e05a1271-9286-4d14-88db-966c3745ca2e@broadcom.com>
Date: Thu, 3 Sep 2026 13:09:48 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Some minor RPi5 bits
To: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>,
 Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
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
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/2/26 07:50, Peter Robinson wrote:
> These are taken from the downstream kernel device tree. They
> are small components that already have upstream support, from
> older generation RPis or existing arm IP with just minor
> changes for upstream, tested on rev C and D variants.
> 
> Peter Robinson (3):
>    arm64: dts: broadcom: bcm2712: add arm PMU
>    arm64: dts: broadcom: bcm2712: Add thermal monitor
>    arm64: dts: broadcom: bcm2712: Add USB OTG port
> 
>   .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 ++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 66 +++++++++++++++++++
>   2 files changed, 72 insertions(+)
> 

Applied all 3 to devicetree-arm64/next, thanks!
-- 
Florian
