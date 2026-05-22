Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4470451044
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779462394; cv=none; b=Drl1IT3MQ3qHbvn+3qip8MIaOluPCH+t+q+Eob/1biuDEsTe8c99s8K6DVqJ/DMGww6ZJDR3/yL/eHzKQ4gAmj0NkDhYpdRkZ1BwOAYnTBiRmxFomR3jZwUlRHXoyO3XZAVgrzXoUa4R1W2FmwZO9T20Ey0HZmaUu0iCTjFlyYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779462394; c=relaxed/simple;
	bh=YgbrNtiNRiHgnehgrmKfGsZ1TgjusTsRTd7TJPZeI24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8bjffJuGXIenuullw/0D4tOZBsoABhXKBsW1oQ8njRerQ3GvBVLiGSgwfxE8Ox7a9NqkoWGtAVh9MymtHwPgwzs5oPmQl3q5yok4mr76yQ1oV5SemM8zfTpfbtmRkm/STyPluBgyecNTKOC4nyqiu4mzwlH0g4bYI5d74+cr+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bdce61897ebso152651466b.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779462388; x=1780067188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D06wucBqM+wFrpicTrkexcT3qxrusKHuYyn1j/Vyqhs=;
        b=Cn/DSXOKolvv9YpYe6t0VcaBVMb8VXVcIlfDC9Uv18eLkAy+NGXC7fbGYz7ruyoPhg
         NNAP878Ti6314DS/OWej4SXxIrZE/FoHoc6yxO2/3iDRNmO8kFESbaycSHQao1QvquCJ
         2JlcSM/LhAmKeNpoSnGskxRjOlV+iV3So1TTCOOD9fX3i/redoygbF2nsuDFwbewGxgW
         fda7du7wIhKfQk1ma9GkQQYg/qmSFSXGFbrOukFkH1BVFEs7fzmMTxEzTSwAMZ5/Vlaf
         u4qUSczxh08D0/2ImEzW+hXGmTjZ/i8sJpJhadhb300yvPmT67bJXe+QVM1//GvQVHiu
         P1CA==
X-Forwarded-Encrypted: i=1; AFNElJ8KdXY42VFnzpe08G1i2mbLl+5tJamtjcpeHherd4cbZClCTPwEhT28Bvr//dt3slxY7FUIpABATVpe@vger.kernel.org
X-Gm-Message-State: AOJu0YwxceQBCzjDQ0HzGSBdPQFAOYnqRXAQl9LJFspqLAPfsvOnpn0v
	mpbzKeTZb167AbvBKQ8EO10bg1/DhekTt60YHa6FF92xjGM8eKY9y+yxNlgd4j5Vi9g=
X-Gm-Gg: Acq92OGLFMkSxcU8OuxbWJFQUf+Y9pBwPb3HEXGq8ulaRvWHlv3lqJu0+XxX1aaFJR8
	vaiGXbA542cVTktjQOVV/mJD3loJaicIwyMFE4MucdL4Q5tF3Y799NYjsS/jTTgrIBRD1WR4Fjc
	pWBAw87aWV2NIjPYIcCfbofWcfbGOqSJu7ohI8u+ZphwnHNmHWS/7rZg6KKRnhpTGX+4xMmBznv
	UO/JKVtGk4kiScgvwBi2qusQZnbgRKqM1zerqsR+8t6af4fmIvGjcjWwMWvjmxXTwD5sepUDEz/
	VmWhD13bz8sOKdQcp0NhmCkhxgLe1JPYffF0RqUB0RwGfKqMTsQL7uT/rIRudia1J2MNFduQzW1
	IPMG9mN8uHEN9HNwWLWzkHcPY6u/Kl9cflWZbm+txkuxma1TbPRfPhRmIHKiSJkYDHb6w/FCk7M
	CSrezVXJDyLKPZktzvHbe1QAKvs8ioQRG6mIQ9u4UzThl7UsX4jtlm502EA1FFTwbxoSVWeDI=
X-Received: by 2002:a17:906:cc4c:b0:bcc:3dd8:58da with SMTP id a640c23a62f3a-bdd276ce8c8mr193347466b.27.1779462387344;
        Fri, 22 May 2026 08:06:27 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc68e0ad1sm63635666b.60.2026.05.22.08.06.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:06:26 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso9472347a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+pGgHdVRxT05iBfcYNPjb8IV9lYKuindE8qlHyD4KFNeUYDHGyKONim8UONAvHPSztehzDES1S0OYn@vger.kernel.org
X-Received: by 2002:a05:6402:4348:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-6889c406b3cmr2003869a12.3.1779462386158; Fri, 22 May 2026
 08:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260501105116.33452-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260501105116.33452-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:06:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5K+yj5pwsnMLoKC3uJwoGMVLFYnmhParV0-XYo3utGA@mail.gmail.com>
X-Gm-Features: AVHnY4LFy1qvD4cKf2yzXjWCfrZHxrepOR8pud8zw9yyGXeJVwOrryJMo0mRUKQ
Message-ID: <CAMuHMdU5K+yj5pwsnMLoKC3uJwoGMVLFYnmhParV0-XYo3utGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add PCIe node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 May 2026 at 12:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add PCIe node to Renesas RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
