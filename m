Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D812DCBF4
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431818; cv=pass; b=WXENuxwLnRDxu63hxJqqZ2TEfJffGiLYtbX0zbQ5TpqdoPQj8R62v4G5GwaJp6Yu11sy4jaX4urGbyJhV9+zoCPBHDXZDKHAqbPbHg5IF3Rf4GCQSegJSmXVJntvnWav0NTOMMtglSwmbuER+rN9Rwymz3FqyyXRUnAC6svS4gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431818; c=relaxed/simple;
	bh=ec+NdA3zHGUESIcSYiIluqbC7orAYPTkxLb4Lo7OT5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTESuZhb83hkq1LU7upgGgmmM6MBiz4LP1HN5uqqC1a8xpKkPc0lTsbs/gvDVGGa3U0Miye0a+WS5Lg0MYlXHnd5glV+fLKtVAP0QxTr1ohQgGe8DOhg1d4MEkHzmBPs5q88I4K0RdFEl5Pe1zejKZhgZPRMAN6ZgtFPkG0ys38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFYZZxjH; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFYZZxjH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b7c2788dso3101470f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431816; cv=none;
        d=google.com; s=arc-20240605;
        b=bNpM6FRbDcVH0UhHlb4N98L4Appe+kR8EN3VGoz20HGhyyFoz+zin+W5nKbxRu3LDO
         Ci9dLtCj0oLe7xs3cNrchY3RSV09Nqr/zHm9NxEWVduuWZh9wN7Exzr1Hg7Vb9YJhW2v
         czmSNd/ZtMgpTobGXIQfFYvktT2qQ5Tlyx0X1wMz3DPAuY68rD7HpZt4WvQ1VZiN7/ag
         IZD4lCDF5Q4Q6eH3IeSfqORcXTetawbiUKdGB8GKixntFVJPuycoPGedU8KsnYazeU7U
         wHzwB4E5g2deYlrYhTQqAiQcLSsTKsoSyrwssJ0ceA/PCjzYgki3QLzApzr2v9jIHAW7
         C69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        fh=jdz2cMBMkRePp+I8INA2NQ4c+ghXlYzaZfmXiNf+7NM=;
        b=ftSZHY6nlHetbQrRVQge4b4KAHqgr4A/Xq8u0fLmCQrJXv+uBf3cCyFaqmgbVKITBz
         6gVyOVMnLt/CVuVKY6dqrQN4yZfpYRUJO1EfznlWrfBkUqSVbaD3q0dNmz+zUbOif/bP
         ZrCPXKzjBXFqm5ljKiW3gVyhRpvaVEL10ydOWMxbriJc+0sFco8j9c9XbAJlNu05an9c
         FC5NYEKCPzgBKbH9zaEW4hwiO/f2RCBzl3ySUlNpmXhFH/revBNC4q1hz9kkl6r0b73D
         7MIPYMvRyLUm4ehAUSgGTbZdH9jqNsH5LLS7AhhCZfzJ+IRKYgJL5ZEW/aUI2YpgPA05
         2RCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431816; x=1775036616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        b=oFYZZxjHE2EV56fYMyNZ7a/ip4CWRTyYqoS1EJe27BLAdI2INxdFA4xFKi3Oue6M0W
         TymzRVtMz82pkOpWQhYOE8Dh6nF0yUYxF53KrIwCXUp2zWw3/RH4vkp34tqaNi7GPjOQ
         NHXudRZYiGb1rLfd+8Pp6zVQ5UdYbk86dbCctLqWIme6o2y/CPGe5TZu6nJ5Xfeed/Eb
         T2sKbDfzUTI/uqK0QWqnd4NF9/ai6tU1Wiem6+/GWQHximKph5OQb4HrfxYexeE1YKJh
         6AidGlxm4WvVvzWCkJwd876ODBVgkM693+4nR/swI4d2DnlALcnUTZqF9CUbodS+z6jr
         p33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431816; x=1775036616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        b=B2dzfONbfZ6PZlOwMVwlhgWAGPF7aS6Azd840WAOnzXZ8Bx/MY5hRGaE2cu3Zx/2qi
         hm0uMOt1kBHAWViCoc2UFcoRxuofxVFHAO/b6KjAZ64DmhCJD8X2/p4cOXm1Eq8uWGww
         Cg/D9qhq4dW7iiSlfHOJgiUewF7nJXQuFRWfIzqxMdQnYjkBJWN4MndvFHWU71lFRtVr
         Kzl+ftH7L6Ta9dNdDsBZmbwI+LOa/Kkp6mCcdyIZ0TzDwCgSr1Dr7Y7J2zmBKFhCL3bj
         CDmzCIXR4x6iWrOxkiRaHSCnpCbWUxAwqI7lXTuz9tOxrrw0nT9RR12S3rT16RGkC9qw
         pMMw==
X-Forwarded-Encrypted: i=1; AJvYcCXooiMjmlPL47cu9FJDPaBYdSf2NBfkXUl0Z44Xjl7n+nv7PFEasCGGK5oYDCrWDbMdJOvywmyVJCCk@vger.kernel.org
X-Gm-Message-State: AOJu0YwRxEfeWZ4k57UykwzzvyjtJnZe4BnFMOXMS/6ERX8k1rh3zkoh
	c9fcMwDES9BqOQCKvWBZ7hW7fKS4oKv+lO0KAoC3iV1cpMQfuBK1JZEWSzU3M8tetLH0LHnylsO
	TY8bhJSJuCdk/Bud4mwGGJ7OEgkdCB4s=
