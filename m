Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA55F3BB101
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159031; cv=none; b=ClbuX7unuLqC1xpSulXnVVh+1T5r/SL4L537Az7vZinr8keOG//DeFtTmpXRZO6LpY66pF5VsQg83ZY73cm/uUAobaHnlhwdnsi3JlvXFUHT2zqAVG+GkhsOQwfaAY1QWe1w8924mcRmYTKfRvdfKtTFE2ccrZt3jrdMXCxlEkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159031; c=relaxed/simple;
	bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVVbWN4vNceNOWSsiMiH+wqEbXLpgUEkPApje4aSDINfNlQsKo8lWi1SBxolt0uqVdbLzSW4LvCtC11CwBKJj2RWJ6YM4eG3W7tDoARuuT0BXyIGK7K7obUlIHIR72Eto0XQdsB8uN3AKGAgj4lbWbhn1VUro6J4Kl0lpRbuEU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kb+6ketC; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kb+6ketC"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-75738fcb0d9so382661137.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159028; x=1787763828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
        b=kb+6ketCW/ymXmHPTEqHZFoIE70hGkZ15ZPp3ctE3t7awgwvDGvWaWVyZd4YiNd1OQ
         5jofdIEgQ3tGtzmefMn+QNF2MY+f+Bdfr2r4o5YOBmCsxIjrbj64AMepiEn/hFVN7DVZ
         ZGOrLrgg8gezcrQxZWUKX3anpGDWfzDOo73Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159028; x=1787763828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
        b=a1RsLGBDi9g4n6H5vTOx6/gHuTb9190JeZClgxw4eLUfkdi1aYiC+KL70yw7OLJ2aW
         IialQyYYjWfzSLyDmHkpBmDd3qeODepVpRq0tP8hUzmuyCUycpet14PDc5Onbk/aDr1h
         iCyny4h0Ub5AkqQO01Qwcn7pD6IbZhBsyOfulVEjU4/8mzIRKwZgNwJGZjP/+Il/knYt
         phEpFUr+TxWfAqgRaAaHs+w3pdgzofmyPuELFNJKe8uYr0fqPaXOkqCHnAqk8bv35p2n
         K+gqlgZSsbZu2yJ7ZTmfgAscLXP+mfLC/+qPypGSMD4CTk4BovtqQHo/DGlXboI25mDt
         +tCg==
X-Forwarded-Encrypted: i=1; AHgh+RrE1qO9n9dfCK1GgpybiNmh77lMsH+de8zyUk197hFfvP4dNyihxuS9u6sUeP+u6UQn2J+ZI5TOuslW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94uPEGx+E0yqMdz0Ilnh/Qu2Xby7+7dtzOSSy1A44vSH7IKj2
	Vz4xQKuU0wpS00pyaAAFeV0mem0fv3UO/uQST3Ej5Ln/FJ3PNQcyyy66rXqjkBqXKF92lodAxra
	Yd+k=
X-Gm-Gg: AR+sD11TRRmV0AiSEmUgf8vXJhN0qHYNLi//+m0IlUZFpI7q+N8hs/2s6NcUqQF2KIC
	EIB+IZ1JM1V/e0Um1PVh7DgWt9SkII9zCPsy/kfgvmdLJpVD0o1zFgRtl2WyPx8NmnvC4saGPAT
	ig3KRlNxsuVG+b2ZywIJ0BHi94zyT2Osb0i7P248NW8m07ig0gNwC8N0GjMY1fp2OgfExmqjRjL
	Hk/wTv/fZg3hzCm4T5VYVWqVayBLS9NaCFKeIqkaOCole8Yqxe9O/MBGsghuy3bP9euXsu18aJd
	S1smxehcVsaZv7/Wn0NUFxkzcb9J/xyR0BCIDpd31tTi37H1o9Xz8DntTPIkGvymd73+sQl1WMr
	zwHBpy9zFON+CSpbkalfvOJG94FdhKXou9pnuUKAm4HrmzK9q/PglJFzrjeT5TDamo4143Se2GA
	r6ktAgj5XLr+D95/PZeMoYc9IGLHxWxz3lPrs5S4zVoHdEdk6VOg0C1uTxUQ7V9pD/bH8A/WT35
	vRxzeRKywMylnX/tHybwgtysB8=
