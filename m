Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341583644BC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165181; cv=none; b=FUGTPFwWFKNeAfLcmPvQN89Wt+nyhrJ5BIyJib/3ud6gH5PbwzLdQ3tNylAUghxYUmcwy7rIGGkQxbPLyEnE/rwosMqavqFdfvytGFCBiH7nRdQBh/GdEe5YFqnzCrGCK5RYvWxgT+eba7juykzgUWGcCtI2ae36KWRtQJ+9KxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165181; c=relaxed/simple;
	bh=n7dVDacF2LeCrwV8kLs6Dj8fk6OCTFsxMYRPbrPCxaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NccaCs4YpOtoKaG4k/969FmaO+g2eVTbaqEqUlYcXuGpeh0zwf4179jY5jSvLLgmY6ALxC72PRjvlUJkHyTuykUHo0gGTnCLIKP6g1SzBkfzVvahkiM4IcKSzsGQYi7OR4b3xWGCzfpHhCo4aPPZFd1W+ayz9TwaeR/4xrtlPG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EionIH0o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EionIH0o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884921F00893;
	Thu, 11 Jun 2026 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165179;
	bh=ZfvX8nGXJCHbvZK7HHvWH99oIYlhxM69/j0f8E9KTyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EionIH0oOpyfc8U7f31x5nclZijLiclWYVUDZ0uitAFrJulxLZvwybq30Io4Vs+YG
	 GObcvPm+ntsLKyzJgAoGVQNYyWL2zy/qQ+el/iMI2oL5LKqU/lzasw2rLGakNCWClu
	 GN7M8jGX42D1oPUZ/L+NyHE4W7jzVC2XRSngS7bbSDZKR755kIknRG1Nz+lwHBqPnC
	 3PmdP3zjf3P4+f5dqkVoT/KUKCTD6a2nOOPThXYksqvFmbhYcXQDhjENECeOiKFpH7
	 GIDLlEO+sFhmJCu2JZmt/VDp7cey188lUXJwD5Z4wp5Yoaw+zDu/7xM6v5/NIm9H3d
	 suvNMS66PmMyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 gpio irq property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
References: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 08:06:19 +0000
Message-Id: <20260611080619.884921F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The newly added `hw-irq` property is not marked as required for =
the GPIO banks, and the example is not updated.
- [Medium] The custom device tree property `hw-irq` lacks a vendor prefix.
- [Low] The newly added `hw-irq` property lacks a description field.
--

commit 779e29b8c4c1e37224d568880fcfcc77220c1d72
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio irq property

Add the hw-irq property for each GPIO bank and enable interrupt-parent
for pinctrl so that gpiod_to_irq() can translate GPIO lines to IRQs.

> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4=
.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml

[ ... ]

> @@ -65,6 +67,9 @@ patternProperties:
>        gpio-ranges:
>          maxItems: 1
> =20
> +      hw-irq:
> +        $ref: /schemas/types.yaml#/definitions/uint32

[Severity: Medium]
Should this custom property have a vendor prefix to prevent namespace
collisions, such as amlogic,hw-irq?=20

[Severity: Low]
Would it be helpful to include a description field here to document the
purpose and semantic usage of this new property?

> +
>      required:
>        - reg
>        - reg-names

[Severity: Medium]
The commit message indicates this property is added for each GPIO bank.
Should hw-irq be included in this required list under the=20
patternProperties:^gpio@[0-9a-f]+$ node to ensure incomplete configurations
fail schema validation?

Additionally, the example at the bottom of the file doesn't seem to include
this new property:

examples:
  ...
    gpio@4240 {
        reg =3D <0 0x4240 0 0x40>, <0 0x4000 0 0x8>;
        reg-names =3D "gpio", "mux";
        gpio-controller;
        #gpio-cells =3D <2>;
        gpio-ranges =3D <&periphs_pinctrl 0 8 10>;
    };

Does the example section need to be updated to demonstrate the usage of the
newly added property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-gpio-to-ir=
q-v1-0-12201716f23f@amlogic.com?part=3D1
