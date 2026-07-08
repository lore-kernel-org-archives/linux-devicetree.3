Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905F3CF200
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 19:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783539847; cv=none; b=B0kxiT4RiwYu5SlqltZBAYzrQS8UptITnXWBhTtEmQWW16DRm/yk7AGWrCZCrLK/+2asgBl1YfkVFZ6VHrHlrFGytqEsYgcr7MG5BOpkBJ7D5CIfbs1XRwCTDvujS/vaxxyP/lokJYDkahs6595zSQxw8joRoaye2TAXRuN5lts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783539847; c=relaxed/simple;
	bh=sCBV4R2IskE+Qnt8X1ddpdk4fJf5MMWKVa9tRTgLXvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fb5z9OK7X/MFaNVyrNcAljZ+hRrg/4JKiih/AoZvOoLEzJZdVNkKRHN9kRVB260sO7RWGhCH4iICbgbXnafccTpRBGZddZb44lizHdC8zGoH5aezRm/kFGMPeAtM4gu/NhHpJGB4IgTXFJXPTwsE19ODA/luTGgXF/su1UzAUWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9wamYBJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9wamYBJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so11439915e9.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783539844; x=1784144644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCBV4R2IskE+Qnt8X1ddpdk4fJf5MMWKVa9tRTgLXvA=;
        b=Z9wamYBJkxQNjZkhmBdNJWvecPMkya3cozZAsa/1bbhEEbfEV+4QvdJj0A+4VqfDOE
         icvHtxykM+DmHp8EZjo5waUgBHoFU0L6fgUrq4tv3YEIx4rSIXe2PT3xRRhbTs7OjG0Z
         03Va/KtNSAOPYTP6gi8YI4g30nerFCmnv8loOh8sIgXNYTmO30Tjw5sJBbJmfuHZEYuq
         9qI2tNFmUyBKph+PsKxOplrqbyqhtI/i7WtWQLAlz9qm14MPuDoVHVmZ3aLUc1BCVhZD
         IvO5KXy9zP7WjvGrw6ZdLevwvr6W+68LFaXW0LZZ/CP/jCUbERmJC/p4K24qfzFk55mq
         NqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783539844; x=1784144644;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCBV4R2IskE+Qnt8X1ddpdk4fJf5MMWKVa9tRTgLXvA=;
        b=WdPY7KWOQmzvkzMHEJnOFsyNQLqoSAQh7DKn7PgHXkawZ4BlT9dokAMudkj04Iej3Z
         AzEcsgB2HQOs9HuSHV3v6Yi2lfW3Zz/Fc4wgoNubJ/XPJvi5ilfMaREZ0u3WnoyUrcpV
         nN9BpL/1J9W7KKFWSmUWnCp6kU/c9ER5+2GalSWoDUwGKCiJlX/NRPOGpdMCX0jWQy4K
         KAZH+u5/BMFUZk99dujLgbS+RekAtkt/VLQHGhF2U+gNxtU7TCmhDsiMvsrSPWkPSNPU
         CBtiU2pJsUq/uy97dg6mzFqcKanQR6GGzjqA+dkPReDm1knEAdHcW8dvybdUJlVDUAYB
         DRkA==
X-Forwarded-Encrypted: i=1; AHgh+RoPlsYsWTc3DEvIPFmfJ+qWNTYw/8A9chxMeGCR01/JltA7yNdl1n9FYWe6yrVhbvbZLdM487FMAtt1@vger.kernel.org
X-Gm-Message-State: AOJu0YzTK0Q8nVyfc0MPFly9w4qJh+uRlvg+x634GrRF8DTbvm1LfnVz
	jEum0CP7p1i28hS6rSVdU8/Vcw6EHSpwpfJgQ1NEqKpIPJUhbDlcOnAN
