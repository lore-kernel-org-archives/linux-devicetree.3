Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C2337B01A
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 00:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545603; cv=pass; b=hwMX0qXr+KNypwFxD7mlYOJMyfCHot8zrlM8J4xJEXCQHGGw1RApjgSWMM3bv9ePeVTgemP6mKu3af5LO5Kq87NWuF8pwYyws90LcKqlD8RtcOp/QKQ8Z28oxqGrRTmkV6omnoDz0J6q9p3rDTOwTRYL02ECMNiQ/da1AZzhuNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545603; c=relaxed/simple;
	bh=oUtQAxx6vL2RIVbyoqogaZhDTUmqZrpIVWk2UV+lzdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhWL4vfddRNF6eM8vKihYcEf4OPR0naK+plOo4epx4EFc0yySr+07th7aan9ZJRGSOz6apq0mH/exfW+2gX1/GanRgbjNEoBQqOzbIDvi1OuvPR/ppz0PaXpTthCIozWmSB3R7Qc29sihy+hjtGt+xD0D/qJ3zA6xAWHv+rIV8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwTrq+Uj; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwTrq+Uj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacb8416a1so16511315ad.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 17:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785545600; cv=none;
        d=google.com; s=arc-20260327;
        b=TbNP15JhIH2afn20o3F7H+v4QkaUYijG/M9yWkidhzSL8yF40yYlFw0FxhE1Jrm5UD
         jMxFeFJZDKqoGKCK18xSxl/XIljNQ9SAniC8vS7Aa4lU+l1OiudzkTFNCpOfWK4oHCC6
         gTvWkmtNibjbJIm98NJVprwTDVVC7je8mbgSQtYuTFE9QVGUJw7h45pUJOrZ7XmCNrLo
         9RXjAtVK1RiyGgVMuk/19AXMeaQIPI6z2EO1RHkJJ+IZD3DXFMGWH51zj72un2MAWCDT
         pEVTukEgE4eAy6FU1K/JASOWjTFh9na3ST1waEGgsh3Usr4EvaBjPxQS6zjsC4fYa1JC
         LzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        fh=LjMSWfFuMB0S8fCTLwispVLFYc0IW8O/SZ52TFUgMsM=;
        b=ic3LWgiLYlpKU3BO0NcVgA5bDCCzCjlmYE/R1ezqf1VWBNbRq04Qf/1pjQ2pe1o9Sm
         rKjF+Fy6qdjGaziasuOhScXCablRtdjlmaFGg2/7a5Y3uwlTFhsy/Mx4/wkRNtInzuL8
         5gYqkgwZEiVI7p+tBPtqRG0jPAOJwtyZP/8xpTim4aiOTG0biXXVuOOEdmLCITQ56K8V
         HqzU6MNkkT2hZQCmAbX+9wPv3mGVIJM5EnZLVDYXzrH4jHdPxCBV8/wuhAJpepwLr7Y9
         UTvLvjpyUmV/QLQpoqziFxoWBB42sGaTonX2dlrEA1+dhDpYf7gDpFDv+CtiEJEG+1hH
         XbTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785545600; x=1786150400; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        b=VwTrq+Uj7gcyFQu7TTFyCCQbn9pROiOS1jSAEyPZeOrZgT0q20qFnMAYYYEEdR/aZJ
         QbAlW0V4+kjzyLTCJpOccJMOGMDhjcLR+L7/XQb1K2uhs9KYSX+AJ2nkosdOSfTtRxAy
         vEkoXGa8Jclb4lrmu/BbyZPLwdx7EZ2zDsBjqs7x2CKTX3wCnPJpyeyo7wexLSENSPGG
         NnJWCuLcQpZ2/tOlgLvJhlutvWvgjCzW0mbna06pcH3qRgAXF5FLeue10MNX/nverAi4
         pKCy2BetY6tuBsgyEvA+QaPgv5shzk7UybtZqHhE48DKdSivlk4l+4OntQD+jBV9vfgI
         b7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545600; x=1786150400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        b=WdZ7ZkexArKUUrZCnYGAoUjHIKbZxcKURH67cpi5J9+kPUoQPgX9/EXma1TT9J7KGF
         G/R5rDx7XoezITjYnGbPIQ/qHjZRHO0Vwwt7zPStL1cgrUDr5VBzT5m4lWAj31LUsyMj
         2nBir4gJF7XhIRFIWz1PJ5myAbVrohO1677rYw1XwsUBqMy5G7hJBip48jwcWtGzTmLN
         DmF0Gnk+1Ixxpf4kxeiTTl5gLj+5qEP7RNQ/bwSkLTU54qqSsjAITg8cZYhAR49qLQvn
         Sq6QGD3XZUgmKQJeWeylpaap+sl5CRkU8nJCjMdOiBYinm5nZcvTyxHZtuV9IMu/1FQi
         5VHw==
