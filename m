Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBEB13635E;
	Tue, 12 May 2026 02:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551482; cv=none; b=YBgSO/0/7RzM1J0nAaxOhFvOQeZWx2uGmnQ1jWiKI8jx6GjO3fjiZJd/74nX1QvmluyY/fkK6SkoaLxquPsSvNT3SlHGB4CuyaWDOaY/Ybme8W5ZEoeqkT03Cv6RCT4FK6WivsAyRlRrDRkYiAeXSSBi4OLYwlR7eyy8auz1KqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551482; c=relaxed/simple;
	bh=BFfAV597fx7JIQQh3ImNXDlSTe0sOcLlBpul6Khg9KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUs6TwxrlQq/ZGWGGTJ/Fax4lWNKlswGRmnKSW6ScMLoDLmkssOWVBlkIQ2krd5bFYQEKMHny7djidI75O+xyK63YWZe0nLlI/EycgUe6z5QhHEENU9Bft6jJ0Im3anceGoWIH2D1nARtA9Wf31LAmKo8gb82okXRyMNvzd1xSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hv/ai9CA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hv/ai9CA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C2EC2BCB0;
	Tue, 12 May 2026 02:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778551482;
	bh=BFfAV597fx7JIQQh3ImNXDlSTe0sOcLlBpul6Khg9KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv/ai9CAsNvqsXG1g6XrXNf5yiW1t5DA3ifU9yT3VR4+Yk3NSryMG4QxNk7jlx6Yc
	 LRJm4+ds7I7zlbs5PENgwACO6mWNjtTeiO8l9nXVtMqrfWtAMpldCXdd/AlEsJ4op7
	 sgmMvYAIu2dr9GsrDSwZ6oDuDFjvAE00WXn4WQ48EPpSe00kWuESXtz8h5TpRvgZpn
	 CX/5TIESQ1y2GIfMkGW5uSkXHc2NiUnYIgSXbffV1Sy+T6rjaWFbyXAdgdKHegn2kT
	 aJwm9fyZJLJfS+ghH8S4FokHG6KYu4XmG045e6E4vGffO/KCr+5kZPbv5qhGdYwvdy
	 xizVbHKB1RDaw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 222661AC5843; Tue, 12 May 2026 03:04:40 +0100 (BST)
Date: Tue, 12 May 2026 11:04:40 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH v12 2/5] regulator: Add support for MediaTek MT6373 SPMI
 PMIC Regulators
Message-ID: <agKKuH0fP3lBMuFd@sirena.co.uk>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <20260511101355.122478-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fg+KBHu9WioghG3Z"
Content-Disposition: inline
In-Reply-To: <20260511101355.122478-3-angelogioacchino.delregno@collabora.com>
X-Cookie: Truckers welcome.


--Fg+KBHu9WioghG3Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 12:13:52PM +0200, AngeloGioacchino Del Regno wrote:

> +static int mt6373_buck_unlock(struct regmap *map, bool unlock)
> +{
> +	u16 buf = unlock ? MT6373_BUCK_TOP_UNLOCK_VALUE : 0;
> +
> +	return regmap_bulk_write(map, MT6373_BUCK_TOP_KEY_PROT_LO, &buf, sizeof(buf));

regmap_bulk_write() takes a number of registers.

> +static irqreturn_t mt6373_oc_isr(int irq, void *data)
> +{
> +	struct regulator_dev *rdev = (struct regulator_dev *)data;
> +	struct mt6373_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	disable_irq_nosync(info->virq);
> +
> +	if (regulator_is_enabled_regmap(rdev))
> +		regulator_notifier_call_chain(rdev, REGULATOR_EVENT_OVER_CURRENT, NULL);

If the hardware is reporting an error we should report an error.

> +		INIT_DELAYED_WORK(&info->oc_work, mt6373_oc_irq_enable_work);

What stops this work on driver removal/unbind?

--Fg+KBHu9WioghG3Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoCircACgkQJNaLcl1U
h9D8+gf+Ji7rvtqYNutZdS+zKCDlfbTtrpScLfa0ZPS5xWFDLYt4/Rvhset5eAIe
1bFjLbmykpiTwp2CrA50AuULlWeXRZIcHtU4w3TLbC0y9Jy56QbARjhVXgbLj0c3
ZR7fHlhMf0JoS9TqSHqRU5mtBnMWS1z9sr4QBbfgmV+uVE4oOtREif7MIOpYMikV
tEPHX9j+ljPXMb6i81E61VoQVI/xoIkmTdWtYgYSKizXzqt7VsWs3XhfDD+JKNLD
2ZIHapsz+1VJ/9SVOjlaO2ujquKLdfjQFMJ8+nHyMGWRpsmUiYu9e/kyKsORpEuP
swSqNRY9anDWWAFIr6ncfUTosit7CA==
=f+lH
-----END PGP SIGNATURE-----

--Fg+KBHu9WioghG3Z--
