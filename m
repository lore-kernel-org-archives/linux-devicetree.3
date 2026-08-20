Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063633BE17E
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220838; cv=none; b=WFVjCIKk7E2H2LCj1BhhMTC4OEIKjTUA5hcr40+/5Vk925teXraPchtN6jzqHs7bmQaxhGz3VjbqY2GTGeJe7rnqJE0zqSXrGHOcm5IMQGP1eJFav/p8lOGJnWsQo2ypJms5FBSfJl3jBUNT4/mRu74jgIxFUcLEoigdBAGOVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220838; c=relaxed/simple;
	bh=J8SsCEbocsyTwxq3MZbYRuvps2cw72VJe49uJ1IGeUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSPwucmxDDXrbE1MrMjQMWe1zlmqoqOAkILqjHr0zH4n7xGON7n0E/xk5ZPNWs7IERbU+YOq6Ol0P/Lgi1meqWxtEI0c/K9o0QH8ql8P54nZAR9Hxi7OP8gvKVYTbAknEwrgBTw09rNHb9CGYE267uxD61sbyqLr+V1I450Lf1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-977168e4f3dso1581363241.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220825; x=1787825625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+W1h9goTHh77Au8749p4RyYvKYe3xrOhWg/p6R4W4WY=;
        b=dU2dOvsw9i/jxaJcSjzJdMel0gthX6c98kZR8ihGyXXEdJ3no/gElgOb3rIAMqJbLN
         M9TTqA9HB5o1uE0jNcV0E7FHyhd7GB0z9JW5Qb34isH3ZXAlC1sNS+58UU6XpvTqbGTa
         Ddz1x/0CmRZu883s290IiRm7aoFdVgtdjtK9Lp2WmKI+G3bZFxb15IR+VBtfcTc9F4U2
         wEZH4RTI4QQcYHeadJ8p34Jvn53QjwtqyKmQgsM2cl5U7Y8lH8A6a7LDeiA5s3lgmQBe
         58FUl+Oys4Q6JcZA07JvEwjN5cingcBV6OAjmiHsLQgRajXH6WirU3zITQbEY+F3BoPZ
         Lwlw==
X-Forwarded-Encrypted: i=1; AHgh+RrZR438+Dsm17Pr7WfeNGfE40DDoDMZsDAuQjwTpB1+J04BLDLynXnmLR/5r4hNs0stShD6RNLuplC0@vger.kernel.org
X-Gm-Message-State: AOJu0YyzAyGXFVKyrPfBtrdRrEtYa71w2XUiUNZPKtiDCE6R6MUstmxn
	aM+0SEw4SNnRunlxtj2PONLL3acNq0OQIbCV+rDhwJORVagLbmrWT7kYXsK3AtMF
X-Gm-Gg: AR+sD11s8R1URoCNvliXXQMu6sbwCUnydCbcKv7UPkuVccDVLuEoNFRnf7Pj/XNol90
	zyyUklgKsZsSJVk8tp2am278oQAoMRND58rgeZ9H5D9619XoG+kKtoysqZkFefNtWRj15649+Ht
	fZlhe/lCrAyHkCOpwkNShYO8/FSaQeiXzYRaZbCrQ5WEDIklhOBunahuQ35qGY8hkm+z6ZRsbC4
	xswleCkJbnNKFwBDQE9n4boqt5V3UgU/svV+cnBLv/FhFGehO1VP3l0NGidGYbGO6FyI9Omu250
	W9xA1i2M8kbUQSZzIWQfM2GDFEH09tlyyKxtCEemqgxtYUG2HHoJC3JZ2EufiOg9tF3jqIr+mWH
	2yWE8T4nXpnYVQI5DSaWdNF8WHqLYsE7k7iMlWWwqzTNGGNFAJjoIXqQjH+GQfcl7e+wCG5WSzk
	0Ye2bYqbpIhEwcVM79noDox9QzcO3RH4PsJHf7iiUBSIoRxrWZKtifd/usY7EbUMUjulBSqeaC7
	oCZm11i1gDqoaq/a0slLBXtlA==
X-Received: by 2002:a05:6102:3fa3:b0:745:31e9:f3d2 with SMTP id ada2fe7eead31-777faba599amr5028706137.10.1787220824478;
        Thu, 20 Aug 2026 03:13:44 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e78d181sm5385228241.4.2026.08.20.03.13.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:13:44 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7475a4f8b05so1207757137.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqA04lMMuzR7lXu5p5CWVOu+DxkI0dNIQB5V5qVaGF7uBePU//KoIcERgY/+oTsPrO7rvrbUbvMKmg/@vger.kernel.org
X-Received: by 2002:a05:6102:370f:b0:738:fd01:5b63 with SMTP id
 ada2fe7eead31-777f8f80ec7mr4599483137.4.1787220823887; Thu, 20 Aug 2026
 03:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com> <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 12:13:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUu8M4Xjb27XLcMWGYFk6NdKwKB6WO2ZQ_FCAvMTJshQ@mail.gmail.com>
X-Gm-Features: AcwNN1VNatSgn9Gu7wVYSsx8Z9RP9z3QZYhaLomWZy8kncfpOIt52cycw16PoQc
Message-ID: <CAMuHMdXUu8M4Xjb27XLcMWGYFk6NdKwKB6WO2ZQ_FCAvMTJshQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: renesas,r9a09g047-sound: Drop
 #clock-cells from required
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Thu, 20 Aug 2026 at 11:58, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> `#clock-cells` declares the node as a clock provider for AUDIO_CLKOUT,
> which only makes sense on boards that route that pin.
>
> Drop it from the required list so that boards which do not wire
> AUDIO_CLKOUT can leave it out.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -298,7 +298,6 @@ required:
>    - reg
>    - reg-names
>    - "#sound-dai-cells"
> -  - "#clock-cells"
>    - clocks
>    - clock-names
>    - resets

I disagree: this is a property of the sound block, not of board wiring.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
