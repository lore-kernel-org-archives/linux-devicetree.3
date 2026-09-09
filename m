Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C835540AE
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967885; cv=none; b=hYgmEChDAQ2UZmAZ7Y9potinsvi30EJ9B1poOatjFiZA2h2nJiqQ8hYa0OQCVEP7/drl0VlNSWveV6tisYcDETASgxPk2abV+5SUYEzAOZQ2vWBP26ZivtcekfAsWBw1DOj66EKPZqbJqP5hGRP5GmqBecDWJ3YXQxo0BvfBS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967885; c=relaxed/simple;
	bh=cWd22r2u/Sd1yN7AwMDP27IBd84axRoEi/2XAth0xWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjrttiz/Zf8tSuKPkLBgCBEa/2iS5Tcl4btchAHwq4rwyon6B6bo0xf/YBZ+vW8uYmpQe9PDWACbk6x9SNKB8hWqWaXzJfU4eph2lVjkdBFA9I1Jt84T2QIr/rPI9wgQPvl7VVVSg10g77rSkNE/QvkNGUyl+Nr6ig4GKU05k4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a6c77d255so497168137.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967882; x=1789572682;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NEpc/1/47AsHfaTxY/tAR9B9xl8xB58wnw6vmMA8FEI=;
        b=fJuLoyMziduir5dUjuJ6KBjYPSVxO93EtBoWgfO+0a82rCJX8WDaYJ6M+894C135fN
         Im1VEO5/sCygnbX/Vhi/dDDwdXIOnvgGzzJ7AurG1gpP3dQWN9OMiWbbzv6Tre/MHmOh
         QCcfAjMLhK8pmqCmWHUmzY9AhZ4xiNo5peGypKmHflcXktuP9rlqzXFdf1UicYBkEZTR
         L7tyw6zvR4q+l6422pdN2dkvnV79F9/bxy9mqSewW8rIqAbPfYgBKBfHRVDJ0a9kLbZO
         ggHElXqsunsaLGwpMMEBu2SMX3looYOJcWUMgM9MZVNtvTXjfDbW4CKoWipmkwDuj+w1
         JWqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzolT17On6D9Z8YMQs1ZIsuq/ztrx4hjWdN6amEr9JYsgY9ljiH3clwW2g1ZqhAaJju4BKH+lYSQhH5@vger.kernel.org
X-Gm-Message-State: AFuF++mNzNqHF4v0kqnWEAyUyw2u6Ld6IkDKeTF7a6Yqd4KLIf/SFs5C
	sv2gFtbh1Nr9Edt2CT+3hH2KEGf36O1ZxHSfgVkaXwq8yoeaEStoinXJexpi88h/Ml6qlQ==
X-Gm-Gg: AYBFou3MS32Ts5SDMwDm0QSQtCMDLKMHpcayYtSvro2kmG14H/YHGbVayL+Jr2H7LTr
	XM4tCRCRRyQVbv3rhhp8GQSMCZEGQElojam+J8fMZ8z7TxT5X+O5DhEpM0hqRxO0WmhmY4EY+l0
	XEJKiFjbdzz0SY4E5D1xLCjdCa/khBZBU6EAAFKWEpfhxDBSpSHMOUcFpXYpieJDfSsDdAIcDS3
	MV3rL+u43tmF/GxaSfCBpQZxtFKKP4CMqoQqODILDDT4CtFCFqiolz+YzDQfb9Q3yb6yLw+JYrJ
	HRh+IQVEsvlk3OPpgDLiPVv9NGTeAjSdz2/zuogmfp0s4qFX1gio3tC9L1dHKUb6Z3vU3O3yM8Q
	jSgQYjcCTP/TKLVm8LKOmOZXWwitlThTv2j7gopDBEeTDLljNDw9DWhAGAiNkZEVTkZbegjY+Pp
	1sFXcFL4Jyn0hH2iuhyA26qez1sOiV4ti/rp71mpNoIDLxMg+weJBrreY6cV30KuNyKTEKIA4oD
	G9cdgG0aXQgN24ftCFD8nL0pLvsiN4QcYQj
X-Received: by 2002:a05:6102:5789:b0:785:d308:cc0c with SMTP id ada2fe7eead31-78f7423f6b2mr2654085137.5.1788967882304;
        Wed, 09 Sep 2026 08:31:22 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478ad217sm11026644137.2.2026.09.09.08.31.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:31:20 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso420306e0c.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:31:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxHZYJ/hwTd3dx6ttEiNjghbep5EtRjKtwlfSA6MvntgJzCxcRT5Y48Df6YQq1jtwQPN07AOPwepgy@vger.kernel.org
X-Received: by 2002:a05:6102:8095:b0:783:f3bf:f9aa with SMTP id
 ada2fe7eead31-78f757d562emr2534584137.8.1788967879800; Wed, 09 Sep 2026
 08:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:31:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
X-Gm-Features: AcwNN1U9fr4mtgt5B_Ox8jzqkFHdJzcqPtQLtvvJUBaj2_brnmaTf7bMLwSgx_8
Message-ID: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 9 Sept 2026 at 17:14, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
> Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop the unique spi controller node identifier
>     - Switch IRQ to active low
>     - Sort compatible and reg properties
>     - Add "CN7 pin 22" comment
>     - Move pwm1 node to the top and add comment
>     - Rename MSIOF0 PFC node

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

> +&{/} {
> +       /* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +       clk_can0: clk-ws-2ch-canfd0 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       clk_can1: clk-ws-2ch-canfd1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       /*
> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +        */
> +       spi {   /* SPI_1 */

As this lives at the root node, I'd rather change it back to
spi-ws-2ch-canfd while applying, if you don't mind?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
