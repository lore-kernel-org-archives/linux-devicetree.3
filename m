Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9522335BDC7;
	Mon, 22 Jun 2026 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113365; cv=none; b=O+i9Z6EerKoW8HepvENETTOjBtUGs2n0KNe3bOSK+yB4pT5UHw8Iuf2U6IVwZbss/gqpJwfUirURoUEzyuhpvVIJH6tiobyx42OL2Mx+f5+1YYA8DYJNrOV1pq8D3TcmikMm0ASk1nLLwOQ4TI1v4ayO8l4EVwJw35wxgI8nFzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113365; c=relaxed/simple;
	bh=gMun5/pW2BN5KtElQA6aieOPOsLyAsjsTYCd1xDYDuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPSNCGFpEZgLS5Xtvwpvj1CsQlyrJSH4EwfOOlAnrEywqjLi9hdr9KNHAe8AJYyPdVUzlQ95DRYzbCqwLABpmaKaZtYSs87p7fh7UyKCPuCxKAPB3QlY4bM92viqjC29ar1yP929oQ3F1iUJCQI4XhJi6cvY7nmhdmnGOkI3TKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRHqSEK7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRHqSEK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1681F000E9;
	Mon, 22 Jun 2026 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782113364;
	bh=wvRWeZiPgMIADH0MW15ulVfcdstHE6I70smWSPph5gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hRHqSEK7Y4tXt9hQiqv/bqDsVUFQ49G1X/5zgOaRkTiLx/Nc3tl9QEkBgQV7ccrxd
	 PNrT2VjSwsWXYjXqHolaxaR5I4xE5u3GSJeHsxl13X1CKLmrr+SZVBlwocd5SdLhbD
	 NbXCkkGAmPvnlSH53QACdDbnmJcVJitGw0dis/+PRddOMGIoxfYs+30pHOveuSAxOJ
	 +rdO7BkIIEzCdpu0ygfxbf/AunHPZ8RHUYOk6uln5aKZ4j4gvpXnYjmCUrfXfqgmk5
	 NnUgbcWa7TsBw7B4kKIFGLE3qETxn180os1nlY6FOVKpYGJTesXh01+CEqAVNswG+C
	 fZejEgQ03ilSA==
Date: Mon, 22 Jun 2026 09:29:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Message-ID: <20260622-mindful-civet-of-refinement-02d3da@quoll>
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
 <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>

On Sat, Jun 20, 2026 at 10:54:00AM +0200, Otto Pfl=C3=BCger wrote:
> Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
> PMIC, used e.g. with the UMS512 and UMS9230 SoCs.
>=20
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/regulator/sprd,sc2730-regulator.yaml  | 44 ++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)
>=20

Sashiko has good point - where is any user of this binding (through
reference)? Without $ref, this won't match thus is a noop for validation.

Best regards,
Krzysztof

