Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8231E857
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231760; cv=none; b=hzqQNm8SizM2HA4IvQpTV54+BB5irPeHdYf9qI0GHT5qJNKERf6vhWODEmKJFk/8cjzOwiKFKEZ3bWHF7T/lGjOQu/wMYNyinUmPxlKZt/5b8m/I0DAQtdSYslJaSO+Sn0ajLJgCRywKbuiDWfab8KmMJTNSdobXwtqOuJMCFH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231760; c=relaxed/simple;
	bh=Xc5j9CDKlFuLtIb9mG1NWd0Wa+Ic7rYDHKf0WsXQawY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osvoJobKfb4F6wbxw0KBWIP+kDk/8D/i1yf276SBrAf7GI3gxu60wcVKYfJHfkFSJnHPBVVRI2OfllzE4GopmMx4VUqfHrqO6voyc7rd4gtoQBkEZX4oZSZsHOAnCAayntDrqMuatQJdNWBuo+1Vlkud3uSZ/tj1ln0gmZ6WB1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7de7dc85b74so1529823a34.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778231757; x=1778836557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=freA64yN3LTk8GeI+Wxty1utrJRjkdarC4+05051tIg=;
        b=Une5enQ+NGGegbP8vCl8MMHlFQ+sBbzmQAupsgib9FHxV+v/6+d24azT218fzn7/AL
         udEtI2FUPe7OmGOsNLUDmReJvwCfeXrGfHEfnbxCDzt/WzCJuvt+QzEVZmGJhTJQcFnz
         qJMsrVaiIMk8Gny5k8IqX8uSZ0y3IIhN6TOUCtKRXdUYCXfcogzestyRhj6vSn/mdPGY
         LTN37CsnUSPUln159/vs5jrJ1W2V6RDu1LsTVXYVYEjjT0xWhDTsCEQYgbDrKQa2iord
         nJNzQlL/aMbpkZiSLHnDI3/sAW60jAlSpA7dmc3f93v///ZZC5f+wxXY63oEyJYP4V/C
         4Auw==
X-Forwarded-Encrypted: i=1; AFNElJ8L1xWionM9wkLJnp90bpCtZTzUJIpLgNi8+aZC8inw1lNDLgh9leCvqS5IlcwJgmxtghk1W68ceh1A@vger.kernel.org
X-Gm-Message-State: AOJu0YyDV9cUfQIRqE3L0tFXb2MS3x+bctCrfYBnx1ZcNXgIDHuOsX6s
	8IWUS7H2K1YSB9lBuvMobpZPVF28Bctb0DFt+pFsWI6GqFwS4Fq2DkVkBU+xA5XR7C8=
X-Gm-Gg: AeBDiesdo4y4xFjZM2l7cyByK5TsuM9pDNxnjqMPPn4ac1AilNUT17PnjeMkVyF5p8Y
	YyKA9/hxuOtdW6zF9uOQvgSoaD7tq845RHcxejzNgRqwRc/cYx6+E9lLaQJvJc05n9xoDqzJJhn
	41GBjuhrOTL7hNwXXsiv37IT4F3GEeUJZk4Ou9WgIziUE52KLphPpQzYVTz728U20KVhgDa82L5
	k3WO9Nx6XyirxvCBdRhwwsSOwbh384gFz0CQg/mJN9wWo5euKwoIQBdUXSdHA+uT93nR79KRg7k
	d62fxuwaq2DNxSvlTxDYRGwvnOda3lv32OYfd99WWREsDZ4TNsJ+6WVz66J7NXBwORZ85NRgszY
	8aGA5zLNdb0JbKew8L3QKr2TBTHQUn+BFaIzPxrbbNxreKTqI3uYTCZueL9y0yXeRi61AqJbneE
	GkagICVTMat0MPWumwWajxKTm4pCeUBjaEpWw/I1aFM/QoxcequFoc49H0UG6QvVSiMfvCRiQ=
