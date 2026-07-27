Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169D5418A46
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163413; cv=pass; b=Du8x7nYx48aXmiS4qs04XHsU8TdYkQ0dUoeAVeAGLY22gRKeN+8J+k+AqRSH/bw2rN1IDmkpTaiFFeVhi4ZkZVt3QdzPhu7xDhIM9uu1R6bKNINZDuuHjTVwV05/Afw37kyfRM9fMw3iy4dBzkG6UJdTmClWkYRpM8IBmhTB1Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163413; c=relaxed/simple;
	bh=ilVF5rfbNsMKsrWNYd1qKt+Z0Gad44vws8Zb1fqpjSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJWf252ca/DUqbOjHSLjgNxS8eQL92br9tQaPDtEGcuGOzCeswSOlZVTvHgV4Yf7IFAScbmVgV4pPU39RiWiSOYfNlQ4UmPgjoW2YVcmmh2YfLBE9E0AEj/wH0/fQKoHbSwgHWnLj+8w/7uBrU/9+jjjZBs8iT/XyHfn+1j5w80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J09U3dHy; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J09U3dHy"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66843536f94so2670036d50.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785163406; cv=none;
        d=google.com; s=arc-20260327;
        b=lSuAfI3G46fhpYiJJS/uh+YeurayY5ztYUtqJ9qftA3Cwa6SqJdwuWjvN+E0xw+o77
         83FBvwrUUew+RG0KcKFeTJpzqK5bCHryCax15bBchZh47cBQA8WNfCrL7k88XzbyPts9
         IBZHdns3jJpY6lHQxRE6dadmud3AlG12sEDuTlSrmT2KhOl3Qs7u1o2TZXsvwGYBK0ca
         Ag3NlXanskIdQD+PXMAIGlQEPSGCuhnl+PTfBbYbDVP6EptBPzVBTpnDE/7DZraT5E//
         km77o16FObz1iAvpPScTpoY8VAD1xkXl7X9hZIL6VsejD1at+oUilRPPStrZ1iloSKNw
         PuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6U7gZm8FAQizXF59ec3aCvJxmKtlXRIVGknWn54r/mg=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=hO1kHUba9VrNlQXUfPVKuHUkbdFfe7MSHBHRO4HA8HcGWv44oLgHsrcQA//KBIZjuE
         n3PFyWIUMoR5UX61OqdqywDynM+hHa5r+CVrX76oBUQ8YgbZe7WITpppKOY5cAyBMUZi
         L6vCg+wztvh9Gnwcthsl5aX/Da6xl+DsRKkn6+EWqDjzcbjqW8Plnpnb/0QRGzb0sfeA
         UHvhgM0aoQQf/QpIHyqUFZ/ZapnEcIUQkqlF5TOcbjExMlSvNRhAkYvfnVmpXgis+Vi/
         N81To2WEeCG0KqO+rzRAvHVOFz/iSep+J0wuY7DU9tGJngRcdkD8lON+DRdz0HWLJEe0
         /upw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163406; x=1785768206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6U7gZm8FAQizXF59ec3aCvJxmKtlXRIVGknWn54r/mg=;
        b=J09U3dHycpU/qj8LlAPnCYRsqPFyvVx/FB7QdV/mtAQnJ/uxyE9dR9BYsghE2IuIJl
         cTl0IgaiuO1YCKXNlKuLIHKd7Ob6nqAk17xDjoYvjOlfotUhzqiJ9ruX8r4ALJa8hmS8
         TtUTNN2MfVYMGNkFII8xkJafuYrh5SpwHM47kbmlf41Km3hMDk+yp4oEfE0So7farNaB
         O9DcGNbNq3yfxD+p3aqAjkD1FGKW47WOKz2WNq3zvl1f8/UbUuMeVT4LNY17cUEyWAEY
         GqQy36XUgWCh3m4xd4v0Ca2v2KJ5IcFUnl4qTY2qGM2sARcnkwuAU7fl9YIiGK4w4Nj7
         6MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163406; x=1785768206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6U7gZm8FAQizXF59ec3aCvJxmKtlXRIVGknWn54r/mg=;
        b=tOPIzrCKVpwZQKFxvILwzrQQPWpnolgjoC2rzQerjgQUIH+na6VJ+hD6ctBfTcnzW5
         ySmTF2gok6O8PuwC+cGHa1wP9HtIkCjxv69jrPCEUrbNiHfqvGTDGDdfEahywYIZUEUH
         oHXOOTymqGuiIEf8qJ90AbkSF2NVk3RfLL6maGBNxh1VrSmnTjsFxaFFSohaMmBHZfvl
         6f6mjrXK7RoVn+mlA0RWHto1dDpKciZLq1gy4gzztuebaUIiY8Cp77w3n0hvhHeaiZdX
         AiiTfirrQpxP6NNVpzlG9EJOE3bRYtEueGwgoSAE8TUwfzcRAhejgb25j+PpFesscyt5
         V5kA==
