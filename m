Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932233D9050
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785972023; cv=pass; b=CX34yIBiSQj5lsXO3jyFgc4hccrxE/an/kwtJGH2+yb9TIzB+7DJ9gUnD5yF/IBtm2x/5cEx1tfYqbZyoXcItFndz+YDrI6z4RXhqmDSKlwBOIIbPApKWz2sUoQM40gJtYeeGJtQGA4F90oJjq//HVi4tvzKarCVFbU3zIOh4LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785972023; c=relaxed/simple;
	bh=jmKV0c/Se8u8yIt0ZvgkJGPo9dNxUWC90XubqPM7Phs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pY2/6UROOhxzmeweFFFx7ZM61OQT7tKWSsj28QY5qYg/FlSDU0J6yswOTHCC8P1XrdnB1bjErdmNWob+pDOm09EGe/hFyxb04pzCjqNAcgVrUIKVobl5L2HZBPtb//G/UYWvvassXpmiPclOrpUNmKXm1SCBg94t1DArgbhi40Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpjWlL69; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpjWlL69"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1272777a12.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 16:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785972018; cv=none;
        d=google.com; s=arc-20260327;
        b=G6+pM8bxpfVrrpFwN/1N/XrnRwZG63Oua1ChAEmfe+GGaDHkMPnXOyk3ruH8wN7K9y
         Y//hy1eqK/XkXi9RynSPCIqVU42NuEJh47i/V9/h7L308/XnKay5Rjvv9ik3F8fuqTIQ
         QpXdD9jgUwHzNiUKMmwMzlGfECcgPSveg/oZb8pwbB0pxuKMuWlutRbCcLO6jkDHJMpf
         CYTCIRpYfO6Zftunk0zZnhkuJiO79euivsYadsD54vjbtTWY3dBNb+fRCF4PfIXGfeVC
         VzQu6L/c98xWLNoLQFCXWm+zdcCwEN0a3dNRFKnAV0Vaoe9oUwo+Gv+BntH6Dhn1fbpK
         fwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2BGPSf6QpIXJkxFb1vWvogj5MGQC0tI4OVE79dWp2GQ=;
        fh=7FbfR0KdmLuukytcmhGnhUQLp3dPsEXPGB7LRjOTzYM=;
        b=B7pRw9L8hlPVrB6j1S0CfedsbbFU2tMnEUN7dYNR1R5q88dS0pw1E09twVdVO/LM0H
         slfflizteYZlAVhUFMZ68/22O2ikybaIOAAOZQFDWyYxnivDOBZ4BEsJeLcoslkJWVQ/
         XpmyJ1GnK+1RSuuigkEuXGA25P58n9fddqzNlUaMwvVXg4lFNtOFfzXfmFTInmNnH1XJ
         Yo5dh5MBY3Hl8WmsdN+f2p4H2ZZZmg60DipIlXwfnvqN982OAlVRJs/k8PB6ICJlIe0V
         C+DOzGSCJ0a1BL/Z5ZnE3ZR653eiDKO9xbHS9jLCl9+jYkGBTz6Q55sO1Uzne9oU9qKq
         udRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785972018; x=1786576818; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BGPSf6QpIXJkxFb1vWvogj5MGQC0tI4OVE79dWp2GQ=;
        b=hpjWlL69af9NYuq09BB4fDqIuoO5RQrP4pZJ3LAw9euMyIinTo/OOWBiXzv7OYpQmd
         LmOMRIV6GtNFGr/BjP6G/XR4ONTXOE5oKkty00gfjjOX3BvIPawzWAzyITeIQ3Tti2ec
         S4OFvAM2Hi2Sr4i1J8djF46ki88Oz8ebUsiJX7rxA1/cRqB1LeQiDx5iGn/N0pn4gJqu
         +xsdVsow/GIceuXREJUsxisRc/KKvtScZKciFZW5XSucBUiiVF7KBgKoGWSMfnrMT6aM
         oToCvcpvKE9UWdbKKEpXnkYhrbvDoRD5oraoaGgf47UZQKPgxANe5NZDJpPQi9gc9qkj
         OE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785972018; x=1786576818;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2BGPSf6QpIXJkxFb1vWvogj5MGQC0tI4OVE79dWp2GQ=;
        b=jhBbXNOixPKfRuQadE7qAJm7wozBl0xxbMlaWIcSCQiCkR5qUs/X8gT/ln+1CpBhGf
         wZXMyaBU2OUHrWpCVaDaZbACDYrnFH7LrJcI73/ZPqHD0TgxXroJxVT9O04fnOTcTEx+
         ihmz0QLR9pXMpTS0iTtROzL3eM5QYoFEi1f3/Iw77MKnFvqhIjy9nCf8PCfcYE4/2ymJ
         qJzIt14CqjAwPvE2fghu3sD2drMf9y/2EGOMsmajTV4xNjERa2l93kaQuLjNg6DilzH1
         k/3/6bjSU4ixaKxZ3a1ABdVkREdr0afsvOaaLavlUsaOoxI9wTENs5GMutEeVwQbZ3n2
         RivA==
