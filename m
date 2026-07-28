Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138EE471CF5
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273827; cv=none; b=Et1sfjJ0bVQSlW0yy+spKLnhCHwu090JvwM/q/o8N2/pYDHhvGoCRNZzwBHGC4rQCqmyt70w2nhqnlELGVXmJQLrW/s98YqLXF5Mi6Y9wB1fb+zfG1egMnEyu05pHbIPMsdsqHP7XqttlAv6yK0aI/K+vGByZNpO2sJmDR/fwEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273827; c=relaxed/simple;
	bh=b8oJJ3oJi5FvCudewvdx7HBuEjOvvqUR3q65BZ+qfVw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KjSAu0rtcX3EbYe0Xv9sI4iqJYaQtpYszqCUK/DWFPJ8aLWdW1z7271ARlS++ixWFhJ19pN3jYM+QwwnY1qvxiGfa6vdquDvTC1p+LMZ3hX6rAOnT9VpWv/dvGZazK1fLku41OhXibdVUTkuMX9cugJHLICUmU25YlfQpSPl1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6NyyXll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6NyyXll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CFE1F000E9;
	Tue, 28 Jul 2026 21:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785273825;
	bh=cBNzvHvrhUzWguWPt1fv8eiFakAldAWqLeL+gPKOerg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K6NyyXllXitkID2y7q7twwOAglsJim6TyupJ67mJHhBTjTlXwpdDTgk7eo3xpxSE5
	 MvFdCjDTP/61L9LfEzPe8n50pGUw+st+QoBN09m3w0pCYHEk0PmVko/WVownJqpJgi
	 imePpaMpQ9eUZF32OsXlW8VbwGTMeMyegG9lJ3hkg8KEO0b6sovg1meg3SOjDs1vwx
	 AB2qyg5njihXq8FxemIHL221aMnJoW1GKBe4/R7J5oXT9jz5XBYs1Oz1RDekXf8hFD
	 GcaK77q6rDcCFQWXndrTlzrj7xOzfnfVxNoOLSpsVg8BdFmGygPq0989d7AW7iBTB4
	 dRNfjqK7txFBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Add a common board dtsi for
 Milk-V Jupiter boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728211020.1248676-3-aurelien@aurel32.net>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260728211020.1248676-3-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 21:23:45 +0000
Message-Id: <20260728212345.A0CFE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch incorrectly removes the original authors' copyright heade=
rs from k1-milkv-jupiter.dts and replaces them with a single copyright clai=
m by the patch author.
--

--- Patch [2]: [PATCH 2/3] riscv: dts: spacemit: Add a common board dtsi fo=
r Milk-V Jupiter boards ---
commit 97e4c73a96036da2bf4f3762abb7b076f18d6748
Author: Aurelien Jarno <aurelien@aurel32.net>

riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter boards
   =20
This commit adds a common board dtsi file for the Milk-V Jupiter board
variants. It factors out common configurations into the new dtsi while
excluding CPU operating points, which are left for the specific board files.

[ ... ]
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/ris=
cv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 3c16d0c20050e..9c4aa4f8a533c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -1,471 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
> - * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> - * Copyright (C) 2025 Javier Martinez Canillas <javierm@redhat.com>
> + * Copyright (C) 2026 Aurelien Jarno <aurelien@aurel32.net>
>   */

[Severity: Low]
This isn't a bug, but should the original authors' copyright headers be
retained here?

While the original copyright headers were correctly preserved in the newly
created k1-milkv-jupiter-common.dtsi file where the bulk of the code was
moved, standard practice is to retain the original attribution in the
existing file as well, alongside any new copyright claims.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728211020.1248=
676-1-aurelien@aurel32.net?part=3D2
