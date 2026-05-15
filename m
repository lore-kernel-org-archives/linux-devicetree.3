Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42A2F7478
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808026; cv=none; b=jAwokx28XHnN7ZSqAkHPrSQ+aRT2TJc/z1Zpfzan/3YScvcFq8Zg6ALsctGIT2rQ2xi0fm6BM9AshFG1O8AT/vY67pS3mWUrq5vSz59FNnUgwJ40xuvZQf/KMEz5EJFUV83dLXZmP/KlQKLlvdenlSy+jaJv/Z4HK7sh2ssgo7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808026; c=relaxed/simple;
	bh=kKSl4abVOt+G0HNz0hYnKXAzve2t3wM77fxyFXmiXz8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nHAUK9isVOLtiNJcq7DzBxPL2xrH9jj7R+t5BJr4bJN1P/g2Y75SAKgZVuAZZBcVseaPWS5etgYNTubWl67Dcytx3tnjO14Y4tGX8hBNXcsMBPIA0LWQMEFgElsJbjL4s0hjw79xqrSSpmEx8xIrF2OZem9jmzEfJEaO3VhQEnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akP15nGi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akP15nGi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4C8C2BCB3;
	Fri, 15 May 2026 01:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778808026;
	bh=kKSl4abVOt+G0HNz0hYnKXAzve2t3wM77fxyFXmiXz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=akP15nGib4tLPgfNYpUm/cZNfjzVVwTE0OdwaZayCv2cKSxOcB7oe6iedj9NdKeYV
	 1Zlnq+836BA5PlZ9h01Sc9+ooR1Xw1/uiT5oy8XeeNgl02hnJ70enF80FoKV9ZaMI/
	 IZIfb6zonjQKonk9RjweIXMcZSu9rSyurIoxrwNsi3FJQjnXRqxtTjCv2u0dhYG+Pp
	 F5lsvKH/hI+C+9Ka1vx6yMxToYMtjDQC8oQF2BCVrjd+wxSh46A2tGlV9UVprk9bz8
	 LR2Dj3DrRcL74tI54urepNZ86b/oyXBmILOXP6ecl++394iPImeGF+zfs+M6oMfqJU
	 WBCW9pryLa7AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: chemical: sensirion,scd30: Update
 maintainers field
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxwell Doose" <m32285159@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515011639.28570-1-m32285159@gmail.com>
References: <20260515011639.28570-1-m32285159@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 01:20:25 +0000
Message-Id: <20260515012025.BA4C8C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to replace Tomasz Duszynski with Maxwe=
ll Doose as the maintainer of the SCD30 driver, but it only updates the Dev=
ice Tree binding YAML file. The global `MAINTAINERS` file was not updated.
--

commit 93a32c5e87f9412329bac834ecc989bf06a6129d
Author: Maxwell Doose <m32285159@gmail.com>

dt-bindings: iio: chemical: sensirion,scd30: Update maintainers field

This commit updates the maintainers field in the Sensirion SCD30 device
tree binding to reflect a change in maintainership.

Link: https://lore.kernel.org/linux-iio/20260507172404.80435-1-m32285159@gm=
ail.com/

> Tomasz Duszynski is no longer the maintainer of the SCD30 driver.
> Replace his entry with mine.

The commit message indicates a change in maintainership for the SCD30 drive=
r,
but this patch only updates the device tree binding file.

Should the SENSIRION SCD30 CARBON DIOXIDE SENSOR DRIVER entry in the global
MAINTAINERS file also be updated?

If the global MAINTAINERS file is left unupdated, tools like get_maintainer=
.pl
will continue to route patches for the driver's C files to the old maintain=
er.

> diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,scd=
30.yaml b/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.ya=
ml
> index 40d87346ff4cf..a5b0debe85b1a 100644
> --- a/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml
> +++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Sensirion SCD30 carbon dioxide sensor
> =20
>  maintainers:
> -  - Tomasz Duszynski <tomasz.duszynski@octakon.com>
> +  - Maxwell Doose <m32285159@gmail.com>
> =20
>  description: |
>    Air quality sensor capable of measuring co2 concentration, temperature

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515011639.2857=
0-1-m32285159@gmail.com?part=3D1
