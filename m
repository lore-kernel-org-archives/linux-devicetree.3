Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E073D902D
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 18:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785090288; cv=none; b=T3G3/NIcTDQqu6SmyIhCS5kpdtquvGYpOSGwGtXC/BGzBjdc34WbVfMRy1i/jFYgsouUM5D9yaI5sEEuzoObQw+hLe8ySHmeACfOz4Oxmiy2t5hYIPNO4P/dGgSvyuWWc3hBSkbrXlMiQv7WUgvvvoHQAJeByBydlU0FQPEZYoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785090288; c=relaxed/simple;
	bh=NuHAVmxriYK6GkpSmM9IseSHfYDeeNXxILXb2aDd8Q0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AK0JTek2dRj21fRsmoA2Fxe1N9+oWTv95EabLxVfnnChJ70ss1rXbJKtmdYnrsVSMXCIhxk8w108DViZ7T6Y8jim7ffYe1brhDJTSndxLZ02BXku+lXidd7HSBQfWHLCJ2JAzPzLeBZtEGnTMxqjEVbJEkMvQC5Y1NZxCLvesGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtfpMxFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtfpMxFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24501F000E9;
	Sun, 26 Jul 2026 18:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785090287;
	bh=2HJI88wepsFswpz9sYN6tQwWj+T+30jUsY/vwyXj3Lo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FtfpMxFsPmvC6nchrrG/SiczRg0chrpWvMG7y1hJQwPUACYEw055mXAgLff+dsp+A
	 TVqQlfe77qvm6ArClAg0iPlllzDSLf3RYiWxvubPARpzhS4a2F326ScMl5BLNkqNPI
	 diYU2UYYKOvwc8ooWJx96cdwmFGr5DEWapKpE6huZRZSbn0e/XFUWrPMw3wt1SXhgb
	 HicB3uS4BQhpCOgs2go/l3PpBDno9OxDfMtSl5FRz1dTVtVq7MBp39ufGyHNkEX2nf
	 Tkd3asbMXNQFMgxPX+ZCIauE5FqwSqVH+Qzt1k6EdYUDVMLLpPEvc5zq5y3nlu96IF
	 5x4/998PNbVQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add Orbbec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260726182158.249449-2-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
 <20260726182158.249449-2-robazzalberto@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 18:24:46 +0000
Message-Id: <20260726182446.E24501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new vendor prefix 'orbbec' is inserted out of alphabetical orde=
r.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: vendor-prefixes: add Orbbec ---
commit 55024190d5a9225c41b52b0372720d44cc6a4378
Author: Alberto Robazza <robazza.alberto@proton.me>

dt-bindings: vendor-prefixes: add Orbbec

This commit adds the "orbbec" vendor prefix for Orbbec Inc., which is
needed to support an upcoming board compatible string.

Link: https://www.orbbec.com/

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 396044f368e7c..f205df64a0a89 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1213,6 +1213,8 @@ patternProperties:
>      description: Orient Chip Technology Co., Ltd.
>    "^oct,.*":
>      description: Octavo Systems LLC
> +  "^orbbec,.*":
> +    description: Orbbec Inc.

[Severity: Low]
This isn't a bug, but it appears the new vendor prefix was inserted out of
alphabetical order before okaya. Should orbbec be moved further down the
list to maintain the file's sorting convention?

>    "^okaya,.*":
>      description: Okaya Electric America, Inc.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726182158.2494=
49-1-robazzalberto@gmail.com?part=3D1
