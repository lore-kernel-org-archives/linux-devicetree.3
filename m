Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC742FE07D
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146840; cv=none; b=tNIC+DO5+1Uuq4OpCjHnvXWigxkBlG/iZMNAzBJqrgKTftxKc272ZO1M13uVu0wZR6M8W/AM8HVW9rQUdwKnjWS9UJiyxiWZYMdidUYswq4X3L0FXbgZV9+U7KdVWDgc1YRR7g/ctY9coNBOA8zj5r+F3Kw8n+Q880rWSXt3/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146840; c=relaxed/simple;
	bh=7WUCl0rLWZbwimkwCZikWMQqELoT9NWKwKUWOUFiytk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pkQkS7iAGIeA8yRevWsDXQOzTjwmaE7XMtfxhYk+yhZ1XGjposs3v/OkzvaaXONxVRW18uI6OZgC/qlMoXtCIvVERi7T53cxnuygIBMz2QV/IyIXYsUhb+HG5YSzSRsQLtGDxG/Oe4liyaVVwd85yucW7mtpirqxA+Mw/J1Zpmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zdx2pImS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zdx2pImS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181391F000FF;
	Wed, 23 Sep 2026 07:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790146839;
	bh=bV215nkZmXvFnIcGF6m88M5z4U0PwcR1TZrIJFueaoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zdx2pImSzqST+EAIqRvdySMFhhAqxNBObq/eZ6blphzX82Kg5gITK/+6OogWeJsfD
	 9FRtX3VrehVuZzquVdLcFFrLtUTA/Nr2CI155mRcVRKLsmUQZHIYyEuNbsJ9KH2mUi
	 EvQezEwFiS7YpBe7F5zkmZQIbT6aub+HOw8OMFMbFy4RqUAX4frNRkU32L2bUWxgbC
	 OUkkVAnxmlXcjIuoi9b+fVVB4cYh2kgvBUiPS+NooE2t27WCSjSyRUR2bekujFdjZs
	 A4n/y9m08n6kUIyaHzy2OIV2uDBPDIY9fs2QbkBnx22sUktWMci3FmJrs/9an5jR8G
	 wPCvoACuW+SZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/10] ASoC: qcom: Add QAIF hardware register map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-3-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-3-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:00:38 +0000
Message-Id: <20260923070039.181391F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] qaif: incorrect register offsets for EE map registers causing MMIO=
 corruption
--

commit 5454f6ca9bb412d35876e973e587e5e34579e362
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF hardware register map
   =20
This commit adds qaif-reg.h to define the MMIO register offsets for the
Qualcomm Audio Interface (QAIF) hardware block.

> diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
> index 0000000000000..84a9c0285289e
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-reg.h
[ ... ]
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
Are these QAIF_EE_*_MAP_REG definitions missing a hex digit in their base
offsets?

The other Execution Engine (EE) registers appear to be in the 0x19000 range.
Because these map registers are defined with bases like 0x1920 instead of w=
hat
might be intended (e.g., 0x19920), they evaluate to addresses outside the
expected Execution Engine block.

For example, when v->ee evaluates to 3, QAIF_EE_RDDMA_MAP_REG results in of=
fset
0x4920. This directly overlaps with the Audio Interface 0 block (which star=
ts
at 0x4000), and could corrupt hardware configuration during initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-b4-qaif-sh=
ikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com?part=3D3
