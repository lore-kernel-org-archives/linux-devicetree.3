Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A49397935
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669753; cv=none; b=rzovzQ0oGpm8LxODdnzdip9GBEWBrA0oVxyfBPXFgqV48vWeXbi/lG8JOBCMBfpfk7XEh73ZgrF2SW0Q3xvTkbHzKANyfl6i3wDHqQ5ZiO7pOh6GSp9trZQbubh4GigWAt3zTQhSHem2Gv/s1DhdcM3544+Na0FjDvVVwJ0oEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669753; c=relaxed/simple;
	bh=kCp2thK8aoRpVFY4C3IIxK4sEBC/FAyWNqKgydFwcwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aM7rtWYPq8/bT/VBO+yFo7UbqPT4t0JFeTleq5oMFQX7yL/dbs3HpiGCJ2gihhvC5mX5JCTWPPc5FdyXUDRPjB3eO964zeuPjuibzYbex2m5URLScv9TXuhltjPbgCs5QcutklZ76hzKywCNJ2QQcmCIBMlXxI4qJA1W/9oAIDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqazGmCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqazGmCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C67F1F000E9;
	Sun,  2 Aug 2026 11:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669751;
	bh=JkClEvPYAJ669pS/EWYLzZ5pqfGuhvYwwvua0cfuoJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqazGmCXDSe990x87davEJhZs3JrWjYGvjYaMOtiDpFIo7LYeMHP1MA27yW646/hy
	 iIPrUPzIVFvmIJpxGMw+Nzxt1ZALmPI2tGB/weAiHJDpYzH8g4DTeoolMYAOD7y7tm
	 Z6fb6BERH2jFCk+kK1f807VueXx1nZw0PkUv0dtcanG15aAYZnaJ9cQv+vDlw/EOTP
	 Vqj3/TQ0hRIqDhBuvg5jrRvZ8pxkmuWl+BxaPGuDfbVqLxPMOrnV0lgIoZcTuaV/9V
	 TcO1CqogHAM2s+K/IWwhBKMdd7/cGgm41VX7ZUO2vT9j/dhC4O/QWGklr9sloIkxnf
	 ioIb7trdJeNkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/25] clk: mediatek: pll: Add BAR reset register
 offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:30 +0000
Message-Id: <20260802112231.5C67F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly introduced `rst_bar_set_addr` and `rst_bar_clr_addr` are=
 completely unused in the `mtk_pll_prepare` and `mtk_pll_unprepare` callbac=
ks, causing read-modify-writes to be performed on the status register inste=
ad of writing to the dedicated set/clear registers.
--

--- Patch [10]: [PATCH v5 10/25] clk: mediatek: pll: Add BAR reset register=
 offsets ---
commit 9a53464d4cd99a5e5248c794e08d787f148b4b00
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: pll: Add BAR reset register offsets

This commit introduces new fields to the MTK PLL data structure to support
separate reset BAR status, set, and clear registers on the MT8189 SoC. It
also updates the prepare and unprepare callbacks to use the newly computed
reset BAR address instead of hardcoding the CON0 register offset.

> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> index ee478bc640851..4b0f7e2bfc5a5 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
[ ... ]
> @@ -249,9 +249,9 @@ int mtk_pll_prepare(struct clk_hw *hw)
>  	udelay(20);
> =20
>  	if (pll->data->flags & HAVE_RST_BAR) {
> -		r =3D readl(pll->base_addr + REG_CON0);
> +		r =3D readl(pll->rst_bar_addr);
>  		r |=3D pll->data->rst_bar_mask;
> -		writel(r, pll->base_addr + REG_CON0);
> +		writel(r, pll->rst_bar_addr);
>  	}

[Severity: High]
Does this logic correctly handle the new set and clear registers for MT8189?

The commit message mentions that MT8189 has separate set and clr registers=
=20
to handle the reset BAR. However, this code continues to perform a=20
read-modify-write on the status register (rst_bar_addr) instead of writing
to the newly added rst_bar_set_addr.=20

Will this fail to assert the reset BAR on MT8189 hardware that requires
the dedicated set register?

> =20
>  	return 0;
> @@ -263,9 +263,9 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>  	u32 r;
> =20
>  	if (pll->data->flags & HAVE_RST_BAR) {
> -		r =3D readl(pll->base_addr + REG_CON0);
> +		r =3D readl(pll->rst_bar_addr);
>  		r &=3D ~pll->data->rst_bar_mask;
> -		writel(r, pll->base_addr + REG_CON0);
> +		writel(r, pll->rst_bar_addr);
>  	}

[Severity: High]
Similarly, shouldn't this unprepare path write to rst_bar_clr_addr if it is=
=20
available, rather than doing a read-modify-write on the status register?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D10
