Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347056;
	b=wQng7/V3oeOFxgzm+B/qR0QidnD97myPcmOjboc26WKB+P/paWzqqdb/splesKoOsKmb
	 U2sPxC9kkL+Lc9bf67HvkDvg4dKIA1t5VDnyRUaIc/hYYgSKNFQU7QXmDrE0rI+XuR7xM
	 q19XtCp7xKCQ8kU172MOisjD2+JfA0qeCLnvF7soN0l7N11DMcCRYTBP29Re2hfv6uKvx
	 NO8bxkEwgs2UxGgw8pnYga9YpuZOIbqFw1PHvIzeU8DSHagmWSOGOvMXJyqNN3ULH18pM
	 o0VDXxEugfrVpRmiWfvq/XQwrpqqyjIV6eSaHfuz2t1EvTQBPNnAoyZQft8zNdek/4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
	b=ahDynmDriggTFvdhrLb06mULCpUY2lIKUO58ck4uHsCtl9uB6GLmoNVKyFkB2ZUGQnI/
	 FaNKG0Xt7qHJFSY/tCiRwbHLvx1x1lkXahlfWCw8/1HI2F8hp10B6U9PQXRWBjIpAb3A+
	 vTxMrmSZEZyJgFwBcvC0WqpIV1oFUeuPkuAB1pIThoA1qKhGqrcYrYt9DnuJ/XYzzsM3x
	 CAIvcdYaxUhWCjZgB7cqWz0XTo25TaMaZt4lCzCN7g89kGUoyWr5pmuVhGbWF7CZ35q/W
	 rIkIqL+/TE5kR9CxEwAaQiEFkbeak4BS4u7eMn6BQsZw1J8AjUvPpkNIme3YAUUtvbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re6I7jHK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF30606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF30606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re6I7jHK
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so22512181fa.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 03:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795347055; cv=none;
        d=google.com; s=arc-20260327;
        b=k6Z3S1tQA312ULAc4gd8mhMX4eftNV9Gqkk2fN0kEGkoZcuThsW6d4qcfQuPbsQvDi
         Q89xhkO41OFsJznZTCqpT0CeQ3WDiwlmZAwnMEFfNYnXaW1ECDyIFXXQ2icmcSwNh6Qx
         SRErYw2fOaRwJqOk3sEOlXcdqEHt7cRM14Y/2hReX0eVVle0ATwuF+n1pmD4mDS+jP3D
         E60Qe0pDNhePZxQVu9BPdkyCsS8bUscL80NPG565BZOXtCw1Yub/J3KqF3OvqJHsqpPo
         PtjWwGMgm+oZizFQIjRDoaeo0trhqYhPsz+9vbyhjDlDfTmbBbbV70ltl9wtSkVttlz0
         uSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        fh=1wVh9TYCR6mCyWBBvC2HGGbmr5o9hfwkA2uxNtVt+RM=;
        b=Sn2KCU8vbXX9mAkUWqfMdgGgbhWeK/Tkn0+RhQHR33O5y/Os4vInQx1LwTyNUUOR4I
         +W8t0fhrjb5ocre3Fqm/4wTVaKzzo5JCISrhSUcBN+2isLjfs1HU7UdEhuFaufBnMPaR
         4tqgQUizY9PUfHecCLaXG+q0+KdlbK5e/2LYWA8HYol6uDOYZxK4lUeFjwTtwqrsn3Ya
         bBO3A0qBqSEYWJF7vrNPbs7ZO3v+Dv4f+7FbrfneaRsxInxWUEQl33pWSXu8PyQIDm6c
         r6/T5LEgaPL5EZR1xepsABrvYi6J35DjLAuwReUZ1kAFYhxtwpeF2KBc/xj7rql9Sh9d
         Dp9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347055; x=1795951855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        b=Re6I7jHK9+vdc0lUYaTP7u5shUce1zWoTNliKBzI29xJ1G0YpcCBwSl3NB810ns/j4
         thf7iOUognRvFMB6YS5SSTzTMbeb2bYFYL7HTKo2zHRSv835Wk1p2QlfvF/6ndXHkL+L
         hJ5/JEmbt+Dp7xqaUab7+nByfRsYddAXTgP3BJYjyiupy+ixStpqCjaJOL7k3OS022yv
         4chmwOwNaJxQhjNvdyItIe6ybl/H58EjUROgx7fnIsMqrTI4HbHH8Lc0ykBth3vkkoxI
         7oPbLCQjDDjrqL9v19yciwvehcL2dKkM557aO+qoJduIUfcsDT8ObclkWApiGGCkCEuE
         wnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347055; x=1795951855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        b=jyLevtgK9F/hbVzsYszx+Mtyz7nNeXTbHDuRjEIw7CTwbenotJ7cGOZh42zv2+A8W1
         51YHuvHF74Nys3lSjXwjxOxfDqkyeU6T8ArEgPT3e5J9kt4X0qkdE6QQkLelmQOmUaZ1
         YtGBxobAOjkShRLhfgF4eIJjC4nywhYkWhKV6DKCmJS9vDLuAk/0aXhgVB1V9vJde/fD
         fDHeyaLKnFmgf+dn8FlVY/HiTcFmAq0LT+goDIsAcDWV7KlenpeBsmrLukP/l++mwY96
         V+O17T1CszkAt8SWcMpqeex4Jsn2ax4BUvTwUxsFUlbJNEN+PefFuXqZju4xgs4maLXQ
         J6IQ==
