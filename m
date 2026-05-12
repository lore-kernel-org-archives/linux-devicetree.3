Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB69841754;
	Tue, 12 May 2026 01:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549141; cv=none; b=R5sqZ2mNoEI9ESOg0e7cFUS6z8PBDbxKOUruBire5rBwhyni+mEY8jfhgzOjr/Z9yYoNihWpY8abjqRqwwEYYeCRBFzSvihWt0bIKaenvTxrmDK9LkYKkyM4K/TFllfXfP4Hj9j5TO3ch6KQtJpYLBfCvsQxVRHkj0K3KZf/bjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549141; c=relaxed/simple;
	bh=MDx6wyxJnrpM3xEGYmY3gDJSK85ARjHDfhMiTGvsheY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlxKdQ2cN6XHYFI/XpoyV7Lhwbg8jEMgix57Z//3goQPOHVRVveZXSqQoyR+iysKSnKuBk5IJ5qjmTx1BnIEtMmJk+3zZl+wrCUk15E7QppaXaToxqN2oINsNyiaZSUIf6BpC7fE4JbANKzZ/N/PXfnhjSDrtEOIOcI7CnDwkP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LacaZ//c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LacaZ//c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B90C2BCB0;
	Tue, 12 May 2026 01:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549140;
	bh=MDx6wyxJnrpM3xEGYmY3gDJSK85ARjHDfhMiTGvsheY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LacaZ//coubQsRNc1+AzKM4LLAQnjbZPI3UjHyCQ44EwYCejFMzDNMIyW0OhqNvuL
	 9y3ekVJ+rqxPYKmvBnxltPSQR36guKuhBxP5NnRcTxVBh6A23oIN55Qnbnhkm4uInv
	 1c2W3MKUPsu4NTEbWDyeIu7c+7qeDDSUTgc8la4pXrjyoOKNP5HcbFJCMrIABuCOoo
	 X0ZaPpQKe9KORWQjspPtC2QNrTlZnt2qN56NkqdiUyvNVlGgSpoqO03MEQwK5zBsmB
	 SSAjQwb3D/SNB/kPVhoE3cdYelYQR1ZzNp/SdgbYAdpaNS0WiThQczlbHiK2VYaboP
	 kkhDLQglFdJXA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F3EF01AC58C2; Tue, 12 May 2026 02:25:37 +0100 (BST)
Date: Tue, 12 May 2026 10:25:37 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
Message-ID: <agKBkUBVM81Y6MUk@sirena.co.uk>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZO04f3tElFI8BsTK"
Content-Disposition: inline
In-Reply-To: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
X-Cookie: Truckers welcome.


--ZO04f3tElFI8BsTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 12:13:50PM +0200, AngeloGioacchino Del Regno wrote:
> Changes in v12:
>  - This is a partial resend. MT6373 regulators and MFD patches were not picked.
>  - Rebased over next-20260508

Is there a reason why this is a single patch series, are there any
interdependencies here?

--ZO04f3tElFI8BsTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoCgZEACgkQJNaLcl1U
h9Cl7wf/eGQ+SEV4WqVTokc90PnMsjaK7jSAFGVrllzf7QEaXe5nO3B3fWEelwKE
8t91+XH2mSW/YD/rSts6vFNTKBFZSKjCQ8SP2km1j5SxAxjN/SCIyXloy4MyPf4f
SS0frCVFc9ZdmqYHVolKlRGvFObHCyZH8dXNmvs+WRgm4HlpJjWz2SycDxdZXtS9
E/WEycZxxWMbuIJxesMr5hunbjozk1zbOKXDafHzjqzqEFiYXcvhvmTQV10CnJ3y
iipRScZhn+35h1bkg/QTR/WE/Oui/uRumeFkKSMonav4lu1X2vac4CzTMhM6uchX
oWUtt17l1wGDsLnlCCGF2cI5VwUP3w==
=GoUg
-----END PGP SIGNATURE-----

--ZO04f3tElFI8BsTK--
