Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01892364032
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778643420; cv=none; b=W3R43AxxcjvULGLzDOlxUpznssLVXrGhlYpnpshtmeJzTIVja2BAUA6AK+mNjHpBIwtOYr//3hReTchqRreHbukzRCwqj11xpBCbG0wcWw46VzqTumuLrUgZ7Jt9GI8nyS2DUcFUovd9e+W21OiI8JKqeVyIYaG5wC117vSxZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778643420; c=relaxed/simple;
	bh=hHLbd0X2DvdAcO6vnMeRgcEPGDGM3VtSX2QnNetZbZk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FH74Sc0ufsudR8XvU+wK22esDYeEChJndgN4MaFWJa7fcrGyEuqWVmaeYEk2j5GiwLYHa28jwSzsmz2eVJ1JSJQEooWTs9vF6ogcayyKMVzP3wNrOZcq3eGG+jq5z7m9HKSHyLalEFFdKPkYOjYttNoVlOV//9G2npNRpM5EHtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTjmT079; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTjmT079"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFAAC2BCC7;
	Wed, 13 May 2026 03:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643419;
	bh=hHLbd0X2DvdAcO6vnMeRgcEPGDGM3VtSX2QnNetZbZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VTjmT0799kWOaOoH1dnMCqNfoEJHvSZ3Jyrelq6XIVqRhyvKZ4a81jf52ZSvVlRXq
	 xgsdMK0JQ0XD5LD1cC8MUiM9OasjjQHjQuj/e6XpPTZID91dOMghPkAQtAWHSB5g3S
	 NyHxewL2SPfWdnYxvCxfdaJPHc1oxsNwxuU2q5RbWA1YjxiHcJYnSuzKb9iJ0UumSP
	 yxcTEBeGGFTJKuiKrlSBQ4NIHGIl86Lmnay/p4pd7caqrcJ+mghWn+/YaIV1vdv8cr
	 vt1j9xp+MEljUU8ZzjNt9KiAuoHHdDh9QlV07jVRyJ6i6W0X+aCpuZE9JUW7z0mEJt
	 FJuF5ZsJcidHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: i2c: convert davinci i2c to dt-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaitanya Sabnis" <chaitanya.msabnis@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512030032.5006-1-chaitanya.msabnis@gmail.com>
References: <20260512030032.5006-1-chaitanya.msabnis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 03:36:58 +0000
Message-Id: <20260513033659.5EFAAC2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `power-domains` property is no longer conditionally required=
 for Keystone 2 SoCs, resulting in a schema validation regression.
--

commit 59b91f299ee992cf35096c3cc9cfd8f6ca312671
Author: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>

dt-bindings: i2c: convert davinci i2c to dt-schema

This commit converts the Texas Instruments DaVinci and Keystone I2C
controller bindings from the legacy text format to modern dt-schema.
During the conversion, interrupts were made required and custom
properties were defined.

Closes: https://lore.kernel.org/oe-kbuild-all/202605120133.lQ1F3qlY-lkp@int=
el.com/

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt b/Docu=
mentation/devicetree/bindings/i2c/i2c-davinci.txt
> deleted file mode 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
> +++ /dev/null
[ ... ]
> -SoC-specific Required Properties:
> -
> -The following are mandatory properties for Keystone 2 66AK2G SoCs only:
> -
> -- power-domains:	Should contain a phandle to a PM domain provider node
> -			and an args specifier containing the I2C device id
> -			value. This property is as per the binding,
> -			Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
[ ... ]
> diff --git a/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml b/=
Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - ti,davinci-i2c
> +      - ti,keystone-i2c
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

The legacy text binding explicitly stated that the power-domains property is
mandatory for Keystone 2 SoCs. Does the new YAML schema introduce a
validation regression by omitting this requirement?

Without an allOf conditional block enforcing power-domains when the
compatible string is ti,keystone-i2c, will incomplete device trees for
Keystone hardware silently pass validation?

Should an if-then block be added to explicitly require power-domains for the
ti,keystone-i2c compatible string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512030032.5006=
-1-chaitanya.msabnis@gmail.com?part=3D1
