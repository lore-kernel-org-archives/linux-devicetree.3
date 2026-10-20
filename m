Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483837;
	b=kWyotNf2W3NIdc+qzbZrGHEbuGcMTpDsG/ix8Q4b0VrZSFsbMeYxptTX3ek8EMYdwAAp
	 eeLpYWkOQ7+uA9X5cdeuc3XvSpTiWdZUFf1DkdYsAN2OXTD5SHFuNyZFPHDpUeG4tc/mc
	 e669OxqVMK8j0Bo+k8zXOnoGg3b39QzX4VeBCxMEe3eEzPZVsITcNWCY5LeB1Ug4NjzWD
	 JA84Lp9ywbnS/JPLqmpflOrwnVoFRF9S7KGZt51+zMAWAGtBPRyujtJszy1tj2NOr+E83
	 KCkWtmoFUzbXvjy97bEiUVpVyGtYcLhpIoDXWexd4OzofLe0pEf2ihmpNKctIGTBz/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483837;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XtoIu8lT4HxFhQlGLc/Y+wRIrAeV43o+yENerewR5Dw=;
	b=SH5J+EBm/gBPEvZARAW4gNPt9AxY5px2K7kXxKXApeQwk68NIEHWFcVHXR0NgHPcI7G8
	 xeNCPokBlCXF8amYPfLG6bGDMj2Srz1RQxx72CVS945vCQBAoCr/v1VoFTGSaTGBc/cK+
	 5AXRfd6vXTuClngH4wVLSM+NQWULwdj4oCGlb/jXcnc7oPEocqVEz4bMjFGHFJluM8mdr
	 jtLgWkhmwJv6Py5hApib6/gg9rZyRwi7u/lI0eKIcDPQI1dDGRL2un35CyT4RjGsQmslo
	 xm3tO2kUeSIN/Q27nmKLxH8dbHo0tnMs4MMyAOWNDr1KIFVDsCALEnVcwfhG0dk6ibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662B606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3662B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5365d26ccbdso29854521cf.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483836; x=1793088636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XtoIu8lT4HxFhQlGLc/Y+wRIrAeV43o+yENerewR5Dw=;
        b=oPGKABTHZemVLlQYsQCHwbFvkD4Dyz+tQxrjzdl8GHs4pxQ1yWFAG1EEl8nQJfSKTb
         D947EtHNo5y5RhK0rHr4ztU3xaKeguLgVkQYB3vqCqL/qU4vt/4tWP3D71IbhxQRrRgv
         0wBmTkfihxqGLl98pG1CaHlFkXaVdEPPJeeOfrnsmMonnIoFO26PKSSMfba6hW5IAAxx
         mBsWpAjbRsgF3Zug9dkzqqfTiMyokJZldxsnm5CP3JF9MtlmgtroqgmZMOTTxJ1OT8Db
         PrFwdFGY99pe6gPIoEDdUNQtGDUpeugsX3HuqTL7BqdAhjYz2Onp8bwiMhhWfnv8ewDZ
         nwLA==
X-Forwarded-Encrypted: i=1; AKwUvByU7K4KSE1sbdAGOcQEGZvBxI+m66EtSYweZ9hZv8Ca4BgZU2KSU6vnpTIr0uHX0z1zXG6FRzLEKvgX@vger.kernel.org
X-Gm-Message-State: AFq9FYJGQUcmsIQN9VBEPh2zM3qN8oGcZHnF+5rjX/lvwOiURpFISREc
	luucTqWCzJd2cHrlGal/pV2EMx60IKuf78KniRAIQoKCGKCsYeKZLKzU/y8fstnuMi8=
X-Gm-Gg: AYBFou1XXyGyB78uIgyiTaRZp+emISqTGQpeMXqdQ93SFWZULTN2GrK13QPgbXqUndc
	q7rWUqDKaJuBbkuXHPwgobWFJ4ajgkEkKVibic8/YZP6LXCXIUQEdwxTY7HHXmRxEo5nzjpjyz3
	1IW4PrK4pn1o1HavCNIYiGqe5VGyz0DVw+qjFxk2cKXVjuimqfBkn8LoSNlENfVPNhXEYWz1ijb
	4SuoD2SoVUdrB5Rm21D+e5cgAEeWIqP0F0mqCnkW1RB6IlYMvejAqYFBXlgdJiSiC5eRfLJ4+sh
	8FbGwmEIKsScTzdAAG6XY9LWpa+WS7lmIkv0sjybJck+TssurO6uQ0BDzHtAnf2B+3Uo2mbCvWz
	CKo4dSIxze179ts8Hh127rwzU2e3TCOhxRAGb+MkOGjtcBUHO305flUc5MqDTlTP0vzDV2YTABp
	Yr46FlIkVvt+wvG2jzf0+SNiCE9xY0aenscHWnmhxc7QkYoRn6O/VXwAowcDyaFIrgIkTa3bCMm
	S0BXz15QFgbkdp1kcAkA1fuzaG7jp30ckW7
X-Received: by 2002:a05:622a:4d86:b0:532:a17b:ad28 with SMTP id d75a77b69052e-53645f90c18mr146623891cf.22.1792483831307;
        Tue, 20 Oct 2026 01:10:31 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a8e5831sm118728251cf.10.2026.10.20.01.10.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:10:31 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b8306b9f8so45574666d6.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:10:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxAiPlPgiuym1RgFpFa4ZDEr6uGLJr+kzf6m9tznMMmh4K9kuTM/DasGglPmWngn429g+aalrITlx2F@vger.kernel.org
X-Received: by 2002:a05:6102:419e:b0:7b3:4199:2dd7 with SMTP id
 ada2fe7eead31-7cc364a1700mr3331202137.0.1792483414556; Tue, 20 Oct 2026
 01:03:34 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 10:03:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=CEC8_Ta11oLmKWs9rkGsy20C_g9K+n9ej6qsNF6=zg@mail.gmail.com>
X-Gm-Features: AclHuK8DND9FbZy7IbKb735A7LxSnsy1udn9Z5wpI7Xg7SlqXYAKq5qlFx-pakA
Message-ID: <CAMuHMdW=CEC8_Ta11oLmKWs9rkGsy20C_g9K+n9ej6qsNF6=zg@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] PCI: rcar-gen4: Recover from link down and route
 Root Port interrupts
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

Thanks for your series!

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> Proposed merge plan
> -------------------
>
> With v5, this series seems to have almost converged, so I'd like to ask
> how maintainers would prefer to merge it. Any advice would be greatly
> appreciated. Here's what I have in mind:
>
> To Mani:
>
>   I'd expect patches 1-14 to go through the PCI tree.
>   One option would be a two-stage approach like:
>
>   1. Take patches 1/2/5/10 through controller/dwc ("PCI: dwc:" patches).
>   2. Once those patches are available in controller/dwc-rcar-gen4,
>      take the remaining patches 3/4/6-9/11-14 there
>      (the R-Car driver and binding patches).
>
> To Geert:
>
>   Once patch 4 is available in renesas-devel, I'd like to ask you to
>   take patches 15-17 together.

I don't think I have to wait that long, as there is no hard dependency?
As soon as the DT bindings (patch 4) are accepted in pci/next, I can
queue the DTS patches in renesas-devel?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
