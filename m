Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D2372ED3
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156536; cv=none; b=m8DOVPmJBM4Q9/eOe+IT1Zy+KFMSBfGt0Tnj1xMEs3xuh1XiwSdbz4KK6NYnNvwAWnc5iwfgauHoBS6cDKuIrMWovqnuO3F40Pj4xbME15VOQz7axRkPW0ivHqTI0KC+Y6zA1BNiQitS0oQzACp0iF1hQICHO9rC/PriIcdh5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156536; c=relaxed/simple;
	bh=BujUuQDfVekCTjQYxnZ274Y/mBqoA8yucwSuWPHk9zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXGo1TnQEKCk8HO7/tIHg8GCKSAFWBjKG4ccvTPkSaZE0p2DHULqHvfRY0SSjmbdfb1OkXRRSviU8fZ91a43U4eUfxL2usdqJ8J/Ylm1d4Tze5X17/upkHGIwfDfZBwLzYWhUhbHvSgCtUU21lJvcN5gi8OiiHu6LPGpPboIyyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso658546e0c.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156534; x=1790761334;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ki/L6uAzwSlL4d976xkfrPadyRlvh6KDNvRFETqhN1o=;
        b=Wlz5bYYxzGxaGZ5Mvyd8aZaq66GG/FRx0wuioroA808uxseE+8PrpcVvBICH4P48cs
         VxeFszAzqBZ/FUi0/OsUZBxdjhsK9g76cqhZQier9lCVzqdemlfsgBuXH23l9d/A5Rpd
         wtgQK2D4SaAWLdN/9WWnQMy4Q0xGAEV2TBtuxy2MAADZlJjwLdq9Q2U3WIKc82BUbA1l
         BdWF6j8vgKWklyZja5teJ8UrYx+j2Ys3LZY82bBpddlHdSa06nLGdKKJkmyCTZLOGUKo
         ONCA22wlQ8E9Ez7eD+6KD4cuassKNLBouvU6BLzQ/VsO86Vjd60Fp+tvv6m8MN62RtI/
         ZANA==
X-Forwarded-Encrypted: i=1; AKwUvByVyfoeC2cTwIkfP02IrjFMcu7mZXToHuXu3eR0O1QyAbvcm53ZnaIumhrE0gSIojAmer92cheNmSOn@vger.kernel.org
X-Gm-Message-State: AFuF++nxxCGn+sFP+AIAWEClo8sykdzAIEppHlotfNwxzYaHEm47fstV
	gBjPc0XbgFdQiFyHwzAy2BwLq/T4RWE9QJncmxnoevN5NHHih+EdphQaPYJ7pzPgZYQ=
X-Gm-Gg: AYBFou0ck3ehI9kWvQD71igJlxjW/NgRQYdIhp49bv5c/EXySvRVgGRymdlRlskBepA
	W6ty1EtHnKryvIWzyMvfc9h+0B8koHayyElOygwwBiDE+5cGh/D4trtPlHNXnxi4C0mjG3dnogz
	sOfp8NUmiJQsSXMSFN/5o/5aZdHlNH322r3331CnGOaVgIlFqTisc+mCDReM26CMKUVWiKpXCV8
	aem963hQ4qlTXen42tdcOQLCGQF5rhdjZkbtYfpPX58RoN2JvZy9Qk0c+O7QseA5d2IU6w/v9LN
	HmZQAghkFTzRFwq9EFd9Hck3Xop8BrcTmBdhUJBXFK5BK7cymiBPB7kqxYfLbcfE8l93aY1se23
	rVcX2j3THMdjDJR91gKoG+9LROoqS6/Ia7TPy39SUNgPFrC1ZCPrbXbLkY1Hrd7BZJS3M6sDVd9
	bzXOUD7yI6UWPzLAyi6gStlq/aebZcJV75MCMb51vIncqYP+3d5xb7efDko7rkDN7U97sJZTh2j
	qelBw61A2MK/VwL9yl4pbJfxWUsQbahzXLO3A==
X-Received: by 2002:a05:6122:5018:b0:5c9:a60b:e5a1 with SMTP id 71dfb90a1353d-5c9f1659116mr2084855e0c.12.1790156533730;
        Wed, 23 Sep 2026 02:42:13 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm2612722e0c.18.2026.09.23.02.42.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:42:13 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so385425241.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvSJTmrOidvNRE0pfaS593yycACtviZO0ycbnDVK3srJrAA2BTjSTc9iqGs/3qcZuCqCZmjdAFxzNN@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:7a5:2427:ecc1 with SMTP id
 ada2fe7eead31-7ac1c998ff2mr1923273137.19.1790156533341; Wed, 23 Sep 2026
 02:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:42:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjaTJfe7P3+w7P40K0evj4SvdKtTS-QLqK7Rhd8c=3-A@mail.gmail.com>
X-Gm-Features: AclHuK9FXFIal8yiY-Qs9cVDiOssigpeQqL3VZL-ls6OCUB1RtSj6-ENt-hknTI
Message-ID: <CAMuHMdXjaTJfe7P3+w7P40K0evj4SvdKtTS-QLqK7Rhd8c=3-A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
> and 1x channel with host interface.
>
> Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
> in R9A09G047 SoC DTSI.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
>                         status = "disabled";
>                 };
>
> +               ohci0: usb@15800000 {

Moving up to preserve sort order while queuing in renesas-devel
for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
