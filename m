Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E17847DD56
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581068; cv=none; b=u70Am8TS+Ghxo5NMAt6oyJPzC54jZyhFo4isn+SRjkX/SSBnkKpYAmeInRc4CjyxCGAgp6zlM3/bo1cANHUfq6kqF4VlyCOBfYFg6+Q5oNs9DQxtfloRRQNr7ptu3ZPusxXjclALQPckDFcitjVSW1nPbC7sMqZkEg4ONJD+9Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581068; c=relaxed/simple;
	bh=ghFGYZT2h2sA5vI481N32DSvcC2/yU2rJB2xsuoK3Ok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dc8z8DJ9vK11Q+wjYelG4L6nfQyv1acFR8GvI8p2TVfEipZ5ve28o4KBNiqvXqq4feOXjdzoseUtYbkc+Xu/M+CL+G+j0XWLHsehtaGJJCYdMnymjx17n0HyL2G5PSDVStz8iLQoK5U/bXI9Srs+8rHYGJLbFu7feRzfyMQ0ERI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZQw/4eA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZQw/4eA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867711F00893;
	Thu,  4 Jun 2026 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780581067;
	bh=WrPrqkHnDQKrH5/Ts2L6tZs8U65wNNsOJJicOC1zknA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DZQw/4eAwf7y0sofJGGo50AMlC0zLhu6HfM5nMbxj/DQXLnJFA1pykiqREtIBOCr5
	 TqeMXD/S0FHnsG4aha0cazhvfRzxRNsQqPCK4Anqo6rf/PqaCSwXr7AU/dOjc2nwhn
	 bTFCqQO9ndvWQfRkivPrNCyNTswdsKSzHgYceIax46fKgQHD5ceZkSAkkPH0PRNX2S
	 f9OFqxKJWq48RIYz1aTNDgJ0JpXiHNnj41uvCQ9vkCFwzk1hCEzUmPDK8rYpoRdERZ
	 1XJON4PSVPP3FdFK3Gi3gI7v0CPcxjjKsBObYRi8IIwoTWVc8dH4LR8dtoBcWnYjP2
	 U34hcYytqM6bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/9] clk: eyeq: Introduce a generic clock type
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-clk-eyeq7-v8-6-53f618174cf6@bootlin.com>
References: <20260604-clk-eyeq7-v8-6-53f618174cf6@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 13:51:06 +0000
Message-Id: <20260604135106.867711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing spinlock in divider clock registration allows read-modify-=
write races on shared registers.
--

commit 64cecba2d1878b01e3dd2fecb67b0bb43fd51ec6
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

clk: eyeq: Introduce a generic clock type

This commit introduces a generic eqc_clock structure to represent PLLs,
dividers, and fixed factors for the Mobileye EyeQ OLB. It includes specific
probe and unregister functions for each clock type to support complex clock
interdependencies.

> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index e4e690a12a238..7b8de08388d3b 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c

[ ... ]

> @@ -336,6 +376,102 @@ static void eqc_auxdev_create_optional(struct devic=
e *dev, void __iomem *base,

[ ... ]

> +static int eqc_probe_divider(struct device *dev, struct device_node *np,
> +			     const struct eqc_clock *clk, void __iomem *base,
> +			     struct clk_hw_onecell_data *cells)
> +{
> +	struct clk_parent_data parent_data;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	ret =3D eqc_fill_parent_data(clk, cells, &parent_data);
> +	if (ret)
> +		return ret;
> +
> +	hw =3D clk_hw_register_divider_table_parent_data(dev, clk->name,
> +			&parent_data, 0, base + clk->div.reg, clk->div.shift,
> +			clk->div.width, clk->div.flags, clk->div.table, NULL);

[Severity: High]
This isn't a bug introduced by this patch, but since multiple writable
clock dividers share the same physical register (for example, div-ospi-ref
and div-ospi-sys share the register at 0x090), can concurrent clk_set_rate()
calls cause read-modify-write races here?

Because NULL is passed as the lock parameter, the clock divider core will
perform a lockless read-modify-write sequence. Would it be safer to provide
a shared spinlock to protect the register state?

> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	cells->hws[clk->index] =3D hw;
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-clk-eyeq7-=
v8-0-53f618174cf6@bootlin.com?part=3D6
