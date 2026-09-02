Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488C47AF5F
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348969; cv=none; b=Jr7LzURyK+GWqf+OggzZh9PXYL94J0VSR0OkZRp45kKMgPCk2KkI59uklizkvRk9GTdff9eGrMF1+1gsBMN7kvI/kMdhbmxwmPpw6fHmL5alB6EN/d+tNCEx3ecioxCQg+DzJziPyoWL31udPPNgYs9c8aLAWYN21QF1VXH+rm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348969; c=relaxed/simple;
	bh=wyPHokR3tqR3MR269liqtkoSqy7tkjxLQyug1Wc7V4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSZYkOkpnQovCIMc8YPPbZBwE3Gb2CuiMe3Nmhwq4U9Hm+lx9EuYt3u8n7zVMTe9ifarj6MpS67bp1tl4NrOqLKPNyCerDhgDAxvodsNvNZVlrw1pyazHO0YVuKO3fBbTs3IKxgHeC00wkXPMBJPcdnvffO7Of5erFmczJTz4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-782df51b4c1so687943137.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 04:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348959; x=1788953759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wG2vzYUiYB5Is79tPSwDBrckmDl3YMELkXESRZoQU1g=;
        b=euuxc6OQrJwB/ieEeg0/7P1oHIl6n0SMAc66PcLDgHBJXtj662ygZqevJf5i4ajbvh
         kAf8wa4AqW91my+dKx7hf5WMCjW5vodQLOe3UEKiNyqfHWbo0IeKrLk9Y5e6+O9U77JY
         6Ktb1u/FwJznsquKjxOZTKxc89r+qd+9sIl+jdjzZY2yAUILAStATm8s/66f1o8mnUgA
         MX0JDfn7iU3EFWFpw12q4biyUQQ9Lt1sRb4r0w/FNr4y1W0MyPDHx0UulKttfts2KWBQ
         wtv4mP4ojO/VqhMr4Ea7Swx2L6mEznhFjX1b5H2PaQzShzQaPf3PWx1QJhtzBDKFDcUD
         FtCw==
X-Forwarded-Encrypted: i=1; AKwUvByNdRPIDtEqKO1GUBrrcs7fMAfmaItsjfWhVl7ZF72wzQHBYMtVZ7ydjTwTzf4goSxspi0FBGynb2AX@vger.kernel.org
X-Gm-Message-State: AFuF++m709lubUBPumoPBA7PSHTFu/79H+ZV6ozgNfXVN19XkebJ7C5y
	c94Vp9nW9515cCt9ooYV6u/k6N3aGDz9+9phcQyZmciA/w2rHJAUNyn9Uw8Q0R0i
X-Gm-Gg: AYBFou0gfI0zlsXNPpnCTS20QfDUeU0jGltuQ0rjhxjyCxwO537whKxBaQ77ipyMPC1
	FdVyxUGmSwk52uuuwnp8rQHD5H5VZbOUYv9jLdDteqL18XezPJXn3r/21LYUWXO5RNzmInn8vru
	2MsAuLnSfmrZpFWZ3s5lCVtupk2ddDRkzoCH37aqaZG5CmzQA2D7MSfFn86fqccZx1pWbOUKy2S
	4qQne+dVZqoTXwVKVKlnjG4mwX5u0EJa+o9avjDm3kKAGNYUBs6Zd7GtbQGWaL6aHiUDdEsCr8u
	wIzwhQ/oczjUmUi5aqw6xQFg9YhnLxzdAmtBbQnRiDbOmmTB32eRO8m0mpWDRtMRgg17TjVUVl9
	mrs7thiYyGuaijFdMS0xWbwJgsluZcNSKSINJPF/m5uDmhVqj/w1YLjoMbGUlSOGBdkbef8G3T5
	XpXEMDp+rjF1Zqrg9ChQO9boykDoL/SBXUk4/0VZnaaqfGDnGJCEt5kFYt4PjKEK8aCmqTGoPdU
	9cf+Z5qLI6Gm6A2FZhTEo6tGLyqLrLl/xWeAMKhvw==
X-Received: by 2002:a05:6102:4489:b0:786:4607:bdaa with SMTP id ada2fe7eead31-78a1f29b1efmr1494093137.4.1788348959558;
        Wed, 02 Sep 2026 04:35:59 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9806728262esm1917100241.3.2026.09.02.04.35.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:35:59 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bf959b820cso945819e0c.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 04:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwDySFQyWv1mpvTyYfiJnNXcekhSrleQlwOkh5zJiht3ug8nQ5NF4bRkb6B92nnI6SBg4c7W4fN4Qg9@vger.kernel.org
X-Received: by 2002:a05:6122:489b:b0:5c7:98a9:cf95 with SMTP id
 71dfb90a1353d-5c7d27e3ce2mr1779605e0c.4.1788348958056; Wed, 02 Sep 2026
 04:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:35:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3POZVM4YmSN8r4rewPd9+GSnUvyL2F8oSqHzjk97Dbg@mail.gmail.com>
X-Gm-Features: AcwNN1UdAkMRtSpVoWeT4pt6w2QrIFGJ2Ah_h0QXalst1ZeOOfhDZh72790D8vw
Message-ID: <CAMuHMdU3POZVM4YmSN8r4rewPd9+GSnUvyL2F8oSqHzjk97Dbg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix GBETH TX scheduling policy for RZ/{V2H, V2N, G3E,
 T2H, N2H}
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Wed, 22 Jul 2026 at 10:54, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> This series switches the GBETH TX scheduling policy to
> Weighted-Round-Robin (WRR) on RZ/V2H, RZ/V2N, RZ/G3E, RZ/T2H and RZ/N2H
> SoCs.
>
> Since the GBETH nodes don't currently specify a TX scheduling policy,
> stmmac falls back to Strict Priority. In that configuration the highest
> priority queue gets all the traffic and starves the others under load.
>
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers adapter resets due to TX queue timeouts:
>
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
>
> Investigation showed that only the highest priority queue advances while
> the others stall for more than 5 seconds, causing the netdev watchdog
> reset.

FTR. fast-tracking to fixes for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
