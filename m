Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541D372B50
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548369; cv=none; b=FAYpJidEhgc4ANtblfYAg7lsilEssL8WZ1r1gHE/XvpgH7HTPDQRLIhIghKish9bQAa4HNWSzmveYiigP167xFZlt2UOxIi8zKrO+XxJBNZt3Ezd0oSnuu5RP7A+US7hpHRE9yBBJ3+dEY17iuUpul5LGeFJDy/yCaECl0dFQoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548369; c=relaxed/simple;
	bh=fkgXul/nJOgkXGvFeDehAnwGgKSUSla8yTa1Z8/1Jpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NX+IxoxkeOuuA1dpfo1NwII4U91NTVcZ1P2K/M3CUTpyI+pq7pfQVfVuU1cF7lPzVElujEIl39NzGCUfXohpXFtarKvo2IxBNlSOrrTLrVTCwbiL9Ux7cdt4v1yyTv7BCy7FjkalzhQfAkn8A9i9Q+MVvfS5HxinCpDNPtrjs0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfaa014978so499684e0c.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548363; x=1787153163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=78VLJwlu5AYvqnqVZxumFMoCfA6OYUpYOq61FM+4USw=;
        b=nj6ZxzO0l21XEFNeBojPLLC/kTDhdMK3ACp90ul56p2eN/X1KbOmx8M4rN+SpADX4k
         iUZMbtWnjXGUdLzdydIASbURf4odiYWhdEagQB1oUMPCPOVMQlYKhrK9G6by2u+UuTJs
         ulTyhSSDMGkMrWv66QTZ8bOayMaK2kfbYpqdXzwyQ3MpiiqCeEbC0fYPmXJyGBV/D+mI
         QM9atK2NzsLJm54xFXab51uSE8tQspxIsaNBU/jQ3voyk6izGjrPySZJMrT7hMcWRViQ
         rj0V7lmqtwvgj8I5SIgYCVxyl546hK4dUnj/ybOMHd5i8IdniUcPxsvReK342k6jTX08
         y4wA==
X-Forwarded-Encrypted: i=1; AHgh+RqtGV4IIeHQZGl+lgXOIg9++miHiJKs8ulWYMZguEuxjNnSMM+l6o6VfArVwcyNtlo1PjlDm8nEinjE@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/GPQjUtPhMO0AXa6fR3OHzqqa8/e7hgEcA32U7qHVqRlsiID
	bQjrYDZCLBPxQDyVZiLqYCoi4ffdaxPLUtWOrts24urQnsFGmg7JcPhHy4TZcVwa
X-Gm-Gg: AR+sD105CGDUJpa1843zOfVIQgdrGNouWwG32Hs/BrgN7rpZ4xPdaLTF4HtuzAy2AY4
	/OI0525xXGz0Dc2ELFMVABPUbUbOHYmCv13wD/ttg10JrXVPZfhzBqRr5PxPlEbJuBfhH0e3LAb
	XN/ZOHPddnvqRTTsimsAdqUO/0+eGs6/22+Uluy0zwueWvURI3/CZGhKhyQHNZRd++aPA24RNx4
	1yB+krgwyy1YlFXRcQlyQCcaVyoORDwB95RKzlFqL8suSYkKPv6oADhNjrhSpFTv+pu6wFl5yBl
	s13gaztbAZKw1BmzsjeLwPaKMMbwuMwHnIQ71c+S1F0YSsizSaqnhxSDCH16JFTk9S2nUpsl/OX
	NLgA3YX9lCMZkWj0nTbZISiUchg+lC6AOuEwrTTplF0vd2l72Xs5bvbzlX5u9e4zpiXLo/SP3iK
	CM2sg2jk9sUfSKIl4rJ9aI/A/uPzEZkIcGoroTqlAlyJ8bIjUleuQlNjhPfjPdTdxFApWQhN4Ol
	PA+kLJfq7Q7+YS9njhy7h8Weg==
X-Received: by 2002:a05:6122:6603:b0:5bd:b2e1:e1f5 with SMTP id 71dfb90a1353d-5c4f830a871mr649869e0c.2.1786548362879;
        Wed, 12 Aug 2026 08:26:02 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b4c4fbdsm1512783e0c.6.2026.08.12.08.26.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:26:01 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9690c99c917so408347241.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqALBLcegq4pWJx3TRJESkyydp8i7cHtdiOf/rHzHZsZx/KkcXaHNtHd06KvJpsDTWQoCcE1bLVF01K@vger.kernel.org
X-Received: by 2002:a05:6102:faa:b0:73a:128b:ea07 with SMTP id
 ada2fe7eead31-76c8b1b2837mr1127524137.14.1786548360861; Wed, 12 Aug 2026
 08:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-5-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:25:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQi0Otg0OQEq2KT+bTOx3bz-5S7aeYu8=QLaA9cEVzwg@mail.gmail.com>
X-Gm-Features: AUfX_mwE4ktTS5rxLf10ik_kUgMXbnGu-JrD24HfTOrwoPGW8DnsK9P-lfILEFc
Message-ID: <CAMuHMdXQi0Otg0OQEq2KT+bTOx3bz-5S7aeYu8=QLaA9cEVzwg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g077: Switch GBETH TX queue
 scheduling to WRR
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 10:55, Ovidiu Panait
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
> Fixes: 394c1e24a4cf ("arm64: dts: renesas: r9a09g077: Add GMAC nodes")
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
