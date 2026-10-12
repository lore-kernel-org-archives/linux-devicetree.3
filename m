Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D055463B6E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795431; cv=pass; b=YugdFsidiF3wy7kc8mTek2CIzeFPikM/dG/F69vaDni7K7t/di4ZtDdsd5co9u+LwDBRZwzKqyWGGejZCbpbnGM9LDdQxsvlWls1i7wOnHjKgnOM98r5CvWkkPSOFFZpph0UfS7RMWATRtMxlxVknYtUhLyWn3+jzByCM2vNKIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795431; c=relaxed/simple;
	bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVgJzl0MEB1RkvEaX6bnq12gNM6yYnzKymX/XSCI7/+E+iXK3FEycovh6uU+/fZdxBOjoFMy+2arEZ3ITxpa4Br69dEgyTpodn4JTy3W9vRrw3hU/P4nfc0gEMYXFjTcuJ0h0qPgwc61lRDdQgRGssLa5TKLEGYFBsh643hCpR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+Ara6So; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+Ara6So"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-745497ac8fcso391726137.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791795427; cv=none;
        d=google.com; s=arc-20260327;
        b=NErMK1kGoqEdkQ4q5uEFUY9a+nvGFLlmnjAGPsn4D0U+qG0oDA0gBBZSNIVR1+kY6O
         gVtz5qVyl0JCepSKSALPFsrcS1g7CJJO1gOCBVFkPqnResMkJ7oBOcKX6kW7+zZebvsY
         7CNEWTFfrMpf6+Wp/Hi+qZOyxC3bF+lby0+g+dZGJoKHOXx+XrjPeu6b7CmDCkimtDrx
         2skB4wh+ebNXfGoY3DUIWe4Q7OO+WNsNdFmuBHmtYBz8Jmxp1ZpUH10cN3NHbYs+3pHj
         dstmlLNSfKvlVJ5yKotAwCT3EnXToyJfExeXQKx4u26Gg07lbzfKD+56TJn6dhnijFO2
         YD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        fh=paGlLwxcdKnaNvsegA+dTsDV9fqritT2rx3IDmBewRc=;
        b=bA2HssTzywA1XbHxpjfB6PI2gVHYclmnujtnOqu/II3iUbBepi/GM+Ng9Cy2w14mp0
         bv0mEeQ8UWlwVuGW3g1PAxcgVpux8FcRceC8JU9Mf69oiD6MriiO6W0Rh/wnnRYwY2o9
         65C9gpXbsJQ7vXlmjqZR2yTwtQbLq3/nkqcbA70u+ooNF5dw+S7yvUgQINYGdbh2C5uo
         j6uc4jmBtT9iADlKHQiHmlMhck20EwBbmZ3sEaXMEZo8/6N9trzRUl+fyU9EguImVRHX
         z8aQjIJCl9VmsSswNO/7SI3wZVrAcGXdPV3mlWl64WMB42oD+8JX+UatTB2OlWJdriIV
         gm8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795427; x=1792400227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=O+Ara6SoNrBB2FSBPPX6UbK2RadUgZI4KQzRClFwS30a0geXziEfj3kRXg0u+y8Kqb
         Z6pqPkVuZFvLbU5gM1MPdUIAAyEd/FUx5+hwim6CCVH/gK1I+UYArcAHw8uJNAg/LGKZ
         XxMgtsMQ16n6I1M+znEzd/epzexWCRduiGdyA0QErbhNhaBQpr4CEH+d6lzm6Opcm5Q4
         HjSeDw6v7VWCy+tR9BkREUu7t7CgiEdXU9aJi9IMWVTO8a/IhoVs4SvEAhWJpONfrW44
         +WVrEQzXBrCnpSLuXTpSuqFX4HYkNPhr8FkSbfbFKmzJXspcRzCVCZCxDGn99EaFlPJN
         Tc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795427; x=1792400227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=0Ez1aimJzPDeKjchkSZE0jbqknWGBlxdu/JVtxUrkq2B4hpTNZD+TVeXklXBmH5Zzp
         oN24djA1ynV7UD4zpNLhZZ0Hps0vY7naHHekccf4zXu1fkjB/Nd9/yUfxhJi23fvBp27
         HOOmpFcNqNSu8lip7qnJKyxxtvNvouRBHpeRWUpq73HXjz8J67gi9wHb0Kgnhn9Y8Ntv
         NrHmNGywAD9/lp2VgWahuYkum0eeew1AMlnIvtd59/i559/qcCnIUs5gNEokL1Sksdvf
         hYDI15+qu/hNNVhrYAYeVOjkwOc0XJyo/pmnppQhqyZG3K4RxwYl0hQ5vF6jNuMTDdzg
         iWKg==
X-Forwarded-Encrypted: i=1; AKwUvBxxTGxWzdAy9dzcOYxo0C6Qmtb48fP2ibJrNVqYaq0CXbxNCkRm42vHIf0qjObmpyaTezqAUccGtRdz@vger.kernel.org
X-Gm-Message-State: AFq9FYI4n/ywE80hbgiRl4eGmtfPigOdTGcx9S++Fbw2Qk5SLLNYpnSI
	WV8o4FoCtpUwyRakl7AS9EI6T+75iJgmbPop8XJZkE+kPWpyc1MIhz+Idmm0pfjSN+eLK95uTwL
	pn7SN0DK7cXqSBzY8SiDOLEcrk0VcDLM=