X-Received: by 2002:a05:6102:512b:b0:738:9bf0:f80c with SMTP id ada2fe7eead31-777fa9a24d0mr2117929137.9.1787159028402;
        Wed, 19 Aug 2026 10:03:48 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777dd4a721esm2853555137.9.2026.08.19.10.03.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:03:47 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9690c99c917so501404241.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roxx2LIXb2N85Vv61Iu4+tg6NO+Z/STVsznIfdIQAfzCdCl6Tt0e2n0Ec6ubH9UycBhc/0W+0UmW/Am@vger.kernel.org
X-Received: by 2002:a05:6102:918:b0:778:5c2b:f836 with SMTP id
 ada2fe7eead31-7785c2bf8famr1715744137.5.1787159025695; Wed, 19 Aug 2026
 10:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
In-Reply-To: <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:03:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xq_Hs6V24rG4OhS-cjamxWAO0UpSeGmP_9xYxqjvzRBGkaMhCLOMPBOe8
Message-ID: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 1:29=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> > Is there some other documentation saying "aliases =3D=3D evil" that I
> > missed? Maybe some email thread we're all supposed to have read?
>
> Yes, kind of, it was 10 years ago and about MMC aliases for
> selecting a primary device for boot:
> https://lore.kernel.org/lkml/CAD=3DFV=3DXLuPWKjQBMLApRQxk0K30p_TPcztB7g_1=
DB7iRA9BGRQ@mail.gmail.com/T/
> and you were in the thread, it's not pretty, leaves a bad aftertaste.
> For, I think, reasons stated in my initial paragraph.
>
> The takeway is something like "the device enumeration is policy,
> not hardware information, so it should not be encoded into
> the device tree", and that is not an argument about aliases
> per se.
>
> As a result (as I think, I may be wrong) MMC gained a few
> properties such as:
> non-removable;
> no-sd;
> no-mmc;
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>
> These provide a heuristic for which devices to inspect for boot.
> Then on top of that I think people use schemes like EFI for finding
> boot devices. (Or they still live with their quirks...)

Yup, I was definitely involved in that conversation around mmc. ...and
yes, that was a frustrating topic. Though I guess I remember things a
bit differently / have a different takeaway. Specifically:

* The whole argument there was about people not liking the idea of
assigning "numbers" to MMC nodes. As I have said, I'm OK with not
having a number here and it's not central to my needs. Said another
way, people seemed to hate assigning a numeric ID to hardware devices,
which is not my goal here.

* The "mmc numbering" patches were (independently) sent again and
again by people because (shockingly, I know) people found it useful to
have their MMC devices enumerate with consistent numbers.

* In the end, support for "mmc aliases" was landed. See commit
fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree
alias").


> Now this ufs0 node seems to be about calibration of some sort,
> which is a more hardware adjacent subject. Is there a way to
> add the entity that needs this calibration to the device tree and
> reference the UFS device with a phandle along the lines of:
>
> calibration-storage =3D <&ufs_node>;
>
> ?
>
> Even say adding a synthetic modem node if the calibration is
> for a modem is probably going to be more acceptable than an
> alias.

The crux of the issue is that the bootloader needs to add UFS
calibration to the device tree provided to it, and later the UFS
driver in Linux needs to find this calibration data. Since the device
tree lives outside the firmware and is provided to it, the firmware
should make the fewest assumptions about the device tree possible.

Having the firmware hardcode the path to the UFS node doesn't seem
ideal, since (I believe) device tree paths aren't guaranteed to stay
consistent according to the device tree ABI. This, and the current
downstream device tree path differs from what upstream would accept.

Using an alias seems (to me) to be a reasonable solution. However,
I've tried to express that I'm open to concrete ideas.

I appreciate your suggestion of having a separate node for calibration
storage. This feels more awkward to me than just giving up and having
the bootloader hardcode all known device-tree paths that the UFS node
might be found at. That being said, if everyone says that this would
be a great solution, I could try prototyping it. The trick would now
be that the Linux UFS driver would need to be able to find this
calibration data, so the Linux UFS driver would either need to be able
to find it at a specific hardcoded device tree path or the Linux UFS
driver would need to search the device tree for a specific
ufs-calibration compatible string.


-Doug
