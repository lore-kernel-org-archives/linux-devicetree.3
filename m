Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910A3B777D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701064; cv=none; b=KtuwK2RfoNjFEFncwvuxWzHyuQpE2nsw0Aupow5dPDyScfWdwQ//ENqoimBaxTYV27XhDYer3bNomynIZKMwtMGnH2mISF1jKbX6RSDwt/iRURRCb9RxCDyz2pjwdWe8P1zo0pYiXUzxhYJiPOFIYKqoTUyuN6QlnOvPWd4j42s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701064; c=relaxed/simple;
	bh=rLaFc7m4iJb1ESk4V9vyFCFC8/ei7ziRicxS02tpFzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CZ7slzfAQOWcBF0MMztGRcFnAY/SnOT661a+SBLVWIkKjF16RjsQ1F0cAGZ3ugcAeQfJmm67DDd3k4dyxcXQJtcI4fjNYpCwC7z0IqAT5DTVz+9njzzDTGKC9FNlOX+dOXTcI0XcKAOxXRiFKfgUZ+iJub/drFDYDOmlDNJUktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCWL6JA/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCWL6JA/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE91BC19425;
	Wed, 13 May 2026 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778701064;
	bh=rLaFc7m4iJb1ESk4V9vyFCFC8/ei7ziRicxS02tpFzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZCWL6JA/REi5G9pfv+q2Kgi59dnqJdYW6xuuwaUzcoUbzLajg+hI+0Vk1CZxJnLYo
	 3Z14nqANi13G3+t7w9/B0Gnyw66OOx4UABsxq6UN8sd4ZkTi7MBc8xb09yxl5cQM3W
	 b6gO58UwOJiPmh0lALvWT93qrPnitGLCoJrH408Rw6pWnCAHfsLdf7KonMwxSb1V/n
	 4zWtNYGA2EyuulKy052fLCwsxDZY/IVjhgeNbbl810R6gw1cqWid0hs0OYuJrG9jxJ
	 yMR4R0W7ZGf5EKOgwKy/9TlvrHR00/cVeBkEMG0Sqwc835erH4RJ4EheAkY62NdcVJ
	 cUutcbfi9U+Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512085358.1693208-2-wenst@chromium.org>
References: <20260512085358.1693208-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 19:37:43 +0000
Message-Id: <20260513193743.CE91BC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The LDO regulator `va09` is documented as being powered by two diff=
erent, independent supply pins in the DT bindings.
--

commit 91d90b748e83ee395e8498f7028062225c991970
Author: Chen-Yu Tsai <wenst@chromium.org>

mfd: dt-bindings: mt6397: Add regulator supplies

On the MT6397 family each buck regulator has a separate supply, and LDOs are
split into various groups with independent supplies. This commit adds=20
descriptions for all of the MT6359 supplies.

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 05c121b0cb3d8..9e60536779819 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
[ ... ]
> @@ -225,12 +225,62 @@ properties:
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        "compatible":
> +          contains:
> +            const: mediatek,mt6359
> +    then:
> +      properties:
> +        vsys-ldo1-supply:
> +          description: Supply for LDOs vcn33_[12], vio28, vfe28, vibr
> +        vsys-ldo2-supply:
> +          description: Supply for LDOs va09, vaux18, vbif28, vxo22, vrfc=
k, vrfck_1,
> +            vemc, vsim1, vsim2, vusb

Is it expected for the va09 LDO regulator to be supplied by two different
pins? It is listed here under vsys-ldo2-supply.

[ ... ]
> +        vs2-ldo1-supply:
> +          description:
> +            Supply for LDOs vsram_proc1, vsram_proc2, vsram_others, vsra=
m_md
> +        vs2-ldo2-supply:
> +          description: Supply for LDOs va09, va12, vcn13, vrf12

It is also listed here under vs2-ldo2-supply.

Subsequent patches in the series (specifically commit regulator: mt6359:
Add regulator supply names) clarify that ldo_va09 is exclusively supplied
by vs2-ldo2. Does this mean the reference to va09 should be removed from
vsys-ldo2-supply?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512085358.1693=
208-1-wenst@chromium.org?part=3D1
