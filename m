Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A4443E3F
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548256; cv=none; b=RwllGs9wpq50G0yYx/cmd4aZcew68gCaDavlvlagZ54LykQ//6QtRKRdUiXwyzvMy5zTQZcVQvABFARS0xrUGiTvaLGkW1a1prMPpx5lkCF7NCgOR/+tHuxh8acOi36HGUgACwmsyK2fVq2yMdQAmTkyK0iducaN3kfE7wDlyJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548256; c=relaxed/simple;
	bh=9S6tG7eJZN31suWJE/BxcyW2TUerziSfMO+T7zlebuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORYay2M3Nu/pgc5yZxypkN5rYYKzRUy39Mr3uCXQtNCM/yg2GAxMZA+NeOQ1++d0XvaFrJT5KYgOtnNtlGOynl37JhiNQhCilXYhLbs7Y301+sE+LzwSjqEBfmw69oVH+55E1oLHDwg+vgbHAea9DNCzqROfwk1HrRpx/4bN+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-75e2905c09aso234827137.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548253; x=1787153053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uH9hHAtONGrSCasVo64a/skQAyy7fg3fmulOYsxslps=;
        b=VhyDo0PkyX42EsBAL5Z4EMlUtxWyMwAqWXHkt8fOX/Ie3wHs4bFMXK3o7e3HDbS9uh
         y0mvu8cF4VWFutzOZgbyUJt5ypBJp4JZVnCBkyWVfHzuwXAMdprY0ly1287DuQymVS3H
         qxTsig9PzIQG3yyIXHkyR6sw/v3Z3uAOr0EPlLGWV19HHZsnaggSGCxBtiw2FhdyLYHI
         Ix2Dp4pMnpKLLyvmtM3XAnZzLTLG/V0UG5BdtZOzwbyLewWuRbz0SevkTA0thFCZEJiU
         jucl+upZBndp3grp9zxWGQ6f07oc9LxurVkXA81vbCUDheOtexlbS92Fq2vJHCnXGXRZ
         Z+nQ==
X-Forwarded-Encrypted: i=1; AHgh+RqebltchcVAGDLtXCHY5ZTnupYZXIC7c8OtNAyPoUvt0/r/mpanMWhxcz+LIbaYgYiXwN2TcBkjrU8y@vger.kernel.org
X-Gm-Message-State: AOJu0YwFNt7p8jn3XJhnAvYEpOi/snjfjq5X3w/KXwf50+zmsGHd/TMr
	mXOvqDO9rmlloSjOiid2yB5qBgzesdx28Dob+Op0LG+5QFmLXGumStqjXyUgXz9+
X-Gm-Gg: AR+sD12eDVbfG5atcjxgME5OMj4m2AflMLIdcHOnno/MxZ0BzxNHeAww9u/aKjsTKkw
	lgMQovIQvHBRW1IPAg/Ejd1NAne13nlAAB2d/ycsOP2OMVkukhnCOzXi1qWu0i68rB3tAuf56Ak
	P2Rr9N3WRO8A4VYXwOapW7Mvs2ExjwR0t2UZ1NT5vjN5LoVD9qvrQ3kURHi5SLnncgxWYDxkJfF
	1rKfDtVCpRaayJIkyGDtSEjmNs532o+r34zeqBD4LcY1Z+hX0G6t9IbGYqrVlf8w9TXBFfJHZyj
	zsLBeAn7JBJGNdquccy/GgAkTnwt5c8oKBSX/7BNH0HTG3byU7D10yu5bUhOQsiNW8no0eHOe8Y
	/pzWdrRlCtKCPu4v++OM8cQPW7NdyhfpzA30N1+C8jXHQdOzh61cULXb23vwu0LG0iO+oMWZcaa
	EU3yVjKng4Z7ilomCIAWVxA341cFPJVy64t32dxnbf1d9lA6757i15YMEzEPPM0LQQQrMxlyKsV
	V295h0wnRMfPVJg42diIC0slQO8IAyoURSz
X-Received: by 2002:a05:6102:3e28:b0:737:e354:4092 with SMTP id ada2fe7eead31-76c899745b9mr1177421137.11.1786548253568;
        Wed, 12 Aug 2026 08:24:13 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c1397bfsm1927910241.2.2026.08.12.08.24.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:24:12 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-745497ac8fcso351811137.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3SRgInGHN9aqDSEEqQQVucuwBy20BoEhTK8C0a1IsXGCHixIV/mNlYizneTqQ0DYd/lrtsxwhr/kS@vger.kernel.org
X-Received: by 2002:a05:6102:2b9c:b0:744:c068:438a with SMTP id
 ada2fe7eead31-76c87e76f58mr1085679137.5.1786548251491; Wed, 12 Aug 2026
 08:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:24:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzwAD58-cw+5zXhg-VBpOVV+FLYt-ZOSQKDUSn4VKNQA@mail.gmail.com>
X-Gm-Features: AUfX_mziju9ccGGEaVRv-C4Y24VRZU1VmvYmsrfRmau3nSASh2likHOdk95VE_4
Message-ID: <CAMuHMdWzwAD58-cw+5zXhg-VBpOVV+FLYt-ZOSQKDUSn4VKNQA@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r9a09g057: Switch GBETH TX queue
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
> Fixes: 050ee38d0002 ("arm64: dts: renesas: r9a09g057: Add GBETH nodes")
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
