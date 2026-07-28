Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E442AFB3
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240110; cv=none; b=evJ1tf3dub2qvSerxWIG/TOHRLVKVRzGD2/LJ0kxtbZetNTG4mhxPRDr1ZMfC7F2pRUcTBYwPaAWaIJ2+695ULKQOZR9+2oj7gVqyT3NaX2pBxW5N3rmK8Cwti19u5RpYYKVW4xHApecqPub1noRdXzJliFXGg743fDGZQXhcGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240110; c=relaxed/simple;
	bh=HG7Gma+gcPSl/MEgJFlmLFHo6pcPtBq+3s92A7c4QNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FBLbOxwLtlq0couxHu1l7ROYpHX2tF33hdLtr0zAxdCqpTD0kVysAjp4JsS4zGumWAfkDFCR1FsY4vDnVvz0bNbYn5ncufWPh7pcFhXajpsuOIok4C47O0kkAN2hBqB7DxUFLic2e+5PYwDYb7SnMlAyyNRNdIV+QWxECjlv4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLSeWWEM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLSeWWEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586FE1F000E9;
	Tue, 28 Jul 2026 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785240109;
	bh=MLBUw34i8Q21EjIlNZh9GoWvvKbIsOgnXDy/XZt2OJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLSeWWEMzDHOhk2hLemSRWLj8IXIi8bmxLgIdXUWPZGF/XFLh9OpixM1z+JQRLR7O
	 pwKV/lz1CKGdiifOzce3MR7Z1yEZxUNbOS6wM1rsjotdn6jz6B8+yNEXum9ioDkAov
	 KutdJxRePpmoJphTDQeVAP/8/gYOKtSwVwolhY5wPzbcd70XyxDkYLYCKaQSY9LayB
	 IzLVgZjvXNyox2DOb6yMSIxSr7lufpT88nFk4pkEzWaBzz8E4XoMU3zF9zpBzkzLUP
	 7YvnP0a8XLzelYnZDm3QJIg8HOqgnOZ0CB7zFdBSQnK5A8fOKEloQedyxSNdt7/OJq
	 JT3a1znRKgfgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/13] dt-bindings: clock: exynos8855: add peris clock
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: raghav.s <raghav.s@samsung.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260728121111.2077860-6-raghav.s@samsung.com>
References: <20260728121111.2077860-1-raghav.s@samsung.com>
 <CGME20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752@epcas5p3.samsung.com>
 <20260728121111.2077860-6-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 12:01:48 +0000
Message-Id: <20260728120149.586FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds an unrelated MMC clock definition (`FOUT_MMC_PLL_CLK=
OUT_DIV2`) in a commit strictly scoped to CMU_PERIS clocks.
--

--- Patch [5]: [PATCH 05/13] dt-bindings: clock: exynos8855: add peris cloc=
k definitions ---
commit 24dfca50d1a6c5c9117393c100c8d5214d55a23f
Author: raghav.s <raghav.s@samsung.com>
dt-bindings: clock: exynos8855: add peris clock definitions

This commit adds device tree clock binding definitions for CMU_PERIS.

[ ... ]

> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-=
bindings/clock/samsung,exynos8855.h
> index 14369b749fb25..9efaf3e330b42 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -50,6 +50,11 @@
>  #define DOUT_SHARED4_DIV4		   38
>  #define FOUT_MMC_PLL_DIV1                  39
>  #define FOUT_MMC_PLL_DIV2                  40
> +#define CLKCMU_MOUT_PERIS_GIC              41
> +#define CLKCMU_MOUT_PERIS_NOC              42
> +#define CLKCMU_DOUT_PERIS_GIC              43
> +#define CLKCMU_DOUT_PERIS_NOC              44
> +#define FOUT_MMC_PLL_CLKOUT_DIV2           45

[Severity: Low]
The commit message explicitly states this patch is strictly scoped to adding
CMU_PERIS clock definitions, but FOUT_MMC_PLL_CLKOUT_DIV2 appears to be an
MMC clock definition. Is this macro intended for this commit, or did it
accidentally slip in during development?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728121111.2077=
860-1-raghav.s@samsung.com?part=3D5
