Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF192388860
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 04:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201980; cv=pass; b=na7W1DzRTuQO8i3+hDnEJKzSjQgSxkMK5vTUOW3oiLO1xDmZiaEWbkNWduahFkktDzpODkt62vRKyYjgu6IdDGJqxNl54CtjP1gUyitLcjyFfm3QPzd3daFgG8v0+70MzwRmXQeoqvpyhqC17mWjhn9CeG9k295USZ6nmNnVvGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201980; c=relaxed/simple;
	bh=zufc4WX0Sg8gho1/+Y5XWkaUuA6TVrZwSLGFlBgxd/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+O75SZDhmmOYOTQl5g9WVq3z9pZYedTK61sHFN77GPZEHAEmpRyJNddZ2TE3doe8YceN5PfhVyDf2TxeMfKpcRqQ4IZCNuZ2CzZCoo1Osxb1siVuhOKCdZKfjDI5UXpQjBeB4RYkKje6rW5fXuMRyqVVaCXvRSfmKGTd1SKSqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMB/tPJR; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMB/tPJR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so20376635e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 21:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787201976; cv=none;
        d=google.com; s=arc-20260327;
        b=AtUOnnGWdVXBBxRGq5Uu7HCG7vZVwVbOZxiw5JKJ14LG+iq1GW1A4yprzdo9Ukef6s
         qqAX+MdIBzcRQ7We515UaUkXBQbyGjssjVmp8l2T/BTKhYPBnkh7CckMhDiVth7E/SEY
         3iKyG55OQRPNvZGFmD1nZYqwMCb9UNnMuaWB/Rv+zd/DsEOGnB8wJEouvlR8iRfCo43H
         V6RrjL9K1fJCPhL5e3abdxD2nVbAyq7IQ8bda192cnvZ1l3oPJtI1Ezl/C0y6nGg4Fmb
         yZuZUQ52iJ3VwjMN1WtqWY/0Hphq5aJlLbyrWaGSpaJ9WmfFbQjwbVLmX+r+MGnnWDz/
         Wu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zufc4WX0Sg8gho1/+Y5XWkaUuA6TVrZwSLGFlBgxd/I=;
        fh=CgKZdnXGK+muj5VqukVnl/Qy8HPYC+hdU4OHWESMJig=;
        b=XVAxIv5lsYyJVVCbL2xuH2RIZSg7WRhB1R7d0SG9332hL3nUBiNHauN7NgU4e0yUL7
         mvmtbjXUMU0XaL6k2n6y5nJ8Xw59RfyLWMFtjvE6hAOoeMV8Lb1xvYqqXuXZaiD1UMXh
         i4zNx00fKqm1A/bMK556dtzBvOZIjYTC/SVHXYNgtxG/p3xAqnd+KTQBTHVstJc8cCS1
         XV6Ne95Odp3vYRFQCgDql3LE7EJWyM5sm8H8e6ATQPM23mkcYfcvoSwpree4BcgZWqHE
         xZwRBUQr7pO0izMLslgLEBpL15c4eH15RLvDPz34bF3CZedjnTAb52mOxL/Fs3yRDKZz
         I4ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787201976; x=1787806776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zufc4WX0Sg8gho1/+Y5XWkaUuA6TVrZwSLGFlBgxd/I=;
        b=AMB/tPJRpP0yo/7wc/KwrSsoaov4t58vg5AVy7djDas6d/DZc/hwAAidTfhkEAbo9U
         Z/an9Hf8qGkUe937AY5oQ7GcfdwDuUnUh+khKjvAPnqPdURYkYpEL536SJlQFfP1T62p
         vpzxHkjxuCdu96pDXHnIhn88kyMG2dxMVDMQORxZzS7mcfg4fxuqc/NnX6acGNAdwf5s
         OGkmWdqHCJE01m1GeCs/uiiKYoWxScKsv+1YSxXNFsglepdN5wT4FI+UShRdqk1F4CIZ
         F8aCsb9cazwhngKGAH3W8IcaqLCOCSCekWWIg++mdDDaEfxCzDBsbD95PfbwfXmA1LII
         a1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787201976; x=1787806776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zufc4WX0Sg8gho1/+Y5XWkaUuA6TVrZwSLGFlBgxd/I=;
        b=XDLrA+8S/ihxKqm61dexDrPlhjVfrKDaN26lBdvkMNXgEeHe8L7kdmsTmDFSE2S5Ts
         dXv3REFwtOG1Qx5u/MDywZIsOermaXu0NsXNY+qkGRJ+qr26H61EHO8EN4BJjsFE8lf4
         GM0oE/deECLxz5BjoitwguwLPVRJ5EgecD7zz7mDjrSxI0Ly7t0eEbQr754yOIvpBpfI
         WxKrBLcovQ4GNbP3lNQIvFz3VKfnHcq8d/4AX1pR9g/h5GFSbItp6E7RZ71rx7wSs9Kr
         JpWYgl83Rc5rpw5WHkyyOiABBLdNdT9g9uUoaGtZj3HWdojiYl7nCK6OjP0NJaHWi7Mc
         LYIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgfpO3XiaG71HXLbJ2fbcyPsO3i7G1KNsxxnsTE2DQqA5Ec5ODO7zxoJh6MbIYNbGg9jSTWeGUMFdI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1wIDY1tKVVWbkt3/iZfXcjn1v0jVCUJQEu1jxy+qrbaLNiqbd
	kMv45tVGNZhaMX/hWgdRbOCaaB+VnGwKlPepR2rrPEygjlJOo7tUToAsmWzP/GufagVyqYnGZVQ
	KuCeMQpQQnsg1uY/eYYj6DwkZW498Cqw=
