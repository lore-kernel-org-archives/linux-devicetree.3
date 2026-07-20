Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D83C3C19
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579754; cv=none; b=qk49GNy3bUTLKeW+Z+h2SRnEjK3KuasMnJ+Xb+i75WkjMAy2zg4zIfQy5fpCDgMZKek2XTOhfiI0EWwys+C+yHSrkz9tpIdE64PfZwjS/c1e9gwvWsKbkD5evoJ8PI/4DBW+tL9mLk/HBLOw4de2ljCPzXTauRX6vYkAysJ4NXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579754; c=relaxed/simple;
	bh=LKBa0IcDyCrnEjJNsctbP2Xwo6WmjgVdM1W94qyMz8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JbLMvbdBzIK4d6L7MnFBeqF7SC9duYfH6BNOOmETrdKhsok4hu7vUP3dt5txgZC3W2aiABSD2P7QiBp2+VmcrItMY4lme68pJm49oGCA7yrVjskcq07y9wuKemEtuwlACzgnkk44AwV9zQxCPLKEx1D1rtAC0lffluI3ADtlPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4aPZ1yG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4aPZ1yG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EC01F000E9;
	Mon, 20 Jul 2026 20:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579753;
	bh=1xpJ6voHgmJqi/hVQA+xzNqFhsCNru7P1kJTBLJwzlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b4aPZ1yG9j8FnOc6/3hBUh1t4hWi2m9HBvaJ8uFnJ+5XRLc7SiX3jZMb60EWNlu1i
	 UOBJTuoi9ofEuXM/dkAYeAnmVnSMtm/OWCR7skm3XIDrHHpe5ub8qblujgVR0IO/PV
	 0JPtad3kAdJvx+eFTEZbwOkY0Gwi+0fib6GR+iCeywHg4yK0C46CHtLqDKMZSijSbv
	 uBq9m5vsjyKTy+Y9XiBapkW3n7rETSMcmDnXt/pDr8qvM6VjQDRsPMKYbG4iucPUqb
	 ARGlgkYneXT3hH+HknndaANFf5oYO9pY2B839wOp3JmH7f9NZlw9+8Kvw7N27Tbmsm
	 nUwMmsVHvqC4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: socfpga: agilex5: add support for the
 ECC manager
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720201425.1538771-5-dinguyen@kernel.org>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
 <20260720201425.1538771-5-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:35:52 +0000
Message-Id: <20260720203552.B2EC01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Incorrect double-bit error (DBERR) interrupt index for `emac0-rx-e=
cc` causes interrupt collisions and probe failure.

Pre-existing issues:
- [High] The eccmgr IRQ mask and unmask functions fail for DBERR interrupts=
 on 64-bit systems due to `BIT(hwirq)` truncation.
--

--- Patch [4]: [PATCH 4/4] arm64: dts: socfpga: agilex5: add support for th=
e ECC manager ---
commit ee1cc5ec088dd853387503f3ab86c7b4f685d0e9
Author: Dinh Nguyen <dinguyen@kernel.org>
Subject: arm64: dts: socfpga: agilex5: add support for the ECC manager

This commit adds the EDAC device to the base Agilex5 platform. It also
adds OCRAM and Ethernet ECC device support to the device tree.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
[ ... ]
> +		eccmgr {
> +			compatible =3D "altr,socfpga-agilex5-ecc-manager",
> +				     "altr,socfpga-a10-ecc-manager";
[ ... ]
> +			ocram-ecc@108cc000 {
> +				compatible =3D "altr,socfpga-a10-ocram-ecc";
> +				reg =3D <0x108cc000 0x100>;
> +				interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>, <33 IRQ_TYPE_LEVEL_HIGH>;
> +			};

[Severity: High]
This is a pre-existing issue, but does routing double-bit error interrupts
like 33 through the eccmgr IRQ domain expose a truncation regression on
64-bit platforms?

Looking at a10_eccmgr_irq_mask() in drivers/edac/altera_edac.c:

a10_eccmgr_irq_mask() {
        ...
        regmap_write(edac->ecc_mgr_map, A10_SYSMGR_ECC_INTMASK_SET_OFST,
                     BIT(d->hwirq));
        ...
}

On ARM64, if d->hwirq is 33, BIT(33) produces a 64-bit value. Since
regmap_write() takes a 32-bit value parameter, won't this silently truncate
to 0?

The unmask variant has the same behavior, which means the generic IRQ
subsystem cannot mask or unmask these interrupts during an IRQ storm.

> +
> +			emac0-rx-ecc@108c0000 {
> +				compatible =3D "altr,socfpga-eth-mac-ecc";
> +				reg =3D <0x108c0000 0x100>;
> +				altr,ecc-parent =3D <&gmac0>;
> +				interrupts =3D <4 IRQ_TYPE_LEVEL_HIGH>, <38 IRQ_TYPE_LEVEL_HIGH>;
> +			};

[Severity: High]
Does emac0-rx-ecc claim the wrong double-bit error interrupt?

Since emac1-rx-ecc correctly claims interrupt 38 below, devm_request_irq()
will fail with -EBUSY when emac1-rx-ecc attempts to probe because the IRQ
is not shared.

If the single-bit error is 4, should the double-bit error be 36 instead of
38 to avoid this collision regression?

> +
> +			emac0-tx-ecc@108c0400 {
> +				compatible =3D "altr,socfpga-eth-mac-ecc";
> +				reg =3D <0x108c0400 0x100>;
> +				altr,ecc-parent =3D <&gmac0>;
> +				interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH>, <37 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			emac1-rx-ecc@108c0800 {
> +				compatible =3D "altr,socfpga-eth-mac-ecc";
> +				reg =3D <0x108c0800 0x100>;
> +				altr,ecc-parent =3D <&gmac1>;
> +				interrupts =3D <6 IRQ_TYPE_LEVEL_HIGH>, <38 IRQ_TYPE_LEVEL_HIGH>;
> +			};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720201425.1538=
771-1-dinguyen@kernel.org?part=3D4
