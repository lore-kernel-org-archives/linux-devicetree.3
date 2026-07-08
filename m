Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A851E1DE5
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525542; cv=pass; b=KkGhRA2W/mnX9uEWDjubMnfb3ciIe/RiAwFb81EI3gnz+SThW+XlthZgz6L0qKt7FDGjuw5lYaEPc7EnKqLt1s6UHb5rrr6kb76bGHuw/Zr6GICXF1Pa8Y1nK5uPL31UJoTe1MRQVVOm8sV9Vcj3/rxs+gMImVu9Hya7yFxr2f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525542; c=relaxed/simple;
	bh=3VvyaRT2KLtqRv1KAgHFGa6KCQOszCY1uEkWUilYHG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMtzeRJG4LHsSCbeuHksT6KfdlU0L/YuKkFMFvO1Id9V+jLQHTB1pS4hOjheRa0eV6i0um0Sr4h4Lpi36Tk8DYF6oW9+Hy0ecF5McpBFhYaq68xIe6lAignFRqKRZ4uNULo63HX2QU23XwEKhmXwTc4eje9C1dxwtX1qxnqrbwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gvip4yK9; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gvip4yK9"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664d22d7337so1519275d50.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783525540; cv=none;
        d=google.com; s=arc-20260327;
        b=pArqaPnVqTVO5/ciEqiLamB5UEJomxQvIKyUrOABobiNL7GaB2pjfBfJpkiKYFjgiy
         yXwYz1Sg8OkFN8i9r8Ii+ToRTnKVBiTnJU9q0Ap2q7ZnD9ZwUUxzGkg24ZwMVz8X+qkM
         MlDYeTjkIEG8I3uxLlXS8EyC+khqbmMumhEl7YUeHgp2yn06AeL30g+zXvToOXuCh0WU
         pU66A0SocuRpnYBTdtwv7DMs31JViB5CRJPD8JslYf6KlE8dl3I0wwtWWZPOtp89AmIZ
         S1PL6ObecJAIxPPSPhYHqabyLH7xI3S6/a1UzmaFYrqQ3VeH5g5sTqY4yOjLNR5wzW2f
         Cg7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JrO/C4EGIXTavDbeUQFmwCmMVn+PH4kZLE3fSi4r440=;
        fh=a8GiH/wteUuA9CXKPqPI/qgC1E1XsP2Tm+pSqCarUWU=;
        b=nG4kXAjka+GikuKFimVKo20cw6iv/f7A7KXuPQidlfDc0EOq81R5UJTqeh2BpUsNq2
         awOpe+qhyRW0cndQ0YL4pZcuEJtCOEsx7aLS7mOhSzx2FroEKh6GBpv2ja+EUdUQZHh9
         hqDFz9TKRRZO7+0CUYOrLRttcJQsNRThk69VvgnVqAS4R7H48dWY5AQn02mR89AlgEw+
         xq5RIB2aYVWthgHDGK4N2EpgnzdXWDcGOpClKbR+xndbCaPDzHPFgrN7kr2tFQ84VE8K
         ob/gWSp1agsqH9O+zi3RkcWSp4zPvdG8J+dMfzIW8aqXOQy3kl00irYe8pdvV8atd15q
         uvEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783525540; x=1784130340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JrO/C4EGIXTavDbeUQFmwCmMVn+PH4kZLE3fSi4r440=;
        b=Gvip4yK9G5XYIpJXMVO65iXp1P51i6wu2AJxr/kyXml4v2J6g5VQsubcRbFRsIA1SL
         rhzLAwSMiszBmz6ziMSn8Dw30iftO6jNjK9cKeQTuZQkq8bXWMFgmCQpreaZyEiO+In+
         o9tv2/Y+bGyIXOoLbMCUXv0hK/FCAYfeit2T1rYQgkSLRmWBeeJ5R9DN4159sHBoR/km
         Hq75VFhcPy8iNfFY4+S81xAyBAL1CbeqkRbBq3v44VhFc/m0iW3wjkj+PIBU6/Q6zD5r
         GBkT02tzTp/O3eWdeDPQw9RVLTpFui98PMJtXMdbQ2kXsIeCeUv/ksbWNuvXyRYQU/FY
         vkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525540; x=1784130340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrO/C4EGIXTavDbeUQFmwCmMVn+PH4kZLE3fSi4r440=;
        b=NhVsMxNwxzvahF3nWdrrgzq8ksAqZ+OPVoP1xGRf9PxzYMN66dEk/ITzjCT24kc45j
         jHfUVkEV12eSkzPcZ+MI0E++gmfUvXpQ/4yzKuEoA1jcYLLjXUeTB0Ut+AuwqQuJr7qX
         OY9Hy9qK04TuHEviwKdtFjHFQnCrGRYU4ntK/9UXi86dGnAAOQWR4nVzOPp+aTtELjBi
         Z+yFuM1EG1AOij/c2b1sn5mAj+6cHtndCkyXDvFA0lpZ/fY3UeVneHRZX9WK9gcg9k9p
         iSgR/QFKJyUnWqWp8eJg/sZ8UDN+dQuDbsFAoShRUx0xqNH53olxl1iUHBPQm0Tza0pN
         G5LQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0fSmPWVvyDadocR9D0S8XAjIv+kR9DJZ5xuLqXNcHkTh2FkNmc4djwEkfca2Nty3h1ndrMGRB46dJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+XGNWY6BJ0gdZpUfce0R3+MCjHLhB7EbOS2EfZbcou9J1wzI
	9b1IpxJ/3j/YG+rGrQ00/yRYGMe686SmpdCzxUCax1PvQLBmWTipJ+97Ib5tWkLPp5byiYKQr3x
	I8u7NnnAprjbuKdFiMPNHr1/4kKDQBfJb26x9
