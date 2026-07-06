Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256A5317177
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332844; cv=none; b=FIUa84a+PbvASnLJzowPbd0Src40ueV6XBo8uYgYn46XBOocvKuPFvbB6+KtBNbdEAQdafrntJiSwOMHOZ8iJuxYbFoln2pNYveS6LoGWPGLJahbd8VeUY/sUfamqt2yT/+7oZEHPMZU9cUze+GTLn5kCrBPn/9M3V3J5CJaMBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332844; c=relaxed/simple;
	bh=OuqZyyZKufM5tKG1k1Tw0fhDCDN6LUhX/VwEzqtgzzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0JrPmBQw+/yXr39AXpqGRsE1WHQViOKIhSoIbMfRb3lnG4GRXXCntkyN0aRfgMBHcKTz9imIrysIWgF4ohpooVOJg/Fg1uYjXnDwBi5fJUPfUuLqzF7/ldaV00nwR7Ykx0IBkC2CTwwBYug+gUghTX/MGEDXbxPkiB+60O4khg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-845ea8924a2so2778553b3a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332842; x=1783937642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Avfylhoyx5tqif2j0s7EGdPplSscPo8mEJ2UKFsFj5Y=;
        b=Si08zpV52Wu4hul/bYBFTve8VLx4RPawGIpwpBCjHm6Id2L91wp2cxgRc8s4yuQ/0Z
         KEZ2LzhvJZUwJbaJ81TOJl+W3hjE5yRMeI1FFPEMnyO5MDUiOsQgNXUMZPw/ZFPFGGls
         t1ZakFOQ+oWnA7y8NWl39Pwy8r+1Yj4ShIcffLqkC5BgihWSKB7WFAxuXiIzmiffSw2I
         XzPVyJYBHcRmtazIRSWqzqpTYSHNYGaxcXZ07o0aw0Gc0zeMyAxU94McilA6HYs/e+8Y
         dO7fT8Z59agnagrpEI0cKzVGXUWw8ZVLPG64P6w1CKe2f/wsKTWS4CsG33KEx/Q81diA
         Jj9w==
X-Forwarded-Encrypted: i=1; AHgh+RoAbHMVt7HSjwAdwxGBHRrnixx2vCclClG6uRhrBlDTduj7b7zWJyuhgg7Klul82EG+5hb7yQHNWTdX@vger.kernel.org
X-Gm-Message-State: AOJu0YwE45NHSTtzBPToKCDpF4MRmZMX3JvRa+3z+YDNsBxQN/4vQWmW
	fx/tulFrX3MpCbE0FuOUuauG4AtyAqt/csY97nzJb70x/vLRz2qSwLvHZN+WC0/v
X-Gm-Gg: AfdE7ck0Z9u0Eljh2I3mN6XWov3XoZXE+xASYgnnB4EdBcK1DbndYabP1sH6ANw68+o
	rPeKXw/4iw6IGE4IO2xvSfs3qzLxOJtvDM8Yim+K7iYMcQxVWkiOKV/eQIIOUtRQsLrJceB70ME
	0WQzqYMAaqCzb5sJPeVlc3kt26vVHKp3fMkmIjxm93zE2evHKh0kaVMihxkzZgHGv//wT2EFXSB
	A8NGmOSycDEmS9VFAjgNPBzqs1/zfhh2N9Hm/me01f2OP8kj5xJVxvOGYp2HDb/DkJ0SqTAc+w2
	0XlJ5D3xe7R2NbDA0KuRk0mWqCefiWPMaR0Jv2jkDG8U/V9PCugYyCcrmu/PkA4PqOdGzW22FSw
	kmbDR0Kv63wRgouSnwIt0rn3whjbFLic6zlf2P9nd8E1JrC1/8VNOj69PHPL2unFVaRc/LCYg3D
	I1vy5UJIN6fZNSQ/nrnqXTziby8Oqs8EIqNl02ahQVnPdmbQa02dWryw==
X-Received: by 2002:a05:6a00:94c9:b0:847:8c4e:1d5e with SMTP id d2e1a72fcca58-847f6f90298mr9338869b3a.56.1783332842378;
        Mon, 06 Jul 2026 03:14:02 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm3500841b3a.38.2026.07.06.03.14.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:14:02 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso2035153a12.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYocYSe8sH5pn6W9aNMwUe3eUy/X32vxgYLV51pRPgI/tJuu2PNN4l1bJ8cpKK8I3I5MCYcTmiEYKd@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-7427f7c09f6mr2718808137.27.1783332490185; Mon, 06 Jul 2026
 03:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 12:07:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
X-Gm-Features: AVVi8CfVUZe5-SeycxEAnrifXns0jujcFQ6mtVZEjh3x46p1vCjwJsZir-4zskQ
Message-ID: <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
>
> The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> low-power management and access control. These blocks are defined as chil=
d
> nodes within the Clock Pulse Generator (CPG) address space in the device
> tree. Implement support for creating regmaps for these SYSC blocks.
>
> Register the regmap using of_syscon_register_regmap() against the CPG
> device node so that consumers can access SYSC registers via the existing
> syscon phandle.
>
> Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> initialization of the SYSC regmap.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Made use of for_each_child_of_node_scoped
> - Moved sysc_init() to the end of the probe function

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> +static int r9a09g077_sysc_init(struct device *dev)
> +{
> +       struct device_node *child, *np =3D dev->of_node;

error: unused variable =E2=80=98child=E2=80=99 [-Werror=3Dunused-variable]

No need to resend yet.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
