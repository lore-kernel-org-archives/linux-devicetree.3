Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838BC3E0C75
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912331; cv=none; b=WmxZ45n5+tQpj7Y64K3/HPolZBmqmakQZxZr8K1P0sWo71eA7H3Gay4pZIJEFuYkK4Nn56Roz1Iqkf26e59jv1yFf00hff83yOaZCclX53dLIwIf/5j96+xnoUuGgbsGDL1JfZFwRckCJU1q/nC/4Mnmu3nE04cJq3auf/7/xIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912331; c=relaxed/simple;
	bh=Y26l783xiyuCALAdeCvQUOBakp2/0UJO02SyLJm7G24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ihSr955FcXni9wTXxsmm/eshvLPR9QaIsIHJGtJEuKv2vTCukNyg2xDSg5B7/Po28klvFlr7frWzb7HosZYhw72v/KVCBXpIrz/I6sIwsO4cmzCejO2EFp0wiJt3ngDdBwSH5+jzipmuUw+5Ghj+Vh1GmrtpdU7sYZnpwWMRqLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYIC7SPe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYIC7SPe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C69B1F000E9;
	Wed,  1 Jul 2026 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782912330;
	bh=lzPcASlg/SIso8Tk/0DaUyw1QM1WgGM7sdgQW3dIi90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PYIC7SPefXu3Vn1LdQbw0ycoxN1eYCy/SNs5YCwB5sTvBIYWExoBhum9fmPiqZCL/
	 axwn6h+21ROAA9V+Hk5OPU38cYEoH5/m3JkHv/4xmZL21Qqlr/PxFSjK/fyeeuqBoF
	 SI4kv0WlKQ9vcx1Og4Dx1G00rMrHnWbdocIGLwvgb0IsmHQgwiejpdVv4YblsYcEV6
	 pVBrTx6Y2x4OuvfJjOFHKNo5smPBtyflFSonps/7Em/TqF/UbEe5Dwf0v3d6pRJeVI
	 37Gf+7w+pxxXktUIpxd5bbaXrVutRyYloaM/zhZwoxLx6Sdlw94GDbraHrlcozZg5B
	 KG9cTVLhqrOiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: si544: add si549 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGF2ZWwgTMO2Ymw=?= <pavel@loebl.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701130927.3858536-2-pavel@loebl.cz>
References: <20260701130927.3858536-1-pavel@loebl.cz>
 <20260701130927.3858536-2-pavel@loebl.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:25:28 +0000
Message-Id: <20260701132529.9C69B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The updated datasheet URL for Si544 uses 'SkyWorks' with a capital =
'W', which is inconsistent with the other URLs and may result in a broken l=
ink.
- [Low] The dt-binding title and description were not updated to include th=
e newly added Si549 variants.
--

commit 4f4bdd2bd1e69ffb4c086f281e4a07d3aa408d53
Author: Pavel L=C3=B6bl <pavel@loebl.cz>
Subject: dt-bindings: clock: si544: add si549 compatible

This commit adds the Si549 compatible strings to the silabs,si544 clock
binding. It also updates the datasheet URLs to point to Skyworks Solutions
following their acquisition of Silicon Labs.

> diff --git a/Documentation/devicetree/bindings/clock/silabs,si544.yaml b/=
Documentation/devicetree/bindings/clock/silabs,si544.yaml
> index f87e718671080..680bc71afd1e2 100644
> --- a/Documentation/devicetree/bindings/clock/silabs,si544.yaml
> +++ b/Documentation/devicetree/bindings/clock/silabs,si544.yaml
> @@ -13,8 +13,9 @@ description: >
>    Silicon Labs 514/544 programmable I2C clock generator. Details about t=
he device

[Severity: Low]
Do the title and description in this document need to be updated to
include the newly added Si549 variants?

>    can be found in the datasheet:
> =20
> -    https://www.silabs.com/Support%20Documents/TechnicalDocs/si514.pdf
> -    https://www.silabs.com/documents/public/data-sheets/si544-datasheet.=
pdf
> +    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/dat=
a-sheets/Si514.pdf
> +    https://www.skyworksinc.com/-/media/SkyWorks/SL/documents/public/dat=
a-sheets/si544-datasheet.pdf

[Severity: Low]
Is the capitalized SkyWorks intentional in this URL?

It is inconsistent with the lowercase Skyworks usage in the other URLs on
adjacent lines. This might lead to a broken link if the web server is
case-sensitive.

> +    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/dat=
a-sheets/si549-datasheet.pdf

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701130927.3858=
536-1-pavel@loebl.cz?part=3D1
