Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9F733F8CA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783029156; cv=none; b=lwSjnRUytbM9ovKrjuD4+Fo/3y/W1PrBsnCgEjmahBS5uKczt5S7M8XTYTTSHwX4jsHKPMsZGWgDceVP7tMSgxrT7G/FnLv5EmquGS91L9WJDHDrgMH5rPRioDkduCkil9N4ww7L6RYws8dJm1WvSQxIXEVcliTKbr62lfrKNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783029156; c=relaxed/simple;
	bh=Xrw93ugYzKntx8/NfRls3d7TzE+GKxRGA0mJo0JjH1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=goBcQkO/YMZTuyxPgMUetm8LkaMrA/3cB2Sov1hGMUt6eNdDj+RIv4MMBT4p9gtAMDzXEWgKYjNM69ueJCFP4HsQcJaocrYvSs4yHFEUiC1+VgeH5HzdcA+JwoCkKmWP0oVniO5aR9OuIgH1EE6V9Am3Lmg+xXpdvGl1oBIBmgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIT4kfE5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIT4kfE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517FC1F000E9;
	Thu,  2 Jul 2026 21:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783029155;
	bh=C1dOobLa6pFGU5E5LDmsCXiuU/cV0mlqJ0nNFhKvD+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GIT4kfE5B5/8+q4oPlaE5AGxaHah7RiUlf4i/j9cY8Jn5SofpHWyaHAj4hqfcXat/
	 Kcg8ltjWY1rKUk+1n6R9Y2RAg8n532ay6ScuEIGO5DGFoEVw7WL5/agtuMO9xqVPxv
	 lrrjF6535UctzCooYRuGCDCO4zZwhUqqy1VoBNdiUATGzDSq2vpNOTPt2kwm9ILsV5
	 +QkCblhKY12ddLP9+FlQiHSj9VND965/J1X7Re6hTf0JogGcrfi2oWFbgXy/5xFTgF
	 2i++90fwiWAXC8vgk7IcfFCMBPN/jdyxPaXTDhlNc6R3pMtB2CcNSn5VHjTcI4Q73V
	 letAEXkWir34w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: iio: adc: Add ltc2378
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <fa15b8fe33541fa2e8c7a3f124b2482872fdcf26.1783028033.git.marcelo.schmitt@analog.com>
References: <cover.1783028033.git.marcelo.schmitt@analog.com>
 <fa15b8fe33541fa2e8c7a3f124b2482872fdcf26.1783028033.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 21:52:34 +0000
Message-Id: <20260702215235.517FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Compatible strings with required fallbacks are incorrectly allowed =
as standalone strings.
--

commit fff47614872c95c6a481f63da8b14dfcedd0bb53
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: Add ltc2378

Document how to describe LTC2378-20 and similar ADCs in device tree.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml b=
/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      # Single compatible string match.
> +      - enum:
> +          - adi,ltc2338-18
> +          - adi,ltc2364-16
> +          - adi,ltc2364-18
> +          - adi,ltc2367-16
> +          - adi,ltc2367-18
> +          - adi,ltc2368-16
> +          - adi,ltc2368-18
> +          - adi,ltc2369-18
> +          - adi,ltc2370-16

[Severity: Low]
Does this standalone enum allow devices that should require a fallback
to pass schema validation with only a single compatible string?

Because parts like "adi,ltc2370-16" and "adi,ltc2367-16" are listed here in
the single enum match, a device tree node specifying only
compatible =3D "adi,ltc2370-16" will satisfy this block and successfully pa=
ss
schema validation.

This seems to bypass the fallback requirements defined below in the items
blocks:

[ ... ]
> +      # Low sample rate fallback for 16-bit unipolar sensors.
> +      - items:
> +          - enum:
> +              - adi,ltc2370-16 # 2 MSPS
> +              - adi,ltc2368-16 # 1 MSPS
> +              - adi,ltc2367-16 # 500 kSPS
> +          - const: adi,ltc2364-16 # fallback (250 kSPS)

Should the parts that require a fallback be removed from the single
compatible string enum so the schema correctly enforces the fallback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783028033.gi=
t.marcelo.schmitt@analog.com?part=3D1
