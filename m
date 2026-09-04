Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20244385D7C
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536267; cv=none; b=ZEFbm8hwEVP+EAL592tlovdzF5uf4JKBflBUEjYuRfvKtkCGWJdaCcSH/sdzHTTk7XnOhT7TQiCOHbehcmjNQFWIKUZ4MCGZju22NNNCQHZxNQfjSA0lhKHhmkOiNw+80uOIuj6XCarWPsi3RoOowuzbjsUh7naYw6+s7v1WnHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536267; c=relaxed/simple;
	bh=xuRqAUdvHsG4BxcDdfuXSf+SI6WrEN2MF8ZgZw7jyWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSRLfQdMADZQaQwz5/vlYLdPjpHwaUJIjMfh9GCPEcpzjPjAXZPvNyyT5vreqR8Bl2JtKEvpYsdHT8nLFnpvgAfr+Sd2AT3Ya91hzXqZiyvxH29ejLgUB7vPJZPD1Nksok9NKH138cih37tJ6eAiH5alDPRrru21FxrNFTUCJsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f4df360cc9so1394855a34.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536265; x=1789141065;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qKx60bz5SuKi9YOnfZ7Xh4JH5NN7Tn78TsaIHZikv3k=;
        b=BlCyIXPB9EgftXYbnPi97aRqBzTDPjt8nGWDZrwDfAl+UPLUERIITNgEpXT9rjxkUX
         90rNth8uirGJBxpeRLdFb1j9Xle+k82VZAVLDtsutLQa5nD/AEdnqLp7zh1YdmOYzKxv
         rGFHuqOm+aawF9TCNZpRe8/NNMr7fIW/bUgMcd3YSsaywW/+T4vJ0FWSwmYnv4jj1Dmw
         EFbmYozQVvILnzJVNLUCXT1FozlOS/f+2uqo3CBEgtN5WmQp4luBTniQoCtG1iUqzekF
         htglwWYNHe9zXw9u/H0Ty/cjCnSyZmffkDVbu3eKm13ZJaX7eOpdLQDxbUffHxv7HmyA
         55hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnlvtUAQQ6PfmCTiR1r8u8bNvUyTprm0gBHenPTtNfzazAqvGjZ2vJu6M4iNQPpWorN6PetU5GHozq@vger.kernel.org
X-Gm-Message-State: AFuF++mJ9VwrWX2rReUcboeq634gJfHv95H8+E+zDms4M4w5zgo/s6bw
	eVK59E4pqwsaGQJlRwuvVbmB+DQ04dtZbOOILJM1A3w9arOVJoo5t27K75OFo0tA
X-Gm-Gg: AYBFou20GUCqZt96gNK+c4p9JUp50N9LhsFw5HkfMC69PL9r2ItF/2qlwcwj085rRbe
	f9l2ZlbFPY4txqSfNXzKumdfQLjTfa7dEoPXAXI5OpSVOCXZAO2X9jqbhzIuyjUdm1/zyBJHriw
	Qw06diTvCUD4lhcsXIC84XF3eg8LRSyfazbzq993vGzdrLryNH35rDiajtF8CH6dQ21shLIixNe
	mafHNbLV6L0Ofo/SG07wUNmcMv/TnuYfmE1C8xOkL8tt6c8hA7s7rLxhxTIV2VGYU7Hk9Wpm7AA
	l7iQKDKeTamzZUcEA6CwSJQJJOsERTUK1VSbEJJY4jw9nJhpiUw+a46C0Kg+i/Dw/nZgvUl+JyD
	KWn3vNGS3+FIVrVL1cJp/+vRPnSOZDT0ELAVuC74aO7EfzqPL8CQp6wxrJclMprovFdZx8RgHLa
	kJuEmLDlfYP/HIUxRo7nyPqZSWtsd6pAoV1fnCEcNInURBAbJCp6jPeY5+42QNDnUcv7mQnnsO/
	ZkXXNaPYGUH//U+6M6ONhbi90NUZg==
X-Received: by 2002:a05:6830:6c13:b0:7f9:555:1df1 with SMTP id 46e09a7af769-7fa39e2bb76mr2404190a34.13.1788536264736;
        Fri, 04 Sep 2026 08:37:44 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f7aef680sm3269112a34.26.2026.09.04.08.37.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:37:43 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b1ba286f6bso1701938b6e.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLmle7oWuG3euLM+NwLjJBL3QWj/iQho6H+YnmH4Co9xv5CcSSTAjqOwL8WsoyUAWwWeybrES73tN3@vger.kernel.org
X-Received: by 2002:a67:f906:0:b0:744:d517:b0b0 with SMTP id
 ada2fe7eead31-78a2ef8049fmr2629622137.10.1788535775319; Fri, 04 Sep 2026
 08:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWn3BaY3EHeThFo34Z=69OaZb0FQ7Z7Ui9MczDGS4nBGg@mail.gmail.com>
X-Gm-Features: AcwNN1ViLT-nOz1SKiDYeBMSJtbLrC_K6YnJyCHi1MudTORPs1tGe-hfANcJPSI
Message-ID: <CAMuHMdWn3BaY3EHeThFo34Z=69OaZb0FQ7Z7Ui9MczDGS4nBGg@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0

Any change we can get "GPL-2.0-only OR BSD-2-Clause"?

> +       soc {
> +               compatible = "simple-bus";
> +               bootph-all;
> +
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               cpg: clock-controller@e6150000 {
> +                       compatible = "renesas,r8a774a3-cpg-mssr";
> +                       reg = <0 0xe6150000 0 0x0bb0>;

No need for odd sizes: 0x1000.

> +                       clocks = <&extal_clk>, <&extalr_clk>;
> +                       clock-names = "extal", "extalr";
> +                       #clock-cells = <2>;
> +                       #power-domain-cells = <0>;
> +                       #reset-cells = <1>;
> +                       bootph-all;
> +               };
> +
> +               rst: reset-controller@e6160000 {
> +                       compatible = "renesas,r8a774a3-rst";
> +                       reg = <0 0xe6160000 0 0x018c>;

0x200

> +                       bootph-all;
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