X-Gm-Gg: AYBFou0OY1Xp6l/HB2uJBzVZNUheFGhEVh9svwCYWCwGFGFd2oiAV2er140wz2cik+l
	fDkUQYv0Wu8hkZXgpSIWQBCgxULr48MNaD0QlwWTFrHG7K/g8v5VmH4l6C0TBLdTlkq3EO6rsXv
	dx0be7s6sgfut/l5fAsCIZLWujChUaiZ+MqBijYZFwERT8fbnzZM/J7S2w9uAE/M3FWcBs5qpKV
	5L7rMhwS4mvvX0tr6ELk+YCRKTHrTFrOjh6+RH0aORVvmy7LKW2BO19TdEb3uxihvmN76PDiZec
	8gwDytsOftB6goy+0xqWQkuBW9dIMesNeD7G2j1TLlbtusMLcD3pXuQk2IDtia1o8Theo7QBOCv
	yBJrtct7hVU9XX18FlCIlz+XRkGQhGH7OBOwt7VD2buqEfJZXz6QU4NNkSAZC9hbhRn2fwqxbqZ
	nNgjY0rsq6SjQ4dIkRHWdQPTqX4hMK6kI8iRW0stkMQKNx
X-Received: by 2002:a05:6102:80a3:b0:7af:4843:5ec9 with SMTP id
 ada2fe7eead31-7cb3728268emr2044842137.8.1791795427219; Mon, 12 Oct 2026
 01:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 02:56:55 -0600
X-Gm-Features: AclHuK9PgSRU-9yDfcYymMtt4yQDEEGqg1HXAOlwk0cudjnkkhK9ivdvdn9hMz0
Message-ID: <CADvTj4pZEH2wj2aHSL+S+jO-MeFjRx+XMqhv+XGLiiukvf28vQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:06=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > Allwinner NAND firmware leaves the bad-block marker in the randomizer
> > data stream. On H6/H616 it also places all protected user data before t=
he
> > first ECC step. These choices differ from the mainline format, which
> > keeps the physical marker plain and maximizes the H6/H616 user-data are=
a.
>
> [...]
>
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I am sorry but I do not want to proceed further with this series.
>
> Even though I am not capable of finger pointing what is wrong in the
> diffs nor in the commit logs, I do not understand most of it. I cannot
> clearly explain why, but I have had a hard time trying to understand
> what the commits were doing. The risk is that nobody would then be able
> to further maintain this driver and I am not willing to take that
> option. The kernel policy so far has been to ensure readability and
> maintainability, and my gut feeling is that this series is going
> sideways wrt this major constraint.

Just to clarify all known real world usage of these devices requires
the vendor layout due to BBM's themselves being randomized.

From a practical point of view I'm not aware of any way to avoid
this constraint for any existing hardware.

I mean, without the vendor OOB being in mainline it's likely maintenance
will just be abandoned due to the mainline driver being incompatible with
real hardware so that doesn't seem like a very good tradeoff. As-is the
existing code has received very little maintenance overall likely due to
this issue.

Is it better to have a more readable driver that's effectively non-function=
al
since it's incompatible with the hardware or a less readable one that can
actually be used in the real world?

Keep in mind the patch adding the actual vendor oob format support is
only 270 additions and 10 deletions and is fairly cleanly separated from
the other format handling via the sunxi_nand->randomized_oob flag so
I'm not sure it's really as bad as you are making it out to be in terms of
maintenance burden:
https://lore.kernel.org/all/20260914-submit-sunxi-nand-vendor-oob-layout-v1=
-v6-13-2fb084fe0751@gmail.com/

This code may not be the easiest to understand without LLM assistance
since the vendor logic is somewhat complex but since those tools are
only going to get better as time goes on it seems unlikely to me that this
would end up being unmaintainable and regardless most of this series
is unrelated to the vendor oob format and is just bug fixes or optimization=
s.

> Also, from a Linux kernel point of view, we generally just do not
> support vendor specific layouts. I already told so Richard Genoud back
> when he was working on H616.

Hmm, I'm seeing plenty of mainline drivers with vendor specific layouts:
https://github.com/torvalds/linux/blob/v7.2/drivers/mtd/nand/raw/rockchip-n=
and-controller.c
https://github.com/torvalds/linux/blob/v7.2/drivers/mtd/nand/spi/gigadevice=
.c

> With this added to the pile, I prefer not to merge the entire series. I
> can still take some of the fixes if you feel like they would be relevant
> anyway. In which case I invite you to send a v7 with just the few fixes
> you think are actually relevant outside of the randomized layout
> support.

Patches from [PATCH v6 11/18] and earlier are unrelated to the vendor
layout change so you should be able to take those as-is. I deliberately
structured the series to put all the bug fixes ahead of the vendor format
changes. The ones after are mostly just optimizations that didn't make
sense to implement before adding vendor oob support but for the most
part probably still make sense to add either way to some degree. All
changes
