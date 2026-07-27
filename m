Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B837BE80
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163789; cv=pass; b=PY0eQiH9GlLehg+UXL+DcVt893ZrMwtRI0lYlovZxCAwIX7iLmtL5sDVIK3pCcxirBSDbvqxgNjJ8QsCVp4JMms6duz+SeiqrSECRkYnqZfcw6WDYYiPHmQOn5kOu7k0FE/S0pzHL3uPs9NlfqO3OaNNcDYXPZZwlG66VfZNQZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163789; c=relaxed/simple;
	bh=EZ6N7WwUNzDpEf8ny3J1wHBY1ffRCSNErHzD1BJrUp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/MsMiW6hlKavL7SmBHSHbckG5HhTYbdLFL45N5Wpi5gATaviC6qd/1QtL4/2nV//q36YZBr98fOAPFAw8ZQLE8T9vc2DkUnSQ3LvUcpu7nNRIuo1ia1mZsW3MCh60A7Zy7Imaz7Slcl3j/BI8SHxyXyNeJWZk/xJJDwWNkfMsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtE+TMKQ; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtE+TMKQ"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6682259cae6so2652098d50.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785163786; cv=none;
        d=google.com; s=arc-20260327;
        b=ottGaqV2MWKPxP5LSYPFqXVtSXMrdauJ1nbaJ2B0ndtUJcThpTjnCxjTUHgrgTSELN
         /Y1JeDpDIsq6uQJf3AaDcfoJ26i3mNwDbHjpIl4avrcePMiaiYa0BMhw3WJKZArNGW2/
         qgz3rra3t1XuovQfWIadG08apdP4qYVATdRkQ7E9R3OIX674zTs4Da8kKioIJKcKmKf8
         VZvvJXY1XMlbbg/O1Wo9M7F5P5rbNfYBT30UtQfohBV9Me+UUuOJEeUuggIEos5Fg+Sm
         ckfgPqHe42ZpAaNQ109yf7Nt3hDk0z8nk/zumeYV9gLlfaVjgGmUUwoADrsz595Aw7Ku
         eZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kYEa2s2zvLJSrqj5at2d+sAEkPq5+tUouTZICeurIS0=;
        fh=jWOofXyR2pebM/cZPdeQIcga5YlcIqrywS5lferA0P8=;
        b=Y41lqhGE6jk5kge6/jIRIooz7TSEP13m7yMwt3s2EU/CF2F2ckQ/tv1f60OjzSLenv
         xAXUXyst/DigMmVPTRYsaOOMlnIi3TX/oLe9rn73xCBAEoo0zKgDJaL1xn5VHwRox3Aa
         JhC2/1WACXVlX6Eaa0aFCjP/TxuGyRZn/17hQO+jBRDujzE3heF8YYY1J+2Np5x1AGrx
         m3gkoo4DjSDhGkGBAVVU/jaznrMobUtwh0acCGAkQtKjHtMcpDm9trCro3GehCxKL+eO
         ntdR8IK6tBfRFwH8epqAQY+H+S8OBMrf7JWOrRbGjVDeSz5qa0UhJOeeXqGf6bgckgAL
         CiKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163786; x=1785768586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kYEa2s2zvLJSrqj5at2d+sAEkPq5+tUouTZICeurIS0=;
        b=BtE+TMKQqnSB25mftlXxs3DrxTgo3m/rmYoMJIm1mXrXQYEQ4twhhSOgBXZg4mUejC
         pwR37wLKwpVQXJL5yJII/mn8ru98AgDd/HNRUoF/4rXj2k3keP971WI0mJTFOEllUIc5
         9tPTHWX5D7nU3sK+9FNdqa8LbkX2QBGdD+goqrvltMSl4sVEqy/rXUvWFSjgvMav/Zmg
         7lAcAMbFT0qqtwrHPGBk0wDZXHO548920X/U/qs0k8ad2QGbVTjs1+FvhLX0jeFvsgw/
         MqnP62HztQeyFObZLwr/h2GQj7F//GhIXeTIK+uzfOVrkylGwYUQsbyT8qkkRLzM5xwg
         kBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163786; x=1785768586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYEa2s2zvLJSrqj5at2d+sAEkPq5+tUouTZICeurIS0=;
        b=fUQkp5Hh5H2ynk/l/b5Qtdv3MtU04RRA01WMwl+IBwzDX+HoWvuorQ4gf9lY0aC1KS
         /jXElFd27Jb1yV0kjGkzSFtdwn5Y5i6s5LD+VLZ+AH6XJJM3nvRmUyE4iD/+5bq5K8Kg
         vuAQwJNAqkr6EVxZ0pzRb0Vb6MMs1VfIyuxwUfOg02xbP77X1xCEKJsPEkdKWFAbiERH
         bR/T1FJhTyIc9fAk0ghOFVHe7bKgWWpYKqfvhtFh2LEd7I1A+ATzpzcil24JYUTy1qSz
         NIRoLPAxWL5lf6zrc2+fi/SavMvPGDmG1ikbLn5Heklv+ZjFDbQOnwq0mM5tKKH5Trlm
         ikPA==
