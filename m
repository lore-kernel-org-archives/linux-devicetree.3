Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295A346FB3
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015568; cv=none; b=RGc8GsbXSNy/xB/ZAjBuuvlNFKwWniEO9EJwd9J4jZZRdKtu1OWS0bLUT4RkTgdj4gu5WvE2Cj8dBCQ5iUlofg+RCzweNy3m5Qy8f6QXP6OCiEL8g5mbz05OtGbivn60MnhTbM57AMu7byTfkCZe6DMnl3QL5uUxzzytq3DcOxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015568; c=relaxed/simple;
	bh=oekMe3e3l8/0fg+/VjMQfItEtMv4P6GowaDEZAl3Igs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZRmns2cR0wqt7O3/EZRZa9JNNJQlcOjhLHwgJIRUJ1c0hZC+HxHXGHf2URANqk/0TOKeunRapd9IO46Ae524/RSTc0uWaseteNfT2GXLJ4/hyOMruppGhGPCuWmQT3mBoOhqoQGnEiyjsK8lT/5puZFGaUtywh8q2+Nx7TaOvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcsMfFiz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcsMfFiz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C4D1F000E9;
	Thu,  2 Jul 2026 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015567;
	bh=7Qyjeyt+XJK4NGGc0IbilSXnwYe0SxoKEYSEYM71W9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RcsMfFizil0iaBeLXdLC3jjFcM8CFmh4ZeZQZVkL48i/iR3IXtDTzTrraZJJyYNYp
	 ZTd1T9MZtUfRdoTcmeyQiDAfzpzs46J0J6rKbYJKXQFoCrHs4LRLZb2dw5GDieICVz
	 BXjm/TuNcUTal5UaVuV7sj3ZCEssP/jknegHFyLuwgr8ny36Pv89oIo0jeGmyLNQ8b
	 +tD9rt2t1dgPHqKZ0vxKBVCtqQezvVK/AkIbExl2qWeYX8zc8wzildH3WJahmaqYxb
	 BsE2o/8oMZV3FgdQvu1Ah7A2qARP4amKsrG9GtTcxLoccww/ees0hOBhA4Dg9tCmgD
	 aOCp5gzvLCmTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/15] clk: mediatek: Add MT8189 vlpcfg clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-9-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-9-2b048feea50a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:06:06 +0000
Message-Id: <20260702180606.C2C4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing MODULE_DEVICE_TABLE for of_match_clk_mt8189_vlpcfg preve=
nts automatic module loading.
--

commit 4e00bfeb3666b50213ed9466f10f258b5c5893af
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 vlpcfg clock support

This commit introduces the MT8189 vlpcfg clock controller driver, which
manages clock gate control for the vlp domain IPs.

> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpcfg.c b/drivers/clk/media=
tek/clk-mt8189-vlpcfg.c
> new file mode 100644
> index 0000000000000..81e2d44bd320f
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c

[ ... ]

> +static const struct of_device_id of_match_clk_mt8189_vlpcfg[] =3D {
> +	{ .compatible =3D "mediatek,mt8189-vlpcfg", .data =3D &vlpcfg_reg_mcd },
> +	{ .compatible =3D "mediatek,mt8189-vlpcfg-ao", .data =3D &vlpcfg_ao_reg=
_mcd },
> +	{ /* sentinel */ }
> +};

[Severity: Medium]
Does this driver need a MODULE_DEVICE_TABLE declaration for
of_match_clk_mt8189_vlpcfg?

Since the driver can be built as a loadable module, omitting the device
table macro means the module build system will not extract the device tree
match aliases into the .modalias section.

Could this prevent udev from automatically loading the module when the
hardware is discovered during boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-mt8189-clo=
cks-system-base-v1-0-2b048feea50a@collabora.com?part=3D9
