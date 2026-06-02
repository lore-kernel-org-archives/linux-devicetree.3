Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386982DB7B7
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 04:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376240; cv=none; b=XuGrXTCsJYIkMAK/p5ekQPmHQ/395HzH8KhTWhzKnFHujWePm+G9/GTeEHm4WHWXqClXM5WAAJ3NzP2vreg/B1DvJc4rIWw+RD5NLu8+P99KoEL7zSbq2fQNEfSrDL7llxwqUsP+qsse7WRgaSs+nrd9LBzqmlrXNE0gJ4wOuXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376240; c=relaxed/simple;
	bh=NNioFCPgqr8s8DtiUSUz3/PkPG6B8w9kqaXTNX1JIoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mbqXpRm/Nr8rF/l3n6eiLYkauvm9XjirnKjq/zduSV1YmQE5FJuNwbwwRu+nnsB5hPNFEGKBfEYBWKFOVOvPteSiCpSEKk11oYcNgePOd5tlE4vLNOAv3eWQDfHE9vXVnEXxGfdvvpvIbWt/+/4SQqIDxJ2jWSJS0NQ6bWLzZhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsO+bQr8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsO+bQr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0151F00893;
	Tue,  2 Jun 2026 04:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780376238;
	bh=PgRLJExLk9a4MzJWkNhg8d6cl8XBbYiePZTAcntT//g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsO+bQr8OxOefjowP61mPEk9eHxrHqWpmQK5lzyjEitvo8Tedj8cPWkP3a8/LkoE8
	 0rHdFDF3zWEKsF6zF1LmMfIn/nEhpy10eHCaDvjOweysezvIZAtHuYgFn+7sh2yYmF
	 aBdWdNtdNvxc8Y80U7Nw1pL88q4OEFkQKyFW8e3iYB46GAk1g6pmKed24n4Fjn2vK2
	 CAoJNSDYMUhfXMDEMFSp6aRosforle4s3XL0fQmVwES+4Aa/R+NpWF+MDFZsJawrce
	 xQFex5lgYDBTKu16KUren5Fev/QRMbTZauavc8culZ/dojDWv0gq+kmFc/OInpRH+4
	 PYLSXItlbNqfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: reset: qcom: add mmcc-msm8660 reset
 IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260602043623.285901-3-github.com@herrie.org>
References: <20260602043623.285901-3-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 04:57:18 +0000
Message-Id: <20260602045718.AC0151F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unmapped GDSC reset IDs (GFX2D0_AHB_RESET, GFX2D1_AHB_RESET) cause=
 memory corruption at register 0x0.
- [Low] Typographical errors in newly defined reset ID macro names.
--

commit 318183bccf1215fa02d8a5a344be5c0173d40944
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: reset: qcom: add mmcc-msm8660 reset IDs

This commit adds the dt-binding reset-ID header for the MSM8x60 family
(MSM8260/MSM8660/APQ8060) MMCC reset lines. It exposes per-IP software-reset
bits with IDs matching the numeric values from the mmcc-msm8960.h bindings.

> diff --git a/include/dt-bindings/reset/qcom,mmcc-msm8660.h b/include/dt-b=
indings/reset/qcom,mmcc-msm8660.h
> new file mode 100644
> index 0000000000000..c3ffd57834c97
> --- /dev/null
> +++ b/include/dt-bindings/reset/qcom,mmcc-msm8660.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + *
> + * Reset bindings for the MSM8x60 family (MSM8260/MSM8660/APQ8060) Multi=
media Clock
> + * Controller (MMCC).
> + *
> + * MSM8260, MSM8660 and APQ8060 are the same Scorpion-class MSM8x60 SoC
> + * with different bin/feature labels. MSM8960 is a newer generation (Kra=
it)
> + * =E2=80=94 its reset bindings live in
> + * <dt-bindings/reset/qcom,mmcc-msm8960.h> and must not be reused here.
> + *
> + * IDs intentionally match the numeric values used by the original shared
> + * mmcc-msm8960.h so the driver's qcom_reset_map array indexing is prese=
rved;
> + * only the resets actually implemented by mmcc-msm8660.c are defined.
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_MSM_MMCC_8660_H
> +#define _DT_BINDINGS_RESET_MSM_MMCC_8660_H
> +
> +#define VPE_AXI_RESET					0
> +#define IJPEG_AXI_RESET					1
> +#define MPD_AXI_RESET					2

