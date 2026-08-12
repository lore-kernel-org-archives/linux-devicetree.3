Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96E9339371
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786578768; cv=none; b=qgn0/j6f3IVkrtSosdKl8dPlXilzsnQxyq3mOvtHUBtcUYcXYpJdhg1tWWdJv+FXsfpaBoqX6Lde5DvO+ZOM8TFlLzeOsaZCSGVOFLzmH/bumwlan//HXpnaUrx2/yudqfIYbjNSZs4h60QV8qHpzECKHmsnrTK07YWhOsXOy5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786578768; c=relaxed/simple;
	bh=UJsWvhwI6QoOaQq/b1KUWUDqliWB7OANSwNCjG/cMps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GQ8I4G61RHP/uCAbfAGWRcTGn7Cz3k+qETNmxCb+v3/QrBMB6aC5XmwqFUEoc8MRMk7TM9LlTM4MH9Q5aY4kpEsjW5GPxhC17mkz9nCA+nr25UDN1mgqjH6mokmh4ttVcnLUkynZgh4r6ua0/aaed/5j9iwC3eHvDe5Ef/PuOMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+hUUkKf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+hUUkKf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC211F00A3D;
	Wed, 12 Aug 2026 23:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786578766;
	bh=E61nZ0g5ggTLGlu0SDFuaJU33DJ4KUG4+une4z0PDCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S+hUUkKfWrXwH/W836v9iga8iizdtxxaJCoZvzzMDqtjeqJUEJWffWLshB0UxaOaF
	 /cj3gxe+rbATlXJoUO8zQBkhP28yhGE8L2aoUyfn0vFTP0UfdIfvouztIvKn5nbnUg
	 vvECHidyViHNqD/HVYI4Wywd2zvto+QzCkQy8cmUGwz5+mteux9xWKKyKj3vor/DYU
	 8ARrh8HCfxZ8k3eX/4j3sSlgyf/RnSIGTaY+FOr5a8AzXvci3Ki2eKIlRtxrba287a
	 3jubyGCg+AnFLonvhG2iBlXwcfn+W9YTdwvrvc4DCjjnhHIWIbfad7mU4BZd9VkUV7
	 v0GhiciwCrmDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/11] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guodong Xu" <guodong.xu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-9-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
 <20260812-rva23u64-hwprobe-v2-v6-9-c985af3256b8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 23:52:45 +0000
Message-Id: <20260812235246.4FC211F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] RVA23U64 detection relies on the non-standard `RISCV_ISA_EXT_B` ps=
eudo-extension instead of the mandated `Zba`, `Zbb`, and `Zbs` sub-extensio=
ns, causing conformant hardware to fail detection.
--

--- Patch [9]: [PATCH v6 09/11] riscv: cpufeature: Introduce ISA bases bitm=
ap and rva23u64 detection ---
commit 96d9cbf0b8923400be62f448ef68daf8ad09dfb6
Author: Guodong Xu <guodong.xu@oss.qualcomm.com>

riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection

This commit introduces a per-hart and host-wide bitmap for ISA bases, such
as IMA and RVA23U64, computed during subsystem init. It provides a cached
detection mechanism to ensure system-wide consistency for subsequent
consumers like hwprobe and /proc/cpuinfo.

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index de7cff5f48c34..2ad8a16a0eff3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c

[ ... ]

> @@ -1334,3 +1337,90 @@ void __init_or_module riscv_cpufeature_patch_func(=
struct alt_entry *begin,
> +static void riscv_set_isa_bases(unsigned long *bases, const unsigned lon=
g *isa_bitmap)
> +{
> +	const unsigned long *isa =3D isa_bitmap ? isa_bitmap : riscv_isa;
> +	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) =3D { 0 };

[ ... ]

> +	/* RVA23U64 */
> +
> +	/* Supm with PMLEN=3D7 */
> +	if (!riscv_have_user_pmlen(7))
> +		return;
> +
> +	__set_bit(RISCV_ISA_EXT_F, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_D, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_C, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_B, ext_mask);

[Severity: High]
Does this cause conformant hardware to fail detection?

The RVA23U64 profile mandates the individual bit-manipulation extensions
Zba, Zbb, and Zbs. If a device tree explicitly lists these standard
extensions in riscv,isa-extensions without the unratified B pseudo-extensio=
n,
the device tree parser will set the individual extension bits but not
RISCV_ISA_EXT_B.

Since this mandate mask checks for the B pseudo-extension, bitmap_subset()
will fail for conformant hardware, breaking any system or userspace behavior
relying on this hwprobe base detection.

Should this check for RISCV_ISA_EXT_ZBA, RISCV_ISA_EXT_ZBB, and
RISCV_ISA_EXT_ZBS instead?

> +	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-rva23u64-h=
wprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com?part=3D9
