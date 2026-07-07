Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEBB2F8EAA;
	Tue,  7 Jul 2026 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441211; cv=none; b=DadcVSFoBf3g818z0P57i6xb3r3EfuLwYmXnS6PWMTw/ZYPj/JypGGE3zoB7IIwxt4MUbw+XjbNzxS/kENnbmAhQLjxTLQgjqLO3GVFbIrl8nUeFjg2R1iG4wWzfOBQH0KzzNGFnBwAktVINzADk2Zo1Ldw2h1HoCFtRQNpdWUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441211; c=relaxed/simple;
	bh=voMpL70AuboIi4CDiB3QSpXFK/WpnZyUWS7zISJ+zLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HasMUjBdLrMuDMUNusW4BpCHw8EBTLau0EPbJcCQHSQrpF+6Ff0c+VC38OfwMEcqWEbmrTHl9bvDbuk3ih0iI/SdNOPVxU3qMZC5DIkE07tKI3eysXOonbD+3f66F8u9HAscYu12biHorR4KHd9KRMflwUmZVTuIkT3M1BEvUkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqDc6/VO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqDc6/VO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18F61F000E9;
	Tue,  7 Jul 2026 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441209;
	bh=voMpL70AuboIi4CDiB3QSpXFK/WpnZyUWS7zISJ+zLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AqDc6/VOt/2ze79Qs7Acc0lDf9Txhy7EyKA6PtI6u6+VTnL+5fKkYaxt9bjdgpazb
	 SjDl5WH3rD6LhPNJSIwVFi5j4KmPlRsfacEBHUBISTSS8SW3IxJD0eomqxWiO5uVsc
	 Qxx+YIz19N3LzdQ7ewz/X3j0BCtHlZmupAqrNc6h0Unc/WkZTSfxTVK3rI54/6g21E
	 O6IXMR8eefujIayMlR3k5U2BRdOYQgx3rqoWrwR17syGAa7b6qv1x16Ce7b0Q5i79S
	 3FQZ53fMMXuZGeeLyDVVRBHtu6fFiE0NP2DsERPvsLHd8M5284IhXXFQn7bEJda+ud
	 busQRtlXGsWGQ==
Date: Tue, 7 Jul 2026 17:20:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: xilinx: Remove EDK/Ethernet references
Message-ID: <20260707-gigahertz-vibes-548284d27e01@spud>
References: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5+ShyIjTjEUl7tU"
Content-Disposition: inline
In-Reply-To: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>

--w5+ShyIjTjEUl7tU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--w5+ShyIjTjEUl7tU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0nNQAKCRB4tDGHoIJi
0qlIAP0WR5H9xqegLtBx4iXO81pPXIa+01xUhkE/b4wUXwW7jwEAph2IdwZzID7W
c8FPL+6bXOjtPZMIa1ZXcVonNy8wuQE=
=s0DY
-----END PGP SIGNATURE-----

--w5+ShyIjTjEUl7tU--