X-Gm-Gg: AR+sD10Dt+CA8xSCcrKsWmKLb8y+9DzMeP98AteIMXH1R3Xp70+AEga4p4gNPtLQKWm
	d1MWoe/c6XiLeJXn07pryWqgCF1bqkKMaa+qBG6R07x7HxkmgZqNANRe3EI3Bc07Y/nAzTQYZyK
	x6a/qKqw6EAihV0PqjzKbJ+tP4f9rkizgAG2q5YtXLc31/kV22DhocbLpYLWRjdnAf2c5wkVND6
	BwlsOJDstndHAFRtaV+trYiv4p3qV4f/tzI2kQs5KB+NiwlKv7XAQqJvMXz0gBTO7653PuKK0bL
	w3rKcOU4Sdhuj85IihOcYmBTRGpqqj8Hm19jZLwMjvpEuNXRLLDS1h9NTCQvJ72iPY3ZkfY2x5p
	qqW7RGyNSVh6+7j7RSmdlC0KTDorQIQU=
X-Received: by 2002:a05:600c:4ec9:b0:495:4d5c:903e with SMTP id
 5b1f17b1804b1-499aa167256mr164468515e9.7.1787201975975; Wed, 19 Aug 2026
 21:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aoWsgnsw5gC6TCj5@shikoro> <aoYIF8zAoPNyJxXM@ninjato>
In-Reply-To: <aoYIF8zAoPNyJxXM@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 05:59:09 +0100
X-Gm-Features: AcwNN1W7S4-c--YpoPqDr1HOqwCpIkde2HyjoAoIKaemmqpjbHFxtS1AgXlkzFE
Message-ID: <CA+V-a8uuGAASraLTEk6PGWR-NrAn0xEAZBtY2_P6-6m5O9ihzA@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 8:46=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Thanks for the quick update. I have done the review now, but still need
> > to test it on my N1D board. I can do this maybe this evening, but surel=
y
> > tomorrow somewhen.
>
> rtctest still runs fine on my N1D, so for the whole series:
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
Thank you for testing this on RZ/N1. I'll look at the remaining items
and send a new version.

Cheers,
Prabhakar
