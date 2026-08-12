Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27518421255
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531586; cv=none; b=CXGuE7VEW1biSbNpzPI7wIp6Arx+DijywS7W9FlGZ8dow0bwwtWCzU07Dq/A4Dpm5yQr9pMDVXAHFGpf/KwuhBSDonBZAbCQeTKS9f/gYwujUFA7h6+ePWD89mUFbThJTTkFQXTc8mquivBUs9DL4eXV2dIJJxUkYprk8FNGT9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531586; c=relaxed/simple;
	bh=vp33m9dP+Hljp2LeFJasTb7lyakY8eiNbEZ0oIfx048=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TvX2/WrtFiz1MRjbxIEpyG0JbSKJqLluxFFO3dnG2ysc2UKAOk+Fm8bWcae6SVBwbDr56mWaMiVWdL8iIrDmKpXPVY9pb486Bi54MsU6OQ5/SHAc3jpGpcgWPB8EVjBpREf5gnypVQjTKN70UyRVV/jmx+9r0tKlrh+oQpWhvHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLbYhqV5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLbYhqV5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8B91F000E9;
	Wed, 12 Aug 2026 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786531584;
	bh=3wq29MiYt1akMu/SDY5xwgMHdCpmGm3C14Yc5l8cSZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kLbYhqV5yA3LhbUdo7c31sGIdqgxwTVOaG5dJcmC0WPZE4HQHQDBTEa6fHJvlVVCq
	 oqEJqmTqqM04HG7bgVaB8qh4REJFlr5ij1ggyW6D1CAiJGi4GadL33G8/3djHRRHrH
	 xCTfKEv4z4Etgl2vk7MGOH2PSNkVeZpl1z+W3q8eyC/dYG4cIWIDIEbFGqsNM7JD+6
	 6/zm1T29HJYM6v7bXFd/mef1HJriu9AkMLUBQ9kkXNa1TqueQ2qnojDIaNtildo5dz
	 UDlRrRSTcJiuywRjgQ5/2FgH1Z0fv3eA4CMc2cEa8/uSnwWAHv8T7UIKFYjhaF1OaB
	 DRjVuCYKcDyhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert TI DA850 pupd to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812103621.1096140-1-egbostina@gmail.com>
References: <20260812103621.1096140-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 10:46:23 +0000
Message-Id: <20260812104623.CA8B91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree schema for pin configuration subnodes fails to r=
equire the 'groups' property, allowing functionally empty nodes to silently=
 pass validation.
--

--- Patch [1]: [PATCH v3] dt-bindings: pinctrl: Convert TI DA850 pupd to DT=
 schema ---
commit 559e4d94cd353ab8a1d382bd65a364531394cb80
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema

Convert the Texas Instruments DA850/OMAP-L138/AM18x pullup/down
controller bindings to DT schema.

Link to v2: https://lore.kernel.org/all/20260811111023.721262-1-egbostina@g=
mail.com/
Link to v1: https://lore.kernel.org/all/20260811092057.687155-1-egbostina@g=
mail.com/

> diff --git a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml=
 b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
> new file mode 100644
> index 0000000000000..21d439e08d4b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml

[ ... ]

> @@ -28,17 +28,17 @@
> +patternProperties:
> +  "-groups$":
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^(disable|pull-(up|down))$":
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        properties:
> +          groups:
> +            $ref: /schemas/types.yaml#/definitions/string-array
> +            description: An array of strings containing the name of a pi=
n group.
> +            items:
> +              pattern: "^cp([0-9]|[1-2][0-9]|3[0-1])$"
> +          bias-disable: true
> +          bias-pull-up: true
> +          bias-pull-down: true
> +        additionalProperties: false

[Severity: Medium]
Should the groups property be explicitly listed as a required property in t=
his
schema block?

Without a required: [ groups ] constraint here, a functionally empty node
could silently pass device tree schema validation. For example, a developer
could define a subnode like:

    pull-up {
        bias-pull-up;
    };

Since the kernel driver ignores nodes without target groups, the target
hardware pins would remain unconfigured at runtime without raising any sche=
ma
validation warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812103621.1096=
140-1-egbostina@gmail.com?part=3D1
