Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C98331A66
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137925; cv=none; b=l74pr0sm8+OP6cIuUAfy7GdxztzO+nL4Hc8u83SfyUcBkdp04Vng+1kaXfpDVD2iOgynRlVkBpxzvgwy3NbRkhSWJ6cEJZWdg1rMsd2y8vegDUVTJpp8E9bQZMGzJjObMV0siSeXE+WiA2QuBlR0YQNwRBNcqz99AIRLJChHixU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137925; c=relaxed/simple;
	bh=loPQ2BbMzrx/3Vj3wnmX7Yb5pmjIUW7CzIWkpI9wc5A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=t63wNswA9lQZcQwerBwGYfz+07VVz50eNeAUqoNUpwdesRZfX2Am+srTfoFBtWOy5t6MppmwxbxG08NbaaUhZxVF/fvoXMXYKa7FCCyycqegNh5TEWoWqOx2kEQb+VAqxTg4OSJYQXFkUzRL1GePvg7oxrJe+dhNyOmAH+w5m+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkcHjDlN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkcHjDlN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394701F000C4;
	Fri, 16 Oct 2026 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792137924;
	bh=k0QAOxoskb8MSgLpTFrJ3gjxKBo8ju4owqXUzXWXiLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CkcHjDlNlPGEp5jl+MGwHsPqmE9agkn1AibMJ0K5Ubmnz4P8YFu3jHit1+HP/fs+v
	 g6jnanvsMaPKMllUUKbNLiYCcUmYrxd/afXfocSa5qBASBdLuDi/Ah6pfRCIrv6GgM
	 SR7VDwl+Y35GrwyhJxgLVy7iNIKWOC9yln5WXV6zbiRo4mHe/Ccw6uvUhx/t+MOvwo
	 SJ4D45Vcg757fYwbr3m6xs2Py1KNCBkYbLX+AHN7fMuWQ6K0c82lSajcQ8lb17V6dI
	 Umh1+XjQ4m8NzQ4WxDqp6FqIbz6lEaXk7TmCpctjWJz42qw6KX4Ku7lnHCUunKVxvO
	 2TgWFCoyeqCpQ==
Message-ID: <sashiko-outbox-173990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] media: dt-bindings: imx908: Add Sony IMX908
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261016075918.19345-2-lachlan.michael@sony.com>
References: <20261016075918.19345-1-lachlan.michael@sony.com>
 <20261016075918.19345-2-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 08:05:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: Top-level additionalProperties: false breaks allOf =
references
--

commit 4681de18fac98c8519949f316873059d73610eb4
Author: Lachlan Michael <lachlan.michael@sony.com>

media: dt-bindings: imx908: Add Sony IMX908 sensor

This commit adds a new device tree binding for the Sony IMX908 CMOS image
sensor. It defines properties for a MIPI CSI-2 interface outputting RAW10
and RAW12 formats.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> new file mode 100644
> index 0000000000000..828db1175e2f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml

[ ... ]

> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-supply
> +  - ovdd-supply
> +  - avdd-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Medium]
Since this schema includes an allOf reference to video-interface-devices.ya=
ml,
should this use unevaluatedProperties: false instead of
additionalProperties: false?

Using additionalProperties only considers the properties explicitly declared
in the local properties dictionary and ignores properties introduced via $r=
ef
in an allOf block. If a device tree node defines any valid inherited standa=
rd
property, such as rotation or orientation, schema validation will incorrect=
ly
reject it as an invalid additional property. Changing to
unevaluatedProperties: false will correctly allow properties evaluated by t=
he
referenced schemas.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016075918.1934=
5-1-lachlan.michael@sony.com?part=3D1
