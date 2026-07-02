Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDEB37A83C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015569; cv=none; b=Q3TUemUjuQblM7AV3vl5aRpYXYueJz6YZVhVz3SUYDg1lH1j6hZXczDe8IeCF/iaHZW040FXxgARLCk9XEjQc+6MA+QTZyZk1XJhZ1dbcbun4F9Y3tiFPvDV/wskzsmm1tLg0Glo6IUdUU9ldiuid7rIOGt0SYUfT3tDoXmccw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015569; c=relaxed/simple;
	bh=uAdBvMm2nmW4CQYMEN8NOpa5n4U950eaeUj4DzZG8V4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M9/6tOPTQGoFBteVjPK0DS4ULcidM3PY9FGPvlvjIo0paUPw5orNKSVJhZaXgTCKkQx5sMlA91WU+FNF1tSlzfa+H+he8OdfmwcbuLxDY+j5pNOA3FcXmPabUWZNMqOSg8QXjJ0Zy7wDWL/A9qPueCvVCiP1TPdMskMCaXnkVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxUPW5Mt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxUPW5Mt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FFE1F000E9;
	Thu,  2 Jul 2026 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015568;
	bh=tMeeb6R3P0ahGFz46OVDZiE6KuunCQ6MMA6CgAup8UI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OxUPW5MtfIEQuBMjU1KZg7GHKapDJa4ERR61WQg3nok+xfCi9/5kdS4BsMN3dRjK2
	 2kMSLKr7zjvYr0Ovz8zFSDbl0q4jP589xKV8cfkpjr0LFN7b7QUa6k2ZusGsncMxVY
	 Ck4TiDxnlJfHEL3EcP7UK9Y9ZfRxcPHul2Vml9t3NdkOmPI85Yq33AMAIyiMdQev34
	 slFef1iyvT7+ew9OtuZn4Wmqcd60yxQfJ441+S9fWDnBBOcPUeSlOlnPXw7fxzHFNI
	 LXDDZvlh7tBn0FmsoPHj9GDvdrZkLbdh0eP8ddtySoq+QjfL43DxrEPdficZ/ZfGVg
	 T+fkCQd6/G9kQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/15] clk: mediatek: Add MT8189 vlpckgen clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-8-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-8-2b048feea50a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:06:07 +0000
Message-Id: <20260702180608.58FFE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver is missing the MODULE_DEVICE_TABLE(of, ...) declarati=
on for the OF match table, preventing module autoloading.
--

commit ee1b10c9e19991da4719281ac8913fc069799dd3
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 vlpckgen clock support

This commit adds support for the MT8189 vlpckgen clock controller. It
provides the necessary muxes and dividers for clock selection in the
vlp domain for other IP blocks.

> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpckgen.c b/drivers/clk/med=
iatek/clk-mt8189-vlpckgen.c
> new file mode 100644
> index 0000000000000..39ca051b9ef81
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c

[ ... ]

> +static const struct of_device_id of_match_clk_mt8189_vlpck[] =3D {
> +	{ .compatible =3D "mediatek,mt8189-vlpckgen", .data =3D &vlpck_desc },
> +	{ /* sentinel */ }
> +};

[Severity: Medium]
Does this driver need a MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_vlpck)
declaration here?=20

Without it, udev might not automatically load the module during boot when
the device tree node is encountered, as the modalias information won't be
generated.

> +
> +static struct platform_driver clk_mt8189_vlpck_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,
> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-vlpck",
> +		.of_match_table =3D of_match_clk_mt8189_vlpck,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-mt8189-clo=
cks-system-base-v1-0-2b048feea50a@collabora.com?part=3D8
