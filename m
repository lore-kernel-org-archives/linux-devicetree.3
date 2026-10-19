Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9049152CCE4
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419703; cv=none; b=ZFywOcVuTA88E3wjK6ibylOtU48NBupansIKxLMbU/e4qv23PtzTG9kmW31K/EYLa6ZxVUhQwG1VKfVHGGcP4bfP498lxbPQ8s7ad1IXwesqcF6sdcBLFPxzj2Rr5sEhJdqr0bAD2tnMWx1wIgu54W339toRaQU+UErU6vOhLt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419703; c=relaxed/simple;
	bh=SNGLc1dRo+r2RFwuwPeYSacsXpa5s/1i0LqchSr1mA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1QMdlcT6j8SaV6WpO9YUD+Bgr4I/QrGD0gf3sFXfPAanGyRZpPQSvNz1vPp4QcLv/tj4/QRgxE1o0Tp53F6t8gF/to+9Tp0roWnn8+ZSWhq5qk/pmIOzWaCl2/CGAVXrSPhhbLO3tgiJHUUpFbNLu2FPfjW6CsgJPCY+o2NLCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso2493039a12.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419700; x=1793024500;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r5Un3tcFd0CWzR3WfawxmOsdbODnCsUjJ4VgKeoks+s=;
        b=N6doY8WAQz1YoPf7E3tYBpA5eQ2XifMgDqFih9RuMzmprA/ryhXmQoNbZaqozdPmYr
         NwLGDH1wCQCIdAZek8oLTn029EakzIKrYm+50LsGSOzrUmnt3G6nn4U6PfySa0ZaFmN8
         edD3q7qkF48LjIdpZc74z664HuuITz9MGCFoZSjH3XkdUNOSTssWzlIlHfylfg4NeGjL
         Ouo0HD7ZAsAlGZFWqmBjfBTyQA9jKnLu6mxakNrv60+IVPpPpWPfOsDX93LNro/dwXvO
         ynqf8gDcyiydSPDeKRlsEKWU1Jv/696CJNv5I1OFcig+2kbkZHPM+a9GyjYDJMVTHHeh
         eAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYwW0qUnfzPqvgtckHSmfNvAqJKRLxCauDaAXUs3rE0Wp8gu42YX4Z5fUMPPtnZHuuMYMxuz4SXgqg@vger.kernel.org
X-Gm-Message-State: AFq9FYKjyW+CHb87+XXhFQye98SrHWCRO0yr1bk1xszYzZSP0dfR6Xkq
	bjE9Bt8dThaT2DC8L8GaecldrbzBRw0pypReLapV7z3w7EZDRj2pkjLJFF+hzTQZlHI=
X-Gm-Gg: AYBFou2xA/4MExflRrmR5No94VRmaZPLFl/Ct5knkJ9+Z/rOT1tmfTzycBcY1TQINM6
	fEt+zo6Ayz7aO7oevQoACYGdlrwqnkPYJbp9k3WMzfS++ZJFQCq6JBVEzN4JXKCj8swmswpDyQO
	y9VFT/o5M+TxDhHSCAk8keE6Iyuxle6j407j+W/+OMPNqxI5j985jPoxXKmaH25KublcE8PB0Jv
	hI+1Z2WCzVZppTIei+igZuO1kCBiIE67NTBCMiqrE8jwX7kXRhgmCnHMxW4XxOe9Ha+Yos5lAWx
	n/+s8lpxfjS2A5CRO3B+XrpUfk11bdVV8T0ODGknw+QB+JrgwDvQw9Qex5OGUKvMLIVons+pxE6
	tKEZFupUli1TlYXYSHOGO7Bx2pm1drzEcDjhtBFo6igA5VCnAmdlP9fZhziiVZQDlMyHcDMpg9v
	Myew1iLX6+PC3pbemaqEi9KMbE+v2AJizs4FouB9NbymIN1Jl7RJA5SpHM2+mF8lv9K7TYXOmj6
	YgrnPxUlYyZuAijMTD55x1flIPXCG5bcki4
X-Received: by 2002:a05:6402:52ca:b0:6b3:b7bf:9389 with SMTP id 4fb4d7f45d1cf-6b3b7bf9e53mr3068741a12.9.1792419699318;
        Mon, 19 Oct 2026 07:21:39 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b1347sm4102489a12.12.2026.10.19.07.21.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:21:37 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso2072023a12.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpGKmBV5ASR3ywkOeGntOYJhyIOY/v7f3TAwkW/HmWrMbQEj8smKh+jmUWwv0OpTR2NfeDCNM11Ktx@vger.kernel.org
X-Received: by 2002:a17:907:720b:b0:c3f:153a:8663 with SMTP id
 a640c23a62f3a-c419e63930cmr576763166b.23.1792419694998; Mon, 19 Oct 2026
 07:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com> <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:21:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
X-Gm-Features: AclHuK-siV4JYKFbtDQyYh3ROQEzSATnv4TCER_6U2XNGxIXypq0WsoD3L-uWls
Message-ID: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

> +static const struct of_device_id cdns_ddr_ctrl_of_match[] = { { .compatible = "cdns,ddr-edac" },
> +                                                             {} };

Why this weird formatting?

> +MODULE_DEVICE_TABLE(of, cdns_ddr_ctrl_of_match);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
