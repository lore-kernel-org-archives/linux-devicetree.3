Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B208C3C65E0
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984108; cv=none; b=e+yrA5iSEEbjS8Zy+/AmbD+3EtQB/gx2YgNXwC+rq1w3EA6/XZmOEhuF1YNuROVjCZO7cX0FxJUws06EJcdM3iFObunSBiHh4obNwJhbNPS2VVlWhL2vgpZvHxwjQ9XYVCY1+AfRzyOumdyZNcDqZJCHWPRoOa+TtYbDm/tqOaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984108; c=relaxed/simple;
	bh=n9yLVv4ONKzRdpCf8VFwTS/MdDc1G1FjImPOjJ/IqKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RllDYW7jN1hePmBx3jl2ThewX+bflLjjI/8ZUGX+JXos6xsiRiPsvGE9S19LLSSAGqx/65yVcGvEN9vZ6ZUpsJfa3q2jmdQFZS5YyYVPdpV2Gtus/FKhW0U2/y+jyNJ2uRimlVvWaMaLRXcfWLlIdvWnW0YTp3sxHdv+ICCEkCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37ffdc718f8so1347247a91.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984107; x=1783588907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3iqz34neGUxAgVEYrpwzzcpe57aRQt9k5cgKzpkuWc=;
        b=cC5aAIp8chYOY2lMOihCDS8vueUIRmu5Tgjl5oMgec8CBjnO8q5ZRC4Rt+NEOOx9aS
         3pMOHiTEE8+bvCNpej1DDaGueQz69k1F9ItGSFvC7omcdH4kbMAnquCaYmsQYeRvsmew
         98N8iHIXwET1rwU0fWU2tzN02pQr1UxYGwVopNSwMsar/pGq1BCRhNGLC+/a8dmWD1TO
         vMY4BqwM+ZZqZp3Yea2g3GuoMdLbyZy9G4wuXrjFUISpZRqiFChwPJf+P3xXX9IYea4K
         3wnX72uC9NJ6+KvZ3X3wyudv8QrdyRCU6gqRlsZKGotpy7Nk6UZPaRtcYACptdaK3tji
         STAg==
X-Forwarded-Encrypted: i=1; AHgh+RoBT+7jmkL96se6PqIhq9C/VMYZc4+wTcMFMN5+TBMK+sCCZYF8jy4bxIo83YpoUswmQZDvkEDLnWvt@vger.kernel.org
X-Gm-Message-State: AOJu0YxeKEkNEYpVFvVyHTkspg1c/mnBEOgW/5x+LQDD0W3mst67GGK3
	SXPkoYEZZyqjOa8NbHuuSyGLdhxgtjUbk9Yk2oP3EART8dn9S0WemuRAAS0QTIjSXSM=
X-Gm-Gg: AfdE7cknkfpCKeBhDqmgXZu/dVajQX0e0hWwVV7VtSgNK9TPbCe22m7T4qk6WFCERwf
	fhCwF/1K8Zw172mx3R+7LPWhFSO+A+V/QEIurvB7BAr4+foFeXiRQNUt5bTwZ8qxqE8CZ7DIjBX
	3/1bEbp9/zVCBCXamhX7JdpH2VqGpyP0ImAUGIKq/M1oNXtPGjwTlRRxdqt/bnLLhl7/eag80Nk
	Hq27Hh90OEoEaOTpUtChXKObtLTiMf2h0ZoaO0LTVPLPu0YdXNPdNMydOIOGCrYHKcO6dFyGvwN
	9Uo3Y3iITuhlNe3s6pe5EQ5xEABUn2xglaS7FUJOkDGHa4BzWGiv4NY6l+KQHYEerG/eFVkMvTK
	No4VTP7C0paD4HKeuJCFF8qbo7cp/ryc13TT59JPbhpqGCmcQ8dJ2qgTaBhnWb3ax0HEODB5XFG
	q65NTeGX89Ohk/sq7YhOFpr9MMgBJh3QjsCBq+TArxbkW2Nf66aRkWR4fGifgCqhEk
X-Received: by 2002:a17:90a:d446:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-380aa0952b5mr5042121a91.7.1782984106651;
        Thu, 02 Jul 2026 02:21:46 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e15c3810sm762751a91.3.2026.07.02.02.21.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:21:46 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso704264a12.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:21:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Nrb4AEVqvlIYJQXqZPcuowW1/OnkA9EdYGXfDQJe0wridp1naehzFOMXJycPTaU8Ta+NtjSVWkrNo@vger.kernel.org
X-Received: by 2002:a05:6102:1620:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-73da7681403mr2525301137.6.1782983793184; Thu, 02 Jul 2026
 02:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Gm-Features: AVVi8Cef5-UyxrfN1fWvFDcXcIwIbwhU7f5lsircbKpxY8MZwCT2oXalNKmt_xQ
Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> >> > driver instead of the MAC driver where it was previously. Instead of cramming
> >> > both HLOS and firmware handling into the same driver, I figured it makes more
> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
> >> > any).
> >>
> >> I think you are mixing up DT bindings and driver implementation?
> >
> > Should the bindings change if we have different driver and firmware
> > implementations? Isn't binding supposed to be agnostic of
> > implementations..?
>
> I've thought about it some more and I believe this question is philosophical in
> nature.
>
> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
> the same Lemans Ride board and it becomes one or the other. Yet they are not
> described by the same DTS and the bindings differ as well. I don't see why we
> wouldn't allow the same approach for the this PHY.
>
> We treat it as different HW variant when it's managed by firmware - just like
> we do with the rest of the SoC.

DT describes hardware, not software policy.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