X-Received: by 2002:a05:6830:488b:b0:7d9:7201:1ac1 with SMTP id 46e09a7af769-7e1dee918damr7062921a34.3.1778231757492;
        Fri, 08 May 2026 02:15:57 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d5061csm831369a34.15.2026.05.08.02.15.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:15:56 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dca5f64e86so1553675a34.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9kg/H3YuLcxHZVdy9lBr7HpZT9zvJJBPKtBuBgRZEXE9iBsmNOB9rTcYHbGi0x7RvxckiIqMRHKPmd@vger.kernel.org
X-Received: by 2002:a05:6102:854d:20b0:631:2f82:c3ce with SMTP id
 ada2fe7eead31-6312f82cdadmr1563743137.10.1778231440310; Fri, 08 May 2026
 02:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-10-antoine.bouyer@nxp.com> <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
 <96bff2f9-04ef-4272-b408-fefc7d1d5e11@nxp.com>
In-Reply-To: <96bff2f9-04ef-4272-b408-fefc7d1d5e11@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 11:10:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_O-75kxbqEjLKQ1=5OZpvyCkuWo8CBzpvymzj0i2uUA@mail.gmail.com>
X-Gm-Features: AVHnY4LHFQ2cNB28JlB_QeYS4eHTz1eigCbditGi6HUZBbCkr7_rXaltq2vUwkU
Message-ID: <CAMuHMdX_O-75kxbqEjLKQ1=5OZpvyCkuWo8CBzpvymzj0i2uUA@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] media: platform: Add NXP Neoisp Image Signal Processor
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com, 
	peng.fan@nxp.com, frank.li@nxp.com, jacopo.mondi@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michael.riesch@collabora.com, 
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	ai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antoine,

On Thu, 7 May 2026 at 15:48, Antoine Bouyer <antoine.bouyer@nxp.com> wrote:
> Le 06/05/2026 =C3=A0 16:26, Geert Uytterhoeven a =C3=A9crit :
> > On Mon, 13 Apr 2026 at 18:10, Antoine Bouyer <antoine.bouyer@nxp.com> w=
rote:
> >> First NXP neoisp driver version with the following contents:
> >>
> >> This driver was initially inspired from raspberrypi pisp_be driver. It
> >> reuses same approach for ISP job scheduling.
> >>
> >> The Neoisp driver supports:
> >> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
> >> * Monochrome sensors input.
> >> * RGB/YUV, IR and Greyscale output formats.
> >>
> >> The neoisp features are:
> >> * Provides single context to limit amount of v4l2 devices.
> >> * Supports M2M operations.
> >> * Support SDR and HDR modes.
> >> * Supports generic v4l2-isp framework for extensible Parameters and
> >> Statistics buffers.
> >> * Provides a `core_media_register` API to register neoisp's media enti=
ties
> >> into another media graph.
> >> * A module parameter to run in standalone mode with its own media devi=
ce.
> >>
> >> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> >> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> >> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>

> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_MASK GENMASK(23, 16)
> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_SET(x) (((x) & GENMASK=
(7, 0)) << 16)
> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_GET(x) (((x) >> 16) & =
 GENMASK(7, 0))
> >
> > What about just:
> >
> >      #define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)
> >
> > and using the helpers from include/linux/bitfield.h in the driver code?
> >
> >      FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, val)
> >      FIELD_GET(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, reg)
>
> That file was auto generated, so I did not want to change it.

Oh, the pleasure of auto-generated files ;-)
Perhaps you can fix the generator?

Here you have 3 definitions per field, which is worse than the
auto-generated AMD header files, which have only two (MASK + SHIFT), and
have been dominating the changed-lines-of-code statistics recently...

> But I agree, these macro would help to save a couple of lines, and
> probably ease readability too. I need to double check the impact, making
> sure there is no regression with such update.

You can compare the generated assembler code, it should be more or
less the same before/after.

> Could that wait for a v3 ? as I was about to send a v2 with other
> changes first.

Sure, thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
