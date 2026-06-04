Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17612305E19
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591475; cv=none; b=jWSOcSAh7fwdT5dX5dbhkNAJxocGC4GrX6fFTjSfTVwfwf1U8dC3Tv2YyLFNsDXEmajDfs9stLKtIjVhnGG7JxckCBPCzqxuOsGAGGiZk3+by+5X7suOiwUTCYTKMecHGYRhpK4byXqTEkrglmTrjsEIQdKbKGbvEAHKX3fD9Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591475; c=relaxed/simple;
	bh=8a0IF6l905nH3u/zr72w5HQfVtZnwmPx1haQ1LiLIQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6x3aF6Y3pLvOfGBuLYzVUS1b5jHpEQVXEDcHm/GL2wBH9ytQzbcqYrZe8YZN66M6DB6lCRU8IgP0SR1HMAOWn5G6t/dEXPjcJcYGYPvlOcNAV7Hh/jHJJeqpJEF/OJwS80dO5DCNeCVrSxBwCCG08BHAn4Tuuu5fN0jizYy5w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs3SgD5Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs3SgD5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEC11F00893;
	Thu,  4 Jun 2026 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591474;
	bh=8a0IF6l905nH3u/zr72w5HQfVtZnwmPx1haQ1LiLIQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gs3SgD5ZrG6j5EMq7clPzS83LmH9wTNWWXuRuQOfVm7UnW5sLkFXiTE5HygEuC9sq
	 9GLkxvU/sJQ+NnNJbK1dFe2clcsRXES6cecbSA4G5Dp8XQSIFOaiMAubE4ofUqZ9fg
	 ECuyUtEM6RlxewWHxNvIkqD3UFGrewGGiWQ1Ec0Y+DDf9iHecs7H3Q5ZN3CGwej/nb
	 Mf96U3EvcyEVcb/BG7/qBDuYv7WK4JlX0flEVag/7qH03UmR48k3bfXXAJYgudlBmr
	 kmcivHjOkAamR42o/qDdLDaR2+VHQn14SToLtVCGEIt1hNaxRVuth0d3Y87TK1sdf+
	 elmvMSynYSB9w==
Date: Thu, 4 Jun 2026 17:44:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis
 compatible
Message-ID: <20260604-preview-cofounder-a9e6cd24a106@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-3-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vPzludfjj+bRdTk"
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-3-joel@jms.id.au>


--6vPzludfjj+bRdTk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6vPzludfjj+bRdTk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGrbQAKCRB4tDGHoIJi
0kwUAPYzMTFGrgNX7hjRyuMLJeqclo87j0Uq8SO+kJREBwEzAQC2L6zP7/wbgv9P
HhuIxoNs71kjt0+mbUJoS74vBhFBDA==
=f9/G
-----END PGP SIGNATURE-----

--6vPzludfjj+bRdTk--
