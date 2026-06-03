Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C21B3A873D;
	Wed,  3 Jun 2026 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500634; cv=none; b=n6TvVKCWSFVc9fwJdrtX/iKE2FJpEWA3Q2jBfXdZr47cDaJ/jUCoKPqfjRcx15Gbki33IEBMsJHF5zHHSd4VAsJm95HGD65SUVqfRunsLh89ggfBAuCL54XUL5BWSBS+gXBn9GtwiXpqG9QDz/o8D83VVK1iqS7rxMI0hdVMMkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500634; c=relaxed/simple;
	bh=Atnblw3u+0+59oYj3/6rPNoCR3XUYN0HZoGIki7156Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA6+aFAVxRs6mYkCrcibIYn9HiNl+5wbY5Z/0REQvmHwBzBWtaG4ZMyp0MQr1ZT7w88FrF02J7eP2ankfQfq2Bifw/5iasCLFFFjZ/fElu8DKTH3D6c4Ko/lWLyGd9kfD+EOTHTS5jWZNb7OaeXw5pdiHQoVV3dVxLPo2Ut5+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+4ezHQ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+4ezHQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0701F00898;
	Wed,  3 Jun 2026 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500631;
	bh=Atnblw3u+0+59oYj3/6rPNoCR3XUYN0HZoGIki7156Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c+4ezHQ/l8DE9qgvwLmzKdh+Q0oIJqz2dPlHaMlU2NhX94mv71O7XTWjtjWMtkXte
	 j5jolf1zF+yPVHV1CRxa5+OMxDHavx7RaYwBDO/W5YcFA6FZblcW5iogDOEGY/8LiF
	 vz24+rHjAXpzxivWn6EaHzIWwxgYeC6xoK4Ve3dc0cZg0rYBiwu/a3hFR/kFHzihFM
	 GBFvMAI9dSQsFcQiHwOiHrTjoMLwjF3bJfSjR4aWlX06FFfp2soHUtiVza2nZ50CqU
	 gIOdcCLsYWFA2nMvRolRAbm3yJ6S+EbSalSBIP0mZG4vKzePocwOhdNR+sL/ksMY1n
	 6VvusPV1tn0mQ==
Date: Wed, 3 Jun 2026 16:30:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	kishore Manne <nava.kishore.manne@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: firmware: xilinx: Add missing
 example for ZynqMP
Message-ID: <20260603-recycler-copied-b9387a9ab0c9@spud>
References: <cover.1780499520.git.michal.simek@amd.com>
 <da152696e367eee8717a644d9303d27df1a3107b.1780499520.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OEj4Bn3ueDRLlxNp"
Content-Disposition: inline
In-Reply-To: <da152696e367eee8717a644d9303d27df1a3107b.1780499520.git.michal.simek@amd.com>


--OEj4Bn3ueDRLlxNp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OEj4Bn3ueDRLlxNp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBIkwAKCRB4tDGHoIJi
0jiuAQC+o/oDdeA3mOii20jfihnzZcxChbwgO4sqzA0qk1FMegD/SBtPmGcjqHIm
x+QJ9PD4NMqs2PhnT21AfVROHTb5ugI=
=2Tsg
-----END PGP SIGNATURE-----

--OEj4Bn3ueDRLlxNp--
