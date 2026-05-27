Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184453DD874
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898006; cv=none; b=YSmnR0GPOj8ZDPywMQF8lHpoU0GpQ8LAVCq7T70QDq9g1yy0IwTEga08U3aTEnaaDqXf3VYzlrmXGFuE0tW/v0FMWt6BSk8Na347yRyIlZQL8L+IWlBX//C85iv7SWhKEWWi2p++nDXJKXJH9+kZyGRHY8h6eP+LVPMS2FJ/fpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898006; c=relaxed/simple;
	bh=ObrvBFWeqclDYasl+tmaJKbnDxhvBFySewWW+htBTnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyJ4nTYpeMxpN2trU00j3VmQ3YUySqYp5E0NQUD5aBa8h3PDxB5hCs7NVQvXFXX4eC0XycL4N68MrXeyRz6fIgC2jttvH3nk6qgbUEbCk1RCf8xOOvPHPBtSk9FMQp888YTARwu+qJ8c37Yc13VtrH9aJ75KK0Q392s8m8YGpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-577500ac0e4so3782549e0c.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898003; x=1780502803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtSK9PEjPKljQj8hPBO/zK16lMhTU24eNaBdLDJg+P8=;
        b=jXQaZzNKf1JEipgbX5gXLsDCwvIGTsEFnWngqsS/boC5yNDV2nXi9CuNAb1oIjZdDX
         l3bV6sH30F0883PVYtT60VudN7EXtZlQ3PDmLxR9duPCYUq7m21bETK8RF1tduuvBFNF
         6En+/Im3oUeQpdygK7ikRCuNuPN80oE2cow5XL2YQjH9C0PynNwQbSX0t9uq/6BUU1sz
         1PaWQTx76cxNkWeJUX/V2zwYaxluL769BcJTU0XCb1bzwbp5HhRCF6bxO7lJRTr6NqzP
         9LKLm1ibGvi4L33tAHXktn18t4fwswjrdAtjWSxJaFJzV5QUPXqZzIVdNlvo015MXnBv
         bM0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8VnhbO63DFNYTlGF/Ij0LJabDrP8zSGkZaD5CRWm7xcVrygpF+8gKTHvB+aZV+qgv85+leG0SCMY6q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0D496in6hu4hMTkdrPypaiYl1ny2cqwoPG4q7uzPBZCKfg/Us
	k0yD9SvFYH1gJEyjzzPBPOIdZ8RWvhq6YB8D12tgDqVrjFrZm5bFxFMiCItg3NnwoGc=
X-Gm-Gg: Acq92OF1UTzCnT3mxXzA8MFl+2oTauM8zWpDYUG7EMhXXd+nixoUJ8xFHkbWxeyFjBq
	cjU6Oq6/Q3B/V6/h16DUQW04PlYbT/dxvJHa8Ej+fz8C0WK5U964FFQDQJaIq3rGsYCpTXkokZt
	v7xLFiMa9gzKMWy8JUVdaSMBY05adDroMFBheGWjXNUZkLBkHplovjNfXIAEkuilyrVgbELDTM1
	68j2viC5++pdGa+nCfEKkXHTEHz0zM2O31Di0IndaSoxnQceo//YXzsZeTBms9PRV4u6qOz9Ur0
	+6RSNiIXkYB4RJHAJGJf5YFy/gsxcj1y4miCo7dm3sFOIh17+zojWqv07KOd12yz/cnvtc4ALFf
	RNo33NEOTPZ0QbPomaxoeYGwp5NeD3tViMrnMb46qfJaBA0RHUp9lQMF+w/6hkkzY0NGwtvGP56
	IxhfAFQF3qZl+zYQqUFNbMyYUSz7j51DsEFb7SeM5NTfPHb80mjT6VRS3Gax8ggQFpkzAwZOZiv
	ug=
X-Received: by 2002:a05:6122:905:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-586626bb34dmr11993987e0c.14.1779898002695;
        Wed, 27 May 2026 09:06:42 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-588c129cba5sm18404598e0c.14.2026.05.27.09.06.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:06:42 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57602a2d80aso3854286e0c.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9iEU3UFsu72yXDYanQlWMTqt1RYtHe7XUJeuvATXiUy0Mx/Lrr/PTKVyJJfZjlry3qmworSL5K9MLL@vger.kernel.org
X-Received: by 2002:a05:6122:168b:b0:575:29ef:7e13 with SMTP id
 71dfb90a1353d-5865d70e96dmr10995354e0c.3.1779898002106; Wed, 27 May 2026
 09:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 18:06:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUu-wzfCXFtDxsJmvjkAN49DqFJYJxn4iA8gWGopzkXuA@mail.gmail.com>
X-Gm-Features: AVHnY4LqSGvvqOc1ewHl9xuhnSFb-Wd7ncAEKHhvJSt7cL6CXvH6eBl1eAcES8c
Message-ID: <CAMuHMdUu-wzfCXFtDxsJmvjkAN49DqFJYJxn4iA8gWGopzkXuA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r9a08g046: Add audio clock nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add audio_clk1 and audio_clk2 fixed-clock nodes to the RZ/G3L (r9a08g046)
> SoC DTSI. These clocks are external to the SoC and their frequencies are
> board-dependent, so they are defined with clock-frequency = <0> as
> placeholders that must be overridden in board-level DTS files.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -14,6 +14,20 @@ / {
>         #size-cells = <2>;
>         interrupt-parent = <&gic>;
>
> +       audio_clk1: audio-clk1 {

audio1-clk to follow node name recommendations

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by boards that provide it. */
> +               clock-frequency = <0>;
> +       };
> +
> +       audio_clk2: audio-clk2 {

audio2-clk

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by boards that provide it. */
> +               clock-frequency = <0>;
> +       };
> +
>         cluster0_opp: opp-table-0 {
>                 compatible = "operating-points-v2";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
