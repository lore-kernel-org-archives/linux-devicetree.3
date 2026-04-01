Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F94317162
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034987; cv=none; b=BZPBBPI0D4KT8BLuOxo/xdb/I1VnpTwXBjdxofFqBaqX57B2iGefkW6QmpX10EH5lJi1KE2WzHWnCn4E4gYCgN8S8TM8d8FoXW/X9L/W0pW4pn9xlWeIVNu4xrG6C9Wy/zshlxxd3Hg73bLD+Cv6jfQ6hdp7NjA/ccy4XGot99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034987; c=relaxed/simple;
	bh=zmApEzRgDbRC0yPGVE2Vvk3ZWH0AOrNjBzIx0MNgz7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtfzPxqgJgifN+VcI0KUawqellQZ38/5rSWMjrjYZf1kj62lD4G0v7Y32+enoem7tyDo0eggi0Ennki/lWMfkWbzO2GbLd10bD+i2qhZ42p+aKpij81HUdp40YynXCy68BZx7/H8QH11mWQNBgUEfgEoTr+sUt6ClR7YcBteNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d924c7183so200972e0c.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034985; x=1775639785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtBLhEnTITp4HWIgB0mlcJ0rdkLWYuJsWQsFBn8ERbc=;
        b=UYyN2dkSveCw3YXoD3MOj7Pa/aO3nbAy+nSRYU2en2U7mrKYcaguXg6NgJYlf0zeOP
         sUn8h7PDuNeQeKIKN7EzNeCs60THXSi9THXl+iGbNwFkmUe3LSTNAF7YId2VnyZd5B0r
         2g4WN0/wQbEjcKaXndlmUGtLNjGDyoMVpZJDGEfvoQ4TElPPHx6c1Y8MGPAAe6o0e2mY
         uwlYoS1I1DSCdDXe9KZ3X550OZjceSCNjS+SOzCiNG0P2RLJuzPb0natwbR52dJxqFPA
         mIpbjo2Gn17oRb099MuYzJjv6dtNfLKeAK99GjX632MKfYbVq9ISKnWbNZl7rgjSGEv7
         osfg==
X-Forwarded-Encrypted: i=1; AJvYcCUeHiz6XOpuMmhEHncNy6BeM/dIEKYD8XfuPV6iBxSmjYtoUMpn9bBf9mwYgAg0HT91nkaAVdqQjH3U@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZZ6c7hMjiUCwD/Il894fhqgsGES7iayBVjDLnvNx8Uu5l2v5
	WBo4g2KndWuxgs1XWQCaGPE4QcyvJsbP6qk64L+L+u/vfaP3dAWUQhERXLTQfDWA
X-Gm-Gg: ATEYQzxuMcdobcHiaUDE0wqdzGiLzP4gist06kOr/CBlVnr2o72MTcK+ZXvix3ZUnLJ
	KHTesUB7MrfNyKB0MtcA8DPauYp2cCOKB6gq63Cavo8xWfCsiJp7MFiUPWg1VfmRfGOKg3upvha
	bwPPaMQY20w5FunYGv3sretmBuLzN3taa5XKc9sGfNJ66Dt0gfTRQPZTXUmoaVC/3y8zY58j7eL
	fXP4ukYW6e1Nwn2EDaENaBW1VyOulslPrTpbLBw0vAKlQ/y0ZzbxjM7kw8QCxitNPbNtAEJU3ks
	Rhz+IMhWCRVGd95f4JQvj//yODMvRMMk8OJOI8XGIB9B5TDFA/tfJPgL4jVdKuDoOXNs8mbU6ej
	XwCdcG4UYhXP1aZ4fYSFxW2VDoKx6/NkYWVqmxdQpfjJhbUkjvB/K7bA9H7y8r47wdxSz84ae9l
	I5Pm4O8lkuk09CWKT3/Wa49RrqKOFUD8j2Bk9tV2gICtWJptXSJpiCTreZMJOk
X-Received: by 2002:a05:6122:16a9:b0:56b:8003:c2 with SMTP id 71dfb90a1353d-56d7c18ba5bmr2755809e0c.8.1775034985143;
        Wed, 01 Apr 2026 02:16:25 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e4bf0cesm13195017241.12.2026.04.01.02.16.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:16:24 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so515202241.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:16:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoevEbn5VddEPtHY1kU0Npmr9lmqClozEMIRWPnharGw17HX3RsGvDRwkB+aDjwOE3CD+tC+RTMhTT@vger.kernel.org
X-Received: by 2002:a05:6102:1612:b0:5ff:c40b:27eb with SMTP id
 ada2fe7eead31-6054fad1639mr2875794137.3.1775034984459; Wed, 01 Apr 2026
 02:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331104527.29170-1-wsa+renesas@sang-engineering.com> <20260331104527.29170-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260331104527.29170-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 11:16:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeecbOGg=BmE77TOPiZJMUYVMVZe5CarAevG==2PY+sA@mail.gmail.com>
X-Gm-Features: AQROBzCACAAYhX0LlldUsis3TA40fwjqLLc01f-21kK_rvF1kKhk_-En1E2jytw
Message-ID: <CAMuHMdVeecbOGg=BmE77TOPiZJMUYVMVZe5CarAevG==2PY+sA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: renesas: Document MFIS IP core
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram.

On Tue, 31 Mar 2026 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Document the Renesas Multifunctional Interface (MFIS) as found on the
> Renesas R-Car X5H (r8a78000) SoC. MFIS includes features like Mailbox/HW
> Spinlock/Product Register/Error Injection/Error Detection and the likes.
> Family-compatible values are not introduced here because MFIS is usually
> very different per SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v2:
> * added interrupt constraints
> * fixed whitespaces in example (Thanks, Krzysztof, for both!)

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml

> +  interrupts:
> +    minItems: 32
> +    maxItems: 128
> +    description:
> +      The interrupts raised by the remote doorbells.
> +
> +  interrupt-names:
> +    minItems: 32
> +    maxItems: 128

[...]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-mfis
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 128
> +          maxItems: 128

You can drop the maxItems constraints here...

> +        interrupt-names:
> +          minItems: 128
> +          maxItems: 128

... and here.

> +          items:
> +            pattern: "^ch[0-9]+[ie]$"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-mfis-scp
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 32

You can drop the minItems constraints here...

> +          maxItems: 32
> +        interrupt-names:
> +          minItems: 32

... and here.

> +          maxItems: 32
> +          items:
> +            pattern: "^ch[0-9]+i$"
> +

As these don't impact correctness:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
