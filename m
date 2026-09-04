Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFA444238D
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514382; cv=none; b=GhM3I5uUfqq2LLdZZx9gJWJUZUwFA8rAyOlUglyghl2UwFJYTPGJ5Iw+rOna15oVj1FOPTkmWCqB4RsrUn3sTJSkeqHWic7bwJgvHDM3fdDC3WXmVzgv/rFA3awEk16phGjgg7EN7gFB4aIaUweFBglavG5S5N2ZBFgC+SE4pCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514382; c=relaxed/simple;
	bh=smLc0c7JoHwKagYClk6DhZOTGhdDi72AUU2vPkowo1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EHbWyDFPYGjO9ow04vz3SLYp5xinaFBowEV9Zzhquh+a4W0LvNEmdXvYov0K+DyRqNX2MLaewSEKnUtkN5JrdudVaUfZCctYjZTc433NSzNdU6AzScNIm7WO+iteB3ZhYt95wKL4mNtfLk2yk6tdot/gqwcH7WMD/sLsJgEi62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsdQt5Ci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsdQt5Ci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19D31F00A3D;
	Fri,  4 Sep 2026 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514380;
	bh=YvGDN8DCm5biJgqkhr7ngpZ5VI3zUjcwwY7cJeWLBGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EsdQt5CiK9Gd6lCLRklXfPob5A8J8Cg1vxSgqeIafXrEjMDx1hh8ei/kWXp/XlngY
	 6QPzqV2H33gHwLiLf+UQpLqOdOxGGoJMW98tIcGf1pxfkzd1QA+cE+nnwMzskkcHOI
	 VyCzPQ5X+Xr1lOYSt3AQapVW3g3c1mANYfNjHVtJtAw5RXWFuvj7SpLJmU4GHbM1b8
	 tYk7f4NN488uwL7++/hxgIcy/1u5K8N34uhHfHA5JKJTXByDnsgYOY9rI/tB6hzl8L
	 ySxYkYRtoi8s/KU3H8M2nO46O47fifKdyYXa4AmsBVij5nI/xfEl3K2AvxH01MZqdx
	 HBfETll+AhsKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 09:32:59 +0000
Message-Id: <20260904093259.D19D31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree compilation fails due to an undefined phandle reference=
 to `rp1_spi0`.
--

commit 330478d6863965c56268ce6533d5e3b957169da2
Author: Gregor Herburger <gregor.herburger@linutronix.de>

arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0 interface

This commit adds the rp1_spi0 node and its pinctrl node to the bcm2712-rpi-=
5-b
devicetree to route spi0 to the pin header.

Link to v1: https://patch.msgid.link/20260811-bcm2712-spi-v1-0-4c1708d354bb=
@linutronix.de

> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm6=
4/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 0fc57e72632ed..0de3d78100a5d 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts

[ ... ]

> @@ -94,6 +108,14 @@ &rp1_i2c6 {
>  	pinctrl-names =3D "default";
>  };
> =20
> +&rp1_spi0 {

[Severity: Low]
Will this cause the device tree compiler (dtc) to fail with a "Reference to
non-existent node or label" error?

It looks like the rp1_spi0 label is undefined in this revision. The patch
notes mention dropping the first patch because it was already applied, but =
it
seems the prerequisite patch providing the rp1_spi0 base node is missing fr=
om
the tree at this revision.

> +	pinctrl-0 =3D <&rp1_spi0_default_state &rp1_spi0_cs_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	num-cs =3D <2>;
> +	cs-gpios =3D <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-bcm2712-sp=
i-v2-1-6f8fdfb030bc@linutronix.de?part=3D1
