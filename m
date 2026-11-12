Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495029;
	b=3pw/oM+MMVSkoGRBJDt4GHVvAUNO4rU/MnSYWrAFtsUPKwuTchGxNQaO4jY5DcktXSHO
	 fhNXUHm6YYMdvwVMKD91M8ZDXfl6y840/MeYHWeF8LQHJYzNLjpIqF62VbdSihIlWJnQ3
	 Y7umvNl/G3t5Jql7g4kj9+Ww9LgCxratGrIXAOlGzCME7drAIlp0NQmJxU1lFnZe/dph6
	 WLaHD7U8yrKader8QRXwzB686G66m6OP154hLbpSLLiJJSP5f/OgEl/bCONDllFYTqFJP
	 xVpuieWIqNJPogWgHZKMuisFHAg8hUkqID+u8IpJF380VaJIhBzmVEYHU0ccE4R1mUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495029;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
	b=CBF2pWuup+8X00VoAp3PIsFe+bA5eJWMi+Qu4cyll8W9XcWtuylhX7FWDDNVspc0m0KW
	 YqjCfRryXYHAV0097yB4537x3tRTzr5QiSAMIcgGFvdehg9uDJCTgDBVQ8AhM2abMLBVh
	 FBmduwRXNrf5oZ/z/xXay2Tlzd2oixmUH+6ipG92YkpHBcq1PWkSn2Bve4jpIT9cgqTkv
	 hyXRJNFo7DB+CgmcczmftBaqL5fuOOK9NGGSyHYwnZYizJIHvwwq94mRcHwGWAwTxblD8
	 TisMHJoR5KdXoE3S8voxiZy9/RTl9CmSr/xxsTkiHZMnQFSbBbqUoPeoSBm+a92x4Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A310606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A310606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so1387499137.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495028; x=1795099828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
        b=2s4b+DtOM5eCF5mtxAqnxVvTe4YDN+EKPSkbYD/xqhVq/9ZavycB8BwlbsuoFYlQXd
         XIhOuM1w8Bzq+5IFC1+9s5U07AMuc+43MPQIIJM8Ikytmry7Ivr2SFZZkr3TKg7TgN+r
         /PXotFTkDbUtT4p2aiiNGP8uWrxIHVwQ1nmg2npbdXW85LpM+JunpgZ/26fBkncE2ovt
         saPb5DFIhg2qvfmWEGFu5laydi4cTVXF6pcLSRGJRf6k1VGsGsxE5ARjBHsZy9qQ9GzC
         1syLmEMI95NC/BYVU2ePYFN6VgVeHCxS6xA68H2W2Qk4D0PC4u+9AZF2XMK/AMu6FkxR
         d89Q==
X-Forwarded-Encrypted: i=1; AL+hErEpN5kPHnbDPdVNpsY+PIAG4IjPdmOw4ZaCZPBwd+l5inlgZ+kzvDmS3xnYTSdw6ItdhvKLH4uGZlMj@vger.kernel.org
X-Gm-Message-State: APuU4Z9C9RbjA2eLm2yDmXQaru3jxrwtMEwNqi/nynszt1IfFO+E7//0
	t6/boXCV97aYbZR4tkfIXwKFX7/ak0OoC+cvzLN3u1qe0giKZUw0+jRqdpck4yajurE=
X-Gm-Gg: AYBFou1Idb3IS7LK+2RXOIIM7oD4V/JpgUlbtJYhjggo5Gh/Fvl0p7x+lViV3pq2TDI
	HAM/U9eSyVshac/B0a9HorLCbHIJqqSR3TktXuN0c240plDRniRK7MceMayPkDooEVka47x80H/
	dP3y+eyVXZhzoy/Tny2Xc6XlxCzxk74ZRxvWl4mw9pL1EY9+7vbZZ/PvA94NJqZMj53dEbPzwZ0
	f4b0mV6Qa27xg71lrtvCMcZLbY4mO+TYy8SJLmynGEZPHMOgvSR8Ybg9lxXvp/vxNXh6b5BKCOT
	ScRhsS/k98FBo1zIWvHI+k57fU1agbJk1zp79GCBDWlCN8xLyWscahVNEJZjJMTNBAixpac+psg
	u7/wr+ZgSR67LlI2DcmUzmSWieNDY3zyCHHPT+B32QwjkufVDZJc5q0as62hbmJrwPV0btSwfxc
	JZBoRIz65U8uxOqC9ArasTO+/iFgZfk5h8b6+dMcYxhg/Cgm+qTIqJBAPA/dyeysoQvQcNRsP/H
	O7e5ggpr+RkZDzxmcUFhdFsl8pvfx1S+/uuzrjMFLW6o8yWJvI9mn/iZBex7/oo7L6DYOd+jPKs
	/auXcwCJLnOS6cPXkOHI6el2KKGxkE2WDoTsblfq/m1ErlcnLPe4PE7uyeaoB+HX923PjtIMXmZ
	3Ej2bxn8ZpHDx
X-Received: by 2002:a05:6102:80a4:b0:7cc:21cd:9b46 with SMTP id ada2fe7eead31-7d506129ee8mr2021793137.33.1794495028004;
        Thu, 12 Nov 2026 06:50:28 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm2964011137.11.2026.11.12.06.50.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:50:27 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so1387485137.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG3AF93ioCbymeinBVSDkaZz1tR0Q3MuU48kyoGDqqWmIfrczKXq6J4B9U4d+o9vZIiqyWY40Ogqa90@vger.kernel.org
X-Received: by 2002:a05:6102:2925:b0:7d0:5688:f511 with SMTP id
 ada2fe7eead31-7d4fb2b4baemr1940643137.16.1794495026588; Thu, 12 Nov 2026
 06:50:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:50:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
X-Gm-Features: AclHuK8sy96nMijWIpulMeqo_3YMpISU_WECBzNl3ZKvutsCseDDYG3iuq5rfEs
Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] arm64: renesas: r8a78000: Add VSP[BI] nodes
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

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Add DT nodes for the VSPB and VSPI IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1646,6 +1646,105 @@ fcpvb4: fcp@c503c000 {
>                         resets = <&mdlc_vio 0x106>;
>                 };
>
> +               vspi0: vsp@c5080000 {

> +               vspb0: vsp@c50c0000 {

Do you want to sort the VSPs within the VSP group by unit address, or by
label? This matters especially when also considering the next patch...

For the contents of the nodes (except for the renesas,fcp properties,
as I couldn't find the VSP<->FCP links in the documentation):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
