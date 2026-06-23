Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9EC2D7380
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219943; cv=none; b=NMrsJFwaKIUf4RY650P1iJTf6fl1Y1+HzBQvi2V3Pe+QWcY5YEt8K+ZStHD52Fn5bmjF3174ANPOJfkwGF3L9DBmtm4twq2rbvOGWiyjFhh/9ndkWzGiVtfCoCEb6v9rBr8TnwT6/IqMfMxGy6t/5E+uTx35rftSjG9kvUH+Xjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219943; c=relaxed/simple;
	bh=0fu0mJIifLNhiHu+YZQhT5uwip0KfuxEr4p7POR/ixI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QkanwciOzMA8mXDDCgAMjcEaBOqrVmeP0CzPdzKOzZejSPaGs3kaxOkCctyuyIiPo+n3/6QHeDq2L4ulPnPp85HgL2T7wuo7djKZ/gRvxqsWnTfiuX86a5PDg4gOBS5fH0m73I9Xhu+d9SBB7EjBnNtDfNyS+3K70m31vHGDfRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0VkgAnr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0VkgAnr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571971F00A3A;
	Tue, 23 Jun 2026 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782219939;
	bh=ze28JD50alvxXZwc/HNL/lGT2C57B5B8UKznsdMKOfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H0VkgAnrgGvFY38EjpZWeMsQbxY8Lvysw0K3uwPCXeGXKVwhEBWMs3rqjold6blTa
	 p/GwtNj/Kz9421g4yka/qHXABWdb/SKYw9H0k9nrgtvFCKqHAsjABruMQHbqnlJvA9
	 MlDMKS2X10VH4SsCl5pT7fOQksJ1Fngd0FE8BIed5qUkxph9vKwwgEYLMOmBRZaE0J
	 kEKbdne+bfT3DHsTD5W/8NKmPsRIhBGNKS3cqVtXKbtH+sUeOmAbHnPED+DgQo1Il/
	 Me2Lnt17c3OKWVS1KzdQf4gnuF43FkXv7VValVDEBAVo9WFanm6eac80OeAv+OPkyL
	 4IAhra/uQd6mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/12] dt-bindings: iio: dac: ad5696: rework on power
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260623-ad5686-new-features-v4-2-28962a57db0f@analog.com>
References: <20260623-ad5686-new-features-v4-0-28962a57db0f@analog.com>
 <20260623-ad5686-new-features-v4-2-28962a57db0f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 13:05:38 +0000
Message-Id: <20260623130539.571971F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Unconditionally requiring new `vdd-supply` and `vlogic-supply` p=
roperties breaks validation for existing device trees.
- [Medium] Conditionally requiring `vref-supply` for `adi,ad5696` breaks sc=
hema validation for legacy device trees that use the deprecated `vcc-supply=
`.
--

commit 7082ab254ab9eb0509320518d5cb786825dd6cbb
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5696: rework on power supplies

This commit updates the AD5696 DAC binding to include vdd-supply,
vlogic-supply, and vref-supply, while deprecating the misleading vcc-supply.
It also updates the required property lists and conditionally requires
vref-supply for specific variants.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> index cc343cdf6085a..e10f8596f9d3f 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml

[ ... ]

> @@ -62,8 +75,21 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd-supply
> +  - vlogic-supply

[Severity: Medium]
Does unconditionally adding vdd-supply and vlogic-supply to the required
list break schema validation for existing device trees?

Legacy device trees that legitimately omitted these properties will now fail
schema validation during make dtbs_check.

> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,ad5693
> +              - adi,ad5694
> +              - adi,ad5696
> +    then:
> +      required:
> +        - vref-supply

[Severity: Medium]
Does conditionally requiring vref-supply for these compatible strings break
schema validation for legacy device trees that use the deprecated vcc-suppl=
y?

Since vcc-supply was valid under the previous schema, making vref-supply
strictly required here will cause validation failures for existing device
trees. Should the schema allow either vref-supply or the deprecated
vcc-supply to preserve DT ABI compatibility?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-ad5686-new=
-features-v4-0-28962a57db0f@analog.com?part=3D2
