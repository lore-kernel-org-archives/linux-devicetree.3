Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482433D7D8E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696246; cv=none; b=ZsbFvte7XCgaNkDQOtoP92XzRK3g8wOT6LH3G/oy0lJ5OQ3a41W6IRJjykhDIzwGWjvFvBQXppGn8yJMsibgFaCu6Ngmj4asvWEzMKbk2kmKubCoctn66bIp5dZ/Tq7jPGyMHo5HzzYdHxPaz98PaWuWjmcbXRTcH7cTIPskx88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696246; c=relaxed/simple;
	bh=4vllGicUbdN0Bqlbgpv612IvW1fY5Ga0NBXa/j5YjIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qx1ooIjhnmXXKFwkWQLhe2kSWgb4jbcoIzYAe1eYCIIk+J77LM5kmsJ/5OM+5lzF5r/ru0L2jYqpZ3wYzecApLuz9iSkeGJmzLbkjphIpdnFI0boYlNSx1oBX6d6ujXPKlZ1Jxd/02oLibM48maKvWQQW2ZR/Rl4hLILd4N/tK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDYXVYt2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDYXVYt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D0B1F00ADF
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696245;
	bh=4vllGicUbdN0Bqlbgpv612IvW1fY5Ga0NBXa/j5YjIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EDYXVYt22AF00cyF1S0+9lR40WsEcxJhlVFR8qF3ovFFblBONIQOPmXX08P6xIDQv
	 yiEtwWk13fb3cmDSNNSzGCdahoBEAviP5kHGzsRH2g+1IK6q0E6lAfFicqgJkoxhKA
	 4o501dS7kAgSDCANhxgYQYOsPg04CbGenXXZ2d/GxhML5KkILEs/s7PmNd+2jLVNUY
	 ExbpcAccJCM4tS9zX+3WU9DoKSWLaMULDjeiwif0aBigf0xh2suM8FGCcHINu8qttK
	 dyj93pNTvGi7GzuHtAeloPhI4ryY8275FZEDye1FJA5OuOPisrLKKciNF0+woOLrrr
	 C4hAEE+g6K6WA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a884815606so10175808e87.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 01:04:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ErJQjofcsXDdh96LKotALN94uMs+D5Th5wXhtoTSWFNa9SgDPS1dqekroFDL3g3x6ROJVZyxtMaZh@vger.kernel.org
X-Gm-Message-State: AOJu0YxnLExqeff9VVQ8VwdXgM1XXL5ElP01okN/xmgZhLKsRTeUdMR8
	1+cb+gtPX2tpz/stVhbVEXXmRu6H/g0XC0oc8Q+O5nWa18R1Gm2nx789257n0yn0kGFl6snQW34
	4vSKhkSwmTQccaLNIggSwstBUDd497S4=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:8825:15fc with SMTP id
 2adb3069b0e04-5aa3238ba06mr4490982e87.3.1779696243482; Mon, 25 May 2026
 01:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com> <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
In-Reply-To: <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:03:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLm5Jsrdpg=H8xowFzx9omJhGpamjjcg0LYN2R9HCeW5tw@mail.gmail.com>
X-Gm-Features: AVHnY4Lr6P_gJlk6yPcaGrv6903bIHaJS623wqRPa4vQc7mnCclEd4yYEBmZPTc
Message-ID: <CAD++jLm5Jsrdpg=H8xowFzx9omJhGpamjjcg0LYN2R9HCeW5tw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC1 pinctrl
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Lee Jones <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, patrickw3@meta.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, 
	openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 11:17=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
>
> Allow the AST2700 SoC1 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
>
> There is no functional change to the SCU binding beyond permitting
> the aspeed,ast2700-soc1-pinctrl compatible string.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Lee can you pick this up at your convenience?

I'll apply patches 2 & 3.

Yours,
Linus Walleij
