Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA2306B08;
	Mon, 24 Aug 2026 16:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589397; cv=none; b=LUd0AcsNB5iDo6YwIn02kn5ZDTbNwWuehfxATwjYIRdOWXC1Mv3fyE4A/UwkuvuOABhlfbZQ+KYcfwcHWrGhB/qRzCYELnInfO6BqWG4N1IK03DngtvqcbJO9wX2/H9dVbxaqFc8ilILuGqxW7JGEp3iPDgkwMyPgm1WfFZrSAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589397; c=relaxed/simple;
	bh=NcJfqU3hhh0N2f+LhLSYJrMHUg3fyi23x90RzpowY4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH9tXXYd7w8rEJ19cNHs5RhlaIkt0QUAf1LPUdL6FkvF03bK2WebBz1hDEuPDZrsDlds2Al83e5DB512CshZRz2KFAT+Od26zmcGL0w5M2fw1XToeN/hlWoedjLZSFlaO0e15zb1RvXD7yyX4ltaGsagr6m1BEE9Vf7aQT+uhzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCf5DGpw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCf5DGpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E441F000E9;
	Mon, 24 Aug 2026 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589396;
	bh=NcJfqU3hhh0N2f+LhLSYJrMHUg3fyi23x90RzpowY4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCf5DGpwzbVYfZorDLkqnCW8oCuUmQtxHBs5soJkocRBjtbm+Grqre8hQsg8/VvnH
	 rmwVPKbZ6J2IHzo9Z4ej97o4W+6sehZDH/1L9ttj9I9wbaLUJTcYysPI0KIXZEnc+3
	 RlesNsGqoo7EGq0QLVZV5HO1MW4boCsVZ6q2JLfnPW/drqRSjNv5MnBdaQMe020WTv
	 BsoI0QPp3pepTM8YPLGicI9JTvsJtO9UrMEM9FzLCUAvRTmBPZYBrhcPkv2WiPAYuM
	 O+I1f3hjvVKenQIlQbZ3NDhOQavop7i0mY9Ol8Hjg8zpo6k7UHn0QKHAiw7Anmu4bT
	 r23Utd62UJ7SQ==
Date: Mon, 24 Aug 2026 17:36:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260824-tightwad-impose-495476599087@spud>
References: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
 <20260824044835.2924141-2-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2nVUbACzI3Wa37D7"
Content-Disposition: inline
In-Reply-To: <20260824044835.2924141-2-shubhamsanjay.patil@amd.com>

--2nVUbACzI3Wa37D7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2nVUbACzI3Wa37D7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxzEAAKCRB4tDGHoIJi
0qWQAPwJicahO2YkHBPE6W+F9qcO4FfoJ8P4V4IZxQ6HCneSHAD/QFpZ39DWakpl
mRbMJ6lfYzDBao0LuXjKv9DH/W4xjAg=
=KJS0
-----END PGP SIGNATURE-----

--2nVUbACzI3Wa37D7--
