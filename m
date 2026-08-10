Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECA83F0750
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371264; cv=none; b=eyHnYRaW21+xP4fHg1CCsWr+/gy3BxrY2DLgU2URfZ8XvIVG04iXbUG7xOQqQr8qvGSnekwpIhSiTw/GXkOL14Xtqi/CD+UsBSAA/0ffhlrTQNbyH1F0w2Xrgg9kIQwY55IZC52n5JsqmXF8t11c8s54+RJJRVDwFGZiAdsk0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371264; c=relaxed/simple;
	bh=8+/mw3YbSgqHv37L02jtzBNGnEoOPsRaNbRHPLZlqTI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=McuTtRScc8RJDO4Zq+FfY4E9BuypOP99OMb0k+3Ty8XYwXw3m2DW/eLjBKS0Y/kHLn0/gnaDMQi48VANF8FhYbl8PlkZR8cbvbosfGKmLcCCzkKGH6Toaiv54JCrWLd42CJzi+A6gbLY4Kuv8oMKZXqkWQR0k3+XhqZVcus28Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfbAFpoe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfbAFpoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414DF1F00A3A;
	Mon, 10 Aug 2026 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786371259;
	bh=Y68clvviUq4881MdozP3wrES+UU6Goh1SxrXmxhHuWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XfbAFpoe8Ahbo6rh0wyGSpWwIP+xLbm5BXXsyhhveU5x/JgkBV7PxE8EnLNh8sI5w
	 99pvytETPG/rdEXktdG5DNGUl8UjC+GPb0mWIStkdZCgOe7Y/7VbEk/Fe4qmkVMQ1k
	 HlVk/N4fMHY/p49IHU57viUINs/PF+Yqs+V1WJS7PIKpU969U0o3wcMFP/habwRYF8
	 jI6jqwgTuDrlz0HuSSZ4+inTtqEJ3YgzjxHS1h1dvU/o1CcegBeyjEBmXPBlwI76D7
	 wv0jD5pdOPyIFB029ERHs4pqRHnKevON1H4T8UmPPQHM0Zi74kEb+Tq/qWgSrHxa1r
	 CslZz3Cezq4+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: vf: add Iris carrier board support for
 Colibri VF50 and VF61
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810140053.2793495-4-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810140053.2793495-4-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:14:18 +0000
Message-Id: <20260810141419.414DF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing Device Tree binding documentation for new compatible string=
s.
--

--- Patch [3]: [PATCH 3/3] ARM: dts: vf: add Iris carrier board support for=
 Colibri VF50 and VF61 ---
commit 5035e51faad7bb81da2db6e831c70fb93999bdf7
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

This commit adds device tree files for the Iris carrier board when used with
the Colibri VF50 and VF61 modules. It introduces a common device tree inclu=
de
along with specific device trees for each module variant to enable hardware
interfaces.

> diff --git a/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts b/arch/arm/b=
oot/dts/nxp/vf/vf500-colibri-iris.dts
> new file mode 100644
> index 0000000000000..53dd252f3b769
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts

[ ... ]

> +/ {
> +	model =3D "Toradex Colibri VF50 on Iris Carrier Board";
> +	compatible =3D "toradex,vf500-colibri_vf50-on-iris", "toradex,vf500-col=
ibri_vf50", "fsl,vf500";

[Severity: Low]
Should this new compatible string be documented in the corresponding device
tree binding file? Without an update to the bindings, such as in
Documentation/devicetree/bindings/arm/fsl.yaml, running make dtbs_check
will likely result in validation warnings for
toradex,vf500-colibri_vf50-on-iris.

> +};

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts b/arch/arm/b=
oot/dts/nxp/vf/vf610-colibri-iris.dts
> new file mode 100644
> index 0000000000000..2882c8783c280
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

[ ... ]

> +/ {
> +	model =3D "Toradex Colibri VF61 on Iris Carrier Board";
> +	compatible =3D "toradex,vf610-colibri_vf61-on-iris", "toradex,vf610-col=
ibri_vf61", "fsl,vf610";

[Severity: Low]
Similarly, does toradex,vf610-colibri_vf61-on-iris need to be added to the
bindings documentation to prevent schema validation warnings during build
tests?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810140053.2793=
495-1-mehmet.fide@gmail.com?part=3D3
