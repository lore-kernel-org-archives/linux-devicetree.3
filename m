Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C343A7E4
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787535; cv=none; b=i0iCTeOfkT1ZsXJ9MQVsJ363lQ/MK6JHQrbmWhNCm9mQQw+oX1gISgQHNd86QC2X002vf9f1EZksobmx886SVjLlePE59+pj9FkxlJZwlR9fvIG/A5nrc02C//GZDUC2ghCm24TLugSEIW2PvtYAgdhhFScG/CbY6OD/exGTY54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787535; c=relaxed/simple;
	bh=alOZHux+rGEt3OfowMT6XXYGyL+I6z73cmmhhJJwrjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+ayVVvnP55IiqaXTWkNoDJ5Ed13uHOYpsRpssrasJz1PTfud1fIKEA/OwXoeLkMbTLnQWBqyn8NtTex7zjzDNKsXEwIWAh8MogZJAhXleZY4LEHwO58UJ1hrVboVXHAXFJesxck1FEqUEWUWwHo6ntjioZ6EO4uKv7OpsLN0Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhaLhiZJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhaLhiZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66371F00A14
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791787532;
	bh=rHRhyeJJgvjTRWFM2lkaFF4bn6Y6uY9RdWmXZLzzy/U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=IhaLhiZJo9uS26VlKwLdvMYpJNCGYxtG2z0r3xBmjd7Mo1MuDBAjKSECWVysHGagh
	 saiS6x/+gr9rkZNvYRkjEyM6maTZJz6qchu2g+BR1QoFWyaqWIF6qPJi5gj+Se0u2/
	 HHGH1BlHIW7fPs3HfJnbG9ocW7DQXRiiDuroRnuMB1BEF1jWy4xJWzCaQHuOkpE8xU
	 m95V7oX4N3uUI4ZOMIMis4gQVmUXO03EQA0WElLvIQcVwZRpWz0d31fba9tXPRNo2N
	 lbD0OgP6bpIeg0ABs04yrMlHF6m3xcllHpzjEJYO404NAIlujApGh+H89jFInYOY5z
	 6mtuWAuAJtCzQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a20367cf82so11596491fa.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:45:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynTqdPg0XecSeHO5zn1XcCunA1OuN9fTrUiEIE6wP4pFil/kFPFxwwAKF58N1S7iBHmY7HIEYCV+tR@vger.kernel.org
X-Gm-Message-State: AFq9FYIVy9ApH1BdWwjOwoNGu5lIhCccpUNCVplopAv3i3D24oYWCE9d
	KFwiLKXWNmpE6D4zP4eIwMCQbVCfkydKDER5cItz4BK4ePAZ6RsE7xYeVlFcr2PQfm/vDDeKVDA
	huZnX5ZYR7/wDH7Fc2Vf51orRP7txMhY=
X-Received: by 2002:a05:651c:a38e:20b0:3a9:f132:11ae with SMTP id
 38308e7fff4ca-3a9f1321220mr164111fa.22.1791787531105; Sun, 11 Oct 2026
 23:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001022415.913959-1-iuncuim@gmail.com> <20261001022415.913959-2-iuncuim@gmail.com>
 <20261012-worthy-terrific-sunfish-3acbab@quoll>
In-Reply-To: <20261012-worthy-terrific-sunfish-3acbab@quoll>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 12 Oct 2026 14:45:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qkWscB2peNoY=ruhRPEpFd1pXVdbR4pJcpGfv4ZPurA@mail.gmail.com>
X-Gm-Features: AclHuK9HAKGtAlKRnjyjmrvJQfRp1uKpd11aie7YIZiINEatGkmlqkHIIaIp89A
Message-ID: <CAGb2v67qkWscB2peNoY=ruhRPEpFd1pXVdbR4pJcpGfv4ZPurA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add vendor prefix
 for Teclast
To: Krzysztof Kozlowski <krzk@kernel.org>, Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Oct 01, 2026 at 10:24:12AM +0800, Mikhail Kalashnikov wrote:
> > Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
> > so that board compatible strings can use it.
> >
> > Assisted-by: OpenCode:DeepSeek-V4.1-Flash
> > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I have the same change from Andre already merged. It should be visible
in -next.
