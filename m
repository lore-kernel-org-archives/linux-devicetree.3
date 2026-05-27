Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBF226E6F3
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905486; cv=none; b=ZOoAXFl+qdrC6y519HjJ9cddmCiECk8CvjVbKkVes7Vy8TFzda8RpSBujQMkbNxbFMYK+DsiByLnxRbTrTmgxeo2Jyu2UHh0Tkdy6CFNA6G7JD9AsHff2/4MdJHVJOEp80y8dHDVX803hgEo7R9CAnTKiK3e3A2dnvEpNy8SAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905486; c=relaxed/simple;
	bh=6MiMikVa9WTc9oj0RBd7tFEttCOe8jp4Ve+gmvTXgF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VF1pANrqn/NIk0OFkVki94gfZ0e2YTM2Hm+70zDsaejPe2q+PT2j/d31Rv+mnZKuetiYc77HPara5GaneNXjAZQ+vBV+Rj3bh0U2YH3w+bk3ApiXJSOt8Vc+w9r3/v0//RdnzNFVSgbAJlnGet8/VxcvrLwydr9goAu8oOvw20U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pt8yzYtv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pt8yzYtv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAA01F000E9;
	Wed, 27 May 2026 18:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779905484;
	bh=tlesODZwuYakMzldeXilCEKmCXIz9mQT+wRUMspu9uM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pt8yzYtv9HsHeBMyQsXaUtClveT/omE1sdYyk1qjPxOlacLC6WquWKeOe1dQakucO
	 Tx9adUKmhYFzZXNbvK+cVmonqBNk5gm752rxL15itrocjdGMHBknu/HF+NlIvqBTrx
	 iSmFSRBxL6+drlkmvzbSqFkvDijhjsK//eXCHHgxPSiZXBDh122CPuibkGYzPX4KMc
	 BXPfeRcYNLddmpycvOv6uC3JZI/267eItCWrwA2ZeA0PZ2BacLQncrySpvmoamiXMJ
	 MB7oEuum7sZVidwurBXuQkIFOXjWSE3knmlMQa3xNBuAj4NOAaIykxYSXkfrA47be3
	 fILYGJflE03qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY
 tuning pattern partition property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527175527.2247679-3-s-k6@ti.com>
References: <20260527175527.2247679-3-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:11:23 +0000
Message-Id: <20260527181124.0DAA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `cdns,phy-pattern-partition` property references a software =
MTD partition via phandle, mixing software layout with hardware description.
--

commit febb42c38a1be5c88fbbc4e7b590710091550313
Author: Santhosh Kumar K <s-k6@ti.com>

spi: dt-bindings: cdns,qspi-nor: add PHY tuning pattern partition property

This commit introduces a new property, cdns,phy-pattern-partition, which
provides a phandle to the flash partition holding the PHY tuning pattern.
This allows the controller to locate the tuning data directly during
calibration rather than searching through partitions by label.

> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripher=
al-props.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-periphe=
ral-props.yaml
> index 510b82c177c05..0ffcdf5b00d03 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-prop=
s.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-prop=
s.yaml
> @@ -39,4 +39,12 @@ properties:
>        Delay in nanoseconds between setting qspi_n_ss_out low and
>        first bit transfer.
> =20
> +  cdns,phy-pattern-partition:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the flash partition containing the PHY tuning pattern.

[Severity: Medium]
Does this mix software layout abstractions with the hardware description?

Device Tree is intended to describe hardware topology, but MTD partitions
are a software partitioning scheme. Referencing a software partition node
directly from a hardware controller property tightly couples the hardware
configuration to a software concept.

If the standard NVMEM framework is unsuitable here because the SPI
controller requires a raw physical offset to issue hardware read commands,
would it be more appropriate to define a simple hardware-level property
like cdns,phy-pattern-offset instead of relying on partition phandles?

> +      When present, the controller uses this partition to locate the
> +      pattern data during PHY tuning instead of searching all partitions
> +      by label.
> +
>  additionalProperties: true

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D2
