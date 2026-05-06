Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8CE480DE2
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077601; cv=none; b=p6aP/vHcQUfAEgIJe7zc2DkaNXXf4Qx8VMZUPoLSkmsXalu9PgvzsXNXYH+ensMS1dZi01FYsj8ee7xv5bfnT0GdTm4ojstyUb9wm2lne0r1gcLwNdLwkfbWwrFtGeRGkVRCkCbCgBSGFLR8ksj0b23fo8UTLwe2vO8xFpmuGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077601; c=relaxed/simple;
	bh=YJHhuXmcmAbbsrOx/1EkRrG2CsYJcpBD2mAbpq2+4uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfgNXRF2Hg4maGk+NLgHEn1mL3VKyZjow6uyovFUMwqmVgBNVHXy1M46rnj32MPbKknQxS+tM8jcZK1e+/KcyO9vMk1ap0iuLXr29CfNwVJSft2fPcRNVuLrQv7VEbE+TfAKgqX63I9bF5qODdFdLIdVi38JyOnNIgrgTP6wIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba60d78aff3so927547166b.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077596; x=1778682396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGwBD/Xye3jm815Ej5TC/rh/kNzvD/6gf/0ous2Pk1s=;
        b=VZ5JhNbr/THajKgGUW77hRAbyhYhVaZMTbum/dJAbqJ5emaUzoOAo9Z9+csnjvUy3r
         KPw9gONW85NPdoEdnZ6HgpKLvlujngc6o+nSSj9C7LqmVJdQt0hU68jm8NY10XM4Ox+M
         jBAW0CR4XL8PHgUd/9gHPEBPpCM0RH20SpPM5R2Qy6EnTrXxCvUqfWMLugKq4RWLGGQ7
         jlQJtN2nY1ZrkZMHqYgn18+JMJQALwjh0YcnUZteXAILDGaCO+SULSWmWbdZWzx2qnlc
         7BOJBcM9lrnTCeIt1K+CeNYVu7GUwV54sSTwWf8Itq5cLo+5IRJwvJLh+Jx9VSHj5rbM
         UOnw==
X-Forwarded-Encrypted: i=1; AFNElJ/H9UWqqMOJ9nikDmB3ou3HSDAMaOgJYtXPMLJJjw3syT7LNzSJlR0d0/Sh7FY2+UA5wmkMuREZr7hV@vger.kernel.org
X-Gm-Message-State: AOJu0YwzLiIHgek6ovIOpF8Au/1ltKTDCimY0qKb0UBrLf21UlubsfKy
	LVrrAcK5f+TuU4FMLsCtlTgo+nl/om4qlhmSkd5Zavf744U2i1yRj6D4jkfOo8blg7g=
X-Gm-Gg: AeBDievCyucZ18DkBwLICx77m4KE3sN5q5VwtTqBwyol3YNUC3ZYA+ejF9xaTjgsL47
	Nf1R2SDIJvNo7+BLVKVrkUP9VSbrEj/J4ggAn7DZPUXrGamW0b9eUZ+ZHGIoU8Saniay48PgJg9
	ng/E6vbeoFDqsIRO1R8vpEnyA8QIpSP0qSDOHTYhF2HItqzYnHpF6JPf0YKXPLs2RprS6Sz3Z8k
	1cf8i9a4jYba+3EqEf/wANJqmt7UQgKZM2UBXm3dHinc3UeaLQTdaN4m0AlMyamC3Ce10/Q7CK3
	o4F+r1oOUTwfs24L/eXVD3EctJyi68Sl/j4W9B882HAeCihbPFHpmj6xaaeBQJwBdR0a44d3u3x
	Sr4rGqCwUpSwSMBjPZQj1c1wPH1wUQ+/Lg669Qf+fDbzluwqY7lvvsD37QNmqqacBsfy1iXr8NM
	VYXKD5+YQnOyvNTETIhPSQLTueiLhxUcQpGb9ztm5f6uNJOUl3M9Vs0N/D5KZcu4Iqnv7j3xA=
X-Received: by 2002:a17:907:3d0c:b0:ba5:3e3a:81ee with SMTP id a640c23a62f3a-bc56d90f514mr198669366b.39.1778077595839;
        Wed, 06 May 2026 07:26:35 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55f214a5bsm90505666b.54.2026.05.06.07.26.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:26:34 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so7798437a12.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Puq8ojzd6rLp1Uv9XaVntGZdrXqJcu/2XSf9vlkmz4I1aZ5hYm5SyKMSZOa+qsrELejc6+HyvkoM9@vger.kernel.org
X-Received: by 2002:a05:6402:1f46:b0:67d:1e9b:990d with SMTP id
 4fb4d7f45d1cf-67d642bc4b7mr1875234a12.16.1778077594610; Wed, 06 May 2026
 07:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com> <20260413160331.2611829-10-antoine.bouyer@nxp.com>
In-Reply-To: <20260413160331.2611829-10-antoine.bouyer@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 16:26:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
X-Gm-Features: AVHnY4Jz5uRp9a-KMKa4ktgjK5kRGGM5ufVLGN1Ppw7eSDSfOOOzlRIBWUnB9YY
Message-ID: <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
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

Hi Antoine,

On Mon, 13 Apr 2026 at 18:10, Antoine Bouyer <antoine.bouyer@nxp.com> wrote:
> First NXP neoisp driver version with the following contents:
>
> This driver was initially inspired from raspberrypi pisp_be driver. It
> reuses same approach for ISP job scheduling.
>
> The Neoisp driver supports:
> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
> * Monochrome sensors input.
> * RGB/YUV, IR and Greyscale output formats.
>
> The neoisp features are:
> * Provides single context to limit amount of v4l2 devices.
> * Supports M2M operations.
> * Support SDR and HDR modes.
> * Supports generic v4l2-isp framework for extensible Parameters and
> Statistics buffers.
> * Provides a `core_media_register` API to register neoisp's media entities
> into another media graph.
> * A module parameter to run in standalone mode with its own media device.
>
> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_NXP_NEOISP
> +       tristate "NXP NEOISP v4l2 hardware driver"
> +       depends on VIDEO_DEV

depends on ARCH_MXC || COMPILE_TEST

> +       select MEDIA_CONTROLLER
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_ISP
> +       help
> +         Enable this to support the NXP NEO Image Signal Processing (ISP)
> +         module present in various NXP SoCs. This module offers multiple
> +         functions for processing RAW images and generating RGB or YUV images.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called neoisp.


> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_MASK GENMASK(23, 16)
> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_SET(x) (((x) & GENMASK(7, 0)) << 16)
> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_GET(x) (((x) >> 16) &  GENMASK(7, 0))

What about just:

    #define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)

and using the helpers from include/linux/bitfield.h in the driver code?

    FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, val)
    FIELD_GET(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, reg)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
