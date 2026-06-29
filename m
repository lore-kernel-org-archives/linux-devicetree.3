Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DD4421A0A
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745223; cv=none; b=BVD3rzRI6VhScqOCHvGhyg0BQSfhRSRb0r2kjn1ZgxFvPktLPe3XHwawZIoD6kg58RQQcjYwKnubpOy4YxXH1k3MMZQm0Yu4D0ENGhYjJlF3cqn1ULDWjH158QD5wQgI3E9Hk24/wDZK/+18sPqSu5uCScXoiFyZSe4MyDHC9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745223; c=relaxed/simple;
	bh=LAoZJqVfdU9+V8F5hBZtY//uWnuQHis0eN8ii8DLed0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5/QSDEqFdAPRzTUVeWsL6P+a1u0csgy2IvTrP2t3JII643RiDm0Iu1/v5lcpFlWxBshvS9WuISMbEXKzAgcbwEIJnug695/xo6P3mczDjzWpOeozyJhvT5DxynK5+YYBYxE02TdrXgCUFnOahAZKYZVbRoVZgIvw5bXo00DX5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a16bcd0a2aso724498eaf.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745221; x=1783350021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=;
        b=RTQOAs/gJzN1sujIjpe+VHt/oCMfFHMSNSIseglQM9YBKxOZ5IACC2zDrbb5pqApca
         2QXFotNd7UNW8QALk9e1tKJFPzvAwLAIUtcV1KU8dLryo49B8BBMG2NMB37+2g6Idwzt
         p2Ut8hFEfACxIkp49esYr7MCYUV+oq55ISlbr4uhOP+NRAklv3Jd+bB+JRvgHkfbxa4L
         yDw9S9auJqFwXT0FwFNb0ix9H/bCg69eoZZhm8fxg73VmxbY7BT7mWgGGKTOmv+sY/y8
         /LOu9ijzXVLrCEV4BNd30AU9vEXyACwQaMNs/5TmAb4+5Fgs8MZPxt+MlwTLMk3n56xI
         2KtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CJsZLcBSpewlA+seK7RCsRXYkz7HY+mVu0dN2RSDufsxuR/RmRH5dRzCQkYwHSLT6z/3xNC1LE60t@vger.kernel.org
X-Gm-Message-State: AOJu0YzEG539vrA9J3/c2+WGbrAH57Af1hIEUsEfOUXrOAOTkru8doNy
	+hBWUgNI1607FZhSMHB0d+3l07dpjn2AurYzuy31Ed6ByzUT/sf35baqu3XegKpG
X-Gm-Gg: AfdE7cmhga8peqtsjVPcGLtGygoxOyT44LD2qJxvV5B7WVGVRcD8YcnkS32q4SIz6Wp
	FRPp/z+Nssgi8t24ZpZfW1p/9+q2UXsqJXYQx0dv0PtAKMhcSEdGk4GXgrslixjOOwkQOjpQ+AP
	YQBj6hzEwIj3dFfFnEtwRk6UUqDzl+Rb8BoeQGlDUZYuaPhT1qC7v9Hmoc1khYAtulEV4LHtW2G
	sEdPsTjYN/VQUh7h3ZjjeVhJ+3ARX664NpUYDqO1SV8Akvm6BB5XRlye8nX4ej0IBp6FAC7kHne
	Jl2VXJBA3ubzU8pkWytO7Lax8/mF+cwKKvUrMCX08SsN6MRPfBh1Mv6GEFPIJMc1vhT1jBDO6G1
	iyR7gd92sB4dlUSE2VIO3q4XWUOBC9GlykCifp8BJSrHwZ0BH3B0m00YL4Hi3PwOeaG1MXQtDAO
	sBEGeEv8TLnb5ZP6Cp+w0ECkSHhfndp5QGzrzRnW4C9rqKEM512w==
X-Received: by 2002:a05:6808:1a27:b0:495:b8ad:6bf2 with SMTP id 5614622812f47-495b8ad740amr3980452b6e.33.1782745221192;
        Mon, 29 Jun 2026 08:00:21 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-494c3766f3esm4824667b6e.8.2026.06.29.08.00.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:00:20 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e94cd6f99aso3844776a34.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:00:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9XTv/ClCtvolgEzCbi9F3G1FHSaoFQDzEHOK8mbc/ZA1uXQv01nBRLjLwXG9xEklKi9WMP6N4E2J4n@vger.kernel.org
X-Received: by 2002:a05:6102:c86:b0:738:ecd7:198e with SMTP id
 ada2fe7eead31-738ecd71defmr1394925137.19.1782744721048; Mon, 29 Jun 2026
 07:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com> <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
In-Reply-To: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJoaQviVQ7ltoNYHwA2g-kW32TDsBBJn2QkEKdC-zwJrV4O3to75iJ6g
Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
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
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> >> managed by firmware over SCMI.
> >
> > So why can't it be reuse the DT bindings, and be compatible with
> > qcom,sa8775p-dwmac-sgmii-phy?
> >
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> >
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: serdes
> >
> >> +examples:
> >> +  - |
> >> +    phy@8901000 {
> >> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> >> +        reg = <0x08901000 0xe10>;
> >> +        #phy-cells = <0>;
> >> +        power-domains = <&scmi7_dvfs 0>;
> >> +        power-domain-names = "serdes";
> >
> > Ah, this uses power-domains, while the existing bindings for
> > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > I guess the clock is the correct hardware description?
> >
> > Adding to my list of examples for backing a hardware-to-SCMI remapping
> > driver...
> >
>
> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> driver instead of the MAC driver where it was previously. Instead of cramming
> both HLOS and firmware handling into the same driver, I figured it makes more
> sense to have a dedicated, cleaner driver as the two share very little code (if
> any).

I think you are mixing up DT bindings and driver implementation?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
