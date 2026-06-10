Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10603B14D2
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081736; cv=none; b=CX3KKJY86R98EiAifmm9fbujtFwTLXFSs928gXjYVBmiGtqbFEUXZJeey1djp2BxbDOTDXb/ko5Gz2aKfQ89uqkwhR2esx2zQwVUQYofmfQvEGVO1BweL5oqLNnfTqwQVelNtOcjSFGnGo88bpBjvKXElK+/7IVc68KEdHGkHMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081736; c=relaxed/simple;
	bh=2Ue6L1lmxGXOGJQEgij9zhvyvTPp5/79eKlMcCxDd/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cUrYJMVr9x59Hh6OIX5kvj1cE+l6iB/wBIBXR4+wOHWoar9iasi+ueWD48F0LInNQdjHvBvGjMghEUebqicGJ3rvHPd7sudrIWGLjysxv4LA5P+9cslzO7U6H2kQlajo1RVK2LV9/DMhtJGs8hEzRxXOqoyU1bMVtgNi4n6mZh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5287b4J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5287b4J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D2D1F00893;
	Wed, 10 Jun 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081735;
	bh=bdXSAgTnBoBqjzn69bwO/SSCQIBKDmceLIPebweWGuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A5287b4JOfN8K8Euq688ms3HsKIbMZemjX6DF5Hk1gmNb/D7d2PrSUkfjN+TKt+80
	 /ZKKGpB7anIs7TuWjmyYwpN0Zs+q1ET1kkutUWPFdtsKeSFQVOka3mgyVjU7G3JiyB
	 fH07JG6GHpGvFwV8yxP1MHYVDOSK/7QO7nhImsK06i8CtRifZFt95IeJeJSP97qy2E
	 vVPuP4preObRfngwPhwkW9MTRG6sWK28zM8A2wquvdV7GhNtdtr3NyfnIgu6mgtOiV
	 QrW/p6XaxP9kvGuA2QO1LPZNuSAmcZnXKEk0mFQ9uNHxgwC6LTCTa0IS2RJea7mXAC
	 +cU1k8Lz2OiIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/16] power: sequencing: Change
 CONFIG_POWER_SEQUENCING to bool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610084053.2059858-4-wenst@chromium.org>
References: <20260610084053.2059858-4-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:55:34 +0000
Message-Id: <20260610085535.56D2D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly justifies changing CONFIG_POWER_S=
EQUENCING to bool by falsely claiming that USB support is a boolean option,=
 which unnecessarily prevents building the power sequencing subsystem as a =
module.
--

commit 80f4a7ca3dbefd1dc2ae2274d131e8b5461c5c66
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: Change CONFIG_POWER_SEQUENCING to bool

This commit changes the POWER_SEQUENCING Kconfig option from tristate
to bool, citing that USB support cannot be built as a module.

> USB support, including the core and hub driver, is bool, no modules. To
> be able to use the power sequencing API in the USB core, the former must
> also be bool to avoid the latter being built as a module.

[Severity: Medium]
Is this description of USB support accurate? Looking at drivers/usb/Kconfig,
CONFIG_USB is actually defined as a tristate:

config USB
        tristate "Support for Host-side USB"

Since the USB core can indeed be built as a loadable module, does
POWER_SEQUENCING strictly need to be restricted to bool here? Could standard
Kconfig patterns like depends on POWER_SEQUENCING || POWER_SEQUENCING=3Dn be
used instead if linkage dependencies need to be resolved?

> diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/=
Kconfig
> index 1c5f5820f5b76..27448fba9dc5d 100644
> --- a/drivers/power/sequencing/Kconfig
> +++ b/drivers/power/sequencing/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> =20
>  menuconfig POWER_SEQUENCING
> -	tristate "Power Sequencing support"
> +	bool "Power Sequencing support"

[Severity: Medium]
Given that CONFIG_USB is a tristate, does this change unnecessarily prevent
the power sequencing subsystem from being built as a module?

>  	help
>  	  Say Y here to enable the Power Sequencing subsystem.
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610084053.2059=
858-1-wenst@chromium.org?part=3D3
