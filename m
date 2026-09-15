Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02338F651
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458207; cv=none; b=oJvkvCVNG0MqQ3L6AiGDVeSu/joE/l7l7lxWuevGzAI1+m445+zS8G+0W4TWFbqDg8zf5leiR05kEts0r3IpB8UFKd63k1cWjRinQyEb8kOHGtKRpoEZ979v3Fi8y+PQVQ8TwO3JoQ1Ng6yG0WNpOqueOQf+Hr0cBpbdIrE01Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458207; c=relaxed/simple;
	bh=stVV9mCGas8evRyrExND34hSOV/MPhW8WuUFZMU3Fvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ngIFXwoogsvra+9SoPi+CJA+lybQtZWKg61xwrm/Iy0J756Vj2NE71DPg2yk0jWQe+dXc5oMEMFxeKmt3fpr3KephQdyVyxJJR6waK7Nd6y04m7fV1JeXUOkO7Shp9ePO3OQhwbNoEiXzNstK0k21uhnEcg4YfichgQ7zAZyuP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYUew4fh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYUew4fh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FC41F000FF;
	Tue, 15 Sep 2026 07:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789458203;
	bh=yCBjEMObcj+R8JeOKa896+VLt619wd5w+eUVXp4WU+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IYUew4fhfg1bexZ86XGD4czHZ620Jkkzb+UthJCPpdeP7/KXvX/CF6jmuiHdQX43H
	 S+TwU/3io2TrvEW7NxZA0cmOgPgd1DmgoDys2f+HhVlP2PnBRH2cAIpLkfwJRQkgm2
	 jwkunpbdt0aFcOQP2aPwfXGYZ5K8EzKQ7L2kf0AyctOuynmV9Dvp9+xVLzI2m1ZqAT
	 UU9YYUN1PI6YqAb37tCZ9TCdn2fa6J17tkiZ0KsNwt8v6c/cJGB3xmrvxwANMAcrVM
	 0fSv/BWjLEV5OatDXH/i5Id25acO2ft1bHiA/nLcUl8xOc7e3aWb/fCoARg3FlrY0W
	 saMjI9tkpAlFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/11] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guodong Xu" <guodong.xu@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
 <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 07:43:23 +0000
Message-Id: <20260915074323.A8FC41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] riscv: RVA23U64 detection incorrectly requires legacy B extension
- [Medium] riscv: riscv_set_isa_bases couples independent profile evaluatio=
ns
--

commit e0026c8e3b6f0de96cacfa903bced9ce7509616a
Author: Guodong Xu <guodong.xu@oss.qualcomm.com>

riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection

Introduce a per-hart and host-wide bitmap of conformant ISA "bases", comput=
ed
at init time by riscv_init_isa_bases(). Register it as an arch_initcall to
ensure it is evaluated after core_initcall sets up PMLEN features. This all=
ows
subsequent consumers like hwprobe and /proc/cpuinfo to read a consistent ca=
che
of base profiles.

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
[ ... ]
> +static void riscv_set_isa_bases(unsigned long *bases, const unsigned lon=
g *isa_bitmap)
> +{
> +	const unsigned long *isa =3D isa_bitmap ? isa_bitmap : riscv_isa;
> +	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) =3D { 0 };

[Severity: Medium]
Since ext_mask is initialized once and never cleared, will this cause bits =
to
accumulate across independent profile checks?

For example, if a future orthogonal base is added later in this function, it
would inherit stale bits like RISCV_ISA_EXT_I and could falsely fail the
bitmap_subset() check.

> +
> +	/* IMA */
> +	__set_bit(RISCV_ISA_EXT_I, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_M, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_A, ext_mask);
> +
> +	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
> +		return;
> +
> +	set_bit(RISCV_ISA_BASE_IMA, bases);
> +
> +	/* RVA23U64 */
> +
> +	/* Supm with PMLEN=3D7 */
> +	if (!riscv_have_user_pmlen(7))
> +		return;

[Severity: Medium]
Will this early return prevent subsequent profile checks from being evaluat=
ed?

If riscv_have_user_pmlen(7) evaluates to false, the function aborts
completely. This seems like it will inadvertently skip the evaluation of any
future bases added after RVA23U64.

> +
> +	__set_bit(RISCV_ISA_EXT_F, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_D, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_C, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_B, ext_mask);

[Severity: High]
Does this incorrectly require the legacy, unratified 'b' extension for
RVA23U64 detection?

When the kernel parses a DT containing the mandated individual Zba, Zbb, and
Zbs extensions but not the legacy 'b' extension, the isa bitmap will not
contain RISCV_ISA_EXT_B.=20

Consequently, the bitmap_subset() check below will evaluate to false,
preventing RVA23U64 from being detected on compliant hardware.

> +	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
[ ... ]
> +	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
> +
> +	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
> +		return;
> +
> +	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-rva23u64-h=
wprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com?part=3D9
