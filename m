Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02EE4457C6
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457809; cv=none; b=qh3D7oJbX03MqRq73zyexD+Gxa3+n+N3+KqIgHF4YyndJALsN01Czgr1eCu4AXxc1SbGpX6cCbZ5WXBBsf1Xn5TqkvzAa+MvDs1zBLH3e0hNxOBGlyuo5UkVmX6RcOHyPifFi/kYI1w+7sv8g8CJLccfR5fd5XwoP2xNQTkpXf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457809; c=relaxed/simple;
	bh=oUEQWD59IYJeqmeltamh905cINZJrRvnrE+HF2Fxl7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KXB6HSwpsvHWNlagtkEhT9HZvG5TME96A6Ai5Y3vT22KmE2QnFoaoqwPC2g2psX4MRQ0k2XamH3vSRvUk4f85QSVvW+wPsut9mAVCMaK3xDS18s15h7Ykin/1PoTzCVSMLVg9HoM1bIVfbBPv0OcWLuyBCvnn5NBxYNU4nLZ1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=De3Ns3t4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="De3Ns3t4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C0D1F000FF;
	Tue, 15 Sep 2026 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789457807;
	bh=+h9++YxbdyS915twl25S2oQKGwfAxLEwTBud6HdsXxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=De3Ns3t4iFogFruK9wvA748v4aakTzN6Fod4dLFQC4Qcs/tzB2MwRLrsB2YNJK/Bq
	 v5RDS1fE0AJxTyeYZqRk8TY3X5RwI2NcqBfhHmmG4ZjI8wFDK9sjiY6aYE8v79sPbE
	 uo+U0T4L4sOIaMgUjyJeIlfqfVQo1iRUmkXe5gIAVIedJAnEaeWiLFIGsfwwConAhn
	 AKWFCnRH/x1BUPRMYc5C64GTeVWoDdPgnHsC1ux7wTvU9LHpJlSiHQ4Sae64ay39GZ
	 5RU48EFwCyvFN2DBxm6FtjZxXxKrtyu7xDawtgiWJCTPH4ZhFcBIULsfInii01/CGo
	 NpSR4ve78i1dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: display: Add ITE IT61620 MIPI DSI
 to HDMI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pet Weng" <pet.weng@ite.com.tw>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915-it61620-0714-v10-1-738e2a662c06@ite.com.tw>
References: <20260915-it61620-0714-v10-0-738e2a662c06@ite.com.tw>
 <20260915-it61620-0714-v10-1-738e2a662c06@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 07:36:46 +0000
Message-Id: <20260915073646.A3C0D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing maxItems constraint for data-lanes
--

commit 17bcf4f8b4142033bbe40bc85ad49b91b1b814ab
Author: Pet Weng <pet.weng@ite.com.tw>

dt-bindings: display: Add ITE IT61620 MIPI DSI to HDMI bridge

This chip receives MIPI DSI input and outputs HDMI, and is commonly
connected to SoCs via I2C and DSI. IT61620 uses a separate compatible
string from IT6162 due to architectural differences.

> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it61620=
.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
> new file mode 100644
> index 0000000000000..d4f0edeecd0e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml

[ ... ]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Input port for MIPI DSI
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            required:
> +              - data-lanes

[Severity: Low]
Should this data-lanes property include a local constraint to enforce the
hardware limit of 4 lanes?

If a user configures a device tree with 5 to 8 lanes, it seems dt_binding_c=
heck
will incorrectly accept it. The endpoint schema inherits the generic limit =
of 8
from video-interfaces.yaml without imposing the local hardware limit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-it61620-07=
14-v10-0-738e2a662c06@ite.com.tw?part=3D1
