Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450174;
	b=lARtba0jWY28DJJwByiVxpGVvD8/QCiXFMEAeJ62OS4KzwEWj/RZk4VaqIGX/P8+5+jx
	 UUNiVOBzFNIh4+iwVG96rfmQq5j5O7Z6Koa9jHMhQdtWhnZlZKkJaYf+7hrMM8ueNHadZ
	 DF36gKwFw8IikGfvgsJnBRctY0djBiIZZSC27aAzE8Fv4hKjwMWDcfkBzkoXScvFIWfyv
	 rpWWywiHldljhI/6RrZo98HOoo3Nx+qRZNyIQyWyncK3KE3/sOgUENsn8KI7/sMNYrlgU
	 Vsz2filWd0Zx+kE8jL8N8ybLngAbqcMY1JobAsgXoCxzUQwcU1ileIGBxxqQjUHZ/iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450174;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=BbQLzcz5N1dlPbUl6OzlxxVqvyHG+NqgOT2/CZytGRw=;
	b=nxpb9KCsl1LydfPfGzJuBnvdvvXhlg1otRh3+Eov8+EDPNZC8u2laBtVog6laGj817em
	 wHGy8FKzpzUNi0cnk7KOBHc6y0GLc+r6mEikYu8/4dw/9lQt6AnwTRli4qTOAlMiFEnlW
	 r7/kFU+UUCTgceTkOw58FMO9Idma4O+cWRo39i3/PXXEPPBA9B2cK87Qm575JC+xRxGKQ
	 gxyDV8oKoKkdLmpqKrXLKSSqMdtiz7llmBAjXojfdXulmw0i3MUndyh5BPwwVGhWZlIyN
	 wo1XMF9xLpdkjGWWgloOwZXgwaEybQamX9BtPgMmZgy12Vyn89I9rswt6NOQh7SmLDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JWTIaWYV;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E8C606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E8C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JWTIaWYV
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2f0621eec70so19940145ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450173; x=1796054973;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BbQLzcz5N1dlPbUl6OzlxxVqvyHG+NqgOT2/CZytGRw=;
        b=SjDLmojXGSKntVM3DyHLXIH821KjSXEKma2L2M155aCdgcM6FrM0bWPSPNGO2JZWb1
         uG+YXO6nrG/47xALFzGB6rL5ELmvCcyI2kY/OTIEZoT0pI60ApsjW5snUntlDA2Oc6v7
         XenF3kVyixnBL0+g94pJchExZ1qf/Z01fmPAJWWjx2oU5idqm4imPY4i//LSxBmUJFF1
         vM8JF9GyHVjizz6IdojJCfsNUKxkpLMM92sB6Jis0jP8Bu+ZE6WCwvW6CL53lwteJWDx
         9eQQb+nBBw3eHeMhAgxkSrUX6kXHP4mXVHaJfhv0qZHfHiR00znQdc1FAfx9mT67oIvD
         8QZA==
X-Forwarded-Encrypted: i=1; AL+hErH018IDOIl8srYVfWQoZ2B/3Y2NwIAmhNtIO0QwWRU6/9y6Ld86dUJg+Mf4S7wNtc+yjndQC6DLMcTQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9xEx7Bj6EkBJvhEwWa1+sul/eM/q+PoK5Hm20YIJzFEqIDmdq8
	HgRmtQqt/+8u56HxVPrpFzGGD/GfYAFnp4WL0/qWBwTaydp/VUiDWvbmqG/ynVcczIKjolVBUZD
	TJhfv6OIpBy3KiQec9ZEFuY5yYBlgoxBWhY2yJ2Id80BImLUCooi5RNzQncvmVL3m9TaR68Lb1L
	QTxy3smZhfB9cv38nZfuojwXzrjWXTsoFrFPK/K2xhs77FMQLexLoNacK48JqJGrxnciRCubBim
	3j2gU/++NQCgvpURAaEdA==
