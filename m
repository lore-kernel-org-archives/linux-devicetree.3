Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEA148987E
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785589312; cv=none; b=D8PD9cpbT7EL77SyXxzYbd29HxEFNG1N56kofaPgNWFnm5Z0dIqBKA2CQ0r+q9U+9fDwMKVF8+vUSYTwntsYgDRoS9aS7opCqbZAOZy4M2zGErHHCd9YtPw35GAHP5D8LgrCkTHc+Q7mRNLuD01v2FkFuQXkB54sG9JZyCD6o9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785589312; c=relaxed/simple;
	bh=XWL5XgSUQwV4Fxoj35h6HuPRYVFFI+z2Satf3GQC6qA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eQn2LQwW2OPIJteB0wSf2aAbuyVjnv+R69vsapsZwEMRNx1XRJ1u/ihHiCRvKL/rzuxBiyuUHp0pvlIZplOceqxyGeg1efuoqj2ap1R1M9SO+gsJ38abga7c+mDeyJULm8HYr6oB29M0iSvIXp5q5ns0CAj+ZwK+c6BnbKqvGX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gg/fC641; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gg/fC641"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDB41F00AC4;
	Sat,  1 Aug 2026 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785589310;
	bh=q/BOyJbg0rALml9+aPpZJmkmj2f+lC3QBfsb7Scgm0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gg/fC641AXeNJLlUn138IcXqqErvtTcmcFXqG0OAb9N10Wc2TukYynzHHaHqvgyVj
	 btkkfy7ZW6Bs15BUKunT+KQVytwFPeyCj+NUJIHTSr8HxAoBHjAiglha+/wcwfxhau
	 NfatkRckduVlQ9/D2NClGoWcpj9pg7anOtUHgRyzONAMocfqbbqh5Z7CKuG3Eftom0
	 5zztWA68hvfgY/4pG/jIrA5/FxleaxYV860MeKfUXRAd5NIfxuT/rbpiXFleYWV01g
	 9Bn6lWW71i0jXWv9q/XEkXMAt6YD1cUAte4j47EBJqa+AFMK8TDKoA1LOAAyrRTmSi
	 AXY14/4Qu4V6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramshouriesh R" <rshouriesh@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260801-hm1092-driver-v6-1-5979f223748a@gmail.com>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
 <20260801-hm1092-driver-v6-1-5979f223748a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 13:01:49 +0000
Message-Id: <20260801130150.5BDB41F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema fails to restrict the `data-lanes` property to a sing=
le lane, allowing physically invalid device tree configurations to silently=
 pass validation.
--

--- Patch [1]: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR sens=
or ---
commit ee5879a0923ec6b56edc74d8a66ff697b111ae09
Author: Ramshouriesh R <rshouriesh@gmail.com>

media: dt-bindings: Add Himax HM1092 NIR sensor

This commit adds a device tree binding schema for the Himax HM1092, a 1
megapixel monochrome near-infrared CMOS image sensor. The sensor is describ=
ed
as outputting 10-bit RAW data over a single MIPI CSI-2 data lane.

> diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yam=
l b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
[ ... ]
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        required:
> +          - link-frequencies

[Severity: Medium]
The commit message mentions the sensor outputs over a single MIPI CSI-2 data
lane, but does this schema restrict the data-lanes property to a single lan=
e?

Without explicitly defining a data-lanes property constraint (such as
maxItems: 1 or items: - const: 1) in this endpoint block, the schema inheri=
ts
the permissive defaults from video-interfaces.yaml. This would allow device
trees specifying physically impossible multi-lane configurations
(e.g., data-lanes =3D <1 2>;) to silently pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-hm1092-dri=
ver-v6-0-5979f223748a@gmail.com?part=3D1
