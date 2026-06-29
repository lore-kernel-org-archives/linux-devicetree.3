Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B533930B517
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741110; cv=none; b=Y6coKT5ugtj3QWCJlyzjMa/juo94FJjcwUsQ1G8bPw+J5YJV8s6AV/HrVYIUEy980bH569d7+NPhFeg0YD/X6mct84IGaEF4xnpsuWlEw16qDQZiMvdIyjkJusJQiqCjwBzR/CT99w9FIu72Wjkf2i+dr6j9dD9l4PvJWZnJALE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741110; c=relaxed/simple;
	bh=UvkvBBzeyeMqgudY2G6gDFJg27JiOFKpvozKSRN3iE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m23aYSc4TRkJh3JlJ8VZ2uKAoD++H5bqSYwpLwR9ka7kYZhk3RhG6K/oPrOY/7JySYYn/w6DH/HZDk4F3laVni5iRUIS34qBKQyW6030I/CgsMYQBK0urU9Pi+vB+BrPp7osYWQAj4hAESHtXvc65Cf1F4RDN3RQFVFnJuxS0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59e23d70dfaso1073665e0c.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741108; x=1783345908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=;
        b=B4KKcEVYK694J2ZQfcnZn9HIj15vFsMjBePmNAJZt7w0+H3iV6jk2/vM2yV2g+bI0e
         ZCW/K4/JQSWu/cxzfwXd0jkkL0Wcq3y4beNFbJ7R5HxP2SHcRjU841qIqqxYzqcOZF71
         no53VE785+0eXX15p1ESQ6LBdajtxCwNCsL7yRjDulj5oSkQRlc7Yp+CTUzeDJDBFw5s
         kptFN10+mvVhtJGS0zlb1HKppeQ6t+rk3DghGinUV8C+4hfS4PgPbleWnlPchEkuu1AQ
         KIU+exdii3mlYv+YQcilxA8uRfBisve0WF6t9oNjNjYr5NpVX5LEzrMSg2C/AtX8X+jL
         lDvg==
X-Forwarded-Encrypted: i=1; AHgh+RpHjfOBj+5jqMpda5Z12uepwkonM8sfE+M/xHB6PYnq7gcLBt7liWRDHy+IZ8Rj4pvoFaxgO8GfzczD@vger.kernel.org
X-Gm-Message-State: AOJu0YzBmhHvaYulmiJsykBo2fWreGOKlF1oOoGW+UUg26n7kyIpvf/n
	laRve8symj3nqIEST7US5CYHDPTYPzcUOlSexLLavDP+3V8jdeRIf8WSebHjCrjV
X-Gm-Gg: AfdE7cmCNWYRw8SugOSgqz+bGCU9+ShaDWfq4v840ItVsEDo2be09hxyJIiTZnSYgcl
	DrhIw+Pr8YLkzoCIbrXAgjGCVa0mMryDvJ0zEfXURQ2iWU8GSMo26hZsgxIIH48fBNBJ9KkbZ/d
	0WWDNqd8FN1LoT7G9gHVIYfmbElVZ7ePSIRwRYyxXqkkWwYKA9r1TiqItsoQ8LzuwzxHcE4sC4w
	XkT9EPUq8dCEMTqYwRr77zTZSQkS2OFapO4PYd4c7jfh7YpZxKGIf6UHP3RPVI3jTkOVicCMZEY
	QmI8z5MI3qoOBncMUJ9XrP+QF2wo3M8o3to+44eixDEWJy3r0HPv+F9vWgapRlIGDLmHSPvj3Wq
	0HQQrWd0tkWtzMbuBdXEU6Z0jfL9rgG+2p6QhxSYngfenBGc64ZDFwJpRQOKB/KxP/c/70SBbRE
	Ryajz7iNMnU5UvM9MIatSSIovYgsvjKPHW2Y2jnGGP2/M7uXOLVQ==
X-Received: by 2002:a05:6122:3488:b0:5bd:b27c:bade with SMTP id 71dfb90a1353d-5bdba970665mr407553e0c.5.1782741107667;
        Mon, 29 Jun 2026 06:51:47 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bd78c3248esm5710902e0c.0.2026.06.29.06.51.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:51:44 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-966d4da9fa6so814685241.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:51:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RofR3z/YyEta1POACiGW7epFMu3PsCXglziFiRfnnhGfSeXOB6ZpfHizmVBhpmtS5jv7RxRLBbt/hK1@vger.kernel.org
X-Received: by 2002:a05:6102:c93:b0:739:86da:7777 with SMTP id
 ada2fe7eead31-739fa951f6emr430364137.27.1782741103904; Mon, 29 Jun 2026
 06:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com> <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:51:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
X-Gm-Features: AVVi8CdHRRLXddfc63bNJYLQ9RF__6zMi6ngPMxYGYM87lHlKy_8kZoakyQBXrY
Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

Thanks for your patch!

On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.

So why can't it be reuse the DT bindings, and be compatible with
qcom,sa8775p-dwmac-sgmii-phy?

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        #phy-cells = <0>;
> +        power-domains = <&scmi7_dvfs 0>;
> +        power-domain-names = "serdes";

Ah, this uses power-domains, while the existing bindings for
qcom,sa8775p-dwmac-sgmii-phy use a clock.
I guess the clock is the correct hardware description?

Adding to my list of examples for backing a hardware-to-SCMI remapping
driver...

> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
