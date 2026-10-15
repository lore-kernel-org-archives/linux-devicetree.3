Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075143F4D4
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049086; cv=none; b=lWAelktwGdERUBnpdSNAxQcZtTWOjeNVi26bAD3NE0MSHhae5dP8oB+VUktVNqFgCdXjExpsmHMFkYkLMZJcx2vQG9OpMPCOCMY5cyeC8/C3+jk0lwTyFvJuCUtbz/ozWTYTGq3SEUNNEf6NgnVNhJzTjDzVQecKp1Mo7kcSNW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049086; c=relaxed/simple;
	bh=vacElafGiKVjPWCJn2z/A/zm40tsCO2TwFtANyEjaVY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MW+j309SnKhlJRcbWOzMOAq3bTKIN3KYtTCsb7ik0e24W3RGO46W623mSEGztXcGkdjfrwQrsrJAUGwIM5t7o7XxvdkOgdCe1aCXkvWJPwo/fP6gwa7bP0oztj6++D6PxIZuQ1TSX7JFPlmAhWrlmGh0tRpdtO7xTOM3+qCJcNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/cg7YM2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/cg7YM2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CED1F000C5;
	Thu, 15 Oct 2026 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049078;
	bh=fSy3zY/Se4aJW23h+zGG4GvQ0K39EQdzkJuXX5EZC88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/cg7YM2wlwD+8jjN0bIdKFx55HEVR3fVnONsR7MbFD3qtqVtAgcz9aq6REXS3BR7
	 qdT/lryytGvP02kgr8qKaDQAgeZ5v6sH7nVRRsQBQDqeMl210d3I8hsRRvGQHqENoO
	 ou88HPgHRlG6pMij8V/hu1rCtk21R7NiJ6yRK+WQBH+Bqm88JyVx92stMKMgoMrxfP
	 DOTFRfDmYTlLQsT/qRb2/0auP01emt2Nzt448Vl1E/W0gmA+suXXWAB68EpvvEwZNL
	 BUdKAlRsFTVTPK8sJ1FruZ5SeP0EsMuUSbNGy7g29VI8f4s46OMgxs4NC3NZuf8RPS
	 5eLvgRcWpknDA==
Message-ID: <sashiko-outbox-172397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset
 controller bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014072109.1759502-6-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-6-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:24:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: reset: unstable ABI via _COUNT macros
- [Low] dt-bindings: clock/reset: patch ordering breaks git bisect
--

commit 964ebb4388d7c67dbfa57a9fa7d74c6b1cd7fe12
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: reset: Add ZTE ZX279128S reset controller bindings

Define logical reset indices (0, 1, 2...) for the topcrm and crm2
reset controllers on ZTE ZX279128S SoCs.

[Severity: Low]
Does this patch ordering break git bisect?=20

The preceding commit in the series introduces
Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml, which
explicitly includes <dt-bindings/reset/zte,zx279128s-reset.h> in its
examples section. However, that header file is not introduced until this
current patch.=20

This dependency violation causes a missing header error when building the DT
bindings at the previous commit. Should the patch defining the header be
ordered before the patch that references it?

> diff --git a/include/dt-bindings/reset/zte,zx279128s-reset.h b/include/dt=
-bindings/reset/zte,zx279128s-reset.h
> new file mode 100644
> index 0000000000000..5b580bcda865d
> --- /dev/null
> +++ b/include/dt-bindings/reset/zte,zx279128s-reset.h
> @@ -0,0 +1,26 @@
[ ... ]
> +/*
> + * Top CRM logical reset lines. Mapped by drivers/clk/zte/clk-zx279128s.c
> + * to hardware register offsets and bit shifts.
> + */
> +#define ZX279128S_RESET_USB_B9		0
> +#define ZX279128S_RESET_USB_B10		1
> +#define ZX279128S_RESET_USB_B11		2
> +#define ZX279128S_RESET_USB_B14		3
> +#define ZX279128S_RESET_COUNT		4

[Severity: Low]
Does exporting this upper bound macro to the stable ABI header create an
unstable ABI?

Device tree binding headers define the stable ABI between the device tree
and the kernel. Defining macros like ZX279128S_RESET_COUNT encourages
downstream or future code to use them for bounding. If new reset lines are
added in future hardware revisions, these bounds change, breaking backward
compatibility.

Since the driver correctly infers the reset count using ARRAY_SIZE() on its
internal mapping arrays later in the series, is it possible to drop this
macro and keep array sizes and upper bounds strictly inside the driver code?

> +
> +/*
> + * Top CRM 2 logical reset lines.
> + */
> +#define ZX279128S_CRM2_RESET_PCIE0	0
> +#define ZX279128S_CRM2_RESET_PCIE1	1
> +#define ZX279128S_CRM2_RESET_COUNT	2

[Severity: Low]
Similarly, could ZX279128S_CRM2_RESET_COUNT also be removed from the stable
binding header to preserve backward compatibility if new resets are
introduced later?

> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014072109.1759=
502-1-ghahramani.navid@gmail.com?part=3D5
