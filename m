Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DCB4B271A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444825; cv=none; b=EouHL2D72E7k+MKfzou73KqyIHONzwYvsPoQn517ZtANdTo2x27t270bxw5nrNaHBS0vKaRP8MuZYSs1g+SW0RrJRLNMwzWbfhbqNX7dYPJ9K/oJfBSV/vJQnK3kufrXDjLgyBMMNQdQhNzC0B9XiyNuQo48mXduFnANbb3CMHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444825; c=relaxed/simple;
	bh=ABPvNIZiCytgIJZcqZ4fiR9Gdq37cphL/N84cbUb64c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jE8ggLhIq3vQcI2jRWCfi4agjJ+C3EhNuQOfu2a4dWNAdxeZalYYFb2ljBJt8Xjg/QRVTnFiORimx0lSH0CCKYGJNB3/OmUwdfOuEu9QiNJtPZnqR1XwiNkYFaTBriCMxzynmj7aX8yzMC4B5TrR24+J4YCEClva/RVL7JomWBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgwZEhL1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgwZEhL1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC03A1F00A3D;
	Thu,  3 Sep 2026 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444810;
	bh=pt1m2zH2j3zBtOgr90voKb2rgllldeNdPL0wuX95rYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NgwZEhL1WWOUsP1spbZCUN8IO/YZ0GcCdAbe/SF8FeHvIDkQfSwORaPS4pofQsNX1
	 gV9/QEgEsS8jlOtZWCAgJyZKPQgggdKNWGVDKSpvmWqLoW2M6sLRD9uwMYICKsDnVz
	 cbMFiSL7A1QmBMJYGi8QCjL8VLEC/bS7uYALGyPNJKKlORxiBip6RtWZmEPC25PABQ
	 NlPd8zGvAxwe4QzeIheajnJ44uWlLXZ4/ItPe4BuGoCiBWgPh/Cd1PBVJpURNWkceD
	 KaKQU90EvvlVo2/+YbRSYB4Tr+yT1UyESihU8TE2PpxAWMfL0x/KeMzocJ12gh3+XX
	 50kG2JNqn3Arw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: apple: Fix style issues for t602x multi
 die .dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janne Grunau" <j@jannau.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-apple-soc-multi-die-style-v1-2-eeb05ea0c187@jannau.net>
References: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
 <20260903-apple-soc-multi-die-style-v1-2-eeb05ea0c187@jannau.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:13:30 +0000
Message-Id: <20260903141330.AC03A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#undef SOC_NODE` in `t6021.dtsi` pollutes the preprocessor=
 namespace for any files that include it.
--

commit 15841a7911d15e65ab6085742e273164257c003e
Author: Janne Grunau <j@jannau.net>

arm64: dts: apple: Fix style issues for t602x multi die .dtsi

The M2 Pro/Max/Ultra .dtsi files containing most MMIO nodes are a
collection of nodes without parent. The proper embedding inside a
"simple-bus" parent only happens in t6021.dtsi and t6022.dtsi.
Fix these dt style issue by using a define for their parent soc node and
bracket those MMIO nodes inside it.

Link: https://lore.kernel.org/asahi/e2365307-32d6-4ef9-9919-55ba69786741@ke=
rnel.org/

> diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/a=
pple/t6021.dtsi
> index 5175797baf621..3cddc1697e147 100644
> --- a/arch/arm64/boot/dts/apple/t6021.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6021.dtsi
> @@ -35,13 +35,11 @@ soc {
> =20
>  #define DIE
>  #define DIE_NO 0
> +#define SOC_NODE {/soc}
> =20
> -&{/soc} {
> -	#include "t602x-die0.dtsi"
> -	#include "t602x-dieX.dtsi"
> -	#include "t602x-nvme.dtsi"
> -};
> -
> +#include "t602x-die0.dtsi"
> +#include "t602x-dieX.dtsi"
> +#include "t602x-nvme.dtsi"
>  #include "t602x-gpio-pins.dtsi"
>  #include "t602x-pmgr.dtsi"

[Severity: Low]
Does this leave the SOC_NODE macro defined for any file including t6021.dts=
i?

There are existing macro cleanups right after this block in the file:

#undef DIE
#undef DIE_NO

&aic {

Is an #undef SOC_NODE missing here? Leaving it defined pollutes the
preprocessor namespace and deviates from the cleanup pattern used in sibling
files like t6022.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-apple-soc-=
multi-die-style-v1-0-eeb05ea0c187@jannau.net?part=3D2
