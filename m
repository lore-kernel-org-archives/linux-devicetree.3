Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BD13C8737
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109562; cv=none; b=EEkFLQuaysL4/Pup3AQNaggHZ3tRgDBeDtQWHGXPZwwYTnWqsLB0e3OzTNnkbl1zZ6P7jg3D/KYRs1x/WqR7NjNYEXSJe04ZP8T+XiXJEMOdN3Wz7u824mubI949JA7eA5NLMuNu4b+S1zJ/zEbyzNDzHdR+D6EX9gufBMXjqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109562; c=relaxed/simple;
	bh=B4/Qd+MyM2VrAzk03+TdAfeyP4bs1xFCVjS5wc/7bx8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BGNc4DVsWa+hsEtxThpAueWvYxfbH30G+UeoFk8vCNol/GGy4w93azz5nrqefOAomvZ1/JkR3qvG3oqRxHbQyj9yb2o0e6Vg2oaIizhy4pUEml+oWTCyB08/wjIp06OqPZYdiUMdabrD1jJjDuPy5iQR7vHXUWWPjQw5ezmqja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J01V64c5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J01V64c5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9EA1F000E9;
	Fri,  7 Aug 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786109559;
	bh=0OCBHtT9h3xpgrm8+uussSglnt7iWExCenREyaNVfuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J01V64c5ZJ/oxaTd87UoO4vBep1x46GDaHlboZu7TzowXMipWYbwfwjCOko4r94ZZ
	 YvmtVFWWI+Zw0KLxSQFPy2ypvMx7hkYzyHTRGHAOJxM2wlFlrRiwWBbevFmYfceAM0
	 VIdfEkAHwokYiDxSFvaqNGczSDVz47HXfUEjsI44pHL78qTvAi+iZAZPc1lI7ybFhe
	 PCew09Cqk+4LV39LWyi+dfvS+kLaNXCti8xYn+tjQclYkAGzyfvFqXFKdL/bfIxjXL
	 A7OBa+C0uFIfctF5seEA9i4qUviypEAFtJDsLEz1exyZ4IQ3ZbSlaJU1H05nI3kxR6
	 X5eJGQrtWlCeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 07/22] dt-bindings: media: i2c: max96712: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-7-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-7-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:32:38 +0000
Message-Id: <20260807133239.4B9EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `reg` property constraint inside `patternProperties: ^i2c@[0-3]=
$` incorrectly uses `items: minimum: 0, maximum: 3` without `maxItems: 1`, =
rendering the value constraint ineffective and allowing multiple array entr=
ies.
--

--- Patch [7]: [PATCH v15 07/22] dt-bindings: media: i2c: max96712: add sup=
port for I2C ATR ---
commit 28aa89070be3ca4f5f4875a6e067a29ad02052e7
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96712: add support for I2C ATR

This commit adds support for changing the I2C address of connected serializ=
ers=20
by documenting the I2C ATR capabilities for MAX96712 and MAX96724 devices.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 583bbd60157c6..abacc3c874a9f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml

[ ... ]

> +    patternProperties:
> +      '^i2c@[0-3]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 3

[Severity: Low]
Does this constraint fully validate the reg property?

Because dt-schema treats the reg property as a matrix (an array of region
arrays), applying an items object with numeric constraints like minimum and
maximum attempts to apply those rules to the inner arrays. The JSON Schema
specification silently ignores numeric constraints applied to non-numeric t=
ypes.

Additionally, without maxItems: 1, multiple reg entries are permitted. Shou=
ld
maxItems: 1 be added here, and should the numeric constraints target the in=
ner
array items instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D7
