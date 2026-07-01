Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02BF363C51
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924794; cv=none; b=all9k9YR/2BPrkBa23sshl/ajoje+oPHd4CH8INSsbpO51pW3NnTCFaeBvkbGGVTsaF1Rd/09R8vWBXgwTSfnJHeCGQVRYBDJw5uUBmf2Lblvxqfc3mdZGccjPtO+zL4+mNkgUbVkz0vjNnmWxG7r74QwIGwwT6UYKHKuNFhfGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924794; c=relaxed/simple;
	bh=sGqCqW2noHYGz5LdJigF05KRmW0oEy25l/LpomLngwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GofWkHqzG/QgjXzTOYyccfm/doyfdDn6gBI6/L586H2Nkbs5gjbJYyY+yoMxLHN+tpmUYk1SnC307x5lot3iUQKBOzWGA7/j/WYUb+5pn9FBzp2Q4M75PeCfnuRraq1UGCRl660XytncTMm+fOjJx8/Aas5NnSgbRMbKlda8p3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwdbCiVn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwdbCiVn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D571F000E9;
	Wed,  1 Jul 2026 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924793;
	bh=sGqCqW2noHYGz5LdJigF05KRmW0oEy25l/LpomLngwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MwdbCiVnuzii2TaGkfI+xdKmP4Y4p0UypJosiN9rVKOnlzzqja5cvlVMs9sjdH0cy
	 yxl28GqRWFr3VqGNO2ebFLqYhHVymhKTJNWAALZvLI1EYcCzKyMj5jMzQI39ZGMBjJ
	 w0SWaw6u8KtResyW3CqeNplFlGLusGN32wfDTP0SyvIDaY8bbVfS6fpKHqXObEqJ6M
	 tYw3eyOpm/rXzB2zUgSnSYE5vxEARm+Oo/+0zupBNvZtw+Ab1UhrK6Oze5y/646/d9
	 ETf0zL9BrzuLVf0dBd+E+LajUhBIJb71p+62o3xAtbRO6B6zqCzYTN254jVJCf1fEQ
	 vtWCli07wqrEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: add Genio 520-EVK board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-4-19d5da4ef984@collabora.com>
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
 <20260701-add-mediatek-genio-520-720-evk-v2-4-19d5da4ef984@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 16:53:12 +0000
Message-Id: <20260701165313.66D571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The devicetree fails to compile due to missing header/dtsi includes=
 and undefined MT6359 PMIC node references.
--

commit 4a56bfd2875ac1171a204b6c914828f4d8d05173
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

arm64: dts: mediatek: add Genio 520-EVK board

Add devicetree for the basic hardware enablement of the Genio 520-EVK
board, based on MT8371 SoC.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts b/arch=
/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts
> new file mode 100644
> index 0000000000000..b4fd343bc08a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8371-genio-520-evk.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +/dts-v1/;
> +
> +#include "mt8189.dtsi"
> +#include "mt8391-genio-common.dtsi"

[Severity: Low]
Will this devicetree compile cleanly? It appears that the included files
(mt8189.dtsi and mt8391-genio-common.dtsi) rely on headers and dtsi files
that are missing from the tree (such as <dt-bindings/clock/mediatek,mt8189-=
clk.h>,
mt6365.dtsi, and mt8189-pinfunc.h).

Additionally, mt8391-genio-common.dtsi overrides MT6359 PMIC nodes
(e.g., &mt6359_va09_ldo_reg), which seem undefined since the board uses
an MT6365 PMIC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-add-mediat=
ek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com?part=3D4