X-Gm-Message-State: AOJu0YysdCzi0DJPUrFJA1s6ixbm7b70czUQxxhO/9LK6eLCcXLwZG0L
	r4wyBR06j0SH3CBaiqAxKXXM7UkIZtNRBEXVw3/tqcrw4oACoylBdnlb2cMjuI4dhtOvcZzMYBr
	3amlyDncQ6SZ3iUpyHB74WezPA+HCHxw=
X-Gm-Gg: AR+sD11X52Y1esulu5JfxXYut4YyWNEr106cOUQet6Bb13sPUMMET+EhUj3QomkjSNx
	SWtN80dM5f0u9j9PJH5IQiczCwzoXggur3a3Uou/iUfJrt29TZj9Z3P3RvZ6AO1ITsTTYqQh7Ym
	7nZtPU9IuyVhNCYlSUivlO7UHuss0k6GKtLuI/Dm4KGxK9wcb7mRDCEVfStF3VjGOFVght50xvv
	AxCJODI4yD1SK5G5ofw0a3vcuvp+9WcPKFhLdnkpIQmMtdiUTFeQ/AvBTFP3Ws=
X-Received: by 2002:a05:690e:4419:b0:668:8dfa:e6bd with SMTP id
 956f58d0204a3-668c79ece45mr1846117d50.28.1785163406381; Mon, 27 Jul 2026
 07:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708165929.2233934-1-tmaimon77@gmail.com> <20260708165929.2233934-5-tmaimon77@gmail.com>
 <20260708171328.164201F000E9@smtp.kernel.org>
In-Reply-To: <20260708171328.164201F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 27 Jul 2026 17:43:15 +0300
X-Gm-Features: AUfX_mxss1gpTVx_iG-EcKgHYOCAVOJbPuT60yTahARgEf9JOKsw8XHtR5OWKn4
Message-ID: <CAP6Zq1hNePS_kPWiTmUvyerv9E9F5QNRwsfkzp1XC5oedt7JyA@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 at 20:13, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The device tree aliases for the SPI FIU controllers `fiu1` and=
 `fiu3` are incorrectly swapped.
> --
>
> --- Patch [4]: [PATCH v8 4/4] arm64: dts: nuvoton: npcm845-evb: Add perip=
heral nodes ---
> commit 58cedbdc9355efee860c7d605886caa4e600ea8c
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
>
> Enable peripheral support for the NPCM845 evaluation board by wiring up
> the SoC controller nodes to the board design. Add board aliases, GPIO-bac=
ked
> MDIO buses, flash partitions, and enable various peripheral interfaces.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch=
/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index 5edf5d13342da..7717c3a8f76d2 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > @@ -10,6 +10,42 @@ / {
> >
> >       aliases {
> >               serial0 =3D &serial0;
> > +             ethernet1 =3D &gmac1;
> > +             ethernet2 =3D &gmac2;
> > +             ethernet3 =3D &gmac3;
> > +             mdio-gpio0 =3D &mdio0;
> > +             mdio-gpio1 =3D &mdio1;
> > +             fiu0 =3D &fiu0;
> > +             fiu1 =3D &fiu3;
> > +             fiu2 =3D &fiux;
> > +             fiu3 =3D &fiu1;
>
> [Severity: Medium]
> Are the aliases for the SPI FIU controllers intentionally swapped here?
>
Yes, it is explained in the document. Since the FIU1 module is added
in the new SoC generation, we should add it at the end of the
structure
> Mapping fiu1 to &fiu3 and fiu3 to &fiu1 assigns logical SPI bus spi1 to t=
he
> &fiu3 hardware controller and spi3 to the &fiu1 hardware controller.
>
> This contradicts the partition labels defined further down in this patch =
for
> these nodes, which expect spi1 to be fiu1 and spi3 to be fiu3:
>
> &fiu1 {
>         ...
>         partition@0 {
>                 label =3D "spi1-system1";
>
> &fiu3 {
>         ...
>         partition@0 {
>                 label =3D "spi3-system1";
>
> Could this mismatch break userspace and boot scripts relying on the logic=
al
> device IDs to find system partitions?
No, this is the way we use it, and it is only an example in the EVB;
the user can choose the label name according to the board's needs.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708165929.22=
33934-1-tmaimon77@gmail.com?part=3D4

Thanks,

Tomer
