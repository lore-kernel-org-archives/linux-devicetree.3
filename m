Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0C2459E5;
	Fri,  8 May 2026 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252474; cv=none; b=b9u9paXaOGaGmo6A1jIpO7+VDdXoptsy2yGfUt8dPBDVlWr5WR6DL2oTZPQ72YMYnPez+ofk4ZNrgfhkuWOIOUw9AQm7AD4sWrl8ZuvZDlqY7gBiLWnEy3AmFJH9+bbZsM9yVaWz+tP23uXH+1wksBMcf55Mkp82gHttJyUPxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252474; c=relaxed/simple;
	bh=4pvPIysS9xFH+7471NAoRot/8UcaVFM2RP/Hp3uP2xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiVH3J++MOV4LWQnjL5QbcofIYv5bR0/ktVg1CIH/tHOttoEi1CQSAf3FgrOPSYVkfK7NGRU8FwpFIybITaT4gO1VEIFvYOf8D4KOb7R/+tljEAQxuxBN3c0Nvt9ZRfe1qtDqJONorJgdPlqioANGTGQkT+ARyRdDgtwsV3WFeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SD8whVZS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SD8whVZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DB1C2BCF7;
	Fri,  8 May 2026 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778252473;
	bh=4pvPIysS9xFH+7471NAoRot/8UcaVFM2RP/Hp3uP2xI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SD8whVZSJQao+hLGhIx0hZDHJxy08wES5ZWqNimqAq4+XJQoqFn9hRAo/xuUjTOTO
	 Ro24N6xfFdGJcI6LTLe/ZgAYLZB+hU3wRbWJXRSbvo/d//2pfu/oDngWtUyyfyRdfR
	 QQIwNBrpVoAQ8tzpsUozE9E6ybv4ruJ8Q78NA1/eOT8uPFHnkyOjq8LM9Djbimwza6
	 EeEATel4TxydtXSkWE+eDU7N9tpZsdwFEYnGL7XD5nHuluaBHh5/jO4h2KmK9xjacq
	 VpGHnOerAwLqSfpRUSb9MPbyeiLe20+rXRl3tA70UHUqqxTbi8crdS83NTqjlyzWn6
	 CNGMM4GU3e2Bg==
Date: Fri, 8 May 2026 16:01:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: altera: add compatible for agilex5
 socdk debug daughter card
Message-ID: <20260508-unpainted-stoic-bef0945598cb@spud>
References: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
 <ee029101fc623a716bcc31e040fd1271d8fc3f70.1778237639.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CpKEQW07NauFiFSt"
Content-Disposition: inline
In-Reply-To: <ee029101fc623a716bcc31e040fd1271d8fc3f70.1778237639.git.adrian.ho.yin.ng@altera.com>


--CpKEQW07NauFiFSt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--CpKEQW07NauFiFSt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf36tQAKCRB4tDGHoIJi
0rnwAQCq4xog55MvkvDXzVUGrUCnF6PTXJ9VoNyD3Awkd0JJ0wEA7Y1jThSrrzfo
gf34TXBvKQcLlVo6Iy0EJpVT8F8zqgw=
=lpbY
-----END PGP SIGNATURE-----

--CpKEQW07NauFiFSt--
