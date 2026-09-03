Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF021FC0EA
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 19:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464372; cv=none; b=JJpkCrc318BEcv+7dL66mCt66PnrmF+6t+W8DUxKwNK3DXjVxpdNMpH9N3dMiQsv/ipOWEOOUgLwAVCCkrwahrhfjXTtFj0AT3SW7fF4Hv+W40uzvvVfqEjJyTI0GTXBATlhKH9dqgHTNqKOPPhwHeJRndAiAE5f+zYvD7B7mLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464372; c=relaxed/simple;
	bh=LN7JYRU15LGfPH+1olYBMQaGqGog2QNieXhz1gdYLB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8Kgm3eyy8a08Z3TX7xlNCphdeCJ8sVnkub64bPYorruVVY3jP0hYNpJCzMyxhu+ksFcJAXXA4UcbKs7Rs2i08KYszS9tIHKfRjh5N1WGrcU4sGTh/+cmBOvastVl1D8NohF+R7+8eiNKCdTE2d1d+ToH6hHPjMbRQdUbQBxA5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ae9XzXol; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ae9XzXol"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2d9004f39d3so2812765ad.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464358; x=1789069158;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Usv5SNynw+4aZQ9DPp9M1Ly8wN0kqlGi58tc/lH1VY=;
        b=PC5e3gtjbIiuTKDgKzPcGrqmA3YlP6mTIry+ILTouFS2TCzfsvVC8hlLE/q1szuza4
         OCR8R48c0YZ8Tfy9eSWyEnQgFc/K2YWlMdeOxjXaHCHlXZAYDLSadcuQzg1FVabFj0NK
         x8i6gIH6kVdqkeaoILqB0Ww7/Fc1oqvGombeZfow5dxO3X0mMwfuU/Z34hJnzXtKe8JU
         ovrbS21U1QFcn6KDYQ4VBGV1y2kqD0hL05hl/VjIGHQD+64oNADlleZEMbwqMmyirHK5
         DM/LsNErKd6cg5dIZd9y89OCdd66Vm+g9SShSxo3+Ui4Q02YjNnqiN0YqgddVZDrvJPq
         zmmg==
X-Forwarded-Encrypted: i=1; AKwUvBzLgCbbTabj7DmlkzP9IpaH5PLi4IuMBfkKFTeXvbrZYtgvxqcx6WDkawi9tzAgyOtg9H0Lpctw2Zlo@vger.kernel.org
X-Gm-Message-State: AFuF++kCAzN2PutIO/7A/77bDXVOKxSTq3GjSRCWR7UveJ1XJkrILxWd
	Cy1F9eTlziFkfJmodBZSKb9BjCIjzphAv1tZgvooXAdqAwQr0V3YgbQrJwKpptEWRX0H8Ugr/BR
	CTqdWtfINl1+A6rvd+NrNXlhQYNG3nvnpXgpGURADdSkh7T4uYOVgLj4niddDG/i6GipQgh+jc7
	E2tuV+KyN3qXdpBxzCTJEZe+tFRlo2WrakOFMdkr3LiavbPb7dpPzUyUPrwPSY09Jipqc4mqew/
	u+181/e2vV+4hE99nEe9g==
X-Gm-Gg: AYBFou33txTL2GdMMTwWl43BMNbmmF1o9kwoNt1xduh+krS3+j33gXs3vvzE0qLCe/1
	6DvVITkoezvzv42po5MyDsNyKoahAqyB3yTKju4H9S+8pR8hE5PqIrwwOGm4n64oY+wPtLV/Wac
	6JUlUOKqR8zg35J9MohpPJJBYeJA1ehnGGHQTm5ZbjZ7P7u3dp9xCY9lQC0nmrgpucL2+dBk+eT
	UM5jFjd2oplidS4pw5ZZ4cB5s5ShIfy6uKzLYNHxjbDxf5SaZv6ItaxQb8WukyUrbQ6G7HUWAck
	r5qInObU6mYhxzbcom6pkkmN8SY83UtdyBlWfZ9rXYAezZ1Nwzd8iGkt5g3y2BDRPxs44Z+P46X
	+rw1Tog6/VGxh0SyRTFdffvjcNwORYpHQhNH9d/02SLgw7DP3wvoEfW9wndcV3FBOqE57vPD/IW
	hOYOO7SIfiBjbc5HcicTmt7F+yPoKXKexfqgWmtVsn
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr1333910a91.1.1788464358140;
        Thu, 03 Sep 2026 12:39:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b260deb5esm154197a91.3.2026.09.03.12.39.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:39:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so253419a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788464356; x=1789069156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Usv5SNynw+4aZQ9DPp9M1Ly8wN0kqlGi58tc/lH1VY=;
        b=ae9XzXol1k5RWjNG3tKh5IiI31lvSlUYQPqLSoqkTDv3XTGlZkHNhkoMVtVQjaFzQf
         Fguv0icjjJ2dW7iRTZcQoTI777L2sGY9J3U1DZTv72XbzqKyEpeVv+3KcinTXHGEzYkO
         xbcOa2mt5jR9OlMnR0uA1rtu7Lxvw/SYuyjfQ=
X-Forwarded-Encrypted: i=1; AKwUvBwOJhrq3nc1dz5fKKPSVaw7ra24uFMEppINf5kHmaDJ+6U32YpI/x8CauCRJCtOEqNr2qURTJ8Lu0BI@vger.kernel.org
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr1333653a91.1.1788464356506;
        Thu, 03 Sep 2026 12:39:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr1333593a91.1.1788464356086;
        Thu, 03 Sep 2026 12:39:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm1349016c88.14.2026.09.03.12.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:39:15 -0700 (PDT)
Message-ID: <31166950-1099-41c5-bcf4-13e4641dbfea@broadcom.com>
Date: Thu, 3 Sep 2026 12:39:14 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: bcm2835: Add the V3D reset line
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
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
In-Reply-To: <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/16/26 07:05, Maíra Canal wrote:
> The PM block exposes a reset line for the V3D block, which the vc4 driver
> uses to reset the GPU when recovering from a hang instead of forcing its
> power domain down. Wire it up in the shared V3D node, covering BCM2835,
> BCM2836 and BCM2837.
> 
> BCM2711 already describes the same reset line for its V3D node.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