X-Gm-Gg: AfdE7clTaYFt9+CNlV/PF4o61rHgV28m1BK7vgEuWKljT4WS32ClNP+pqUfJ9OAS375
	d5ZfCLJ/hPuy/spwx1sHsjK+CHf0wEFcM6u4oABzTy049WpF6gdFLqJDPMTG/mOclHvRYxyElmc
	TvDqDlFjyyeC7PUip47CqjGEzmNJekP5k3tzOuKrj/dx/WAIcJ76ZlKYaPRRmyiNsgWIEGIXQh6
	m44u8Box8sAKZlMNOt7nO7X0mASAeMGK0GT1faX+WMAyuvm1edF6TL5dV0jervkTOmtB2OPUQ==
X-Received: by 2002:a05:690e:134a:b0:660:7bcb:7acd with SMTP id
 956f58d0204a3-66788fccd9dmr5382561d50.43.1783525539856; Wed, 08 Jul 2026
 08:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708125352.1915040-1-tmaimon77@gmail.com> <20260708125352.1915040-5-tmaimon77@gmail.com>
 <20260708130847.F34321F000E9@smtp.kernel.org>
In-Reply-To: <20260708130847.F34321F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 8 Jul 2026 18:45:27 +0300
X-Gm-Features: AVVi8CctSGpOc2XlFBYw7NY_6gayi67uBBxQfHK3U1oYnmCn7tlAUz4o01v9m98
Message-ID: <CAP6Zq1hJOwBNHD8hz+YYEBL8pZToYZLuTy27EZr5APnDdCkZcQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 8 Jul 2026 at 16:08, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The device tree aliases for fiu1 and fiu3 are swapped, causing=
 mismatched physical interfaces and partition labels.
> --
>
> --- Patch [4]: [PATCH v7 4/4] arm64: dts: nuvoton: npcm845-evb: Add perip=
heral nodes ---
> commit addb487f93312d5fc6f3c9be5cafae0cfda32949
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
>
> This commit enables peripheral support for the NPCM845 evaluation board b=
y
> wiring up the SoC controller nodes to the board design. It adds board ali=
ases,
> MDIO buses, reserved memory, flash partitions, and enables various contro=
llers.
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
> Are the aliases for fiu1 and fiu3 swapped here?
No, it is explained in the dt-binding
  Alias convention:
    The '/aliases' node should define:
      For NPCM7xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux;
      For NPCM8xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux; fiu3=3D&fiu1;

>
> The underlying node for &fiu1 is labeled "spi1-system1" and &fiu3 is labe=
led
> "spi3-system1" later in the device tree. Could this cross-wiring cause
> userspace scripts or tools that rely on fixed controller IDs to write to =
or
> read from the wrong SPI flash partition?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708125352.19=
15040-1-tmaimon77@gmail.com?part=3D4

Thanks,

Tomer
