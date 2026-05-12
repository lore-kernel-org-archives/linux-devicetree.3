Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183452E413;
	Tue, 12 May 2026 01:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549959; cv=none; b=Fr3o+RJjsqiDShtUiJtt1adUCc4nHJW3W22Kmy4CaKbr0HRyWR8Mx/FHsFK8m5qTiYE0nui+SD6mqJMdnEn6ceQTWjI9LtBEWhFh36aHS+GcM8D1MaFMsEOh6hi/DuQQoOGh9vMnklqp/GYV2QSXxk/hxVWZlrLivgRvFDRD444=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549959; c=relaxed/simple;
	bh=rop7wg0WUO7fllJzwFIlyP/VpMvCl1KehABXYLnbIE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI5QelUNTXNRrbmbuf2su5OKxY44d8f2Fdc4PjkWMGJTAR6dMBMd65kVhvSqIMdYx03c4TPleKHxih5va/gzzLukJFqSsz9xGarZJZjPu8Py7ImsyZ/OUW6RU2SF/UOnO8GnZZ+WbX5/QbJzft58LJ+AZfbNXO5SwH+8dcBtDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrSXPphY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrSXPphY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887C8C2BCB0;
	Tue, 12 May 2026 01:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549958;
	bh=rop7wg0WUO7fllJzwFIlyP/VpMvCl1KehABXYLnbIE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrSXPphYYl/S6Laq9pMm43YpmnpmtFNawF427KQ/jseGo8NyU6vzFb/KY3t2kL+ht
	 Nt7JBXMZV0fNQhVcOe+5o8HhiwUN4SP6HObnJeTz0TniAR3VBZTru6yTNdo+R2QSTK
	 SiKjJ06nlvHJ3YX8N0SDj4F4VWVt7FnuRmtm5mLQA2CYeobAOlQrjqgdvTPQOtAtAD
	 xS086KjhSL8UUuxFdLWTZ/kZOwucUdcp21MES++AtvjYk2O4cRN/lzUmWvNnoKBO5M
	 gJEoMfpSAgRPNGkW/BjaAB/F3znbI2gntce2lHUbTbxJxrIY0zvwRsCD/iQRPDC6aA
	 Myx7ub+Vkiu2w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2A88E1AC5843; Tue, 12 May 2026 02:39:16 +0100 (BST)
Date: Tue, 12 May 2026 10:39:16 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH v12 1/5] dt-bindings: regulator: Document MediaTek MT6373
 PMIC Regulators
Message-ID: <agKExG7C9TXUQJuP@sirena.co.uk>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <20260511101355.122478-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i54nV9tYspIyFftK"
Content-Disposition: inline
In-Reply-To: <20260511101355.122478-2-angelogioacchino.delregno@collabora.com>
X-Cookie: Truckers welcome.


--i54nV9tYspIyFftK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 12:13:51PM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6363 PMICs.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--i54nV9tYspIyFftK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoChMMACgkQJNaLcl1U
h9Avpwf+JI9TioLyaNkiPZlz7DgXDocJ2eHlPUKlrSTNkqM+zJE6QBbzhvOljtej
tiC1ACgMMVFBaM2hBDjN2HJnyhRulHcYanlgGN0sxe++7cdZgkohG0Q5IC8FQbEX
XZLDDhAGHVM2inoGfjgck/yTF11wdEUH8VWjxR3T5eRA/C5rWpkBgnCAEafjEpkO
SnnUhCHSC0P4/8loNAA7MzYbwVGagSW277aTgorcWHnP5W1N9FIkS+jYpS0e7XIB
da+RzvSh9Tvi2CZ8ZmtLD6AgOSpsK70Tc9Gt142lMY6vE8Qh92J9beaRGE/i40+u
FiHT2h/DpcrvgDlk6NusB3TVdDN+Tw==
=nzPt
-----END PGP SIGNATURE-----

--i54nV9tYspIyFftK--
