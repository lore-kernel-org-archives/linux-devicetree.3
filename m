Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491E46E01A
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548348; cv=none; b=g3B+480z6O/gy/ZPJxlFJzt7vF3zRPqGOQkrZRCPa1MZOqr16wqogNh/hV//X3FUo6DN8cvuAiBk6hFzeea5lS+Q2Dfw/TiPe3lVuIn85beg08LXffu0q6qDawjpTTI09ejyAROuM/e9FKLo3CnG8m2KhMquuDauhZNo4gFa/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548348; c=relaxed/simple;
	bh=1Jx610SeGgFkLwKjerUyHY3s0tTgPNErbWBGiiSj1xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZ98PtPVuWClnA3zCYngcVlUzMOpHzs5ixCKR9uFA9rNBAYApiGNWGsHVC6C+z1zUHFmEVVLNwWmfp8qco5bh9K76E2yWcVJYRV8Y/jD02r2/Aw444ns3p079kUqTj8B09CwkpaE0cnC4UGFSaZgcax1q3V1FBcjG1bypxtnEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf959b820cso692853e0c.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548337; x=1787153137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XymJk8W/W4pkTIWis5GxvoRmhCk8uai40sswZrGrkUI=;
        b=gorE1CcJVyejjcD3HHfW7lb6E7Gg67Q7rZ7eY7SNTELejzspKcZA3k5fvb7XZ21wt3
         YldBjtvmhPjmoSjAmf5FKyWq0DooHGV/TAld1xYEmK5mGYyIEL0buyp2p/Ff3qjSP0fA
         DuKCQQx0jkMHf+n/VAQU+vzy2alxeGR1LZ6M2pOGB1RBYHO5Eu5Uc4cpCGqRM9db8AjA
         jzvcveL61l/CFq7saN5WUiblkcUWiye4wz8hrMWBpJsL5R23xDW06MS+ypUly/K2rg1E
         t3oFTolWxekr96PTw7aBQ4HebTLwCqooFwm8ylb+VFWKvIt5LOKguly1dHj7EaW4ld5H
         UkfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQzn3q4LtM2z70LG9M44q+9zTRLsv1p7TDXbMzR8TSq8np/KuaScaWPEkNkeMZ+/coMpdipHEWdx6D@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8mg2akZR85s6r52xQINeJ0qF/tk2qZ04OpoFT3g7Q3TRyAMR
	bfiatrYDz0HtvxRRQawxRIKi/zmOOLlJFOpbQvEP3CwP495WhVwJFMbKvIam0E01
X-Gm-Gg: AR+sD11NJSW/qeq+PuflVeRLjLrbs1BKAef0BM8nZ25Dk3R+528xlj9BuL+UGwlftnK
	cuHiipSWQBSSzAGLy6iyUMz8jVR6TER5ggXDyEoS3ufrnvxMAJaOcJMXEHFRWxXuW2l3RM3MGid
	rIT8kRcZaD9KGbek84TLY+AtjPLRfAHZoShx8ps/8EI5ElQG1m5lrLWjsF8mp6BLCJqvJyHWlwo
	imeAmeKelHL5mb4j7t8ZLWnffKM+xdt8GXht+7mve706hOVV+qG0p1XlTquoTOUQdDMC4K8XGoq
	HU9c9iKGC8VGznSuP3lqcbWb44JXO1q5JW4mXsJBY127vzZtivKjDSpHmA4OkLqDcDCekxeWwrs
	gqIbQ/hCvp1DG5Xgchr0/FqyWA81OkYSBRPSC3+PRawjVXl127rJlCAki8uXuaNaPjl12z7S/Er
	T1i+duKng8r9Cs7PT6fAzwC2ucnRx2Tmoa4breRtEJ9TWO+TgKicVYqRuX9W/mbA1efgX5rPi3M
	WjGQ6RSx3kEwvPtPQZREifv6A==
X-Received: by 2002:a05:6122:e467:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5c501ef1994mr775253e0c.4.1786548337175;
        Wed, 12 Aug 2026 08:25:37 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b74b9f6sm1332509e0c.13.2026.08.12.08.25.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:25:35 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-754acc61e10so438240137.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RquIDfQYk/ohlEdiNoeXNpXJo0Xi/PjmgUKnGZGdXz8LmFzj2/7QbylmmJF91DxSkzzljswWBCPfipS@vger.kernel.org
X-Received: by 2002:a05:6102:6896:b0:74c:7fd8:73f5 with SMTP id
 ada2fe7eead31-76c8885783dmr1566195137.6.1786548334096; Wed, 12 Aug 2026
 08:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:25:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXX5jsJmsDxdn-A7J3ELCO84q92H-xvWSVRnFiCkn_=RA@mail.gmail.com>
X-Gm-Features: AUfX_mykWtnGd-q1mRUf7k7eCfAnrFs5cG6noTRZhpPIlC844JZzbIN1LhoykkE
Message-ID: <CAMuHMdXX5jsJmsDxdn-A7J3ELCO84q92H-xvWSVRnFiCkn_=RA@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r9a09g056: Switch GBETH TX queue
 scheduling to WRR
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 10:54, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The GBETH ethernet nodes don't specify a TX scheduling policy, so stmmac
> falls back to Strict Priority. In this configuration the queue with the
> highest priority gets all the traffic, starving the others under load.
>
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers spurious adapter resets due to TX queue timeouts:
>
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
>
> Investigation shows that only the highest priority queue is advancing
> while the others stall for more than 5 seconds, causing a netdev watchdog
> reset.
>
> Switch the TX scheduling policy to Weighted-Round-Robin (WRR) so that
> traffic is processed across all queues, eliminating the stalls.
>
> Fixes: c8c8a57c5b40 ("arm64: dts: renesas: r9a09g056: Add GBETH nodes")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
