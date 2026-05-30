Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236261427A
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780119438; cv=none; b=WqR6mVppgIDX/45ykgWCRjRG0blYRThyEldatMJ55HirbNVjICR7h67ZTMpO7/R0xwrLAbkjbcANwzrEokjgxX+AFbrgrVAOms0YtIQGN0k36Bh8P2QW5kHSfOixSAKBIk+j+DYOiMKJ7upplxsoAMvjZHnYWVlLn+KB/QGZ1Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780119438; c=relaxed/simple;
	bh=Sb63RuMVbmOqWjGWfmmqgANwn1nwuuUzWgap9MJsyE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WqvxXQTyYzQ7tHgv/hNNfspo6CskqrLtUjLqMrHlojzw+iCRY/ZCbuQDt4aFXZqnLlRt0V+VYbm1nPPKuDYgYgt7YzyBVkyEEue2gI6lPXRjj0rtPqkcLVSLQcn5HHPX/yXwl1Ku6jjBuau3BnXtcLjGg5ZJqTvdsvMykfzYz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMTRCfbJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMTRCfbJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A59C1F00893;
	Sat, 30 May 2026 05:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780119436;
	bh=pt+me2yMaF/o+grb6fRyaduzpH/RhxVGt8QT91ajOwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FMTRCfbJ+rHIU6et8+z5whCBcLyYq5aU+3f7FtBtU+/GB148g2A3iBTJ6H9RpW0en
	 sGWqlcegSVzOz8aSpJR3Sqnh5YJw+EPPQtKe8rrj4ie5UWSO4EXndCfpFzK2+CZVuR
	 qaDKZ+pNQYU+PYmXBGLw1kMYjndo2ykff8UPH4RQaAQtrjL6ihILW77Ag2pgxXRKap
	 GtVhOzlhFTeEGhG3bdEzPSzvuR+1Za6jWT8r4J6b3W8HWLMTX51PJmvL0ZhNlp+11w
	 KxJcg7xaEVdeMgx9jqmaJRdF15H6utfcnFBV/xkYA9iEpaFKWVWr+Sw9r5xYLVMOxg
	 yUPHXjoYn/oDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260530052812.115994-1-manishbaing2789@gmail.com>
References: <20260530052812.115994-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 05:37:15 +0000
Message-Id: <20260530053716.7A59C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to properly handle -EPROBE_DEFER when requesting =
the reset GPIO, incorrectly bypassing hardware reset and permanently fallin=
g back to software reset.
- [High] Incorrect initialization and teardown ordering of hardware resourc=
es (IRQs, memory maps, clocks) leading to potential kernel panics due to NU=
LL pointer dereferences or unmapped memory access.
--

commit dce8eddfc311c261daebe971da37753c69680689
Author: Manish Baing <manishbaing2789@gmail.com>

ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
   =20
Convert the Atmel AC97 controller binding from text format to YAML schema.
The binding constraints were updated during conversion to align with actual
driver behavior.

>     - Added previously undocumented 'clocks' and 'clock-names' properties.
>       These are made required, as the driver unconditionally requests the=
m.

[Severity: High]
This isn't a bug introduced by this patch, but since we are aligning with d=
river
behavior regarding clocks, is the initialization and teardown ordering in
sound/atmel/ac97c.c safe?

In atmel_ac97c_probe(), request_irq() is called before ioremap():

	retval =3D request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
	...
	chip->regs =3D ioremap(regs->start, resource_size(regs));

If an interrupt fires immediately, will the handler atmel_ac97c_interrupt()
dereference chip->regs via ac97c_readl() while it is still NULL?

Additionally, in the probe error path and atmel_ac97c_remove(), iounmap() a=
nd
clk_disable_unprepare() are called before free_irq():

	clk_disable_unprepare(chip->pclk);
	clk_put(chip->pclk);
	iounmap(chip->regs);
	free_irq(chip->irq, chip);

	snd_card_free(card);

Could an interrupt occurring in this window cause the handler to attempt ac=
cess
to unmapped I/O memory or registers with a disabled clock?

>     - Removed 'ac97-gpios' from the required list, as the driver
>       treats the reset pin as optional, and requiring it breaks existing
>       .dtsi validation.

[Severity: High]
This is a pre-existing issue, but does the driver properly handle probe
deferral when treating the reset pin as optional?

In sound/atmel/ac97c.c:atmel_ac97c_probe(), when requesting the GPIO:

	chip->reset_pin =3D devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
	if (IS_ERR(chip->reset_pin))
		dev_dbg(dev, "reset pin not available\n");

	atmel_ac97c_reset(chip);

If devm_gpiod_get_index() returns -EPROBE_DEFER, does this check swallow the
deferral request and permanently fall back to a software register reset in
atmel_ac97c_reset() instead of waiting for the hardware reset pin?

	} else {
		ac97c_writel(chip, MR, AC97C_MR_WRST | AC97C_MR_ENA);
		udelay(2);
		ac97c_writel(chip, MR, AC97C_MR_ENA);
	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530052812.1159=
94-1-manishbaing2789@gmail.com?part=3D1
