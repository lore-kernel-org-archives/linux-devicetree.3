Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793048700;
	b=pAyZ8fqbaMM0adtxseVZO7gBm93NKYuACMz7XuVHzByi1gItQ1W6FAevk+SRiHA9oXgo
	 8FJ6sNFS/OwGMBg9IFiSQyoBLEg/NsJi+JlawdMri5xbFw4fmVrWlshAw6xI/s+tm7YvH
	 NktfVsev01FKop94RDuUWoGSYEZAxEDGnylBKSSuI6doMld/ckgU0tKGo/o/yzUYUQCMe
	 edeFdpqtZYxVIWD/F9GjJa7fLG0ToBNDbK0yyqR0qnxo1SO2Qr05Fq7c2mk1GhCTJv3Bm
	 ksPnnW5VyYFYSfFC3RvJ3d60A0NyqBQrlL5amb8SUOC7RnHMRp4BbM5aTCB1RTKUzcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
	b=nXdOgQzBw5uQXECVC5nUSciphR3HM0DRl3a3B2TGZUAnYUjeRNRIToz14yz62ij7sD0p
	 bbjb6V2UZY5niyGgCSz+2xvG18D0ggCRt94NT2PZRyd1DefUuExk0Ie62Z7yAn+wHIG2U
	 G/grmL9GGCj/igsNZG80BalcoiDGs+lo6cJlD3FIRJkqrkTcDQ4dUe2XypsWsNSdGipmQ
	 1DrevvRN4XcpG+pBeJTTsLzfR+avm+z98jrIJpN6y1ZysEze8b3CrPp/v5G2PvS9ofuvU
	 rfSBe2YXwpth7s0uUcSpYsMX8Hjhc7ksqKarAN3jK0gCFKU3B44bKPx24d5sGAZx0oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CD7606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6CD7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso17929825e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793048693; cv=none;
        d=google.com; s=arc-20260327;
        b=AUXe3N4KpcWPQFtv5uPL8Y+jVBjU9wugUoexGDC7Qs7h+XNsGgmkk/lrMrnzn5MFrP
         4c3InXLStz8Z7HfHeWEciEeB3pCvXqLXPuabyiNbK9Gdxm0fsGH1rWwcXMXXL6FhtsMY
         0zZMS0vEo6hMgSjBkEgph+LUmdqg9Xau0QXFJ82TzHmC9LsNNF3ya1znj3/CMzi9EsjM
         dHSrQtGuR5vC+kOAKbAVBA/LL+bRpDZE2FQL8ybSKywY/5dbHyxpNbSHaLnyBzsP1AiA
         UjOx8ntrz/HzrW9F1j3Homh5M2DxRNN4qOCvNauRS6rw9a3kswBh7Spg4P+GkNCd5ujN
         pvuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        fh=pYgPUrTkHNLH3V4G3Uv8RDxwkDDEwGnas5/a4KGxD/Q=;
        b=mYgYsp0yJVDcfKYwCf+194h9HnJIXHgnB8ny3A3K/vEgiL8XNF4Z5zDj5ju4WkPAum
         JndHb1riio9ElnNeXmAlD+tFJpgKae+kR4FoM1n/0FKvWxyOovWPOZB9aIf5jC3MZ2Gr
         3Ps9W4/r5XE60utkvJjtBXNxwM/6dPOmP8EuKBCFLDcIQq7lWInj4Vw/9fgX/GFUEo0V
         RgkQ/lvY+wkmTNhij5WVuCmESBuOVpgmd45omNpQ/5cFaD53V7wXOBK8RiQ/7/FZl/UD
         s3vr98LnS/v0NFo81TtTy097WbM+48no16xLBq07oqngIRTX+3zA1Y5FI5JZU83z7nJ+
         pMHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048693; x=1793653493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        b=REzh/iK8/mR9cU2vVYp1mtiiXemFRDWkRiF4g+U+E9FeH9kEHfpk8xm+cEY7SIc7o8
         VW7PKfpYVJ2L1W6cUDxzIrqW81kWWt3AcYPTjWB3wMTvOuTuv7YwHI8/fLOu98Rs6zKP
         iOdyQzX++/3k+4HhBOiQnd7mtfO+Gwt2SldmFEzEHfB6gZYxXicHlowbS4zTZxiHZlRd
         xmj/0p7A1SCa1n0NEUjKp7fm0YXmMEZvN3WXFYPvV9x4BdoIxb8thryjuUhjzw7cNcYT
         3bIw91POCvvsyzwGg/ukMJLQYA9hX3jrFUTCnaThLfm03jm1fjillXWuKZ0YPE+Jw2Yb
         BSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048693; x=1793653493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        b=czqrISR+2yRzb+hKB/Rg3TKPdWLM/+4ifkFwwyvdto8YGXtLR4DTLBL/mm4rw7roGZ
         4is+jJcoAjhSeZ0tnBa3TF2Q281QnJy6I7046axgNlVFTzFsJSJhBqGr/yicwKxNeiBn
         UskZgoDS9ihFDv3TFuRzDSOlf7FVa//lu1JHP75rBoXwGuboH9dMRZPIogfrW2ZXyKQC
         RkUsOpiTGLNxDyVyz96a1qrN1dbfl12VvS5zYU7fpvxtUJz36+ubsTENZFNqtHpdCnAI
         XBhUPJjgbKV2GRcz2jqmVROm+HPOAve2JyiR+f1xlCDLQG3bnl9rcx/xfK0d1RFtazCN
         mc6g==
