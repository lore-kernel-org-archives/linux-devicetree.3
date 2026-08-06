Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D42376A04
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002471; cv=pass; b=FLwXYhH/PkiVw1Qp6Lw1LbL+L3Z5vonZRf+rOZqowpfpqIgnZPtfSHAwo7eyApGc0u3ZySweide70ZQMSh6Y/hQ5ZmDIa1PYrkVbNAggLeiAB1xLw2qNEJ84zY+c9k+Ef7N1ZC39PD4nuqN/uvi5WSEBPy5WErHkNRuRytRnji4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002471; c=relaxed/simple;
	bh=1Gc0o+/7RvPrQBeYe64Gfdce9NN9vPNc/pfa+Tldbcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLSyCajSwNG4oFCwU25a+bnRg+2RCmdjt7AWcJMPZ8TlhnHE8M55RsvVIoSG8Qh5yyg05d2rNuo2tIhvWRI6DCea69uU9s1B6CcS0cjkup8gawMHSsfs6T03fSKJW7/xrGZD3D7d2cVMeSJ4ZLqKIsRWao9ed7s1C+nqDPsyx/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3P3RVN9; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3P3RVN9"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-754acc61e10so692972137.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786002469; cv=none;
        d=google.com; s=arc-20260327;
        b=KlMhdyi05zpcnfAx+joRVYHiHEY49Cb6kjcvxC1dhOeP1kC/FXnd7qC8NXNpFgvJ7P
         IRR/JYzp2ISJMgSnAW1iI1IJaHvs1DuMaJ56h9EoeKWxuJniIog5PcKOlOzwC/BScdEa
         9xeViJ6dHSFtJI1+6QNFrAG6IcAGlLNU84Z3GW+auX+JLYUhPpM8MGORttU4gmjMhxJk
         eTTQPKLjmhp6UvmlvBGiILQNL15rcXSkwvwqkv85HLTbolldmiHzHuwQSNJrTJT1zJAp
         TkDTKAvChmFEnNqIcXpvQa5Mjj6ADQgzoF0YuchXlw7nV3fffy2vJ5/AhEk7Ly8Jlox6
         /LJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tl7NIfRHqSjM0Xzgd5QQB63n5RUmzjWP9DBfv9ASzSc=;
        fh=AjryljslK9JyU+uti7ys/gfnnfJReJz8rrAi2KmFcz4=;
        b=Bylub+YEDoaWZsDo2LB04XDSBYHBvoD9jVBXAvJZSpQTT1J126WPk95TdIjicfmKb9
         6PDkYxkKWShDrt+fkBdh8Og0wGPJxoFrzsFmcuriYO6UdDjrZMCC/HpsLWPrjP7Y8c2Q
         zIZ/YR904PP53unXBqFKHHVRy33LuX5+aM2CpyuOZcKtf9v9P0bw3XwLObDKlBT73U5k
         qpfd53VvldGcOSOnarFj5N4bOlc/sH0iaiZ+nwGPQBtiNCpL6eqcPNuvgfHAic7B6AQ5
         L7EzOtyjPTgiAOtOeIxebgQrdxdgK27LFwxPANrbwn9N/XlrBXp8s7PPf4KvGRjEm4+Z
         R/SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786002469; x=1786607269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tl7NIfRHqSjM0Xzgd5QQB63n5RUmzjWP9DBfv9ASzSc=;
        b=K3P3RVN9lwJQc9hNahuglGNs0Af6oDJ2JDYLy26Sdkgo/lCUFtSgXHQDkwoFGP/bhI
         ZCKg7C+ZcsGN7Gg4VuLy0HvNphLoQ/U0PIezTvJtpFMK7yOQ5El2wph5wse+m9YN5eC7
         WYILYLhx9NxgF211yQdDaGZ+XxJJTxLd9C7vLIH0cu/23/zbThefGVD94YO6U3y9fpYB
         Shp8VJchWt4DAhlxJ3IwJzpqP/ViGxgqLpc8HG3/zZbVle9Il0HFk9ctEY+3AOWzoVJp
         jwh3BNJkVNVGVa+fqvQUXrkL1rysewPk0o99ydRBzIJWjtblK92qtQmH3/5Cg+f8j/FB
         HzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002469; x=1786607269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tl7NIfRHqSjM0Xzgd5QQB63n5RUmzjWP9DBfv9ASzSc=;
        b=nbUWR2Vx1fO87Myomg6APbKadFuuG/plPo4fiZcYcKl5xtWn4Y2+OUgBzPVj4TcD8u
         c4UrBvjcvWtsYzxyXcGmWElcvdiYqn1r9qBDh1HElryMcQO0wSB860KPIbYa0VajctWJ
         xZvvo2TGSKP59Tz9kBTwNw4tNlx7uFQL208NXt0I42IT70nhvW3qi3qunMMoQjt5WKDT
         GRtDkrFOURzhCzDEMikPi+kilsiUD4UKr6nyghNnLafVP6b3taZu0e9jyrfBcY4gQ17J
         sq3jE+knEhEjW7l4hGsFmhRq2X8yI5hKJ5BPBz5IbufkIxDCvk1Ql0F0dRmDZ8ontfmw
         9X3A==
