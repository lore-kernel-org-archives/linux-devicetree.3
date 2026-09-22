Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D37425886
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061975; cv=none; b=H0kXV4nnXKBAMEXz2IAvoAu46gi8TOZMVAWSgAXchxYbSJXp1JBixyodiqtsJjglQS/QdpK7YpMtzAXtSnWlbjU9NxnFs1bZOERKlKx7HnaJZlsmk7xQ4Fx2Hy1MQVYAGZD2BmdiMMlQ4xc18mWCh6eTvLX4+h2El3H78n9wBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061975; c=relaxed/simple;
	bh=gnWpQWAf2Ex2oJ3zXG70LBtRWnH3/op21r4JuH9R6k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PA2jM96edq+MyKdQLkJRJ4lf3RE2BR3rN26yQy/7mDBZ5d00YwRRlVYybuJrEmm6LWc0d3kjxMsTRND24w45ezGKvT3IRRmxiZWRXFSV7ExZTnf//2mx/37dhbbVXztP1A2QTItCAD1oj7Zqa5DQWZIo0usp2SZuQBIc29ShKIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpPaCgMf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpPaCgMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C361F00901
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061972;
	bh=gnWpQWAf2Ex2oJ3zXG70LBtRWnH3/op21r4JuH9R6k8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LpPaCgMfm7Z/l2fIA8loLyB5vdxzaW1ZDVozibGGyVLMyp4L34Hz7A2+B9/dcNKb5
	 07pLtUzBbf0bcXxMw6Nj384h0azqSOYWrria8j8hkyizjlWbHDUZtWZW76P3za9Gcz
	 ko2nZYFjmS34xykMS4YPRHkovdmkhNPF98xXFdMJVT7se1qNpephkhu5d3ybtQy/nf
	 HRkpnbN/WmnMPXDw8mbo/04rtkJ+i6dTaMFjRoG9OilOrxgp4KiHA4W1dxFZx5iNVr
	 ZxG+hOdUqrbk6++INNyy+0nyoXMH9py+prmwqWFvw4Y5XDo890pjLP8FFgFpoTPx/6
	 VMoIqNOq5sc1A==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso3039608e87.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxozjqSbNgI5CPCgXZ+8uzI/niXox+ZxCQ/mm4ug4c/Ca8S9P0C8aRPr9ho19geBirEn1TRAfi8ns3x@vger.kernel.org
X-Gm-Message-State: AFuF++mMYgMmw7bOH2bPDQObOYjog0IMfizdu2lCnKP255N7iXL13/a3
	bvYMGi+uWJXVFWW0P2CdU1RcsbgrVZJi686JJBqV6hh3pfSYRz/tDJnBdOMnyYuG2hQYI6+1Fh4
	BvuhlyKShUdRF4yrAJ9iAKP5SZMlgK5c=
X-Received: by 2002:a05:6512:3046:b0:5b6:183c:5ca2 with SMTP id
 2adb3069b0e04-5b8c195c05emr4518896e87.64.1790061971274; Tue, 22 Sep 2026
 00:26:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-13-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-13-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:25:57 +0200
X-Gmail-Original-Message-ID: <CAD++jLkAfQTGNGTqL_bMD7S_x-kRMtJY=nOEkVdHR4eEoUJVOg@mail.gmail.com>
X-Gm-Features: AclHuK_tzDtaJ_wl5w9PHnR3CExWinf1MCYYaeMXhkMyxrZ9pQpsY3Z4mhWO3ik
Message-ID: <CAD++jLkAfQTGNGTqL_bMD7S_x-kRMtJY=nOEkVdHR4eEoUJVOg@mail.gmail.com>
Subject: Re: [PATCH v8 13/18] gpio: pl061: switch data path to gpio-regmap
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Keep a custom irqchip and irq domain. The gpio_chip is owned by
> gpio-regmap, so gpio_regmap_get_chip() is used to wire the domain.
>
> Check the chained-handler regmap_read() return and always
> run chained_irq_exit(). irq_type keeps the MMIO write style
> and uses cleanup helpers from the previous patch.
>
> irq_set_parent() nests the GPIO irq_desc under the AMBA parent
> for irq_set_wake() and lockdep; checked with PROVE_LOCKING on CV75.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
