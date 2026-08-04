Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B43B38E100
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851644; cv=pass; b=oPGyNH1CZ1Q7E6vZOPh6f8AAeImjuGAJFF31E2M7kfwXD0H4q6IJIOJ96Gn2vmLh+Eiv4wZ+Nr4Bb8sF8YzUbHJr0ygBMdpssoiufymdE6apJCNpzSBcoX1QhyIc0m6ZQysA6eqbUOjunQKDnSevePdD0hLuUOAZ/f697qAONS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851644; c=relaxed/simple;
	bh=G7tap1XRGOvCEUHEXcCFtnTiVK07JRCwSl13kORQpeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bi0kitWhqL7mDar/JSMNvXmZ6PTXVFPv9IrVqYvimE67vLlTvySvLowHOmPNP9Vt8qqiB9+uhyX1zkC98AWHe5ipzMoe/cNEzrfuK330z3tbBfCyiS40LfnyfPD3J1qAs+GZMXH+fkYTGcUB6cY5fp1uz/K6KL5Szu2iJxsypwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhiNPZG7; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhiNPZG7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1c24ec9525so777106566b.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785851640; cv=none;
        d=google.com; s=arc-20260327;
        b=fhRkfXD39SosXhUZA5880Ii+YDKf4Wo2NdMnqMlKa+tU2X3xi5IkSla9GC5Lvc/uIb
         ysENEA7pssokEPGKL+JXSJqGylwTeX8UJWW2HUNQnAwKdtFf3UsGokq3QcYf95ZXKJWU
         HIcVdA46mUDR6rw2TpGXqotJf2bcJhfPlUO2m9dXgqkZOw1vVFskEJwV4yKLohU5IXXj
         g6P19EvW3/FVFwh7oTckFsBnP2P2ZFFmGgTM721DSRBn2zXI6MFUqQftwIWdr2XN8Bze
         wkh9OJhw0caMsyAgdDB4x6pm1tgQTzyEDphUngIJgmsP7SiYNXabYH0ifMiPz0HOhnOq
         IrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PPUmXWxsibLFFcGxzHWKhbRyg3VRNMzX4a8y84eYXjQ=;
        fh=vKGO/Ws6UJFimyEbCVVwEPtKqgTzhGw0hUCWElQ4+oY=;
        b=AIsnW1iN007CrypE8+HxwST8w6FeSy7CIWErAIpT4DwRdvU18Vcx61kbUisSRf1ZeU
         oJadAh8+4ufHGYw4/jRku50Ja75aMR4UGKIno0y51kdp1su6O/SpTRqd92QVV+WOq3H8
         tSKlFICbUeK5ImcqWk5m/Ag+/6VFcA6ZyV4rOEmbiVpEEob/xIyO42GJBJwzT9CJtKeS
         4DVgeuk5Yx6zUJ6Ssq+VxW2iCwaFertX7nWxe8ev6XU/sAuaOjNrq0pCiCHj0Gxll6SS
         NH03qcclUcJxG4IpZ6yBoDt0+TWEXZRI4h/DJGJ4Unlxg22g4+5ipVncVIo5Gc2kgB/4
         Y7Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851640; x=1786456440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPUmXWxsibLFFcGxzHWKhbRyg3VRNMzX4a8y84eYXjQ=;
        b=XhiNPZG7EgIST9ZDuMOOAC2mk74VETngpt+MdqMizPme9B+uHYi+9xp5EgHFJIyQ5K
         o4GTNKD9bj6Pfk5UAzIX/7qJPHzbozSsbDWdYZOt7WX8BCqG1nJNhNWXkcQfxpH7RJjv
         bjlQPli/Ba9ArUabmkF1IjLnH3yzQZRS944bOPP2bP/QDbCLe31qhB13SxeV0LNleU9P
         gzsLhjp1TwGUNpTAdJtL3D246X389e8vUKlyQjd6Y/26Q3mZjCRWQxJXfxlOHD1V2MK6
         QAVowppmPt3MPHx/KEgIvjxBSqIzocorfeArR8uLT9yURgGyuPfwJBgCC/IUTgS9C3Jc
         indg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851640; x=1786456440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPUmXWxsibLFFcGxzHWKhbRyg3VRNMzX4a8y84eYXjQ=;
        b=d5kCdvlIURT/k98ndtEiNBoXp3YhrXS3z3dkoALkZNzaZjObBWxCLTigTpdGKBqiAC
         ng/yr4KmlLj9WhFkhwT79e9JJwimyhgovv+Umj6DagxWKIMXdBWLfPgB+km3z5Q8EHU5
         scXfS5kPnjf2v7UMHjbSYMaL41kq9S/8u+CAKxhHZK+Z4uSsQGdxbcCocgtUB5ABCOPm
         MeIaJiqQrQHs/j+NZeLg0LKgGOMjrPX+ysAiGFkgAfwsKr96vtijRhnUdHCj8bFMP6I/
         0YEAIvIhA79ntfpYLnGvbPewWQ4G9KvWItUs/A1cXOBNxZH4VDMP8iNyrp7SCW+PoEEb
         HOjw==