X-Forwarded-Encrypted: i=1; AHgh+RphRHDyBmTKxqACuN0KEKd33sxxzUkU2Taf2fJwPL1F0b9fgaw0hTRBWeflU2jDt56jQtHJlzcHgias@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh/7BAKBP5I5foF0D6xis1CeUGORrDrejhw8e9+jo4bmu3bNBl
	MSOhqc3os3nJNuVIPK4Id1GJ/MV+ulRtJ5UtZkARGff9eJi2Pa7yGfwSll0isM5VeI80A3e65qR
	ffnawwBmZJuDOf/UzEaBUU8+dNv5GN8A=
X-Gm-Gg: AR+sD12FcIRBdyqYPeh44a+/XDJwcSbjlXyixZdkgOhWT8vJy55697bKYmxIfmYUi+e
	g57gc2iac0opCyCWInq1d4roNt8LLGhliqB/eNUEZdZqtGPItRiUbgfOZjbyjc7wHdExaqF+g2t
	6XxVWsaN18FEewWGRACQflJDMjYHHGNUQsios/rQcSafxcPeP+y80sNzqNwOOxnOGAdfq2zgYJu
	AX0Jz0dd21sn8v74agNhfWRFeQbecFK3DwvuE7riXCT/+gyLBdOra1ASRKrS901DLOln/EmEPfB
	omDLZSvLbfmTYUA5doyDgpjGXxRGBg3R1Rkx0z/nsj9D
X-Received: by 2002:a05:6402:2353:b0:6a0:fa22:c1b1 with SMTP id
 4fb4d7f45d1cf-6a14f14def6mr6034923a12.19.1785972017604; Wed, 05 Aug 2026
 16:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804225617.264861-1-maximpedraza@gmail.com>
 <20260804225617.264861-2-maximpedraza@gmail.com> <178589017450.2494424.9339926059212534643.robh@kernel.org>
In-Reply-To: <178589017450.2494424.9339926059212534643.robh@kernel.org>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Thu, 6 Aug 2026 03:20:03 +0200
X-Gm-Features: AUfX_mzOCZNsmfcLq2dg0NuiT9kjwjgP0rCcSAmpyZFQYuYenYCm_iNS5xusMIQ
Message-ID: <CAEUXW=GWjTSoa6iRcA=AsP1xkKdud_rwYvgqXahmzHBYZDPYyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: add a device tree supplied
 boot logo
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-fbdev@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"

> Documentation/.../linux,boot-logo-clut224.example.dtb: /: 'compatible'
> is a required property
> Documentation/.../linux,boot-logo-clut224.example.dtb: /: 'model' is a
> required property

Fixed in v3: the example now declares compatible and model on the root
node, the way the simple-framebuffer example does.

> Documentation/.../linux,boot-logo-clut224.example.dtb: chosen: 'logo'
> does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'

This one cannot be fixed in the binding: chosen.yaml allows only
^framebuffer under /chosen, so any node this binding describes is
rejected wherever it appears. I have opened a pull request against
dt-schema adding '^logo$' alongside it:

  https://github.com/devicetree-org/dt-schema/pull/204

It mirrors how framebuffer is handled: the entry is just "true", with the
contents validated by this binding through the compatible string. The
pattern is anchored because the node carries no reg and so has no unit
address, and the binding pins the name with $nodename: const: logo. If the
naming changes as a result of your other question, the pull request follows
it; it is one line.

With that applied, a full 'make dt_binding_check' is clean for this
schema. Without it, the third error above stands, so this series depends
on that pull request.

I did not see any of the three locally because I had been running with
DT_SCHEMA_FILES set, which leaves root-node.yaml and chosen.yaml out of
the processed schema entirely. Your message says exactly that; I should
have read it before rather than after. Running it unset now.

> The base for the series is generally the latest rc1. A different
> dependency should be noted in *this* patch.

Noted. The base is Linus' master, currently v7.2-rc6, at Helge's request:
v1 went out based on a stable release and did not apply to any tree he
uses, so he asked for git head. v3 carries a base-commit: trailer from
git format-patch --base= so the exact commit is recorded in the series.
Happy to rebase onto rc1 if you would rather have that.

Max
