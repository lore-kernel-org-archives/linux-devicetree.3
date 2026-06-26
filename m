Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79772369D64
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477472; cv=none; b=qKieKEtZ0sL0UQKKvxjsjUxQfs0cOAlQv/aGCXEyqeRC+OCq97W/SUuSIbBg+ZXxZmTz+brsvqDCUqTvNVj+YYtyYnFk+GwQAC5sJ2Ch2cT9noEfZobD0ySkH/vgL/IJdTUpjJPZFsDM3opIbZXVamSiMmj1Kx8p/uxjJCUvii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477472; c=relaxed/simple;
	bh=L8m+v9Mumd9PBrIoKCr6p8n/MbxpHP4z26Qvy7erVnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgeAjet6SSgaZcZAxk7AkKe8ZOgTM/smto3MwIVPBtJ2PXlNAmD8O9K95RDibSxHRu66DoaiHiXCwwXKZEy/nfcU8wYq0QudMD4FkiT2rLYh5fXMZCawtgzWKqDwp9pBTDehn8spWXC4FZMQzM0sd9M2w7d/evqRC87Gk5+B4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4876d5335b2so563333b6e.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477470; x=1783082270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qc4TavqegVrav+S2qpl9+8s6wcCSKt3nqOoGSJ8Fvk=;
        b=hjzNj1byAsKsWSFReNztn3FcNSiKGYOlxFlCaNl+ErVMcc/P5rJel1b//FT8eoVw4P
         m+hy/P4UjwOcD060ndfos8cENFnoX7b3e1W176DdVvCsT96eo3ufWdXH4v/hwql25RS7
         0SSNw2opqUi7E8qTkTo8NgEIh68JZqkDzE1CJJuEO+Wb+8BxVbMdU0rw5A6e73uqfDcz
         YmggpIHKW20+OM16vCYJpJr/h5T500VGmvnloppaZrsFStpWFMsDgYwTdqIYnKld0D8j
         GOeFPTfIwb2RHppQ/0Fh1tOAraXk3nS63+KIolaZD4v5ONs5wlMGDe5uR0B0hWL8suU5
         8Q5w==
X-Forwarded-Encrypted: i=1; AFNElJ93gzT2NR/M39Xl7E6A/LmXWPSDa3EjwXphKn2XRQwrEXSF7mm37NWQ2H66ViJUC0ZX1l9F4x2hXy8R@vger.kernel.org
X-Gm-Message-State: AOJu0YytDKSpnISzeBjcUlja5JU9OE2ZLyliKX8R8RzBfcAg4hHWuCgp
	y/Z7yZDqioF0xPObF36w+qlNRXaxyYhM/1dxSuDnkjwzMwg8OsUHEnvB3fVKYo5p
X-Gm-Gg: AfdE7clECgw4eHx7PPzl/sTBt1GarEfEryS6KXCwUo5/yjLacXLRQdxUS/9w5hqO/J3
	8yMi70w0K2AKbtLk4XpJ9985pccfnnzg7PL7b+3kC4TMfAGCyKl0ccJ+7uFegWii79Durn7+N/W
	tEsRs+g3GPU/jTTGrr6WTv54iM/JdWcDaw2zAz/V+OnqLF51X2rHKkqqzeyQN5mcDHreaF6eZts
	e/to5TT6mgFLqAFKX0oRKoKEgzPKk4dN6wVR7EvMyT2AZKUugyjLOtddZVJBTINu+N+bV6cUbw2
	La1LRipMh9h12Xw7ewoX7gVxyiK9ZFkN77rOc9sWL5b+EYpCKM72z6fcPtbKtfKQ2ly6hpdrvRR
	NDbsIbuSW1pbjaNcts+LvIB/P3Laog86I3JVpx5RLF1Re3Mwh01KKJiWWwx4KvUK6chO8jk3Zqf
	Isop3hLii250kyvQAfJTbZrWj7gOHthr1Drah7xcbseExwL61RWzy2EQ==
X-Received: by 2002:a05:6808:50a3:b0:485:4815:de29 with SMTP id 5614622812f47-49215249fbdmr6747546b6e.6.1782477470517;
        Fri, 26 Jun 2026 05:37:50 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-49352b057dasm1262136b6e.6.2026.06.26.05.37.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:37:50 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4864a8e80bbso593412b6e.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bFmvR1IZfLV7rb5Tzw+JSorhFBYD0ITrGdMKQlJYm2q78aB6OryqbLT6AeEYpcrPQRPWIcAUGPNeO@vger.kernel.org
X-Received: by 2002:a05:6102:5491:b0:631:4580:6a46 with SMTP id
 ada2fe7eead31-73435b90f5fmr3476500137.17.1782477036873; Fri, 26 Jun 2026
 05:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com> <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 14:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
X-Gm-Features: AVVi8Cc1rFvCNNORSHDtFmL_tkYQ91oxJ5vGSfmmYwanPmDM2yIyJwQSJ-fX378
Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: Convert to new media
 orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 at 14:08, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the renesas device trees to use the new
> definitions.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
