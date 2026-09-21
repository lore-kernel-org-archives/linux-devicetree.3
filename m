Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257823ACA75
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974824; cv=none; b=VlC1yyIxfYtFGG7goCTbgw3RQvJhbsBiKWvVQz+SinuO+ad0X4wfri/oRBHwUwr6InSXRm6Q8ewuRLRgvjP4FfIjcybvrP0K3lUGwVswiswDJ/iq4BbCohYqcT+HdEfLUNXTwwKQLgbAG2KTRW3xrjRy2vj1fRmFbtmVCF5SZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974824; c=relaxed/simple;
	bh=IWy4s88MhDwNpHOdGe3jP1qXGMxg1e08ypz8dpiL9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pAJki2kw1U8Sk6LmUHyymvBintmJun1U3SVBem2+VvlvctLaHf6AicOPS0on3JcAzFXxj7Fpcye8bxpBbVWMijb2p74etp1TGi0x5H9QkxcDvW2R2haBtimerJhv4NgNJ50ZkorZhKtm5ZkLEuOnIjT/FLI6oESt9iLS+qrV38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb767cc7fso22655271cf.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974822; x=1790579622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOgPfCklfblv+g6nVV8jDyWvhZtKrbscHFmS476/ss4=;
        b=UkjIJPAZsqzrmKO2zMgbQqgsIIqjuuPxNDyjFjsSqGVDgy3HMg4NLz2sg6GQ4rzROu
         QPh+aigPCYLPkvKi3dphjpZrlSBhmKeULV2oIDdmmV+1MjdTt7sypVQE8xLPhVgUMqQ0
         eb+vLTN2vTH3lho0TFOiZZq34Ny9618Rmfxel5VFslWCZTYdTNcZ3L7PM8pk3OfFD4oL
         Njtt5lgryOilJwtxCZwk3P+tZBJUsrIMG4QKkS/DfOZlrmsV6CpK4O/E/0sh40mkSuMG
         wzssZRYRooz7qDhDfg0k/G4K5RSA2/48H/Tex7UAc7MU6eCyH6r5muD7YlQSuCD7jDX8
         AoVg==
X-Forwarded-Encrypted: i=1; AKwUvBxmq10QFx9KP0eOeyi9V4qsjylH0+5JK0Uvj/dWemMYo+ctmA3RnDcLZr87qB6jHS6drhcpj/vjqu6R@vger.kernel.org
X-Gm-Message-State: AFuF++m6sOhmtLTj9bOYyrw4Sy+niz1WzG5Q8Mf00/fjp9QbGlRBaCXS
	NHjWPv08D8bOUtI3FmFULFKKQzbDRLYr4FtuPherIULBtdnhuWkImHhWKGBgH/ue
X-Gm-Gg: AYBFou2Cis7DZkU7RaR5xybXr6WoTv+cSSuqZyNWXLPOelKnPJE5m9zbF6LFm8rGhi/
	WXo/Ko5QOAgxo3p9Jpl4PRD27rGvIWD7828169+dYLe+B1VZkY2wBPQpQSwBfhLJFDm9PxpfPFh
	cCLmPCSQiEoGMaWg1XvAPW6hzsOFBAFEeVj6b4QdX7889hVhhWTSe9rgK8ackyy1zhGbu/mexRz
	oIBxjfvEwbgkIUeGhW3Fahd4ShSuLDpWRhwi7inUC6+zsCubsZ3+KRyuhpuidlZUqiEf5mNdihL
	oB/bU2dFSyMKQYZDdzhFpumRXLmM2U8nF8Yi/SuRm6bgQXL1Sv3fx7OOkFhwK4V381F/vy9SThi
	5tyzQIiBIEYFhA5avsxaEzMfMbKVOTx/9DmIA5/BNqSqTKMsZ06lP2z0eCBtKc3vFkEnR3Duvw9
	t9buVl6HGlJ8/uulOF52cM2BMLKfyairh3OG8A4VL3asteEkso5/DCtVXTzhQVuKz3n8WmjDqHT
	9JudEMP/0GLAmeGvwtAGfco8c59AmneFzoxzw==
X-Received: by 2002:a05:620a:2953:b0:93a:1b82:4962 with SMTP id af79cd13be357-93bf56f9c65mr833609885a.47.1789974821929;
        Mon, 21 Sep 2026 00:13:41 -0700 (PDT)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com. [74.125.230.235])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedb7cf8bsm580064485a.46.2026.09.21.00.13.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:13:41 -0700 (PDT)
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc71so25504641cf.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXTcmHDr4DT/m9jyfyg7WbnDuMNtiZcx0vaDMDnPBF+NqOTyJY4hA+cr/ZlAmHADMWs8lnzKx8dpZP@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7a7:198b:674e with SMTP id
 ada2fe7eead31-7a7198b70eemr2080779137.35.1789974354429; Mon, 21 Sep 2026
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
X-Gm-Features: AcwNN1WjYVMR8LtQc9Hk29H2mvcKQfYOy_09b_XHHWkw76vwCkEFuElZphsH01o
Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
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
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

Hi Kieran,

On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> initially supports the Orientation types and convert existing users
> throughout the code base.

Just noticed these are already in since commit 6ab5acfb8dd38729
("dt-bindings: media: Add macros for video interface devices") in
media/master (next-20260903 and later)?

> v3 collects tags, and fixes the typo, but drops all hunks that do not

[...]

> v2:

Interesting changelog order ;-)

[...]

> v3:

[...]

> -v4:

[...]


> -v5:
>  - Definitions now accepted in linux-media, rebased to get conversions in.

Oh, you say so here ;-)

>       arm64: dts: renesas: Convert to new media orientation definitions

So it's been safe for me to pick this up since v5?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
