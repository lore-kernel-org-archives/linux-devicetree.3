Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0B83016E1
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060559; cv=pass; b=sgbPpm64lcMaVXlyMySitJB6epxoE3NNLqJ3pejtmHHYyyy8MavfaVGjFIV2y9784NQ+UK9n0PCMBHSLMHbi1DSq9wfzr1delJVU/rFo+HH5YknLs/Y+VOrUNuG2Tgav7sHY2VkPTVK+dOTSzFQobYz43WJ58cKEYS1u+SFVtlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060559; c=relaxed/simple;
	bh=BELWqzWUWTPdsciv6CHCfEhJicXEFTQV3kH47jXL4jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfwSHy2Q1ngHfJ+Pzg3rnsuVUx2SvV5UWWJ/+onxpHgdu5UDS0cm7VKeOwNEy4Eids1gPQZIkmaHo1rlt+bpLx34KyfNhpR1M8AhPuptIUSOY1mc7nXIWAZP5/DuMHYywZvH4Am5UQaBrqYvU+aZ4l67RU6lIw8omXNi7dPSN7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sM76bZHc; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sM76bZHc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b9d265355so3816418a91.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 20:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781060558; cv=none;
        d=google.com; s=arc-20240605;
        b=RipHDMJQK1ZbpI+s+DBbFtxYRo9swEw/+SWjOjMmJz5heeDfdSGJPN/6znDQ3YWj2J
         YQgDIH37+Cml0eG3RkvorHqGgQMLFyoqkn49YnDs8Ssgv7b2/36f9BmbTra0IyirYqLY
         UcnSHnbF58fHUY9zQLr27EEk98gYqq4xA47pdmAyOi1Luf2WlvPfT+w/6TSbdkgjBiS2
         uwU3Xh1D0QFzscSwUVuu+A+mVgjVSQtKOjojGD+bWe/B9c5bpOQfyTtXHPHAC4lacMIP
         wm1D5iQnMDp1RR0N6gM84z48+S+6iaZC7STcXxpqO0MT7NUIECZVd9PD41GBzX7CUCxA
         ecYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        fh=RiNpAO0zxJM5Nv+5oLOVYEYZRHVCpYq2X8tpgSWTE94=;
        b=UTS/s94MZc8PSKZOvqFaxRVDn+xPJM5xApKd39CdZW5f5J2ezs3UeroF81+5VGeB3s
         DxsbFFfMleGDD5TBMVRKjnpEOCjXrcifSg1TViVAx9MtTIG3BvVb2aC+bxfmB/nDv5xJ
         Ueq2LS6UZW76OkUP0J5s0232w1d50ch5SBfMF4LTljhrTrbOjWDDttcJh9PKfT976zTC
         EBcgPOuoVmYiJcxGRcQ3gb+zkecf+297fbAMUmQobKwvUhqX6Ufm/tYKb1AGvXWTBZlp
         9BeO5ThAeGskBvJGMMwc+zYkmpUgaZOJghxVz8UbUyZdmbUBz9AVwey4ECxvZQSvNtfu
         OEtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060558; x=1781665358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        b=sM76bZHc/3eJL+X8ILCMQv3sA2XtzTJ3PY+2QxYGtJjVWtmMXvKYJ7UIT/0Hl4D1aq
         ft3eZyL1tMrDW3L1eNYHvm1Kizt8Dxg5zaBc4VgZ37LXFhEkCSNBvx3leO+1S2ezWqX7
         7wZ8aBlDdZDjbck9+ZcG+Z2ihArrt7OOAlVqoZ+0gsvbt2Y4YqZ4svz04Xwxb7wE/RKf
         rxbsxO/IaRaGbhTDDQwNH7qBmxd4u/U8gi2pA5r+ZTwu7QgbQBLuoIFKqjFd+Byl5a5A
         /qvAyHvoOHyvEqJq0G9O2Wj1lYFb60SW0OS3Dsp0bMYlJl1Uo0/e8o6NxeEjKE8k3Dqx
         lHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060558; x=1781665358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        b=h0e9JKe5zgZv8XpK1IVEc7BvZKitS9WgGU94mmmJWcvwBGq3a9bsSOeuy4g8XiyFKw
         Z7GPGIXpyX1TdeMSkD7iycirSuBEMbO1V9vsmg/urSXokh8p7boYx0CVYVsKClyL81C/
         56AGvWCngWkhopy2OPPHfb3RLA68RZrZnjTnwj1OzBysXQSqzSDKtm3MumicYqKFeAVq
         6pl+ep5I9sItmKkL4PRfwie7wUkRw/eiaugi5nq3rzVSWdRZZuuHltqg1fStUpI8yrg0
         PlMxWuboM5RlKv4O4D2eIISc1ql16mj5uif+ZxB3WckuJJeyLhqOKjGFph0JArQz+sG1
         XYGQ==
