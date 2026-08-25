Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3E3443ABA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697424; cv=none; b=BtwOQsiucJh3uDwtXdj079356lTngIeFo1Mj4Va9kNcmS8+Yf8Xt4QlPh3vcz0EV+I1lbWcQbVXDXNF6gSC2g4FapmxCGsLPNl9PrUyw8DDbfDXrj/or1CW+1hv7d2mavz3qRjoR0s7uonTiQMwMbVz0HlCFKS/6/fXQ/uxdGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697424; c=relaxed/simple;
	bh=u12Y2y1N5ml8wMb+su2r5gj0NC/xzvjabDX79ap1kCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=btAt7tT1XDQJI3KEEIZPiEYbfyL5W1UfgYZLNWUm8TjTy8eJCE3rK131ldGwJ8jwII2Hvhkgt788szN9aaB25C44hnJzBi1jBHe6tFqPRUxZB+N4ivJkubQ1xCexYQnrMLp6VgA1luqjBvXFKTu6MjBCj2i7kHlFMvV1Odp3TVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHGmMv5h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHGmMv5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83AE1F000E9;
	Tue, 25 Aug 2026 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697422;
	bh=E2Nb+PmnwfQGHWg9sIBWT/u57VGzUPBUMIOWndzn3OQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cHGmMv5hyjtG3ygctbz8E928vXJVjcLsRirO+NG02MXeybM59Mzb3ycbXprajV5j+
	 q7iaTVA5/SSnTAReXQPr+Xf+RVPCDb58n1bVjmZZ9pFmqROdy0jWfD7BXhA/9bGj9k
	 L49ROCIVVUhzwBtCdUwFqLUGY4x6LE1OocXJ+M8KRdddegHT0XijuLVapeY71ppffN
	 NGPkSzuj07l6TeZDMlWZfnjEi3SoLoOd7rUa4aKmGH6udU3tOJRxsFF9EgZ/fZF9h3
	 C27JT2DcBL4Pd3vovxP8WsMCPSnIG0t0/v//iUMUzAYR85Ua3f8Gb4n5GfA94NYkSP
	 66itxVk8gj67A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 16/19] crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260825221539.255951-17-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-17-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:37:02 +0000
Message-Id: <20260825223702.B83AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mixed declarations and code violate strict declaration-after-statem=
ent coding style
--

commit 0ef415a044191dc8d92f6871f0f86042ccf5c94f
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ)

This commit registers SLH-DSA, LMS, LMS-HSS, XMSS, and XMSS-MT algorithms
using the CMH HCQ core. SLH-DSA is registered with sign and verify support,
while the others are exposed as verify-only algorithms since their stateful
semantics are not modeled by the kernel crypto API.

> diff --git a/drivers/crypto/cmh/cmh_pqc_slhdsa.c b/drivers/crypto/cmh/cmh=
_pqc_slhdsa.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pqc_slhdsa.c
[ ... ]
> +static int cmh_slhdsa_sign(struct crypto_sig *tfm,
> +			   const void *src, unsigned int slen,
> +			   void *dst, unsigned int dlen)
> +{
[ ... ]
> +	m_dma =3D cmh_dma_map_single(m_buf, slen, DMA_TO_DEVICE);
> +	sig_dma =3D cmh_dma_map_single(sig_buf, sig_sz, DMA_FROM_DEVICE);
> +	if (cmh_dma_map_error(m_dma) || cmh_dma_map_error(sig_dma)) {
> +		ret =3D -ENOMEM;
> +		goto out_unmap;
> +	}
> +
> +	sk_dma =3D DMA_MAPPING_ERROR;
> +	idx =3D 0;
> +
> +	struct core_dispatch d;

[Severity: Low]
This isn't a bug, but could this variable declaration be moved to the start
of the block? The kernel coding style historically expects variables to be
declared before executable statements. Mixing declarations and code here can
trigger warnings on older toolchains or depending on subsystem Makefile fla=
gs.

> +
> +	d =3D cmh_core_select_instance(CMH_CORE_HCQ);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D16
