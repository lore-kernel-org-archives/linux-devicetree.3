Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE93B14A0
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780957667; cv=none; b=XgEnHO5M0f/5t4C7PeUNOlt66SVtOn0Xj4Oq1z+OvxzyVX49l4xbbQNwbDkKzpiBxjkvBopeRdcS83irFA11Kg02ItHqgM6B+6osj1/Dcq3SsfcGARAS6gospSqN2n5HR98oSMLZyKQyO22m1hQrwaB/eESnMEWcOEYsMYRaET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780957667; c=relaxed/simple;
	bh=kmfjOZekY3PVrvRsOjWzxkxrqxMBMvMbocT0IJKkvB0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oXV9S8NA40D+xLinxyi6tou2afqPNMO3dct3zo3p6efaTb0yOsA24RP0cZuXv+u3qrq8jzkJt2Cv4IADhmAUK5yqQXLcGldLpkb5aWjGPfcJ9Cbs2Y3ezgBAaTzLSZs5yXrRAW4KVlKoYaNsa3YIEgUkFT+kibnKA9UJE1ucguQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLp8vXzJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLp8vXzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65531F00893;
	Mon,  8 Jun 2026 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780957663;
	bh=6VzMoaa2wCAqyH2sfjeP25TaHQWfy4ICNCOMXBsAN7s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLp8vXzJ9Te7gOqUKKX27lNWV2yv925JLpOc1TbrJT7ru6mDqW+c9jyhuPbldTMxy
	 0P7AA1SWXMnvptFU3RyRWDx7lgjWFC2JFh6TrpPA/hmz9DBPzH54oWeMW3s96oSsZ+
	 Dk0l9jeZDN++9AKCHIMtJOj12btr9nnr3rjbjd/4W4ZjOM4XcsURtY3gKFO5yoZK9H
	 fqr7lT9PHvWg87RevMYiW9/nv4Bb+mtA2FKgIG33LgqOsv9XYvb4u0VMER/y/4nlPc
	 b9vVyrREryDFlNnmiLSTTPQua4f1WgElAwx7G5LVwu0tIFMLIyo03HrP+cdw/S2EP7
	 jcxmzRFy9GR+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608221710.1572971-15-vladimir.oltean@nxp.com>
References: <20260608221710.1572971-15-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 22:27:42 +0000
Message-Id: <20260608222742.C65531F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Schema validation error due to conditionally required `big-endian` =
property not declared at the top-level
--

commit 2c5c4d6b6c1efda8718b0e291015499912a81e6e
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

dt-bindings: phy: lynx-10g: initial document

This commit adds the YAML device tree binding schema for the 10G Lynx
SerDes, supporting various QorIQ and Layerscape SoCs. It defines a common
register map with SoC-specific configurations handled via conditional block=
s.

> diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Do=
cumentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> new file mode 100644
> index 0000000000000..eaef585338258
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

[ ... ]

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
> +      required:
> +        - big-endian

[Severity: Low]
Will this cause a schema validation error when dtbs_check is run?

Because big-endian is omitted from the top-level properties block, it
appears the additionalProperties constraint below will reject it even
when the compatible string matches.

Could big-endian: type: boolean be added to the top-level properties
dictionary, or should additionalProperties: false be changed to
unevaluatedProperties: false?

> +
> +additionalProperties: false
> +
> +examples:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608221710.1572=
971-1-vladimir.oltean@nxp.com?part=3D14
