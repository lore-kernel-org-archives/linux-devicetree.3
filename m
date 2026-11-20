Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795185925;
	b=XUL07eYX1vuaByIm3ymrYbeBU/T+7JvvgWoYznyjEC2+Vb/b2xJ3mQzw2Sj0YSGdC2gW
	 0XjmH8Swl+S5D6tXm12uYKg9IoGmKoXzpC9odyOkaxrAUxSusAEjQqn67iZE6lE0s66m9
	 /A1W1OJbaI9eXd92VyRvw99bHZ+mf9RagwZ+w/TO8gMKbSyuN4k6zSZia0MHWO/3B66UH
	 NjYOENJxnUZLleNEsH6qRLDqs1r1aWo+iwoJpVNFaO9wUlnuQ9MFgUTG8ZfQ0R31Jj81Z
	 R+K2OP2C/sohAqiWSqEuFMZADpgqKzowOU1erJJLW+yXoAwpDBcClK6yOElin88sygg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
	b=Plm4cadjeF4ZEpoB7SMX39Km6AZtC0/Omhidv65sFaDa37vMQPvMcvrm+2F/dsifyZQN
	 7ANqUAf4+RZNoJpvTmHoeXHfo2XigChiXJC5x9B8rxW4OUhmfOqdgQeGDBVChTSa09gtz
	 pU7mgZf1THi4v0WRmgrCTOj4JEON93xCFD7I0YtVK1sjJBROsxTrktatdWjCwjbD6D+Vq
	 Q7dcarfiY2mMGp9Bz3M2JduXVZm6ZwmrX8g7EQf/RS4KCGFZXlSLEOsFnqFzkFnNpeedo
	 crQZ2+lloPdZYFXYJEBxZs2XUX5Xo72batgSFHL4vOEvXxtUUScDjSOeRmJRbKKFewA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f633lngd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51282606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51282606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f633lngd
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so11394945e9.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795185923; cv=none;
        d=google.com; s=arc-20260327;
        b=qWTb6lvFaP9zs7yjFq0DxPhydrbCVy2CJ2BXXJbq2kOLqtd1gtcglaA5UsiM9jNe/m
         hqznf/6AULv4whMbckq2Fq640q0iaNNvSWvNBkVTNmDNZ5OTo8uiuVeWrtQ/y/zfzmOK
         AyVHCsFuj/ISflu1/Drmr/cL93PO/8eClsXFn8ATHQftL73GqNeMR0bIXt84FKvNONLd
         37UvstNS8I4jJAW/JGOM/GiHW8AQRvPmAoifqMMOB1xvFlxwJ2Te7tBEsDjvVGQwi0n3
         w06qjfrgu6zLUKivmb4xn+4KxP8de1I4bzI2QYArTVuYcBr9mETm/CZ68UYHX7DqP/JP
         cIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        fh=TWnvUSkVtUoKNdpuWrbgD4f/p6l2GvlqiJMC8qsFRkk=;
        b=AZ35yVulVY+GFeqlT6NDqRGfXRhf7rcNg81teyqUOGgXW5gtrTzndCdaC2CoCcdGfc
         pLSaXzm5Te9W/M/qphjRy0P2sCvssIznP65j/dTjr8cVVCIqCzTswH7Gae4KMT1XcSrS
         rYl2EeHHSThw8vZiPXDNGPxVKSgcYP0cXyFHq6zJa4v9IACSE4qVPLuSxrbAAA1k3GuU
         KaywQpOdiYbzVi8pM1LH1sqQuczC+G4CFkgvnSgtK7NRwAonkkWMKNBc6qNPg9YsXwCV
         IPsiF744MfT5oxliGOgvyJVd3g1tH69iMJzskvNvmSii0+RoJf4RIseH2rdLprRLflQp
         Ndxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185923; x=1795790723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        b=f633lngdGyeQgB25tTiMalyiPph+6hN8WmbHgECT82SJswThbaePLCy4l4EPftPtIp
         PKShHiUnceLJ8YtKkiJ9WD4HOohsmUPru2Rk54Jp7v+h+lt0sXRUB2JmL+vGrnho9nNL
         iNvOIx3kaDiNtxVzZSBikjptHRr4HrX4686RYbGwj4IMuKoAKLuUfOqJAi8gSRPaPPW8
         BMOEIsSuJsOCSRF04JxQaO5ZeWJ6yMpC3+5AFtTLpXCYCXRwHkR2Kh9vOi95U2BEzdFO
         6gFFqoSY53nH/uARMgEdZ9SRE2KvMbI/pXAxGuLZuo5Spmz6F1berC8LPUD2OBeVwLrd
         2gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185923; x=1795790723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        b=rBRg4YePq7rjlm1SePXIzfNsEwTR0/H7Pnx/rm06JP1qeWcFUYrtel8nBYjRy0ISP3
         3TPnrQO+PYWLl6Zi6ch6wVefm0po7WX9Iph0SiEhpsBrTWFK2zIKg1S8dHj3rxYCo37C
         3II0PmJXCDZfO3tp7Sxbxj83DnXMkef0a9qKk0gxFdsrP7HDTzSk4t6VbxVPN45RWSs3
         12UKhAPil69gNW1YxghosneoDnb91P2GUBtdefQB0hxqeSviodOcfuWYJylBt7LiFy56
         I5rvGWZdF8uUxGkuxoy3ftDrXx3K5NbEuPwGgsLxyAR00UKcSKUdH/C94HrnBIwFB6I1
         YbeQ==
