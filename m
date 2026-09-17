Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1EC36605E
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632429; cv=none; b=aZWTNLCfuEu1GHdpNJtHZXKDxQOKAqWH/nwo2fyKCi3efBjrZcLLOAU8mp3pO2K1dD1mLbGK7GZI9SDDWO0q3DRI9BGw5FiM+Y4DJvLn9y1wKZoSlwxjvKSrZf86+RzS0NXMZICVpOFtNwxZkhhm+d57wRiu4xQcIttbjgJnghI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632429; c=relaxed/simple;
	bh=qf4Z/Wab6W5GL4Sinbl+uCK7C7f+qmxZxKQBDuJWh9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7J/8LQ2Nn3YPetP7qhVNJ6Y/cTBQo4iTwNkSqYCoGJ+0PTqWfKh9XPW/w1+vZLVeWTL8NvgXRNDYZ4IR6D7ojgDnWaMCZF2SvWmuP8t5RQUCTe1vSDxlPqmnXmdyOyrle5InWdS4q6SA6kPgDJ0aCmvQrq1Jh0HTer65bvmzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso326034e0c.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632427; x=1790237227;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jrUfKqIAU8KdEdqG0jEkfz64jh4Vm1/h0EwrowMtP0c=;
        b=FiCYZO1VHEIIPy63GYj06t/A6IdmMvNO6W6/X+MFwbZUwqTUOiJT1MpOFeGv3bFsqL
         sWVKk6yzZ3xdZkXUh6TOG94Gh5ng6++qHZMHDczCeD+TgwSE87+xJHDGShwQL0VJjPhz
         VRyOVPpeyWFhBv3c3GHkyS+AAwGa8cwieP30ivaGG13Zs6mQwIy/lb7s9s3tS/RKj8rn
         mvBnxHuRHI8H47l3nkIXaAUeRBeiP6vpfuCeS2nz63RIArSN3gHyeeuK+BaTISoBbip5
         njuwSP8lMKSSf22OwzUTwmlE9aFNwBhgpghp2ukvhwpXcCZV8393PW57QdaEocyfTv9B
         ZVJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwr+BH8I1dULeW39CtDtThnQYSGjmMyt5o71XLUKAIw2ud+WYNN7QTScdB0qvtH9jYMOHv3wbO6Btm@vger.kernel.org
X-Gm-Message-State: AFuF++mO1uBf2yrsJCn9pNCAVtW8AFLQzlTxMJBA0CK2+2KY+riRFsVG
	NUwEzJ2t4l983Rd2VwMFHezz34hQ/KAwcY8bcCsqcdtidQ+2d84/Mwlk+BlP0CP8EcQ=
X-Gm-Gg: AYBFou2JJyFX7xwHRnkx7zuKyiBKClp+zL9uDkfatRMquiXuG9q6Lu1Nbxb4tWhlqtM
	v9WgfOmei+CRWokrzTkOeX8T4KmLsODunF9l2FKnRAJTNjVYPeuX5eGMagtl/lmutABrwR5laNr
	s2Gcx7mw41eoaWJhDzZgSGWWWHTa0NUdglJA97cWj8IEU8xVe9vNlOnrlkF0bfU4C/9km2gREvy
	wbTvSa5X95EsZCT+L4FEC8P6MYNg+NXYu3pSuR1MJoYQgDgoY1AACAIqyhHey0rNqjBbQ9ko0tX
	P7a7b5jDcbPZVXEZ12VcZh3bhpnzhEWC/HUSNfatj85SAJFtj9D2W+sxR+P5ObfCzCivsx9TeZt
	iLbEMieAGixY7rtibiE4uTdPrtgzD+lnSL9/2vV6MmtMlGherPm6Cp3ZpB06DqZGUmQw2Gg9EF/
	YTnKL5nzFiRoUl1uORBaZ8tAFDK5SaCJqwqBRylvgE8mwEuU575efwLB22u03j7vfQ6czQtb6b/
	JDTxLZmRaHSAWBkxblMgoUatMSoTZEEXpoC1A==
X-Received: by 2002:a05:6102:6a8a:b0:79f:d90a:cf65 with SMTP id ada2fe7eead31-7a02dadb9f1mr6749907137.9.1789632426887;
        Thu, 17 Sep 2026 01:07:06 -0700 (PDT)
Received: from mail-vs2-f15.google.com (mail-vs2-f15.google.com. [74.125.227.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-983234f4b58sm2283821241.3.2026.09.17.01.07.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:07:06 -0700 (PDT)
Received: by mail-vs2-f15.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso326024e0c.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz23Dg7/bsNG2G66M1XtgLW/gg5I4Zmg7H7RggL7RMrf9LypZyBSIuxEqW5Ewd/mlh1fCprnD7h68np@vger.kernel.org
X-Received: by 2002:a05:6102:918:b0:7a1:f951:6653 with SMTP id
 ada2fe7eead31-7a1f9516b82mr1577084137.26.1789632426525; Thu, 17 Sep 2026
 01:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org> <20260917035438.523010-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260917035438.523010-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 10:06:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKJYtZ=0r2rXbrsTcVyLmVs7m-jGbD2b7CgP_GRMeWdw@mail.gmail.com>
X-Gm-Features: AcwNN1XfAZfrsW2pvaRzJQf-phJcWcSDCPkogzibQkcINXJ4SIBpgbRww5eIOW0
Message-ID: <CAMuHMdUKJYtZ=0r2rXbrsTcVyLmVs7m-jGbD2b7CgP_GRMeWdw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
> Add support for R-Car X5H, which has slightly different GPIO block
> register layout compared to previous generations. Introduce offset
> remap table which performs 1:1 remap for R-Car Gen1..4 and a bit
> more complex remap for R-Car Gen5.
>
> The GPIO block register offsets on R-Car Gen5 changed and the change
> can be divided into five groups, registers which remained at the
> same offset, INDT register shifted by +0x10, OUTDTSEL register
> shifted by -0x34, INEN register shifted by -0x38 and the rest of
> the registers used by the driver shifted by +0x70 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Rewrite this into a table look up
> V3: - Use enum gpio_rcar_reg
>     - Drop the IOINTSEL initializer
>     - Drop REG_COUNT
>     - s/int offs/enum gpio_rcar_reg reg/
>     - Make offsetmap into two maps, and static const
>     - Use C99-style initializers
>     - Drop BUILD_BUG_ON
>     - Store a pointer to the offset map table to use in priv
> V4: Rebase on current next-20260916

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
