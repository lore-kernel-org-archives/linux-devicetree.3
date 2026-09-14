Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500EE47F2F3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406953; cv=none; b=TBNBBxoMbMMe/3DMdpW6wBrgnSRUm5y0bUHmZWLL6va4x1CJXRaI64BvSbX58gZBhCpG73tj+fqtIBax5ROYj2vQ62Vbhc494Z2t5AggaZiBoZXSDvRh+Hkap2k6I8GxdwsTl7xzExCJRn4tOOvtc5I6ga5XyU6hS6IA841y+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406953; c=relaxed/simple;
	bh=L1VXsdM/kax6rRlPlpjSuL9HfeLJx9UTWUqPhEH9lWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPg7oZA/o+4SmbZlavh6PjyN+Hxp3qiLlHkWxqDnIpBNsNogi0Rz1w0wP8S9893q5VkaDN8wyv2Q8KVTtZj3WPIi+gLg0S3G8psrc5Xn9XkNsFhMHo+aoy+P5ao1Q/bN1hI+qXgZCKcDHHS2bdNlLTBzI4RIx0OdWdrxGDKdQOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso1101975241.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789406950; x=1790011750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FY+CeR3ViFOh1Uwf42KLiS0O9XW6l4dUqQ0DH9Ddl7I=;
        b=J9SBtZBSOyNJZZV+PD66AbnxsrhVBWNTkR+nyUmfAv8l3rg7GUFXkWE9+lkDj1UrHo
         QW6jTqzmgNJGFiGTGWtonHmSnjoREPDsI4sVnLV/9k/WwePMi78iHTHPWhl9VsuP9tK0
         Do1MEEgzASgvU9Sss4VMn7xBIOn+bE57JMpFI7J2n6WM5exxgsQQ3Be0E5u+m5MUw0Jx
         RqKXpRZEfQBPzI3QZKqH0cg6d2M9obtVsnm3LaMhvjl6qX5kKuNwLGfFP5rMPSrMQmcU
         9bPaKnLEf8Bqk3aVi6ap/SyIE4vNhhtcB2vPn0i0GJJNybKYABXwZkrUhxJmQusoF226
         iirg==
X-Forwarded-Encrypted: i=1; AKwUvByI1yNbfrToyoS6WNawWf1jCGle9TVUJIbpPXnfxU8pR5VoHPsVOWZFzOWXi21jkl9zpDiea6Bz7HqW@vger.kernel.org
X-Gm-Message-State: AFuF++mkdhEuTYtGV40uuPCSTQBiO9zwqR6SEkOMua5LWW1DNpJ7z32A
	JAGRqYkdgxXdAAxNqPujMwUw/PiCHzjYU5J4YV/0GxqynKOAAW5znTw7Boj6rXOZ
X-Gm-Gg: AYBFou2hHLPmVAeJT0KGVmQjSMRGl4swlqnE7w7rrG3U00gdwrHSj0VGKeBn6D9jrDH
	NZSnTpSBQe2Uw4WK8qXwqCCRzfyeaWR8F+kyN/nJtrb/G56XCed7V52nHUIvR0hegXdYt1LdZhv
	bSegFEXo9DH6qrOTaSS2t4aUyRA5qxc7QK3LZ6T8kKmXq1RZLsgQKaBpQGipky9L28RbyLrH/ce
	dHObwd9mdkD8Z8NkDX23TwtUVT411wUFzpSd2jEeIWyID2DQO2HON+FR+C6WKX0GdDsCAX5A3B9
	cUrdlg5RLaul/C+YSADvDiB+wJxXJH78ML5S/EJq5A4Q2lDm0Rxq/VJu0yKAZaf4kyCQpoM3mwF
	tdppQpEEIoJjvGVgw8QiNZOaM+9jTQcLuJiAKpwfjIL7T5mXXAj0ffith5xdL9kpPf/jSgNv38L
	b0aoRbpZx1dabORG9YecMl5v7EhLj0ZdNkDCiVoHVjHufY+69DCKufJOsLdlLpkTJ0OvTiQXuo8
	BSyckDRsw200qgr8PePPWXL/XJYPMfBgTMC
X-Received: by 2002:a05:6102:38ce:b0:785:10ea:be93 with SMTP id ada2fe7eead31-79b57ca27eemr4289041137.4.1789406949785;
        Mon, 14 Sep 2026 10:29:09 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927ed7d0absm10905978137.9.2026.09.14.10.29.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:29:09 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso1846708e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvx9KnMBnS7PPr/j3t7B+57g0LRtQd+bsJieMu/AfBjkx5XRW3gk8QXr9sI/4QhOikeRO16CPKjM5z@vger.kernel.org
X-Received: by 2002:a05:6122:6992:b0:5c8:2c83:9cb with SMTP id
 71dfb90a1353d-5c981abc29cmr5328408e0c.2.1789406948981; Mon, 14 Sep 2026
 10:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:28:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJ63Bdwx=+6M-4HhsJuY2sqodh5cpxSMZfWpoUAnEhHQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xc60GOOHQBIk-obYhOrWDLq9jmMnCcKuxJsWOoFFbpr-LREz3rUfzZ1C8
Message-ID: <CAMuHMdUJ63Bdwx=+6M-4HhsJuY2sqodh5cpxSMZfWpoUAnEhHQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: renesas: r9a08g046: Add USB2.0
 host/phy device nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, biju.das.jz@bp.renesas.com
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso, Biju,

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
> the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
> both ports.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi

> +               usb2_phy0: usb-phy@11e10200 {
> +                       compatible = "renesas,usb2-phy-r9a08g046";
> +                       reg = <0 0x11e10200 0 0x700>;
> +                       interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
> +                                <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;

No clock-names, while other SoCs using the same bindings do have it?

> +                       resets = <&phyrst 0>,
> +                                <&cpg R9A08G046_USB_U2H0_HRESETN>;
> +                       #phy-cells = <1>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
> +               usb2_phy1: usb-phy@11e90200 {
> +                       compatible = "renesas,usb2-phy-r9a08g046";
> +                       reg = <0 0x11e90200 0 0x700>;
> +                       interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
> +                                <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;

Likewise.

> +                       resets = <&phyrst 1>,
> +                                <&cpg R9A08G046_USB_U2H1_HRESETN>;
> +                       #phy-cells = <1>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
>                 pcie: pcie@11e40000 {
>                         reg = <0 0x11e40000 0 0x10000>;
>                         ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;

Looks like U2H[01]_INT and U2H[01]_WAKEON_INT are missing,
but they are also not listed in the DT bindings?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
