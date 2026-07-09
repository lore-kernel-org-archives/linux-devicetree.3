Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918440D573
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592124; cv=none; b=k0abc3bEvZ1Ex5QCM7PbRTtiwsgHiQLMjIHI+rNgtDDfiBZHZljLrsdfaQVlgfK/fImmmQnLwSrxgNVdzIxUQOHBIvrDHJ1btpBFfvazsWg3/pGFgcZC7if3i6Zl3RZw9ZwV0N9iXaCglTa5vfP1F3f7eIcqRAnrMV27VBm7S8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592124; c=relaxed/simple;
	bh=+PFCG0w/MsJHNIa+KwCQFagbnO1XKLpWiSxrbAq4u0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aE4EnWMXChK76s8Ps/B9IZA5Ko8qxbx5JbDod6/OtXwwgVefE7+fLUT92H0aLeRE/JGPmZrt4LM5TcayMs+9f+6QXmFAGwMPVLUnk3XJxyEzOhbywPFyuLEHyMZIsHKIqPz1gRnUij2SGLQUQC+x82FLGU3MxlBZrATLQGt8xmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-73770fd1b65so463198137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592119; x=1784196919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=29Wr7PF0zfw9GDJijqoW4TX16ag4mbudBnzJuOzFV2o=;
        b=LIKS8CIuJUxZ3WEHsSXk3XA2JIJQf/FUVPUQDxFwyP1Edh/VsyOzfV0hElVaixk8iI
         8FnuIVO2rdDoF6ahtiUhOIC4onPVh+QL+2eL6Iont07LGaDHUtA5T0rtm2eks+arlR1r
         wWk48aCBN2AmIvz+gd1tOwpKnuADcpgM8gshhH3EcpkA/5z9R8Bdg1O2dliykNtLl7nR
         CAQZyH5c+HUHOmoOuhPjj/K4AxYjw1vnxkOqdxj29jx7Se5mmGTWEi2W2gESqz+LswAe
         ukkP86WHDu5nkVEWixWoTfLBQ7XusgBkh6p9L8pV6URppSwIdqXTNBeCe9YBmqBN0BrB
         5Z6g==
X-Forwarded-Encrypted: i=1; AHgh+Rpv1dpMA2VFlSJB467trX0+HToTy4GSiJij7ellhd6nKQ6pijTCH4XPsZHI/PksH0hM8Xwc+xOBQG3f@vger.kernel.org
X-Gm-Message-State: AOJu0YwU6CWuGPjiplb0Gmjqfetp09g96ClSYrdo/e6lq4lGsV4HLU2P
	ZgJcFtzCyb6hK0WeQz2Yb9rq1Ak3qcB8ErVwVdKGWi7vz0phPx+6LlYW5SrA4CNClv0=
X-Gm-Gg: AfdE7ckKUjcNEVSIzMfJWQkgbmb+Q8pjUdMqVZJpGvch9m7Ost6T/XYQAfe2rmJWLwm
	zamaNktr3gHX2qNWog18iyhgbM8Ukp46fYVKjTkxUk8XyTS+PzbiQ/c5rhXb674QH8tIY1STVYp
	uOoBGabBPeJ+cPJU43fhmQJ0fj64q7Z381NIiiG1iAVQPZlFVEB3c0dqN4TAw1PJk99KpnQVwgG
	tKZhjjIDP6AkOvuUX9GDd5Y2FV42jt5LbT4Q4+sRsgw9xqT1y633ETc0HRsJPMPjKBcADFZMmqq
	6j0KZK4rQ9SFhW6/6RGE5gVeYGXAXgpqic4OixwH+5Nx9sGbKu0HizLkc0S5bwz7/jIRKOwXUgD
	Cylou2aOVIM14AqKMI1dxZhwhjB1HKAY6uT8aaop5G2iXSa3MfCWQKahsa510InEXyPcpkQ7VF7
	xQIlXRkyMylgxgAL3/Dx0WqRA2oEMFo4aYYyweOM/t/00kna/SbxkWGg==
X-Received: by 2002:a05:6102:644e:b0:738:ecd7:1984 with SMTP id ada2fe7eead31-744dff0ad01mr3542287137.3.1783592119400;
        Thu, 09 Jul 2026 03:15:19 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3e6a1sm3211312137.1.2026.07.09.03.15.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:15:18 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf95ade656so124249e0c.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:15:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpXxKa7Ocl08jRAytO5CmWwOGhxmo0fs/taO8mzzKbuJl/VBQ8J/WqmxyfRNDnEqBROVis9pVY08mJ9@vger.kernel.org
X-Received: by 2002:a05:6122:4fa2:b0:5bf:6d56:85e5 with SMTP id
 71dfb90a1353d-5bf75e9a99amr3435653e0c.12.1783592116295; Thu, 09 Jul 2026
 03:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
 <20260708104726.052F21F00A3A@smtp.kernel.org>
In-Reply-To: <20260708104726.052F21F00A3A@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:15:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUwsGfZ8QX+qDTTWE7r29qrM7+uRU9Ur0uNL28ONkACQ@mail.gmail.com>
X-Gm-Features: AUfX_mxmVKl5oIraABhC5nL6N7ouZpLugoAmbQe59QVRHQ1H670N0ohp9eewiP0
Message-ID: <CAMuHMdUUwsGfZ8QX+qDTTWE7r29qrM7+uRU9Ur0uNL28ONkACQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Wed, 8 Jul 2026 at 12:47, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Hardware mapping mismatch between MDLC driver and DT causes probe failure for hscif0.
> --
>
> --- Patch [6]: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes ---
> commit f3c8aa0f294cd575595329194a9adf5e14b5f350
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> arm64: dts: renesas: r8a78000: Add MDLC nodes
>
> This patch adds device nodes for the Module Control (MDLC) blocks on the
> R-Car X5H (R8A78000) SoC. It also links all (H)SCIF serial ports to an MDLC
> for power domains and resets to complete their hardware description.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> > index e22e307ce31fb..6ca1b1e95aef2 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> [ ... ]
> > @@ -886,6 +895,8 @@ hscif0: serial@c0710000 {

You are hallucinating, as this line is not present in my patch.

> >                                <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
> >                                <&scif_clk>;
> >                       clock-names = "fck", "brg_int", "scif_clk";
> > +                     power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x41>;
>
> [Severity: Medium]
> Is this the correct ID for hscif0?
>
> The r8a78000-mdlc driver introduced earlier in this series restricts power
> domain attachment to module IDs in its allowlist.
>
> The driver specifically defines ID 0x54 as HSCIF0.
>
> Since 0x41 is not mapped to hscif0 in the driver's allowlist, will
> r8a78000_mdlc_attach_dev() return -ENOENT and permanently prevent hscif0 from
> successfully probing?
>
> > +                     resets = <&mdlc_perw 0x41>;
> >                       status = "disabled";
> >               };
> [ ... ]
> > @@ -922,6 +937,8 @@ hscif3: serial@c071c000 {
> >                                <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
> >                                <&scif_clk>;
> >                       clock-names = "fck", "brg_int", "scif_clk";
> > +                     power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x54>;

You are hallucinating, as this line is not added in this hunk.

>
> [Severity: Medium]
> Will this conflict with the MDLC driver?
>
> The driver explicitly maps ID 0x54 to HSCIF0, but here it is being assigned to
> hscif3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
