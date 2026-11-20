Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161417;
	b=g+jxk8BT1a42xskydnkL2r11EpCgcHLgNF2IrX30sX29nKJk/9JPOIFXuEhakz0878zd
	 KFvxf9am4tXh5t+KJC6bZAJeXGxZnALCUbiH4sNP0k7E7H9tPWARuGwKQCB6ichkOSnb2
	 525sjku3WCHEE9ymImw/9PXSV5+jJBqatiFwhbY27ckhuTuPnDdDAv6Pzslz1mvv3x6jh
	 BE9PYqVinwTtRWZ3kx3g3qslp7XUKTjDUvsQPtlPMPZAkO56Cm7AjFbsAPoxukEQVzzHO
	 71/vD5w7JZ49+UiZ1ImN5ON8snr/MKyhM3/fht/MUwfhWN9n2ExchEprWf8QxsWQiRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161417;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
	b=ReiCNRfulvG4/ZMPU3HjXq05K4CPVxiCFhMjkU5dccg05u1KhXQUjI2eCOCnrtoGvL7d
	 duV+jWxF5KHizkKwMDX/6+lFBXuzZF5+fKzfi/alpRlsfOX5+AHnr9W2ANp6dKrc/rNbU
	 Tgq8QgxbyyvNy4k/zvnPsEV4ijU9lYSiSb+9EEzw2HbpmLakQad9zOJLU8Wl3t8Wyo4Gc
	 4ZkGB253IclLRt0orgo0UYY/MwFoL+vMv0OsmEQ2Cm1fdYEqGcxc7vSSstAkPNtLeRsNF
	 pRaduIuha2AdFPUQ89SIAZeC9d1A4zDv/VPzXpAlTn7hTWP122oAzUTWWzUbMA8ofQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBA606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDBA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso337279137.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161416; x=1795766216;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
        b=nATEvP7PE7fYYb2Dj+7jmved+7nldluk8eGnhoEQzwDQx/4jP8mwJ+W1S1uhC+xhDg
         qyp4jFRAFq21qN0r3dk1l2pv8ZCiM2cStQQ9LnpmktRHSwSXgw3pa6qVzVSdcn2fNnAB
         pJtOncJmGW73+F2Up48wmVSWfUaBqI22tqJcdxjpflKlwiE1S9KljVnhXb1vvT7kPCVl
         CJpSlWfp1G/Ns+qUbMBnNN7M5dU/n6IZkaM3kGSKI9dLjP+ETvy4KndM/XKGtNCPtfX1
         oFnk8NNDKUeWxDrSIbLSX8FpK2BYuSsMRZ5TJASOgyWRHu8w1xtlN/L7aEMvf8nGnUiV
         R+5g==
X-Forwarded-Encrypted: i=1; AL+hErGjlW0Z+Bo/A3TUCd8G+95S7ERGBmnul5HI7ImTXe3S/KnR+rL+uczQon94Zl0SIUsKEPGMzhr2fS9R@vger.kernel.org
X-Gm-Message-State: APuU4Z+2OPGae7F1UWkeBtUx6EdKvyIru3z6ip+X4uXYHVidi2UQxXMX
	BBolP6IsRKxKbfq4A4MS/BJSue7AeOjO3UuQRAFTbM3WwcEPPAhja8NA60sGD/yU
X-Gm-Gg: AZFdTZdGsQtQATeffS7+dZEeHeJO5DksJ3Qxr9BMgipMoAB+I2DLOGQPxXf0hmVDl9N
	cxBg9gSK9RB4dbjSUIlhvocsV3FoFJFmiSuiqh2wHb1SLcfhl4721v7E587BpvslZHDwrvQh8Lt
	3ka0PDymTC3hD0QCAMv7IjgZxPLSRCSRAWXb++1A3d6c4VPazMLqRvTv1+BYIY+QK9JgxqLb5qg
	C/mt8jx8sHUXSsBO3fWkGnc6A5FYvtqi22TB/8VtVLT7WIuYaQ9TdVh/SPARn7ToKEPlVQGeYAN
	YP7yxr/4D38OTb8gPfo4LyOFnIFLnBg3PPFg7YVZVAEqbfYfs9mCjZrv84vS593ouh4RAj9QC9d
	gTdopqluutskWg6AVX8JOoquU4ZxYS2d7ehSIQGpsmXHxP9az6db9xQg9JH4sba7OMXCoGRoNFj
	n3t8xofjxx7zPT5pTvEfWOmkXX4jaE0PCRkCOye6JQ5SkXHSxUBFnF0s+im2kxSr0Yy4zedYEeJ
	2qMvmDb0+IOvYVbc86/mXB7Tg9xJEghUXuBq7UBEIOsNZLESSUp/WorczSh3EgCao40Gp5JMVrY
	iVR8C/jii3OnqMMuYTy98Yd88GrdIE4OmpgZHdrn4Ut83XvB6B7nYAtuHpSKJPrxwlM=
X-Received: by 2002:a05:6102:504e:b0:7c0:cdd9:31c1 with SMTP id ada2fe7eead31-7d73937ce2amr811263137.12.1795161416460;
        Thu, 19 Nov 2026 23:56:56 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec7cb5sm2379837241.2.2026.11.19.23.56.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:56:55 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso361532241.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:56:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE+DStdjDx4IPU9dv7QQIdxh2j8QcUDrgD0BVRUz5NoYc3jvZboYmkHeBu7meswNsVCDXu+NonN1oGC@vger.kernel.org
X-Received: by 2002:a05:6102:448b:b0:7cc:26a8:e726 with SMTP id
 ada2fe7eead31-7d739567d98mr1003780137.26.1795161415051; Thu, 19 Nov 2026
 23:56:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <cee843b319c9eceba2339f14a134e305a2b05d7e.1795029012.git.geert+renesas@glider.be>
 <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
In-Reply-To: <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:56:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
X-Gm-Features: Aa3M54pzvZjiNE5ltwUGvGnHop8D2bVYiqyWJcr5J_J0ppW6-NxZAErFEYs73QQ
Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/15] clk: renesas: r8a78000: Merge debug prints in r8a78000_clk_get()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 20 Nov 2026 at 06:28, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > The two debug prints in r8a78000_clk_get() are very similar.
> > Merge them into a single debug print.
> >
> > While at it, unwrap the (wrongly-indented) continuation of the
> > r8a78000_clk_get() function header, as it fits on a single line.
>
> It might be worth mentioning, that this now also uses
> clk_hw_get_name(hw) instead of map->fw_id .

clk_hw_get_name(hw) was printed before; fw_id will still be printed
in get_hws() after PATCH 04/15.

>
> [...]
>
> > -     dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
> > -
> >       hw = priv->fixed_hws[map->fw_id];
> >
> > -     dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
> > -             clk_hw_get_rate(hw));
> > +     dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
> > +             clk_hw_get_name(hw), clk_hw_get_rate(hw));
> [...]


Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
