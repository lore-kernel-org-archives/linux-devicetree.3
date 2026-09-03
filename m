Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8830382299
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470247; cv=none; b=mzEYnoKZs924RicQ1Kr730mSz4DGgwD00UHhKAcyLvBkHcHnG/6hnZs/Eyf+oJIbo0IN9P7HLUkJfbX6HsvJx0JwEHwi7BJmMx7bar2S37MDJtMYxPlx1rS+EJ3yddIqpOv5Xxe7WG02ePTlNEHhoyVEirQfxjZkQ1fWyvnHkD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470247; c=relaxed/simple;
	bh=lN7fNt8edbyg0Nkyp2lbMtUhYvphWqZ853l1sHFSnUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/6F+DbzBkD7tsMoGmdVZucVY01xpCfvQsWS/rOmW0TYZbVVLqL2/E33vpXVdglsOokCVBsHUxWsOeGBHraYSbHjwmY0/6UlyPDWZ2nVch8HMwt7O1F7CNCSTVJPV2GYDP70PfjwcUx1mtoz8JQBf0iZwQtxbja9mMTZ2Pd1/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bc92gUSY; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bc92gUSY"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2d9520b9155so2900615ad.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 14:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470243; x=1789075043;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gxqFLxTJnguRFYydNxYvORzf2O3oAQRZxALEShnb8Fg=;
        b=emYEfW7f8LBjk+jJSzlzgpomsoCy0xxukmz48+m26zqBEG6p+usX/Qq7HGkCJj2uIo
         jfZN9LlnVwycLsRfe1nZh/n/ouncU38cFKUP88tj5Mqk1Wnj5ChCp0gTdt9w+rZb09cD
         qzsKkVP6BwT9IbJNgdEUHzJgwAadZ3JURYs/48TQ7QJ2IoUX3iwgI3OBFvABDQavMY8G
         wAxUYn9DEcCZnKl5VA9G6LI4P36foW+DEGXtDmRQ5nvFmHaWxx6RQojkgEAdCIIj8fu2
         G2iDh5r4w3CVH2KZ7F4S4RhumLK6e8YpJ18cHpe4P4dX49OvLcAZKiZxDzKILlwVmAoj
         ZDlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmTQCa6RH7FontAchH/Kp/puLarz3x8cDAUBqoR0TIGRV9ZI1S7OCgjU97SlJXZAfMhKOf7cawwxZQ@vger.kernel.org
X-Gm-Message-State: AFuF++n+Avl3XDoyox8VwEhWhfoUU7UyOxYUwyBXG8xktinTRqza8tdN
	RVvj1aR2maAhVMjbAwlQ8spu+FHEQjN/i9JVhp6WI1dSdEPKjugPY7ePUbGGe58/8uq5DgkHaEg
	6/mTTSnClVmGkqL/pAr1gWZ2913WEfx59TYWcT1x7Wqoc5TUxQdjYZl2/KKYUHIr/8Wlpcv3DKt
	HpCmgWDKb3WM4lsfhmO1AiVjnnamnuH7y72p2hWIkx+WvoSqAHxngY+bAfygZZgEuqy+g9cOOL/
	AwWvYVDIBs5XcNANM3NPA==
X-Gm-Gg: AYBFou27yZxzTFK3tsVZVgDHTmjsIMkg9hQ3kg4uyMANPQBd8jSi0Kn8NQ9FAJaREmr
	6WbhTN9f0r2bDqd8MhVVyUWCEloTjeZZYG3Ez0SNzKGv54EXzzcCixWF6hyVu381CeevT031D4d
	pdJWQMcr7Zivz1zj/V+5YONW+pZhd54F0TrRn0tlDUSVRZCs+5xiWUvhcyS3a/cyl2/6UCgxaer
	y4ThfQpfLkeHVO+nYeYsHkzZBa6+nzVka18RE5O8hgYoZIBs245EELgOZNYikh91GAVE2pzNkBf
	ApcEXQ8t2mNSFDbsnXtzo+45PElCMBlMCZmvMBQ4ffN1aYaMotTJoIn97Z52fZcI70uRw8vutMi
	pEW5crKWKE5Y4GI+8U/i0AWVwhaZOt57nkWa5DOTYHHucaq15DRSV57mR7cUmykHSNd/9QZO6jp
	gIh834DObcWK7MDPxOGB8Xx2goT9o5adxi2LWJXl/Z
X-Received: by 2002:a17:902:c40e:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2db125ce071mr22750265ad.3.1788470242926;
        Thu, 03 Sep 2026 14:17:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2db14aedc18sm174975ad.29.2026.09.03.14.17.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 14:17:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8dd8be81so4815206d6.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 14:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788470240; x=1789075040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxqFLxTJnguRFYydNxYvORzf2O3oAQRZxALEShnb8Fg=;
        b=bc92gUSYvX87o0y4q7BItqQuaXnfYbynLu4kvtoCSWYeQhuFkl+GIcT0Qota8QwjsX
         YECSAzdignZysvespjORGsbJiFqqs1QCGPAW6U+ONt9T2VSIi08W4g7UG7M6EYq7b41j
         xHL+Tj0jwDoN1Z9GqnrtyCQe1TQatUCNt/gjQ=
X-Forwarded-Encrypted: i=1; AKwUvBxfeHEKdO0uxYfoa7O21tqV3x8j9gDchzBYlWtnBVH405h1qlW4QkGw8zwzwA9LBmhIpvaUZs+G1qHU@vger.kernel.org
X-Received: by 2002:a05:6214:dcb:b0:90e:876b:3b20 with SMTP id 6a1803df08f44-9103eefd25amr23988506d6.4.1788470240303;
        Thu, 03 Sep 2026 14:17:20 -0700 (PDT)
X-Received: by 2002:a05:6214:dcb:b0:90e:876b:3b20 with SMTP id 6a1803df08f44-9103eefd25amr23988026d6.4.1788470239714;
        Thu, 03 Sep 2026 14:17:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040693abbsm3979336d6.37.2026.09.03.14.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 14:17:18 -0700 (PDT)
Message-ID: <636a448a-0711-4844-af62-4b38ed7cce86@broadcom.com>
Date: Thu, 3 Sep 2026 14:17:16 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Stefan Wahren <wahrenst@gmx.net>,
 Andrea della Porta <andrea.porta@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-3-pbrobinson@gmail.com> <apl6RddLcPz8Q2-O@apocalypse>
 <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
 <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net>
 <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
 <CALeDE9Mr4asKmQaQ3yRfnf5B4cvVkZuDTB+8BesPUy6djpkmVg@mail.gmail.com>
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
In-Reply-To: <CALeDE9Mr4asKmQaQ3yRfnf5B4cvVkZuDTB+8BesPUy6djpkmVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/3/26 13:55, Peter Robinson wrote:
> On Thu, 3 Sept 2026 at 19:55, Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> On 9/3/26 11:47, Stefan Wahren wrote:
>> [snip]
>>>>> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?
>>>> It should apply cleanly against Florian's next branch here:
>>>> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
>>> this branch based on 7.2-rc1, not sure this is intended.
>>
>> It is intended to be based upon the last -rc1 that was released.
>> v7.3-rc1 is not cut yet, but when it is, I will rebase all of the /next
>> branch on top.
> 
> But  v7.3-rc1 was cut on Sunday 30th Aug IE 4 days ago ;-)

All of the /next branches have now been rebased against v7.3-rc1.
-- 
Florian