X-Gm-Gg: AfdE7cn8mRSOC9BOpDWhHtDpCHefBg5QWZOl+tmUhhAebpFotrSzfMWsWgimNESHLur
	oj4XrSH5nzzvJo+gJ1CnZm73F0IyHD1RgwgI+L/5XtCst1o0oXoxaJxKh3m34NY1li/Wz1GT3Oy
	nLoZXInaNjlqaHt2Y5exfv8FMXEbCUnYWtgyYTUmEy5f3SLAd4y/fCBgdC40oZsBeG4TWboMp9O
	f26+mq0E6BHGdnXZgWBx57++KcMUXT5OqQCeJgEz8SN9C1Pc1qPxYW0sJKWwdqAYo31KqUKwknJ
	yb55e4zkJIk3QNehtPXfQRkxJh1NkxIW81BEofL1NWRoJpvp+p1q6nVCoP4H9lIDCZPBpdJ44uM
	/VcYxGxovGb8TPAglNvB7UXXs0HcsXv6sj9+KWjD96hhSZX14ZXHJkmE+tv7hu+ONkwIqjc2WFm
	yAFsMxF5iI/GzvQ7dhs8q+lsZcU4Wt7np9s3ddsLEeRx4MrvMdC6etN3v3K3PxmMq81YgXqi4bs
	hNHqYRG20QF
X-Received: by 2002:a05:600c:1d0f:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493e68b8007mr39812645e9.6.1783539844178;
        Wed, 08 Jul 2026 12:44:04 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f108:7101:a0d0:f2a:50b6:7266? ([2001:9e8:f108:7101:a0d0:f2a:50b6:7266])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm47175156f8f.9.2026.07.08.12.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 12:44:03 -0700 (PDT)
Message-ID: <df0aaf90-2baa-424c-8c83-aed52a4b4321@gmail.com>
Date: Wed, 8 Jul 2026 21:44:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/4] dt-bindings: net: pse-pd: add bindings
 for Realtek/Broadcom PSE MCU
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>
References: <20260706112425.3149226-1-jelonek.jonas@gmail.com>
 <20260706112425.3149226-2-jelonek.jonas@gmail.com>
 <20260706-player-handwash-0a3fe95cf5ec@spud>
 <c19e563a-8931-4f31-b05a-ff8def4a5161@gmail.com>
 <20260707-dove-fretful-e3c8e237f1eb@spud>
 <2afc9c9a-eacc-46ca-b965-4cabee8f7094@gmail.com>
 <20260708-lyrically-footrest-10963a12145f@spud>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260708-lyrically-footrest-10963a12145f@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Conor,

On 08.07.26 18:56, Conor Dooley wrote:
> On Tue, Jul 07, 2026 at 10:50:21PM +0200, Jonas Jelonek wrote:
>> [...]
>> Ok, I hope I put this together correctly. A concrete proposal:
>>
>> "realtek,pse-mcu-gen1"                        (Protocol Gen 1, UART)
>> "realtek,pse-mcu-gen1-smbus"            (Protocol Gen 1, SMBus)
>> "realtek,pse-mcu-gen2"                        (Protocol Gen 2, UART)
>> "realtek,pse-mcu-gen2-i2c"                  (Protocol Gen 2, raw I2C)
>> "realtek,pse-mcu-gen2-smbus"            (Protocol Gen 2, SMBus)
>>
>> This uniquely identifies the protocol used: first generation and second
>> generation. As Rob mentioned before [1], this also pulls in the raw I2C
>> vs. SMBus framing in contrast to having it in a property. The framing
>> suffix appears only on I2C attachments because it doesn't apply to
>> UART transport, and this is given by the parent serial@ node.
>>
>> Though I'm still open for suggestions regarding the protocol
>> identification if "-gen1"/"-gen2" is not acceptable.
> This seems reasonable enough.
>
>> [...]
>>
>> It would also be an exception to the other PSE-PD bindings. They describe
>> controllers used across many switches too, yet none encode the
> The difference is those cases (for what few pse-psd bindings there are)
> the compatibles correspond to individual devices. Here you have
> compatibles you're going to use to cover multiple devices (with device
> corresponding to a combination of mcu/firmware/hardware behind the mcu).
> That lack of a 1:1 mapping is why I'm asking for something different from
> you than you see with the existing pse-pd devices. The switch the device
> is integrated on seems to be the only thing that reasonably makes sense
> to use.
>
>
>> switch/enclosure. Board-specific compatibles might still be added later in
>> case a device really has a variation or quirk that genuinely needs its own
>> compatible.
> And in doing so, have to retrofit that compatible to all devicetrees
> that use it. This is one of the reasons that we generally demand
> device-specific compatibles.
>
> You could add switch-specific compatibles that fall back to the ones you
> provide above, with the driver only using the ones above unless
> something crops up in the future?

Thank you for the thorough explanation. I think I got your point now and
understand why it's required that way.

I'll rework this for the next version.

> Cheers,
> Conor.

Best regards,
Jonas
