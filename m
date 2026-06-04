Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1792749DC
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579104; cv=none; b=BEooLn8IAgj90QiNTfTD2uy1Js9cPv72uVmVM1y/1VfwoP0NZ9DAm3kjA8q7fWDcNehjgVOdovniP/y03solyAaupLcF6+YESKa2dP3O+lGwD2bTehBasd6+CTZyY3VNsuAZz2W1f/DqcgyHCD5mmhbbQlBbGLplr/qqicBw88o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579104; c=relaxed/simple;
	bh=bYwokgzjJMEgskZ4MF14lZVcdA6LPWC4F2K8tkcWBKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyqKxTR6WItrpmrc0t9R93ydJD9QML/tjMatFuqTcY1eMFmS9Pscw6zOgvWdF9osINm9CXHuWs/flYwKqsdOW2Gq7gjgl/ZKFLzt+866CFMmToGRMFm67dYS9WdH/wioTYPeJQEvRTclTL25QHtTSMthoz1Ve1IdB9dRyhWOFro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5a082548de2so170152e0c.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579103; x=1781183903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ3z50sIILn0aoc9gJVhIXVKE06Pnx0BbiI15tZf6Ug=;
        b=FtJWh9B/AoZ2zdQO/qPfH6/xLK3l8T/pH0N46Wea8DC7sufa94kr7ZQIzbroxMok3D
         t8wm8LgibWySZLx9mOdnY1LRUQrSMPCN6O4Wj59mDtLwR9mMR6fFct2mmi9D3zmql0dN
         kT30kxgW9FbtJgITNXIJSI5cLBoooL5bGSVfARbbVVDO2kth75mkU9IHReM4sPZ0AVEj
         T94Ri09so44sp7UhoxaYTI/fm/1W8t4GZPvXZ7XJBBtXTabFg7+CnipVvwFmXwKYupxZ
         dECFsGNX0X1PqfTK/CFbRrHp+NMqfG+SxmCRSROsUeCsRyH+rQ1kuK3psAs4uYTveYnu
         Od3A==
X-Forwarded-Encrypted: i=1; AFNElJ+v69HOPfy4KZeWdx1wGsOZnN17WlRN25KYGqKcH3Wb0VtVXe5m7tWS5u8zxp42AEHzdcLFAwPmph2L@vger.kernel.org
X-Gm-Message-State: AOJu0YxyOKE0nh+YarjWFjyN8wEQdm+Awk1+4oRoRBD4H6NdyrnaKZwm
	mQZ4q3tZoBue/HPINyADtFDB3iWDSMiJ47KjI8Ej0PKv8UBc34lv4Lc4ByBLyA/af3A=
X-Gm-Gg: Acq92OFRGGKvvYNzyXxaU+83WYHXaiDN24JbzzoHQW5qf+yldeK9xe3E0a0uoDRgX0Q
	NJwgQhnRVsIKWGaHhFYFYAVVfOHPpvo9t5xuC4zUmjj0FQ0YHHJV+j9SvJ1yud9eEnA/C47aoA0
	J6gXcC2FJyoVA7f97hufJ0tiftDZngk21BSeCn0PL3NLrki6+dPdDWg5EWUn9BWRbaG7OJ0/Rze
	OqjNwp+QyTuW29iqysoTvP9AOK5EHCYtalewx8Lt6vgmN861LQMLdxVW1UVZNlten0AWSLA3cPq
	kNtMjFGq/6OhrNDchqhXjaBY2wTuDzTksaUXnv1gqXP6ch8HN1jkQ03FT3FqrPH3XvMUwVDhNyr
	Oo97CTn+F4Uggyw9JrLe+KuxUG517c7ZuAJYB9jMRPqr158Ud4/39vAmnjE80zSV8NOn4eiTvre
	ZkGoKEYFSw6rPBNXJw0uBk5WxaNvrOg0WDC/YFmQy4keHjp26XMxV3hLS/fjm/qyirArRwJPzmx
	bM=
X-Received: by 2002:a05:6122:c8b:b0:575:38d3:7c8a with SMTP id 71dfb90a1353d-5a6e45656f7mr4076021e0c.2.1780579102369;
        Thu, 04 Jun 2026 06:18:22 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96414156385sm4307166241.13.2026.06.04.06.18.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:18:21 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59c1bacf871so216460e0c.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9DvnSfauEXy4RUpUGMD/3z0urzZAU1J0k5oGGAYs2h6fEmVDk5HKm1JeSa8fuEPG1EI/uVRNpD/NQl@vger.kernel.org
X-Received: by 2002:a05:6123:147:b0:575:3b9e:db3e with SMTP id
 71dfb90a1353d-5a6e446fe58mr4336399e0c.1.1780579101614; Thu, 04 Jun 2026
 06:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260528134752.79813-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260528134752.79813-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 15:18:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0YT4=2x20GOkCtETj8abCfjoj4S8VNCTfEuVue=A1Yg@mail.gmail.com>
X-Gm-Features: AVVi8CcsBMYTe1oqLUPm-cmxBRqWCx-zfvbyGziog2OzBpBmPSOTKupPMWje6n8
Message-ID: <CAMuHMdV0YT4=2x20GOkCtETj8abCfjoj4S8VNCTfEuVue=A1Yg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: rzt2h-n2h-evk: Remove unused
 MII/GMII pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 15:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the unused TXER, RXER, CRS, and COL pinmux configurations from the
> gmac1 (ETH3) and gmac2 (ETH2) pin groups.
>
> The Ethernet interfaces on both the RZ/T2H and RZ/N2H EVK boards operate
> in RGMII mode, which does not utilize these extra MII/GMII sideband signal
> pins. Update the board switch configuration comments to accurately reflect
> the pin ranges that are actually in use.
>
> Fixes: b272b94fd2239 ("arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
