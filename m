Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3775B5592FF
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959780; cv=none; b=gZXD9Of8Aejchn4/YEtt+mVMKFwYYwKjdFiFvSuLIGHopMfRKlbzb/CGYPCbNlkOuXy76VqW/ddCISR6YTAActGiYNFiFz6/xTQthyfUpJy9Ln2+4ssHCLRnN9klsci/VQSb8ssE3MtBJo3hp+OXVvEKUfn9livk3/MYyZPUXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959780; c=relaxed/simple;
	bh=8cHU73DFXtRtPescVxujtpMZQk9MTMfdIvtDQt32qVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpivY7zqHGkTJH86SLfc3Oh0MZ/Oe2i5Q0dlyCJiK2/T4ytrf88rpaomvJBCcRk1PoR/dyJ3GlZlzdhXkcHXbvUnNdeA8wnYcTyFhtROy49/j5iiisvZTNyAu8ZlJ4C+qHwEbCd4XpqbAMVZM6zQ52OkAVLRO4cXIPdBpy6nFHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIvIp0lJ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIvIp0lJ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so1630875ad.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959777; x=1789564577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrcCiK7RtNBCwAredkKzf4aDW0PIdvjt37y7QGKpm58=;
        b=KIvIp0lJi2qm8M6TvwIEtxgwD6NIF3G/XC4rjT+3cRi5ZgKAgy+DLul5kPr+t/Qbmy
         5C40HLZv30CRwTmULmOWNrl9Mm1GhlR6jp/qf/Bx5v7YA74MHiKxripLOloljen3ERJ8
         wX83SEypzwbDR4Rm/TxvyASCrMfaSydfxjkQoLqq65Sm57O/ZKfArWlRRyx9e/1F34z4
         Rp0aNFltcxFdygyreQZ7p2htlgNMHh9ikKKVNrKVekIJd/MiBoSwmTvx3wUge84ak/0u
         dvq5VNgNjLuWRFH+xfhz9PkZApd4KNV8fN+et46uYBxaIhj9D26WT7Qbn225ekuFKenQ
         Vrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959777; x=1789564577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrcCiK7RtNBCwAredkKzf4aDW0PIdvjt37y7QGKpm58=;
        b=tRQOQdNo8QC/bO7hd5ruASSTtbA5dPiL/uwyFVm3R+1I6ZXHfFa29dEGBZqJ+BPH41
         8gqhbD9ZY3PU0CFU1ADyrKDXzWiUhf0Y3Odw1vPsH5/MWZpwA9ZsApZaSylbWzyDaCMH
         uXfKp8CsieKjWLNDeaf/t8hIW0SVsefkPyb4MUnJb+pvXuMTWnlijdZjIwen21aJMxe5
         AIyPf5StRy2D8UeTVJrXQm4VWjM2Zp8Xhn6qgAdtshh0MsT3a+pwd1A9WvNnT8C3ppkM
         WeBT3QGBDLfXE4YU5aBY1mXtgPlMRT9zOkv6usfWA831EgNZY1gLxBQF8Q+Yjs6XwyxU
         m7/g==
X-Forwarded-Encrypted: i=1; AKwUvBx8hQQw/t/q6jUTsg4TCybNdFRrg5yLicNjussuCm1LE0ByFm0jrh9b2l5dtZ37hFeXw2/dIvUlvbc7@vger.kernel.org
X-Gm-Message-State: AFuF++kwR6RZ8ViWxcHHaT4Lb9s3rZ3q1AZrXxnErP8s9j4Dh8eD7wJk
	jBOb14fQClJzrKJMJZkV/hLvkuHtV4/G1sRh9Hew8YzIXJwD1RI3bJZQ
X-Gm-Gg: AYBFou2IPa6mAObXqN/UHUgun8/RsQojd8uVNQ3aKMj524AwiqLoPFlbJWEebRCqDg9
	2qey6garlmsXwkwpPPM8SKJsqw5YTiLyd0lKyTAVuf777WLNwY7ztk0ZmkLyhN1No2k1gqEoOcu
	oHbU0tbtEByr8RKQEgktChYowhIlmbdt8HJfLBIywhGcvaoOaTIjtWU05gD5pPw3hzoxWQvRYq7
	5EcYLwXUVz8se5Ul9nC4bJBHoahZ/yYUDjydi0e8gCHxKmdmM8aOQFd3HDwpV5BUffI4nlhEC7J
	QG2u9ZAg53UBrPGY5C4wiOhFwsIQxuk+G4U5JlrU7hxiJlqIlaxSl+L2xvPb728geK4dAD3r5qq
	A+uc+WcG3VZafunY4UyMi2KEEKiSUM2DmvcZrmNoAkBY+vddRPMnpeVQ9bbBbJtR8TlwgtqajYe
	TsZdCVZPyBiKw3l8OGpO9GGMvk+ti50mozegNEfsfGoUGNSqgUML23I8s226l9hhyuoPIczPabN
	/MXtg==
X-Received: by 2002:a17:903:3c24:b0:2d9:33d4:a910 with SMTP id d9443c01a7336-2dd0780d87cmr17875895ad.4.1788959776857;
        Wed, 09 Sep 2026 06:16:16 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm74730735ad.3.2026.09.09.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:16:16 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:16:10 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <btthxxtvgma657mrvcu5ledxu3fedlf3satbeu6ppn6jb3o6cr@wfffny6ucxck>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>

Hi Udit,

On Sun, Sep 06, 2026 at 10:49:52AM +0530, Kumar, Udit wrote:
> Hi Leonardo
> 
> On 8/3/2026 11:04 PM, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> > 
> > Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> > Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> > Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> > DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> > LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> > touch controller.
> > 
> > Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm64/boot/dts/ti/Makefile               |   5 +
> >  ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
> >  2 files changed, 158 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > index f4d109ef6798a..8a59fc597aede 100644
> > --- a/arch/arm64/boot/dts/ti/Makefile
> > +++ b/arch/arm64/boot/dts/ti/Makefile
> > @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
> > [..]
> > +
> > +	panel-lvds-bridge {
> > +		compatible = "optologic,scx1001511ggc49", "panel-lvds";
> 
> > +		backlight = <&backlight_pwm3>;
> > +		data-mapping = "vesa-24";
> > +		height-mm = <136>;
> > +		width-mm = <217>;
> > +
> > +		panel-timing {
> > +			clock-frequency = <70000000>;
> 
> Looking at
> https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#mc4ed25e5253da6dc635fd3eddc317dac8f447f3e
> 
> 
> you are using three different clock-freq 69500000, 64500000 and
> 70000000 here.
> Could add some comment here, why freq is adjusted.

Just to confirm it, considering my last reply, do I understand correctly
that you want a v2 of this patch that adds this comment? In the end, these
are just values that we found to work consistently with the bridge, and
we're not sure if this comment would add much value.

Kind regards,
Leonardo
