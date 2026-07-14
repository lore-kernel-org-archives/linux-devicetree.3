Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E776136404B
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033584; cv=none; b=HIEL06iaKmE3SeH8uM95gKzBwOHkWpuOoupg4XigcXSM6TVJMc7AE7V0MgtKA0uKFPnli//EqmbswwuLmVOhLWWu9uLZcSsJxu2usNFZIudRDpJ5wJKzLGFJuJI1VuhZB9u8fkRf4ilkQ0Yf4vkpRytef8dhKRcgf/vbH+9VkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033584; c=relaxed/simple;
	bh=Kw881NAVagCAmPEOsnz3kfxN3FcMgmdiVroUnDn50dY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BO7e/+OYS6BedSu46VI/MokyENbmFWy4qTJSnSYEWv9CY9CeXeKg82uhLZtMzS5eFLiXZKH6ESQAYh6fCYrfritKEcpEMOkLSnTMnR1hgrjrnEdIPZVzhuDJS/L1v/w8uMru7HqNpUHXBFGQZnG+aG4mU7ySFoNizxiWHlskzW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8eYFVvf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8eYFVvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4776C1F00A3A;
	Tue, 14 Jul 2026 12:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033582;
	bh=JsukuSqV8zrXKTeMN1kasFqW4PwGn41cz1VnIVcTqBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j8eYFVvfr45AdATBIV3Vun7T663pqfD2BR6kXuvX/rfXJOMZlbgjvJdgPpxSTaxpT
	 G5LZFYGopUTOF5WO0WhHkV8p71pw1iDaat6cYOiqnwkOEUIKd1Q4DsnDyQoY/zI/Mu
	 3Zr7BeBeGNnPe6JK7sPAgTXyZ+VKPen8BdIolTimooD/WSQbiLDHM0EZC+BJr4PRKV
	 faUX8bwK+fzEivANm3Zgj931V56IreFsubutkaK+37cwxQ66mzGxrWDzexR1Xn5fRD
	 P7e1dhY44Y0y0lGidflB2W4Yl2lvzBQUBBBgn9fFYowJcL/0t0h+KTn3QRuYHmGaVD
	 /wh5ZVuRnBrTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] soc: mediatek: pwrap: use correct log level
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-6572-pwrap-v1-2-d8e5a39cf7ef@protonmail.com>
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-2-d8e5a39cf7ef@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 12:53:01 +0000
Message-Id: <20260714125302.4776C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Child devices created by `of_platform_populate()` are leaked upon =
probe failure or driver unbind, leading to a Use-After-Free.
--

--- Patch [2]: [PATCH 2/3] soc: mediatek: pwrap: use correct log level ---
commit 9e7d63641cf243186ed10eee942d5eeb9f4b6345
Author: Roman Vivchar <rva333@protonmail.com>

soc: mediatek: pwrap: use correct log level

This commit updates error handling in the mediatek pwrap driver to use
dev_err_probe instead of dev_dbg for error branches. It also simplifies
the returns by utilizing dev_err_probe.

> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index 0bcd858263755..a4b10b0a97cbb 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c

[ ... ]

> @@ -2593,11 +2584,9 @@ static int pwrap_probe(struct platform_device *pde=
v)
>  		return PTR_ERR(wrp->regmap);
> =20
>  	ret =3D of_platform_populate(np, NULL, NULL, wrp->dev);
> -	if (ret) {
> -		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
> -				np);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(wrp->dev, ret,
> +				     "failed to create child devices at %pOF\n", np);

[Severity: High]
This is a pre-existing issue, but does this missing cleanup for
of_platform_populate() leave child devices registered if this fails
halfway through, or during driver unbind?

If a user unbinds the driver via sysfs, devres will automatically free
the parent driver's resources, including wrp->regmap. Since there is no
remove callback to call of_platform_depopulate(), the child devices
remain active. When these active child drivers subsequently attempt to
use their parent's freed regmap, could this result in a use-after-free?

Would it be safer to use devm_of_platform_populate() here instead to
ensure proper cleanup?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-6572-pwrap=
-v1-0-d8e5a39cf7ef@protonmail.com?part=3D2
