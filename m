Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240054;
	b=3KJrHb0jCBWmdKJl6gzS7tE98YxOlMb1ncqG5+bHWj2m9fu1lqmkYSx3ptzR1zr4y+zc
	 KBlD11yqrz4cUv4S2oRmiOB2bVlRLyzdH7UHi36jtfH0SUpmPxQU9TSCo8OjLscNyMTbb
	 uOWeVNEVVkL1Fm4TaqF7AX2NX7gCAlS4+tIHCa6V/epl62ILkO5RLNWn920KU8N+QbMLL
	 /LZh5Yb/a1pYNykLz++cMmfgR4sOEXGAc+4IHiQro632m8vXQ/IgZcrfZxT4trD+lc6yt
	 7Xsrk2rnqg/PzbJUfJ+43NS+fszletZqkugILO4Qdf8QOO5zyWgOOjTds7N+EnSrcMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
	b=WK7+kQKMmIAiuDcBZG+jijFwaxl4JpGWyNwPbR/r3ezvdx3T6LbvvsAEGQgcecyWEQJS
	 YEzGc7jbr7iqY9V4RqQFUZ76YQhV0rToxV48eWkTfFWcHxdaleaenVMM9vFQtHaNom9XT
	 uwCwJPfRD5bPCjTAYrTZ19rb814p9dcTG4ZR+8biRPcDJtIy68ewpzcpMgviEPKpFZBCr
	 6PAh3/oclMRRR6GPwGbgbs2pGKwqLKoavPxLeqfOzuQaYDtym+9RAx+noppy5ZHKFj0zZ
	 pl+fL3Z+WcO4Spl9G7nxotiG3YuKqo2BFoGcNvKe2+DItLTm3SUsRdP+I+65+sltTrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsshOqMz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D71606EEA9
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D71606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsshOqMz
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1156046a12.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240052; cv=none;
        d=google.com; s=arc-20260327;
        b=HrQsCWDRHYSMpnXW7tIacw0DWxHm2N28bc2WwUX7jfrhqvmShBYdFT+X4U6wTTgiK6
         1R/2QufnxMgKaZb3Hc4/FRFrOT2KEFgNQCvLF4Y1s3R5tlOEly0TREWBTxV0OgXFVHaV
         ck6QzNMysTQOKXb/CIU9F8WfzVOkDUs8MRH8GSP48V+OY+P41kCpzCNujnjzVRvoSUUn
         jgNLdL5GUf8vZVHFMEL9IKtQ9axWC4FUPkPFjpa7HEUOaRvpFHHy8L6LH6M8JfQLG7/M
         N/HZJnryyEkWCOy7QOz7eO5lhAtbIvgD+kWTv2tmpg9PJquVWJnxNz/WMUkvIAxoLpsJ
         X2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        fh=WzYbArdc6/2mvNpuXc/edXaJyqqaiqXRYJwWDbBPLew=;
        b=Hv70OKT7o/6Bi5anLgk0nRiffPBvuyc+9V9KP0ypyix66XgjX/Weo7JGmR1PUAgnNc
         X/31Nkyj3xJ2uErsCATquOtUz5LCl/sdh+Wrdz1fPA3qljGu6qljeOGdbRPXJj+DPYfQ
         odeMoY3RB/dt5wBE7KfGm1Jogz14n4ClO4cpno1L9OD/S3PspdJnIzlTP78Ibw2v/p7f
         yM2J6xFKv0th8M9CFPhYfJ99IqpnDZmdl3AiA3XynkzDd9+odRLnhPVFPAwKuyhVJJZ1
         zCIPH2ODazIDZ7YRP/9/JaCx6YKHulnihaQCXDZmb5eBtOtazh5b5MPzTph2XoDQPYFg
         9WYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240052; x=1794844852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        b=XsshOqMzA4g7VkUFJSMBdIgw+TyNKoOTeZcdXvA2/JueLosVVFf1C1anFVPFqzsdm/
         +il24/vmlBaJ+7GEebvhk8L6xeucLXfjMgk4BCtasOETmK2ilY0mnGPZJiMUCECbmIOT
         qh5NN0+nRWZcTbaiPUHeRJDKjbLLCNKGkgeHK/ulASwD+SBj0PafYUVdA+gU/Zk9PmDe
         sKkXNPtxtGoHTWYE2OJRyc/+zykR19F3iaUdLi/Zy78CpfTt4Q6And+Wj4tufyBodwVc
         ctKxYkiw3BSI0Tx+qZwpeeuCXN5Fwat8kOF+OWPx7UHHKkU9mMIV0n+rYKpkal3eyCj/
         71Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240052; x=1794844852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        b=UhsErI2layc07lJtmh2IIP1mGmb/til3fG0fteD26vKi/Q+88pfRH626KsjUatNUWs
         ZjgeHS1/VdoEbLbV9Tt6QNY2lKv0n8zGAdRMKDn2wJZMZ83R1RF+EYU0N/nTF+Rbil5l
         l9PPnpiMSZnMLWu9+Y567IYLemnKAq6XFyj2/53JwW3ZZxjoJYqQNHRwf0TTS/lkwREi
         xT7aTqst5Ssyl5RC6z/dkWxQKReWO1oiIea2QJcnYXRwMPrOO9S0zTDLWGXPyj4raVYz
         QUkgFeP4LaFI7SIj8rJS0hFuZC+kIxnyI/ZQAfGiGHxbcv0PXFZKFtmsdAJo4Z1n15C+
         Wz+Q==
