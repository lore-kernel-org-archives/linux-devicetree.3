Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A022D5932
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779153787; cv=none; b=FTDYP3R2IwrITZdvl1Ur/eOmn/Sk98Ox3Lb5KnkZ/O9QspqiG063d2DkLmxWxI2KZeAZmizDDfGbK9BVDeAHNawpJBJa6F2f7EnTSSyVd5FKCqyGX36nb4QRrPIIcKtJfBQonjUVMWcvXWWFCn1IDE1zBXjQz6P7QZK520aDXlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779153787; c=relaxed/simple;
	bh=xjqZcPCbei0iUVN1L3z6KX/GmMpa5/PYrcAO6lNwYko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s3W6v9kWmZU/eTpB1ZHqp819vLH3X56jCmRHAPqF55y/NBcHAzdugelcD0v1ExSp1gPr5dUfj8uu2UAOzWtmgmiydv6QnPKQH9vmBt6iOQGzC84BXlqPvUyMmjCthlr6Xdg7GFxv6i0piedA63YKnnUsGO4iwYo81W40lPmIWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDMeq7nc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDMeq7nc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDF6C2BCB7;
	Tue, 19 May 2026 01:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779153787;
	bh=xjqZcPCbei0iUVN1L3z6KX/GmMpa5/PYrcAO6lNwYko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hDMeq7ncX37KtCDCscAYXQ1vWlFhVKQB52/m0IiKOl9Urk18n3xnUJkkA+zr+12xb
	 0iw3MhpPr5C1DrzyDPq6MxSghzIOPg64ZPY3Wy8x6lzX7rygPIykBFpuTc28XKr5Ia
	 KlPDwaylvWQ94Wwly126YaDMROsWpEHunFzwiWkl2g41SUH0S6l3rlisQJDpfvqcwX
	 ofUPJc3889L2RPyJxK8McminyxA/YmHqd3h9exyMv0rRDzL2UkFM62Aw35RlxXwuxg
	 0+U+u+eXllu5xDEy4DYnk+/64uQ12QAdsnkLAkPiapoFDtdA8p+u6082Ir37n6PT2S
	 nOD0hoxrImuiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-ltc3220-driver-v8-1-e1771c1733f7@analog.com>
References: <20260519-ltc3220-driver-v8-1-e1771c1733f7@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 01:23:06 +0000
Message-Id: <20260519012307.5FDF6C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] `#address-cells` and `#size-cells` are omitted from the top-level `=
required` list.
- [Low] The schema fails to programmatically enforce the constraint that `r=
eg` must be 1 when `led-sources` is used.
--

commit 7595dbcc690fee63863037049c154e7a47df9973
Author: Edelweise Escala <edelweise.escala@analog.com>

dt-bindings: leds: Add LTC3220 18 channel LED Driver

This commit introduces the device tree binding for the Analog Devices LTC32=
20,
a multi-display LED driver with an I2C interface. It defines properties for
both individual and aggregated LED control.

> diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml b/Do=
cumentation/devicetree/bindings/leds/adi,ltc3220.yaml
> new file mode 100644
> index 0000000000000..9e545442f3d9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
[ ... ]
> patternProperties:
>   '^led@([1-9a-f]|1[0-2])$':
>     type: object
>     $ref: /schemas/leds/common.yaml#
>     unevaluatedProperties: false
>     properties:
>       reg:
>         description:
>           Output channel for the LED (1-18 maps to LED outputs D1-D18).
>           Unit-address must be in hexadecimal (1-12 hex =3D 1-18 decimal).
>           For aggregated LED control, define only one LED node with reg =
=3D <1>
>           and use led-sources to list all controlled outputs. Only reg 1 =
should
>           be present when using led-sources.
>         minimum: 1
>         maximum: 18
>=20
>     required:
>       - reg

The description notes that only reg =3D <1> should be present when using
led-sources, but the schema doesn't appear to programmatically enforce this.

Would it make sense to add an if/then block or dependencies rule to enforce
that reg must be 1 when led-sources is present, so that invalid configurati=
ons
do not silently pass schema validation?

[ ... ]
> required:
>   - compatible
>   - reg

Since the schema defines child nodes with reg properties, does the top-level
node need to include #address-cells and #size-cells in this required list?

While dtc might issue warnings for missing cell properties, omitting them
from the schema's required list might leave the DT schema validation
incomplete for the container node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-ltc3220-dr=
iver-v8-0-e1771c1733f7@analog.com?part=3D1
