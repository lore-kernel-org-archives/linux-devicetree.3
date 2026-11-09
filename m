Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233456;
	b=OigiWoM44eDamMe031Le+DAa7ZMM/nM4btR5VIXUUnMrga5CcQdCh3e84Tx5TanFC7IP
	 TMXdFe2HiMEah4SNP3jKRlp1dxn4zxrwKExNI4xhUZyRyiGucrAFdaDWcj12cwr9irG8B
	 H8T9wj7oxEwZdHgu2os6W9l2TH7qzSvwFpnjl/Qo/3bWDimkJ96Q42YucZVfSc3RA9wMJ
	 YN6ZJFLXvdiYI8iq173cERepN5eNXY7WfkfF7se5V14Mtc1DxGiPaH38Fpzy15G629fu4
	 KvIdB0pdJC9sCq1zUjlXfOwP6XaEb48IaSOkWEbgkmC5vdH4ALRpD4xdHKySnQ18IwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233456;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
	b=ffHftObF0blCqgKK9xeBBULRxJHxHsXDRLCdp83gw0nbUx51sLCAR6MCzkfMHvk4ndtd
	 mYUgDK3n5v8q2QFUU6pcYOxTzwm1+Xf7H1Wc0uhx9Dv8qxiWIiL8nVy3qdL+zto8JA6VC
	 FFTWbqoi6pZrKL8CRa5XCxNUzrRVjaNSAtycY9e/ogJtJXVs5y+sCyH7TWl/souEONt1/
	 ku8TBynK8KPPr7g8ptB9F2j9qpvE36eAEGs6G0FaJZc5gv1rNtUPyBd1btQbutqmJgmil
	 +nU0mIoletXseI66QlHUk1tsQWMPSsXc1k6q50I/4+eKBPxXs61p+uAr6ahEVgkajbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A9606D80D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845A9606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c45551fa84eso125397966b.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233455; x=1794838255;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
        b=2ZCYYvNKOfQfK6540YZgUzigIczxspQw0N4pLqt38VHyxGHenG5NbQMQaRkzlQwjCu
         gKy+MzbBzC7JwD9Gqrd4ffoLakFgMSmEpJvEjfImHhzsXYhmVwVg+LaTaB/PAxP4b4P7
         89Zm5djr58tDIZvbdk+9QZ62F5j6jVE0cjlOq8qV7Vc3sDLC1Avkb8A/IiqPq6yuCkTr
         koddJ7il8vxHDq8f3MSfZrFvK/cg5fUNujL+HHO9oAY/SYYMfMTGKa/zd8kFkke8xAXP
         N1em0UddITvq/rRWG2f5ynALVs7GkvwkyJLnZDTlkOc3nuU3KoDVilqEoNQG9RoNyxZP
         eYpA==
X-Forwarded-Encrypted: i=1; AL+hErF7jFW+GzqwpQq48UECjgNWZwB4ecxS+YkxUU/WVGbpA/47Og6OR1LQFug5ouJ07Mae2J0DAzY3gaWN@vger.kernel.org
X-Gm-Message-State: APuU4Z8TpK4W6hZLbWLKV7VTzE1SVMVuCY76BfRl1PuUUTrNr8SEmm/g
	UIZ1yejkCyPLSxWqA3nr495BlYtiJs2HazCyuDyErj1FcUlBTEi7RtdPezmQSAT947M=
X-Gm-Gg: AYBFou3JPw9fl97pVUfTK2VfZ3+oO3+vu5lKizUjePY9YFXdl8BE0XHs8OoTmuq4NZZ
	cZNiXnf9guybLYIEGtvgQLXc3EOFfeUkLSio9BtXNClkDM8j3f0RMDhQk5Xd36kFLvGvrXJzY7o
	Oas7FKv5QEX/gp0MYRSHdTlgWDEA0fvXGH7T7IaCjX2vdurbGxzv41+oQI00eEaU8Map6FY+xOh
	7JMVYEJx+Wc91YVErmMiTKtPLgL46S1IqjBX7IHoYDPaqzW8GUELdJi7j62XhTd89kGQx/+9H5o
	IJaF9nm1E2HQ5ZAN/GAhFXtirtYfmWnOW5K62dNzaPH6DnwWTqWP9N8rcEYPFcJdqTp+51vvpAH
	J/+m+MKDiocjXwTN0I37SlxzxVps5uRbC/54IKGTdh17OMiAPvF7n8DcV5k01ikTi84GDBYlbNr
	dDUkJmShMCY4KcC9rTi38Cqrwm7oxBGdoPfChKAQnqgafP84WeKHLYOVkV89xVPQ+K/mSZiH98K
	LriDd6dC/ku+4nZnySbcS6lVvU4S3HTITs7zGZhGGa/QiOMx+BGrqxwlXaNSzs4Y6ETIICwhBZT
	mG+XQ+z7FaWFXrG3uRDahfS17grKr9odgyBbhn+/uYDNt2rIK9nGmqdQMxMgLdQqrLQ=
X-Received: by 2002:a17:907:940b:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c4d6d4a7acfmr298961466b.13.1794233454816;
        Mon, 09 Nov 2026 06:10:54 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d68d54070sm175479566b.1.2026.11.09.06.10.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:10:54 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1370379a12.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:10:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH01vl1fnwWntHnPfHBvDpHUZavwXE0FJxwhv7CveTDK7w7XxIWKUGhFb3aatXAJSfR72ASQTE7OHu2@vger.kernel.org
X-Received: by 2002:a05:6402:51d0:b0:6af:9a96:5324 with SMTP id
 4fb4d7f45d1cf-6b722473406mr2715103a12.33.1794233454340; Mon, 09 Nov 2026
 06:10:54 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Nov 2026 15:10:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
X-Gm-Features: AclHuK_UOMGJNMSt7XpVPImhuSlb374iqFlByrKa5-w4LBZZoP4MvZOgp7Ag9nE
Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
Subject: Re: [PATCH DNI v4 13/13] media: rcar-fcp: Check device revision at
 probe time
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

On Mon, 9 Nov 2026 at 14:36, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> ---
> Changes since v2:

You missed the changes since v3...

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
> @@ -14,28 +14,80 @@

>
> -#define RCAR_FCP_REG_RST               0x0010
> -#define RCAR_FCP_REG_RST_SOFTRST       BIT(0)
> -#define RCAR_FCP_REG_STA               0x0018
> -#define RCAR_FCP_REG_STA_ACT           BIT(0)
> +#define RCAR_FCP_REG_VCR                       0x0000
> +#define RCAR_FCP_REG_VCR_CATEGORY              (1 << 8)
> +#define RCAR_FCP_REG_VCR_REVISION_H3_ES1       (1 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3W          (2 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3M          (3 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_H3           (4 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_D3           (5 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3N          (6 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3H          (7 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_E3           (8 << 0)

For R-Car V3U, the revision number is 9 (according to the documentation,
I haven't boot-verified this), which is missing.

> +#define RCAR_FCP_REG_VCR_REVISION_V4H          (10 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V4M          (11 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_X5H_V1       (12 << 0)

"git grep -l renesas,fcp -- arch/arm64/boot/dts/renesas/*dtsi"
shows a few more SoCs having FCP blocks.

Interestingly, the documentation for all of the recent RZ parts (G2UL,
G2L, V2L, G3L, G3E, V2N, V2H, T2H, N2H) claims they use 9, just like
R-Car V3U.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
