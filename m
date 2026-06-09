Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443E23AB87
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010982; cv=none; b=ZKviZ+P9l9J+ss10nCNKGeMF6mRpZWF9ioLZfXtM0gQWgc/eKpGyDb6PoIB7jgyajDTDhhYiPhR+uotnRFhvMcUrDARnMGYqFC3BdRhmGbBlvS7oO4ny/+rp/xn6Sv1YdjOMqNB+KuL5BTI9asIRjYwRjHIgQcjD2eMSnUpmRfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010982; c=relaxed/simple;
	bh=GuXJTsmWNPD4mmWd6VzAd66Fm+DgLEoriSwdc0Hi78g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C3isWXoNLJgLdjVZLN8cEaYRO6jI/VObki/LXjum9FshHMTdZHOqIQ3UPCQX6FFhfSOUnJ1TPDfdhFMe88aE0s6SNmrVL3ggdFIV06db05Bu6SHQv9Py7hwFfch9/n0LOPFMAqAF2efc8n51Wnp1ReRFih/sEH0f848EDQ3UPbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLubbVnS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLubbVnS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3541C1F00898;
	Tue,  9 Jun 2026 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781010981;
	bh=4lbpqkqsS84xZGVqf3raj3AQJwLHJSXfpvkpck0tsgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WLubbVnShGff1kTdM1ngwAspb5gsMNVg9p+5tj+M9aKILTmc6uxwpIucNehK4xmyA
	 wfpE6zYe0rlUW+v+y8+0DyGik+apHsOUbAt0nQa5QWvXTWEumB8eU0C0CoFCq3jFFq
	 DsP30c2uFPV9J3kExZFP/8MvXWYx7SPD/41N9WJ9isoZPLyUxxG0FnHNmAUqP2OdUE
	 FhKBc17k6wwlzNIok6OFp5Dos3c/qDACv9bdzpdfv0YXB9la3jC3GdCqCH5wbEe4Df
	 8Tp6/U7FY3MqP3qogN3g8xqj5HNkjT82sVOuJCgkO+w9cerCeyIIbz4YAAQTc8esGz
	 gxFSDar2X/GrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] riscv: track effective hardware PTE A/D updating
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yunhui Cui" <cuiyunhui@bytedance.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609130021.99899-3-cuiyunhui@bytedance.com>
References: <20260609130021.99899-3-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 13:16:20 +0000
Message-Id: <20260609131621.3541C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect global ISA extension check prevents FWFT enablement on a=
symmetric SVADE/SVADU systems.
--

commit f3d7c0060d5bf449bef26605d30b6a4b56780451
Author: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: riscv: track effective hardware PTE A/D updating

This commit separates the tracking of hardware PTE A/D updating from SVADU
discovery. It enables Firmware Features (FWFT) on all online harts before
globally advertising the feature, and requires secondary harts to enable it
before they are marked online.

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
[ ... ]
> @@ -287,15 +291,88 @@ static int riscv_ext_zvfbfwma_validate(const struct=
 riscv_isa_ext_data *data,
>  static int __init riscv_hw_pte_ad_updating_init(void)
>  {
>  	bool has_svade, has_svadu;
>  	int ret;
> =20
>  	has_svade =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
>  	has_svadu =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> =20
>  	if (!has_svadu)
>  		return 0;
> =20
>  	if (has_svade) {
>  		riscv_hw_pte_ad_updating_requires_fwft =3D true;
>  		ret =3D riscv_set_online_hw_pte_ad_updating(true);

[Severity: High]
Since riscv_has_extension_unlikely checks the global intersection of
extensions, will has_svade evaluate to false on an asymmetric system where
some CPUs support both SVADE and SVADU, but others only support SVADU?

If has_svade evaluates to false, FWFT enablement is skipped here, but
riscv_set_hw_pte_ad_updating is unconditionally called at the end of this
function. Could this cause the kernel to assume hardware A/D tracking is
active globally, even though CPUs with both extensions would remain in their
default software-managed SVADE mode?

If the kernel incorrectly assumes hardware A/D tracking is active, would th=
is
cause arch_has_hw_pte_young to return true and erroneously expose the SVADU
extension to KVM guests? It seems like this could lead to unexpected VS-sta=
ge
page faults and guest crashes if the underlying host CPU traps on missing A=
/D
bits while the guest OS expects hardware updates.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609130021.9989=
9-1-cuiyunhui@bytedance.com?part=3D2
