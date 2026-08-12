Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D4441022
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548398; cv=none; b=DGNbFSxLHOTMe4CVJR8M/Gr21s7p9t9gmop2YKBolVnBPIRNaAmneLXFkTP0e2166G501BxFtsqiBU2xcGz/idUEwwKipXcK0G0XKREWa44K6s8Uz1hK6eZtRS+/UeXqjgJLndUqQxhNyzDG8GIGH9V/TWGJdeyOJKCib9oDHok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548398; c=relaxed/simple;
	bh=IXy5DziotZrnP3xg055ayXT4Mxk0N16bRUegjbNwk0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tB6XaaodXRJrdL2ZugXeVJ26yWF+wxqZtGJimpJgEHJv3TABTDNq/Bn0P7AIT6DD9Up3lxo2PexrIGgAE2mU2dige9He8l/25UnznCDqi3DOIJv8JG+qCjpesdJ8Ef4vJSGLl3CC8x0gZ4SFToswRRa2YwYoJ2dx08wOwmDYkBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-979ec61bb02so285280241.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548385; x=1787153185;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=InyvOkSvHC+uaKrmsdi51j5Kk51cP5W6a9/RFap+wEE=;
        b=KgaVfyrgYlxWixvql/vaNF98qqLpSg2HhRIJMy42vqFVc66RO6Mwq1D3cOkH4UbRSu
         rBpSMpK7oJKMH7lPDe4RfbmIly9G00+AjAkGF7evWfaj+0mdKwUCDkiz0MSAYbQoodVP
         H5Ny6yqx2P/fRlbXztwfqsJlXkAKO35UfhskP1GTUlo6+FJyZ3xfhKmxoNHLgl3L6uRo
         ONRX/MzfvJnMaEfC9gTPc4eESETTCQOpl88aCRVsIKBKrGu2VHpQkYTC0tMpA5Bvu91y
         2Uv62bu1mw6dLJUD0912RwBnu2JKQGeoi39VOZXpfSCKGZYQ3vP7nBLws+lDfI5TB22F
         epwg==
X-Forwarded-Encrypted: i=1; AHgh+RqZRPgTlLsCq5qyZlg9SDFxoyDTVgd6/FnvDLlV5q1DKyJkjpAeFX0cUMDPTVO/ZbIeLL22cudiHpmQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwgXKXB0Chz4klI6ajML8fU6IEdTM+Bf3TwxCSvbczwGJc4jPuZ
	ygtUafF13dWfXo3kEHJ2pMWe1F+TYDygq2pvvemNWaeaemNqRdfjsGLqLRmEWPVF
X-Gm-Gg: AR+sD12y4Nj6midqDFCoELGhpIOf3GoXO/hTEpDGk/2u6Wv9i81HxsKyE3B4NOdmaWe
	J4v7BAaxKSw1irtHCJ9zCZY8N4+LHSizHDgrZdgaJvcVmv2BvM9M7X7nEYYhCxKO8hDm6lZh0mx
	iwaSHvPmUSILRCc+t4ACDKSlu9iqHiWcQ9Quk7yv5jcRGYr5YiLXh93zLximiDbxdd3ETSDsFTQ
	oEZ/X6Iw0tVU5PsQ21ypQ+ZzYrewftUX/F8J3Fbwk9KkqgP3v2rnrNUpJetT+522MhmsMpv/d5R
	b08B2mIZVpIxNSLESit/jbsHXvovJwSou+0aVCERxJRRHEcKGLbpQkEgGWw+OpLLm8H9vDQMm54
	rBIccAr94TJp+4zZtN7Em7JRukt+bV6dXc5yY1ZeKvr2JKVytvmOa1ZfFcT7MHk2Ije+YHecPNf
	hmJWC6mkjJZTA9hWvYJNK5nC1fij3OMVq4YVeKrJfcLdeXprLjMJ8oL7vK6EL1fqa6FfLysL5tJ
	HwryGQbnELBOBakShvEv/Dy2VB3SnmjIpCN
X-Received: by 2002:a05:6102:80a3:b0:739:d787:be8 with SMTP id ada2fe7eead31-76c899739b3mr1088995137.9.1786548384881;
        Wed, 12 Aug 2026 08:26:24 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c290fa0sm1839420241.10.2026.08.12.08.26.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:26:23 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9692373e0b1so316592241.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrpXTP109iztMfis4h4CLDuMB3o2jVFU01hzCRTiRDyVCwvbiEjVbs6nxWEDXK5Ee6SjHFepwy3R2O6@vger.kernel.org
X-Received: by 2002:a05:6102:fa0:b0:73a:128c:4e3d with SMTP id
 ada2fe7eead31-76c8886820bmr1088766137.8.1786548382938; Wed, 12 Aug 2026
 08:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:26:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYm6ZU0+v6E62_sHtLRccup7CC4OeNNXy8cW9PWobM_g@mail.gmail.com>
X-Gm-Features: AUfX_mxrfLcygKoGMM7oeIyAjWWTavZKJxRsupGsXRM-sGwtdaYErDEQ4J36rHI
Message-ID: <CAMuHMdUYm6ZU0+v6E62_sHtLRccup7CC4OeNNXy8cW9PWobM_g@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r9a09g047: Switch GBETH TX queue
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
> Fixes: 41ffbb1c42d3 ("arm64: dts: renesas: r9a09g047: Add GBETH nodes")
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
