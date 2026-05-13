Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD5284880
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678001; cv=none; b=txoYUDeI4qZcT1ICr3tEIIwmVsraiRtKaVed7/YyAinSMferIzC2Oxl7g/rDkFn7GtlegjJR93Bua/xEFn+r3F6ecz6j7dFi/5mseAOks0YQGSaT2nGmS+AbUopR2wihhJdschO/zwaO73Mau3T2yMSf5ZQvixfw+nWPuyZvdCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678001; c=relaxed/simple;
	bh=ptGVfY8dowl21jHV2wAijSOBwL93DMJ7Wdq/sitHQUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hw6bWttDyhPYxdm+J89fFtz9V8RS/8QAqvPi/IwLgoZaZyxtqVYOwLReeaiAKjA+uhHyvUu9ier3tj/ob/S8AbkikPiE5ntW/ZFgvIsllJiDWr2CdTtsGwXVq27yTnRxW5OITvYL6imDFfgpCK1s+FPko5aiYwE1nzzuGcPmUtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-631ca15d35aso3068934137.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677999; x=1779282799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw4EVFD8umbNXj6ZLEY6BaqpT1xcbjLyZmag6+hF/7o=;
        b=NjPl4+uF8FyQpE4Xd9512hV8jy1+Xm5GN5exGVZd7QPcBB9qitBjkGN1BBd5MnQSje
         3YtYC9S2NKaP5PHx7UgLQDDicgLddWK2vk2mR/ROkXBRYk7Z6erLZovW8rareYRCfG3n
         fjJLD6R7uTDllh3jplK3BATeFI+Kav4u7NZcpoSTf22SsmyMD5qQHVFw59Fv5NnkX5zc
         48OfO0t/3aOsmKontAb94GgTfpzCulmvf3hG1hN3HUZbH9guOBTnHNMDjuMROS4Qy/KA
         Qd3vBvvGdtjoneIUz0PXvdnmCxykAxqJ0iXT9/K05RmfwQifP3x/HYwLSVjljQy1joKf
         A/UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mYg/4Jm/z6iUOk6iw5KvSJ8J8WgIcFQobZfKIXAD7JZCwp+xCORnURB2zNTiS5rw7Ju6zi5A0LGC9@vger.kernel.org
X-Gm-Message-State: AOJu0YxQIGfrwOQJJuTkVee9YkzV0+6nhaGn/to6TGFWxaHLhmfi4gR8
	RMahYcGLLrztyL/tTveTf+m0q7sxAIaMszNbSNxL7VW8WuI9E5cd/kRDrQ2rAFuY
X-Gm-Gg: Acq92OHMLGiaGFE5yMQ5XKhrvEW7RdRZUCSeVllZa9qrQ2hkMtUQwYvGfiT/oB5sZDO
	vQOZMohtshx3YOXmGEDDq00OrLS5ulxfzkiRWOc71EPCTahILGsUfxtewOeou1IjZTN5vbrKMrU
	ZqTrh0OETbwd1lIdVA22xPhvwbp1SWrs6pmRXWsSPWeBOmEUEkFe0qmwyn87daieD0cOQQANdBE
	GbF2KHVUCqW098ajBpwuXFRg6i4kgI+UChEHMHc75aDgQncX8280GQUOw77wkGtpe3x733rHW+S
	rAY2fSYOQC5RGVpkLG0WEwOO+Gs0RWaBQhE+2bGuD7InBmL2DXGQL0TKCZAyBtHTp12IQTcICRq
	1N8TKKCe8pGM8twRrECTa0uH7vQqrpywtsLic1UFiAKdjWb8jnZJmBoP5nqPehSPxi1vcf7h0ML
	j3DWrTbeDKtmrWAJqH9TJz6cyMlhnRTukQyfbm1aNqmPSW1DNsyUmAW7OrVOTy
X-Received: by 2002:a05:6102:5807:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-635d1f9e9e6mr3592752137.18.1778677995717;
        Wed, 13 May 2026 06:13:15 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575dcef092dsm2759760e0c.13.2026.05.13.06.13.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:13:15 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-95f2b0bd920so2843145241.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ZUeeA2yduQjb8HJcf9nz6AkX+fzmEKPjsBt0YJHHgtKVR5v38MDW/4QdzlQJaZ2prIAVE9oq5MyrX@vger.kernel.org
X-Received: by 2002:a05:6102:148d:b0:611:959c:86b with SMTP id
 ada2fe7eead31-635d1ea150cmr3550416137.16.1778677994300; Wed, 13 May 2026
 06:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmwyFSP3TsVjh97=wDmGLYNfX=Nr=97NnDP5H=Czdwnw@mail.gmail.com>
X-Gm-Features: AVHnY4IveyelRqFQvstMxxryiMS78Fp-yg20GxMmqsqgU9kR07zLUMeO9C8m-YI
Message-ID: <CAMuHMdXmwyFSP3TsVjh97=wDmGLYNfX=Nr=97NnDP5H=Czdwnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: renesas: r8a73a4: Describe coresight on
 R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe coresight topology on R-Mobile APE6. Extend the current PTM node
> with connection funnel, TPIU, ETB and replicator. The coresight on this
> hardware is clocked from the ZT/ZTR trace clock.
>
> Note that only core 0 part of the topology is described, because the
> other cores are still not present in the DT.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
