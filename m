Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C6311583
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782677781; cv=none; b=DwClvycz9EOG0OdqfONho2Arkcsn0QdjO3NL5Gk55X/BgzqfTTnLt9LNOdowGHPWi4kek6KBL7hxTJ0aDNbIHpolnP+eoJZMOciW2NbVl1Ci4r4p7fFt8cM6TqMd4SnpDJHrRus4sZrRn8m/cDJr6O56c48zfA6IpwOZI7KFqp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782677781; c=relaxed/simple;
	bh=eeE0kaD3w+1ZT9dd41SmV+VJP6oHcqtYSerdm0LbhFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eMph4h81SoI8d2+SM8tRFEh69I0l5Vf2VHh0wWw1yisgObeWKJhyv2ktjeiTw4eHcgY5MgiL+JMtCBSojlfoof9dCLiPPFRqONRJB2VSMQxnl4pwJE6yjVse10JKx2xJ72a7FsDBJ4xGTKQAP/FWHA47LG0WQ4cizo4EsoVgYxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SR1u8Onk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SR1u8Onk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBFF1F000E9;
	Sun, 28 Jun 2026 20:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782677779;
	bh=Zmy4A9bH7FGwROLRl9V1BPfe6PaH9OoUJOuMTqucJjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SR1u8Onk2g6CT6e0NIyyWJm98ayHndu8iyh6LGIPVknUVG6znuo1b6NLSqp3ck05x
	 EocWHmJQipu6hAG82s+YlwBRL+XNIbkRPYHYm+BZ7VP+ZbqWp+pIi11jVB9fRt7Ggl
	 00izQ91w4nasQ66moGimsfliCYzmTFllz4vkhksp9BEqx7ZIsbhAocRffb+HzJZqfS
	 9zM0ChtDv2HAe8g9HBzqgAI4GKdnd3nnFjGL7Zm9yCHMEpa6hBIAc2Y0q6Efvk0D6t
	 QtBGyGStZgMdLsIDYTTjPjGqDYcEwgiXodbNQTBTsnPdTzaaBkSP+dN0QdvOmbpTJ4
	 RENxtqm2fyYqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 08/12] clk: zte: Introduce a driver for
 zx297520v3 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628-zx29clk-v5-8-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-8-79ff044e4192@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 20:16:16 +0000
Message-Id: <20260628201619.7DBFF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double free of `adev` in the error path of `auxiliary_device_add()=
`.
--

commit 5d8045f8cc5525227ffeb82da9b3791181d56dbb
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 top clocks

This commit introduces a clock driver for the ZTE zx297520v3 basic top cloc=
ks.
It registers the PLLs, muxes, dividers, and gates for core devices such as
the AHB bus, timers, and the USB controller.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..bb3d64eff9096
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> +static int zx297520v3_topclk_probe(struct platform_device *pdev)
> +{
> +	return zx_clk_common_probe(&pdev->dev, pdev->dev.parent->of_node, &zx29=
7520v3_topclk_data);

[Severity: High]
This isn't a bug introduced by this patch, but calling zx_clk_common_probe()
can trigger a double free in its error handling path.

Looking at zx_clk_common_probe() in drivers/clk/zte/clk-zx.c, if
auxiliary_device_add() fails, it jumps to the following error path:

adev_uninit:
	auxiliary_device_uninit(adev);
adev_free:
	kfree(adev);
	return res;

Since auxiliary_device_uninit() drops the final reference and triggers the
zx_adev_release() callback which frees adev, doesn't the fall-through to
kfree(adev) result in a double free?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-zx29clk-v5=
-0-79ff044e4192@gmail.com?part=3D8