[Severity: Low]
This isn't a bug, but should this be MDP_AXI_RESET instead of MPD? Propagat=
ing
misspelled macro names from the older platform might create confusion witho=
ut
providing any ABI benefits.

> +#define VFE_AXI_RESET					3
> +#define SP_AXI_RESET					4
> +#define VCODEC_AXI_RESET				5
> +#define ROT_AXI_RESET					6
> +#define VCODEC_AXI_A_RESET				7
> +#define VCODEC_AXI_B_RESET				8
> +#define FAB_S3_AXI_RESET				9
> +#define FAB_S2_AXI_RESET				10
> +#define FAB_S1_AXI_RESET				11
> +#define FAB_S0_AXI_RESET				12
> +#define SMMU_GFX3D_ABH_RESET				13

[Severity: Low]
This isn't a bug, but should this be SMMU_GFX3D_AHB_RESET instead of ABH?

> +#define SMMU_VPE_AHB_RESET				14
> +#define SMMU_VFE_AHB_RESET				15
> +#define SMMU_ROT_AHB_RESET				16
> +#define SMMU_VCODEC_B_AHB_RESET				17
> +#define SMMU_VCODEC_A_AHB_RESET				18
> +#define SMMU_MDP1_AHB_RESET				19
> +#define SMMU_MDP0_AHB_RESET				20
> +#define SMMU_JPEGD_AHB_RESET				21
> +#define SMMU_IJPEG_AHB_RESET				22
> +#define APU_AHB_RESET					25
> +#define CSI_AHB_RESET					26
> +#define TV_ENC_AHB_RESET				27
> +#define VPE_AHB_RESET					28
> +#define FABRIC_AHB_RESET				29
> +#define GFX2D0_AHB_RESET				30
> +#define GFX2D1_AHB_RESET				31

[Severity: High]
Are these reset IDs missing from the mmcc_msm8660_resets array in the drive=
r?

Looking at drivers/clk/qcom/mmcc-msm8660.c, gfx2d0_gdsc and gfx2d1_gdsc spe=
cify
.resets using GFX2D0_AHB_RESET (30) and GFX2D1_AHB_RESET (31):

drivers/clk/qcom/mmcc-msm8660.c:gfx2d0_gdsc
    .resets =3D (unsigned int []){ GFX2D0_AHB_RESET },

However, indices 30 and 31 appear to be skipped in the mmcc_msm8660_resets =
array:

drivers/clk/qcom/mmcc-msm8660.c:mmcc_msm8660_resets() {
    ...
    [FABRIC_AHB_RESET] =3D { 0x020c, 13 },
    [GFX3D_AHB_RESET] =3D { 0x020c, 10 },
    ...
}

Because omitted indices in a static array are implicitly zero-initialized,
accesses to rst->reset_map[30] and rst->reset_map[31] would yield { .reg =
=3D 0,
.bit =3D 0 }.

During GDSC power-on/off, qcom_reset_set_assert() uses these zeroed entries=
 to
perform a read-modify-write that erroneously toggles bit 0 of register 0x00=
00.
Could this regression silently corrupt clock controller state instead of
resetting the intended block?

> +#define GFX3D_AHB_RESET					32
> +#define HDMI_AHB_RESET					33
> +#define MSSS_IMEM_AHB_RESET				34

[Severity: Low]
This isn't a bug, but would it make sense to name this MMSS_IMEM_AHB_RESET
instead of MSSS?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602043623.2859=
01-1-github.com@herrie.org?part=3D2
