Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EAC3806C5
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782441474; cv=none; b=f0aL1lryzeJV8ngIQlPrBAbzPgsJfn2tU3OLqP8QEqtzYeId9E8k8K/Tu0qFFgoPC0e+ykgjPUFd/SDUmL50RQkYSbd2CqfOVxxWPdtdAAxPOMmbnLzc7SymAE/JM9JPmE8jZn29uKyZLNszCDOazQen7AQEXRy0PS6oc6gTPY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782441474; c=relaxed/simple;
	bh=Fhf9thSLxQdJaicLXEQlwic3MXEYNby3aBLj1Krkeqw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZdD8eKS6w6LJ1SthgRR22DE0eJNCEgK/r7yPR2FeY/Mmr3GrFO7Z1GmI263v5AoFyLk68yNUN1xsFpgu3mqmsG+Cw0Ihrr2lmh9UfCBOhzYYOhCPquV4cv7dJQ3QYjodbKc/J5sZTjQn5psrT8PaC76A4/21mY6KNxK/AE2sMME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhIBmyLL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhIBmyLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670D51F000E9;
	Fri, 26 Jun 2026 02:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782441471;
	bh=UjUmewyavgqP9+yI1eo0RXjh2wvPZdzV3CVt+gIZ/0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QhIBmyLLjY3uLfmNgm6fN7p6ohn0/bJf3b/lH1hPvN3poasyKNizCtoEnA86R834/
	 Z6XC7tECMk0c49ajur7vxNSBKqBgb5JnHntyhqVKOkGKe8o1nGH1U+J42MN7v6Mvo4
	 fVnbIV6MlFlLfgkdyeYneOYlRr7jnlrIUYswih25hdT02kslcoHuCWDFyoH7B1hjM/
	 vd/N8r6bVOhvQ9a+owqwkJKJxByWgd4LJTtmcEfO6C191/GggjAIKwTeAkC40eUt9T
	 eV0nUZrcIXA3eH0/LWUPUOQ/byZzZEiyRQlHrEXeamKOpI4V7KgSt9Sz/JkgU3TzVb
	 D4mkDy2RLb+MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/9] ASoC: dt-bindings: loongson,ls-audio-card: Use
 common sound card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <fa72a429a9d076d381f7d514184f19d5a35ffa51.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
 <fa72a429a9d076d381f7d514184f19d5a35ffa51.1782439646.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 02:37:51 +0000
Message-Id: <20260626023751.670D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Global state corruption via in-place modification of static DAI li=
nks array and codec string buffer.
- [High] Sysfs and ASoC component name collision via illegal `dev_set_name`=
 override during probe.
- [High] Bitwise read-modify-write bug without clearing target bitfields ca=
uses incorrect APB DMA routing.
--

commit 864c9404304a7ef17062fbe81f6d13b229c50a0d
Author: Binbin Zhou <zhoubinbin@loongson.cn>
Subject: ASoC: dt-bindings: loongson,ls-audio-card: Use common sound card

This commit updates the loongson,ls-audio-card binding to reference the com=
mon
sound card schema. It removes the user specified model property and
transitions to evaluating additional properties via unevaluatedProperties.

> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-ca=
rd.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> index 61e8babed402f..e1b7445a8b22f 100644
> --- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml

[ ... ]

While reviewing the related sound driver for this binding, I noticed a few
pre-existing items in the driver code.

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in the
sound card driver when handling multiple instances.

In sound/soc/loongson/loongson_card.c:loongson_card_parse_acpi():
    loongson_dai_links[i].platforms->name =3D dev_name(phy_dev);
    loongson_dai_links[i].codecs->name =3D codec_name;
    loongson_dai_links[i].codecs->dai_name =3D codec_dai_name;

And similarly in sound/soc/loongson/loongson_card.c:loongson_card_parse_of(=
):
    ret =3D snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[i].cpus, 0);
    ...
    loongson_dai_links[i].platforms->of_node =3D
        loongson_dai_links[i].cpus->of_node;
    ret =3D snd_soc_of_get_dlc(codec, NULL, loongson_dai_links[i].codecs, 0=
);

Will this corrupt the shared static loongson_dai_links array if multiple
sound cards are instantiated via the device tree or ACPI tables?

If multiple instances are probed, they might overwrite each other's
DAI links and codec strings. Should these structures be dynamically
allocated instead of mutating shared static memory?

[Severity: High]
This is a pre-existing issue, but there might be a sysfs naming collision
in the I2S platform driver.

In sound/soc/loongson/loongson_i2s_plat.c:loongson_i2s_plat_probe():
    dev_set_name(dev, LS_I2S_DRVNAME);

Could this override cause duplicate ASoC component names if multiple I2S
controllers are instantiated in the device tree?

Calling dev_set_name during probe after the device is added to sysfs might
break internal kernel tracking and cause probe failures for subsequent
instances.

[Severity: High]
This is a pre-existing issue, but there appears to be a bitwise
read-modify-write problem in the APB DMA configuration.

In sound/soc/loongson/loongson_i2s_plat.c:loongson_i2s_apbdma_config():
    val |=3D LOONGSON_DMA2_CONF << LOONGSON_I2S_TX_DMA_OFFSET;
    val |=3D LOONGSON_DMA3_CONF << LOONGSON_I2S_RX_DMA_OFFSET;

Does this code correctly handle cases where the bootloader or previous
firmware left the DMA configuration register in a non-zero state?

Since LOONGSON_DMA2_CONF occupies multiple bits, if other bits are
already set, the bitwise OR will blend the values instead of strictly
setting the field.

Should the target bitfields be cleared via a bitwise AND mask before
applying the new configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782439646.gi=
t.zhoubinbin@loongson.cn?part=3D4
