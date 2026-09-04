Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0F8381AEC
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 22:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561950; cv=none; b=Arsu6V5/uVBFWrubaswJjMYy6RF1FkNcRbEeldZsOvVu5EsO+4MmAKbRh5aVymbRGBCoPznlUUPojD5hViEbrqR1yanQxcB+wT2gYcvXcecr9u6AxPoLIW3MoEpARyWyHsMTrS16nlN5+Q6uBbmqBizLsKPjiWm2jJacO5R5ZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561950; c=relaxed/simple;
	bh=OJucLNzd0P6My3KuoiulrhmQdmIkKxbJHUvOKpe0+No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXCcWIW02ujJ6UUGyRaZn4QjXgLv2CoEf2lc4IT+jPupaot+VXAR7ANbrgNNtwAeFUIfma8gLjtee11kryqYBACzOZVCmMIaNN0RGbJjqVIAkVNWvHre4B3B//8ezfQSSISQ58ddCZ+/4cxvc3sV6+YJuXBDRFE7fbEXc4vZpjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVI/mE/r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVI/mE/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862321F01567
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561947;
	bh=OJucLNzd0P6My3KuoiulrhmQdmIkKxbJHUvOKpe0+No=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jVI/mE/rXo+KMPVG8eTlFteEXlYEFcXnEpCGJYUJ0OeuSkQzhlR5GBgQJoj0jpPSJ
	 nfjXuO6zPB6jjmxStvbvSzObckbu3lUSpjgzITpfsiL9pVRujBZmQW1qnAdatWO5XW
	 cngHWOc4Jb7QkUHa/2uts9Y8tHkZVlUvsRkR45YkzXkXMx8SHQKaZrs7ruVevXxgej
	 0S7NcZtz8gGLh/tUW3eAUUIDPchoNezybVQByX22dHYPX5jFRgm5y23DOzfvwkRDNI
	 t8SDwlMBTOS/YNXDbIjXuGFJXOKxxUXDp8Gv5ZF3gRAuy8QoSWHvfJ1GA99znB5+FM
	 OZBTTZux/TgZA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39faf9e2c62so11666341fa.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 15:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3EOWWcAORf3J//2SrVai9WOGSV1bQvwEJ/lkViRB8CziaHTIFdpnLonSJTYpHhSTIVUxGLJBO4UwU@vger.kernel.org
X-Gm-Message-State: AFuF++mgXWUEFvAf4Qt015Lg8oKUay5q0eXf2Y9G2XsApjaCGdXGEJL1
	aMrP4scXaIIb6gH1CmvZpov2fNS3SxdQ+HHZtoApduJo7/jFNajSwdUwR8oZQkabCW2Tcgr/QYA
	8uP5kWpFxcsRj2XXanirhBwrf9HD2AOo=
X-Received: by 2002:a05:6512:a84:b0:5b0:eda:de26 with SMTP id
 2adb3069b0e04-5b616f2f892mr1623422e87.16.1788561946156; Fri, 04 Sep 2026
 15:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-12-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-12-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:45:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fcS5UpomVcAyg1KXCXFxyQCUG2Mbqj4XG4kCYQS4tdQ@mail.gmail.com>
X-Gm-Features: AcwNN1V7OH90tc_RzF9sI6MD1gO6FdJaYJCKQoqZfbOtKCReNgI1EwM-3lb0Rkg
Message-ID: <CAD++jL=fcS5UpomVcAyg1KXCXFxyQCUG2Mbqj4XG4kCYQS4tdQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] arm64: ambarella: add ARCH_AMBARELLA and CV75
 EVK DT
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:39=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
> console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
