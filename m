Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D218386553
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790027; cv=none; b=blldEywd6L3V3mTXThB9rgMxQWAOIZR0Wv5aWurmsiHnLBZnN9fuCsUgFOeThmHlWi0Segid9uqFJshcoawz3abvKX/w5YwpUL2F26yXMgFaWG8jYHHHK+xpdDUWFUESI3Yq/rjW01P899d6Zahp6uiVr7vEJy/2SDYZtItO0fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790027; c=relaxed/simple;
	bh=wc/xtD2jpIE4A18Vw327aokstzfZX8+AtU7pv5hHXP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yqa7e3khISJeM1W7TTYfrrrirl/knS4LW0ZF+zz8of0PNBWKudgorUA49FnDMGNCl1pKG1wqahg1ilMDkDP7IWhGfraAWNH00OuWn92pi/Zq20TEBF0N++i8g+h1gv74m+jbZHAg7pI8nbPaXHhiV36fbK+dCEW4fPABttVufrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McxIgYEO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McxIgYEO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0172C2BCB3;
	Thu, 14 May 2026 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778790027;
	bh=wc/xtD2jpIE4A18Vw327aokstzfZX8+AtU7pv5hHXP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=McxIgYEOm4XRD6tDSRK7qZi6fmXRO8mvVz0FVBHS5vjaaARWmQHNjf3CSMIjlnkwc
	 kdX8tUMliy57ydSaD31p7qwlIRCJauN41VRldWrBEL7oRhoNsTmDs7JsIsIjkMJ7c/
	 WJWODh40XN6DWrruFDN/hun4sajIV/cvIy6FYR4nk30Gmz9rFtl5oPT4yOis/zFh5K
	 X9Sh2/WGpbbizbIyjrgis6lw/P0TALLL1hhHCwysTlXcBXKTUg+ZBO+HHFtNTg8aBn
	 4CVqWwXf7qW0RMwNoiTOKq/Iwi0Ncf2RRpVziYu63MwYbqyJcPphYcGgy475Jx6WT6
	 zINwGUpenPcAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Chipone ICNA
 35xx OLED driver bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514-icna35xx-v2-1-45acd1dfa566@gmail.com>
References: <20260514-icna35xx-v2-1-45acd1dfa566@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 20:20:26 +0000
Message-Id: <20260514202026.D0172C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message fails to document the 'ayaneo,pocketds-panel-=
top' hardware variant which is explicitly added in the binding.
--

commit 36858773652523a7b2ea619de14533f16238e5f6
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: display: panel: Add Chipone ICNA 35xx OLED driver bindings

This commit adds device tree bindings for the Chipone ICNA35xx series of
MIPI-DSI OLED panel drivers.

> The Chipone ICNA35xx series of DDICs are high refresh, low power
> MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn Odin 2
> Portal and the icna3520 is used by the Ayn Thor top panel and the Ayn
> Odin 3.

This isn't a bug, but the commit message appears to omit one of the panels
supported by the icna3512. The binding definition explicitly includes
ayaneo,pocketds-panel-top:

> diff --git a/Documentation/devicetree/bindings/display/panel/chipone,icna=
35xx.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icna35x=
x.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.ya=
ml
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ayaneo,pocketds-panel-top
> +              - ayntec,odin2portal-panel
> +          - const: chipone,icna3512

Should the commit message be updated to also mention the Ayaneo Pocket DS
top panel hardware variant alongside the Ayn Odin 2 Portal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-icna35xx-v=
2-0-45acd1dfa566@gmail.com?part=3D1
