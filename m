Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75D30E84F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178710; cv=none; b=LGB8+uU1Q7kvMur0RoP8KPavqStlmP5AaNaEwyuPnLjCxd66Lb8N2uMvEaqs7BcMaxK128esh7mixWksEHNEEuAcFQL2huJWg4ITWggZIb4dkuiJ/Mg6eO33ygA1zGRl/74w266iYFeRzyOugkMtXo6fVUz0beycvjiXmPiepdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178710; c=relaxed/simple;
	bh=ocsUQLPhHfcwrNAkbwLNIUBTV5ulGfSRXMMWfnPvUTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gZmeSVyHTQLJyYXNjWxJAOGkxkAKBEoj43l2+agasELzZwtr8CW00+24EgeUcZwf9a3xvhJWGQAwjsXS1Q8ExPTYvawvdghnDthCcXk5hM7gBFLPSjKQulgij/bxQO0gry2TALA7ZlqydN95Tzg/E4Tk8LIe9NKOPUt0/LOBwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knIv5Blw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knIv5Blw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1B7C2BCB3;
	Tue, 19 May 2026 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178710;
	bh=ocsUQLPhHfcwrNAkbwLNIUBTV5ulGfSRXMMWfnPvUTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=knIv5BlwHx2tdufsB6kb3lTneOVaD9wy948Cpl9Vo8wJKE5EO6j346sV5pU8D3OhC
	 R8U4nyyq1aqyUDyQDQvrwx+hXM7V3BBZCd0g00nekrNYYnH8TLZp4GTeSh3GKDXJqT
	 vdhHuLgDLNpGzM93GQ4yznX3BNYoEviaJZbqR+oxD5kBdp6j5TJkIawai2MErm+4v/
	 ot2K+bb3KzyCsDMP1rkBNovimI9Ffm95wOu+hJs3Q9rIrLBZEIPaII/VfAFAKLhNCr
	 wCz+Bhf2UjK6mtu8J/V6nhJdSZvu5iZ9XvlnVZ9xR60Po6DPPtJJBToVxFT3WaEVvi
	 fdjbSgb588gDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: document the
 Renesas R63419 based dual-DSI video mode Display Panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-1-b8929af5e951@linaro.org>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-1-b8929af5e951@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:18:28 +0000
Message-Id: <20260519081829.6B1B7C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `reg` property is omitted from the `required` list.
- [Medium] Schema validation bypass for dual-DSI ports structure.
- [Medium] Flipped positive/negative voltage regulator assignments in the d=
t-binding example.
--

commit b7585613be27a07063e2837b4b237f47e298a1f5
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: display: panel: document the Renesas R63419 based dual-DSI vid=
eo mode Display Panels

This commit documents the Renesas R63419 generic DDIC used to control
dual-DSI LCD panels, specifically for the Ayaneo gaming handheld devices.

> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r634=
19.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.ya=
ml
> new file mode 100644
> index 0000000000000..e4db01f88302c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml

[ ... ]

> +description:
> +  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD pane=
ls.
> +
> +allOf:
> +  - $ref: panel-common.yaml#

Since this documents a dual-DSI panel, should this reference
panel-common-dual.yaml# instead?

Referencing panel-common-dual.yaml# would correctly enforce the dual-DSI
topology constraints and validate the ports structure for dual-link DSI
panels.

[ ... ]

> +required:
> +  - compatible
> +  - vdd-supply
> +  - vddio-supply
> +  - vsp-supply
> +  - vsn-supply
> +  - vci-supply
> +  - backlight
> +  - reset-gpios
> +  - ports

Should reg be included in this required list?=20

The Renesas R63419 is a DSI peripheral and must be instantiated as a child
node under a DSI controller bus, which inherently requires a reg property f=
or
its virtual channel. Omitting it from the required list allows incomplete
nodes to pass validation.

[ ... ]

> +            reset-gpios =3D <&gpio 176 GPIO_ACTIVE_LOW>;
> +
> +            vdd-supply =3D <&vdd_3v0_lcd>;
> +            vddio-supply =3D <&vdd_1v8_io>;
> +            vsn-supply =3D <&vdd_5v0_pos>;
> +            vsp-supply =3D <&vdd_5v0_neg>;

Are the voltage regulator assignments flipped in this example?

It looks like vsn-supply (Voltage Supply Negative) is mapped to the positive
regulator, while vsp-supply (Voltage Supply Positive) is mapped to the
negative one.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-topic-sm86=
50-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org?part=3D1
