Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7D83947A9
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564330; cv=pass; b=eqlDm8tQ4tC4KbBX362E1WggFpMW9irJug4UQUEqaLKZgoBeOS6EBYDDlsbCUF1Kviaqag3vDZoTroHFSMG7V+koRWQ1sQa2Ft/4AT9zAYUAcxUbZWk5Ia+beLjj7LMrJultWx2ZRppU4bJ6P+pt8zCj69ENMI1vB/1TCb6xd7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564330; c=relaxed/simple;
	bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzFAv8mGi2HWA4zPV4XIZlgaFMl9BvLeMMcm7ZPUol1d8m3EFnsHcH7VoDJM11rSgTRelQ3BoY+6uIdoQAOjkOBWRtlaeAdU5hcexEirFp40UVmTHZ5h/zoEAqxXkBFuQvFbBW8V6aNXmIX1wUb8fqGhRjDHbcf22AR2yC1eFsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rICtNVZH; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rICtNVZH"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso3135080a91.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775564329; cv=none;
        d=google.com; s=arc-20240605;
        b=Ubf78nBoh8MFBCcLGQgXfFjT7IW6n854r3Jen7qOjwj/AwTFvipLSeQLUQG22MpfIG
         4DDwzJOQIxVhfv9uRVNlEn0UxtETtLyxEO6qQtX//75Ob/36eFCISP3Mq6kPN+hBtUlJ
         vAZSlBvk0fzctSGUTxdkijdKM6tCcfFDb0oEhBB0X6gzc8lig8vOoMMol+KO9r8gLRha
         cSH/dC1W1jB70X9ZJD8lQF6PVd1lG++vLHASOmYHoPor9ldvgKMwq7MUUSuzMEaosbNn
         yKmLfZZQ7Wx0xaBN24CHpSLJt6ToyZw6j3gdfB6hT7XllVl51d6VK8V4jLyd4MEbuMSa
         uKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        fh=EDnj2Mq8+y/Bfoa/QkdlA28vWvD9NIkBvI2pyfDstL0=;
        b=UmTFO7F78OiO8Yj8k0eiJclFrDTNk1HJDNqqRT+ppFI8YHaJTjIpU9siP+Q5zXBEMo
         oQun2OS+vlhCi+pax0DlTDhyFqgYIf2wy7aFpiFQYolrodFN/HkxJh4Knm5zIzJkUiO9
         NW6MTMV+R9RCWj2C0VE07a93VQWKcfh9IY3tuJoAaJgGcpLUsihLii/X/YJTZ9U4Xnj+
         WHYHCnTZ2xdgP8q7wb93D6WXv2N4r0lJa0f7RfIeRtBtJB5FR9/WtgielGHG4C8kgXm6
         1yL9LyiSnwiM5FF3OtHGTsoD9W3FLBfEdfIdgA5dTqnOWrNiWIU8ErYPl0QeLWTap+pJ
         GQhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775564329; x=1776169129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        b=rICtNVZHlvuEUQMSQ3hmhy+UE1jTn05fdRuyIpvZRQohV5ylwLp46uksjIIeQfnVDQ
         E7VpxBFr3aDPGpD76EtlwyOzeWPxFzUQPHWARZA2l5RAjxGwZ5ZzWU940X0vVMPxkQxU
         skyV2xLZWXuGYTP2EZK89gdbtR6p5D5OPPptb3iMmGGoTNtERM6jCGMyNd+89NuQ5arC
         uY2GedKblbTJgqfxW/eL/pt8c4ZoayDrbZ4f1oHxiE6CuV16kQu7V747bcP5gdnFDuUS
         FsgTMTk5E/DXBR0DzorvE/ajiNUGMAAXu8d/hij0g253zyuNcpRpfDslyRvpYdnxyNYu
         6eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775564329; x=1776169129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        b=ATHpDk/EyJSK+ZSYPIRExgBZmZ4scwji0S6+Kqe+jmPKNpR0ZFlS9ayi3TOmOTJrvf
         sMguUeWuC2asuyUXKrhFkvt5apUIWl9J5FZLr2hzK91Dbjjx5y7mXDLcmU4SkM+cegVc
         k+tUMPVpkmCYGs/Hw7nkxdtQvdX6VjL7e0fRx452/cs8dROWBq8dMJRVTdEst86Q6jOe
         bekstQAZ2UewMyy4B31s1FYewQMrhkJ/TvunQlEjT7Cj7R++l5uXoJGoM4K4ESpkja4Y
         Gq8NI3C1+sHQjzb7Q2krzj0Tadv+iq6yntXUanzcxx0kh/X+NeXvdc8yxBWh/BtdOUJb
         nm3w==
