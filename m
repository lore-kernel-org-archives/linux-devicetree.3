Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37EA284662
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618424; cv=none; b=hA52CB06aDbR5fwQRJm4psN6eDypGiTW/IOgPRPdH199nMGeOFD+2rwDgQ2DeOTK3j4+X8F3lAUdKNP10lANYXN2wQzNLVMzfYxprgiLGPf2njMraU7JbA8Anwx8zcItjQw6MBEV3XzY9roldNB4uLlN0Ym2vg5V7P276C+skG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618424; c=relaxed/simple;
	bh=IqTkcogRJx5YEHKhyP0gVN5bWvriVOiSZSh3gpk2O7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MBPS7psJvEuei3QA4AMBPS29nH6lfA1oNsNtoJfwnJ3kClkD1TwlVSjLhgyVJ/M0a3Zz1DLykGrzxVdh3Xbw3ANNyiO5yIsYpTuZrArFAyto3C94d6dIWjZw+m0Bu1Dgd6mMx3g/W3+SNhKxKANUmC+Zp2PYDoCZ9ly/Mu/M7aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuYu3PJW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuYu3PJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FFA1F00A3A;
	Tue, 21 Jul 2026 07:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784618422;
	bh=dr1JAn4Fhy/KUEwj92W+2WSmwh0rbMLBeWCuZCA8h9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JuYu3PJWmCJCuR/pMp94RMTj1814IMqIC8+griDmhnmxRjaaQULaCBGMDeyimoGwh
	 letDx5w4D+SuwNm3mJz3Dj6IPeJhc/StCoiZ8Rs8XXioip/3sjUsHdWxQ9FTBR/4hg
	 QqZa8MV7iYKBtLXV63RxgTU9qDHXgGPUv7xStfIyLunYT+olnsD5t7MFRumDoD4G4z
	 AROqzuaBgaxXxFG67GZu90JvF9sC7sSXtbLaRIfEjdRDvI/3W5WMDKTKqEg0eu41NW
	 MfZ48wAYPptN08HT29hKHi/dZ60Iym5fwb1UPfNbYnO/CNSxVT5Sb8N+BBpVBvVH/I
	 bgjThdHSgWKHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] dt-bindings: display: sn65dsi83: Add output
 data-lanes property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wojciech Dubowik" <wojciech.dubowik@mt.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260721071253.1098652-3-wojciech.dubowik@mt.com>
References: <20260721071253.1098652-1-wojciech.dubowik@mt.com>
 <20260721071253.1098652-3-wojciech.dubowik@mt.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:20:21 +0000
Message-Id: <20260721072022.52FFA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Redefining `endpoint` in `port@2` and `port@3` with `unevaluated=
Properties: false` unconditionally rejects valid vendor-specific properties=
 (`ti,lvds-*`), breaking schema validation.
--

--- Patch [2]: [PATCH v6 2/3] dt-bindings: display: sn65dsi83: Add output d=
ata-lanes property ---
commit c8014187b83b236fe065488764ddd649223ae575
Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
dt-bindings: display: sn65dsi83: Add output data-lanes property

Adds an optional output lvds data lanes property with two allowed values
for standard and reversed layouts, informing the driver if the reverse
lvds config option needs to be set.

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
3.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index e69b6343a8ebb..4000bf0b13709 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -86,10 +86,54 @@ properties:
>          description: Video port for LVDS Channel-A output (panel or brid=
ge).
>          $ref: '#/$defs/lvds-port'
> =20
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false

[Severity: Medium]
Does this local redefinition of endpoint with unevaluatedProperties: false=
=20
unconditionally reject valid vendor-specific properties (like ti,lvds-*)=20
and break schema validation?=20

In JSON Schema, unevaluatedProperties only considers properties evaluated=20
within its own local evaluation path, so it won't see properties evaluated=
=20
by the parallel $ref: '#/$defs/lvds-port'.

Could data-lanes be added directly to the=20
#/$defs/lvds-port/properties/endpoint definition instead?

[ ... ]
>        port@3:
>          description: Video port for LVDS Channel-B output (panel or brid=
ge).
>          $ref: '#/$defs/lvds-port'
> =20
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false

[Severity: Medium]
Will this local redefinition also mask properties evaluated by=20
$defs/lvds-port and cause dt_binding_check to falsely report errors for=20
compliant device trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721071253.1098=
652-1-wojciech.dubowik@mt.com?part=3D2
