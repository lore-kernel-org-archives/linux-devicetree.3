Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A64968E6
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087443; cv=none; b=hCmkuzpm1jhXpeVrh2Ty0afzM3X1lKBRSy7+rq5NPU4I+BdQvSbeqAEg2kWay/4LiD43LIHC3F7OiUyuXMCgw0ZMnyC0yACgyR3aIikrMCjAh2dq4zPlPRJRkmTsg3gvqioRA6P/vbf5oYpsNGx4+LDyHzBDOV0dnOO2PbGEUtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087443; c=relaxed/simple;
	bh=tYveBhCTFny0+2MHsYvbpE2kTFRGKHGAD7ns0IvW+Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWp5XoFYCiffFLRVhUOARtnyTvNPdydYd+/RLcKl312tblFevd4duXYRJwOyBlygiUNGfgfoADGFiy3GZkyFUoeamNUiBaswJwnkrwqFRDGVqtrQbHW6tGKUE2hQcTwOjNoo3xJjrEM7hnuPFF/4MUEd694T9Sf2CiM+PCcRfq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJue9dSp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJue9dSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE92AC2BCC9
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778087441;
	bh=tYveBhCTFny0+2MHsYvbpE2kTFRGKHGAD7ns0IvW+Hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RJue9dSp0JnbL7R4BxcEbZyo858PE0RciGFReZFBWoN6nRnJhkhCyFgs1mj2qsHUz
	 bpEOTww4L2JtoNi4R12mZKjt+qv5r148YQVafFPBC/ujcu26qnRZY0pHNZyUOKGN3r
	 aAWiVBg8KBcZTc3W6aCVwhB+9M9TYfl7d+v346n0bz3PFRvqY1xHXHq908clRxZunK
	 JPuXuNB+mlYrqvwJTFvZ5eW8gcNkiwo0AR+2dEoWeSrHxoz9m3v+CD8JSsCEpNwPAb
	 r9dZYdbGKBbshgMo0uKH0GiJgSPpB2YMjNMYvDSFE48Uqqr05sGwtUOSrY7JBUYCTa
	 kBhGY3Rjj9YbQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a86bfa2a4eso6063140e87.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 10:10:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ803AsLUfkKU6NIs8zRt8BBtSJ0f87ZlQtbhitSAXnn8Q7cYtgi2HHjc70ZauP1X6duVKJD64Eqya4O@vger.kernel.org
X-Gm-Message-State: AOJu0YwGraZZjg7IB7BMj81WohErIV4XQu16nKfQ6TD2LWDOi0JdptAD
	MPiJ+3eBm2xdcgEu6nQDzO84cy2ycNT4+h4JHGJpTL8z7Kp/kkcFaX1OzzsOnnW4voyNBdba1VI
	d9Q6gmaSXeJpiGw3ukHqcK5oVy28NkBo=
X-Received: by 2002:a05:6512:681:b0:5a8:704d:c20b with SMTP id
 2adb3069b0e04-5a887ce98c6mr1667876e87.27.1778087440537; Wed, 06 May 2026
 10:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506170236.2610955-1-kernel@rembrandt.dev>
In-Reply-To: <20260506170236.2610955-1-kernel@rembrandt.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 6 May 2026 19:10:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLk8Aw9f8ahfkpdvdaZyC5H0_wKzvB-2UQs94COdOBUVVQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ir8WGzkyfsIZ4qNbaD-5okd0En2H_avAERWXswILzSBgy0xP5x9P5Z5rs
Message-ID: <CAD++jLk8Aw9f8ahfkpdvdaZyC5H0_wKzvB-2UQs94COdOBUVVQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: st,nomadik: Convert to DT schema
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 7:03=E2=80=AFPM Andrew Rembrandt <kernel@rembrandt.d=
ev> wrote:

> Convert the ST Nomadik boards binding from free-form text to DT schema.
>
> The binding documents the Nomadik NHK15/USB-S8815 platform compatibles
> and keeps the existing example.
>
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>

Sweet, I love it!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
