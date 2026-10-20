Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498859;
	b=qA9FBa+HrTh0o828R79hXeYFHqzM8BVPv6zWB4ODjsCqojehjk/TDS/DHSj/fCyymPVS
	 /C7gbfvvpf4+p8sC/RUSntCvRJdoBQH9qNS+9887PZywF1lyBuL+/gTTpA5vqJIQ/WlnO
	 eoSb7Ln6uqBjiQYAbKVfL+5Zq/ijFgqvWQr2d/0ROfcUjF1Ob95S6HK/DFDE7FD957kXF
	 YY0boBISwWU0hMJxkfLRd2TTjTINDsyd0T1mNAHHMLfN9iGn1t7BYHIx1OrvNQ7YMFuas
	 dgvrNXB7c9dMuq5RJvk10MlUgcl/lEPlj/B0xKRcl3aOXzsJEVvtJ906fP6fOhGe99A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498859;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
	b=pr7QFN2jDjjoU/yb0s7EvRrvs5uzukboGlLtXbzHKGJVEH953E1KBKitXzG2cLY0/6v2
	 P5BbNg/sHKSxQ9Mre4lalZcIwxV1A59xmm0bfBID29tSuNsLH7S9wcaQb/X6ILQwNbUZS
	 LoDDgK2JMeIgNzKU8FNUtC3D2BDfJ/8k2gUAM258YgUq4utvDS9FToH6DK0vPzsjr0/Yg
	 K+svIcs3AZRoSy9KF6VDtO10YttzdXQS8hB0h/Rcdo8jhOjSLb0yBdYKIvxluQJYXEy1X
	 Nw6eKiDajaLocALeK5RWozxArxZr86GxZ3sO4qLL2VVEgfRxfSiTVXDOFEd8KuO7whg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEFF606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEFF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso959601e0c.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498858; x=1793103658;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
        b=li7928AYo7M6k1oAXVSUlCWrc9KKKgOpOu9Y4n+XAjPxw/VkD7OPPQZmyIy8bCcoAT
         3D1JuUKVqts2kKc7tymmnKfRcxw++Hj1uOiVcZZ9aNpAHU9mko/JQQMy+4oZujc/zS/A
         sLa06TNH8VmJnPAPDa8xnk9MLXzhprewtc6KeKeiNoTDJGMpetCOnBGYA4JeE1vzhxqf
         rDwfitlgbMG1Y45ZGbBSHUeDjCquV9AVtb3s/NzFz+G1pdHAQ4bUPAFKA5voHEf0xEM9
         EN9qc8yyNf85Ip3pnOWVRoQMzE3WR0PnfxAyr/fwENGYSwTJ1z9PyPSHO7V6mK0SSTk+
         RRag==
X-Forwarded-Encrypted: i=1; AKwUvBxLYLqvKuES5cytiO0MCQtQDiD1rnIXpZprN5KOyzl5Q0AZKXflqIZi7cssEKKLtbN6oEZvc5CETFSt@vger.kernel.org
X-Gm-Message-State: AFq9FYL3pHsfaYWBCkz0RIjV1u7OVuQR6WaS+OdAZUyxZG5xW3DCYCkf
	qlqcPG5mtvgowlA62yTPrJcJ62/wjMQH5Ril2vdSUUz8mbXqlkjFlFa9DlvlRBJNO6g=
X-Gm-Gg: AYBFou1qd3nganfvcHaKCpYoS0BVTOCZvdcXTeb9gRfGCrp04BVGB45HePc2OMRhqaM
	beVnNaiXwymWkstPJg1+cCw6gAlmgmHcLqScN1lJdLSRE0CbtpbxT7Gw98qcL/1Gv89EUISfgbb
	2wqNXNLRhVziBc+U0IaYjH67F9z2F0Fi4Z8Ews1jFA3Mig51wJIIF2oHE3F805HZ4BydqA/aCkq
	WYdYLS7krGLafVOH5z2fSI11gaAoonYTYxenPM5xUBCdFwaaUWuVRPkeIt1vEpXqMHtG5vG1soj
	X49ZotNoS1Uwo/KZn/AcMSzCaaWVPjMpVsNrEXxyGglPmHUloBEKoNYFitlTPTrtgsS+QSblmLN
	GCYe94/aCatiQ9vkoF7PN15ZyoUyEulyBmV8gj2gKyvhVTvWkbZQ/ZG5+MHRJNK8hH/aReyolOY
	pCvNXjrSHBgmUGQRA7cnIuRvpD9M5amq4NO848pbDHZxcyvckN3o4xDLo5zhUMxA6w+HvLOhBfy
	iSUIgxcyQto6/nNIVgoHE9z0kPHn7WDU39V
X-Received: by 2002:a05:6122:1d53:b0:5ea:c73d:48a6 with SMTP id 71dfb90a1353d-5eac73d596dmr1485493e0c.9.1792498858012;
        Tue, 20 Oct 2026 05:20:58 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm12526823e0c.13.2026.10.20.05.20.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:20:55 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so973558241.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:20:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3NZTE85dusx0iwRdQUdbISGZF4BusgJ6J7Sdl1FpjAyJx7GbYYPbWf/VJ8lsXMqCk2L5vDrvDDUko@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:7b8:1a1b:8e79 with SMTP id
 ada2fe7eead31-7cc36495eeamr2517275137.0.1792498854605; Tue, 20 Oct 2026
 05:20:54 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
In-Reply-To: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 14:20:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
X-Gm-Features: AclHuK8ponr4NJ0lS94fhAlbo48BEUWSxi4Wc_0ZZ5rhhDlLA3L5w0smnHDD8jQ
Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
Subject: Re: [PATCH DNI v3 15/15] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Thu, 15 Oct 2026 at 09:53, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> +
> +static const struct of_device_id rcar_fcp_of_match[] = {
> +       { .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
> +       { .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);

I don't see a good reason for moving this around?

> +
>  static int rcar_fcp_probe(struct platform_device *pdev)
>  {
>         struct rcar_fcp_device *fcp;
> +       int ret;
>
>         fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
>         if (fcp == NULL)
>                 return -ENOMEM;
>
>         fcp->dev = &pdev->dev;
> +       fcp->type = (enum rcar_fcp_type)device_get_match_data(&pdev->dev);

s/rcar_fcp_type/uintptr_t/, although this no longer seems to trigger
a conversion between pointer and integer of different sizes warning?

>
>         platform_set_drvdata(pdev, fcp);
>

> @@ -215,13 +332,6 @@ static const struct dev_pm_ops fcp_pm_ops = {
>         RUNTIME_PM_OPS(fcp_pm_runtime_suspend, fcp_pm_runtime_resume, NULL)
>  };
>
> -static const struct of_device_id rcar_fcp_of_match[] = {
> -       { .compatible = "renesas,fcpf" },
> -       { .compatible = "renesas,fcpv" },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
> -
>  static struct platform_driver rcar_fcp_platform_driver = {
>         .probe          = rcar_fcp_probe,
>         .remove         = rcar_fcp_remove,
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