X-Forwarded-Encrypted: i=1; AHgh+Rqgfgg9O8yZ315FmeA4mAU8eIAdSjeguTEuwlFpWhvp8oyOPpyiZMJaX+0RI42W4gTo7PxzhEv4xcGo@vger.kernel.org
X-Gm-Message-State: AOJu0YxNRNBqBlWVTpiVZkN8Z9sZGwpj/0IKQG8S43zoLm9AVq28kMwf
	mq87Gyor53Gq1GfALESY2dP/n1ufJ6PRRzbds5OQwjQ0zk0bQptAh4Ig4BYcATms0a0WyaTDG0/
	NMN5CbVZ2c86cEbbW1saagrJvgrosY3Q=
X-Gm-Gg: AR+sD12VBS1ZVa750/9n+zEWVJ2P0pCuqoyBUp2oCp18WnTJE6i5wzQqIhV+YZloih0
	94iORYyF/j4CwCveqx8sDNXv7FjSjparTb9EIXbvi/n/ps66UKUJGfc6Gb+XvXmWn5hU/qsL9FL
	3073qVTkGd0grREhPgjgbFoXXUNzZBcrI2MWKhdyQGeFUCow7yMMuRNX727/F6dKyAi9Z6JnyEH
	ApYIg7KJqpckYt3FIIcBJLX9p8cWhWaXqRY5S2bKWvSo4deCfEYg2nW22gzS22kk4+7GZHKNwzo
	dvLxHIRW/t1c+yFoUe7unWGR3REuIiKMUNf+RtSswqDUR6ISc1QpkuexJy6pWB5AidlQ5F+33if
	/2uzWfgUowFz5mIbbs7sMC2H9yfbYyfZ6XfTz3vpchHstt7hZo84K2c/XFjLIQ0P4kpwIsssjjo
	xhj0yJxosOohULHWvs3OeeI1mOGe+fP8wjHGPPQMx9xQA3DfLZrwqcxmSt4/DL1Ds=
X-Received: by 2002:a17:906:630b:b0:c1f:bbe9:963d with SMTP id
 a640c23a62f3a-c1fe822928cmr1417002966b.30.1785851640233; Tue, 04 Aug 2026
 06:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-mcp47feb02_refactor-v3-0-97f8b81f3628@microchip.com> <20260804-mcp47feb02_refactor-v3-3-97f8b81f3628@microchip.com>
In-Reply-To: <20260804-mcp47feb02_refactor-v3-3-97f8b81f3628@microchip.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 Aug 2026 16:53:23 +0300
X-Gm-Features: AUfX_myAnyW643u-12_ny2quh8TtnzwfkUEIgn_rryy2DoW96KR_ckNocIMJ2Io
Message-ID: <CAHp75VciUg_iwLQ3bp+mY6n2e=sf-697zAOe3PC7gPnpJ5PanA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] iio: dac: add support for Microchip MCP48FEB02
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 4:30=E2=80=AFPM Ariana Lazar <ariana.lazar@microchip=
.com> wrote:
>
> This is the iio driver for Microchip MCP48FxBy1/2/4/8 series of buffered

IIO

> voltage output Digital-to-Analog Converters with nonvolatile or volatile
> memory and an SPI Interface.
>
> The families support up to 8 output channels.
>
> The devices can be 8-bit, 10-bit and 12-bit.

...

> +++ b/drivers/iio/dac/mcp47feb02-spi.c


> +#include <linux/dev_printk.h>
> +#include <linux/err.h>

> +#include <linux/export.h>

Not used

> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +
> +#include "mcp47feb02.h"
> +
> +/* Parts with EEPROM memory */
> +MCP47FEB02_CHIP_INFO(mcp48feb01, 1, 8,  false, true);
> +MCP47FEB02_CHIP_INFO(mcp48feb02, 2, 8,  false, true);

Need a header for 'true' and 'false'.

> +MCP47FEB02_CHIP_INFO(mcp48feb04, 4, 8,  true,  true);
> +MCP47FEB02_CHIP_INFO(mcp48feb08, 8, 8,  true,  true);
> +MCP47FEB02_CHIP_INFO(mcp48feb11, 1, 10, false, true);
> +MCP47FEB02_CHIP_INFO(mcp48feb12, 2, 10, false, true);
> +MCP47FEB02_CHIP_INFO(mcp48feb14, 4, 10, true,  true);
> +MCP47FEB02_CHIP_INFO(mcp48feb18, 8, 10, true,  true);
> +MCP47FEB02_CHIP_INFO(mcp48feb21, 1, 12, false, true);
> +MCP47FEB02_CHIP_INFO(mcp48feb22, 2, 12, false, true);
> +MCP47FEB02_CHIP_INFO(mcp48feb24, 4, 12, true,  true);
> +MCP47FEB02_CHIP_INFO(mcp48feb28, 8, 12, true,  true);

--=20
With Best Regards,
Andy Shevchenko
