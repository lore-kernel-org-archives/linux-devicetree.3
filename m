Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE123B95F8
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591442; cv=none; b=OusCS3g8QqJqZPAg6cZEXu03c/0pJ8oCBBHn8CrA2AWJ4DHb9DXFlPrUcreDvOSMBe3XAG57cyR7QKN2Zvy0GgHJ/JtEIZAM+ORhH8haNKv4UMux6MGYib/BoAMGT9R94GAYcFZKyVH7jHdnsrPZ3tcWxo3ZmbdZhpHRoU8A7Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591442; c=relaxed/simple;
	bh=un8Kxi+33XkckldocBTb2XKQweQo4BXJdzHopHXMtVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jz8uo1ve1n3AJZw5GyE8XRliiTkCXBNxwsTL8kYTQtJYmdeVX/L1XW8c5FnAVDb/9kFZhS6Ra8/9Ludb6BuWqytCRQZIbyF4fpzkVjvIQ/2qkcTuOAyvS/KE2cz2R/bIYIjSEb6fAel1Ofg9OJAv2O14wVolOgmk7t0UnDBakgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/iNoBgo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/iNoBgo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEA61F00893;
	Thu,  4 Jun 2026 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591441;
	bh=un8Kxi+33XkckldocBTb2XKQweQo4BXJdzHopHXMtVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n/iNoBgo2Depx7nYsTc3KwTLA3DbIPmutalaVXGMGZ4rDCckApIPN3gYhko9t9sPq
	 duiDD3isSepnxpjFjCo0MWzyupWioN04URUH7qE4iYh/DjyycAkdEOUcRtOPODXPaJ
	 XjMuWE2Wpc9DfsNL/83AEpBSu8JcBYAHUleXiZN2GMj++OVLEUehqxDKg/gKWAvTnm
	 6HH71A+5EiZrmMXJ6eNGWIe+F79AqZlbqavdGUaOVB1rFPA9rKFGf+J1gXjKBTXt0A
	 /RV0hvSEMFJiLP3Cn52clxfbkmQlzHs6ZJtnFPATUfXilrynOPezbMpLY0i4jlNTdf
	 dUDSRTSUEMXWg==
Date: Thu, 4 Jun 2026 17:43:56 +0100
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
Subject: Re: [PATCH v2 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis
 platform
Message-ID: <20260604-vengeful-revert-f3a6bf41c2f4@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-7-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yC3GRaW3SPm4usBz"
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-7-joel@jms.id.au>


--yC3GRaW3SPm4usBz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yC3GRaW3SPm4usBz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGrTAAKCRB4tDGHoIJi
0ggpAQDztB2cm5I3v277eJRxjrQzPIXG04r3fYSDoFINzFoSbAD/c7XKcUnaPg2G
RcKzNnlPHuJLxIvbQnEfyxQlY5JOrg4=
=t4RF
-----END PGP SIGNATURE-----

--yC3GRaW3SPm4usBz--
