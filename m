Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F34334D4
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783994; cv=none; b=Zz+loD5FkKAeb27XCoNhfRFSq4DKJCqgsH8gRaaX/YnFl0067TPvb/wJtV0aB3j3M1a4vLQM0IrvlGPxEX9y9He3k3xfoGOXxy7AaZeQhjLGv/jlSGC6nY2+AF0Zc1bV9HurcUZMbvwGldOjP6saQKmW4yfTxqe+gWget1YckAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783994; c=relaxed/simple;
	bh=jbJFC86QZFTh36n5on8CAr9duarG+l2tKMwEU0Bsnr4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T8lAys9ijnJJJ6HPoo+tRI+oPDyTXh4RNW2Yrf/EUkFMC84WgeaandXXBbv+KJlRttjd8Pa16OhvnboqBvW/iK+vNH4vW1QqwXPwQl3DDY9BL0S3XjUD/WE5w9X1rgmya06H0QyhcoA7mXC6HWkdDKUkKb0tRo6f801nkg045rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTy6mRKX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTy6mRKX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496561F000E9;
	Mon,  3 Aug 2026 19:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785783992;
	bh=KupbQ+6/ZLVWmEy2BVuAvhaLsOv6mXsqhNbcvwmaEaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VTy6mRKXPLPbvorympvkeDYYL5XoG1262ZWf0SN2+hv9lGFDEq60s5DzbAhPFfFB7
	 OO3nTZtw0qcqiGbi9gSeqIqLQG/SftYB5mKJrc0kL4npbWMmH7rAtC94DPsg+X2zg7
	 8EKRDuJbbtQuT9tSR6IsPRNtQN1JoTk4Wnwvh4AN4b3dNf0RnK22Xkjjp3EnLIPf3m
	 5XUnvOokQnL2phZyXxp7mPiWU5TXtS5ntv4tuNzyRzP47eMyVaCbF7Mio+RxfZAqAP
	 xrwt/Wvm354CyWhq8xJ7SVTwh1+WvtLEh5GP9QWnj5nWL108KhSBf4yX6Vw61/cLpH
	 nYuUHXlZw/E7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 21/22] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-21-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
 <20260803-synopsys-dw-dp-improvements-v9-21-2e6e46135312@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:06:31 +0000
Message-Id: <20260803190632.496561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Changing the `#sound-dai-cells` constraint to `const: 1` breaks `dt=
bs_check` for existing in-tree device trees.
--

--- Patch [21]: [PATCH v9 21/22] dt-bindings: display: rockchip: dw-dp: Fix=
 sound DAI cells ---
commit 843ed61619d9c1e4f037cc1104f1104af5111210
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells

This commit updates the device tree binding for the Rockchip DesignWare
DisplayPort controllers to support multiple DAI interfaces (I2S and S/PDIF).
It changes the #sound-dai-cells property constraint from 0 to 1 to allow
selecting the appropriate audio interface.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw=
-dp.yaml
> index 2b0d9e23e9432..c4f8959dd65da 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml

[ ... ]

> @@ -83,7 +83,8 @@ properties:
>      maxItems: 1
> =20
>    "#sound-dai-cells":
> -    const: 0
> +    const: 1
> +    description: 0 for I2S, 1 for S/PDIF

[Severity: Low]
Does this strict constraint change break dtbs_check for existing in-tree
device trees?

While the commit message notes this is an ABI break and that the mainline
rk3588 DTS will be fixed up separately, changing this directly to const: 1
causes validation warnings for existing boards.

Would it be better to temporarily allow both values using an enum: [0, 1]
during the transition to preserve CI and bisectability until the dts updates
are merged?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-synopsys-d=
w-dp-improvements-v9-0-2e6e46135312@collabora.com?part=3D21