X-Forwarded-Encrypted: i=1; AL+hErEjXgN5AXkERLsK+YkQtAzO3/lNKANxCOVVWXTaqlWuEnklJT/+7e2cEqxU9Q7N9l1AtMkk88rYCXwH@vger.kernel.org
X-Gm-Message-State: APuU4Z/q1TkbQemzzIzpzG2TYGCS9cB5eZcwHkyiwNIIM9PEB/cHrXWS
	SEQatJ86PFR2O1TuQJXKpRgSteFtfxRBbduRvaEhLM3kw9itJ7+wN5aYqx84HZ5go5qVrpdY2sv
	b12jglHD52hQ0ej6zVwuhMRKLkpulZMs=
X-Gm-Gg: AYBFou1KcrzDWTWQWvov1rMMygW1B42FSZUojS6k4dyl7SDdzqCatsEnQQ9P+Mi6ZyW
	cMT/QswGnFDLHR+oiIT0gobSUceKNkttnoqBcT5LfquZydeqCvAxLUhQ63hEPS2w2mh/8llTZID
	61X8de/m3BHAayCNe0qIrgengDqzvVdsVwbanZLSrzG6NJWHRCIwnhjHl9X0qLosSZj7EIAeBWT
	3+vkZVOVfnZLaPeUPZkhr29UfnPVDOTdfQwcLt5O00XHPBcdU5jBeTki90lLXj11CcGLFVHafol
	ZSCJrThmxM/8z5+SkQLI/ddAkm/WXMGwPOnejY/L1FntiVbpMqMj4Cxm0Pfl9SFdwwY/YsBo8P0
	r1U55qQKIGEqdOwgmYq+aBbuwsRnca4EtmfWmhJPP/h35AZFXGePglYcmAnykSKApd1XEXO0mls
	EiKulBJIAA1W4NnLZ3WDzNUahkqwgRrAXYuKn3iYL1xYkidyTxW6GPsaEmw47RGqyOvVCAH2Ann
	dTLPLnlwmgyTJ04vhwa
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4bb887fb678mr70511175e9.4.1795185923328; Fri, 20 Nov 2026
 06:45:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261119191426.54709f08@kernel.org>
In-Reply-To: <20261119191426.54709f08@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 14:44:56 +0000
X-Gm-Features: Aa3M54pSOd6vTx4q0dKEkhbWmYi38SveFg9iQJwARff5g85g_o0F_47BDGOOQQk
Message-ID: <CA+V-a8vB25ypt5693HqdaRMefWUu5Dea52xY156jTT6roQ=q3g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H
 and RZ/N2H SoCs
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Fri, Nov 20, 2026 at 3:14=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 20 Nov 2026 00:25:10 +0000 Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The max series size in netdev is 15 patches:
>
> Quoting documentation:
>
>   tl;dr
>   -----
>
>    - designate your patch to a tree - ``[PATCH net]`` or ``[PATCH net-nex=
t]``
>    - for fixes the ``Fixes:`` tag is required, regardless of the tree
>    - don't post large series (> 15 patches), break them up
>    - don't repost your patches within one 24h period
>    - reverse xmas tree
>
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#=
tl-dr
>
Thank you for the pointer; I'll make a note of it.

Cheers,
Prabhakar

> Looks like CI has already wasted time processing this, so we'll let it
> finish, but if you break this rule again you will get banned from the
> list for 3 months.
