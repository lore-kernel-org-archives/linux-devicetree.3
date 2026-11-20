Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172581;
	b=2Ko76+S7dpFcoDEUvJiuDtEC6AqSleVo6OJH0wmHWN9yngHd4f2ZRNeuV131dYtvTTUv
	 7rSv0bdVW7Z4Fp6UWzEzPzcXxQ+nTvWrKQuilvq7XdOWj2dP6MQW0GHZTNO9luuX3OX56
	 3wL7/H3ZWVPl/WA6FuyKUKgDBZrWYOq8xb6jL8qTyGZqZKMxCfsF6LMpvRT3b2X9VtoX+
	 d3jymHOqgMVCfTls1m5MbADdM8Ml0UQennHDtsRaxs/A8yCEaJktvj67WCBOjR4MFv+zK
	 Xno5CkGE1Uyx9NukQGU9sE6QGyvDcXwtr1jzp9aLBWEVr3UXRkLKpJMDcL1WKFp5OEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172581;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Dgzf7aguqheoAiwvW86CTGnaIKKdaAl+KcGgpUHUbOg=;
	b=N38zMEBRgCmeY/OocBMHkG2L7bZ+OZhF0U0lWslwen71CChfRAdjadN9BaErG9KTToMm
	 cOXVGqvucKC/CvTSBI6ywTgV/NgX2gu4ROezUryLpAGtNpJQURUZDA1dzmhqgMJWSe/pW
	 z9JG304jN8JFcfMrwlzv2qHNdKJxF2uVQL+AreaG6cuFftvkqtrZiHNrkTWChJ6o0bQbY
	 eLXdvypYcI0NNhYcEt9mzNx+RQGM4eJnqmUyt7IktBOVbLhpYUI4IORCpmdqPkAfm6SVW
	 HIT7E2/XcPlPLnbTXHFGqCw9jJzX/IqKjtEZVoUPJ2PlWVoYhbOODeWw0uvljK/1PWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601FB606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601FB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99e0b348a05so211728241.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172580; x=1795777380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dgzf7aguqheoAiwvW86CTGnaIKKdaAl+KcGgpUHUbOg=;
        b=fuso1vleP1Qs+g46xglVcas7h7XOn5GdejeIUST5xsgzW46hbTo6f/LhU8Q1EP0CQM
         Jqa1o1SiYAsnaMHQZ4yhydqkjtTwln8aN0MkYxp2eu7NQzGkqzKB1pd/8IDwGYVSpoTx
         2iUeM84LM7PxP1Rg4tHe5LQMv1+QiX80BwInpmqoSTVSTemDINPpDM0vRpg7MHI4XKeU
         1v5OEKuMEY4y+FFYa9yuRKZgSeFTxpwt5OV+QfyOsVgZ2tPvOWHxYV7fmdchcSvqZ8FE
         Yj6wV4ndcQYjqnb9o8CXzHGli1uWNUKNSEEk8wYmwyCJhNLlaOKR0Wif31mk6Vmp21UX
         76ig==
X-Forwarded-Encrypted: i=1; AL+hErFEKxEBbYX5jdWP8r0teTifSQEfhxqfymL5mqkFKIjesrRKkGmdoJeiR4TspKAfl8Q1KrKAk+Tvpd6g@vger.kernel.org
X-Gm-Message-State: APuU4Z8KCozQqn678A9vIHe/kodDA722mA+7dCfb0Ed+G2CYWkq2IxOH
	W9G79xE53D3dGoRbxnuy9J0/4u/J6Abb1Z3UV4grb9AE8B8PNub15lFc0PrktTpr
X-Gm-Gg: AZFdTZf2WG1z5M2LVqFHORnd+5aKImoIZyj8QJI7BA/rrQGyt2ibo1tD0H4tmNWPSfz
	7WJPpKBOXht2IcODgbpTEr53IMEVPc9CinmAHIFOZj//jXplPb8h+0nGwo+mbkvqupmwRWQx0Cw
	LVWH1rqQlVayq0sEUPhnqVew/l+pS7V0uZscaHpY9RjthxhDhE9LNGIWsKUtp3ESLq60ncCGyy6
	qqHCV9EeoELdwtPvy/4SPQqIgM8SG9VhaMHMRUtHymeng0DwPoLHYk7aPxtM66EzbKb2YB9T3QB
	1f0p0K9KjzXZ64gF94TGiKQati75dcEjPJCtLopGksRlY71q5mIVLYA2py6AEmN2etmrVESsKls
	+KCNvnDLDcLldCRgpBa0Dh4PQ0KC+tgCD3WCkOlTRgWjHVMSf6VxRcnsh8dHjlhCx8CH0TxnfLs
	6vSi2QefkD/7QjBQeINY12rSdOp5dXI5iDqiGt4fZZhtf9NWWJ2SFw19WdsweXiaqNfdntJpwXz
	Ym5k+kvv60X9k5C/PDHZaFrLl0loiVJ/NKsq97mk6BT3GYR+336dADEKiyysBU3lX8qQNb1JeLz
	RlIg/tYmaFw844CAaSCp9BVBhVbCO+P0fteQ1JxZVk4LpGOQHezG145ljBBt+2EyJMTvl4rabZt
	pI+YHa5TDBjp4
X-Received: by 2002:a05:6102:4421:b0:7d6:a4bb:5ee5 with SMTP id ada2fe7eead31-7d72b362328mr947294137.4.1795172580170;
        Fri, 20 Nov 2026 03:03:00 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e81cee49sm2641041137.8.2026.11.20.03.02.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:02:59 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso234983241.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:02:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH2I3CMyU3Kckp8q5NXb8DhUFPLSwWTn4XxeoWDeSKibMvY5e3Iykti/a/lYoc5W1RlPZycif/PQHGc@vger.kernel.org
X-Received: by 2002:a05:6122:1307:b0:5ea:94cd:c5d7 with SMTP id
 71dfb90a1353d-5ee8af38b50mr1262670e0c.16.1795172579449; Fri, 20 Nov 2026
 03:02:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260902141544.565763-7-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260902141544.565763-7-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:02:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHHpawxb_bvbC6Oi9t3_5ExanfJW2zhkCOTevawtZLew@mail.gmail.com>
X-Gm-Features: Aa3M54rengaq81sGnkGug22WDB8YugYyeSQm_WaDyvyTw8kAqbaCOVfSJpyWwN0
Message-ID: <CAMuHMdUHHpawxb_bvbC6Oi9t3_5ExanfJW2zhkCOTevawtZLew@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: r9a08g045: Add CAN-FD node
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 16:16, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC includes a CAN-FD controller with two channels.
> Add the corresponding device tree node.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
