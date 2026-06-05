Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A24E3B3892
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 18:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684477; cv=none; b=ELg7DvVhUXGjDoo+tLn834yubPdYLaWUHdX4h5mBpQca5hKu4LjbsYV1cbQmvJmBBdP+Qm0LPezWHTVJSyhP2mm1MsyokS/fisb+S8uABpRTw3OyiE1YpWLpWgY/Ufa/pesXog7Nh8h8jNrp19+2Rdu/UioR3ang5NGrwgAhWyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684477; c=relaxed/simple;
	bh=GcBuCnIa69t228naLsePh2parREyDpAy6sYHfT3XhM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JpTbN1DVijUwiN5Feai2QINqKjJ04CYirISz1cOEO3AeT2kclstGpvAlgF+WTcF3YLpNx0g7pm8B/h+V0P5hm0cf2xubrnGA/2u7zfDVcTZzYGlLwlH5cflCMZCgeyjb/GCPIIOhVkIcsdmT7qx9buPn6lhihukcqGLFvNQ0pSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8BBhPKL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8BBhPKL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273CE1F00893;
	Fri,  5 Jun 2026 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780684474;
	bh=NwZwYvQE83qI5W9NHF7r6iiAYpgfxN/z6R1f1xPqpRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L8BBhPKL+o7yIv31xdOxABg2hkAst7D7ff1QZWpnmv6ARuBwQnsSD0ZUaBoZbWPri
	 Olh5Rh66ubZYfahLs869nA/ZQU50WxvwqHj+cn2U8vJcJxGJ/P8K/B3JYKN1INojqo
	 rMTeovK9ThDXZIaWTwjIYwfvGLOAMrQAP1sewPCnpVSNhkXCd50519jbHqaGQm1G+O
	 MIdZG+hgnkj5eTK+7TvH80/xFa09GfuH+SVjreaOhQ5tTYjq9XWXk4zfXvesp5PS4b
	 qhEEkylYSj1aeNQYzr28rWNxFf15KMK+wDFICgl62HjvHW5drdt6OWYCwqprhn3liJ
	 8RYNiHz790Vvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Document Raydium
 RM69220 DDIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koskovich" <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605-asteroids-panel-support-v2-1-44b96c6eca91@pm.me>
References: <20260605-asteroids-panel-support-v2-1-44b96c6eca91@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 18:34:33 +0000
Message-Id: <20260605183434.273CE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added DT binding schema introduces a dtbs_check regressio=
n for an existing dummy panel node in `arch/arm64/boot/dts/qcom/milos-nothi=
ng-asteroids.dts`. The existing device tree uses `compatible =3D "boe,bf068=
mwm-td0"` for a simple-framebuffer dummy node, but lacks the strictly requi=
red properties mandated by the new schema.
--

commit 6315e592e65e15de511f78a600454fa1ddbaf9e2
Author: Alexander Koskovich <akoskovich@pm.me>

dt-bindings: display: panel: Document Raydium RM69220 DDIC

Document the Raydium RM69220 DDIC and the BOE BF068MWM-TD0 6.77"
1080x2392 AMOLED display panel used in the Nothing Phone (3a).

> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69=
220.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.=
yaml
> new file mode 100644
> index 0000000000000..7423b192d892c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - boe,bf068mwm-td0
> +      - const: raydium,rm69220

[Severity: Low]
Will this strict compatible requirement trigger dtbs_check failures for the
existing dummy panel node in
arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts?

That file currently uses this compatible string for a dummy node:

			/* Dummy panel for simple-framebuffer dimension info */
			panel: dummy-panel {
				compatible =3D "boe,bf068mwm-td0";
				height-mm =3D <157>;
				width-mm =3D <71>;
			};

Since the new schema mandates a two-item array with "raydium,rm69220" and
several other required properties like dvdd-supply, reg, and port, validati=
ng
the existing dts against this schema appears to cause validation failures.

Should the dummy node's compatible string be updated to avoid conflicting w=
ith
the actual hardware schema, or should the dts update be included in this
series?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-asteroids-=
panel-support-v2-0-44b96c6eca91@pm.me?part=3D1
