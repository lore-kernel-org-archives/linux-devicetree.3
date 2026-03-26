Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001238655D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518352; cv=none; b=GZb4g38Hj8xHahpXE3XhHms1yovR96vWn77EEOzZrwXQOOMArNGX3bhn1q/yzPuQfDdQ6Axw3ccYhcFcGwP6nUeQMGI+yC5UY19CA/9BS4lThFT/Tn72X8UeRb1jOPX4UX3e7kM1eztP5KXHyn9nwGJS89sGLsMrL7HKHKKvWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518352; c=relaxed/simple;
	bh=gfVyTw5dAjjc5IHqXHgZ14Y9JqLHZU9WvnW2xeFFW5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyRvoWe3OXbqgyGHr83XkXWj/7a+BSXIWArcLp1q84UisJYkfTws/YjwMvjZ+w8r5Ytb1HkSoCT3oRXCiapkVmncAENpxfzxVGut341GLdZbT4SI2wC2nsINNE1cJ2pXMJsUM1wwLYBRbLePhB+aquHkAf372d/gBcbSk5oSn/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ff05af29b4so273853137.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518349; x=1775123149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASd/BgNDcSm2/LLglL5z3Gr32bRWBqPeJ/CuWSEmnDQ=;
        b=Ef9CIYCQz4sce07lxONnLAHa6iLwOYZfEGpXuQPnqBtwz9EQQtoKJCVww9KWVghh/R
         uWfwe/WJy1+i2u95dWOBobqPIBPw1TuoE8Zb3amV63HmC1GzinTxgzyqX30YyzsyeVxL
         kzZwySWfvqfDWrE84n0cH3aBt5uJssInBIVIyWBXLH/vVIqFpOpV9pKQk2YxKUxalRMo
         lwPm5u/ImEKiS4WCIgWFZmoL6/mLJmWj/1ye91fGJ3skqqsxvhwUbSCDCNm9eExfF3ZP
         +qvXvlwzLtkI1RY940NSKeqWiUuXc9ZohdUOiuQ0ETJIl3VctgWbeZezDq9VLqFW9Jlp
         Rbqg==
X-Forwarded-Encrypted: i=1; AJvYcCX2D9lvKczX6eds/YnUuJ0ckdzfcJ+Sq2o+pG9Ys43aIGoWxN0osH279ouVpy6KFx2Hn1BOrqvQ3tQO@vger.kernel.org
X-Gm-Message-State: AOJu0YzveiUwDYAl+B0L60fcontL1OkzNXitO4DN6Yijbgl3byM8LaL6
	lsDuZHxf3rHX4PQ+mHxop1aP7P1VzGLElof6PyqGDa0VW8DIwC2k3ASvemyMlN/Y2zQ=
X-Gm-Gg: ATEYQzx4umfxC7KrKYHPhH4UG+yPYyoOoq5CES5XIaj5wIcDrSYujwprsZzWY581fFN
	XPEl5WJR1m4pc4mNaFhaCgb0H9rMsLyYSR/esPIdTUba4RI+LTgCcwJhMrNVZEHz5btizz04Rv/
	pxhXZezrfoWnUiis6W/mBTBiB8FytCP62oX3ZUmyF34mbYI1dKV7fT0wmMD01lmYM6GSZ1mPicg
	Oqtfub0ZvtWinemgVMFnzWYFE/WQUDp1M2ZZxQE8OmoLtStagoD2rCgkOrEa2UW95du3QHo+L6Q
	dl/abPSR/WV5LFDTyVGvYo24T4nh9MGmwWiwIhNw8dGOvOX5yq1ly3nRQKnN7GyYZPA0Vs9WY9P
	O4CrtbgaLeZYwYTckof0QeMrxcbXYJ/fOjkXMs2gCceepHrlPa5/8WcScitDdaIGnRPqPzpnBZF
	5OJxpEKpgkLaeolHnjOvuWlWZxRtcGCZbEf2jwN8fR4EmBTOFs3UwOoyBEI44aBziU
X-Received: by 2002:a05:6102:6cc:b0:5ff:c794:96b1 with SMTP id ada2fe7eead31-6036ce310edmr2735223137.0.1774518348654;
        Thu, 26 Mar 2026 02:45:48 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1065ffsm3107342241.2.2026.03.26.02.45.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:45:47 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5637886c92aso405855e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmvZebgCtj1wJQNQJaxjupTiVNfG4ve527yxYW0f61U1eIa/qEPhImoRK92+ls0MDpHodbpSviuOeP@vger.kernel.org
X-Received: by 2002:a05:6122:32d5:b0:56a:fc35:966d with SMTP id
 71dfb90a1353d-56d21fb12c5mr3316119e0c.8.1774518347412; Thu, 26 Mar 2026
 02:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:45:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
X-Gm-Features: AQROBzBx-ZigpBR2T4evThvMi_IdjHn8HsOwRs3EfiLeP9xAlQUuukRrtBVPuG4
Message-ID: <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22
 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your patch!

On Thu, 26 Mar 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Realtek RTL8211F PHY schema indicates that compatible string
> "ethernet-phy-id001c.c916" must not be followed by any other

This is actually RTL8201F / c816; I will fix this while applying.

> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

> --- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
> @@ -94,8 +94,7 @@ &ether1 {
>         renesas,no-ether-link;
>         phy-handle = <&phy1>;
>         phy1: ethernet-phy@1 {
> -               compatible = "ethernet-phy-id001c.c816",
> -                            "ethernet-phy-ieee802.3-c22";
> +               compatible = "ethernet-phy-id001c.c816";
>                 reg = <0>;
>         };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
