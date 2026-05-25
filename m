Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25315347516
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696502; cv=none; b=F8f1DAhI+UC0CMI9Oi5hDbo7DwNF5PwtuZePop/v2WkDn/GfwL9rjoctfGmiBd6rXQDFCwmNYAtYnyb9ARojghIXVswP/J36ARwD7A7E0RQ9+THZHdZfCcc65E9lmG/6p9wj9oFYPHzW7f2gTz+hhhmW6Uj7P0emUXo1g340nVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696502; c=relaxed/simple;
	bh=IuwJ8eyz1jsBu8mpp9RiraJd1QW4me7fVGQn1BSMYCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=augq/AT79HC/D4tLG5NaaqlY8OAsVEyn4oXdtyX/9jia8ulJxwIr1GEbMQT/kii/5VrnBOYSPuLHho2q9iC4W/eUAM6LebTo8yzTnC/JK4ALGKvLvYPXEPbpcR35SEJ/x7sQAlfoqOWQaJ5QO1dYg0f2DhFsUaemx66+46546vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fC+LtF6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fC+LtF6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3E71F000E9;
	Mon, 25 May 2026 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696500;
	bh=X2XZnt6tmObyVXB+rcG2cBiFvAQkXmcy5d9dO5Kdpug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fC+LtF6uZy6rR6tkEDY6/38vVOgAWJcu7i7w8wkLcGmerz3thLILifOdL5eApz5Si
	 C0g8xgBt8tHX0boKtAR8yU8E8XLOW+iar49+t0jDKwVaj9zJ0PQfNnT05iHuahe4N2
	 G0tsGoEvJGi599gXdM2YBiS22DB6LJPsGcSEUAyNrxUwB4zhL2MNnlub0jx44A1LcU
	 q3WynkZWDpeslOJlIBmFh9NTY5MAkVbsBnBfakc+wZsCFtJ8M/nnNbyrKAxhTxlddm
	 yOjF12pQz56stEWxXSY/iG6IWNnZr6QKq5PJlJJvsHmPmU7e42OZIHMIL34YjoHbJc
	 xfX3M2ca8S6ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/9] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525064209.2263045-5-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:08:20 +0000
Message-Id: <20260525080820.8D3E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The binding lacks the required standard properties and node patt=
erns for the GPIO controller capability described in its documentation.
- [Medium] The schema claims to support the entire P3H2x4x family but only =
implements the compatible string and port constraints for the 8-port `nxp,p=
3h2840` variant.
- [Medium] The MAINTAINERS entry incorrectly routes patches to the list adm=
inistrator instead of the community mailing list.
- [Low] The `compatible` property is omitted from the top-level `required` =
list.
--

commit 046e7a899894c4ab96ab9fb9da8523aa5d9646fd
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support

This commit adds device tree bindings for the NXP P3H2x4x multiport I3C hub
family. These devices support upstream I3C/I2C/SMBus connections and allow
communication with multiple downstream peripheral devices.

> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Doc=
umentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 0000000000000..c080eeb0eeaa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
[ ... ]
> +description: |
> +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
> +  hub devices that connect to:-
[ ... ]
> +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connec=
t to
> +     peripherals.

[Severity: Medium]
The description states that target ports can be configured as GPIO, but are
the standard gpio-controller and #gpio-cells properties missing from this
schema? When hardware includes GPIO controller capabilities, subsystem
guidelines require documenting these properties and adding them to the
required list.

> +
> +properties:
> +  compatible:
> +    const: nxp,p3h2840

[Severity: Medium]
Does the schema fully support the P3H2440, P3H2441, and P3H2841 variants
mentioned in the description? The compatible property strictly enforces
nxp,p3h2840, which will cause validation to fail for the other models.

Additionally, wouldn't the 4-port variants need conditional constraints to
limit the target port reg maximum to 3 instead of 7?

[ ... ]
> +required:
> +  - reg

[Severity: Low]
Is the compatible property intentionally missing from the top-level required
list? While the select logic might still evaluate nodes correctly, omitting
it is a deviation from standard device tree bindings style.

[ ... ]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd163..c820bc5a55f57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
[ ... ]
> +NXP P3H2X4X I3C-HUB DRIVER
> +M:	Vikash Bansal <vikash.bansal@nxp.com>
> +M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +M:	Lakshay Piplani <lakshay.piplani@nxp.com>
> +L:	linux-kernel@vger.kernel.org
> +L:	linux-i3c-owner@lists.infradead.org

[Severity: Medium]
Is the routing for the I3C mailing list correct here? The -owner suffix
routes emails to the list administrators rather than the community mailing
list at linux-i3c@lists.infradead.org. This configuration will cause
developers using get_maintainer.pl to unintentionally spam the list owners
instead of sending their patches for community review.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D4
