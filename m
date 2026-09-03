Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B829E50EBF6
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 19:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464227; cv=none; b=kc66lXuQsI0jVpWN6lXsaKq5v4SUJaU8tLwwcXUqkGrDa0Y2crGxhS3mj5ZrrLJDOAJQHqnQcBnWj+gwi6UF9cy4+VlsJP839AloRBOa38Ea9fz8o/1iMwTXEm1r71yJHVTWNsMtP0yJW7fYZq781C66PgXD+XtkpxyAfTfEpug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464227; c=relaxed/simple;
	bh=3iccK2COCSbdSQ38zR/SrnS6BUQcn6oU2xec4CtQUNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zgc+544VtJ1FJZEL7IhJvpDxGt1tGxOiCLUBRfXqXDSVpwVDFbuxeR6vBDVGhgfN9m/MxFK6wNW/LiGQanUkVX3oC8DAyP+3UZqbcroBFfO7Iar88KzZMvSERJGIlfHh4MjUxGbxZpgBVcSlzHTq1eU2iIu5RlUsXC0L7Rn5MuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ChocAzFY; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ChocAzFY"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2d6d28aa26cso1372655ad.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464220; x=1789069020;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wbmjJn4KRbF8oVMPpkd76I/qR3hSpCdh5Z2V63vUrww=;
        b=bZL8w/bbbtvn33aBZiEs80tiRdayxy0MwZGXdYMLV7cYgspWYY7ndCvXQ6C+b9tKas
         a1ztnWKYGqjLhcnUqWqD/WArabdsbV5X8dR9WSGynaxk6SVnz0OYGi/71wtIQN8QUKsM
         bB2Q8vg+1OIyCK9S2U0oR0V2bIUzrPacP14iLm5NZW8rod9S7TQgVnwPfK0GaFg4sWvt
         TLOIny8DKW+eIIyOF6OeTmFTAHCPkfiAZxemkoiDT/Z5+QpvZP2WAsRwO+7Vn9pq1uVk
         HNtFR+kppOzCNbsbC0QHcQvRftCHG8TIibxSwkDGyjjnlyGc+CCkfR1y4Ibasa0TRuS+
         pnxQ==
X-Forwarded-Encrypted: i=1; AKwUvByrb7Vxv1CDBHrscvkPy1kpXZMafgkPaOQZGCmIJ/3TyGaPOMNyE6jjXMfBs61E8uGD/ZzKPDyhBn/B@vger.kernel.org
X-Gm-Message-State: AFuF++lwcSwLa7xiYqa9dZn4pZHK0LqG3EbJZE8efZF+Y2AWTyV1kyhI
	VgYxcO1/ZsvmZS5tk+1SbFP71lufhuapdINgfn8WQ018DL8qu5z+hyPsa7at0fWTOV9+eohw3VJ
	n02UnVEJYgJZfKzeFS5J4HIcKOoCUCZo+eNBe+MVrVhC73dJ2YQv6FN7snVsI0TZno+GB6Ny2Qv
	Us3K93bwb2w2K6fXqFNICVSlq9EgfKeJ8XWDmYhE10t8T6zH41hGIuhkEViT5jMeHmD9PKMoyUA
	Qi3JgkCkNmXzc5ZrbE+Kg==
X-Gm-Gg: AYBFou01PcIrR7rm2gqmyjiclH/Yc62zur3NEDchgi9pwQQ2t5tHl2zCrQGBM6TKJf4
	ql0AGd5lHR2RsCO4g5Gsj5hDK6vwGihu4u/7FJsu/45eiUfqiRipmCuL5DxW68MQknvjkDRxZbs
	oFRytpn4x12dzUKyaYGBrbX4rqGLoWAUkCTJeupKNv/PdIppYsrPrNT8i/rvUFHKs+BV/FFICsk
	kjnRiQhW9C1ROK8dJ5wg4k0nmXIIlVXYGEk93AhZNiOggqiPFv+w3di2TlN4xFO3BEHLkz5UpeJ
	BMoAg7rIl9d2m9LBIDhAe4dn4WVHorQ78YP5sQx/whQUZy2m0TMNZ53GpTrC1PJJEI6kZIz7nPv
	IcSxMBEUPQXnTBSqHTZbwA15IW2qGG96Vfb7jP2SokOxvP8nsIY/SYE8O1PvVB/+9P3U4ZzvwqQ
	G/zLncQzOGpQYmOyebJ0iF8+6sMGP8ynahC67Bbifo
X-Received: by 2002:a17:903:3804:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2db126d8a54mr19605005ad.10.1788464219752;
        Thu, 03 Sep 2026 12:36:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2db14b28003sm51075ad.49.2026.09.03.12.36.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:36:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52f52ccd459so4560391cf.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788464218; x=1789069018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbmjJn4KRbF8oVMPpkd76I/qR3hSpCdh5Z2V63vUrww=;
        b=ChocAzFYJp8LesrDAnk6yJgOCRjwVcAYyV3r1Q1e0DLSOik3GjxnkODmkDsC2A8M6c
         BuwHjmXiw9vapDkrVkNcCNoDk85zbgVy7RJPf8h9LCloWBvIfKDOmwFAnkIXDLFILh61
         kBUO9F82MnYv4JsArfIomWYlwzy0tKygrXTl0=
X-Forwarded-Encrypted: i=1; AKwUvBxSrnsdKZ4pBOnRsQ2LnBaUNeBYPmkbN75UJB6DGNeCARXtWIL4eRYRl7fqtIvNMTA282VVJ2T3pe3Y@vger.kernel.org
X-Received: by 2002:a05:622a:4d8f:b0:527:7027:cc1b with SMTP id d75a77b69052e-5305499cdddmr13859061cf.32.1788464218331;
        Thu, 03 Sep 2026 12:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8f:b0:527:7027:cc1b with SMTP id d75a77b69052e-5305499cdddmr13858541cf.32.1788464217801;
        Thu, 03 Sep 2026 12:36:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406af144sm1966286d6.40.2026.09.03.12.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:36:57 -0700 (PDT)
Message-ID: <fa26224e-9f93-4a65-a265-2427bef7094c@broadcom.com>
Date: Thu, 3 Sep 2026 12:36:53 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/vc4: Drop the undocumented brcm,vc4-v3d
 compatible
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
 <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
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
In-Reply-To: <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/16/26 07:05, Maíra Canal wrote:
> "brcm,vc4-v3d" is the compatible string V3D support originally shipped
> with in commit d3f5168a0810 ("drm/vc4: Bind and initialize the V3D
> engine."). Commit 90d7116061f8 ("drm/vc4: Recognize a more specific
> compatible string for V3D.") added "brcm,bcm2835-v3d" in v4.6 and kept
> the original one around, because the Raspberry Pi firmware was shipping
> device trees that used it.
> 
> That string was never part of the binding: the documentation added in
> commit 4653f22e9ab0 ("dt-bindings: Add binding docs for V3D.") describes
> only "brcm,bcm2835-v3d", and no upstream device tree has ever used
> "brcm,vc4-v3d": the first in-tree V3D node, from commit 49ac67e0c39c
> ("ARM: bcm2835: Add VC4 to the device tree."), already carried the
> specific name. The firmware device trees the compatible was kept for
> predate v4.6, released in 2016.
> 
> Drop it from both match tables.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