X-Gm-Gg: AZFdTZcUgENmAWgqb3mUMAUy9FKmt3jbVHGmSqR5T1b7EZdHcOF+BSuGPE6oyiI6asn
	nXRVJ6E0XPj2TZqUglBltOsIAWt0f7yCgvyH/oIjthJJL5Z/n85G5O+uvL5YMP9ShkPIJmo2Urf
	7kelWrbwrmDwI30hN9j1bnuPhlElQgi7SnzsRkU+ibUk9KQd6TioXvB0SKIf79dFrPq2SbnVIl8
	Ehu1hQ9qfZzpRznzCzaM9vdxoJW3vvfn1vMllF1f0y4vUBXpoWbeO7kaNg8lSB/+9stBBXzc4hl
	HJd1Zw5nzwsV109Gb1EnEKptE+uQKJ7ZkFIV9oEJOeshtJwsirE+55io2o/vbm+8Nz2pPOb175+
	jmpsQ/r9UGaqpTfht71n2807FlJ8qNm2PEb/uVA0OENGm8Ta7hH5TS4hhnNERU4Wy+xf0wAzNDK
	bRYt6nrFBbYAuDnVnexCi34Z+7HBKGzX9SR1K2Z2FUNPw=
X-Received: by 2002:a17:90a:e7d0:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b41c8d926amr10915845a91.21.1795450172901;
        Mon, 23 Nov 2026 08:09:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062a77f5sm9691009a91.6.2026.11.23.08.09.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:09:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3898068eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795450171; x=1796054971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbQLzcz5N1dlPbUl6OzlxxVqvyHG+NqgOT2/CZytGRw=;
        b=JWTIaWYV/Dyyasv19sXqGGi/XJ2K/D0cBPqqAyw6Et1pnruOAVeE6njEPUoA19oUcj
         46X8swluxFPgh3Ao+RE43vcovjhmAU9b86u8uciRv/P4T1vd+unTkvjm2qOwdmIssOS7
         2Nk7avrue2yGLL+7JnPf1W30wiHZhvKXaFTFc=
X-Forwarded-Encrypted: i=1; AL+hErGAOVyKiRPGYAclPMkNWszBClRlo3ID0E4QkeyriQlJpJ1aWFInuHFTgaHjmctQB2acTyig9N3YvWKP@vger.kernel.org
X-Received: by 2002:a05:693c:8850:b0:386:b351:d5eb with SMTP id 5a478bee46e88-386b351dcddmr2691985eec.7.1795450171251;
        Mon, 23 Nov 2026 08:09:31 -0800 (PST)
X-Received: by 2002:a05:693c:8850:b0:386:b351:d5eb with SMTP id 5a478bee46e88-386b351dcddmr2691953eec.7.1795450170519;
        Mon, 23 Nov 2026 08:09:30 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm40727775eec.21.2026.11.23.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:09:29 -0800 (PST)
Message-ID: <e9c24ccd-427f-4ea7-be14-9d05da6eec71@broadcom.com>
Date: Mon, 23 Nov 2026 08:09:29 -0800
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
Subject: Re: [PATCH 2/2] drm/v3d: Remove V3D 3.3 and 4.1 support
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20261122-v3d-remove-33-41-v1-0-52152b454ad8@igalia.com>
 <20261122-v3d-remove-33-41-v1-2-52152b454ad8@igalia.com>
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
In-Reply-To: <20261122-v3d-remove-33-41-v1-2-52152b454ad8@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/22/2026 7:47 AM, Maíra Canal wrote:
> Support for V3D 3.3 (BCM7268) and V3D 4.1 (BCM7278) was deprecated in
> commit 7ffcc4fffb45 ("drm/v3d: Deprecate V3D 3.3 and 4.1 support") and
> scheduled for removal. No user has come forward ever since.
> 
> Therefore, drop their compatibles and the code only they used, such as
> the GCA registers, the bridge reset path, and the V3D 3.x performance
> counters.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