X-Forwarded-Encrypted: i=1; AHgh+RrVnWx+at162CFdci/FaH/FMonI9WDeTm9Qlm0oJL+RtBSrbq5HgrQ611tdPqe3i+cMHYPOZW5Tyt29@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy2lbC+kf0OUCor9L5gW7eikxJg4z8JM/7/H+n9RE0EdZi3sXw
	yaxpgEuV2Aq2OPNbip+42YfMwXBK3nbqtO7Bw+RJLcRE3inG2ZZTfrVvqhlwqxXKGQ9mZolclTx
	0w3cXjU9r2/Litvv+IO/w8/mV3cneO9M=
X-Gm-Gg: AR+sD103w1CBr6GnkhTMC7UXUhh+VEGGbg8TY8IryCbRnst0lhPWQZ39Y5BtEHA0YBk
	Kz7Cdq0BImuXiuX8UcF+jbRCuJKm0/5luIZhUC+ENQ8KaeqpXjun3X7kLqPnkqlQOyhww4YWxp0
	JS4PjDWUx/Z4THUJIBqwQN3YFVTta9xpKA/OcZ5fqZjtjHKCDtZrjT4mZvE3lYExy0xTKfx/GEd
	c57XrAEly6xMX2DYF8HtnXehgaMlXilVwfUoZpBITFLdQi5dwtcVCVoC07yXy6V76yBZulZkQM/
	Z6xjniBgfGWdU/TBGg1XCHyYeoy5QgEwrMRsiUb9clfOwTVqdBHB7V7Vr5/0756ZmyLGyg8iV74
	J4w8bJoLqynRscKXSE8uA/gjzq3aaDOh0DuM81k4BwqpnSUO0cTsJlPW6RsfsHj5h3f1UE2VhhR
	kSsEcxU0ZEYM6q0dM=
X-Received: by 2002:a17:902:d541:b0:2c9:97a8:aff1 with SMTP id
 d9443c01a7336-2d0523f6632mr17715015ad.42.1785545600095; Fri, 31 Jul 2026
 17:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <d5ebcd52-580b-40bc-81dc-0a9b403e8392@sirena.org.uk>
In-Reply-To: <d5ebcd52-580b-40bc-81dc-0a9b403e8392@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 1 Aug 2026 07:53:09 +0700
X-Gm-Features: AUfX_mwpBiIC-LAm7DPPHKlIG_sYNWPv02mGlSPv-uPLw52OHrWaev-lmAvMvpU
Message-ID: <CAABR9nEKCtmkt1H+qe5UAf42MncOpEqX+pZ-AySTSBQ5Q3URTg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> This doesn't apply against current code, please check and resend.

Oh, I think I already sent a v6,

https://lore.kernel.org/all/20260609113836.45079-1-phucduc.bui@gmail.com/

and most of the series has already been applied for 7.2:

[01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
        https://git.kernel.org/broonie/sound/c/955fecff55c3
[03/11] ASoC: renesas: fsi: Fix trigger stop ordering
        https://git.kernel.org/broonie/sound/c/859efe92b0bc
[04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
        https://git.kernel.org/broonie/sound/c/c9e05e2fa089
[05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ
after shutdown
        https://git.kernel.org/broonie/sound/c/e813df3ef529
[06/11] ASoC: renesas: fsi: Move fsi_clk_init()
        https://git.kernel.org/broonie/sound/c/cfa1466e6dfd
[07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
        https://git.kernel.org/broonie/sound/c/5fb4660ce59b
[08/11] ASoC: renesas: fsi: refactor clock initialization
        https://git.kernel.org/broonie/sound/c/2330e0b49f14
[09/11] ASoC: renesas: fsi: Add SPU clock support
        https://git.kernel.org/broonie/sound/c/39033b278f9c
[10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
        https://git.kernel.org/broonie/sound/c/05e1ebfeb726
[11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
        https://git.kernel.org/broonie/sound/c/26deeee42f4f

Only patch 2 is still pending, and Geert is planning to apply it for 7.3.
Could you please check again?

Best regards,
Phuc
