Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58B428463
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130775; cv=pass; b=K0Z3B9nay2JrS5PU9HoOskXaHou2qPWH4hxUavytw1t3XwzM/3bkjw5jlnpj00+gJjp1f/yn42wHE2rVCsQGPjotHvRpXpBIQsqEBqb+IZdWwD0uoKQmYo5BespWNx6zP3Rf3SlHSSWbuRsyfi6LtoE+ddtVLsyKvh7Hv+zUqA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130775; c=relaxed/simple;
	bh=DCnsy73dKFmBz5cXqnv5Jnu6rHCJzPmOacFK6Spob4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIpEthEQ6KmdDdHsp9VH9L7d9aZFQxxluc6Z3x2hPjCPpkPGVNDC2jhTzmFPe8Ms+ZyaHZ1iuVYXTsdzfF/gyPQoeUQD5ywzj0JNav9/pa4AdMwQbNALYljSwPxus7/ueaJaGa0cqi5pKX3v63VmQm0zXa3vcNDwJdp8o6uVyWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjxOquGL; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjxOquGL"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1712a04ddaso117274166b.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 02:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787130770; cv=none;
        d=google.com; s=arc-20260327;
        b=dIFhwlgt9p/4pnn7sASgZE8kQfexcmdLT2LLdnWzxYvxWsem+CDvFxnZ+N5sKfj9m1
         iv4ghtBh1W7jEpLhUsV7M0/UqsmdMiqcaAXKxSyhbB25os/FZRdBDoz/Z1nw9U2pYGys
         3LbJcb8sItnzuq/i2dHWPBM2MppcBqtagLl/HJqT26c0hcBMoMn8NldnqY3a4kX/BA92
         eRu2XjJn/DHN1Guu2UH2rEeGu/hUYCIHW65wX7mHysmEG6HoFfxU4/IX2xqwWpgqAVpn
         i3Efv2Hl11UIv2wf34Rzo8qi/HbbrPUgyaIL8Rx/k1ppSAvuIMv8gHLNIyc/CjZOc2K5
         o+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQVqiPHj9gddxJ2oxHXBLJll0uYkJ3jqiGdmF8ls390=;
        fh=68ooWsStJb462hSnuFgQqAsXdz1s9Oi0E6YjYXqbED4=;
        b=dLS+27fX1qW9t3ckoO+UxGGJ1PxLwRKwGPt2SfZUz/IwdypH1YIP5XSQG0ktx1PW8Q
         5JdH7tB2syhw0UlO00nGWFtXcTaXfbnacxb5QxXGw6/1Cm6j81niIxsqgH96SBd8rU62
         bGgHpxkB5inavpA9QGnHEZBNCmDKz5AKtxx+fUjS1sEpAqBkQIzoiYHbBVHSEmTSx/T1
         WrzmM4aOk/ejF/kc8lBj+FnXUr9TEbEMuQcJ0a0I0GpfHy8FktXh7/H1YArIRCS+187/
         zvWutpgMf5LhXWZUqcYx0MKLzjJec7qkrRcZx8BfAcQDC/nyoozTKUGDAwcJEKqg8jOE
         g9Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787130770; x=1787735570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQVqiPHj9gddxJ2oxHXBLJll0uYkJ3jqiGdmF8ls390=;
        b=LjxOquGL2ecAPBMN0uLeQ1Y6Nyt+22TRBCI6KJrDILezgOzpwOaQZMSHdwmzlTwuzh
         lOTy9neusGIA3v08zPSEpPVhfQaC280TDqyUchmqUNCmR2fxaKMi1fxO83nn6dMqFlsl
         inxU/9NLTvBmhbdAhBSC6b+F7mopvymlSZ/MBsek0WamxWpfFOILritxOOnAFrV/q+Yd
         GQWUDAs2Goe/auLnAeXZjIx2M74bCbylfaZmc++77qxMpUpvYZer5zEQss2eCxa1nhRT
         dhUcQt/BWFIT+YH620RIs1yiLDgFNHDQdc8gJfSuUPbDzPVLbfj0aGdsTkAe/yFa2jXA
         LEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130770; x=1787735570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQVqiPHj9gddxJ2oxHXBLJll0uYkJ3jqiGdmF8ls390=;
        b=YHXeBIdOaeLblx/zlbg3Hllq+/9iXuY2Qdjnff5m0O7saN/4vDuLTj+RPkJilSoPDn
         CUc/3JqtyQtIZxt8cm6ddMShtzbVLAoZZ5svUdJuF9rdIgKb0fvP51JCbfETq6icyJWJ
         G6HLuNhcyZB+J2m2dKVMLX7p4acR/daF4+h8SPX4JEKAxvDrPzYnske/GStUThedIzS3
         uUFw2EX9kHlaovuXDDULUkQCbuGKiMy1+rVEOBnP0JE/SkW8lEYpj3NxYzDDkO4QO2If
         /udRubccA6Got7VU6il0cjTfaf13CJzFZq5XqGS8VxHSpbNQO3uZ5SZMbLEJsuZJ/pq1
         Tx1A==
