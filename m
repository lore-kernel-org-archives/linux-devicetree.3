Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724C3822B4
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788805024; cv=none; b=eMmamB2low/kbRrcpkdWjIdS+Hycx40C0Kw2TkFt9mi5Fepn9b26fIE0AjqlqJmVL7b2VvAgOTRNRml9SlGU3em+toxvxl0vV2aznpBSSgFv4M8eN7mPVe13e2Oj1prdXScOttA/bl7Sew1lJ9EaWn4aV5+rawZB89u/wz99FM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788805024; c=relaxed/simple;
	bh=mf5QHmYHnJPuAbjxdMhSCg7qowewqTdxzaKp6LLYkUs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FNyOfE5urEDar3vzKxTk/Jgw8Cap5hvhX30yeNW0u0Ls153Fe1MFl1lZCMmp954zFSjqsGrR1StM1L7ONNXEBrHZEV6WFRqaKRKBe0yfTgvQoYq+ChGV8nTMMlWNSIgixMcbG7tLoLhjiAHp6vO4ow/dQhwuEbsX3vP4NyDO1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9LRm3Xt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9LRm3Xt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89071F00A3A;
	Mon,  7 Sep 2026 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788805021;
	bh=qvZketroSNdwZ8d9r9CSov0hqbbQMAPMfaz6qkKctzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P9LRm3Xtoh+8EgZTt4ba8a1pk0irdA9U0/dDIIi3dx1llACpziSoOIr7NOWSmGSfs
	 2+/C7h+yXm3+Hw9YP19rN/W/IRZIDk2RLkPJZuX7Y9btKxyPu69anCvUNHNZdH41xq
	 7N2lXIHU/ykMf+2c4i14uH0yCY9vbspebULLe5ga6jN3IJUuL7YK7RUOUaMxR+Up41
	 2A3T6HXVqT11Tb/mUEPoAq+nPUb9JFuEmU2ZTLa2eZuM3/gZpM9Yt2GuYkUNuy4iOv
	 le5WNEgoYiSXL5Obn2jaE5qpyBTySNQ5jZKyjitT/sfvBm0AGeAIDrWEaPzmBkyCTG
	 enusB20eegf7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 18:17:00 +0000
Message-Id: <20260907181700.D89071F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Casting clk_disable_unprepare to (void (*)(void *)) causes a fatal=
 Control-Flow Integrity (kCFI) violation on execution.
--

commit e63e11f267cb1c89c4801467a10adb890c3c4c31
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: codec: pcm1681: Enable system clock before regmap access
   =20
This commit adds optional clock support to the PCM1681 driver by acquiring
the "sck" clock and enabling it during probe. It registers a managed cleanup
action to disable it during device removal or probe failure.

> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 60fdbe5c4e054..cfe549176d14f 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c

[ ... ]

> @@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *clie=
nt)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> +	priv->sclk =3D devm_clk_get_optional(&client->dev, "sck");
> +	if (IS_ERR(priv->sclk))
> +		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
> +				     "Failed to get sck\n");
> +
> +	ret =3D clk_prepare_enable(priv->sclk);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable sck\n");
> +
> +	ret =3D devm_add_action_or_reset(&client->dev,
> +				       (void (*)(void *))clk_disable_unprepare,
> +				       priv->sclk);

[Severity: High]
Does casting clk_disable_unprepare to (void (*)(void *)) cause a fatal
Control-Flow Integrity (kCFI) violation on execution?

When the kernel is compiled with Clang's kCFI (CONFIG_CFI_CLANG), calling a
function through a pointer with a mismatched signature (from
void (*)(struct clk *) to void (*)(void *)) results in a type hash mismatch.

This triggers an immediate kernel panic when the devres API executes this
callback during driver unbind, remove, or on probe failure after the clock
is enabled.

> +	if (ret)
> +		return ret;
> +
>  	priv->regmap =3D devm_regmap_init_i2c(client, &pcm1681_regmap);
>  	if (IS_ERR(priv->regmap)) {
>  		ret =3D PTR_ERR(priv->regmap);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-nord-asoc-=
driver-support-v1-0-997d3b20cf43@oss.qualcomm.com?part=3D3