X-Forwarded-Encrypted: i=1; AHgh+Rp2/KnB+HGM2ecgT8XQDGTd9MxLLh+dm5l0tnYuA1hZ8+1jMT8DbOOAya80jQqF6VJoWbXhKDDdk0xk@vger.kernel.org
X-Gm-Message-State: AOJu0YzK0IpJwUDUIC1tPWnnWF20CoHhmUf8JCrFcexteXnz3rCu1kMK
	oiLL9FqgpwPxGiFo77gxqRuGHBXABWBX/eJWqsbIwSZFXU9TYhGkNUQgcHubamITVqICOjze+0r
	4oKu+BDUFz0RodddkKxtGrJfTvhbwMy8vXVMJ
X-Gm-Gg: AR+sD13m0PB1pMe1Qel3Gmf7wsBtpNOd16WtGHo1N+XgxhzVQ24jD6oncQXMOALj8xD
	rKxO+CiNa6DjInKn1thJxN5QltrFpOIq3UDwhqeke6ytNpeKAdWEatD5k8fSq569OqdxOElfnY8
	ZRWUAUqCQUtcWeohBzEnyiW7g3xTHzrLqGY9IxYUsF/5Lo2EVWtuu48adhDLNTwTKKba9B3dD73
	KcRu/zYX/ICSqQB5qLDXlSwsNPg7HoBRctp5YAz6pYtZ6VPdHb8xXlIrxFfz1/+gBzPb4aN5GmG
	8qE0eQSzkmknjWmFaRp0aLCYvqgP6vEKg5pwIzszbxgN4zhRlaiAYaJM4A==
X-Received: by 2002:a05:6102:3f89:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-760e67c876dmr4030855137.1.1786002468676; Thu, 06 Aug 2026
 00:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-2-5d67e0efa6c5@gmail.com> <20260805131843.451FC1F000E9@smtp.kernel.org>
In-Reply-To: <20260805131843.451FC1F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 6 Aug 2026 15:47:37 +0800
X-Gm-Features: AUfX_my7Auoq_NqzDivFDUdXsU2FHDJP1N9mmdPbEYLWdTv0eXwWmA3dM5aeCwI
Message-ID: <CAPBH0A9Op2U7THS6APB+oMvRJQp28sAU9+NaUTFoxLpDfEQBRg@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] ARM: dts: aspeed: anacapa: Add EVT1 devicetree
 and point wrapper to it
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=885=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The wrapper Device Tree file includes a `.dts` file directly i=
nstead of a `.dtsi` and drops the generic board compatible string.
> - [Low] The commit message ends with an incomplete sentence.
> --
>
> --- Patch [2]: [PATCH v4 02/12] ARM: dts: aspeed: anacapa: Add EVT1 devic=
etree and point wrapper to it ---
> commit 0f5bca30c4e664b3bfec688906a2d297fbe5f884
> Author: Colin Huang <u8813345@gmail.com>
>
> ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper to it
>
> This commit introduces an EVT1 development-phase devicetree for the Faceb=
ook
> Anacapa BMC. It updates the top-level wrapper DTS to include the EVT1
> hardware revision file.
>
> > A dedicated EVT1 DTS is added for revision-specific hardware while
> > keeping a single, Anacapa entrypoint used by the build and deployment
> > flow. The top-level aspeed-bmc-facebook-anacapa.dts
>
> [Severity: Low]
> This isn't a bug, but it looks like this sentence ends abruptly. Could th=
e
> rest of the thought be included in the commit message?
>
If I need to send v5, I will provide more message.

> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > index 1fddf3a5d1383..209eef65cedbc 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > @@ -1,1079 +1,4 @@
> >  // SPDX-License-Identifier: GPL-2.0-or-later
> >
> > -/dts-v1/;
> > -#include "aspeed-g6.dtsi"
> > -#include <dt-bindings/gpio/aspeed-gpio.h>
> > -#include <dt-bindings/i2c/i2c.h>
> > +#include "aspeed-bmc-facebook-anacapa-evt1.dts"
> >
> > -/ {
> > -     model =3D "Facebook Anacapa BMC";
> > -     compatible =3D "facebook,anacapa-bmc", "aspeed,ast2600";
>
> [Severity: Medium]
> Does this change unintentionally break the device tree ABI for bootloader=
s or
> userspace tooling that might rely on the generic compatible string?

Thanks for the review.

The removal of the generic "facebook,anacapa-bmc" compatible is
intentional.

The EVT1, EVT2 and DVT boards are treated as distinct
development-phase hardware revisions and are expected to use their
own revision-specific compatible strings. We checked the kernel tree
and did not find any in-tree drivers matching on the generic
"facebook,anacapa-bmc" compatible.

We therefore prefer to keep the current compatible hierarchy and
schema definition rather than adding the generic compatible as a
fallback.

Regarding the DTS include structure, the use of DTS includes is
intentional and models the hardware revision inheritance used by the
Anacapa platform (EVT1 -> EVT2 -> DVT).



>
> By including a .dts file directly instead of a shared .dtsi and replacing=
 the
> wrapper's contents entirely, the generic "facebook,anacapa-bmc" compatibl=
e
> string is dropped. The resulting device tree blob will now only present t=
he
> "facebook,anacapa-bmc-evt1" string, which might cause downstream failures=
 if
> environments expect the generic identifier. Device tree conventions also
> typically recommend keeping shared components in .dtsi files rather than
> including another top-level .dts.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-=
devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D2
