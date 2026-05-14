Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD492E65D
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738312; cv=none; b=qCoqPdsWLfDSqSnT9rcQrh8iErdIYp3uWWFradY9wG4ATHoHrOpPfrtDLAwfQjbzFp01DjCak30S4gLf0ueGsQt5njb20BVAUeG4qWP4q+aDEpMOA0ZCflfuCeKjKh9vlI+0NLIvdBHmOjghEy5/tkfZSzBhRVsf43jGVa2EW+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738312; c=relaxed/simple;
	bh=qcYi5KISca5JmQJ/B8v5xsnDubZ5i5FCApQ3Lq9X+Pg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iwKqRxcuUrDq5UGLryaA611fKUC6W5ZQPhX4kQTbEdrX/po4+6qt5yiHKUTaPixtl0h/cwVb2ch5X1Bfw3lSCBdSoeoqVD4GiNcr3JZ9DgRP20JWi+LJrO1GFNLh3GiP2dWHJ7QtbC7qZ5kJ7sMT3tuJKAl8oknmmc3lJWuGBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+MeLT7e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+MeLT7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3DFC2BCB7;
	Thu, 14 May 2026 05:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778738311;
	bh=qcYi5KISca5JmQJ/B8v5xsnDubZ5i5FCApQ3Lq9X+Pg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=M+MeLT7ecfac7bFTtIOAOuPReGtniGAWUfKQNoTMO54yZ6hx22fkAB1qpiliwq9zm
	 exGqscjYXz9HI9Jyjt24MFdb4Ttupoa7spGHyUPL/9iLNDANINGgT81TS+uTbX8BlG
	 EafAxcjdinbYAOSsKrYfLKxO+4ZrIoRVtRPqYWHPanNrc++Q+XPN7zi4kiIKJUj1IY
	 Oa9gRlPBODEgaIoWvr2VXhO+mitNG9+chGoWE3ab17XlrWX95TXsC1nYc8kYiBE2lM
	 qE/sXqaml77Fcks6JIV0TU/GSX7V7L0IPWebpc6Qs38SgWD8O0zcNXCv4Cz/6Nedp/
	 5ZDG8KinzRkWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add Sony IMX678
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513-imx678-v1-1-30fc593ed8fa@ideasonboard.com>
References: <20260513-imx678-v1-1-30fc593ed8fa@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:58:31 +0000
Message-Id: <20260514055831.8C3DFC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing Generic Camera Properties
- [Medium] JSON Schema Anti-Pattern in `port` node
--

commit 3c708026acd2beae088666fedca4311601c91211
Author: Jai Luthra <jai.luthra@ideasonboard.com>

dt-bindings: media: i2c: Add Sony IMX678

This commit adds the device tree binding documentation for the Sony IMX678,
an 8.4 Megapixel CMOS sensor that outputs pixels over a MIPI CSI-2 bus. It
also updates the MAINTAINERS file for the new driver.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> new file mode 100644
> index 0000000000000..bb348b6e4f1b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml

[ ... ]

> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false

Should this use unevaluatedProperties: false instead of
additionalProperties: false?

Under JSON Schema validation rules, additionalProperties: false only accoun=
ts
for keys explicitly listed in the local properties block and does not see
properties pulled in by the $ref.

This means any standard properties inherited from port-base (such as reg or
description) will be incorrectly rejected if specified in a device tree.

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - ovdd-supply
> +  - dvdd-supply
> +  - port
> +
> +additionalProperties: false

Does this schema need to reference the generic video interface devices
schema?

Camera sensors frequently require physical mounting properties such as
orientation and rotation to describe their alignment to user-space.

Because of additionalProperties: false and the missing $ref to
/schemas/media/video-interface-devices.yaml#, any board device tree using
these standard properties will fail dt_binding_check validation.

Changing this to unevaluatedProperties: false and including the generic
video interface schema via an allOf block would allow those standard
properties to be used.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-imx678-v1-=
0-30fc593ed8fa@ideasonboard.com?part=3D1
