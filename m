Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5BE371D1D
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 01:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991191; cv=none; b=HZ4pAgMb+KShfJ9SSmesH6buq2T7LYGUjqowv2Bq32qkhewl/Wxn3+6wIAaqa0M4T6NQDEx7fhBV9Zn1AANBf4/0UaLTAO5yjR3FeVG95JG+0RrVeXZsoXNBzvv6fx6zmZORwiA/f/1GyIoGMhdlbuXvGzGF8JDN3R9Tsw2S1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991191; c=relaxed/simple;
	bh=y5VIQoGOvr3Xj/lmqieZLh8C2n1NeaYvmHxvxDh2klU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u0k31bfzt7LvJH9PdXGc+zMOw28xyFLgKiRjANXtN+z6rQk8FNZbu4Na2++1B8fMjG4JXVeUVD38djpfzu5xjlr/GPinAWLXB8biBRh6oy2O+ogNFa7hRP2gn5guj+AVhbLcA76eQ0LC7/5rrdpn/ksBgn+RB+5gwOhyfpFaKqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUaJEW89; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUaJEW89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3AC1F00899;
	Sat,  3 Oct 2026 01:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991190;
	bh=DjTI5a+4OGtXjK/NYQJg67xdxQQetLXkDrqf+/95Axo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kUaJEW89kDrWZLiEm0Of5U5dMPWdhZlfJTGaYqBPhpcSq9+WqW493hy73Fm9U5odV
	 XuE1Tc2vU2Uu1G2JXgpQ097Bue0Z0+L55ljOL1bO9xHCm+PGUBFc0QF3PA2j3J0Cqe
	 lYNY9DXNEqVcd+L+uOqwq164YyVABdMIV9pyYlKw2pw4GrIDVtmaog5Jtb9HaUtMy2
	 MObT4WnEMdJKn6bluke+iaEDDR/0WSH7UDKiN4UOOyoiM/T16csq2bG9ySsZqn3DiM
	 fgNoZY7BGyvW6+zhCDIZXYvgh8isX+7sHEggeubuuDRADWSP3s/ui4ehFHMieXh+3W
	 EpCZRfz8YvvHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: aspeed: Add Intel JNCRP board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Glazik" <dawid.glazik@linux.intel.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <212171467173c9af64b3f8ecddca2a445b7e7148.1790344811.git.dawid.glazik@linux.intel.com>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <212171467173c9af64b3f8ecddca2a445b7e7148.1790344811.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:09 +0000
Message-Id: <20261003013310.1B3AC1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: unsorted compatible string intel,jncrp-bmc
--

commit 63032ee44f7295eca9a0a28d9b29cc74a0daecb5
Author: Dawid Glazik <dawid.glazik@linux.intel.com>

dt-bindings: arm: aspeed: Add Intel JNCRP board

This commit adds a new compatible string for the Intel JNCRP BMC board to t=
he
Aspeed device tree bindings.

> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 2c8180e49b2f3..6f7d77efb30c4 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -107,6 +107,7 @@ properties:
>                - ibm,sbp1-bmc
>                - ibm,system1-bmc
>                - intel,avcrp-bmc
> +              - intel,jncrp-bmc

[Severity: Low]
This isn't a bug, but should this compatible string be inserted in alphabet=
ical
order?

The new string intel,jncrp-bmc is inserted before ibm,tacoma-bmc, which bre=
aks
the standard alphabetical ordering of the enum list.

>                - ibm,tacoma-bmc
>                - inventec,starscream-bmc
>                - inventec,transformer-bmc

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344811.gi=
t.dawid.glazik@linux.intel.com?part=3D2
