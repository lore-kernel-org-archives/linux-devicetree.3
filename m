Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26360355F41
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 02:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539893; cv=none; b=YSu5XZ4KBPazMChEASQ6hsXuePjnHy+nSl3I3kr3ov4JQfW0Q8q4G4lKWwmi7daTZw8d6GV74JVqBXYtKcyfrGcX+rcPBdjGlFphYy7HRNS7gM4YBJXtRaTIqZukOe8XEPHC42hiGvieOgLOIt/9hfP3PMGuXl/kuC3Hs/jV1wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539893; c=relaxed/simple;
	bh=T4GQJjPYYTjDKtkhy8Fd3fCoh66uu6sTOnz3NOJbzt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NjFSgVPghAOiB1CzqtuYC1RAbDFQ9m6KxjDcLlVkPAKwD49hww+8j9Jo5HC67mKwIKYIFdVYQ7EJe7pPym8145252v61tkp1Gp5HpzKMZpMkVGhTSTLfxW4Jp4I0rMN4R36lBz4A1YymaoeKOYqHlBNvYyPU0Df47qTaVn2wRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhEFSEFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhEFSEFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB0F1F00893;
	Thu,  4 Jun 2026 02:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780539892;
	bh=BhSVYU1HNDxrIE+wTDQfCrVMynhi38tHt72SPFakJ30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mhEFSEFTMDB2rB7Yk+Mjm5XSVn5l5p9nA+osvJ5tl2jby9iQcLWyWrGWa4dnY2Sc0
	 r3XuJxOuZixFugf+NsoQp9VXnKzzpRgzkfdxXSek+1euCI9NAh0P4oMNpcDrSWB6WS
	 r7do0DxGll8o7cfpuqDEa+sJsFmD+HhUIZylEk334F8dAV8QOfSeM4Bd+4jK5zNpRZ
	 ONo7CfF4ErmDsCO1EfimvsyyFXkfrjxB8Rd0UeRzWSreH0ftzBW8+0F86hu5OZssNL
	 Ctoe8rhYQxbCSm12rk+ZJGW8JdQ1HUieS1iN2ycVr9hbB0I9HFPFpXhZT89b8dsGM0
	 dtu8HDO3dRTrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] ASoC: loongson: Add Loongson-2K0300 I2S
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <4b003425d16a18049c5b90dbdaf91024e265cd8e.1780538113.git.zhoubinbin@loongson.cn>
References: <4b003425d16a18049c5b90dbdaf91024e265cd8e.1780538113.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:24:51 +0000
Message-Id: <20260604022451.BFB0F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The hardware reset sequence is executed during probe but is missin=
g from the resume path, which will cause the device to malfunction after wa=
king up from sleep.
- [Low] Platform configuration structures are not marked as `const`.
--

commit 33b4276799f09ecdd4e5a93ded6b7cc2b6154e10
Author: Binbin Zhou <zhoubinbin@loongson.cn>

ASoC: loongson: Add Loongson-2K0300 I2S controller support
   =20
This commit adds support for the Loongson-2K0300 I2S controller. It introdu=
ces
new match data structures and applies an extra hardware reset sequence duri=
ng
probe to work around a controller design flaw.

> diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/=
loongson_i2s_plat.c
> index ac054b6ce6322..b4d807ee7f8f3 100644
> --- a/sound/soc/loongson/loongson_i2s_plat.c
> +++ b/sound/soc/loongson/loongson_i2s_plat.c

[ ... ]

> @@ -47,8 +53,18 @@ static int loongson_i2s_apbdma_config(struct platform_=
device *pdev)
>  	return 0;
>  }
> =20
> +static struct loongson_i2s_plat_config ls2k1000_i2s_plat_config =3D {
> +	.rev_id =3D 0,
> +	.i2s_dma_config =3D loongson_i2s_apbdma_config,
> +};
> +
> +static struct loongson_i2s_plat_config ls2k0300_i2s_plat_config =3D {
> +	.rev_id =3D 1,
> +};
> +

[Severity: Low]
Should these platform configuration structures be marked as const?

Since they are statically allocated and used exclusively as read-only match
data, omitting const places them in the mutable .data section instead of
.rodata. Marking them as const would save RAM and reduce the mutable attack
surface.

>  static int loongson_i2s_plat_probe(struct platform_device *pdev)
>  {

[ ... ]

> @@ -87,11 +108,17 @@ static int loongson_i2s_plat_probe(struct platform_d=
evice *pdev)
>  	if (IS_ERR(i2s_clk))
>  		return dev_err_probe(dev, PTR_ERR(i2s_clk), "clock property invalid\n"=
);
>  	i2s->clk_rate =3D clk_get_rate(i2s_clk);
> +	i2s->rev_id =3D plat_config->rev_id;
> =20
>  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
>  	dev_set_name(dev, LS_I2S_DRVNAME);
>  	dev_set_drvdata(dev, i2s);
> =20
> +	if (i2s->rev_id =3D=3D 1) {
> +		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_RESET, I2S_CTRL_=
RESET);
> +		fsleep(200);
> +	}
> +

[Severity: High]
Will the device malfunction after waking up from sleep because this reset
sequence is missing from the resume path?

If the device loses power during system suspend, it will wake up in its
default flawed state. The shared PM operations only perform a
regcache_sync() during resume:

sound/soc/loongson/loongson_i2s.c:i2s_resume() {
	struct loongson_i2s *i2s =3D dev_get_drvdata(dev);
	regcache_cache_only(i2s->regmap, false);
	return regcache_sync(i2s->regmap);
}

Because LS_I2S_CTRL is a volatile register, regcache_sync() skips it.
Without reapplying this reset sequence in i2s_resume(), does the controller
remain in an unstable state after resuming?

>  	ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_edma_compone=
nt,
>  					      &loongson_i2s_dai, 1);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780538113.gi=
t.zhoubinbin@loongson.cn?part=3D2
