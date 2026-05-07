Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3944029827E;
	Thu,  7 May 2026 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173711; cv=none; b=HsnxB95+/GlNJAjKaZlH4KTTrxpu66FTCE3dm6xEPcfzFAgqtk1nnVljIPGqu462HPSA2ebI+KgIMnNfafAdHPZR6lqAj1vWrWtezvA9IRhU+ARmmn+f4O5/86z3QC/2tqAjRpr1gZb0c8VVTmclZXyMR/UprHBPJ3LIVrbFw7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173711; c=relaxed/simple;
	bh=suyPfzFWG3JWdV6ioIa954aqyOij9B/xQZK9I1fmViI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7dZsOhnk0oc0Sdq2OcMO9WqSfDFk8cfrFIgng/hHKrprGqEJj/eyZfHt57xfDIIOqlf7P19wpzh5KJpfUSD4cL7DJsBvaFFkf5rQxwZHAS1toSRE3ZSc1Nb92MJzSnWh7d9JrcOLprZc0ZinaSJTqxF1AJDkdZjo7LWWZWsAc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gF5k7064; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gF5k7064"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499A0C2BCB8;
	Thu,  7 May 2026 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778173710;
	bh=suyPfzFWG3JWdV6ioIa954aqyOij9B/xQZK9I1fmViI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gF5k7064XgRa3oooRTrG3aYRFbr/JA3bl7v0SSF6MvdfhO3WVX8PiEPs5+ychW6oy
	 iukQ/9HuRuL1v7wMEVrOTv6kAPGLLVB9uP4pP4RY6UNumahTLrqTeXaSNTqS3PO5c6
	 7/ZGStoPYABSzg9Btg5tGfjHFXtpY/AR2kHj8WUhvTvvSQRZPckvRy8vZ+BT4UIBkk
	 66CovsxT9dU6FTPo2zjNWM+5vl9N+qAxq+V1uYcWNIXIY0ZECsnQXlNWNs7o5uodHz
	 kws72mj6uJN5lmHUw/bjAHaGHL3DMjuSIYTVbgm1bw11S5vk1UaHTbnEkRCOJsf9cn
	 k9dbTwjU0+bOw==
Date: Thu, 7 May 2026 18:08:25 +0100
From: Conor Dooley <conor@kernel.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: airlied@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, onlywig@gmail.com, robh@kernel.org,
	simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 1/2] dt-bindings: display: mayqueen,pixpaper: add
 pixpaper-426m
Message-ID: <20260507-bannister-bobsled-741e2b1e8451@spud>
References: <20260506-clique-safely-6dd507d0593f@spud>
 <20260507023234.3655616-1-zaq14760@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a6wA4fy6ikIU0vAC"
Content-Disposition: inline
In-Reply-To: <20260507023234.3655616-1-zaq14760@gmail.com>


--a6wA4fy6ikIU0vAC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 10:32:34AM +0800, LiangCheng Wang wrote:
> Hi Conor,
>=20
> Thanks for the review.
>=20
> You're right on both points.
>=20
> The new panel uses the same DT properties as the existing Pixpaper
> panel, but it requires a distinct compatible because the driver
> selects a different panel-specific initialization and update sequence.

Can't see what you're replying to, but please note this in the commit
message on your v2.

>=20
> The second example is also redundant, so I'll drop it.
>=20
> I'll fold these fixes into the next revision and wait a bit longer
> for any driver-side feedback before sending v2.
>=20
> Thanks,
> LiangCheng

--a6wA4fy6ikIU0vAC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzHCQAKCRB4tDGHoIJi
0uwEAP9CjXoJzpH3TBT6wrxo6eZlAognceKFmQ0dDe+VPyzmIgEA3gC5m598PlVw
4L/C4evW/mJd0XIcpZ7cQiFnf0QdBQk=
=bGWX
-----END PGP SIGNATURE-----

--a6wA4fy6ikIU0vAC--
