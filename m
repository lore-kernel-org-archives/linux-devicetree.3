Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036533;
	b=SM1ur7gu6PnWtcDfMTY9YR/iGPTJ5Vki5aEM4ZLBI6t881lzF7LoXwDKJLcH6aZdBBZB
	 boTP8Ya37bJldX4MLiWSAcsjWf0LpLnfOgtPRBPnjOqIlvaGvvle+dm85X95TtLKnG6Kn
	 Juu4o0C5SD1yAySRMP3I3FOkNzMS+k2TjqF7whnSbnG4iLWk1HX0No2qhFdJ0toLeRB4g
	 BHihcrVPtXe4sh1bI8bpbeewroNKgV58GdDGz8eLPXzcLZjd96NkPAJhZvJj57V6eG/ug
	 AM1UU8CbS3HpoCrKc0jppVhHt3ls3ka8WpeQwB5mGl1D4iEwjBehYWA5Kyr6vwX1y7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036533;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jXpHBT1/WDmLp0zpzRIxDl44SN5leSzeHP8wCtpU/Po=;
	b=BTq5OtaNB2Y4jd+ItKbRgxVSuI7c5KAoHP6mZE7/WKiR7KsFS6QqxypSJYm7BnbAnB0T
	 L/ijzh8UjPn1h4ZIhlGDIs8gh7e41Gd+H3d/s/EoB5w1I5yq1sqk3cKpX/AkfTHHIR069
	 b/1UTP0f70XirkLg085dfcaNre1hDJ0MuR+SLlWl5shGUNRD5Qc+LtiCXnOk7KIPSZAVd
	 I7HH7nAuaOjiyFsijgrBQ09OM57KVsP1y9z8ntF97Dkr/QJ4T+L8DZKEUNF8vkHLj2NMY
	 RxqHPzHLw44HAJ75WQY8lt8KPNjwh5NYI9eJ7OKvZsgILJ7DVFLsazsAXyiQkTyN9FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjSyc0l2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D7E606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjSyc0l2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6833D1F000C7
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036533;
	bh=jXpHBT1/WDmLp0zpzRIxDl44SN5leSzeHP8wCtpU/Po=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kjSyc0l2jgfTa1Gr7mPOfzuP6tLnKgnN3OKAYB/HxNNqyFZcDFB46+L21kpljI9ky
	 tJ9h+IalPk9axrIlGCBbpRHL6+29YZuB0IVHAKxz0bo4UY+/W/P9jT12kdqWlun20T
	 2HxNcbk4DkYpClX+2W+G1UfwlY6KHQC5fEW0hNuGW6HVROF5lZNd2YIi+YBww4Uot9
	 Moc3q1Tx7Y0K5G0dZt7BtpTCDpZnSHAZI9DehbqOkkDjGZ7F5pRKWwoKvj6xqWciWf
	 NaL5g8qzFQNgtN34F5iEG1VxHl+YOFKpbN90QuJjw7Ir/pF7E7bE9cpA46y6plbFkh
	 HI60rU5SAnfxw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so13240001fa.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:15:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH35rbYxY5Z4oqR/SDXwwCfIyZH6iAsubHI2Z8xRv/M2zNyhzXnzlIrJxJ+xnhFRPYS7z365OWe9S8n@vger.kernel.org
X-Gm-Message-State: APuU4Z+63f0mZfhvWPfNtPl8cau+NDxHyl4Fyfn3XyYfQ2ObKQVlSW4H
	+YCuFSOFzwGu27146azoNZCLbEWb6Og8U6SHhmKveLI/a0NHa9eupJqIzkwxGG8SJZ7twc5O38/
	0HdcjPHZsIBM/fHGHzcFtbPSxi3zmif8=
X-Received: by 2002:a05:6512:1102:b0:5bf:f7e7:85eb with SMTP id
 2adb3069b0e04-5c1aa0736aamr1346704e87.21.1795036532194; Wed, 18 Nov 2026
 13:15:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110094339.749110-1-zhengping.zhang@airoha.com> <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
In-Reply-To: <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:15:15 +0100
X-Gmail-Original-Message-ID: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
X-Gm-Features: Aa3M54omwiJF0rg8LzwHPSiyolxNp74aN1hJ5GJPEJYrBTD3qh4Hbo9mWipBH1I
Message-ID: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: airoha: configure GPIO muxes explicitly
 and fix pad mappings
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Zhengping Zhang <zhengping.zhang@airoha.com>, lorenzo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, naseefkm@gmail.com, 
	benjamin.larsson@genexis.eu, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, lei.dong@airoha.com, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:10=E2=80=AFPM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> Hello Zhengping Zhang,
>
> Please fix your patches. Looks like you insert patches to the e-mail body=
,
> thus your patches were converted to "mail encoding"
> * tabs was replaced by spaces
> * unchanged empty lines "<space>\n" were converted to just "\n"
> * long lines were split with "=3D\n"
> * "=3D" were replaced with "=3D3D"
>
> and so on. So please use "git send-email" for patch sending.

I agree, I can't work with this, maybe review a little.

If possible use the b4 tool to manage your patch set(s).

Yours,
Linus Walleij
