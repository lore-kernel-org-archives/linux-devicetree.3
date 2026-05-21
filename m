Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAFF38B131
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368557; cv=none; b=FVwUaA4DicD0SUUoFKHLxJhGeOOekhGQwcoPMDq/qSHiDNliK7Ei60FBrYN30pamJhuB/cES58jhqnp/OlBT35IEhE5FPPXP2BxXRAr9YHhT6QyzFB5OUow4u6n9tn4QCtuGGU9SOtC3mtlUgg0EpzO5QQCx16CIkixKiveboLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368557; c=relaxed/simple;
	bh=v7K2W0XderZoUI/LHQ6AThXmdK7ODm5tDouzhqp9o18=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WysqLXjafTNmZpph/p67m6HTNYNyABWqSqEvi8efyPEJ+TQCducpB79PUtCkIP3ilciHlb3O1OTeADF1qhkKHUnc7DZJEjj4Eg3TF7YffYXNZy3TRb14RaF+NEZw6BwQdp3fXnAoa2xpVa3xyetZMtUACv3egDcwZ/OOntiDucE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7mjn6dp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7mjn6dp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E131F000E9;
	Thu, 21 May 2026 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368556;
	bh=Wxfk0ddCh2+bKPnrj9t579mNqp6lQLlpoATC40MGpPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7mjn6dp2e9MaHHfBZQhX1y7MCsnBqEEOc8+dx+PTGr9ViVPrQRfEuW4559pGgOpf
	 BEHSDd7jPV9F9JTflYn91opRWIq7wwwlalQUtSu3dWrg1UFu8yl2+jsEMFJWbh4Wkf
	 G/t7U46qJETcmvF6oHvgGqlPYYZZRPPGPouBxHTceNLgaMrn+OwHYh2BMsa5qz5gQG
	 5vx1WdbcJosiDenjZHgwibYvG2hDSf6mjE7Q/HH43wdjKGlU07nDsxcrAYeshJ0nBZ
	 /0RbYF3ma5gXkdRfyhDJwVkxjTM4wK8F/9jaRsf3x8yZDoAgjrtSwE0BJ/fwMin4YT
	 5Tqhy48oqU0ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 10/22] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-10-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-10-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:02:35 +0000
Message-Id: <20260521130235.E0E131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing formal `default` keyword for the `maxim,control-channel-por=
t` property.
--

commit b55632a6d213d38d8586238541441292d954e479
Author: Dumitru Ceclan <dumitru.ceclan@analog.com>

dt-bindings: media: i2c: max96712: add control-channel-port property

This commit adds the maxim,control-channel-port property to the binding,
allowing platforms to choose which control-channel port is connected to the
upstream I2C host.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 161d40acdd28f..538b639d4f542 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -41,6 +41,14 @@ properties:
> =20
>    enable-gpios: true
> =20
> +  maxim,control-channel-port:
> +    description:
> +      Selects which deserializer control-channel port is connected to the
> +      upstream I2C segment when the device resets. 0 selects port 0, 1 s=
elects
> +      port 1. Defaults to 0 when omitted.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]

[Severity: Low]
The description states this defaults to 0 when omitted, but the schema does
not include the corresponding default keyword. Should a formal "default: 0"
declaration be added here?

> +
>    i2c-alias-pool:
>      maxItems: 4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D10
