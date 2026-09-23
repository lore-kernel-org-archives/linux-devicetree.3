Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61E451FCD1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167259; cv=none; b=cNCHWyccXJ7QGNeq2htGHzdsKwHk5Du9GExjdlJiAmb0s1sHk5FxFqCCRdxUDQYfirYs0kVr05JToTuyhehN6y4wRdDSZ8o8Dif5oxm5juSCmlEtrqImzqasIdpDJXCuhR05gmESwQrXHYzUcO+BJYeTU0RwLi16vtwp3Bg/SRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167259; c=relaxed/simple;
	bh=EfNXHDSpd8SaNyXGdUaOjzW2OpbKeUB9UNXfiskVQ6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHRu43yBzU2ZrSbr8+xrryHLt3xyamyazAFuAP1V9xMr0cvsQP9dQwtjC4Uc2avp7zXiKAZOlwEMnhfk3x28/A1sRkpRZr3qiSdgkJyK26AaAMtysZBpYuPH0Agx/5hUfdx13usjOeOcn1WhDSS16iJ/g/NZnv0BKH7jiqSkJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97ea1a712deso306186241.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167256; x=1790772056;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hc1TTWP/ig0ekllF54ZiQ7BuKR9C4G2lvuDy9dKjh8=;
        b=fjibe7UudO7sVElKL4KRvHTK4WQ1lZpjZ2lG76eJk9nfYxbHzQc9RDWhKfHHmDTOp3
         2Bzq7keEO51PL0O1PhQspK+h5vk5MtioCgqWEgw5uSq7o05WihkLOhCTjz6bUIKoNPe/
         xBSSbo+4z5WUYPyGMouKBomYgN8VzIwrm3g5GiyN6Z73w5AI7f9SQNjIry+WL14ZB7MW
         DxhvwA5f9783lV2aheB6Uo14xIfvLHEX7vJ+/sWmWzGVJdgULVvESPhr+nrG+foOVHXd
         7A/bUNTb4ftI6GLJOkkiSLtowwdQHlJm4h4s4yIg+4Q0dYC74uZ9qI6rpkJ7jDMBJ91O
         q6qg==
X-Forwarded-Encrypted: i=1; AKwUvBxuj5t1jiuwgrL0upFpaw66RP6DTt2j21DqpUi3WrheRP+AUM2g44wxsC5+nqsIBm1cAajfPseGdP8m@vger.kernel.org
X-Gm-Message-State: AFuF++kktY6G5q0ixWayajiBv/M05Uax6cR8Dp3JjgBrVkHxR5rnv++9
	oXp4FXKZe4Uz2pdNuYTmtx6h3BYj9qXIpwZzzkbSjmXtEcvvTU/G+sSS4as3Qx8imBc=
X-Gm-Gg: AYBFou3lNQQz7dhBsFfbdouyYYPoTktwSUHwq1QZR2tPeDCNpU9WBbtEyBzEzPv+E5i
	KXLFj4B3HTHCD5IFRB7MooaJEVuhFmooh1jBEWoh3nit+0az1TcQho0t20GIKxm5LPq3/cosivO
	xgx8Lv8xqJk/fMixrJW4l1yIp37c4IO6B1ewKf+IOXabSjh/k5yu50zKO4ykvrnBLkyZeHK/Sqa
	2AysJOaeGXcTB9aEWcpU8CWjHdjIyCCJzD16yG4Bq4K8VxLDpDIktobT43rWNazMgFyL84HrR06
	MfytxfRUBo24WN51d0kTZMadioD4Ld4DIbseIlYpTKWSIRL9u5TiHik79Rl1MzINA4tvQlf/0Uq
	yf6POmUKhD832voihiNCxcWFGJdySccVCouzJPsuS/HUWcNFPP/MscttmCLpjRd0hV9yHOROxJE
	FKeEwQCeJneHiMHsBmdTZTg0hiDYAc6FgU+zR9bq4yt0Nm7iA6ok3IilRppieULDXR+JR8WghlY
	TejkvA7r9nK/LHaNBwsE8oILUNVOZ/XB/SV8XXCHaCsF/I=
X-Received: by 2002:a05:6102:370c:b0:7a3:833c:49a4 with SMTP id ada2fe7eead31-7ac1d4f01edmr2072624137.26.1790167256494;
        Wed, 23 Sep 2026 05:40:56 -0700 (PDT)
Received: from mail-vs2-f13.google.com (mail-vs2-f13.google.com. [74.125.227.13])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566d033sm3291888137.5.2026.09.23.05.40.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:40:55 -0700 (PDT)
Received: by mail-vs2-f13.google.com with SMTP id ada2fe7eead31-795a0ab5227so332783137.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:40:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBytsghcqmmUAjSvvarE+5SUqYWndSyMkzFK+rL+Bn68DuiLu4H3/V+Hbr5HGhe+4sqGhyORcMpKieKW@vger.kernel.org
X-Received: by 2002:a05:6102:4b0a:b0:7a5:e455:1823 with SMTP id
 ada2fe7eead31-7ac1d4f39fdmr2199964137.27.1790167254685; Wed, 23 Sep 2026
 05:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-10-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-10-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 14:40:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkhnGxssjiV5+v9VizEMK6BEyYm9Eor2_b=H9VpPKLrw@mail.gmail.com>
X-Gm-Features: AclHuK85Jpqk5GFMNdOgnv-jyW7mXfscimJBoxQw6oeOM-P6bOVrQRWi9Fs-eqY
Message-ID: <CAMuHMdUkhnGxssjiV5+v9VizEMK6BEyYm9Eor2_b=H9VpPKLrw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC
 sub board support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC main board.
>
> The RZ/G2M v3.0 SoC sub board is similar to the RZ/G2M v1.3 SoC sub
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. CAN, PCIe
> and ethernet) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> ---
> v1->v2:
> - Corrected indentation
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
