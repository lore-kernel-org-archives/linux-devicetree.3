Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AFC3C5552
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828600; cv=pass; b=QLYuumMdjo6PVNjvbAXUqkx6cEgayIQLM70+7VjBJhaa7VvVlkzlHThsiem5j+0q8a6rr5u7LY2MXU07EAc9jedhx0fPAkayR1WWT11Z2dL+BzLFjIoKKSkSUM5FMBDSjKnE9dyeCm0XaX/XYhkykxJ8lMmkF1UoC3iXVQuaDYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828600; c=relaxed/simple;
	bh=YgrJwTSrZYeSjVMNLPrgCbByTvZIfgpY1ecwu0mAL8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5FtsIExjwWabTEF3TjvVLyN6dXea7by0/rGL0YIcP3dPfIoitTJfhur1rfEhucMeMmNp5pkzJWYbe2ngRY6aZJw8LGpdXur22YHkC/oQcm53PNBupTXMP/uXYvtNXuMLhi7v6Q3NXiiY/MFyIFn/qpGpcE9ae1Fo2x/SqrH69I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWMmwwrg; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWMmwwrg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so2011626e87.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 06:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775828597; cv=none;
        d=google.com; s=arc-20240605;
        b=ewYZS53io5BXz2zVJBzqnxFOJKg/IPzqyevKs8Xu1mWtI6sYX2dGyfWj5l6ohEu/ZK
         T28Cl+hMMw5w4XlWJbRnzZgDwhPJDVTUM69eJZgjuP94qHC6LSIK+lz06JTtN5H8EVbq
         Js+4g3xPNppCfGKIrzYPhzL4GRLHVuM06cXFHAAbruPA0apiKSVoBEqB2OYUY78sHMfG
         3MB9nuouhGAa1LbmmGyZHtxtA/OLbvDgFnO6/cFxKsSYO1ljyLoIZpKcjsicTaJ9Z0kN
         b3XhRoiZtU+o5WEfceOWgt1YZcCV9j3Wzt7V5wW2sU9dQZ44FunoVme/2PGnhYY5jjxO
         /4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HPAqnqKcw9kNQQIwYNpoVOuQXD5LrODSPZaoiKKIlQY=;
        fh=p7vFu1TVPG0KqICaHNrq0WfwDLuapQKBgUCDMgie0lA=;
        b=f/0c8q8cuniZn1Ho6x25peGgD6TlNpuTpuqKwxpWvnaXzJ4kYweB06DHyt34Zd0HNF
         LQ80N+thGPabmyPX4IZRCEAbxZmRdyoB9oy4BOgYJHGClGYC2SoBwaP6IEsv/lPmEJ82
         EvGjd6UQuvLqs4zDu1Dija9+F7avhIVXqnM7SjaiJDvryUm2ZBz/1s52KgceT8QPoat5
         B6JZORLTGQPTTGmi2UrNEmGDGKMZHDCIa8dYS4AhSkl6E1cS2/fUEin02xtKw9ONtwye
         8CmKJjXFHR7gzYIE0eEwQct3wBJJCoE1qdxaxMd+DDr2vpTsVfpLVQuoJ9pMJ/kvRDw8
         pyig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775828597; x=1776433397; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPAqnqKcw9kNQQIwYNpoVOuQXD5LrODSPZaoiKKIlQY=;
        b=QWMmwwrgIdpLyOpbBKSD4kOefcSEohl0EWuNwH7j1JtVkHbAV5Q5b4ZOH+XPZHaClh
         /eErV4oHQiRLRwFzd3OK26u3qmQbqRB+OUS+NVVOtCmIYLrg0N8SJ2ZqsL2+gWt8gD+w
         03GocGi7QSrhsWwpzN+Zm9LQT5+sPAZ3aUeFNQ94pk/h0VEv3vEepJd9CshxqysoWLMn
         GL2BKGlPpj2IupFySWbtMFa4j+aPpWzKgThxadVBLOlr6NBvlh5n1wYnsjLVBdlcwsnl
         2WoiOCdGysC0T8Gt11A0i4WbZdgu1pCl6/Hmr6gua+oQucMTPe14w7AfRuw4MfvoDMvU
         tnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828597; x=1776433397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPAqnqKcw9kNQQIwYNpoVOuQXD5LrODSPZaoiKKIlQY=;
        b=oasRPkEpG9mNFUITjlcEYJin0NrtSNgg2JMYROMmTiNw45f3YK6kAMvh3oylgnB6Zm
         RnF91ykEZwyfme0JZ9Pf8zS0Yez5R4HZyAztZ1qeJAKsZVZRe27573J9IdqCOcxy0tBm
         thLEoZNM+aDEyx62whVXq5jvWtq/nLbknxLRmU/lQ7Q3WOW/QiZbu7HbsNIZrSmZeaNU
         tl5HT1cQjMVbbmHRjEH/KEECm33Wll0FwEkQNaNLMAxQL+95IOkZe5MDhiLnbfk8mUv2
         nE+4dMjDZWSJnOsM1Jpw4CYs0DdBnb8QnKQzbg3tmW0aTju3216/EYuBz4o2A41F12Ca
         BS7A==
