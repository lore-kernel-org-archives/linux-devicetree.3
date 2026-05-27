Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716E3EDE44
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876529; cv=none; b=FovNwRn6t+PXEAz0FlsPi8Bx6/mq1FRDBbCWM/ViXQuuE0TvN+EhpWbtJUvGD2P/h5qIs7aaNBSkwi7v8ozd7f19TdSeKY6ABFEhTkdORYJcqwEkNxrq574wd8EPZ2V5rQSY9lb1wZ48aCd6pXAKKx9MRqjoN0RDBaPjc7GDsno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876529; c=relaxed/simple;
	bh=t/6YKQHuNy5iE+ILTpFSI2KFKjawttSyluj0sbu+qZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBz3MOokVvFR4yUjQKig/18LfLGMr7DE6aWK9CUayqh8SQavtDL9Jxb1mMQzSu3t4mfxNA/1BrNXeHSjXlxAHCGEszY5kX8d8v9NJPT+xvA0b+e+yxsxKVJU8jvIAoQB1Cqx8/bbPyIlwdrUx/U7wM4ucTkS/F+DaIGVL3juJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-57611a6a69eso3523091e0c.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876526; x=1780481326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT2WytwVbdAnIW/wWW0UCgT8THJamN0RLJxguVXBLBM=;
        b=i2WmBtHImuuXEWz0Uuky0ud1t3s9gpreFZIFFucX8lhEq2DtdD5CIiJWr8tqkkBo2U
         NER0AUqLVLXnu3co1Qg9fysjIdaGLRJtY/8mFrbPi6n38VPxl9NxRV76c8A0vc/yiaIR
         HdugMMCJr9HAQymGBjVDXa7JHLgeDImqU7n3MYqiZQHHQQloJ9QJ3Yodc4dSbQulieo9
         HPG16ATB9rD63Gssv53SeeDVO76HTimePnRhH7UN7sVLBRcx5Ek9iEFJs/7mTF7NkOrr
         jDbaeiRzEiS19qw7Qili3yagZPrNNQE4Gt3TiMjCCSi8G6B55lDzCV4kDWR09Y/izT9R
         XitA==
X-Forwarded-Encrypted: i=1; AFNElJ+KGWVRQgz9fxs0PgwAX7kZfRHgjn9E+r9ZwVsVN7TYdvyw4YSmaqzD352Ym7P2yOiVzHo6CBnJe1AB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WrOw0e8ZUS07kmDtBbpfPhJXDtR4Sai6xlIH7vJtrMmr200A
	LJNcKAQZ32Qy0wFoVj5cJrjmJ0mdXYboRooXdP/rqs/hwDG1vaYiotS5ppoaYCpzyd0=
X-Gm-Gg: Acq92OE34I1U5RtkqdW6eiTJIGBV0hfcKKOrGeizeimtKwODQiqoibS8c56nCOxlk5U
	GtvBmAfzCMp2rYqVq6zN2vRkZoXo3UWgfByruXh1BWkgozpigSpJ+Av7PfUZ9Np0vcNatwxujiV
	/YFmcKC5EnVcYd2QEvdp8XrOk+HwA9UMhbnepqtsgMQ5m2rYYK7Tw/yKlijAA+XKGlAnVp+7j0q
	T+FYk7HRzmfCvb3VpplbNvzxbb0rhyY/7M/+OzFZlo8BMn3nClVJedKWoDnO9lRBZXR804nP4GY
	DVjXwZMup7hstCfXfDeG4AUN5iXSQljiLBghWKV7uJfuDmJ5eQblZg1yrk28zk4li3k8QB12eqT
	Vh4gewW/BaeDonchYngZNY3C7RCUvbwb73PoxauHKzsjxPfazlpNnY7t8GMNiLZGkMEP8wGuy41
	ztbMPWLJNd7MKr+2571VVtcH9uX39nIqN6bOj6aOoRFmIJB97M9yWFb7TIm/w//4oN
X-Received: by 2002:a05:6122:1d4c:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-5865f81d411mr7172138e0c.6.1779876526287;
        Wed, 27 May 2026 03:08:46 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f70esm19395332e0c.10.2026.05.27.03.08.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:08:45 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57611a6a69eso3523085e0c.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+QbuPgP/3B3fELizla4tqpkFEATC31ZvHg2qnjZzkQShmx+/tavr6LJFHa+cf0WlPTz4BEsIs9dvil@vger.kernel.org
X-Received: by 2002:a05:6122:2404:b0:575:e902:bf83 with SMTP id
 71dfb90a1353d-586590103ffmr11358742e0c.0.1779876525680; Wed, 27 May 2026
 03:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260505120153.680979-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260505120153.680979-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:08:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU82_2iJegVFV8f4gDD6shtcxNuAJdpisOLiY+H5mYEPw@mail.gmail.com>
X-Gm-Features: AVHnY4JfFxtT36vAaw579o5UiOGjx18u6RiSwEHYEnjYP6FwUvZezqDmmVkEb5A
Message-ID: <CAMuHMdU82_2iJegVFV8f4gDD6shtcxNuAJdpisOLiY+H5mYEPw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add xSPI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 5 May 2026 at 14:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add xSPI (Expanded SPI) device nodes to the RZ/N2H (R9A09G087) SoC DTSI.
> The RZ/N2H integrates two xSPI interfaces.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -1009,6 +1009,44 @@ mii_conv3: mii-conv@3 {
>                         };
>                 };
>
> +               xspi0: spi@801c0000 {
> +                       compatible = "renesas,r9a09g087-xspi", "renesas,r9a09g047-xspi";
> +                       reg = <0 0x801c0000 0 0x1000>,
> +                             <0 0x40000000 0 0x10000000>;
> +                       reg-names = "regs", "dirmap";
> +                       interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "pulse", "err_pulse";
> +                       clocks = <&cpg CPG_MOD 4>,
> +                                <&cpg CPG_CORE R9A09G087_XSPI_CLK0>;
> +                       clock-names = "ahb", "spi";
> +                       resets = <&cpg 0x4>;

4

> +                       reset-names = "hresetn";
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
