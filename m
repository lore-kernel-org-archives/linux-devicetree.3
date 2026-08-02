Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86973988F8
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669759; cv=none; b=jxqvcIPvnyUUNFqHmEx1mHpfryKo5JH01rFO3r0hIqcusWcmeXfKuczOus052RKrL8WuuNQcL+SQHBqWhw3mogXo/JXUNdOyKsCl37FnCTsd0THRmHtwR/GT9OxZfhm/+jgPdlxpkdGL5gMGg+5tjvahdO6I1FRgIQWQkPmJhzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669759; c=relaxed/simple;
	bh=WHuDjGRiI1+nmhiCfHjQ34EfMC3vItGcKt3Stb1aMXw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T2OG3zuCdRPYh5qIJ6rFiYPrYxwG4Ju1dvuafPew2PrSC7lhwkDIc0pO9UssGE0RepAv1AK40ZWqETOeIuhOL+fIEvkNmCuM14Su5RyojBYA1CeThZeyNO4LcrgA7USNTbFtRqFV00U3Jvy9thLf3UCGUICY5DNC30OI6efrJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvYApa92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvYApa92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387A01F000E9;
	Sun,  2 Aug 2026 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669757;
	bh=ZzMs/vvTg0TD6IZ8Cilsl74TOXd5excCRGUIJSo0lYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DvYApa92MIBVgZAi02k8vmvaG+qC6hLKsQ/GfME7O0Yvy9/ZKQ/ELn4r4QyXvv+5Q
	 WTcSV3RWGo+Y4UIgr+eg6UeiCM2CUdIqbAMqtQy9HHUf2ny/H8hsr3d8YYlTfNtB5J
	 YocjKrgrtXhcbTR9OCl8Vhbm0J7pldq87cwP5wmhb9HMxpX2pjT/mYOGkCogZyOA+M
	 cKM+5cVTipP/3Ps564hiK1WZFRMykRGNdNlOxvdmTBWPunO+U+ScgFaR0x58MXg1oO
	 bt21Qr2lWysCI+es1TE9Ga4Krf9rcJkNcMVGSzA/Gz80Qw6LoTmgi1BFM1n55EcONr
	 bJ2MkZrR+Bp+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 17/25] clk: mediatek: Add MT8189 topckgen clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:36 +0000
Message-Id: <20260802112237.387A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free occurs on the probe error path due to a lifecycle m=
ismatch between manually unregistered clocks and devres-managed clock notif=
iers.
--

--- Patch [17]: [PATCH v5 17/25] clk: mediatek: Add MT8189 topckgen clock s=
upport ---
commit 7ad0ff152f786ba34328391087a43e6c3c80dd0b
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 topckgen clock support
   =20
Add support for the MT8189 topckgen clock controller, which provides
muxes and dividers for clock selection in other IP blocks.

> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/med=
iatek/clk-mt8189-topckgen.c
> new file mode 100644
> index 0000000000000..f25c0711512c4
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c

[ ... ]

> +/* Register mux notifier for MFG mux */
> +static int clk_mt8189_reg_mfg_mux_notifier(struct device *dev,
> +					   struct clk *clk)
> +{
> +	struct mtk_mux_nb *mfg_mux_nb;
> +
> +	mfg_mux_nb =3D devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
> +	if (!mfg_mux_nb)
> +		return -ENOMEM;
> +
> +	mfg_mux_nb->ops =3D &mtk_mux_clr_set_upd_ops;
> +	mfg_mux_nb->bypass_index =3D 0; /* Bypass to CLK_TOP_MFG_REF_SEL */
> +
> +	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);

[Severity: High]
Can this devres-managed registration cause a use-after-free if probe fails?

During probe, if a later step (like of_clk_add_hw_provider) fails in
__mtk_clk_simple_probe(), the error path manually unregisters and frees all
clocks before returning:

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
    ...
unregister_muxes:
	if (mcd->mux_clks)
		mtk_clk_unregister_muxes(mcd->mux_clks,
					 mcd->num_mux_clks, clk_data);
    ...
}

After the error is returned, the driver core cleans up devres allocations,
which invokes clk_notifier_unregister() with the now-freed clk pointer. This
dereferences the freed pointer:

drivers/clk/clk.c:clk_notifier_unregister() {
    ...
	list_for_each_entry(cn, &clk_notifier_list, node) {
		if (cn->clk =3D=3D clk) {
			ret =3D srcu_notifier_chain_unregister(&cn->notifier_head, nb);

			clk->core->notifier_count--;
    ...
}

Should this notifier be manually unregistered on the error path before the
clocks are freed, instead of relying on devres?

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D17