X-Forwarded-Encrypted: i=1; AL+hErFKb0zRPGXLzvW3wOBlo5+QZUVSOGhb96udK9/itLy/FAS46uJk/+aeIKqKjJq9de9tTfGpl1OQiyEU@vger.kernel.org
X-Gm-Message-State: APuU4Z9WukH0RWcjO490Gyg70ghPXjpiVQcAD+Bc8ZGMTJJ0Sc3Dq78X
	bIQnE9MYqwBxi0jnQovEDn3eVNxSh84mL+A0G60H9uf0Mp9jUXuO6ALiPUPrtlp/3YO5YecuPXu
	TQf4eKN5AGxj7FajgAkjRQiKybLWXZfk=
X-Gm-Gg: AZFdTZcV3MALUZOih9JStGXQo/X0lIcQZDnduVnqhBXrIQCicH5aTtLixH5UHS0XSJD
	6Av9IJLq6T/h6buoY5EDUAN8xeHvo2dy7WARI0gtkGJOVtOrAJZGPBpyX15O9fumkuEuNXr5eAP
	hVtOdB8/Ov+SpZ3JMwD3z4avkkA1XzL6BjGv1ic5R98GL4HD/dMvRcBDMJjqsU7ZCHX5kuh2pAT
	ZciCiz71nMNQCkqh9YXo9ccN8sm8dEW7hOJ2ODcn1kD2f4lsT/rsusbtBOQgNyv73jKgpHXw9PZ
	HM470IGv8tplu/GsgBudyD2xDJc+fpBWmj6xTh/mulHtbhgkhPos98B6y5jovKY0X2F+cCSJuHT
	/QLkSRkLB9qjMB+P+MjDvEiyUYBm0pHg3BaW7GF8Q4Uy48/UHaXRL48TgH3f+s96c4rLxlGFm9T
	GRBUPdPewXAbRWqH5wem1ggReiiWhNvI5PS4l4/pIsBiLXjFk=
X-Received: by 2002:a05:651c:a32f:b0:3ad:fb2d:a757 with SMTP id
 38308e7fff4ca-3ae7fa45871mr24883491fa.24.1795347054437; Sun, 22 Nov 2026
 03:30:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119134041.16611-1-festevam@gmail.com> <20261121231726.71aa1aba@jic23-hlaptop>
In-Reply-To: <20261121231726.71aa1aba@jic23-hlaptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 22 Nov 2026 08:30:41 -0300
X-Gm-Features: Aa3M54qp-5FUOe8r1ZuLPebMgOZXGH2Yo_N6UQqWLwX2mQ0uaPQ4PbhpovaTi3g
Message-ID: <CAOMZO5Dp6KYkd6=hsK366x_83ji9tdumq9k5tWXJGvW0EeRpDg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
To: Jonathan Cameron <jic23@kernel.org>
Cc: lee@kernel.org, maz@kernel.org, andy@kernel.org, dmitry.torokhov@gmail.com, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-iio@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, crofts@kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sat, Nov 21, 2026 at 8:17=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:

> This bit belongs below the --- with the change log.
> I'll fix up if you don't have to do a v6 for other reasons.

Please fix it up. For now, I don't plan to do a v6.

Thanks
