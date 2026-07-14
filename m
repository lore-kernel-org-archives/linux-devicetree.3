Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA73E1D04
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015454; cv=none; b=AZn+2mo2PCj7u5Ej45e5ZN1UqWV12VxlS++n/Qc6BYM3laVX6/8aK98pE4H117Uwa5exIJSRE3W4aFCyL+jyke6g4J1OmsdouYXALogGGX2bDTijoLrUM3xmmA/54KR6/nGexcYmDuyMv11eFu3ZtySrQ6iSeKk38TskXmdXw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015454; c=relaxed/simple;
	bh=iq8Kc5+SBapLqwF6ORCrQ5sCq4FaCemr05ZMk3EEWBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqfuStIZZXrRBf2HWGXY5FU8zzwRkilEU3a4QJNVLaIKuzTnb8ZW+2UTO3rd3cLfVeXDJYyE33oyhrlYM4NSwSVneEWt0kSbSiJNNXH5vkRXIRAWSCiOoZ8hGNB3I8biDN4O5zRRBvYauPZ5VjXMn6lV6e9CbG53UmTdgpHkx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso340551241.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784015452; x=1784620252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yavgJsn42/mg7FbRzuzYhczZGQV3Jism9aLSRgEzMNU=;
        b=H808df2JvONDl7e8U2Mz0qk1TLFe+6rsv6qgibALv84Q4CqsLvJ67/IoRSve2NvSLG
         RxJxKxfnjSKHfbWdgIHHjbiz0xUi2LScbJJyMv+W/7RstOMkg5q707d9QDGyGn+yqJyR
         XK4sCTiOcGT8BCjrEXo/sbgdq4tsQ7y2X/NMIoEFNeQ1FolO0sLm8N/OnUgGfJKbAWM3
         vj9TQUVpZeui1+5ysZ2YD+LfexqZH4ezFdmv5QrcQwnBebyDA6sYupK0jyP735VzDKeK
         1nbZguf9SdEISMsdzo/qnf/JrrGiO3lWWUfb293YCDGYY0QjzoGRyBGpeQ/fqw16immE
         SShQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTyae8F06dAMaAgGfjQfht9OCqQfphg7EQLuM69gnbTOPPpYmS51BRLDnUDp92KEDcmttUrB4NDQiK@vger.kernel.org
X-Gm-Message-State: AOJu0YxN7oiF5DIs3ibetibIM+UCHmgrfm8Qau+UwjJGLwtnD8t8X5tz
	OP3YRk7cHu4U4db6zjzYpI2LB/SQFGHcAlFPF835AOS+2HXt/KqBBTwtj0WSgx5yKlM=
X-Gm-Gg: AfdE7clgl/0VLP1A0y5M46czCs93EUVFUbo/k+q4pR13DfrlTtRdPd4J+c6A9fUxydT
	YfFDAKZjSxcal2daLbg46ddCIIuSRVQPW79Ma4ZlypZr6z+Od4cJOCtEx1xE5Up+i+2NPMVrzeU
	1mRbJZJ4yXcCQG7CQ/9grh28i+23xOTQna/ttzxqbHFKvli77L5rYZgIdH1CfATH4C18pJ9Dyox
	KZ0/Q/JCrcCCtSJvlb8pAB4/3S/aC1MnDVTibhNusacYq9gVgbMtbhDojO410FzMElyopLQ7LrO
	HDcX/bBC2e1MQZ/wZ68S9joAFHZCoiCKvc3rqM9fax2YVdTCrNqx9vZroE2W3D3PSVIaGZBdL04
	9GSUbg8S7kPR+MAlqwVCNP76o3a3OrlnADk1PrNm/JsWpZeIhFMzI9YOD2u6kq1Ed/l43IfvHIh
	4FCrZaKQQilaEqPQA71NyU8O2eUn3uT6GnjZy+L4PQvbj37B275A==
X-Received: by 2002:a05:6102:26d5:b0:737:5c42:858b with SMTP id ada2fe7eead31-74533c1c30fmr8290753137.11.1784015451740;
        Tue, 14 Jul 2026 00:50:51 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3ee7csm9927290137.2.2026.07.14.00.50.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:50:50 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-735f73287e2so411478137.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoR3uhpF+Q2HbG9TEnciQv0gDNJ9998du2t0NXOYVftLPxh9OlTcIqjUJFg4zapkN1iSxYIDbo9bKOo@vger.kernel.org
X-Received: by 2002:a05:6102:1608:b0:739:15ef:cdfb with SMTP id
 ada2fe7eead31-74533b84395mr8279731137.5.1784015450565; Tue, 14 Jul 2026
 00:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com> <1d0d4074-90ca-4b33-9bd3-ff27aa0fd4d4@mailbox.org>
In-Reply-To: <1d0d4074-90ca-4b33-9bd3-ff27aa0fd4d4@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 09:50:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNcbMxONo=PaHqJnD1EErc8AzYLf0MceD+vt9UhmsVfQ@mail.gmail.com>
X-Gm-Features: AUfX_mxwFeauCKqv0YVOv7ObJuQMatx6kqMpuGapev3XA_vc1zBsK6ZaiEApGuY
Message-ID: <CAMuHMdWNcbMxONo=PaHqJnD1EErc8AzYLf0MceD+vt9UhmsVfQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 14 Jul 2026 at 01:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/13/26 11:11 AM, Geert Uytterhoeven wrote:
> >> +               ecc@1e66660000 {
> >> +                       reg = <0x1e 0x66660000 0x0 0x999a0000>;
> >> +                       no-map;
> >> +               };
> >
> > Given all DB[0-7]FSDRAMECCAREA00 registers on Ironhide contain
> > 0x0000cccc (md.l e98[0-3][7f]450 1), I think the last 3 regions should
> > start at offset 0xcccc0000 instead of 0x66660000, too.
> > As a bonus, we get 4.8 GiB back ;-)
> I asked about that part internally already, and yes, it does take away a
> lot of DRAM. I think it is safer to reserve more DRAM and have a stable
> system than reserve less DRAM and deal with potential stability issues.
> I also think we can always update the reserved memory nodes in the
> future and shrink them to make more DRAM available, once we know that it
> is safe to do so.

Agreed
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
