Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAE3AFCE4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156466; cv=none; b=b90tByRhofq7CwsgI52HLMiF+O4uFpz10Xv2xuwo89C2zE9nEaXyHemc6Yiqz027TduG6XKnN+k3C50J5/CwE/rI6583053tBeLCRCmshthiHUphucvs9wKhb2sTvpBwy25ghCUaGM6yLROEwk44VIbx1qHSEWeyPH+nhMymGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156466; c=relaxed/simple;
	bh=wHIiCEgdZtfqmIfAflpfV641BfeO9lzUS6fjDGeRjIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fEnb7RdWQnYFJzPxwceVjTXL+xqINqoA7O0sjMbCvjCYjAShAoMUfts8WIHy0fLNiDK770pWVAOSCYp9qZZTbKkZ6bvhSzqj12haSV4FNzJrs9UJAVDQMgaaKw3bM62LUocLqeRqC/hes4KPoH5iJRgT4DSqVXNph/x+SOr52B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-786c3d55c99so230938137.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156463; x=1790761263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nr90W5Fnz0vjayQ2rPJMI4dvvs1Oph2WPp0m5lztwRY=;
        b=A5kRyiD1YmXX2SA0AuTnTngfEHiuT2Gzit8FdIbAVhvvnuIcOHxrZaPTAvQry4XQmb
         D5F+S2FlbpZHR6GKVxuo20xacNdYE4BYgWAowMAwTvgasilZie4xr2R31XvqogW4gaDM
         GwszcWt254K9DJMltPo5SEGiI8ssRcweBhljgJWXE0QNGmr89bTV3E+weKGYI/quW7qi
         zDy6TT556iucDAqCLYP73IZjoFCrDw/7s/XdZb96/M3k6IHRNDyioEYiziSatGpmd5mR
         4tBBWiG00mJw0SyqB0UFDUl1szsLW/Kw96N27JJXgHVQYZPK6m6Ah4AFeEpe88o2HJvl
         euzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwas+cVb1Cb8GSJ92iyVQvV852O5GWkbob0MD12kVd8ToV38FeabNi/k4OfIurmFok9obwHoEDXI0f7@vger.kernel.org
X-Gm-Message-State: AFuF++kwED58tnx7RVqzTMRvBV2c2hT164X9zTbhX1HV3MkS+qx4jYbG
	wcvuV+/5vxRo/oKUfW03ZX/muH21nhA3you5Yf41orU1DsG6+SAHjuyPVjm6JALZk1Y=
X-Gm-Gg: AYBFou1W7tEkKU6qKVEqc/5e1SC1OxlKqilqSr3WPt/qxg/9mOB/JEH+tLtTrcFnsrc
	vhC1EK22NO61+0MGX/18jHXaVobbaD3/GFQhXjiawl5mbSa7oEsJ93wR66m7VyVkiMVlitYzyjE
	ApzpuzRsa6o7d8FEjHLt0j7k1+5+2Dywr4DbamEDh4YlCWV6pZytnYYS9QsADMZO1w2vOMf3BBl
	y9JfkNZ2oLHFwckIt+ySKSQVLpr3B9FekDXeA7d5R+VPAty8SwyFOQoqbPjLpmzuWjMcQQrotcj
	2HbvNjpklZPjSMq0wtePo9XiCdI9f8rYHNMHy8OF7E/7kkUlHZtPGDLnD/3OMd0ji1B/11IFFou
	lUwvorzqhEfY+aZrKm2UazykRKdX8HOnWmtRa3fEgQSvf2SAAP4aqfd4gQBS6aooeijpGmbHMkV
	0MpiD/wGjiWAin47ScoWjKdKVA8UXxdUYj62XF0S3x7DQ9Oxfgm3nJ5adI8+JlDl/WKhPZRdw1K
	xvLBHFoQd7iWTHMLd2ip0E0TfDQh08X+AnjLcdOif8fBvk=
X-Received: by 2002:a05:6102:578b:b0:7a7:ad9f:53b3 with SMTP id ada2fe7eead31-7ac0ca164d9mr1772284137.9.1790156463492;
        Wed, 23 Sep 2026 02:41:03 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5a7fb17sm2840175137.7.2026.09.23.02.41.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:41:03 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98515937bcdso455606241.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgp1SRmi5ZAulVp2LezkdyMQ77uQGufh4kC1WYRfKziBY2qlgkcmZ3VUVzJ6e/erQ3u1WwX7wZnZGs@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:7a7:69a1:add2 with SMTP id
 ada2fe7eead31-7aaa0708f72mr5644581137.30.1790156462933; Wed, 23 Sep 2026
 02:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <15cfcb44c2d6b6e03b5c3d0d5af8ed997c4d179a.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <15cfcb44c2d6b6e03b5c3d0d5af8ed997c4d179a.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:40:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw3vsV+rs0wuYbDmLpA_EXWZAKtpoP1ZXTY6Xt_FPLsA@mail.gmail.com>
X-Gm-Features: AclHuK-4kOrbGKvyDLh28vAfMHGiFQCwXQMIlG3sAkDSk9boruM0x-6nSZuHeBU
Message-ID: <CAMuHMdUw3vsV+rs0wuYbDmLpA_EXWZAKtpoP1ZXTY6Xt_FPLsA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The USB2.0 wiring on the RZ SMARC Carrier-II board is the same for the
> RZ/G3E and RZ/G3L SoMs, so the nodes belong in the shared
> renesas-smarc2.dtsi. Enabling them there breaks the RZ/G3L SMARC EVK
> build, as the r9a08g046 (RZ/G3L) SoC DTSI describes neither the USB2.0
> host (OHCI/EHCI) nor function (HSUSB) instances:
>
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:94.1-7 Label or path ehci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:99.1-7 Label or path ehci1 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:104.1-8 Label or path hsusb0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:114.1-7 Label or path ohci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:119.1-7 Label or path ohci1 not found
>
> Add minimal placeholder nodes carrying only the reg property.
> The remaining properties will be filled in once USB2.0 support for
> RZ/G3L is complete.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
