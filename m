Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C796C3D47AE
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443345; cv=pass; b=o4To7t1XvUvyqnydMWBEeDRG9FPtBVheG8tx3KFVX1D5xr96+3ejjMqppPLKhQY49EI9weLLKEVzN37+IHN5wN8OeZ6RyxE2sqKUZzp+pKPZiMxJ14bYUJ0MNG88WZUvfYYhu5+KcKFeqXZJYAkKj74BNClPbHm2bEcpZbOo5Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443345; c=relaxed/simple;
	bh=BV3nfYDh8WB934qXYoTUNUtO0cx+cauV4kfuBRprQk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIJActgxxo7H6qdiUENkVezsBqUilIFf4+AmROiAL9zMBmkl+I/MBfqKDeqwcFFS1aI0Ae4yjiU02uCKcY5N+kdM0aHrymIGWO/dPzvEHhaV7SICPFWtV4XbajujW0I/EgUiz4jgU9zNNrQBteLsRseB/q+w3qPxqgzfUYSrJzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+sP/6dR; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+sP/6dR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so2161509f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774443342; cv=none;
        d=google.com; s=arc-20240605;
        b=Zjt45idMjp3wIMhBN9hEXE5Ma50yFzx3der0Kj4KFj1LaUUZqM06Vy4izCmqsLD+oo
         wAnhQgWYxcsGBf2CLIOebCufPITBTXh+iwIRKoTmdr1l/BUBjPZyEYa5Z24PIbnEliSk
         YAfEeMEti1U17I0wYw7t+WqhRb56KHQIDnoOLvQcH2TS5PSMicC752NfXZWlfW0RWt1l
         pNBhSyj2JiqCYbBihNKkazawKeZ8HtoXDv/eSAAlb/QcsUzVJJZSH7AwKawoihSAw9pq
         yUlQEb9imAYbTenE5ngm60RMPhCPk+Ntd/t3u6raxwrgcGcOTMNyDTlvmbRKte9pdLXt
         2VWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ibd9SV4JUyqdlWcLocgMKTGACJe/SwVChUcXVjG7qHs=;
        fh=jpvuoIB3jmWA7JpIZcnKhksGtpYcBbZwulcu7SeJiWM=;
        b=BHSrJXw2JMbnx1Xh+W9QdBAJ42/8vgHuwfEYGsnFoHntqREDaZ88A+jTTKIhUJHewU
         L2x7naLC6d4LhA2qx9lLZot9jjUAbiOxxwPgs6u8aLP2TwzSnV4B5zwGhQ3h6KYQPuN2
         e5YW6oD8T0Nz8K4Q3NzB8Mklhn40bTwG67knk8dg5SatdBdfQVxQbSzbn2vrlkeAfyuG
         lYi7v4x2ckMKrR6KUx6EBt1T324u5NyyCrkgdvIzAXXeXx5773ZzldoFo9edh4MZP44X
         x+bu072rmw5OjYvtOgn80M2bA98VyBCZEfwBo7kpK7lS1vR6j/1c+sdjAln9+iNct92u
         ym1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443342; x=1775048142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibd9SV4JUyqdlWcLocgMKTGACJe/SwVChUcXVjG7qHs=;
        b=O+sP/6dRCaL0nLXWqubpcIGPAPmK6hAvedPEKsrG1nXIjvsfkA0575y7LPfGBriuHV
         9gb9oArVQRwDzqbZ3qf1pd2HwnnIc4CRQ3MCmXbRdyBcVwYFzCOuD12+o7r1CWNoQEgK
         tZNTg+WyHSXjh1YSD+Gf2OBwrpgmCLzG5l5a/A26WvlU0JkU7UKSAPyWAwYjMBUqCUro
         WEMEK7dkOeS2jl/40GD9dJNvLmC93j835cSFut7R7EaQfW/3NTkICWf5qo9GXVlPYSn9
         HMs7SvtU5NKJpPSlp4H03JnvfzWVDMrdNSMyALf1vxdaqhgUbGcrN2CGOC6Vhd4ll8p1
         BLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443342; x=1775048142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ibd9SV4JUyqdlWcLocgMKTGACJe/SwVChUcXVjG7qHs=;
        b=Vy19CSvFgM29UCXgBnPs32ZaaAeRlKY5NZ8zTEsRtOY9PKQOFY/sDxa3MG9oKkyZuq
         +cOk2x/bk15/V9sYfCN0xE9ujKIXbw4wYvbtE+hGSL/SCG6aEHBnNx7z1hnh+1uSENU/
         rBvhTE6u4OIMlvgDVpq4WrrM2kMSjnEoop+8r9/Cfb7I1yYmWR92TY8U9iFbDRlL7iF6
         03hw/BEQjLxw4pfboVzM+TKregDbluUCBUZ0RrRmTEFFSmAQBpgUJOuOuGUJ9CTIhcH1
         Vyi5nkhI+5WQtBewcoGI4ErNQXhkF7Y0XOxp1f9Yuwze0rmFd04MqXJZlwnrGZMeQuVK
         Z+SA==