X-Gm-Gg: ATEYQzxB+T4voEMmsOzydhXGBK+N46/gP7DrNUXoOfYugQDAgPBiB5VhWYiaQrwDiXP
	1XPcDtzdB3sj50agGu67VfQ3qyHUuvos/MUMDjcW+kJMpgAjZA/5Q7ZXFYCF3rp+dd9vKvbBTHD
	JNow212foBHYL8yUtpbwN0WnW38OgJMAse6o5M2a4+iU3j60ZNrp5sEkEsG03LEzwbcBwowxBLm
	7Spjpozb3ENzlD6+/7s8/kIoILaWHkVPbMkZ4Vg6xKWn+N33WYRkgJ+pohfZeSlE8KxyLy0Vcda
	coC4s/5oKA4uv9uP9DVJ1LgW9dNswiXy7z3jO4tGUJC+rDeEoLtY3nuc7N+hN2w/mqdIUw==
X-Received: by 2002:a05:6000:18a5:b0:439:c661:3245 with SMTP id
 ffacd0b85a97d-43b88a05091mr4247725f8f.34.1774431815552; Wed, 25 Mar 2026
 02:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 09:43:09 +0000
X-Gm-Features: AQROBzDFDTBtO3a_1v86L3_iqhrOnSlLOGOv1FeNaTZhn03Rr9fvIwgKgyBVauQ
Message-ID: <CA+V-a8vbDvbc83TjHhmMMnCCeB++-B65wDq4aGti0t29t98BCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 10:58=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 watchdogs.
>
> As it turns out, it only makes sense for Linux to have access to
> WDT1.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 core.
>
> This change is harmless as only WDT1 is currently used in Linux,
> there are no users for the WDT{0,2,3} IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/clk/renesas/r9a09g056-cpg.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9=
a09g056-cpg.c
> index 549c882f9a18..2ff2935aeb0d 100644
> --- a/drivers/clk/renesas/r9a09g056-cpg.c
> +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> @@ -273,22 +273,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clk=
s[] __initconst =3D {
>                                                 BUS_MSTOP(11, BIT(15))),
>         DEF_MOD("gtm_7_pclk",                   CLK_PLLCLN_DIV16, 4, 10, =
2, 10,
>                                                 BUS_MSTOP(12, BIT(0))),
> -       DEF_MOD("wdt_0_clkp",                   CLK_PLLCM33_DIV16, 4, 11,=
 2, 11,
> -                                               BUS_MSTOP(3, BIT(10))),
> -       DEF_MOD("wdt_0_clk_loco",               CLK_QEXTAL, 4, 12, 2, 12,
> -                                               BUS_MSTOP(3, BIT(10))),
>         DEF_MOD("wdt_1_clkp",                   CLK_PLLCLN_DIV16, 4, 13, =
2, 13,
>                                                 BUS_MSTOP(1, BIT(0))),
>         DEF_MOD("wdt_1_clk_loco",               CLK_QEXTAL, 4, 14, 2, 14,
>                                                 BUS_MSTOP(1, BIT(0))),
> -       DEF_MOD("wdt_2_clkp",                   CLK_PLLCLN_DIV16, 4, 15, =
2, 15,
> -                                               BUS_MSTOP(5, BIT(12))),
> -       DEF_MOD("wdt_2_clk_loco",               CLK_QEXTAL, 5, 0, 2, 16,
> -                                               BUS_MSTOP(5, BIT(12))),
> -       DEF_MOD("wdt_3_clkp",                   CLK_PLLCLN_DIV16, 5, 1, 2=
, 17,
> -                                               BUS_MSTOP(5, BIT(13))),
> -       DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
> -                                               BUS_MSTOP(5, BIT(13))),
>         DEF_MOD("rtc_0_clk_rtc",                CLK_PLLCM33_DIV16, 5, 3, =
2, 19,
>                                                 BUS_MSTOP(3, BIT(11) | BI=
T(12))),
>         DEF_MOD("rspi_0_pclk",                  CLK_PLLCLN_DIV8, 5, 4, 2,=
 20,
> @@ -571,10 +559,7 @@ static const struct rzv2h_reset r9a09g056_resets[] _=
_initconst =3D {
>         DEF_RST(7, 2, 3, 3),            /* GTM_5_PRESETZ */
>         DEF_RST(7, 3, 3, 4),            /* GTM_6_PRESETZ */
>         DEF_RST(7, 4, 3, 5),            /* GTM_7_PRESETZ */
> -       DEF_RST(7, 5, 3, 6),            /* WDT_0_RESET */
>         DEF_RST(7, 6, 3, 7),            /* WDT_1_RESET */
> -       DEF_RST(7, 7, 3, 8),            /* WDT_2_RESET */
> -       DEF_RST(7, 8, 3, 9),            /* WDT_3_RESET */
>         DEF_RST(8, 1, 3, 18),           /* RSCI0_PRESETN */
>         DEF_RST(8, 2, 3, 19),           /* RSCI0_TRESETN */
>         DEF_RST(8, 3, 3, 20),           /* RSCI1_PRESETN */
> --
> 2.43.0
>
>
