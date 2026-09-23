Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77E75448A9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177032; cv=none; b=faoPiHOqggH2E/O2uTtBJVZ630JXOcwwYDTM8dbCdMt/1X3HG4UCMYbNtC5dAZxofGDkKm5ZOF9v0tOch6hurFCHkut+cUTECbYbUUO4ovwf4jyABs/nrAUdw3NNR7myh/9RyKDWuuVx9k2JHwQYHW8sWt5Uwjf2yJksJvZXQZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177032; c=relaxed/simple;
	bh=E3NOeSFwH6Di0qrOwVkmKjlnWxc+Dz//K7LomqnBeXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZzISGx/nPaQ4ljGOJP7W8Oh45kFKa62bH/Qf54K27Tj5qA8EJ62UGqHQZtcS3/mDijqdurqk5tc0tiT6KOB8HPKdWJDZq8Q+ThN7FouV2DZOwA/9ASh6lzgbQnx4KiSF5ThS7ShPbNocPEhADEWGOZ2JdW5x0ipdX1xqt/upIvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmqefXsg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmqefXsg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178B01F000FF;
	Wed, 23 Sep 2026 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790177031;
	bh=+nuUooptbuZyzNDIAJY7j72feFP16+/fafiPnMFAU5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DmqefXsgiKf0j138+iXLVEoJsN72J16TjRYPAcyGp+QBkBli4UlDTdTPhc0CUAAvh
	 bM8OeG/ItVx8tXzIWXhIV3Js+Ns73JKKCl4MA5VJqs/7m+i/TSObW9xEoCFks8pPo1
	 vTpS8P0V+5LMLBKEaRPBKb51bRzcuS5u6OWfZtHb2o/pIHe2BSxfHyKqkKjnVA9tFu
	 fvNDSjIybR3gO3HOgFFigRrCBwmvnV3sJw72qq2y3r0qIfCFxAh9eEhHPL+/VBZ6Ko
	 rk/+WqoCONtc81IoBUoWf7gZYo8p4GbMV2H9kJRnv9brQd5Pxc4MMHyMjBZmzvHT5S
	 fdrbIUQUkX3ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5K3T2
 image sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260923-upstream-s5k3t2-v2-1-04ffda3350c1@proton.me>
References: <20260923-upstream-s5k3t2-v2-0-04ffda3350c1@proton.me>
 <20260923-upstream-s5k3t2-v2-1-04ffda3350c1@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 15:23:50 +0000
Message-Id: <20260923152351.178B01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing physical hardware requirements in required list
--

commit 430d5cdb46dd5406d0df9a1e8177756edd38bbfb
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>

dt-bindings: media: i2c: Add Samsung S5K3T2 image sensor

This commit introduces the device tree binding for the Samsung S5K3T2 20
Mpixel CMOS image sensor. It defines properties for clocks, supplies, reset=
s,
and the MIPI D-PHY port interface.

> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.y=
aml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
> new file mode 100644
> index 0000000000000..83b3d55a8ea76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml

[ ... ]

> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - port

[Severity: Low]
Should clocks, vdda-supply, vddd-supply, and vddio-supply be included in th=
is
required list to enforce a complete hardware description?

If a device tree author defines a samsung,s5k3t2 node but omits the clocks =
or
power supply properties, the incomplete hardware configuration will silently
pass schema validation.

> +
> +unevaluatedProperties: false
> +
> +examples:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-upstream-s=
5k3t2-v2-0-04ffda3350c1@proton.me?part=3D1