X-Forwarded-Encrypted: i=1; AHgh+RonRHuwexCITy2tCr/RDp3SoCrDBuishoXFHn+t2l9sz3f3qK20r0WwKLHIfUQDcG3RiEP/vcVUYr0p@vger.kernel.org
X-Gm-Message-State: AOJu0YyVyWBtz0576NhU6azj1dmFNKm1JCeOQqJJVi96aozPr3gNgFh+
	a5Q9emuHovb3P3SFdAOY4gw4+qR2vIOBd6D5s/Kv/7RGTiJo73V886kInPDR1yTMASdbhE9LW5X
	hVrFPIg6wAL4DUt+tMu7HOfb5w3VNn1g=
X-Gm-Gg: AR+sD10kYz+UoY961oOe8WXpTrpVKJRWoTiQx661rsyRd87oAR2Eox3xa7IJ0+d3gVZ
	gAdS6DJPFDUYOghju/IfkdlOdPYyFnCpYzEeqLsnRPMHtVFaXkbZkn47CoKydTU98m6SGLNch24
	GOUGS3N4Iva93GvWaQBmMH7crF/zt0jTR6F8dD11wDCf8+hNl215u31Vyqw3MdRSutP6JsNbs67
	eROuZaZZcFEsjBztK6JnqrVS8A53c5wGPqIL6XyhFdIZqYl1OLrLG95AALSV9VTSWXV0wf+uRvD
	a+eZnltmLm1Se2UpG4xGI37PiYEgj7OzyBoeGeDwLtZf5pQeI/GZml2fvtT9KA1RCRMxEliUuOu
	4LPU=
X-Received: by 2002:a17:907:c789:b0:c16:1227:e3d8 with SMTP id
 a640c23a62f3a-c242e22e276mr205170066b.13.1787130769901; Wed, 19 Aug 2026
 02:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095654.429346-1-clamor95@gmail.com>
In-Reply-To: <20260721095654.429346-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 19 Aug 2026 12:12:36 +0300
X-Gm-Features: AcwNN1XqMUC5z69S8iGApPi6yHWon1mnJ-iyXKEJkZHOCPSd2FYry1N5od1LFfc
Message-ID: <CAPVz0n3u0D=0swsO4n6LROFurO=as1w-ZRwaje08BN9dY=JhXQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] mfd: cpcap: convert documentation to schema and
 add Mot board support
To: Lee Jones <lee@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:57 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The initial goal was only to add support for the CPCAP used in the Mot
> Tegra20 board; however, since the documentation was already partially
> converted, I decided to complete the conversion to schema too.
>
> The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
> from TXT to YAML while preserving the original structure. Mot board
> compatibility was added to the regulator and core schema. Since these
> were one-line patches, they were not separated into dedicated commits;
> however, the commit message notes this for both cases.
>
> Finally, the CPCAP MFD was slightly refactored to improve support for
> multiple subcell compositions.
>
> ---
> Changes in v2:
> - fixed code style
> - rtc conversion was picked, so patch dropped
> - added audio ports description into mfd schema
> - splitted schema conversion and compatible addition
> - minor style improvements and typo fixes
>
> Changes in v3:
> - added regulator node names list into pattern
> - filled spi_device_id with driver data
> - ADC patches were picked, so changes dropped
>
> Changes in v4:
> - dropped regulator patches (applied)
>
> Changes in v5:
> - switched to MFD_CELL_* macros
> - switched to use determinator of model
> - switched to spi_get_device_match_data
>
> Changes in v6:
> - removed address-cells and size-cells from main node
> - changed macros formatting and OF matches
> - factored out common devices and made device addition staged
> - dropped cpcap->variant check for 0
> - EINVAL > ENODEV in variant checking switch
>
> Changes in v7:
> - adjusted spi_device_id entries (name/driver_data)
> ---
>
> Svyatoslav Ryhel (6):
>   dt-bindings: leds: leds-cpcap: convert to DT schema
>   dt-bindings: input: cpcap-pwrbutton: convert to DT schema
>   dt-bindings: mfd: motorola-cpcap: convert to DT schema
>   dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
>   mfd: motorola-cpcap: diverge configuration per-board
>   mfd: motorola-cpcap: add support for Mot CPCAP composition
>
>  .../bindings/input/cpcap-pwrbutton.txt        |  20 -
>  .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
>  .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
>  .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
>  .../bindings/mfd/motorola,cpcap.yaml          | 408 ++++++++++++++++++
>  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
>  drivers/mfd/motorola-cpcap.c                  | 143 +++---
>  include/linux/mfd/motorola-cpcap.h            |   7 +
>  8 files changed, 571 insertions(+), 188 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutt=
on.txt
>  create mode 100644 Documentation/devicetree/bindings/input/motorola,cpca=
p-pwrbutton.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap=
-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.=
yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.=
txt
>
> --
> 2.53.0
>

Hello Lee! May you please pick this patch set? I have included changes
asked by Rob and Uwe. Thank you!
