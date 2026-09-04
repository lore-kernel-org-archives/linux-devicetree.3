Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770654052A5
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520559; cv=none; b=qJmxbFbPPosPwekNP7JJMxWmU2uP5ciWeiQTh6h1hm2utpUp6jZBCGUqZ/+Ed3EYtkhagnlsjLf6C7nOW3zJLD1eJE/2zgD/efKuwUEL4HMrX1f0rTUnK7OSDIWRAToXt7m1o8UGmu/0SyWKl+IafLJ/5SWNXR/j1Ug3XlrWNUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520559; c=relaxed/simple;
	bh=d6jCA5GVTc0ThXif/CzYvuE2cp2VD9so0DaT8N77OTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ylb5H/DbUtE2N0DX/l96m791Cr/+yo1Fux7n5QtllYgn96qJjIUbFw9gZu7+JvNBordTNolu6E6rLk+dw8DvT10wWO4GT+6gjSlP3nJwc6zytE2UODR5eIAAvHkdQYPkBn7ktqB9BeZorWxdeA3ym0+s5FvMbt5qN3ROBuQAFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so833109e0c.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520555; x=1789125355;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFRwu393qYqOsEzkDFwmTOKtASNW/fykD0KYaVUIBVo=;
        b=h3GIR5sOs8UYPnyitkZCyNR3u1hrnROW0Q9WmqIGGUcl1dZxJ2IjroqGruFpL1oQlI
         g8orAxECKxtJ05tXDffBqgRpQoz4qg8Vmd3l8sQrHUIT51fSrkIQ4ZuvkSLp1qyiEnk2
         QVDI79gNyQRgMlGxC7TI74hoWTV4RoLWI6jaPhV64wIBr8zzrb0JdBNJl9KY1eOWOY3d
         wUiDrdG1jWtQxomZ/ib5gxCJcSfptbaaeTItIEAkF3RRr5Dx2WdAUNqSlLlQQjXtFP48
         luQp9l0foiC40kuQLufAdBiypEYLsdmOtTkaoMSG862HVhv7P6uEoB2w5LSugv2Y3o7+
         T+1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxFAQUYExhKDaX0fhJ2Ag8XpXydESCR2s8e7Ai13+m+cd1a/XgcyaCW4AfPjugLuNdq1nrXTZ5RwVFT@vger.kernel.org
X-Gm-Message-State: AFuF++ljfh0QflovW8Z3F9pGyYeBNIHOHroMQs+nlDh4D1BLelify9Gj
	Pa1caG9IonZMWOtM3qa/07yQId5lBlhTazzY+Lbvauls62LrmIO2A120DcND6VDzFno=
X-Gm-Gg: AYBFou1oYizBr2yOUFEiMX2/n6V9EvaDc7s89MU2b3mTSQ4VJ1rRV2cUEglOTaKm20U
	xr0O/JhBC+J0HOPUKs+pS0Tq7j3Fl7R2tM8xMHiFuGHKaixhaxIopi6sgEx1JUAuvMsaOv4Z4BD
	i7Q/5ubOfSF8jW60OcInGpx+3vwUuMJiHwomNd4l0Gx5Js/ZL6XGE0TstHCjMgxQaymxFm1/ROD
	uo3eBk2SZnNTEV62sXPqJYB/mB8jvrIEaigDe99HG1scl8qeqDAp5tuCAo7/kPR7tAs4LKgZy+n
	smyR7PZXJTb4ROysfBC2Aztk0nM5XWjHE/luZjvc61As9LKSOUcuoI9M3/i0X/mH7vZWspldNUE
	MEZtq0Co/+RJrbVPR5AGgwIeDq7RIQpcxlX4qtleCmVOi+Mhj2Z6P6z7sHfRWpzl7CnXuFS3NUI
	TFRWgtfW5xy6dzt5yQkgdB/V819aAcVCmJ7Kj8xGIt7krAmhDkwVr6tR0eLyLNzu2s5+fKvdBoR
	dDnzeEH4fAxZbHeNdHZurRauA==
X-Received: by 2002:a05:6122:e267:b0:5c6:7f44:b001 with SMTP id 71dfb90a1353d-5c7ed33606amr2575630e0c.0.1788520555280;
        Fri, 04 Sep 2026 04:15:55 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ebf559cbsm1876951e0c.0.2026.09.04.04.15.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:15:55 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-74ab99038afso612020137.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 04:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSR1+mxYsrYJUCSewq4XaXDLMh9VRmhwFslOjvkIONlUmPRnLlpaHFYA5c6r6S2XgAR5xuLXau50dL@vger.kernel.org
X-Received: by 2002:a05:6102:3f51:b0:785:b85f:2aa with SMTP id
 ada2fe7eead31-78a4a648a46mr1803410137.2.1788520554747; Fri, 04 Sep 2026
 04:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org> <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:15:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
X-Gm-Features: AcwNN1WMlLVxDyFWD65pnl1NyThp-Tpg9HdlxV40HKkGt6SB_vBjbsP-zmpppFo
Message-ID: <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 4 Jul 2026 at 17:15, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
> Add support for R-Car X5H, which has slightly different GPIO block
> register layout compared to previous generations. Introduce offset
> remap function which performs 1:1 remap for R-Car Gen1..4 and a bit
> more complex remap for R-Car Gen5.
>
> The GPIO block register offsets on R-Car Gen5 changed and the change
> can be divided into five groups, registers which remained at the
> same offset, INDT register shifted by +0x10, OUTDTSEL register
> shifted by -0x34, INEN register shifted by -0x38 and the rest of
> the registers used by the driver shifted by +0x70 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c

> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
>
>  #define RCAR_MAX_GPIO_PER_BANK         32
>
> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)

IMO passing a pointer to offs complicates the code.  Perhaps pass offs
by value, and return the adjusted offset or a negative error code?

> +{
> +       /* R-Car Gen4 and older do not need any offset remap. */
> +       if (!p->info.has_layout_gen5)
> +               return 0;
> +
> +       /*
> +        * R-Car Gen5 register layout is slightly different and the offsets
> +        * that have to be added to or subtracted from each register offset
> +        * can be divided into five groups, listed below.
> +        */
> +       switch (*offs) {
> +       case IOINTSEL...OUTDT:
> +               return 0;
> +       case INDT:
> +               *offs += 0x10;
> +               return 0;
> +       case INTDT...EDGLEVEL:
> +               fallthrough;
> +       case BOTHEDGE:
> +               *offs += 0x70;
> +               return 0;
> +       case OUTDTSEL:
> +               *offs -= 0x34;
> +               return 0;
> +       case INEN:
> +               *offs -= 0x38;
> +               return 0;
> +       default:
> +               /*
> +                * This here must never be reached, if this is reached, that
> +                * means there is a catastrophic failure in the driver. Skip
> +                * any IO read/write to prevent further damage.
> +                */
> +               WARN_ON(1);

A build-time failure would be better.  I tried BUILD_BUG() instead,
but unfortunately gcc is not smart enough to notice this case is
never reached.  __always_inline doesn't seem to help either.

> +               return -EINVAL;
> +       }
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
