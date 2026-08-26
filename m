Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD22450F2
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752080; cv=none; b=L6VippRgxzXNTSUzKmUaSB2nCDLZ2tOh22RLNwOYktvVBOVjc+eUkohdjjZvuKqJZ69AORY5249H3JtXpY9XqDQq09jIIjuq/pWnCCrDzZOAsLkDQ1PyclVqTvxTuW5Ki9FLGgRT9UeUnsqsXxnj7aLvTGFtGO21isfCPGSL6hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752080; c=relaxed/simple;
	bh=4R80M2uSqG8aB/kf7mO/4PkvyywvIIAoS2BoNshLVNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixjZA0+WZ9q9Gg0vmfpNPMshLoPtfIj7An8/bgtqoRaKzn4VmjqOgh9kSSI8DTSnudvLl554OmfgBsc6mj1ZdI1txmcNujoUzIXD5RzmWJbLSo7j0xVjfJjw81rmpYvNzc+PUiEjuLB/t7IqNgSzbmP1YWfr6zfpBU9/3+k/oSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7466771f1caso263051137.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752076; x=1788356876;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J5AEkQkjMT9TtrBnAvVUmmFOsLJwXzQTGULTsLF/WhM=;
        b=BryBDOI7RbOgR6+eLaKF4o/+xlRNABM9S5+Gx7GYf1QPdE+ttKPHasBfhLzF/C3Ky3
         jnI2/pXmrtCPZSPEiRfca25KLMfW3gjToSI+Ku+xJd3doMy2RR+epICha5OAmVlpdIyK
         u0Xy0va0QzSp98RCnUdpTboJGncRuRbwkaGr+iI/4eja3OH3dSK7aF/ID6nZOE40WrnA
         iANbwMu9gZ87QYVDx/uM1l5WttMW8nm1M68iINWpXYlrMPJsegT1Gg9U553MKnYs8I7j
         w4Rsk9X8seULIXMu/FLWdydEPvSxHn/SVCMUe/aP3hDEn54/EV0+qNYI/B6ep1xErD1Y
         uhpA==
X-Forwarded-Encrypted: i=1; AHgh+RqM+hf98toENfQbHS8RIPwB6TKkht5u4/+R+YwW3DgEaZZR8LBc0MfbtX2vO8kBACceUHyRxCPiinAY@vger.kernel.org
X-Gm-Message-State: AFuF++nKVABO/hjSfzmDUbs00AKvYLpBpoKi+cBtJC5BZivDc+H4OQJ6
	tCPWZcgcUVhNn0rBw26XlX1wQHl+stJNxk5RevavpF81QyLkRpeYu4F/Fj5QSg+Uxiw=
X-Gm-Gg: AR+sD13ncJMZ3W9hbkGpd96/DXwxuxbuHqwUq1fW7OZJFD14KyIjhGO4/EYg2XPc6mI
	ei4d25QUqyBy5JM5GfMm9V+A/Fvrt3DHJNAQ4IIVkRilmeHVlLIcWtbi7fWPui3veU7FQnYDYNu
	N46o4c4zGT+2tjgQ3RNea8HtpvNFJUoTbBZarPlUvueHoMryXPqulhtiaa/hjxNxbLov7RNTeQ3
	WOdsPM9XU0iN0xOE1MSHJUlN5C2DdZxjoct3U8rkWjWCGDvNxBNUg1+Xv0yiKYBtqgXSh6xVVcY
	58gApbhWvKV5NQTevQR2/y2UktgFb4asz2UiHUMNI/2zIYQZhtdMFHlbe+ZLbBWCZ6Cae4VC5wR
	L5RGkzM5EQCynZ9CL92vDNoa8lVqD4yzqJU7wgDJehsmNmLFYPZPJjG7nJGPkIL13L4GYRlDGpy
	LSNQ1NaXj+5fYmtBB5HG/aucDJSU+K5nWQwASoNX18BGXjShgxgPHGGi8pX3wPUQRWR5jBxtI/H
	D7YjeFwn01aq8Z864/i5b2eAA==
X-Received: by 2002:a05:6102:3353:b0:781:210d:2897 with SMTP id ada2fe7eead31-782c1804fa7mr2012805137.9.1787752075908;
        Wed, 26 Aug 2026 06:47:55 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe311309sm1683946241.9.2026.08.26.06.47.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:47:55 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-765c077b5c1so324461137.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpn91rmLYPnzP+ehLXSxQDecaMHrAUJynEUBWN0Vu5JL933JBdOM88tvXzlCOwyMIGkOebSHrVDV6n6@vger.kernel.org
X-Received: by 2002:a05:6102:c91:b0:778:721:53db with SMTP id
 ada2fe7eead31-782bca45c59mr1975967137.0.1787752074443; Wed, 26 Aug 2026
 06:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Aug 2026 15:47:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
X-Gm-Features: AcwNN1WNtag92uCqJjbPhiZSsO7JkAmcuVOcn1wehvKzSdLbU4TwbVG4gtD6TYg
Message-ID: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> from being modified through the MTD partition interface.
>
> The corresponding boot partitions on XSPI0 are already marked
> read-only.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -825,11 +825,13 @@ partitions {
>                         partition@0 {
>                                 label = "bl2-1";
>                                 reg = <0x00000000 0x00060000>;
> +                               read-only;
>                         };
>
>                         partition@60000 {
>                                 label = "fip-1";
>                                 reg = <0x00060000 0x007a0000>;
> +                               read-only;
>                         };
>
>                         partition@800000 {

Makes sense. However, what is the recommended interface to update
the bootloader in these partitions?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
