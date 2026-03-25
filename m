Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B2127FB2E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433630; cv=none; b=nV0tLOn/GQDIudvroNl/7i7GFYG+U8T/rCiZ9BXNwlGNkb2ldBBzRx9G1Zs34lw5g5WgK1lwREmaoRzKvQRx6HHmrzT22ukcaA8NnfqN1exKXjBcOJCy+9o+dtX2X7U6QETYi9lcwU/GIeZzAQW79aBWouBqWvUK8ySf6osoGwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433630; c=relaxed/simple;
	bh=d10Wzuq54/lvVZqTRXUFEqKdYGcg4pnSSJK7jHjepFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcEkukzfIGSp7zty+LSGX/Lpi6zTbu0C599p1v/4v/Yv16S9iho4mb0gW+vz9IzCRkwV+WtA3zm6ykzuYmTHInu5sqz3+nPYSnccw2cEIQRX/dVNBiE/yrjcbuJO+jDTyY0si9R9IwkrGsND2Cc/vTvTmYwuVGkPCTbhymHS+NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56ba039eecbso1996033e0c.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433628; x=1775038428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDaG/7sO/tQakw0RmIEn3KICwhpxzHUr5uWeZRW8Hmw=;
        b=PpNfK/yGF7vBI2Ccm7lWJlj74eq3NiVgpwCPBh0DX4yfH54WtWoH0pILE7xG8gdI1R
         akzFUQs/rlBrK8rTfg6BSOmWZLYQKHYBBYEs5uo8lvc4tm/9ZzemD4Uv09vNKZFV4tDD
         /DXXV4BmkNckTk2Wk/tZh37zYKcJIFDfDmPkeJL6FLABkZSKIfVzzfuPxx9WugYJwN2v
         jVyr967GKCPLNhiMC4kEiZtoQ9lWZo+KtTctcRXowBid11bAby5j/AyK2GgxTMgJJpSW
         bRDEGkRBPpv5ZvTNhCDgr/Zy4bMYFep0DOlDueiK8YRzl4wAywKm6HQQaRvzLsr4qhn4
         vdww==
X-Forwarded-Encrypted: i=1; AJvYcCV5WmflfYkm6WJqYyqwxkkhAePg7mTN/+wyY1TShC7Nz0NJuAhKkh/CJZ1sjJlFyfL1brkOjexPsm/5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh//RIchPl3UJ/uY/pKoskOxzAJznfRak/FiSuW7z1xi4C8saw
	In0Bkbn2wUJcpoj2UAVRxBuOLenoXlnlK/YykjYB/WAQo5XENFcwM4PMkYeZpz8WigQ=
X-Gm-Gg: ATEYQzy+IgiLGQj6Z8S1vaAmVBEur4FhS9/YhucTgVcBiOuV307nCbeA0/vvFy6pRsX
	LbTxuQS9wtm2HfNF0lbp6UKt9j0FSKehsNz/ePOaSHadArX7z1Vsz9BzC2POk0UCLJ176xU6tVm
	3mvNgrcuRmwxQKfjPgw8+wM+HtGGh+QC+lndEWjxRXHG96iosuxee6fD8Q/wyQQ8kEPVceBg5N/
	PdYv03tlQkqRbCMszktDVcWmCZF2aVUiD1182srnFt3EbIC/DFHeu/15u137IiXCJ0AKVlUVKMD
	t2RcLhrGLnlITyMrxAw8PP3ap7OgYzD2DL6HWee1E8S29uk+hkGN4M24oSIYNO49j95ZJ2OIEpB
	YRIJHn8EWOSROuoCXbhxIULOjggO3NyuPCGyZYXHmdXBSXoodl8MV+Hv2zCSj5+Ygz4QGIVRQJJ
	LcWtVTUZ9MrGyQM0fegZDcV5r74dK1izKwplV3mu0ebY9Flg7BgH8HXBgnY1Gc
X-Received: by 2002:a05:6122:3383:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-56d220627a0mr1375569e0c.12.1774433627718;
        Wed, 25 Mar 2026 03:13:47 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcc34afsm20163882e0c.16.2026.03.25.03.13.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:13:47 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffd57b6fc6so1485614137.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:13:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXp9JG8i6nivgJDumI/DqTlZ+/Hqjh4zBMx49OD7H7i9GkFr+dze6oS2HmEytHr0u+MJfjQ8XQPmm/6@vger.kernel.org
X-Received: by 2002:a05:6102:5091:b0:5ff:f516:a2aa with SMTP id
 ada2fe7eead31-603870e0d2emr1309775137.12.1774433626857; Wed, 25 Mar 2026
 03:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325095718.388157-1-herve.codina@bootlin.com>
In-Reply-To: <20260325095718.388157-1-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 11:13:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXp_ruuv5ap1onR7eSc8zvnDEDPjUu9FPsQbFzqCRC2Tg@mail.gmail.com>
X-Gm-Features: AQROBzD4PFt-v9V-tVmsmIWbbuwIBhiLHVDtgtW23ooqR9mX6RydgMF4Wv44TKg
Message-ID: <CAMuHMdXp_ruuv5ap1onR7eSc8zvnDEDPjUu9FPsQbFzqCRC2Tg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r9a06g032: Add #address-cells in the GIC node
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Mar 2026 at 10:58, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> When checking dts involving the r9a06g032.dtsi file, the following kind
> of warnings are reported:
>    Missing property '#address-cells' in node xxx, using 0 as fallback
>
> Indeed, #address-cells is not present in the GIC interrupt controller
> node.
>
> Fix it adding the missing property.
>
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property in PCI node and in IRQ mux node consists of
>    several components and the component related to "parent unit
>    address", which size is defined by '#address-cells' of the node
>    pointed to by the interrupt-parent component, is not used (=0)
>
> No functional change.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
