Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF77A22F01
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 04:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780201929; cv=none; b=H5Cu3lTF8TgfE04SEb/PtmDmmNBko96YdfCUq+6bKMlm+xe6prv3n3TmDRno6L5suxqXIFOMkrCTchDLiyGVNkyVNjpvDfiCnUBXrN5njYydtTvO0IDHRzl4Yg98Uezp1JlxvOfctHxAyrJqaZgSWC4kDDDI174LnzrrCie+XIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780201929; c=relaxed/simple;
	bh=PhOGnKWKIa+gZyNU3sIq/GjUjKR2NKdDExPgt/kBSN8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ezlTWafGg60Fx8OMyF4kFplnSx/cnT5Bcr35IM9SVnUS03Z1UzBsJz0RyaN9H4EDaBhfo3NMejUijExgo8nKYaRNnpIDZ02T7R9AekDAgt1BFKRsXM+K2E7cDVOiRoHamFg/Ni3WdLbO3uAIhaX9fd6zW4S1XF9G+uL+A6NoS1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1aKYLEh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1aKYLEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221D61F00893;
	Sun, 31 May 2026 04:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780201928;
	bh=Hzq6eLMloZtq/kFbBWl4JRhG9UVsjfSuzNab2oW8qa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M1aKYLEh43uctut+CsyVzSrXLbePQWuXn8WJy3De0fI/taMRA4zZOqy3iSBBq/6Or
	 U1DMLjdPmT+1hoOKXp7gaNCC2GZ2yBzHufoBojS3AH64ZfWd/I95WhCg7X2lPGb6N4
	 3xT7jfuYqgCv8i2Dg9kei81WWR2kCExYPsGvN9WqBbILf4nal2hpvQyWuHTWlT27QC
	 sr3Date/RIZX+LpA4Hp9i7PYBuv6ZpPkq9Wy83n0Mccdy56sCv7obNNYVjF/CHSnPB
	 cz18dNDo4MjMK7yjcSRqohdj/ZrQBs1lbEpgRN61REWK/Zfvzrg5Xnd7jjJWUiNtHz
	 4GW35LPi3j/Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,gcc-msm8660: add CE2_P_CLK,
 PLL4_VOTE + per-clock annotations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <c36dcf40802d89a4b43255394386fff974a6301c.1780197117.git.github.com@herrie.org>
References: <c36dcf40802d89a4b43255394386fff974a6301c.1780197117.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 04:32:07 +0000
Message-Id: <20260531043208.221D61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit adds new clock IDs `CE2_P_CLK` (258) and `PLL4_VOTE` (2=
59) to the device tree bindings header, but fails to update or pad the corr=
esponding clock provider array (`gcc_msm8660_clks`) in the driver. Because =
the array is sized automatically by its designated initializers (with the m=
aximum explicitly initialized index being `PLL8_VOTE` =3D 253), `ARRAY_SIZE=
(gcc_msm8660_clks)` evaluates to 254. When consumers request the newly adde=
d clocks via the device tree, the request will be deterministically rejecte=
d with `-EINVAL` by `qcom_cc_clk_hw_get()` because the requested index (258=
 or 259) is out of bounds (>=3D 254), leading to probe failures for depende=
nt drivers like `qce`.
--

commit e7b40c3edcde948b05e3c3366897a0d2ad0b785e
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: clock: qcom,gcc-msm8660: add CE2_P_CLK, PLL4_VOTE + per-clock =
annotations

This commit annotates each clock with provenance and consumer information
cross-referenced against various sources. It also appends two clocks,
CE2_P_CLK and PLL4_VOTE, which are needed by downstream consumers but were
missing from the header.

> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8660.h b/include/dt-bi=
ndings/clock/qcom,gcc-msm8660.h
> index 4777c002711a1..7d03b16c1b9e4 100644
> --- a/include/dt-bindings/clock/qcom,gcc-msm8660.h
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8660.h

[ ... ]

> -#define PLL11					256
> -#define PLL12					257
> +#define PLL11                               256     /* header-only - PLL=
11 (Scorpion L2) */
> +#define PLL12                               257     /* header-only - PLL=
12 (DDR) */
> +
> +/* New clock IDs added in this cleanup. Append-only =E2=80=94 never inse=
rt in the
> + * middle of the existing numbering, since that would shift IDs of
> + * earlier entries and break DT ABI for boards already using them. */
> +#define CE2_P_CLK                           258     /* drv+dt legacy:HTC=
,Sam,TP - CE2 APB (newly assigned, was missing) */
> +#define PLL4_VOTE                           259     /* drv legacy - PLL4=
 software vote */

[Severity: High]
Does adding these new clock IDs at 258 and 259 exceed the array bounds of
the driver's clock provider array?

In drivers/clk/qcom/gcc-msm8660.c, the gcc_msm8660_clks[] array is populated
using designated initializers, with the highest explicitly initialized index
being PLL8_VOTE (253).

Since the array size isn't padded to cover the new indices,
ARRAY_SIZE(gcc_msm8660_clks) evaluates to 254.=20

When consumers request these newly added clocks via the device tree, will
qcom_cc_clk_hw_get() reject them with -EINVAL because the requested index
(258 or 259) is out of bounds (>=3D 254)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/c36dcf40802d89a4b43=
255394386fff974a6301c.1780197117.git.github.com@herrie.org?part=3D1
