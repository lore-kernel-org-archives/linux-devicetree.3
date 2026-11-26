Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795687786;
	b=QT5ROA219cp1VghfrAdQucCzEOLH0O3D+1tTpZfAmZHiZ73rwHsTY4M1bm4PWLUVh9b3
	 ZvMCRqEMwu1LT5RTxXidTYZcq8lzSbH8rdJGS+6IpvV9D7hIB2KuFx4Dgwld6qGxH5pOk
	 2cFLRS3f4fINRUitZ2XsSO24N1j/imjHJVtI+/SKmpZBtngmYN+FKfA7gQHaamgVNYVPy
	 Gu7x7La5VZWANZAUnI2/xmnmZwZETdbzuVATlgB8b9mpEoRJqzQfBQUFerWU0btL0HHam
	 BCcLO2OWYzpHhgAW52SlVPPCAH1x1WVKh5BKxFVeTsCdlmr+GbGnHSlbUkIT3F1hdlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687786;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=l7d5IaQ6JOFWPkAFn1T5RV5TtU7SOPA7qfljz9g0TC4=;
	b=qzpBfxHNkeUljkR6DttPTb9wuRmOJZO/esWtDV4ln0uAhtwPNLmz0IZQ+5lbnkYCIKWO
	 HfmroogGxFkDn96TuF1KGKiGVQcRHQCQdNoI2OhVRTCGl6W4MMg+n5/VT6bm8KWwtkHIZ
	 DrXQ+wX+HCBoEx6vU8RznPlXbhUb2uvzwsXWW5EFSl+3nuT+K9O/zWHTei0zXU2V+AFRY
	 8fYT3tJNPu5cqfN8QrHbLpTwtowHnGmcWU1niOIsLJpr0pDwz0tNXFdemjJWDkpOoyEjQ
	 E8P0DZPmwyymp5qZ9Mh7aGBoQODEZxvF/tAsp9Dxlgtm/M+kLl0EynJZen3FEP/DKuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=esdLImf0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFCF606A31C;
	Thu, 26 Nov 2026 10:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFCF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=esdLImf0
ARC-Seal: i=1; a=rsa-sha256; t=1795687758; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=efaMgozkJueJiSs2swC40lOWWCxi/7Qg8e+K/GtQOUqIsY0pXuMWbjw/DJFPF8vEWKyguNsJV/0fGff39z/+EgwELScgIamYYe6WPzlp3dvQtmvS7McROLHGl+1mjM/5IJdAuVuau7z3Yc3LEvsnD3NWjepdrA+tC7sAuzev0+w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795687758; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l7d5IaQ6JOFWPkAFn1T5RV5TtU7SOPA7qfljz9g0TC4=; 
	b=NO6Yzv6d/2Rpv1/e5VQHt2h97mzw9tSi/y02PRA+wY0EIOslpJbfqD6yeJonnK9H3Wu1nd3DgAQMmPmbAjZCUR5C2OTxFp4N0DLsb213ZXbf7tTDCE+1RUq6TErRyKW9UwJeqlKaR0Qp3rkJzvRhwmuSFLz7NokiWT4qGdiq8Kg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=esdLImf0LzvU9760wveffdTdVGwTvsAtjHzK6BpB/YKvVtrLYztUTDFrmsPnazV165g9oBJHyuvHVCj9B+r7p7oiCPAm2zbjLIb2ktBGFgzqdtIEqa5eCpo1b9sEO0aQx3x3Vp85JPQ5IBdpEYN0UC7/fu7Zx08Lg0P3sh5TVWE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=l7d5IaQ6JOFWPkAFn1T5RV5TtU7SOPA7qfljz9g0TC4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795687756197766.9363163176183;
	Thu, 26 Nov 2026 02:09:16 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id E71F718040B; Thu, 26 Nov 2026 11:09:10 +0100 (CET)
Date: Thu, 26 Nov 2026 11:09:10 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: iommu: arm,smmu-v3: Allow a clock
 and a reset
Message-ID: <awgFFhKsT87wTwJK@venus>
References: <20261126-smmu-v3-pcie-pd-v4-0-c340c2dbd1d2@gmail.com>
 <20261126-smmu-v3-pcie-pd-v4-1-c340c2dbd1d2@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="356dxsaiqd4y3y2b"
Content-Disposition: inline
In-Reply-To: <20261126-smmu-v3-pcie-pd-v4-1-c340c2dbd1d2@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.675.79
X-ZohoMailClient: External


--356dxsaiqd4y3y2b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/3] dt-bindings: iommu: arm,smmu-v3: Allow a clock
 and a reset
MIME-Version: 1.0

Hi,

On Thu, Nov 26, 2026 at 09:54:13AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The RK3588 PCIe MMU-600 has a clock (ACLK_MMU_PCIE) and a reset
> (SRST_A_MMU_PCIE) in the CRU. When no PCIe controller holds the clock,
> it is gated as unused and the SMMU stops responding. Allow one clock and
> one reset.
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/D=
ocumentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 3c044e4f03d4..9ab80142a485 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -63,6 +63,14 @@ properties:
> =20
>    msi-parent: true
> =20
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Clock of the SMMU's register and memory interfaces.
> +
> +  resets:
> +    maxItems: 1
> +
>    nvidia,cmdqv:
>      description: |
>        A phandle to its pairing CMDQV extension for an implementation on =
NVIDIA
>=20
> --=20
> 2.55.0
>=20
>=20

--356dxsaiqd4y3y2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsIBUIACgkQ2O7X88g7
+pojpxAAl60EjN/Ws/Tt4rGo9MZ+TYyUyltt45l8mZYJuUkNuRTlwc+WJHOIJnKl
gofGkYklDG1He/k/dP11sYRSyB24Z1EMr3x1nzlXeuFF9PZaxOGOn2J1e2vLnNfo
tXNDP1TC4fBm/uun2sdoOBQmm+ZtUEoNGcnmeMW8DEc4MQz7+czum8+wzlMjquhF
7OFQO6tX2HvByW1ARUujDlkwSPVfQSQYXXwrDoh1Si4kojAk4z9jIBN0dzPp8Z1y
/T3vY56GBVN4K8P+uRtKs7Q3cQvoySwb/tbMtjUukseYQOu4y07Ahjih2fRrtRf4
/5Pu8P0BNITQfmc0nsTP9IBI+JEIpwModufX8QZGS15HyoupoA21w7OpzAVamVlx
OImMB22d32mFMv/OM3oJn4f7Praa3h6j8qKREbwo0FZsCl4rOKqQWVGILY0cBxIB
9kaaUWW/Ju78xwH72nlyJl1zXuqDYjsAh7BXY6457zJp/8eutSNikalsgdkEVNGF
4CMbAicoPTatPFkIM8LZ2sNFNMGAdwh1XrZardea9NJV3DK5jXkY8zy4Y0KjM8FA
maVJONdZQv2d6N50Owf61bS7gHeKTmyG9P4WO9XvRHEnVdZPJuEQo28LpT/+7gdK
PRtNSKzr5Bxv9PdT7m9YCDpH9qNq09civvhOB8ittmjC3h5yVCo=
=r4Q7
-----END PGP SIGNATURE-----

--356dxsaiqd4y3y2b--
