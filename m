Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676397;
	b=3UCCze2VKuliCviUggexqpEDO6OfSCqrILF3JZm5BCCL7lvrp1Tu8c52V3Suj6GzpULS
	 cSxYidSvWZkWQWbAUt9QDz9SSHPkoWi3r1UCLtbzlMK7xpmbdLydSz5S2ScOv8y5eqp49
	 vitiSFQnYMsJ26zwNWh3892x3tzSyxg3gCdSANysEohuxfdYxrmsZLD8ozfVfNXFM1mwa
	 5Fg7Iiw1k8VfN8J91d/sBtSxmy5hc6Jf8KBkHrklpbXhCg+0Kw5fq47MIwgrE+JmC0Y1U
	 E5CdiZI8ye1jWLaKh1PWGslvtTo8fMLmrR3nLfCAGxCLL9RnZrg8/W7njZlc55r6FUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676397;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ckfGmlxk/j360Pa+hHTBheMqJ6vtsGxDjfVuFGw7y1Q=;
	b=dC83UzGbWD3oCbqnHEeJNX+3BlGdJZ6gAMFH2Y4OzvUESiYzkaq4jlIrZHFlHT0g+GAx
	 xlwCmdrMwdPgrHY12IGJH4TQ0ugCc18bn0nse2ba4BCfL9adQwCxgoFGkaND9X8JwQU0B
	 KUyW2o9S/Bst21BWB49uXsX56+6XxXA3xC2IrkMy/Uq+AWILMwpyG0USTDs2wwaYk44Dc
	 qMJsf2XlVy8v6SVxyjSJ6ivBHquM+0KG0aTXdzsVtuekjzU4OakSW698G9gmVWKq2cZoK
	 9G/nli4wfacnj1DOB+ig7kd1+nzq8IayLyMLLOeZ4nsZsgLzXn3qbXvQ0pblUayqiTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ycr5FYO2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AF606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ycr5FYO2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1EF1F000C3;
	Thu, 22 Oct 2026 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676396;
	bh=ckfGmlxk/j360Pa+hHTBheMqJ6vtsGxDjfVuFGw7y1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ycr5FYO2RNEts4SPKekdNpG08NA82ErdDNVdmjHhyhCrMaT9CmcanEnEnAjfugFtv
	 6+bWux3VUkAioWt6zowgykntxWAu9sJ10+oEgIPQsZdP2UAerd9KH+8N89ohT4q45c
	 XIK8Yd6fNsau+ANIAWFM0R/dLRiZopy7yo26BYImLaFHOAOPI7t75J7WJIkLXnwKtF
	 lfR62qY0XKumQ4tQGxJWd48zX8OuRwx1iQgrpklZYrPpJTfDZ59uYsbVRsTyZmlKiV
	 d8QgNPvQHiIJnpEZbwrO0yaZl0ZqHbsAuPX0TN2jkR00k1fRgcZCNlp0HXFFE1v/Mw
	 4BPQBp91wpI7g==
Message-ID: <sashiko-outbox-181558@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI
 Type B panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022132259.240717-3-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
 <20261022132259.240717-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:39:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/panel: hitachi-tx10d07vm0baa: NULL deref of priv->dbi in enabl=
e/disable
--

commit 918fbda401f49537dce4afff189990897a904ac4
Author: Svyatoslav Ryhel <clamor95@gmail.com>

drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver

This commit adds a DRM panel driver for the Hitachi TX10D07VM0BAA 4" WVGA
MIPI DBI Type B panel used in the LG Optimus 2X P990 smartphone.

> diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driver=
s/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> new file mode 100644
> index 0000000000000..83c2af1be9755
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> @@ -0,0 +1,297 @@

[ ... ]

> +#define panel_dbi_command(priv, cmd, seq...) \
> +({ \
> +	const u8 d[] =3D { seq }; \
> +	struct drm_panel *panel =3D &(priv)->panel; \
> +	struct device *dev =3D panel->dev; \
> +	int ret; \
> +	ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
> +	if (ret) \
> +		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret,=
 cmd); \
> +	ret; \
> +})
> +
> +static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
> +{
> +	struct hitachi_tx10d07vm0baa *priv =3D to_hitachi_tx10d07vm0baa(panel);
> +	struct device *dev =3D panel->dev;
> +	int ret;
> +
> +	priv->dbi =3D dev_get_drvdata(dev->parent);
> +	if (!priv->dbi)
> +		return -ENODEV;
> +
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies=
), priv->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable power supplies: %d\n", ret);
> +		return ret;
> +	}
> +
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +
> +	usleep_range(10000, 11000);
> +
> +	return 0;
> +};
> +
> +static int hitachi_tx10d07vm0baa_enable(struct drm_panel *panel)
> +{
> +	struct hitachi_tx10d07vm0baa *priv =3D to_hitachi_tx10d07vm0baa(panel);
> +
> +	panel_dbi_command(priv, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x=
1f);

[Severity: High]
Can this dereference a NULL priv->dbi pointer in
hitachi_tx10d07vm0baa_enable() and hitachi_tx10d07vm0baa_disable() if
hitachi_tx10d07vm0baa_prepare() fails to obtain priv->dbi?

In hitachi_tx10d07vm0baa_probe(), priv->dbi is left NULL and only looked up
in hitachi_tx10d07vm0baa_prepare() via dev_get_drvdata(dev->parent). If
dev_get_drvdata(dev->parent) returns NULL (for example, when the panel node
is instantiated outside a bound tegra-dbi parent, as in the standalone
OF-graph panel node shown in hit,tx10d07vm0baa.yaml, or after parent unbind=
),
hitachi_tx10d07vm0baa_prepare() returns -ENODEV with priv->dbi still NULL a=
nd
panel->prepared remaining false.

During an atomic modeset commit in drm_atomic_helper_commit_modeset_enables=
(),
panel_bridge_atomic_pre_enable() calls drm_panel_prepare(), which cannot
abort the commit on error. Next,
drm_atomic_helper_commit_encoder_bridge_enable() invokes
panel_bridge_atomic_enable() (and tegra_dbi_atomic_enable() in commit
"drm/tegra: Add support for 8-bit CPU interface"), which calls
drm_panel_enable(panel).

Because drm_panel_enable() checks panel->enabled but does not check
panel->prepared:

drivers/gpu/drm/drm_panel.c:drm_panel_enable() {
	...
	if (panel->funcs && panel->funcs->enable) {
		ret =3D panel->funcs->enable(panel);
		if (ret < 0)
			goto exit;
	}
	...
}

it proceeds to call hitachi_tx10d07vm0baa_enable() (and later
hitachi_tx10d07vm0baa_disable()), passing priv->dbi =3D=3D NULL through
panel_dbi_command() -> mipi_dbi_command_stackbuf() -> mipi_dbi_command_buf(=
):

drivers/gpu/drm/drm_mipi_dbi.c:mipi_dbi_command_buf() {
	...
	mutex_lock(&dbi->cmdlock);
	ret =3D dbi->command(dbi, cmdbuf, data, len);
	mutex_unlock(&dbi->cmdlock);
	...
}

Would it make sense to look up priv->dbi in hitachi_tx10d07vm0baa_probe()
(or guard against a NULL priv->dbi before issuing DBI commands)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022132259.2407=
17-1-clamor95@gmail.com?part=3D2
