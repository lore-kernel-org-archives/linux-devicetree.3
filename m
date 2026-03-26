Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ACA35F18D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518186; cv=none; b=NfKHt4npSAcon49FeygfMyXbo4HDi7U4nnV00btkf3YrpSWnct7HFppIj0ZrmUQGcJlyp9hR4Lym3xi5LPgmSgSPavFdeQ+72+YffmdKFqcUgZoXSjji3v8GX973i36/TpWwaxoX14+SS65gCf9D0JGwTI5gCI0s24iYIWYuDhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518186; c=relaxed/simple;
	bh=BiAwvTDvxBZNe4zMaISQ9WF5iLCnzPvWoQ3vuS7x9Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfjDhKhayGcCqdFfjtQoopBET0ydULRwuVHxV/tZdO8x+dDa+SjfI4r7MZwYCP5nWuhJRaRA7Cg60cHvEADwkcZBe2QuCxP8xGEw4AnU1CS3xw6yA9pnwLj3h9p/t4+xdWfHfqOcjLv1t9oXGrKowAB10s8I8BRF58DXbpfg4/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5675d609621so700594e0c.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518184; x=1775122984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kU0JKCVLmRyv60mHDUvVFC/LUQqWVAx2g7oJNxauWQ=;
        b=HGJFMH2KjT1JwAm0NSXHVz7jDDHsvbe/E7uIU15Q7ll4Vkfi98Vxkkfd2uxQCM/ilb
         w47HeWg7PGiomw4JisJCllARfL039CrZ0sF2RPL2oQgyaSKZhv7NfKQXHuy2EfpJPlyL
         tAh/0qbnm7g2zCoU4NStoxp5o+/D3ZS0UMHxLcFD1Yz/GVEnkAQ5b8Y5wFF0V5rzG9y3
         POBAv6erM5SRIEMIEnnkLiQEovBEGw42AjvZMqhPyjXa3wn0rYvDdbvtPf47DkhqElvK
         Zqro+mkDu5mCak+ZyvRJSgFmylzURXUnT8zyq0ytp/FXr7AQ8LtG4e/vLY/65pIbB1gB
         T6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCU9QUJW+sDUmuMYhbLYupgwhbVHvmFYbT8BMKV1PmW/UKckUI5OLLvBcXW+dOOgr2MSOISVRCHX/Uma@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27lXsayw0f9AxM8/Lzxp5ipIFVRzjCuknro4yvEiVSKi58mor
	l+/tJgpkDZcKGDDD3fCw9BPZKAxhb6pMcLfdvg+D66KOKxYwWyrKbjhh1L7yIXjrG2E=
X-Gm-Gg: ATEYQzyz5hSlCQ8RBMXM2sEAG1rh9GRn4fF+ZkUUaUvpS1enFDHnSoZD4GJ5+JixQlk
	zcE5JjQSnNOXIq55SwssmKp2zNs//zlOIRyY6ALokA6ctaHTNGugpcWvsgIgBee3BWXGRy7YQl4
	ozrJyvXbe88weRvTGQJ43kNWVEaxZWRtow+urfqB+PjJA/B4DkOfc3W49k6hgzJ3QhnHhm/xo2c
	7E3yxnAV43ReLy54IkvuJrHwIN4UqSLLxjO/tRDzKKf1fIcLt33oRGod7NZbyFWOMyJ9H5uVP+f
	nSeFMD9ykNN5SO107M+FjlIpP6qmsdXs2gy/lUBWYv4yeKQsudHWVSYSReAtA6Ar3ULt52Dc8mH
	5+lKwiYsGY/cjeWI+VVKhMKLhjzkjNytl0LKTq9bpyylmRVKcpBiRgu4TH8G+FLc60COFQDLeN/
	XoBvjE6uvpAA4twuAo9umaISWLGB6w28WEN2Y4GkVk9EcUGrDhN+GZWWu00ZdH
X-Received: by 2002:a05:6122:83c3:b0:56b:6adf:150b with SMTP id 71dfb90a1353d-56d220e6d08mr3563433e0c.13.1774518183578;
        Thu, 26 Mar 2026 02:43:03 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d9f049sm3792292e0c.17.2026.03.26.02.43.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:43:03 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so468797241.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:43:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWD1kiCqA58fWNPke4vdt5J2X6fZRVTWVdlltnZLkOyezfifodiJLghmRnPJ49XToKMYcKxKpLqFn4S@vger.kernel.org
X-Received: by 2002:a05:6102:2912:b0:5ff:dabc:db3c with SMTP id
 ada2fe7eead31-60387434993mr3725937137.33.1774518182764; Thu, 26 Mar 2026
 02:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
In-Reply-To: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:42:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURyu4U4ndv=YE47o6S_9O6eKVJKw_O=g+1c370Y5oTUw@mail.gmail.com>
X-Gm-Features: AQROBzDbZehn_4D-IYCZOycaqBEf9nJApEKcYwJ0UO0dOgClazFf2m0HC7BXIuk
Message-ID: <CAMuHMdURyu4U4ndv=YE47o6S_9O6eKVJKw_O=g+1c370Y5oTUw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 10 Oct 2025 at 13:11, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Enable the eth0 node and define its phy.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

A few more comments, due to recent evolutions.

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> @@ -50,6 +51,33 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
>         };
>  };
>
> +&eth0 {
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy3>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +};
> +
> +&mdio0 {
> +       phy3: ethernet-phy@3 {
> +               compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";

Drop the latter?

> +               reg = <3>;
> +               rxc-skew-psec = <0>;
> +               txc-skew-psec = <0>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;

txen-skew-psec?

> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;
> +       };
> +};
> +
>  &ivc {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
