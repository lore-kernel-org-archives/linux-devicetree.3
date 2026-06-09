Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758153AEF47;
	Tue,  9 Jun 2026 16:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022383; cv=none; b=A1E3uNXAoI4l1vkgayg21iXH76Jx8qkbLqoia8UU9QUHsVVVmCjQw7T+mP/BC8NLVmfcseXIRsoLev6Oued6rxf1MFrF5UVPM9zDc0muZnLo90To1+QKkboMbq1toN4eTU3JWPOIGyMiN1K5qJoEgzgbku+cTDTZS5PwxZJFxMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022383; c=relaxed/simple;
	bh=lOCLczbSGOWmyREnEyfWbm24kEi5+CIA/NxTebufM1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CePUq1XuVIIVAs/QhhR+DxKcZu+hee9haPi4F4yNE4kXw7IzKEpfdrNt9HuCLT7gUW30PddNdKFDC9E4stGE9S4BcWjmjFljxAXlH8vOy6fmpibYP8RD+M1H1Xfgp6EYCfMMooV1bGRLH6uXSGR55QAoHG4Nz6Eu3WFzUXonZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WervNruM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WervNruM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BB21F00893;
	Tue,  9 Jun 2026 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781022382;
	bh=Ol5XbJ8Zll0CGaz5YdwTchaIYuSN27ZB4cVvs2GbZxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WervNruMOhp8kWFLgb+KZRoO0/uzjImYY7uLRhngsSKWnyRznBCOVFLVNB3GXFJNR
	 upDnTL/mOG0Thq3kcX7SmgvBkzorqL6+4roigtYhGp8+MH1CzIq+05RjFwqi30BQrk
	 m1QM7kPmWg41gIqzL7lBtNEMXanb5Awc6hF4HbPFNUTlZmMoT2+/UwyXTyDd4zcuZI
	 O474/6SjTMn2/5o3sRs4wtNXSCVN/meq2rza0lI0tTEL6PsNyVdxFt6FbelqqsRxHQ
	 7PMihrdTXkuzk8GIt3WWoP3NtR0KIfywGjlYZNFd8pvw5pa2rmBkGA74XLtCN1Tpx/
	 F0IZ+mMtdawLQ==
Date: Tue, 9 Jun 2026 17:26:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260609-panda-breeding-c34f8c9224bd@spud>
References: <20260608221710.1572971-1-vladimir.oltean@nxp.com>
 <20260608221710.1572971-15-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m8BBJA6NFrMDRSF/"
Content-Disposition: inline
In-Reply-To: <20260608221710.1572971-15-vladimir.oltean@nxp.com>


--m8BBJA6NFrMDRSF/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2026 at 01:17:08AM +0300, Vladimir Oltean wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,ls1046a-serdes1
> +              - fsl,ls1046a-serdes2
> +    then:

> +      properties:
> +        big-endian: true

This should have stayed at the top-level FWIW, and here you would do
then:
  required:
    - big-endian
else:
  properties:
    big-endian: false

> +      required:
> +        - big-endian

--m8BBJA6NFrMDRSF/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig+qQAKCRB4tDGHoIJi
0o7DAP4yScVIPXugWhiqjJ8kFpHIXCbphg8hp58c3+sEWfy1gAEAqQi4Tnoc6AaT
0+w9WaImVLO9zW26zWwAI8v4tc9tvAg=
=R2ta
-----END PGP SIGNATURE-----

--m8BBJA6NFrMDRSF/--
