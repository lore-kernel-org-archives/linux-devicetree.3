Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874474D0A03
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351678; cv=none; b=uocwL1OcsvQjtZ1I0sJncuXYvlFnyN/UDyFnbx5vQDHLRg55ZRKPKGlfKrgVFoqvS9lB4AffNPSoZG/CSSXAmSS13lO9+q5Zuv0or6kFpKs9g0U57cgz14tkMXnO9wle5wWuG7QO7X/3AdjI4Zwt/oeHhFMHdWgnULSCXe8QD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351678; c=relaxed/simple;
	bh=hOVeeiRGKBOVaP9c0I07XD1oLeh2IrU5kHbvEh+YhRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WrxirohpkEpIumT+CLMMbIFRlkR3IXnEJe36VdxmAzetOMQhw7vyU73e34KEOUuQjpJ/RqGPI8HRmv6EeqjkxW/BNKD3zmPjH8esZkFSzjVQRpISxjTR6oev+e+BdAPi0XY4s38bsydPpz2qOUMMaHw01znr+CIRLolVV1KHsUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khpWFvqs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khpWFvqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2701F1F000FF;
	Fri, 25 Sep 2026 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790351676;
	bh=9SwRCfsXo9QmZtYv2xZ4UaOdTTMLheyO5Njmy37oSvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=khpWFvqsxZs3a4qwDk4Tkb2UrTWiOS8ceGZ5bQ1aV1BMxSlT37vAgAi0gxjmBZpdP
	 WT2ZP0BHQToA5wyAAccqZ5cNYRUBDrieBCkIZcLy+YnBMdasCZPiTUqEHeShDu90T+
	 sOjD2IsX4batNatfDUqQ0F2ZZKTaGqEikptsiL30zdzjnbgjyfrTt+gDy+ospd9gPj
	 07+HCitB/ER78ed34FCnYEzWd6qeG82mVMdyrilh1y5MCDb/PPaUJjZK8xCPMjZCZV
	 XOPAz+q429SfKEZD3fenoe0KkZsdjVwKpNp8geEV3eT5AUcrdOzCKasQ1nH3Cb7NLu
	 vYxICkTAqYPbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add bindings for MT6735 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yassine Oudjana" <y.oudjana@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-5-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
 <20260925-mt6735-pinctrl-v9-v9-5-bfb19d8bb87c@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 15:54:35 +0000
Message-Id: <20260925155436.2701F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] MAINTAINERS references nonexistent mt6735-pinctrl.h file
--

commit 9e8afc5717d48e9d3432a4b635154c2d3231da7e
Author: Yassine Oudjana <y.oudjana@protonmail.com>

dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add bindings for MT6735 pin =
controller

This commit adds device tree bindings for the MT6735 pin controller. It
updates the YAML schema and MAINTAINERS file, and introduces a new header
with pinmux definitions.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9765e8a72dc78..3b309160440b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21850,6 +21850,12 @@ F:	drivers/pinctrl/mediatek/pinctrl-rt2880.c
>  F:	drivers/pinctrl/mediatek/pinctrl-rt305x.c
>  F:	drivers/pinctrl/mediatek/pinctrl-rt3883.c
> =20
> +PIN CONTROLLER - MEDIATEK MT6735
> +M:	Yassine Oudjana <y.oudjana@protonmail.com>
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

[Severity: Low]
Does this MAINTAINERS entry reference a file that does not exist?

The patch actually adds include/dt-bindings/pinctrl/mediatek,mt6735-pinfunc=
.h
to the tree, but this line points to mediatek,mt6735-pinctrl.h instead.

Could this cause the get_maintainer script to silently fail to match the
header file, potentially leaving the maintainer unnotified of future change=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-mt6735-pin=
ctrl-v9-v9-0-bfb19d8bb87c@protonmail.com?part=3D5