X-Forwarded-Encrypted: i=1; AL+hErGDezZFoMeDzy+e6+K8Ar+5AvxgQVLEW+W6aF46qcX/wtsCgyid2xBwMDTRirD8mIUv3CQW9bF/3DCo@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Ti1CuBTJoR+lNZ0erWmbDWuVaSOAQF6GAomNYcgwyVuaRAw6
	2brO5bpCEKb98naK4NEKafe9VVfVViQJIJS06YpIE/fJ0QWApzSzBbaMvveSu/KTJvGaLrgy9oq
	ppM1c3UaPogaIeNJoPnEk8GStZbgXVa4=
X-Gm-Gg: AYBFou3jLF2Ri+TM7ynl/xGYY/8yEnYNpu0FTRkO7Y4IwsyOPy7Yq+FYPffFKEdSV36
	vpKDMnstbLBicLPwOypF8+ouhEPGe7Qp2VJadl10WHwo8dx6FwEa2hPf/xcwaScH5mYRCDsIbgM
	lBwG2qb3ll/5ROBz1GX8LdITnzV1J9WEiYVHhOLg0tOwUbrtzcB8NE285Kz5NBYd3TAvC/NeOVD
	2m0xCqrMyivGhamgRJLMZ4P/3zHx2LVHlGU9peAL+0EibFv376aO39GM2c/KjQSopVVPtWgRn+h
	zf2NqLi9ngRsjNQ5A2dUlxWH70nXl+0wEehLFDIn/yPvMNKE+PgNCPgvOAlfCs04kvY+ykuYY4O
	pDYZaLg9Xq44fVMP2/6VIccTQXb2hwYgElstPpQt1nptslpX7BKHSrgcYV8hlysktDT77NmoMxT
	F1sXbwhaGqr5X+EtiBVa0/DvugxKfPc0daZSSsKqzF2DkXkKFT7qjLKLwY1w==
X-Received: by 2002:a05:6402:3908:b0:6b5:47d6:a8b0 with SMTP id
 4fb4d7f45d1cf-6b756afd795mr8207a12.37.1794240052060; Mon, 09 Nov 2026
 08:00:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com> <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
In-Reply-To: <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 16:00:25 +0000
X-Gm-Features: AclHuK9DoJ0CyffK9_ibsQ9MndPimemnqbVSvRuC8icXaKh7HkxYXoo5YAyMhM8
Message-ID: <CA+V-a8uHLK4-GFhWQO96yHBDzXYXQ+aggbWfskzXsK_17dAKCw@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Mon, Nov 9, 2026 at 3:28=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/9/26 04:27, Lad, Prabhakar wrote:
> > Hi all,
> >
> > On Thu, Oct 1, 2026 at 5:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> >>
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Hi all,
> >>
> >> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs=
 in
> >> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
> >> which the CPG driver registers SYSC regmap. WDT driver now uses this
> >> syscon to access the WDTDCR register.
> >>
> >> These patches were part of two seprate series [0] and [1], out of whic=
h
> >> certain patches have been queued separately, so I have included rest o=
f
> >> the patches into this single series.
> >>
> >> Merge strategy, as the WDT driver now includes renesas.h header file,
> >> the driver patches can go via renesas-soc.
> >>
> >> Note, patches have been rebased on top of next-20260930.
> >>
> >> v7->v8:
> >> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
> >>    restart handler" addressing Sashiko's comments
> >>
> >> v6->v7:
> >> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() functi=
on
> >> - Added new patch to drop pm_runtime_resume_and_get() &
> >>    pm_runtime_put_sync() calls while accessing the WDTDCR register.
> >> - Dropped propagating WDTDCR access errors.
> >> - Dropped converting WDTDCR handling to regmap as this would require
> >>    resource address comparison to get WDT index to call
> >>    rzt2h_cpg_wdtdcr_count_start().
> >> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
> >> - Added if regmap is available, use it for WDTDCR access
> >> - Updated commit message
> >>
> >> v5->v6:
> >> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
> >> - rebased on top of next-20260922
> >>
> >> v4->v5:
> >> - patch #1 is new addressing Sashiko's comments to avoid potential dea=
dlock
> >> - patch #4 is new addressing Sashiko's comments
> >> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
> >>    restart path.
> >> - Handled the regmap locking in the driver and introduced nolock
> >>    version to be used in the restart path.
> >> - Added review-by tag.
> >>
> >> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.maha=
dev-lad.rj@bp.renesas.com/
> >> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mah=
adev-lad.rj@bp.renesas.com/
> >>
> >> Cheers,
> >> Prabhakar
> >>
> >> Lad Prabhakar (7):
> >>    clk: renesas: r9a09g077: Add helper to start WDTDCR counter
> >>    watchdog: rzv2h: Use pm_runtime_put_sync()
> >>    watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
> >>    watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
> >>    watchdog: rzv2h_wdt: Add syscon based WDTDCR access
> >>    arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR acce=
ss
> >>    arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR acce=
ss
> >>
> > Gentle ping.
> >
>
> No feedback on the first patch of the series. If you let me know which pa=
tches
> don't depend on it, I'll be happy to apply them. AFAICS that would be pat=
ches
> 2-4 ?
>
Yes, that's right. Patches 2-4 can be applied without the dependency patch =
#1.

Cheers,
Prabhakar