X-Forwarded-Encrypted: i=1; AJvYcCWJrQwZm5V5KrtS/Yh3vUY3F7sN6noOlrTRendXIitxKDLuXW++RfwC3ZTrkqyo3WlbPZtlDHw8c06l@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPWvjadOCfs2t9PVy5JGGydI2ECZUZLCzok2nV28Cw/RJcPdS
	D+3QgZYjESgGLDx2+Fc4AKXCWjTz4TyNtm7mgFdstRwUJ4/xdHlYIM9bXrMNV5yoSiiRHuvJo82
	H/WOXZauEJE31C250g1bstG/Puc3t8c0=
X-Gm-Gg: ATEYQzy7NFu7IwTZFX4+Vna3IHeEg7YyN2/lTLb3GctZKr0KApKIbcUSZDbf8WTaMCf
	QN6M+5OrDduEwVF70qkaxhZurL7oF+KRyZZ4WIZOM52t/7GHmoSm+gambSFccQd9pggdcFv6YUR
	FO1cbtczeq3WURAXqNDmJ0a1yMq9Z2x0Fxm/FgRqnqF3MfSRsp0cqh0DkPl9cKzF5vlOpR6YcDn
	dyrinbi1kPUNFKOU9eg3CiKV5tfS86wMf6pqIVKgFCoeAoVwKViXgWm6ykRamyJDXkQ9gLyaDwE
	9XBKEgPE7Uy2qUJK5nOObuD6E+0bp8jpnqvqcObySTHb/9X6LCZEdqZSupDyQDKbkJqI
X-Received: by 2002:a05:6000:2c08:b0:439:b564:7a71 with SMTP id
 ffacd0b85a97d-43b889ac037mr4873482f8f.1.1774443341855; Wed, 25 Mar 2026
 05:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <abgQpsArW3VrCAns@shikoro> <CA+V-a8us8MiyRtAy9ySShY9XKepY6-Cwy3MpVgMCVK47adAV8g@mail.gmail.com>
In-Reply-To: <CA+V-a8us8MiyRtAy9ySShY9XKepY6-Cwy3MpVgMCVK47adAV8g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 12:55:15 +0000
X-Gm-Features: AQROBzCOBzAmxi7Y3wwnl03cmp576d14Z3rDc6ctssra-K9ee0QCXJNFHrcMG0k
Message-ID: <CA+V-a8tj=LyJ4zoFvfp4a+d-MacE8k90V8bMnkHRKyZQG3xLwg@mail.gmail.com>
Subject: Re: [PATCH 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Mar 18, 2026 at 2:03=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Wolfram,
>
> Thank you for the review.
>
> On Mon, Mar 16, 2026 at 2:16=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> >
> > > Add a new compatible string "renesas,r9a09g077-xspi" for RZ/T2H while
> > > reusing the existing xspi_info_r9a09g047 OF data. This allows the dri=
ver
> > > to bind correctly on RZ/T2H while the register differences can be han=
dled
> > > in future updates as the affected configuration registers are not cur=
rently
> > > accessed by the driver.
> >
> > This sounds fragile to me. Can you add a comment somewhere in the drive=
r
> > or headers so people wanting to use these registers will find out that
> > the SoCs are not compatible anymore?
> >
> I could but they would stay unused.
>
> For example, consider the COMCFG register.
> On RZ/G3E, bits 0-1 are used to control the `Channel arbitration mode`
> On RZ/T2H, bits 0-1 are marked as reserved and the write value should be =
0.
>
> Currently the COMCFG register is not handled in the driver. Similarly
> it's the same for other differences.
>
> Can you please suggest how to handle this case.
>
Would adding SoC specific data like below be OK?

static const struct rpcif_info xspi_info_r9a09g077 =3D {
       .regmap_config =3D &xspi_regmap_config,
       .impl =3D &xspi_impl,
       .type =3D XSPI_RZ_T2H,
};


{ .compatible =3D "renesas,r9a09g077-xspi", .data =3D &xspi_info_r9a09g077 =
},

Cheers,
Prabhakar
