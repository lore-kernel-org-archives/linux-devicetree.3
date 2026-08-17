Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8D3B2FFC
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962902; cv=none; b=m1cTn+kikuAysJwHe3hegIxtf7Iropa0m1+Z/EFsPba7KUDspv4TRMzGYvb52OaqMw13uVM8QhCHcETWFgGaKfQrJrWwcZU4Uh9pOU4SGhngHp7QQjkBLVnVzzkAtNa1Fd0XBtPqULQ/dtpqvCtQk9LCP48rw0prpygqDyKXxNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962902; c=relaxed/simple;
	bh=UMQgFGJ9PmCYaM+Wym02fA6KY5uW/MhKdqphBO8RPo0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NceaEIf8ncdirIB2JIRME3H5/AGGBx4U4R1kYs6AO3EIQaI4z9KmEVNTwctH7LW67gJsIwqU3ei+kPztvII2hHehcnumxPijfYUDsEFIN74golilJj2HeCDUU4Cxg439p6JrOhC3yR0O7fkfpZdUsBolEr8xUPiapOKyuxeWCHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dm7xEGf8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dm7xEGf8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B4E1F000E9;
	Mon, 17 Aug 2026 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786962901;
	bh=DPpwiJVuoxhKtWtZsq29RRMNJHZMl68KBgMpI+wnHJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dm7xEGf8zVcNkaw8ftBSvyEO0wHakrKdg0Q2/XWXnjDRuv0ZB7IhuvSTlSPOD+r6D
	 vnvkP+ClzrbN+aygezeCdyXNu+LJ11q0erHygGGUZz62dkgV9+zYroBSR56VzJdlqV
	 m870soGtycrD2JuhOHqo3KYBkAsPKqc9bBnOEuyGCc3jytW5/kqiesQHZKPDlzJ8fI
	 2yzjhimmJUYy1djWN9jyAm41sYI7XDFvc5kwqbPTcLg2sUT9SIthweY5lrFJax0eFE
	 RX38OklaSDdFmVRR4u/Em+LU7JrAb3QDM0iQpRpcGsQkPKv/XoKPS0S0n3CK3PnUGi
	 HDgDiTHtm0c9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Watch FE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-for-next-lucky7-v1-2-42ffb2b71ba2@member.fsf.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org>
 <20260817-for-next-lucky7-v1-2-42ffb2b71ba2@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:35:00 +0000
Message-Id: <20260817103500.B4B4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unaligned `no-map` simple-framebuffer region causes memory attribu=
te aliasing.
- [Medium] Invalid usage of `reserved-memory` for memory-mapped devices and=
 regions outside system RAM.
- [Low] Missing unit address in the `misc-rmem` device tree node.
- [Low] Mathematical error in memory calculation in commit message and comm=
ents.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: exynos: Add initial support for Sams=
ung Galaxy Watch FE ---
commit 6f30a8a96fda7068a12749f38925083c1838f92d
Author: Aiden Isik <aidenisik@member.fsf.org>

arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE

This commit adds initial device tree support for the Samsung Galaxy Watch F=
E,
including bootloader framebuffer and memory definitions.

> Only the lowest 490MiB and highest 512MiB of memory are used for now.
> The 488MiB between the addresses of 0x9ea00000 and 0xbe680000 is excluded

[Severity: Low]
This isn't a bug, but the math in the commit message seems slightly off.

0xbe680000 - 0x9ea00000 is 0x1fc80000, which is 508.5 MiB, not 488 MiB.

> diff --git a/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts b/arch/arm6=
4/boot/dts/exynos/exynos5515-lucky7.dts
> index 0000000000000..f91ea7e44cf86
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts
> @@ -0,0 +1,106 @@
[ ... ]
> +	memory@80000000 {
> +		/*
> +		 * Use the lowest 490MiB and highest 512MiB of memory.
> +		 * The 488MiB between the addresses of 0x9ea00000 and

[Severity: Low]
This isn't a bug, but similarly to the commit message, the calculated memory
size here is 508.5 MiB, not 488 MiB.

> +		 * 0xbe680000 is currently unused due to any memory accesses
> +		 * in several ranges between those addresses causing the core
> +		 * performing the accesses to stall.
> +		 */
> +		reg =3D <0x0 0x80000000 0x1ea00000>,
[ ... ]
> +	reserved-memory {
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +
> +		framebuffer@9e0cf000 {
> +			reg =3D <0x0 0x9e0cf000 (396 * 396 * 4)>;
> +			no-map;
> +		};

[Severity: High]
Does this unaligned size combined with no-map cause memory attribute aliasi=
ng
on arm64?

The region has an unaligned size of 0x99240 (627264 bytes). The no-map
property drops this exact byte range from the kernel's linear map, leaving =
the
remainder of the page (0x9e168240-0x9e169000) to be mapped as Normal Cachea=
ble
memory.

When the simple-framebuffer driver calls ioremap_wc(), it maps the entire p=
age
at 0x9e168000 as Write-Combine (Normal Non-Cacheable), creating an attribute
alias.

> +
> +		misc-rmem {
> +			/*
> +			 * Some of these regions belong to memory-mapped
> +			 * devices, and will be assigned to drivers as support
> +			 * is added.
> +			 *
> +			 * Other regions belong to the TrustZone firmware
> +			 * and should never be touched.
> +			 */
> +			reg =3D <0x0 0x87000000 0x200000>,

[Severity: Medium]
Is it valid to use reserved-memory for memory-mapped devices and regions
outside system RAM?

The Devicetree specification dictates that reserved-memory regions MUST be
contained within a defined /memory node. The misc-rmem node includes
addresses (e.g., 0xa0000000, 0xb0000000) that fall within the
0x9ea00000-0xc0000000 range explicitly omitted from the /memory node.

Additionally, since these are MMIO regions, shouldn't they be described as
device nodes on a bus rather than reserved RAM?

[Severity: Low]
This isn't a bug, but this node is missing the unit address @87000000
to match the first reg entry, which will generate a unit_address_vs_reg dtc
compiler warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next-l=
ucky7-v1-0-42ffb2b71ba2@member.fsf.org?part=3D2