X-Forwarded-Encrypted: i=1; AJvYcCWr6AXbaewpM3H3TN5KV6NKLvD3/Jxifwxzyfww87unU1f1B1dfwW5YCcYZ5Ix7PF6HRN2B988lxNWF@vger.kernel.org
X-Gm-Message-State: AOJu0YyRP0X2/HBXl/Nla6bYSQpjj/ltk97GcMNyamW8fViSu8rASdsp
	MtJ7XMW7ajvA6jlf31wI/j4scohCgIvuAUlEDu7tM06tn77gB/9YxKzAYAF7tPWunDAuRsSA45H
	+HB1PFwzqJvCY0R/Hd4aOSRuPBDwM5RBHTNIwTRz78Q==
X-Gm-Gg: AeBDieso/8ByfI1z4DXWu8vhjH3O4f3+oas0BpM3Tkn6E+TSwcakFxvn5dzML7VR0QB
	syY0anFtSPRsimRDXSLOkJy6Zxz7Yh6rVqx1+ymd59TKVglJHZDdEu1nCFmR9WXRLpnYaXJqvjL
	s6EDraH6QaK+i9R2ZR1k23D4wF77McLled9epy8yiW84e8RENpzri1wXZRDvg8Z4wrrFEIxtWOQ
	dr3EPQm8m8EYk4/k7KU8/Ak9aJTgyX6WHnAkIy84H5jFIvxsh9TNu1ha5IRV58IzLRb8tSgm/eL
	P18K6pts
X-Received: by 2002:a05:6512:108a:b0:5a1:6c86:b957 with SMTP id
 2adb3069b0e04-5a3efb2c5eemr1409309e87.3.1775828596892; Fri, 10 Apr 2026
 06:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXHhd150mpUT5-VPcHW0W5Hs-rFC-Bjrc7Z8Szco9P_Xw@mail.gmail.com> <adZaXSDsv4f9d8Bp@tom-desktop>
In-Reply-To: <adZaXSDsv4f9d8Bp@tom-desktop>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Apr 2026 15:42:40 +0200
X-Gm-Features: AQROBzC3LoOCj70eiud50EVlHZzwLKUFJdS9N5jGny4APxuSZLpM8uhFac0vmsQ
Message-ID: <CAPDyKFpdafESpDDN_EaEQJ-5Kb+rxgzD9FYYCv8-+X4EJDd0=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add missing #mux-state-cells to
 usb2phy-reset nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, tomm.merciai@gmail.com, peda@axentia.se, 
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 15:38, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Hi Geert,
> Thanks for your comments.
>
> On Wed, Apr 08, 2026 at 03:07:44PM +0200, Geert Uytterhoeven wrote:
> > Hi Tommaso,
> >
> > On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells as a
> > > required property. Add it to the USB2 PHY reset nodes in the RZ/V2H and RZ/V2N
> > > device trees to fix dtbs_check warnings.
> > >
> > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > >
> > > Kind Regards,
> > > Tommaso
> > >
> > > Tommaso Merciai (2):
> > >   arm64: dts: renesas: r9a09g057: Add #mux-state-cells to
> > >     usb2{0,1}phyrst
> > >   arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst
> >
> > Does this series supersedes "[PATCH v5 16/22] arm64: dts: renesas:
> > r9a09g056: Add USB2.0 VBUS_SEL mux-controller support"[1] and "[PATCH
> > v5 17/22] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal
> > regulator node"[2]?
>
> Yes, thanks.
>
> From v5 only [0] missing.
> But I think Ulf is planning to pick [0].

I didn't get confirmation from Peter, so I decided to wait.

If there is an rc8 on Monday I can pick it up for v7.1, otherwise
please re-submit when v7.1-rc1 is out.

>
> I will rebase/send RZ/G3E USB2.0 dt patches later.
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/cda933586ef7ca119dbbcef45a921c29dd517698.1775047175.git.tommaso.merciai.xr@bp.renesas.com/
>
>
> Kind Regards,
> Tommaso

Kind regards
Uffe