X-Forwarded-Encrypted: i=1; AKwUvBw2n78TstHFp4ZoLrGR3H7mP471V8SXIAsBuWLhYS4xQaPfXqdJuFIV92qjS0Tn77U3IkTeJRDu4nJC@vger.kernel.org
X-Gm-Message-State: AFq9FYI/5m13Vagylq2vQDNcPzvY6hl8aFD2dyW2V6xN2UyqkGAmMv2Z
	3sgnjUZ/lf7TwPBm06rXKx/33LdxgSYQ7PQ0Atgr4Uwq6jeDsXm3+PNXBcWYC4L7+MTnvCxKbQ1
	HgZuPwBhw2Hb8IRHIvL6t5HYMuG1fzSg=
X-Gm-Gg: AYBFou0XUOE66W6aOLOL6lD6NjZMqux4xUxTTe/7lH+XciVNWkgTDfwTvwj8eU1d5uK
	R3OUi8v9ja5IzhnQUduCBF5eRD9nHz5bBBKfxJkOIwYHnAdgjMOk7J8OLxqKGdIdV+8ZjAchvR1
	cp50cBYG7cMsaXwtsxfO4n2Bed8sOo7Q/xG/L08kZ0Oqbux3anUeoLYRSyaRkavyXfiN4ks0eSn
	RTK5qkaEDQUNwXM3QxJxxCfJVD4XnKsdAmTyj+p6V32234Pnyz2xGh0UO5c5/z43vxmAfTAQGqw
	bZ5Q+CjTZOy4wLJa973qEHx8tEDPUxa9QhM8TbcGwO6LgN8Nn2AMup7OUzMDgHkoVh0Rbfau+4Y
	sIXbEjujbvDJi9eEz4/S5wo4VD/+zURekpYHw160B5AxvW7gC6OqaNS2g8hyOJTiubd19yQJSQN
	WOJqLxdKU/s+05cOF9yRhg2oQdsHH5MxIT7xV/3nprIzn3SlHZoFEGgJ7N
X-Received: by 2002:a05:600c:6098:b0:49f:ce78:356d with SMTP id
 5b1f17b1804b1-4a35acc431dmr140143975e9.30.1793048693009; Mon, 26 Oct 2026
 14:04:53 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261023214917.157d0c89@jic23-hlaptop>
In-Reply-To: <20261023214917.157d0c89@jic23-hlaptop>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 26 Oct 2026 21:04:26 +0000
X-Gm-Features: AclHuK8JBvSW5tWtnhuC7bZYHXlymQW5Rkl37e-ZQt82_GXFIHsS0rUkBFiPL4g
Message-ID: <CA+V-a8siO75k0ZKDoQ3zpyzzAX8KwWT9qHUGP1OZCXCU9sumFg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add ADC driver support for RZ/V2H(P) and RZ/V2N SoCs
To: Jonathan Cameron <jic23@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Fri, Oct 23, 2026 at 9:49=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Fri, 23 Oct 2026 18:59:11 +0100
> Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi all,
> >
> > This patch series aims to add ADC support for the RZ/V2H(P) and RZ/V2N
> > SoCs. The ADC IP on these SoCs is similar to the one found on the RZ/T2=
H
> > SoC but varies slightly in terms of available channels and configuratio=
n
> > options.
> >
> Applied to the testing branch of iio.git.
Thank you.

> Note I'll be rebasing that on rc1 once it is available.
> In the meantime, additional feedback is still welcome.
> (It's welcome after that but preferred as patches on top!)
>
Noted.

Cheers,
Prabhakar