X-Forwarded-Encrypted: i=1; AHgh+RrBHF+HqRyze1xSOgJvHYCZwQp1mDtR8Z0nN+LaNsxG5xfJgS9xm1eYVe8tSXQ68U+u+iVk9XcVR3M/@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVrGXh/fuFa3E9NceZo2GK3DJr67F8LGNnXte78b6sxZYLHGC
	ImA3ETS1eET/KUxg2Ai+CKR7MZ2SOBHiqcijpD+Q4hDH8G42WWtRzlwF+n8uRf7Xq4h2TnTWqc5
	+xr+96V2oFZCzfVBsNKJJYqoBzbvvzcc=
X-Gm-Gg: AR+sD112zLrY6ZlVlkwknF6bZzjI2UejQIjroFxGFo8rEKa2aXKkemYn59dG5Q/JmG3
	oQ2UoK9J/9liE3FkKuvhZsHWUyV2rmEFlUKlJXVWGJ6CXCgi7csv/70XqQjqt69orGhoNAnFnLb
	WA74RErK9W9cJA6UKuEnznhfgjO4zLHgbBgLleHauexELG/BfxutlL3SovTXDhOtyAqVPS/aNr0
	ac/FeRV0winzUSfZgLRbc5T86bJZ9I4iiqL2JPF5mm7sCbE8m41Fmv3biwgJSI=
X-Received: by 2002:a05:690e:140b:b0:666:2274:f9f5 with SMTP id
 956f58d0204a3-668c78dce2bmr2427658d50.37.1785163785046; Mon, 27 Jul 2026
 07:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708165929.2233934-1-tmaimon77@gmail.com> <20260708165929.2233934-4-tmaimon77@gmail.com>
 <20260708171530.F04951F000E9@smtp.kernel.org>
In-Reply-To: <20260708171530.F04951F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 27 Jul 2026 17:49:34 +0300
X-Gm-Features: AUfX_mximjZZDLW93j8ibsSrwKTowh1hhbqibaBu2LPs1RvNrBb_F3SNPEJGJJ8
Message-ID: <CAP6Zq1hFxLD_ajVs0oaWi0Qg_G9O7yi1d_2kV0LqFbS9wm1L7g@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 at 20:15, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Missing required DT aliases for the FIU nodes, which will cause =
the FIU SPI driver to fail to probe.
> - [Medium] The `fiu0`, `fiu1`, and `fiu3` SPI controller nodes are missin=
g the required `memory` register region.
> --
>
> --- Patch [3]: [PATCH v8 3/4] arm64: dts: nuvoton: npcm845: Add periphera=
l nodes ---
> commit 206c681ed8ed3430aac99224e79975aed3d5da1b
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845: Add peripheral nodes
>
> Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
> by the evaluation board and downstream platforms.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
>
> [ ... ]
>
> > +             fiu0: spi@fb000000 {
>
> [Severity: High]
> Will the FIU SPI driver fail to probe due to missing device tree aliases?
>
> During driver initialization, spi-npcm-fiu.c calls
> of_alias_get_id(dev->of_node, "fiu") to determine the controller index.
> Since the fiu0, fiu1, fiu3, and fiux nodes do not have corresponding alia=
ses
> defined, this lookup will return a negative error code.
>
> This causes the driver to return -EINVAL and fail to probe. The
> nuvoton,npcm-fiu binding also mandates that all FIU controllers be
> represented in the aliases node.
>
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xfb000000 0x0 0x1000>;
> > +                     reg-names =3D "control";
>
Yes, and it is defined in the DTS file and explained in dt-binding.
> [Severity: Medium]
> Will this cause a fallback to slower indirect PIO reads?
Without setting the memory reg, the driver will use UMA commands to do
the read operation instead of direct reads.
>
> The fiu0, fiu1, and fiu3 SPI controller nodes omit the second 'memory'
> register region and its corresponding 'memory' reg-name.
>
> When the SPI controller probes, it looks up the memory region using:
> platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory")
>
> If it fails to find the memory resource, the driver sets desc->nodirmap =
=3D true
> which disables direct memory-mapped reads. The dt binding for nuvoton,npc=
m-fiu
> requires both 'control' and 'memory' regions to be specified.
>
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPI0>;
> > +                     status =3D "disabled";
> > +             };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708165929.22=
33934-1-tmaimon77@gmail.com?part=3D3

Thansk,

Tomer
