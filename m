Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8B246762
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797618; cv=none; b=VLfh9Zd1DAeZqdW6jTCDH+v8WN6WusRoTbdV8KQToOUvtqv8Qv0Atw2Iin1WOamDVjV87hUTZECXzF5Q9KyDovmaWfv853zq6h0oW0LLzI7SPHqpSwYMd80svez3GZboTH4A+dPbU1aJR4iMYIGg7StLFy5c7aljefjEJlaXCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797618; c=relaxed/simple;
	bh=6OEDWCRMBhUQwuYN96z0QclZTB5fdpiw/4HbCIL4mzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FH2zGmCHrZo8K/K4mLdagy60Jb6WdabfDsrMmTODVbgP5aJxnG0rZCMWO1K6u5tGtDCQqaKYOUDekEN5c7F+Y31S46Bn+1dQrnctsdYzG4MLw3F5xghauYuNv3Kbncf+eVxCUSoeSjJInV0SzpDx4Fsr651dVQaUW8TMzr4i9vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-98c8cbdb9daso161687241.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797616; x=1792402416;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oEYfT2se9mQPZq99mjf04mY4Ov62RIWvkBSPqPyDyD0=;
        b=rZgp+TrWhrOIYw2TbJQZ56c+dmDJVJztnTjAC4mqkMCQKS9/8hZIcdbkMcqGXrZqO2
         u4TC0j7pKxs4PEgmdbKpSAqEi06bJ7i2wT66XNpnxVvlWLs8mDAt7O3ACwhf+458eMsg
         Ago0nI2n7mulK9g/b4IIyZ2ZLIa+aJF1nYHqlUM/iZrcHc5JkYoe5Xx/JDc0damd4+x4
         lkhZUP70/Pav1syzXlqFGnu/P+FYQZlMYLhEtUNFuOsDwKs8eNk8ZuUXidMPip+a52KI
         xLFRl5zHSZ4x2orvNcEptdSXaWY5pMVDfoJFgfDzezY5vrrY1IFC638cMTEXke3XqLjp
         OYmg==
X-Forwarded-Encrypted: i=1; AKwUvByBaOktd6MYkCYPXpUAr4y91uUe/CWqIgvUVwWtPzdzyqMF9WwaORI8uaSRFhfZ0Z4uCJoMkd239Us6@vger.kernel.org
X-Gm-Message-State: AFq9FYKuVXgTwhYcIiUqMkwwZsH1Mnb3STmgyS/wK5lD9jwEkxyF3/41
	Tqrrammc75iFZ0sWG2eAXUU5J5oILHMwPQ/7jQvSYUjx0PKGBtIV1c5WM17frloz
X-Gm-Gg: AYBFou26lZlWZu9jx+8dgsUkSJQCf+GEviRVyPYtEJny6wbuQRMCb4GPv0CcrBAeLHw
	wn1xZO0IrpLGP6fem4QOuEr0xsf7p+liy+FCCR0lypx/qCPcXZPF1jRrzSYcdsXt/tABLiBqoc4
	wHmZL/aTqSXgsApuQ8JPmmzgEYu08Q6FrmZR2DaDTr+/paBvf+k4YKjtgFJHD6iFC7pd2jModmh
	dmahPberGubEIMLXGfbYsNTxqm13PLcf2oiPGhvC5G416lsUE9W3TT1biVBJnXZWgAtmYWAClkt
	lrvYFdlRY8eX4CQ1JRhvASFNP6o6JhfIocQt3lQ0t0WXAmP941JaUPrAj0kUpz3cRTQ7R3aYnuy
	w0CUZ7zKrcKtEgNQKK7Duuam75L2ogZI6yfBKddF8sTIqtYv5Hhn1bnh6h+SEuV+dda+w9epyNw
	0mDG3jouDCThldc6ErrYrdqxX14z8WPEzWNfr7Jq2noGWDiD/HENixtmTZW522r02LjPiUXuyqn
	NzFistKp0TwoMn1csnYXwIufljfeOyjd47W
X-Received: by 2002:a05:6102:149d:b0:7c3:ac59:158b with SMTP id ada2fe7eead31-7cb3736227fmr2140084137.23.1791797615712;
        Mon, 12 Oct 2026 02:33:35 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003ee6ce3sm6195811241.4.2026.10.12.02.33.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:33:35 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-989a4cab97dso137276241.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPbdD67OK6OIeVqM32PHqxbsEjxsu/7GaKenCQFunVkA8Ok78oU+0h7PID8KiEF09JK0Ey/KepXXlU@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7cb373c9305mr2142364137.29.1791797614854; Mon, 12 Oct 2026
 02:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008201953.34307-2-wsa+renesas@sang-engineering.com> <20261009-7b4b54034fafb7ad60ea917d@squawk>
In-Reply-To: <20261009-7b4b54034fafb7ad60ea917d@squawk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 11:33:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFsg72nQ+EYYYwLUYvQBULa5Xz=RL3O3pwCECo9H81Ow@mail.gmail.com>
X-Gm-Features: AclHuK-zPgcfuS_w3EiTe92ek8871OrLWJ4iGuAnS9nipI978vqESTCZAqRzLsI
Message-ID: <CAMuHMdWFsg72nQ+EYYYwLUYvQBULa5Xz=RL3O3pwCECo9H81Ow@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: rzn1: add resets property
To: Conor Dooley <conor@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 17:36, Conor Dooley <conor@kernel.org> wrote:
> On Thu, Oct 08, 2026 at 10:16:53PM +0200, Wolfram Sang wrote:
> > The RTC on R-Car X5H does have a reset unlike the other versions.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>

s/Suggested/Reported/?

Closes: https://lore.kernel.org/CAMuHMdWy6ksspwvj8jRxf6_OATU5rS5p92KyG4+sEF+ag7S9NA@mail.gmail.com
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Passes both DT checks. Kind of fixes 3b3fdc9fd40d ("dt-bindings: rtc:
> > rzn1: add R-Car X5H support") in -next, but we don't use Fixes: for
> > bindings, or?
>
> If you want, make it more obvious IMO that this is a correction.

Yep.  And without Fixes, it might never end up in the BSP ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
