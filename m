Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502867;
	b=OxCoiinKLZOR0hNaWdDhkZwFkmyReshpGo0ex/9y6Hr42fvIxMPuRkBOI2DigeWW/2sE
	 HHh9iJ7sin8dbDs2i1cGUO2CbTj0S2mDmlDboJKbshFMgoI8CXbV1o9d4erfny6ZhwCJq
	 q4C0MKpAIMpyeKa5YiYHFUAgtHAsr4rO8P42UBSMw+T2K5xy3WdUFUYsPX+2GbFiWSqEj
	 rYQU7YYEOFlVyDChVwqX9D5zQMGXHvAWWjSaZ7uTD6Wv8fxYOjDKrIWKmLB7CBWrzh6J4
	 HqcjZFvbC5VsJwnAwttdWt/ZLLnfcZfHTEO2J5dxuUBxoFZlm3iPKTpchZogYvP+W9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502867;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
	b=rPfWx+mCiR87gBuqG/Pmw3u3AXiHtpFHaH+mcLJq3oRotTOxmaD37dPmBx0ckknYQTKc
	 rvV/lYmCknAOaGmBYXbXKIo1Q1LW2YrwoJ12WUwii2JZjBu1JiTp2Ssd49+czfaY1nUSJ
	 7Bfgk5sLdudEZUvm8Qk/f5vQwNXaoyxinXEeRYqb6RpqyvZamDpkLLAHO33vO9cYR6mbU
	 To5Zcrc7XU4x0Hd76C8+ip8dZAKQhAmvE4Q6koUEznDBfF4w6RLkilLXp5Kd2SO4V8/OO
	 7t1X3LkMMSyJMKsRUzkcQsCTdrMjSoTgeWGPh9p3rcPGq8OLqZCNXyuXLGH0fCqwgwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F491606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F491606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso2616421e87.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502865; x=1793107665;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
        b=0SypcEna4o2tOH+lyL+Raw68pnwav+itEsm42fAiEabaXV51qD0fSQnkK3FEAv4AJD
         JOxrUefUytvr56wclrUTNBqaXMGGsB2BdkVFIYQUT03f8oFAiofGt+5OOLI1wp6jtBsc
         NFEM+PlEdMcfL5+jeEB19HlulET2rUjfJh9Outp0hI1zR6vGAQXfHmCmouK66snfg1PS
         7w365gqJmaK5Lp+8W1FhlUyXUFtwEpGgScG8wauvpmmOQGKW6+0fVMYHsiDfMlscZoxT
         oAhE3g7rLOGqgq+Gm4EyZEy7rjX2GvXIMvQy0D1l/HYoh1SQ1/b4ru1/SWxdiBF0SeRa
         90/A==
X-Forwarded-Encrypted: i=1; AKwUvBwkdwP5ZPGf0WHDS7ZLS21fzb7aQ/pvP/rOMLdcn2ytdvdzLubqGlYiRHbT3IoHlHN0n+azWrE2Tl9r@vger.kernel.org
X-Gm-Message-State: AFq9FYK/1SHi16fuNyc7ZSSDd47/rqEtIxiI2PNPtf7NsjrU1exCdUr4
	VhR/HJvh3Wb2qG/Sk09UxG1d07zuzApJ7b6mQrhywEVp0rfbZQq03G3uTe5fp5ONHvI=
X-Gm-Gg: AYBFou24A2t5IJ+9kmKy8uPI3oGkWfuE10kkUWhhl/rPs5fs5vNWWYw0EnzMg+mBvpE
	miCqydRUyXZhF3see730gPOonN5gWmmJCYMPdOatlYjz+vfDyJ2+V3Tq+dUCe5fep2mVih4RNFd
	Nc5J/oRxRTLHWpvSE/SDRPgHwG+e6xOLEhWjDQPhSmIXNOEwP/IXiNPHRfggG9y/UMNni1WU7BB
	74ssFLDD6RVQhmyDkITk9ky+2/VwNBEn/wUALf6JgvZbqHlqzi/ZOo8ufXsMiJj6RCwTdN8CDX5
	ilNQVEGhVnjaO7ChpBV3DYzlKsCQ3Z+JeiXDGG3wU1bm3BwNhk8phOLnGAsPdjPVv7RjWCynq05
	ARJbp8wmko+CRWSPpM/R7Czlqxk9ldCXhA6g1ZL1e+oBhqJ/NZxFAIprVPGo7AlwPZfBJeE88aL
	OOdtBDF5SfElPpsd5VK+Vx59dMdkbh2+QCZV3Cy9nPCP/3sVVqyCscmla0b52+TFT68G3wNeb7f
	g5wCX5hO+PHa9RAZnptUWbY2x1oWgQ9h3KrSny3gIldtd/A
X-Received: by 2002:a05:6512:2309:b0:5b8:f0d9:98c2 with SMTP id 2adb3069b0e04-5be50a65472mr3594171e87.30.1792502865357;
        Tue, 20 Oct 2026 06:27:45 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fcf21sm2618314e87.6.2026.10.20.06.27.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:27:45 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso2616409e87.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:27:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtERjZOkEWnMc7AlVrx5AtSxVzcnhExvU/NUYViYSgCCVBA8nWrYaYO9E4U0MgDzg139zhJtP4q8u5@vger.kernel.org
X-Received: by 2002:a05:6402:270d:b0:6b1:c7d9:b631 with SMTP id
 4fb4d7f45d1cf-6b3a8191a46mr7499369a12.23.1792502542847; Tue, 20 Oct 2026
 06:22:22 -0700 (PDT)
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
Date: Tue, 20 Oct 2026 15:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
X-Gm-Features: AclHuK_uZzRO_WalfaTseMvUVupoP686uPVQ89YYU5UfnQv3EiXJeP7RDzX6u2Q
Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
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
> ---
> Changes since v2:
>
> - Add FCP type information
> - Reject devices with an unsupported version

Thanks for the update!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> @@ -154,15 +204,67 @@ EXPORT_SYMBOL_GPL(rcar_fcp_soft_reset);
>   * Platform Driver
>   */
>
> +static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
> +{
> +       static const char * const models[] = {
> +               [RCAR_FCPF] = "FCPF",
> +               [RCAR_FCPV] = "FCPV",
> +       };
> +       static struct {
> +               u32 version;
> +               const char *name;
> +       } versions[] = {
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3_ES1, "H3 ES1.x" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3W, "M3W" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3M, "V3M" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3, "H3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_D3, "D3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3N, "M3N" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3H, "V3H" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_E3, "E3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_X5H_V1, "X5H v1.0" },
> +       };
> +
> +       unsigned int i;
> +       u32 version;
> +
> +       /* Check the device version register. */
> +       version = rcar_fcp_read(fcp, RCAR_FCP_REG_VCR);
> +
> +       for (i = 0; i < ARRAY_SIZE(versions); ++i) {
> +               if (versions[i].version == version)
> +                       break;
> +       }
> +
> +       if (i >= ARRAY_SIZE(versions)) {
> +               dev_err(fcp->dev, "Invalid FCP version 0x%08x\n", version);

You're missing a few variants:

    R-Car V4H: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010a
    R-Car V4M: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010b

> +               return -ENODEV;
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
