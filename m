Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F18384CCA
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460991; cv=pass; b=sWSTlqocNF2gCqM0pvHwBRiyzYoz5M0anVbMvIiMsSqJvd4fap/f9D+MmHk+Zsaz0myWrVu9x71/JOkmFMW2mH9k9xqEIgokxIgDgxeKDTGIjahuLWgpeTvE1XMXIO4IXfqRmyfMvs0FmmX4jGZDY5QYvJBv+T5SiWRzNbKZLBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460991; c=relaxed/simple;
	bh=0NSvH6BCW4nCR1WbPwUdRMwaT7jsjZxOeivFHnV3EdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zpo7L3gB5z7qTe6jwcXA/+vT/SNIMcBPURjkXDz4wvRfTWOU2PdY3IDnHhJVqGyzaE83ALML46PVSgbpFOjlTIW3VBRRGA98PRJajbiR1jThqoGPllj3Jl/LgQxVOhv1GF7vZdRpK/SlfKmaXneKaGR8+ivDNF1L2SkAHalUhH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg/JqgQG; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg/JqgQG"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cdffe8e3eso2219826d6.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788460989; cv=none;
        d=google.com; s=arc-20260327;
        b=n41KmaoMAv6kWL6B2IXY++1DYr0AKlk4EBezCAGNZBGUcoZhDaj2c7Kzcflbwy4kJu
         fDR4a8uI7YAcG7WAUxg/KreZjloUneZ6efjEgVGgBTCD33c44TLJAXcmZUpHP57aG8K8
         tQMu2amCX5XoQHd9IAQSiKakBUN6Eg7yDzuUXHHMakjymvix7n8hfR/rAXfMv+g8H/wA
         v6nQL2vnpWaJkt9UU4X2LvGVekHQMTpZwKdqtZYiLgF795Y9qI/7oIU5yDeeOMaQjI4x
         7J34wubdZlY2YfzcQdJlygRWTPaAxmM+5yU0rUzbcpt2tj8np2p9PlJnuWlnSZzIR0L5
         H6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OzrPp0LDUlFbdGUKdXll1Tt+URbjSi3DsD/mLXpEpkc=;
        fh=FV6u3YvwPLRxuAF/I/ObFIFoaKsexLJO2g5ETfqT/1Y=;
        b=MtzzaBCrO8KNBts616cPV4cLXojlsnVy1V3dlFsnn24o+jhutMrw9i/zDxjGrDSBWh
         4b2qGrJOGxWLGyA9Y6jPsTiZQZO8iBHTz5QL8q0d0aVRXcVPfrFKj4YRMDoy/QtYWCRb
         txXphSOj3121DOtbyRBmGeQ/Nejr5X1T4Vie+racTrkIjNmqtMZmMw/JaMzIhg3If7lu
         UgaODfgml+A090eG5F1+ISMeaVVfCPTK0PcmqQvH9R40KwJnfINjDL8tGP9FJoBrLwrC
         Y9E3tFNLdjjUPbeK4JF82UlZLdMN10wso5ifaye9VLUutWKSTdIfyIMjE0TqwemmMauF
         uyNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788460989; x=1789065789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzrPp0LDUlFbdGUKdXll1Tt+URbjSi3DsD/mLXpEpkc=;
        b=Pg/JqgQGkVItc2/BRxUk3/wjvIK60n8VhgmbH5CDEz8i9I+7J3JrH0kuE44x+/uE0h
         jUyASzV+EA789N7mJe7hqHiLMSTIiT2Hfz2cN0Eh9a566dxrnOHLRBmplnC2otFBxut1
         YnqmDRXDs03q4AlMpPljyBj6Sg6NS72i56g2c2aJaL5kpTnrXZfyjHK35vGLrUYdImAg
         UCjzaMlR6vp80pFvASnBYcffTmvtS0Ajyvk/jmF3nIB8XcTdeTMPEtA4Ubu4q5LwrYn5
         xzjKOCOT15dKJBjuEQxPKufbDWsZ/14/lMSfM4nNT+3Z/Vi8LbEJVk0P1z90gGSnl6Uo
         JG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788460989; x=1789065789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OzrPp0LDUlFbdGUKdXll1Tt+URbjSi3DsD/mLXpEpkc=;
        b=LeUz1ikv+NLqaQC0+Lg+kIZZARiuFeJ9NkeMKkufAQJuZ3tnWMmbXUHGUhMh0o8m6S
         LYKu87ZPYZY0ffOKglnwiPeILzn+GhZqba0QRbfvIivW4AQwbCJJSPSmjplJbkTV2w12
         yGS5nv1sjBS9oFPQyZnLgL0wnyaRLrqgSQv17nPgpK4ZMlOtjQZ2r44pO3gFbQqZzOsc
         j3VbYiToSzhIKxK+GLDqJoCR+/lqoN7rzPenpr1O5PHZ2rKyaPKnnANocCgfAolCs7dB
         JwC/skkDQKBhTF9dZ640G3icmkykXOyHCYJRI7bjRBBnbLrztwnPDElso4ompoxR42vr
         Kllw==
