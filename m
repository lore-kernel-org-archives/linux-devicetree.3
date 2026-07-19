Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C84433AD
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784477704; cv=none; b=gGQqG8TeoT6co3gD1/nJO9ySzOiepYVlThnLwWSYrh01Muhy/H+Okbl3OiosaqfMBMs2KioQBOyA66EhgH7+7ZBNFCNuvyuDJQJnLA6lZmVka+RQtm1jTlbvmtjJsT8Hglo5UEutrEY/UrDbgpMADi57/R7d0VlIt1R/34m8yiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784477704; c=relaxed/simple;
	bh=Yf7tOmMZDPJ1m+uU0H6nBn3yzrEMurUsdA/taU81lK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GGclusxUhGqQv6Su9Kh/qn8MUP+SM7P7DqeEU9+CsE1CTPXnb+Bv1hNO1VR/mHgBHRsejIKX9G8LBwhRYNdpc+tH3Y1bMOErHnGN+vLKN/G8bRuc0FEWHOrYupE7Tm9lueqWKK9+I7U9Tsp+tyQnsnAC6VMqVoMBQuBlRplVQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1NRHXXv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1NRHXXv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8DE1F000E9;
	Sun, 19 Jul 2026 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784477703;
	bh=7VmY+yA/umQSE3C/zMBxyjO2tlXcsRnHdy6kysnjwfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k1NRHXXvxfa5fatoWGz2qy7Rj2lZ3AICgBIBdkziIOoJJFA1lcE8EWIUb87olYpGa
	 cA8FT+YsI5qI+Xep8GYFo6A+5PNdku6tp0YpWYT3YRIIEgUyXGmtShZdLrIV4dDwN1
	 YvbIXjRl8Hb3ZybxDg5Cujxx6t9/KIxpK/29FtBDWdAOeGW8AL2vL4RVqiq6k5DwvF
	 RNLdi4m2gqAqmNnUalVOp4a8DhgMNL8AF9AEx6oD9SvBbckJLt1tFbJqZwORj1iP7U
	 zyIJjXqtkQdhD/zmqxjJxFsoa0uE7A70Q7wGZl0hm5svdCyVau5GZGHRb53J4vkFSB
	 m3+qE7l6NAczA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: display: panel-lvds: Add boe,dv215fhm-r01
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com>
References: <20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 16:15:02 +0000
Message-Id: <20260719161502.DE8DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Removing 'port' from the global required list without conditional =
replacements allows all panels to omit their display controller connection.
- [Medium] The schema fails to apply the dual-LVDS binding for the new dual=
-channel panel, breaking validation for pixel-order properties.
--

--- Patch [1]: [PATCH] dt-bindings: display: panel-lvds: Add boe,dv215fhm-r=
01 compatible ---
commit dda569bad0ff68efade6e9633f374c324001833a
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

dt-bindings: display: panel-lvds: Add boe,dv215fhm-r01 compatible

This commit adds the BOE DV215FHM-R01 21.5" dual-channel LVDS panel
to the panel-lvds binding. It also removes the global port requirement
to allow dual-channel panels to use the ports topology with separate
port@0 and port@1 nodes.

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index b89f86bc06837..584818b2df6ea 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml

[ ... ]

> @@ -72,6 +74,12 @@ properties:
> =20
>        - const: panel-lvds
> =20
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      For dual-channel LVDS panels, use 'ports' with port@0 for odd pixe=
ls
> +      and port@1 for even pixels instead of the single 'port' property.

[Severity: Medium]
Since the boe,dv215fhm-r01 compatible requires dual-LVDS properties like
dual-lvds-odd-pixels and dual-lvds-even-pixels in its ports, shouldn't this
schema conditionally reference /schemas/display/lvds-dual-ports.yaml?

Without referencing the dual-LVDS schema, won't these properties fail
validation as unrecognized properties, or fail to have their mandatory
presence enforced when someone instantiates this dual-channel panel?

> +
>  unevaluatedProperties: false
> =20
>  required:
> @@ -80,6 +88,4 @@ required:
>    - width-mm
>    - height-mm
>    - panel-timing
> -  - port
> -
>  ...

[Severity: High]
Does removing port from the global required list without providing
conditional replacements allow all existing single-channel LVDS panels to
silently pass validation even if they omit their display controller
connection?

Would it be safer to enforce this requirement using an anyOf block such as
anyOf: [{required: [port]}, {required: [ports]}], or to use conditional
if-then blocks to ensure validation constraints for prior generations are
not globally relaxed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-b4-lvds-pa=
nel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com?part=3D1
