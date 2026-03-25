Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635523C4E9
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445544; cv=none; b=FYVt8jWLQ/Ezzd1fzly5DqNaqthavgPi7UBEu1k388lQrjIPNqxADUXVNmEdY3eUP+Cv++8DYDXJup9fKmNxWbeorElZVidb4sFQPVaumTyPBkd/DbwNE11pgMIy8jrn6DL9/Yjf/ddsoZkbSEMFAERaUgm272njFbb867Riftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445544; c=relaxed/simple;
	bh=rkpIXgDQz1UgC1XYYX1tm6OOg5kF5dWhygEa7cgINow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQasSj8vOKMYg4xSZiSOJsE5Ndo1Cvp4UGxwpyonfROE41/PbL4NfEAe/WpqeMrrHovrdac4z5UjJLauMBZ+QwcjUfhlhWgMkzFMp4UkrdgHUX25P+4OMGomdBTLzNyLka2DdpJQKnN85ZmadHbJ1jmSjS0DcQgaf0c1YuV6DuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b982518b73fso428862366b.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445541; x=1775050341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71PZmwBCGt13+2E2u4S7ZamRqElFJ3XFkvVJ95R0Un4=;
        b=iF1PeR75b74ehr9CBhyrIq5wg3wXoQxMONly4NEb2nnsLPMlJTBIow+sVVuiG2Z/Lp
         QCbqC6TIIKvIobF39ysbNykRZ7n3+YDP79B7IqvEdWkavC4/qJvGYTFu27CsHgVqVvjN
         XJtSWbkWmc1bQI+yQWgQpAAtnX+IJVbnQ/1Oqd7DPhMBsn6+ZCUkgtjmrlC6eWe93E2D
         uC5vh9qNcREqwvPgqNUiaBDkj7hJbltU7XKRs7CVmFbEJyWwGqIcSXUvqiXl+SjJ/ijl
         ViekiSR2PUgOBbh/FMuKzhXtUL4BoWDCMcEjh1ySHRdtnTOYP9E8JDNuD01ndqtt9RSs
         xMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyVIgZTysKP7yrcUC96e0ft4AygELvLmGTPSlf5QrVQsisVvRBhekrjxfwr3pfok6ugd48i6M7gA1c@vger.kernel.org
X-Gm-Message-State: AOJu0YwhK+ReqICNStWDzeMTvmcq3b8Db2gxsnUXvVxJ+dJCLwTcV8Rt
	jWifz+5mB+rA7aulA+fdjjn40ARWnqRXvnFoe196Xb/QhkrMzgr3nWC7HkOMhUC9tK0=
X-Gm-Gg: ATEYQzwL7DNhzntHYp76UQEQNGfcD9ouhM0E0HZnJnNqO9Hfiric6TI8kZuEUT9nnxj
	b5QGdkY4F3jjHDkyEBnfqPitaiPi3bxSWYyog5aUAkcR8IMnRzrVJ2UKUDUw+KS2ONLS4gYxtsy
	7Pg7ebiwECOMU8E4QLtHvmYGxfLKDn2tBSdkZA7z7QJVbJAQmxlVjOVcpoiew855jjaRUkUvJFJ
	4LbgrilYeksbcnm7uETkO1wjVpKCbTDvSemXHPHvUIjM8ZFuN/j2HI/UKVDRGLLAJgM/2KLTuSQ
	KvIPmoa+Y2AWeAp8JFPeR4DE5K2SK9EIirjggGVs3aZRtAyqQ38o9Ayk0G5LauqMK0Y2E2Uv1QJ
	39EFbEgqSu3FJ0m/YQpbRLCBUiGLQaWqU/eaOrnkTEcApV4nayqO2SKR9meOlWICv4cFL+Xj5cs
	THvN8J2/mHazuZ4XmQALL7sxeLPs4H3cDR1Qqp+EW62mnxUvDUE1+RHabjCs73
X-Received: by 2002:a17:906:2887:b0:b94:a1d4:ceff with SMTP id a640c23a62f3a-b9a54237a71mr172846466b.35.1774445540769;
        Wed, 25 Mar 2026 06:32:20 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de0b2sm793441566b.34.2026.03.25.06.32.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:32:19 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso3572069a12.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbxegXbJXIyhEGuKHjNYVmQLfrRILFJy3qUP6TEtcdxpBJW71T70P7TubMu63QR+5qwcYy7BP+lzr5@vger.kernel.org
X-Received: by 2002:a17:907:c08:b0:b98:6984:661c with SMTP id
 a640c23a62f3a-b9a3f14900fmr255405366b.10.1774445539317; Wed, 25 Mar 2026
 06:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:32:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
X-Gm-Features: AQROBzATJnixo_UeI8ufWETnQDalm61zGkrEBTKZCHPPX7aWGGL_4MFy_z_N-QI
Message-ID: <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex
 MIPI-HDMI adapter
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Scott Murray <scott.murray@konsulko.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek, Scott,

On Fri, 20 Mar 2026 at 03:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> From: Scott Murray <scott.murray@konsulko.com>
>
> Add a DT overlay to bind the Olimex MIPI-HDMI dual-lane DSI-to-HDMI adapter
> on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.olimex.com/Products/IoT/ESP32-P4/MIPI-HDMI/open-source-hardware
>
> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Overlay for Olimex MIPI-HDMI adapter connected to J4:DSI
> + * on R-Car V4H ES3.0 Sparrow Hawk board
> + *
> + * Copyright (C) 2026 Scott Murray <scott.murray@konsulko.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>

This include is not needed, so I will drop it while applying.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
