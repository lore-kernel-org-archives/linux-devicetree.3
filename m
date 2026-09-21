Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC032439F77
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976936; cv=none; b=KaEJQJMqrYA5zYIsJ6Zg6VJg5PsJT9U7G2N/wiJLK0AUYuBef6tnkCgGXd61Pq1k/iRVIs0k1NgiQ+W2NDr1MkllOtDCc/ndOWDaeRo+SnR6yYXQmDbRspdBKc+kuk6TyngJE++h34Do0o46l3XjWcDcwqYMf8XFEHtWsoavWTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976936; c=relaxed/simple;
	bh=nRr2NwONb5MDiY74TwbEFnamWl7CEbEpARCJXKG89CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hp2AnLiy8JAClMwd0wP/C0aFQq1l7fuKRSfg6JGkHbctlB5+ekjunoSwgWKeo3zg7AWOWrlyuCyaWzoj7PjfJKdegvnKJo1NWWsI9c2A80UkaZRu74QX5qeE7KwNmUhcnoEBO0Jxqt3J/QtgSi2lRPjzGp2HR442J38HEf0GmkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98296941f1fso1283873241.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976933; x=1790581733;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FDUPsKvRHny4pMpTXrqtNbtll59mp87r5rbb0L/oblw=;
        b=iFtkxF1YNs/2D6gnmu2Di+wLGGzWdUmeNpAXTpwj2iEQLgSILqD1Wo/T4HMhkctDMp
         I8DcBmqncnrNlrNJyGmgK0PpQi4sdG2ktIhC8LCfir0riMuc/RqsclyWOx87yI3nO807
         scQFsYtB0p4GY559a/a6EGBiUuFqcoO/tI4PsFkeRFv9NovOBiHCCeOYphezhgNAAx43
         CXqEoP13wMBKIOMdrtRPpog0CqR7sspX7stqw+S1D50XAu2f7Lyzc6GEvPJ3/in1X33z
         +7VMCzLlxudYW3lLrG3blUq89p29vEP9py0smd3BbntJjvWPpBL0jZp1BLzFBGeF6Tp4
         MvuA==
X-Forwarded-Encrypted: i=1; AKwUvByJjc7hsEn8AJ0UvEbq+jOXS2yeQb0WT33nJXVsSCPGHzWoD/p4lWmiQ/nfLD4RQMbBu4jNI2D6PFdv@vger.kernel.org
X-Gm-Message-State: AFuF++nkXRIZzDSCQV578/176LUIjJ1N8dIQBk2roh7EiP5cIcXz1rLU
	SQ19NlDSKKZ0ZTZlNgF47qAjMf1thopRsWu8vV6RWC9r2kW/ASOJJg9hXTUoJ35g
X-Gm-Gg: AYBFou39TBBmM4HzCuIOWvRdpiWix55JuqCzHl894U191sK6iahbd5WcWHXZAegcGDg
	AZR4ou0ZdGnI0v95tjpf8be8HyakJNuE/9zMjdqDTMA0tRLPR6Ft403gItTdjAMs8zW+WaTWTAo
	7gnpF3aVzwWXUbTL2LE9sNBv+uo1ClScasjcJID4rUpYxn0ztI1KnMrqTum+StOuUck8tr/azAn
	LSJUIbmFREswdMGDP+6j1T/ZIIm6zxUEItq+IDBuI7BBxwe5JTcBChv0+Bcs4p5otEgsQsqELz1
	2w2tyWcj3FKJvV2r6VfuZw91AEaA0GV9A5k714NF9XNjs7479XSVcbuzpkWc6B5KXjwYsnHCJeG
	PA8ZTqPT/s3QRV4Cg+CPCMpoiqqI19XC63Y3iDtC+wWCRV5/+rHsdDQlCoFFw5qpWwXjaQEY4a/
	a6k4NRvuD7sTIw/eUzWY4jlD87dtUUOKzWtgCFIuBYelRaJWjUVfelmT5rUt/577sdaOoul+L/3
	o2ffEjwJ/JTcpbEpj5UtiALnGRNagNj9bct8Qd8hKh3d61V
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7a55daa4aefmr3553128137.28.1789976933522;
        Mon, 21 Sep 2026 00:48:53 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-984d53846f1sm7481130241.12.2026.09.21.00.48.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:48:53 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso1717782241.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:48:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzZ7hw3DQYl1irvQ/6tkIu4vQQW1Eus7ggbTteQdyEwKo5VbuHUH3XHPHaGYgm/DOfZPGcCol4Oc4X@vger.kernel.org
X-Received: by 2002:a05:6102:83d5:b0:7aa:17ba:3dfa with SMTP id
 ada2fe7eead31-7aa17ba42bbmr32910137.31.1789976483444; Mon, 21 Sep 2026
 00:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
X-Gm-Features: AcwNN1UjZbDPnIaj-fYRvcBoX7YE3K7C7k2z9bWrLFQVkND6DSGXX-e-oumCCsA
Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
Subject: Re: [PATCH DNI v2 00/11] media: rcar-fcp, vsp1: Enable on R-Car X5H
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Fri, 18 Sept 2026 at 19:07, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3" branch [0]. A
> branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
> VSPI:
> 145 tests: 138 passed, 0 failed, 7 skipped
> VSPB:
> 115 tests: 104 passed, 0 failed, 11 skipped
> VSPD (a):
> 114 tests: 99 passed, 0 failed, 15 skipped
>
> VSPD (b) hangs on the tests, so that needs some investigation.
>
> The first couple patches add clocks that are used by the FCP and VSP,
> but as the upstream X5H CPG driver is barebones at the moment and we
> don't yet ensure that the parents are enabled, these are marked as DNI
> for the moment.

The DTS patches use DNI definitions of clocks, so they should be DNI, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
