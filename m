Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DF6286D56
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600630; cv=none; b=AP2/daeR/bGfbTHDkYZzpSkFaWwtDubhGSRus97dgZJhQVG+fMYKROo5ht2FlpFAepS0xeimYmX1P3UB/wADdJOXJoiLjDe6zses2dK3+sXgQD1Ct8vHPW9BCO8txaRxp88UyQUBz4Fvgw+BsW36qQSJvyv8Lzi1LzC36xgFmBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600630; c=relaxed/simple;
	bh=EGil79TgUarBIzjbK1quy7Q1XOaxTwMzDec/Wzqv9c0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ayc46NcsOWk2iHLQNbZAbejTvhOFajxSexJNNS28BKM1IYIEZvj2QmMU5V7u3vKH3kmM+O5vgZNpgYqpmQicuIPzBKFq2j4PkikLUgOwQGphYrAtm+6V17SOduJQkH98nNR4uaTRyVPbSHWlLsaQRNbBNh5HIBBVmjlw1f7KfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ6u0ZsK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ6u0ZsK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F8B1F000FF;
	Mon, 28 Sep 2026 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600629;
	bh=nnoZ9Y5fB0iN+eAoMgSREFLV1nPNGqIp+dLxs/oKNiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQ6u0ZsKmvUbE4aHgTH7brgyGFLrrO2RZaFntc4KQn5WaAyeVq9+Th4/O/XqOIrnj
	 bcnYPGCPabF5i8IspWcgtBDOIXFKB9ZVBvdaJyn8H6LtqjNNIlVqhSDJQswM1ta7yA
	 I5Wbmmc0MtFBWPvfAqphSuw2UthLeeTkQm1+6gMR2J4BkctydmIvXMiHqoDrkfmFMn
	 2+pule0GdnR/YGTgCytLZhY4C8YaxHa8xm177A1ZfcG03z65e8zBVd03BriHRoZym2
	 tUkOo/eyfX6mU/ucbFzgeMzc+rsH8rXMPJsHZNu50EaOKeF2OvpqrZZmXtAPRbNjwI
	 okdBs2Rg7ztZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/10] ASoC: qcom: Add QAIF hardware register map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-3-ac618057fe85@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-3-ac618057fe85@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 13:03:48 +0000
Message-Id: <20260928130348.A9F8B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] qaif: hardware register offset typo in EE map definitions
--

commit 87884b7c293c2733efcb7eb006da31f9ab34c5a8
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF hardware register map

Add qaif-reg.h to define the MMIO register offsets for the Qualcomm Audio
Interface (QAIF) hardware block. The QAIF driver needs a common register map
to program the core registers, audio interfaces, and other components.

> diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
> new file mode 100644
> index 0000000000000..84a9c0285289e
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-reg.h
> @@ -82,21 +82,21 @@

> [ ... ]

> +/*
> + * EE (Execution Engine) assignment and map registers.
> + *
> + * The EE offset (v->ee) is an address/index offset relative to the
> + * platform-defined QAIF/EE base and lets the hardware route the AIF
> + * operation to the correct EE context. It is hardware/platform-specific=
 and
> + * must match the mapping defined for the selected QAIF AIF/lane in the
> + * hardware programming guide. It is not a runtime data offset and must =
not
> + * be changed based on the stream configuration.
> + */
> +#define QAIF_EE_RDDMA_ASSIGNMENT_REG(v)			(0x19148 + (0x1000 * ((v)->ee)=
))
> +#define QAIF_EE_WRDMA_ASSIGNMENT_REG(v)			(0x19150 + (0x1000 * ((v)->ee)=
))
> +#define QAIF_EE_INTF_ASSIGNMENT_REG(v)			(0x19158 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_RDDMA_ASSIGN_REG(v)		(0x19308 + (0x1000 * ((v)->ee=
)))
> +#define QAIF_EE_CODEC_WRDMA_ASSIGN_REG(v)		(0x19318 + (0x1000 * ((v)->ee=
)))
> +#define QAIF_EE_RDDMA_MAP_REG(v)			(0x1920 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_WRDMA_MAP_REG(v)			(0x1940 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_INTF_MAP_REG(v)				(0x1960 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_RDDMA_MAP_REG(v)			(0x1980 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_WRDMA_MAP_REG(v)			(0x1A00 + (0x1000 * ((v)->ee)))

[Severity: High]
Are there missing hex digits in these register offsets?

These QAIF_EE_*_MAP_REG definitions appear to contain a typo (e.g. 0x1920
instead of 0x19020). When written to by regmap during
qaif_map_ee_resource(), this could cause writes to target unmapped MMIO
memory or clobber unrelated QAIF_AUD_INTF hardware registers when
v->ee >=3D 1.

Could this lead to a bus fault or silent hardware malfunction when
snd_pcm_hw_params() is called by an unprivileged user?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-b4-qaif-sh=
ikra-audio-v8-0-ac618057fe85@oss.qualcomm.com?part=3D3
