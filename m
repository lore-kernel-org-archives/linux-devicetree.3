Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59578390200
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919291; cv=none; b=s0nMhWIETpkXcMHX4wZSWxLeO5VG+qSRNeDlFOIkHHUDG6NO4hygHYlL6evO7QPLnfoQ6yGj6ui6y7dL/a+3rE+vtlLmuSj7xksHKj9QbS1XXSxltl20PyTtVnqNZLs1V3vIuk4FXGRiH+10tiZ/5kYFxMAVzbq5StCnul6skE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919291; c=relaxed/simple;
	bh=DnBE3RoRaz+yEm1lum1DfDBvx7ETMVQcmhnFv/vdmj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=At6R2vsZ9Ifa4V73k0aA8xhVYh7pmZBZEQsvZ8aeAnH/OhD+iSkTACHCWF2P4pE6bB/Kyl/IOkeYBG2iCvftcSsMZV2wWtEnD1RchJaMjxp+bCw7oN3S/tx2wPCj8pB7yP8WbdR3dskMJ11bV+/IOA6V2j+v57F3b9ogxX8BC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omMxzNTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omMxzNTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4001F000E9;
	Fri, 24 Jul 2026 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784919290;
	bh=eb26OAfco3uffdPcqncNqeLr8DgPBJuAarHg9Y1si9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=omMxzNTLIYq1qWGIHwhi9Eu46GXA2a/7QO5dtw3zMUo8MpaJIV62QQ23zY3kt0aMD
	 5l7c5TxdhnVN8cJpOVY57xMvhHIHQNWWFbWZHrry0kj65ZqdbyDyT/ia2Mg6Wjvg6F
	 KL30Myaa+B0LhuKy2OBIQc/3bCGl+gcgwxuyPGObKQclG6KZCgQwucRhcsOvdnWTV1
	 BfWadNYH3+QtAWJ6uP5HFTzNJbeUQvGlFS9qFqkzRluMWsqgJOJ0Slj44Ippe1H3QI
	 aBc8uCiA01DY7odJNjmEmZnJp/kXYrz8fKr479CRLGckxNALC0JDvAaqOTt4+vEucG
	 mVRboFbHa67Kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/3] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260724184523.193661-3-ansuelsmth@gmail.com>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
 <20260724184523.193661-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:54:49 +0000
Message-Id: <20260724185449.8C4001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added drivers/phy/airoha/Kconfig and drivers/phy/airoha/M=
akefile are not covered by the MAINTAINERS entry.
--

--- Patch [2]: [PATCH v11 2/3] phy: move and rename Airoha PCIe PHY driver =
to dedicated directory ---
commit 83a3c170a5f0894b166822d36bf49798d65f73e9
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: move and rename Airoha PCIe PHY driver to dedicated directory

This commit moves the Airoha PCIe PHY driver to a dedicated directory and
renames the files to specifically reference the AN7581 SoC. It also adds a
new Kconfig and Makefile to the newly created drivers/phy/airoha/ directory
to support future drivers for different SoCs.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb7836a27b177..bbfaca572118c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -765,8 +765,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
> -F:	drivers/phy/phy-airoha-pcie-regs.h
> -F:	drivers/phy/phy-airoha-pcie.c
> +F:	drivers/phy/airoha/phy-an7581-pcie-regs.h
> +F:	drivers/phy/airoha/phy-an7581-pcie.c

[Severity: Low]
This isn't a bug, but should the newly created drivers/phy/airoha/Kconfig
and drivers/phy/airoha/Makefile files also be included in this entry?

Currently, get_maintainer.pl might not automatically include the Airoha PCIe
PHY driver maintainers for patches modifying those build files. Could this
entry be simplified to cover the new files by using a directory match like
"F: drivers/phy/airoha/" instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724184523.1936=
61-1-ansuelsmth@gmail.com?part=3D2
