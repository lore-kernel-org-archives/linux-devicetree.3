Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6247C3E276B
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844413; cv=none; b=d7vKx4lcQ2KaAwrv8Q6cbUmNy65JQI8Tgm2drKmRmOSloPIRd1C1L1Hg1RDxOVTQr/vVngfvNY3QLyPXE+rZar17qWCwXCVhYMKZFyf/yYiflu5HB3Sufcv7i8NC5fL5rx+7csRyVf0i0SjTB4E5Boxmc4QNtFNmYL6mHG9xTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844413; c=relaxed/simple;
	bh=3CjkFtx39rP31hEkB1VvDpu+tDzy2ozSCK7NQzcwwrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8aiyJbcs5hAYq55hlRvtpeB8C61wbu6xDTlS3Uus6d9aGU2QD7YsgaVYuc+pVtxXRj7eoAcKvlt02v7l8olcaFg+5Zadi7oVIBOFfxTGXAxrLS/K7mZihfxAOb4y3Hubn1VbXuUfS/ug2nmQgqRYZmeOQbrmyN9uacdbbDgtno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA/+3+tT; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA/+3+tT"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66fb5f2183fso4137696a12.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775844411; x=1776449211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U668gXvxPD619cf6wEJKSOTDAXgasBKL3LEjdrNCUoM=;
        b=hA/+3+tTvFqo9HLwwPwReUKk/1MfC5DVVKEuK2Kx21oXkxPQSSrtOW4P5q3CGeCCHc
         zvlhrIDn6iXK402U2TUs2pkCE3DUdR+9fOSoGvxe7cdl7w8NzeO2va2GJV1svvFlc4SW
         TFJFHjd52GjRhAeJUTueu+RL4e5uKpXlBil3H1/L3yXgLOGqt06L/m2xdjhuPbW5AZg/
         zH0pdgjGdyGTEDlsAW8wo4KuQ2VQxdjmTS3PLJSPrQf8ZqjlI4j0D+0e+nYo/3p/KAAi
         AAaYsAiXqWc7q3bwECQmKEOEUO3WY6CKFNQPu15rvXcK4XOlqoZYyJJ9R0rZGs697jAw
         VFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775844411; x=1776449211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U668gXvxPD619cf6wEJKSOTDAXgasBKL3LEjdrNCUoM=;
        b=B+d0ZmHkxtc0b7FsBp/u7lQbF+EmzmkvaRxr46XOMdXdOMqEai0H1JA1vktwZdq5Ez
         SqNUWKQP9Hfd0WIxCxnzbnT+kjG6cIrKeGJvTnPlMdEnTXNhsonhuVP4fHx9xhaEiMVR
         uHX8fYXXN5U/aYx1InfmH50T69YZuvdAqx6v6UDDF0ujL6MTYqN0ut0Y+Q/Pbo2hHuTe
         37ze7XaEp59NFFNqDRtyaRMzjrDEgsbp08qH9ADumB9T+YBhb6ibBVSXgoHhkIcGcK5L
         omLEbzthEXAFmjCETwGTqXBac5U8mVzz/ulkOzWiG+s6h4TzwFh9IbBqLqjpp0i4TMUd
         10BA==
X-Forwarded-Encrypted: i=1; AJvYcCU76M5QBtBSUXq226KB5YbGOiDGkyiYw6GsnRs1mW6pifu5B7TVbP/QN9OioRQYA993C4FbXg9h9gO2@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWzv8wYlH3syOZK2kwEwk+HdZZOLMunSsMFAXCEfU1jUrY3Ym
	zWaTBGFcnL5YBgBaY8nGE6/DKf9SI9QRxrqBnniGwoq8GN4gT2YXGQ5F
X-Gm-Gg: AeBDievkAGUPkAczINAR4ncpqojEiw+0rFR41dk5HIx3zlQHR23hol4p9Jn7M5HW4ZK
	jy9btYcvVRByh9S7HELCqGCgSj0FalNPJO6wDWWAyVXnemBEKCFFvh49B2DO9sZ3+AJ0nAgYjs1
	GGTLeWqvGsDYYUVhERx7oFwqMIJTTlzTDXDZ8znvDF+23vhnNpnSflSsmT6FxuRwT96n8Xm4pVM
	MWvSNDiWIYnSRaf7tew64Vro3yPD0Tk3AiGxl/lZs+X3Zp3O/ZUoViInCWsJCoxX3+rReT/J2O3
	/CwvXDGH6UJN/aEOwAOTbN7ukLyRIpMRqwurSbIHpGQCcdH49ZvTjdoE00UbVsvcgfk5H/R/EcU
	C3AA0qJMMZFZrIhaH8QCi4Bvuo9HqajPaxv7MOLzj4nQVxgxAh3P39qs3nSOoImtflSqZWL1SeO
	1YrOsKIaRUlDE+i6ApGpgxvzx6gcUSVuOAq82+B5LkLWIdrA==
X-Received: by 2002:a05:6402:2789:b0:66e:d1e2:4162 with SMTP id 4fb4d7f45d1cf-6707a47f0bfmr1901666a12.13.1775844410392;
        Fri, 10 Apr 2026 11:06:50 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6707062530asm761560a12.19.2026.04.10.11.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 11:06:49 -0700 (PDT)
Message-ID: <47a2a9f3-bf9a-46a9-b361-c9022533da43@gmail.com>
Date: Fri, 10 Apr 2026 20:06:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-binding: leds: publish common bindings under dual
 license
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Corvin_K=C3=B6hne?=
 <c.koehne@beckhoff.com>, Ashley Towns <mail@ashleytowns.id.au>,
 Gergo Koteles <soyer@irl.hu>, INAGAKI Hiroshi <musashino.open@gmail.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Roderick Colenbrander <roderick@gaikai.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260408062942.7128-1-corvin.koehne@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260408062942.7128-1-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/8/26 8:29 AM, Corvin Köhne wrote:
> From: Corvin Köhne <c.koehne@beckhoff.com>
> 
> Changes leds/common.h DT binding header file to be published under GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to leds/common.h file in copy.
> 
> Cc: Ashley Towns <mail@ashleytowns.id.au>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Gergo Koteles <soyer@irl.hu>
> Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Olliver Schinagl <oliver@schinagl.nl>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Cc: Roderick Colenbrander <roderick@gaikai.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
> ---
>   include/dt-bindings/leds/common.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 4f017bea0123..b7bafbaf7df3 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
>   /*
>    * This header provides macros for the common LEDs device tree bindings.
>    *

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

