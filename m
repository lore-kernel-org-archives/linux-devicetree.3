Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E36E3B6C11
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155751; cv=none; b=gpo0+J1dkEHH9cHwTzmgNYrkCCQsImhzv8UDEJ/nClyihMcSmaQBx4BTLvsKBxd6dWWaGj4BAqELxmR5BbIVZCWANIPPSrM7M01zoVePWXpcxAZVYfmnzF5b58Ru6niB5gOFPMnZ+PDdScQ04UOeyH4lmQWQVawnvOw/YTqC1J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155751; c=relaxed/simple;
	bh=lypAgJzHWEncZmxR4E+oh/3JTHBe5p1D6fz+pUoKT14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iri2L7u5Ibf6Fy2/6rQfv6DuR/0bRCoQ1zNuyoMzS+fO+6SFNqM9+wA+WkSh3gHVhh4zAKdRkGwnOR/9D3yisRZ93GZLSaimy3vyOUeN/8ofqyMi+w3rpi8STs3maccaGg0kO0SRQQQTxJwQ/E6iePM5EHSliZl6ENiLpN2NJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-57533363201so254821e0c.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155749; x=1778760549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzrFYBx2GSnIKOYLrSqa83GGZKfmsA8+rixqzY0vY7E=;
        b=SQ3CfIPVHEA2o/dCND8PY2Mol4FHw7ibQcgH04/HaKSRyIXb1cisr0Xd5UaWb67iuz
         d8uGHaq4VFl25VkdIo8x4J38bnQ/7iy8h8RtWiRUPjOyaUww/ENvo8TtRLH/GLV6hr9l
         IUY2U5loiaBQ2mW0m1fsn5vox/7S5w0cUG8Ml/XZ5MypUq76LecH843vUzCVWxvI2xlZ
         wf9MrOYiwURLwbdh7ehZrOKYClcilA5kiuDjalCbT5Qto3hky2U4ZCAECPjHpiJDOOak
         3DKd8C2L8QUe6JvuG3EwtoYO1I/1g1ekXztmNcfucJgEUKdqf8qe4AHb/not+TIhhrXn
         haTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5Pb9qKiX2WpMd5z9C4gcskuWWJI0ImgcsIbaEvJpYVABbBF8dBlmB5aQiSR2CfHwy2aP6GPftpl5+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk45AuS9gdlUuXqL+z+H4Lu68Vrx5zemKCd9NFc+8t5BeS3YxR
	ESKGmJxWpfAgV2OWG9cZmhMMo4K1wLgdk4E4g77UgFSjvE8DVq0SW3ISKNDxlmIpNFw=
X-Gm-Gg: AeBDiesl0oFmcNrmWwn3T76j6VoWin0XF2ho03yC14NoabpkxvuBK7KDzzz1v5Tmpoo
	vJcNrAMi3FROFT7blQ+wKNW0Fcy5TJO89O27R1rZDuONsLXV+2RIFOWAhQtwn7++1TMXodWWtef
	4xigbidtLYpja3YbaAJSbj4Y34idGUFd2HvicJ0jzi1aRpoGfMIO5a8L+YTpnCEUU/kuLD1jttk
	1qQ7Kos5KAAcXYcjghfN5wTLafEZZM5U1a6btVpsFW6nU7IUsAK4VSvHTY4AWf2O05DtlZRarTJ
	hRQAodVG6spKsrHC54p1MTby8N7o2FrLCPNKMjucXLGdH+m1PVf+HfQ1pu5p3A9fQJwlti62IS0
	wVfvRAL1Nvhu58jI/SQUmCTCZEGpPGAwdx0ohBpRdheu6yH/uFOrCExCxz4c2H3KpXOf51Akqyk
	ryJiTpX3ONKL2sYzP27cKvYs9Xvyexd9lDl2jr/zkPkXQkRSEQd06NIKSHs8qL9dcw1jQhygFEz
	Cw=
X-Received: by 2002:a05:6122:3209:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-575596abf66mr4362111e0c.9.1778155749043;
        Thu, 07 May 2026 05:09:09 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0b49973sm10450311241.11.2026.05.07.05.09.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:09:08 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57513a91514so240442e0c.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:09:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Qkqyc/TVL5hMuCHkL48SRgvp/TOqAE6DAdNYOyBt/ELrb8piNiEdNSmHgNKx3furBtt2VEddL95Ck@vger.kernel.org
X-Received: by 2002:a05:6122:6e0f:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-575595fff69mr3644664e0c.7.1778155747714; Thu, 07 May 2026
 05:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505125921.149682-1-biju.das.jz@bp.renesas.com> <20260505125921.149682-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505125921.149682-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:08:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgPN_xBs8Ac9ZA9qVLR37i1FOSpPDOJUauZyFM7PDt9Q@mail.gmail.com>
X-Gm-Features: AVHnY4KSzRkAu5HLwdsgATVzqQZtbLqhW6kNfH65xaatEyZ_QR1qMUgvGU8AF_s
Message-ID: <CAMuHMdWgPN_xBs8Ac9ZA9qVLR37i1FOSpPDOJUauZyFM7PDt9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 14:59, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable watchdog timer channel0 on RZ/G3L SoM DTSI
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
