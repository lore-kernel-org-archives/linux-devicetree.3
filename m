Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860428B4FA
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786295097; cv=none; b=hCK5T4QYP4KEdbaqskUasSSO8EkFIeIyjEw2VgG93jMLyHG+hSH/4MTWfGBVxeYyqhJ1Or3mt7Jk6QQ5Vvn8ApudB1lDtTiTkrW3J01Bt0ohZ1HMPddS6Edo2XR0bqaL3tI1LKS/y8P3zSN7sctDe2ZIsz8CWtbQEPjlF2KobLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786295097; c=relaxed/simple;
	bh=ybOJ6GbjpjDv5vyM4Er83tDWnfgQIex0mLwBZ6eAP2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHobLxWoK+zBj6N3/my+IV7C+EgiTHMgh2wPYy/ds+AORxYjzvmU/anGdUgFqwvQiTm3nps4EAkFuW4eHCrV6ry5xCjAIxkX5e685eolTFSPQkpyAx2axyxAhzazs2NCAiKFr0l6DM38Jd3cHZGU0QVdRh5nya5exjNTxwQOhxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfFFV7pv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfFFV7pv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cad8076b01so11998095ad.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295096; x=1786899896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5JSOKGksaNKZfiKDtilTqpOi+B/vfPCWiy9wgHLU6A=;
        b=gfFFV7pvNyqFBxqHY0UbHV67LS4FQO042ct5zM3kfz4qshta5/1TWykTHhoALPN0nM
         9ijprUYXRLHpqXRa2Ookvc4tyl6wHNfv5uW/cB/0HQPSWPlMX35BXhAyNrs6OjRkuQb+
         zUa4XkGt97Rlo3fZGlmWEk44v2tdPUGUNS8FGdITk+cUmDV2MXZQy89+G8x/d4Wmop87
         leKEejKm4Hcx6EzdGqeExIAp7L8V0KtWCApJYumI5uwHcKd+u+lHKnjko+vPRnkt6Dzk
         8ZHmEQfc+K/o62JYKuQ5uWfW+bxcBgOJGd9YQ1VZiZ5sMejKu7GC3moEi2zGbKVV2ofN
         j+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295096; x=1786899896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5JSOKGksaNKZfiKDtilTqpOi+B/vfPCWiy9wgHLU6A=;
        b=gvgOlZTh5Hul2Njg+3W3FQbgWQ+vPd1bJyx2VasiOldMIm2XMAezZiA7qzS/ipRiqs
         J1aDryI4slvZBbO1Soxf+FV1b1uW0njCPDcfs9XvTUOJIKNVJnjO9h920ITGXFvGHLiw
         al94K3EMUW1zP1ei07XFGzaq1w9KqO4jSLCTYwwUYpZEjTApLpywXEsegxv79pUPEfrC
         qVirJkcp7PZZSOLd5xRsPeF/iy05hf+ekDQCYGHukDD/iDrDqGnVj6tUxuxx5iOZaaFr
         DaPYn17IzXetqyd6JhspcEe6LFQIGEOEk8daQexzNjlC7AIilur6I6oXA9SPS7RI83ko
         fCSA==
X-Forwarded-Encrypted: i=1; AHgh+RpqHaZul7EZ3Pnzohvb30IagxCvYb7njKFEp8fBp3BysJr4L2LhiT8d3t65yAAMpgjo0fyhye9U2QUf@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwN890fZ8ChF0gClq4lsP/9hrkdSIlySKF28JViUsx6o4OJe4
	gczuNW6DgEjcO3CQxyYLLd+gB5vC4BWcARWgqIQgfGtoQ5lvzNKZ7e9y
X-Gm-Gg: AR+sD11S7S/zeB0meq8gVIw19QSOybBU4gCh/kztMWGnNNIQ7zMIF3up3dK4YE1+bfE
	XC5xWWB9jzU/C1G2eXuSbhURy/h3pHbbkzaRFsf8uzDbFSWm1iwILuLFQHsqj4QtVCSGSzRv1D1
	3oXuUPy8i52R/6NmAZ51SNh8Tgbr5pKasatDtHOsh2r5dLGA6Cft1wuFfR0Q/OnJr3M95ruHUnl
	Gk9GMCyGm4fRVvkqwDnE+QFoztnPNPe3O1kiSjpSpNsAgBSE7lcg/EaN2WQypWm06R5ADN8/jEn
	pBF5JEAyI+28gVvH69ZV57IeAiGROmmx/1s5qTDWvW5snOK4rbmgml29/wXXEBFEBWNfMC7tKBR
	q7HB3rjmsOWVFAzeKSik3ZcrXxGcNxwZ+hAO0lJn06bFX890NEEFr3eKlZOe3UcgJIRVKAjSPZk
	rtHiPS1iX2nRb7ICKtj381h8ZMitZyTpOyZzJEmBX12TaHsZMTdPZ40hoRdKvB5ZC77irxCRONt
	JYOmGgWAs3qEnEuq5YTX0D3yD/jnaQe
X-Received: by 2002:a05:6a20:4321:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3cb85e6689fmr39981875637.18.1786295095808;
        Sun, 09 Aug 2026 10:04:55 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm2824978a12.11.2026.08.09.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 10:04:54 -0700 (PDT)
Date: Mon, 10 Aug 2026 02:04:50 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset
 controller
Message-ID: <aniv5B4jz07mI70D@buffalo-ssd>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
 <20260809160643.33991-4-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809160643.33991-4-l.scorcia@gmail.com>

On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> Enable the toprgu reset controller feature for the mt6589 SoC. This
> allows generating reset signals for the 12 subsystems managed by its
> top reset generation unit.
> 
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

I provided "Acked-by", not "Signed-off-by"...
https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/

PS: I am also fine with this patch carrying my Signed-off-by.
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Best Regards,
Akari
