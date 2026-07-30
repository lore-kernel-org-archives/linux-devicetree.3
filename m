Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD52741F7D7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413539; cv=none; b=Mfwb2LQiOyiNDWJcTaLbym6nWlIVxgFoFL+5xhJPhpDW1P9Uevgk7EBfWaQYAYNGVkMBXj7GBOx2XX+BmuOjNmg89z9upyZJGTlskBdgahQ7lEk2MaAhZaGhMR08KY/BpyhOPYsOp7rjjSvbVj1wglZ8a3JrfWhWOLABNacw/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413539; c=relaxed/simple;
	bh=pmIiM8bvMfTPWvAmAoVZrzMGeOTSSwbfaLWTI1qS4mU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DLwPQMOE307XHyWW60DbrNPlDveK7FvOSUA9vGFxsFm3d/Inyg2juUB7zvMYTyWndwJdH1PyjNzQ2taqMIlMoqZbmDh5jPbDUZKiyiRUOWKcs6hdOWMYgwO4UOfx/BBZ7Y4LvOpU5OVAzHwzzeT+OVI2XhZ5rSOSSrzRvQVyWwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jx2DIk+l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jx2DIk+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399761F000E9;
	Thu, 30 Jul 2026 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413538;
	bh=wTUjmaE2w/SKECfbH4HneFELyDhu6TtTVC7H7s/hvzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jx2DIk+lPD7Ad+NRl8ZQ/qad2awNajx4yILNmGwDUerN+aL7lfkbzeXktwIYH/OVp
	 aRZePM8nxh3HRphwwHDS1OuMVnnxKg/AXLdkIFTouWz9W9Xiwi04/mZCFXquDHogNE
	 9OaI4+ib8zmUeiIx+/D8d0bI4nFEGIAvZXj0GW3+S4dkDK/fzd8MSt31d9dKUA/w6C
	 hzawq0N68EkusJyjuVRm4b/OA5ty3V/szmXeGywtjOslIo9jyv/NqfXTW99rAPVczx
	 iqByXhZfDpORJGoN+wSNbOyp0MLFL2hnIta22EUsxmpDFbG03qlFDweUwAB7hvA0Hj
	 WRPHxNuKSbJOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, media-ci@linuxtv.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260730-x1e-csi2-phy-v15-1-f284131de1fa@linaro.org>
References: <20260730-x1e-csi2-phy-v15-0-f284131de1fa@linaro.org>
 <20260730-x1e-csi2-phy-v15-1-f284131de1fa@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:12:17 +0000
Message-Id: <20260730121218.399761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The schema explicitly permits the CPHY bus-type, contradicting t=
he commit message.
- [Medium] The `data-lanes` property lacks an `items: maximum: 3` constrain=
t to restrict physical lane indexes.
- [Medium] The `clock-lanes` property is implicitly allowed in the schema d=
espite being unsupported by hardware.
--

--- Patch [1]: [PATCH v15 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY =
schema ---
commit 2ff6f092cd049b723d7a175d8013e50897b62b79
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
supports both DPHY and CPHY operation. A special mode of DPHY operation -
called variously split-mode or combo-mode also allows for two sensors to be
connected to one PHY.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..8aa6ad2723988
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,202 @@
[ ... ]
> +        patternProperties:
> +          "^endpoint(@[01])?$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:

[Severity: Medium]
Since this endpoint includes a reference to video-interfaces.yaml, the
clock-lanes property is implicitly evaluated and permitted. The description
below notes "The dedicated clock lane is not described", so should
clock-lanes: false be added here to explicitly forbid it?

> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY

[Severity: Medium]
The commit message explicitly states "CPHY is left to future work", but the
schema permits the CPHY bus-type here.=20

Does this allow device trees with incomplete or invalid CPHY configurations
to silently pass schema validation?

> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                description:
> +                  An array of physical data lane indexes, 0-3, following=
 the

[Severity: Medium]
Should there be an explicit items constraint (e.g., items: { maximum: 3 })
added to enforce the 0-3 range for physical lane indexes?

Without it, the array values fall back to the /schemas/media/video-interfac=
es.yaml#
default constraint, which allows physical lane values up to 8.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-x1e-csi2-p=
hy-v15-0-f284131de1fa@linaro.org?part=3D1
