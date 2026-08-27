Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E61B374A0D
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828244; cv=none; b=EhFhffr6rcuxZT8YPU7awXLmFWOiGLWwhuUtyyqpY77fhdBqw1GJHuEkpY3mWQF5uf78920wmZoPt+KykEev9bA0jsguJvxaVcY8pMCFY6TO+i1eIs2qU2fdrfFn2crVqU6rjYjdpNGNOAMJuH6r6R/8ZyB+fXh+dyzaGTXkqXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828244; c=relaxed/simple;
	bh=tyzCSFVRZ8tniGdAKYTGRmf5D6HgkLFq3qH5i53AyRs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nJcgTg5uVV1zyqdB6EQlOJR+DPtYtLPHpOr0zeOx8MvbbBQ04h3Nbfq06ZmJAHmd/CmxrmHehsBuU6PFdPTib/XitWrqju0+3QPkps5mMjla5RGblpX5LAFmB2UpvgnN2dL2vwv8I0n12QFDUGe+/1Cy2yBPGPnUDcuFMT3lJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8fB3Ogl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8fB3Ogl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AA71F000E9;
	Thu, 27 Aug 2026 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787828242;
	bh=KHWaFuwSpG3/2V1N7YXUlU5DN0AtGfVwpkMiLuH/xUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N8fB3Ogl6EDoUVURjMYgT7b7W2XQU1iTFykVpGhy4ckhlzpws/+ei8Tqr9/V1Oa3E
	 kCnwBzDPdFzuZog1wleXOdWtIyoUOpnaUj6ZFQXwfYK5z0XvtBO5LM1B9LfySHaBP4
	 L96kkCLIlgMVKt8Lnl7a5BGTOjG3pCuFt1nvKBX5AoI8vvpEAPbX3HwmcBE0jaiI/I
	 UtcNJ1Yqaq5KCoLwV/E6m1h9GzAT3LqMMRKhNpzs4t6amjkpte239xmHffZWQSuAVx
	 g+OoEeBCWTspVOiXD7+8Dj9GIU+m+0UebSJZK0Iwnriv1DCsywOqGSVpouvaBiVWfm
	 0t0kUrdfec9wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: media: Add rockchip rkisp2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder@ideasonboard.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-rkisp2-v3-4-e91ff0a604d6@ideasonboard.com>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-4-e91ff0a604d6@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 10:57:22 +0000
Message-Id: <20260827105722.B9AA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `interrupt-names` property in the `required` list allows=
 incomplete device trees to pass schema validation but fail driver probing.
--

commit 6781ced6c9930c8c3220edc52b5934581e2961ae
Author: Paul Elder <paul.elder@ideasonboard.com>

dt-bindings: media: Add rockchip rkisp2

This commit adds device tree binding documentation for the Rockchip ISP2,
specifically introducing support for the rk3588 compatible string. It
defines the required properties, clocks, interrupts, and ports for the
image signal processing unit.

> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp2.yaml b=
/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
[ ... ]
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains

[Severity: Medium]
Should interrupt-names be included in this required list to ensure incomple=
te
device trees do not pass schema validation?

The Rockchip ISP2 driver in drivers/media/platform/rockchip/rkisp2/rkisp2-d=
ev.c
iterates over its statically defined rk3588_isp_isrs array, which sets the =
name
field for both interrupts (isp_irq and mi_irq). The driver then uncondition=
ally
executes:

info->isrs[i].name ? platform_get_irq_byname(...) : ...

This will fail and return less than 0 if interrupt-names is absent in the
device tree, aborting the probe. Adding interrupt-names to the required
properties would enforce an accurate hardware description that matches the
strict probing requirements of the driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-rkisp2-v3-=
0-e91ff0a604d6@ideasonboard.com?part=3D4
