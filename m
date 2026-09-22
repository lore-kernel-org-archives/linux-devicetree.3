Received: from mail-ua2-f14.google.com (mail-ua2-f14.google.com [74.125.226.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DFF5187E1
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083926; cv=none; b=tmj3LgHn9Lwd5+3JsgGmHOA9U5Lr4A3PYSFgBjFu2do1nIwDiG50B/8mqzH6MiQ5FYYVHxGJU1SYH42zqsuvXFojzQ5kn4quoKYFWt+BPg2VWaZgKITOvA7p3E82eMeUW3LqxMi6U3WNo+oXIXlJ+nhF9Uc6SwEzzh7E0NntHtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083926; c=relaxed/simple;
	bh=iS6Sbq7phRSuvgshKwGXzSbujQVRKwmv/HJLCWh9o6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTT7tgCRPPQYdHhxH1zr8hx2CxQaA9lICYaUN8KTmou/auRkEweAyk8lkpixUgOjouWmI6ulbKYKGq5DP2mZ4boPidQC6YZcaAtYH+ATD7vwDZlouAL7nKHsUQhzEruhtHCX7iR2Ze1RUz3QL/8w3mU7/rXK+MMJXtfiAUI2DtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f14.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso1127745241.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083923; x=1790688723;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R4LKdQGgXfe+lTIR3Je35jxvfwNB9zyWtKPq1NgyaMA=;
        b=DHiXtExEUiIyQiruBKbEQVXp3jZ5d/F6TuyB+P6DxmrHoSVAKX8ZccBzS4+P/kHiPO
         vnnrQE0BLnSyO5mdynVKRHZqNoZO0TF5uNVBi0Rop4ggKvvYbZQ23QC3AwANMPMkfPD9
         EbrZ8PDdYbRTslb0IQjwSUQU6Jwj7LiOMLn70uE195G5xzqpGhC/XOHy/FfNhBC9pCQA
         3bKQOVEZ/55//hAArzG0DteMLYVAxMRwhF3o/PtaXCWLS3FFEuEQ6jyzGvm+voiCYVpj
         h6nlJFB8gyLijH4F00zW3zwPQead3gQtypcH3oVmKXDeO/USyNiu5ii8DXk09z3tBCtD
         /9PQ==
X-Forwarded-Encrypted: i=1; AKwUvByyh8WJd9e3bfeSlGF0AtBYhEvXf0hlofZgyQVjBww92k7fDbj58MSAT/ymxGUGIcmLwnQPmixEHnQd@vger.kernel.org
X-Gm-Message-State: AFuF++nf/VpN5q4p8jGf0ZkinLEWaU/QNyzu9kM81p5qYfoW4FpoOHDu
	GCo57ZPd2+GllfhqTTzy5C3/9r1i0gnteoTE1f2eZTj224d6J9A5BUoQFQoTLF+2
X-Gm-Gg: AYBFou3Rx4WLXy74RRPYiWfErcauxA4SucRANkGTzjqFPeOtBQhCfWTTNhxRv6lbCh9
	8FSK9miL97QJEpYYrnZcfP8bJmA/MtQs9RjSMEvBQ5uI6pTGDQubTQF5mMripRuih5uSadHodnN
	u8ewZHEFxG41ikztnxFvDtmxLom+oPte0pIaGzolfPUANNda26Ncrs+GdVbQu7BU6Gje2YZd1es
	t2FhEbh3iMabVeeMrmSnOfEkmsMOsCuxqWmDOlGGNmx8J4v1rnE2Li+rHw/95wuuPFQPMENSQBJ
	z1PJ1tNScTpFVS+YWzYri2KahtKY4sOYT50fDnMFTKqWIrJlToQdeoXWcIKGaLe999OfY5Ae4JE
	WUXDw4VSgXm8Skv2aeN4y25NFCq8jWuutclWpQEllWx9C8CrscDJY/FSDp1r09nKzu3JqeHDiAP
	NA4pEVm30RC1KErdmJ+T/ZG0+A76i4ttxhghH1SC6rUTs+t5QxjbPM/vzXzKHtKSI8C9GcnGFOY
	56ViM9UJDoaRAP2KhB1FZuAxaZkFahyiu4ouw==
X-Received: by 2002:a05:6123:12f:b0:5c7:ab80:2922 with SMTP id 71dfb90a1353d-5c9b591f65cmr7737126e0c.6.1790083923317;
        Tue, 22 Sep 2026 06:32:03 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9e7d5309asm1524093e0c.14.2026.09.22.06.32.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:32:02 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-980b6159d30so980206241.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:32:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdqbFXWXCb31S3czXh8w1qWGmvCS31omgNO8fzxP8eFeqnYm2+Fa+NiZa9FoeTUXykFep8Cd+JS99c@vger.kernel.org
X-Received: by 2002:a05:6122:3a11:b0:5c0:fb8d:9993 with SMTP id
 71dfb90a1353d-5c9b57c2f3bmr7657142e0c.0.1790083922259; Tue, 22 Sep 2026
 06:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
 <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
 <20260921223719.AC3461F000FF@smtp.kernel.org>
In-Reply-To: <20260921223719.AC3461F000FF@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 15:31:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMyiAOoM0+yPcLSDfCK0Tmc0BPuFMRWtx6WksD-hOWzg@mail.gmail.com>
X-Gm-Features: AclHuK8wr23u5s6F_LimoHdaP0JgwEMD9d1LVjGabmZG0qWBewBESA1wm5F7tIc
Message-ID: <CAMuHMdWMyiAOoM0+yPcLSDfCK0Tmc0BPuFMRWtx6WksD-hOWzg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
To: sashiko-reviews@lists.linux.dev
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, wsa+renesas@sang-engineering.com, 
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Tue, 22 Sept 2026 at 00:47, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dts: nodes not sorted by unit address
> --
>
> commit db8934356239e961e6360c8c46e87d977245ad6d
> Author: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> arm64: dts: renesas: r9a09g047: Add USB2.0 support
>
> The Renesas RZ/G3E (R9A09G047) SoC supports one channel with OTG/DRD and one
> channel with host interface. This commit adds the EHCI, OHCI, USB2.0 PHY,
> and reset control nodes for USB2.0 channels in the R9A09G047 SoC DTSI.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> > index 72120e2abf8b4..56ceedfb8ae88 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> > @@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
> >                       status = "disabled";
> >               };
> >
> > +             ohci0: usb@15800000 {
>
> [Severity: Low]
> This isn't a bug, but should the newly added nodes be sorted by unit address?
> The ohci0 node at address 15800000 is being placed after the existing usb3_phy
> node at 15870000.

Yes, that is indeed the wrong location.

>
> > +                     compatible = "generic-ohci";
> > +                     reg = <0 0x15800000 0 0x100>;
>
> [ ... ]
>
> > +             ohci1: usb@15810000 {
> > +                     compatible = "generic-ohci";
> > +                     reg = <0 0x15810000 0 0x100>;
>
> [ ... ]
>
> > +                     power-domains = <&cpg>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ehci0: usb@15800100 {
>
> [Severity: Low]
> Similarly, should ehci0 at address 15800100 be placed before ohci1 at 15810000
> to maintain unit address sorting among the newly added nodes?

No. Nodes should be sorted by unit address, but nodes of the same type
should be grouped together.

>
> > +                     compatible = "generic-ehci";
> > +                     reg = <0 0x15800100 0 0x100>;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