X-Forwarded-Encrypted: i=1; AKwUvBxc7eBPf6vJhxmDjn4aZQUe0H9tm3E/zRl6uiFvw885rRtHzjjMipBpjVnbBpLVINLnt8Jb/2mpaOP1@vger.kernel.org
X-Gm-Message-State: AFuF++nZ2perCJ94NLkj8xBGa5H/VCsp8F9hcqx3/EpkB579VX3dlGQM
	9uUeOoSwKaQuEEOnTY2Pxo7po8aC/J7YVyjJ9jdbNKC0I5kqmbH2xG40YaSrQQuMlh7pbms5BVN
	hPaZ7mTs6YUUpfenuLsYbEEKAF0IXNU/u7MDB
X-Gm-Gg: AYBFou1jyPZX6vu9LlTj5F33dIQTZlsve8W5fU02jJXO4iIyVyD63jf/yXp9ixJEIfd
	Aj5F2wJuYRIA2nma+YVESHj9fVV9mthgUArabs+SFovDbq2i2LrleHAwXPaEM6Xj+JBIgsslWKF
	oG+bEw3XhqPv21LykyJpnUYsbu2DqenNNAeEN8QAy1NiVVimqArRuyIFjLCPlKfg0hMyoVDmAHm
	YhAQ10H/ooC+io4mHDsWToh3icdJtu0y2Q5cMkIo7lfvX9U5lyf4jHTCZiqhsUjKPGYUXpwb6wv
	/Wn0ZCdz/ZOQzQsFcymE9VKBKD9wyP21mKukYLXcg2XTQQQe7BaRKEm0fW1bk4j8Oyr/Zan8qTO
	qkjhUJ41b4rZMJsl2oJtG7QzafoByiCnEkSMR+mfSzXuPSz19A6pW4L45f12yp4hLiAHLWPLUXp
	mtJdHH+hyf0HkeSQMXqO9+q/UuBvRKWpx7D92hQbM=
X-Received: by 2002:a05:6214:6284:10b0:910:cd4:23d with SMTP id
 6a1803df08f44-9103efc9476mr11569596d6.1.1788460989178; Thu, 03 Sep 2026
 11:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802145109.728793-1-pbrobinson@gmail.com> <20260802145109.728793-3-pbrobinson@gmail.com>
 <apl6RddLcPz8Q2-O@apocalypse>
In-Reply-To: <apl6RddLcPz8Q2-O@apocalypse>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 3 Sep 2026 19:42:56 +0100
X-Gm-Features: AcwNN1VRi1a96Gg5w55HlJytQ0F6dgSbhL00dJcOBGvdwm_16-SGGl6OEiE4mpU
Message-ID: <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrea,

> > The thermal sensors on the bcm2712 (rpi5) are the same
> > infrastructure as on the bcm2711 (rpi4) so add those
> > details so we can get thermal monitoring on the device
> > as it can get quite hot.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 32 +++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > index ae1fc9d728c00..c73ed9e066662 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -508,6 +508,18 @@ hdmi1: hdmi@7c706400 {
> >                       ddc = <&ddc1>;
> >                       status = "disabled";
> >               };
> > +
> > +             avs_monitor: avs-monitor@7d542000 {
> > +                     compatible = "brcm,bcm2711-avs-monitor",
> > +                                             "syscon", "simple-mfd";
> > +                     reg = <0x7d542000 0xf00>;
> > +                     status = "okay";
> > +
> > +                     thermal: thermal {
> > +                             compatible = "brcm,bcm2711-thermal";
> > +                             #thermal-sensor-cells = <0>;
> > +                     };
> > +             };
> >       };
> >
> >       axi: axi {
> > @@ -724,4 +736,24 @@ hvs: hvs@107c580000 {
> >               interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
> >               status = "disabled";
> >       };
> > +
> > +     thermal-zones {
> > +             cpu_thermal: cpu-thermal {
> > +                     polling-delay-passive = <1000>;
> > +                     polling-delay = <1000>;
> > +                     coefficients = <(-550) 450000>;
> > +                     thermal-sensors = <&thermal>;
> > +
> > +                     thermal_trips: trips {
> > +                             cpu_crit: cpu-crit {
> > +                                     temperature     = <110000>;
> > +                                     hysteresis      = <0>;
> > +                                     type            = "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling_maps: cooling-maps {
> > +                     };
> > +             };
> > +     };
> >  };
> > --
> > 2.55.0
> >
>
> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?

It should apply cleanly against Florian's next branch here:
https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
