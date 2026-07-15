Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF16443319
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111966; cv=none; b=XCShMB68BSiIVhnpbci4w2mX2w+4Qdc2cDPhCMBVNz2A4AAOw6YiWm2gNkOI0taAshETve9GsFxmjwPu+yJStddJcX49U+EAyarRQdbPpDIJvqdbzw85FCbguhXmclOQvVxw9lLtJCV2cn1g07vmBzj6dzbPX7emT9l4G6lbY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111966; c=relaxed/simple;
	bh=pyy8Wvft0PtHEMdBZYasTvd6yuUn0vslzW1iGDS5zQQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cVQRaDm5dUDjI2rHcXtDE+h2xmgbVUWbl7gTN/FzvJp2eI17n1c02BaFHMSlLphcd3TeOCCyFvGpNSwbU/cYpMOJIIP80U56GgC/twt3zkomSZqyXpQeYFQDsJuSb+6Tpiyx9JIXzgObVGg9Ukv5DEWlXrct2jraxVSbMGLW1I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrOWi2cp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrOWi2cp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso45385905e9.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784111963; x=1784716763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWEo/wm9mgv9xJNzAlLuz4CqrYAt+ypm6bm4tma5o7g=;
        b=FrOWi2cpV5C2Qp3E1lpvuo++2r93UIIuaFvvARTuObnnJR20RnUoC2FGciMmRCDMpb
         4meukRuT/nL3bxaXD/XwoHXraWU2xscqrb0/CIUTxcfmtCzvpY+3lXhbUcuQGOTTvR4K
         aoNR1it+/bfFJGebw2npGUTrh7s+hzemvc4P+MVjBEe6GbZgFZAelMMp/iBTtQDvn/IF
         aRrxjKx/C9411+muYLwtrK+JoJU8IGaGCNGwly85jJYE1zauWyKq5qo2wqeqfWllp1oH
         eJNSdqJrdWIvqm5SspIMz6fHpmCeKz0929IalVhqUs4UoBzhUJXIHEDBA0jtAd5FAjWO
         EvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111963; x=1784716763;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWEo/wm9mgv9xJNzAlLuz4CqrYAt+ypm6bm4tma5o7g=;
        b=byg4/iQi0UWODnT0MwJo3/LHZtLZdrDOjmKI/t2SFMlgk95isghn/dhM0ZJ6ROXH8F
         ErFX2jqb3DMNmIO9LGxEBNSW3T8eoCkNirCyg2afT2q99UV8j+SxPhMmjUn+JhXqPhEG
         IzP0GLVvj2CgVVlVb1mJ064YmabEKB0n7wH4EC2sESoc0L9AG3i1LVFatM9LrIjb2uVq
         Pav/r0M+yWpH0bTjK/B661t7Y/rsIUBuzsG7AKSkG5zjdgjP7lMDS/AWkMs4ZocPIAS8
         pDFLftF41Oxmv4u5d2zxi78q1KYB7JQm+nDsZANPJ5q0Y0kAyBjf+fy/4v/ZAo1pyF5q
         rOIA==
X-Forwarded-Encrypted: i=1; AHgh+RpRhOWY+G/kuO922yznWsMDhAfRwc4sJB0LRP/jHnmJ4z7T9mO1HZwO922ePDjekbSSJ4mMpSpyzFPf@vger.kernel.org
X-Gm-Message-State: AOJu0YyoPxpbG+bW4LxN8ytRv3N0wSnAcZW2Ue8k5ggPrlLQPhtPaoSF
	IE7lZQsx4IEfnqY/ywqnswUPhp4Hh+Q0QpR3UYcsDy787+esMdW6ZjZc
X-Gm-Gg: AfdE7cnd0culRk5SqijWg9xcXDXTpBj+Q4krUlqpQ4T0ZtGDurjMk5fR45NpOy3HpWx
	T74cg0uvXQt/UdsLJT/NDnK5KC2niUmxbjD7nbJT6nq5sp/iyi3fKN61ICXYnE6ztnGqkrXXw6D
	bf/UrCYRwONCuNuQHU8jVoBF1E9652XIyezJkI1F/uI4pDKWKocu5rxOPtkWrpArLfQnwVGvJw+
	U+OeZgAC3Sr6qouQ19QMBa/DRk6OQJIwKoKgUxAbwDUvEMVVo6+YjCnTLZAmsVwT85sUvmjREsL
	d3Sd+lsNqAsauiymeyO8UifJ4bnGxAeYIlcAG3Sguowxjr8ZIo17cBKiRWgl2VXxqfZKdPtT0cf
	XleBTCdoUvM4AVW9bQ0uICsmaGkK982gGN6ueRiIQarilhVi0WSLdclPPCgYxeTUJbyUx5M1JGU
	yEel2gVkHuEqe7opDJlq/v8bADeQ==
X-Received: by 2002:a05:600c:a00b:b0:493:f261:d295 with SMTP id 5b1f17b1804b1-4953f1552bfmr8301795e9.4.1784111962582;
        Wed, 15 Jul 2026 03:39:22 -0700 (PDT)
Received: from [192.168.0.7] ([86.124.200.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm208295205e9.12.2026.07.15.03.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:39:22 -0700 (PDT)
Message-ID: <262424cd-a5b9-49f2-84af-f9449d49f732@gmail.com>
Date: Wed, 15 Jul 2026 13:39:20 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: Re: [PATCH v4 0/7] Add versaclock3 support for RZ/V2H
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, geert+renesas@glider.be,
 magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
In-Reply-To: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/2/26 6:54 PM, Ovidiu Panait wrote:
> 
> Ovidiu Panait (7):
>   clk: versaclock3: Fix NULL pointer dereference in error path
>   clk: versaclock3: Remove unused SE2 clock select macro
>   clk: versaclock3: Reference parent clocks by type and index
>   clk: versaclock3: Add per-device clock data structure
>   clk: versaclock3: Prefix clock names with device name
>   clk: versaclock3: Add freerunning 32.768kHz clock support
>   arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
>     generator node
> 

I wanted to follow up on this series from a few months ago. The dts
patch has been applied through the Renesas tree, but the driver patches
are still pending.

Please let me know if there is anything further I need to address for
the clock patches.

Thanks!
Ovidiu

>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 +
>  drivers/clk/clk-versaclock3.c                 | 618 +++++++++++++-----
>  2 files changed, 481 insertions(+), 162 deletions(-)
> 

