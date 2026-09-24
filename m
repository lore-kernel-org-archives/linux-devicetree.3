Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFF735B65D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275593; cv=none; b=GHxLEZSX84y7+flL1sFuclMAi3tT6EQhm7Vb066lkG5JHWrBcxVcJDhFXxK5chL0VPP50kuVzxhpKqkrfJmIhG6eapBOOgHkIGP5EufFmQb8CwaB0vLKXmz44KzIizKkRw1gdz2iYrEIB5tLjvY3i+B3lubEbRPY6f+D8b30tQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275593; c=relaxed/simple;
	bh=k+3EQhwdGAFzV54ftHxEv2uCnduHPLHry3XRxLoPyfc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aFYCn81pJq1KbOR/WUHPAMG0tz+7cztS79XPmTflBfDzOQo4Sc7cSpwcAFxQxBm3/vLNs7+H77Jz9iN9PlMRWAMg7yTtUkVfufFM/+ImnvroF481mNYjZ1ccRXML0/2j9KtgKUxh8WiRxlKM+KWdmmQRv2+4X3+9SXODJzLTCAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0OZAaA3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0OZAaA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90821F00893;
	Thu, 24 Sep 2026 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790275585;
	bh=vzn+0dPzSurpfTL0JAEZok0NxT0u0SmgjCrKPWYfn6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R0OZAaA3GM3W45bSmIBd69N6DiiHpD7x37CbJku17QwpwCc3p9xwkivR1sSRGOMWu
	 3FqjYMZErv4efENUC89aQJBFYE8apeLP3lpvq/rMnGnHhwW7NpTKvuLhJBEMFSFW1V
	 iG/jjMRtUlZXM0s5p3jZdAA+kuX7HYCqRbaqoMOAtFnq682Djtb5sqY3ADw4+3fFpl
	 N2/pW99PS6aYQFlrg9x6YCo+g8Sd68wFCC31k75Rvd1FWHZUXCEX/lXb0YOHdDbe7V
	 Ao2jToKAmkWh0IAmNldMi0YlOO3ieIRvi0IzIcpe9f+Ornto2tzAhYapTks2G7xAaw
	 SQ6x2nOAusOjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260924183855.1393302-2-petko.manolov@konsulko.com>
References: <20260924183855.1393302-1-petko.manolov@konsulko.com>
 <20260924183855.1393302-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 18:46:24 +0000
Message-Id: <20260924184624.B90821F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing 'draeger' in vendor-prefixes.yaml
--

commit 9008bdf7e34160e9c4b4b83e8d008ed19bb9882a
Author: Petko Manolov <petko.manolov@konsulko.com>

dt-bindings: arm: fsl: add Draeger M48 dual-cpu board

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other. One of them is imx6,
the other is Altera SoCFPGA Cyclone 5. The imx6 parts used in M48 are
imx6q and imx6dl, hence the two bindings.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 86876311ec59a..2abcae70f33b8 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -260,6 +260,7 @@ properties:
>                - boundary,imx6q-nitrogen6x
>                - compulab,cm-fx6           # CompuLab CM-FX6
>                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> +              - draeger,imx6q-m48         # Draeger imx6q variant of M48

[Severity: Low]
Is the draeger vendor prefix documented in vendor-prefixes.yaml?

Adding this compatible string without documenting the vendor prefix causes
schema validation tools like dt_binding_check and dtbs_check to emit
warnings or errors.

>                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
>                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
>                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM

[ ... ]

> @@ -458,6 +459,7 @@ properties:
>                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitroge=
n6 Lite
>                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitroge=
n6x
>                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48

[Severity: Low]
Does this compatible string also require the draeger vendor prefix to be
documented in vendor-prefixes.yaml to prevent schema validation failures?

>                - eckelmann,imx6dl-ci4x10
>                - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
>                - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL So=
M on Avari Base

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924183855.1393=
302-1-petko.manolov@konsulko.com?part=3D1