X-Forwarded-Encrypted: i=1; AJvYcCU5QJ6GzPLzquepP+rMJn7/1bJTblAhrnGkOm2DmdytzO0asO1k5WqcIf0XjB3+tePhU3RgOhHDvxtQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyK8B78mOQzgWPrNORqAIwY+xY0CMC+3jSKOHnqHLpqcFD4dz0S
	1/KleZjk8u/IzX1O/tz4syZjW2FMnJtA5aTXzZJjI8oze+4uu4cWGkFncjLaoG0O6m4/8kqRT4S
	uapQ+Oyxw9eWQ+nQrPT0qx+Y0U7dF7GI=
X-Gm-Gg: AeBDieu5VQhjPDqwOQR2w2TcrCLWvBcIQerGxKT83xgkD1/V6aRNuH2RYnKVMVsx2A7
	+rNo0Qf684P/8e3o5zdmlxEM4QpzFDupujWAcnMKheWIUD+t8GM2vPTbVH7OQypX5Jbs3GLKIap
	uupNOGZM1lOP7kh02SVa2YGgNGFGw+GpT8TxRjRZc3wPrczvsDQ2D3ykBWMx//I2f/3IvNNpPHp
	6SpPsEBalde/t9JTWcv/5wMJNqe7VtAp2RVlEt4KvQECesVroAXNRgxzAbzZ2mtWc67FLlKNefO
	BeYwYG/O+P07F5VV5VuA0yuNcCRL8QJUp4bJWA==
X-Received: by 2002:a17:90b:3c85:b0:35b:e553:9cc2 with SMTP id
 98e67ed59e1d1-35de6977d09mr15551822a91.26.1775564328881; Tue, 07 Apr 2026
 05:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com> <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Apr 2026 19:18:37 +0700
X-Gm-Features: AQROBzBRZftGMEKWFlfQx7m6sTV7mWUH_AhSwIbAfVFsIBCiqbQ3JqmVTbVg1mc
Message-ID: <CAABR9nH-1eBPFxtzVR6QBE1=esDN8x=hZpAkRSCO-TLmn0tRKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> Ah... is it because PIO transfer ?
> I have 100% forgotten, but FSI doesn't support RX DMA...

That is correct. Currently, the Armadillo board lacks DMA and HDMI support
after the transition to DTS, so FSI is limited to FSIA in PIO mode. I plan =
to
investigate those drivers further once the FSI implementation is finalized.

> Hmm... fsi_dai_trigger() seems strange.
> It seems (A) stops clock, and (B) sets register after that.
> Is this the reason why you get error ? I think (A) and (B) should be
> reversed. The balance between SNDRV_PCM_TRIGGER_START, and with
> __fsi_suspend() are also not good.
> If so, can you use hw_start/stop() ?

Thank you for the guidance. After reordering the sequence and moving the
SPU power control to fsi_hw_start/shutdown, the system hang is now resolved=
.

> Basically, concept of this driver is that power/clock is enabled/disabled
> when trigger() was called (except suspend/resume).
> While your testing may be correct from an ALSA point of view, but setting
> configuring it in multiple places will lead to confusion.

I see your point. I agree that keeping the power/clock management centraliz=
ed
in trigger() is a much cleaner approach.

By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
In the legacy implementation, it was handled here:
https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
Currently, this has not been ported to the Common Clock Framework (CCF) for
R8A7740, and it resides in a different register range from the core CPG.
For v2, would you prefer that I implement a small clock provider for
fsidiv within
the FSI driver, or should it be added under drivers/clk/renesas/?

Best regards,
Phuc
