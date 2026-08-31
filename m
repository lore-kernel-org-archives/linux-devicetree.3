Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A302D3BED7F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164311; cv=none; b=ivSf4Eq1Hf4RWU+8mx6ZM7X7SSFJMUFFN2XaVV8yzrwmF9qjyhAz+jdm/M7zzU6nviQcAw1WN5PyAdxv4QGHA5SRnmfG+jcPqcbsMKnY4uGSIP0+9jFTRZz+anLZEip4Qw/MfyDwOQQCwoXYkk5Foj9DFRB9XBpXI5BbkshKAWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164311; c=relaxed/simple;
	bh=+qn3x8nquazRyDm0Q+Tw3miio+SG11ZPkQozR/1R4To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9RafdqmHwMpHDjR3s+D6ML6TjzKr05VTFnbzgde7MOTDbIQwIlhX5hD+z/TaVBRTJCRgugnPiZ3lKURbgtcpFKMstxhzP54i6J+WN8tuwbzyjeZVmBRBxZsns3eq9g7SRt8XZD+RvWeNPRZVblctMV27bfBn67zO/2UqtkguJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90c4e297a01so27912076d6.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164308; x=1788769108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+6mIWWcx/hgj72l0+IMwbJPq4HotcZmhxU6vYoZhGw=;
        b=ErKcmC5LYp0SCJrkKchEZRZGWY8WGeMKCPl1lXYXqn1BOHHkkp6d5lfyUSVzlPfzit
         +q0SqhaAggFngy52Ig/frdtKFGcS3kA0n3+1wvYqY2uV6y3fYRuGygZ+iXVju2lQ6bQL
         dcowMSEkdHd5lt4A7fcRF73e8nef8LlctIW48UtR3kRc7QgshiWkuXrl5XjO+IxpJ5hk
         kVLTy8LGBXqvrCUtrl56tVAxjGh9WFghfNCwkzvjAGRtp9dIwUVZlNGCwFnkjGfcbjo+
         9mCo6tgyx8T47Fxr11+MFIlkK23mgmH8vyx0ejuWHpzzamv6I3+K/JVfz2nJVHkLWFiy
         eXIw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2g1C1GTFjNJxRbd+5gaUJVCbThVcZsOjJSjcgSJXq2QbtmmDAkk/mPeY1NqwVSoMQPlvoRy0e1MEt@vger.kernel.org
X-Gm-Message-State: AFuF++kINyYglTuNNCu7xRvg8RKRKi2vVd2Hjh4k0+teJrQClFZzqNwW
	EabY1+b58YxKU7TQcg5F6oTYON2iXu6d5+8/mMlEuphoLPKAtlJgLHAMh7bmvgYh
X-Gm-Gg: AYBFou2UDKLwa1tQl+yqYoCoKrmW93cuNPqMSuFKu+1ZiUUXKgHFqhwOOxfjSBPGOSY
	bBaZq98GGrtGl9YxoshAbeXFWILtSSjVt9HzDrSNzNAlmFOU5kHAV8FPQBz/6tW9mBQ211iUCTH
	JyQtiRDz88gVVcv95X5D7gZFKYdH5sKUnMDsFlLJ7pvn8DBg3MqCGtJl6T1ZT1MkfH8dvVG8IHU
	Qh0RK/16jqqctvxk4xuOCfijF0xXtq6eeI2bce7NWSt1kfBs3Y6KvBcKIBhoLfCNMZ/MiPA/32b
	ZVE/uBT+9NS+Z8f6Djk+e92HiW+cmRYp6hR+CX1cLc4AUl2aa2qpgXfWEdWMIdOyzTRcu6jo+wv
	EAYA2kmdiJT6lj2B7z+n40VcIn7dJkMtuDTLXedMf7k35WMvrI6Awt20J3lPS2fSC7dMr1edi1E
	AhRu/jPKq6xk1Dx1mMysfd6squ+i2ZON2+ovSJ7ndVN2sYC6Zh7mw9xBCx7umzq1ISYwqjy07T3
	ZtOxx0a0/a0MIdrT9XoikStvI/T6Q==
X-Received: by 2002:a05:6214:4e84:b0:90c:e133:1995 with SMTP id 6a1803df08f44-90ce1331a76mr297762056d6.6.1788164308397;
        Mon, 31 Aug 2026 01:18:28 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444e06dsm79380106d6.3.2026.08.31.01.18.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:18:27 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52eaeddc837so22916321cf.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RruC2DkApU3A/MqwGGzqusVvDUPvLOhgH+/1EKEehGcPs0F27X9sDHoxb8qM1B9g3uoCpDdlxbVHUvT@vger.kernel.org
X-Received: by 2002:a05:6102:f9b:b0:77f:7df:ddd2 with SMTP id
 ada2fe7eead31-785972e710emr9471412137.1.1788163994928; Mon, 31 Aug 2026
 01:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 10:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEz=NoDkvvSjZqNwDQE7+F-JqEeduD0-E-NXTj4Ykbuw@mail.gmail.com>
X-Gm-Features: AcwNN1W_pE0AEcDpr5Qk2q9RcyT_OX0D891rRk8joGtPW1leA8taoV55ukV4EjA
Message-ID: <CAMuHMdWEz=NoDkvvSjZqNwDQE7+F-JqEeduD0-E-NXTj4Ykbuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Document Renesas Multi-Protocol PHY
 driver for R-Car X5H
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-phy@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Hai Pham <hai.pham.ud@renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Phong Hoang <phong.hoang.wz@renesas.com>, 
	Rob Herring <robh@kernel.org>, Tam Nguyen <tam.nguyen.xa@renesas.com>, 
	Thanh Quan <thanh.quan.xn@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 28 Aug 2026 at 21:22, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Renesas Multi-Protocol PHY present in R-Car X5H (R8A78000) SoC.
> This is a multiplexing PHY block with inputs from five IPs, and outputs
> to four separate IO blocks. The five inputs are two PCIe4, two USB 3.2,
> and ethernet PCS, each connected into the PHY with up to 4 times 2 lanes.
> The inputs can be multiplexed to the four IO blocks as needed.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,rcar-gen5-mpphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Generation 5 Multi-Protocol PHY
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a78000-mpphy   # R-Car X5H MPPHY
> +      - const: renesas,rcar-gen5-mpphy  # R-Car Gen5 MPPHY
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 5
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: mpphy01
> +      - const: mpphy11
> +      - const: mpphy21
> +      - const: mpphy31
> +      - const: mpphy02

These look like provider-centric instead of consumer-centric names.
Please add descriptions, so it is more clear what they are, especially
for the last entry (which should perhaps be the second entry?).

> +
> +  power-domains:
> +    minItems: 4
> +    maxItems: 4

Why four? (yeah, SCMI...)

> +
> +  power-domain-names:
> +    items:
> +      - const: mpp0
> +      - const: mpp1
> +      - const: mpp2
> +      - const: mpp3

Likewise.

> +
> +  resets:
> +    minItems: 5
> +    maxItems: 5
> +
> +  reset-names:
> +    items:
> +      - const: mpphy01
> +      - const: mpphy11
> +      - const: mpphy21
> +      - const: mpphy31
> +      - const: mpphy02

These look like provider-centric instead of consumer-centric names.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