X-Forwarded-Encrypted: i=1; AFNElJ84a6BgWurDrsJPQdNk13qjamGcB+00L1Lre1eAo8PBF9xKGhKkIf2UIlh8fuGMb/8gOXKKiEvhR6lX@vger.kernel.org
X-Gm-Message-State: AOJu0YwwLaJDnCWsrA5RSjqbuVvDYXZd3c6Atii3rtspcBV/D11mU5Sd
	wNPFQzfBhFzhA7qRsurAsvGFLSCT8n3qsjGP0Ef/yGr8PBk4ZzJYpY97NY59SlGs4AK4KvtkKEi
	zMAWLVsOg+yNrWHkkDIwA17W5vyh3TwE=
X-Gm-Gg: Acq92OFnhLAjzUkM/JfGYlRPFTYs9bPzjVLOPtzTobjImnUKjieBy0oy5zmNOVlDmn9
	A5C5QP5iXvga5p7mCLxGbK4EKT2/8ASzZTQ2GsY194X8HgGazr5UOFiCYTdaTd3DvOmGUvZ8Zyf
	jmlrttkZDA+fWnwGnKREFuVKIsi5dlc9mm2UFOjy5uNDduuFugPRoimF7TSkya3RbOKwjNmqiy/
	2Dm7vQV74K1B3wC5eGIWjnrkqH30OQFg4Zo5iL4iXaycCrGHMczNnjHOa6kcq1k2ZrpTBerWgQp
	HgjbgdHXS/6M75b3Ide+kuJXAHYqCWZQRad6i5+bwT/YpePM/1mekwwkRpY=
X-Received: by 2002:a17:90b:5783:b0:36a:4074:9aa6 with SMTP id
 98e67ed59e1d1-370ee82fcb9mr23111578a91.6.1781060557754; Tue, 09 Jun 2026
 20:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-12-phucduc.bui@gmail.com>
 <aiigtwDM-qEBxjH5@sirena.co.uk>
In-Reply-To: <aiigtwDM-qEBxjH5@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 10:02:26 +0700
X-Gm-Features: AVVi8CfBRh81q-V9vKQU8QeMWprqYN4zKvZvg-BCK79uayFJBD6bEhlpmrZ0dxE
Message-ID: <CAABR9nGVNFs6GPZaKA6JA=+G6J3+WdGcn2T+sac1YL5N0VS=wQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your reviews.

> >  static int fsi_hw_shutdown(struct fsi_priv *fsi,
> >                           struct device *dev)
> >  {
> > +     int ret;
> >       /* stop master clock */
> > -     if (fsi_is_clk_master(fsi))
> > -             return fsi_clk_disable(dev, fsi);
> > +     if (fsi_is_clk_master(fsi)) {
> > +             ret = fsi_clk_disable(dev, fsi);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +     /* stop spu bus bridge clock */
> > +     clk_disable(fsi->master->clk_spu);
>
> ...but the matching disable is skipped if !fsi_is_clk_master().

I understand your point now.
The reason I originally implemented it that way was that I was
concerned about a potential system hang
if hw_shutdown() failed while the SPU clock had already been disabled.
At the moment, it is still unclear
to me whether any further register accesses could occur after
hw_shutdown() returns an error.

However, I agree that maintaining a balanced enable/disable sequence
is more important here.
Therefore, I will modify the code as follows:

+ int ret = 0;

+ if (fsi_is_clk_master(fsi))
+       ret = fsi_clk_disable(dev, fsi);

+ /* stop spu bus bridge clock */
+ clk_disable(fsi->master->clk_spu);

+ return ret;

If we later find that a system hang still occurs in the master case,
I will investigate and address that issue separately.

Best regards,
Phuc
