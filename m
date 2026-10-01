Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CAF5304C0
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868028; cv=none; b=NuGpI3AH88s/Aqp5NAZgEpSoZscasdLjNFak6Gt7evNgvr6kwpxcU3k/J7mTAq9eFSSVNh/X9StxojMJIv1VLMKAygri4j0hiNePc4wbsuYLQowtUrU457hbPkXFnDzl92XJhziMYxoA7SKAzI0sJ9l3KsZWlwKA8s7XtApajYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868028; c=relaxed/simple;
	bh=E5uqCEB6S7rg4EkviTlvStaFlOweUuigJhyy4ZwZ+rc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hX8MF2ETMJLXWbN2o0Y85arY4U77BnN2/rnEg53GyGTi9vowDKRb1QAFom51fKnSnaXrRfn8oH9HRZA1f39cDS7xdJzwZwk9m12rEAfDpOhSW37CZ2LK/zFEhwMSIg/9zAB5uPhVLS8G/F7dGorsAWqB1YZIAgw6zwBCHtGFmMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLb+0LxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLb+0LxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A60C1F00899;
	Thu,  1 Oct 2026 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790868026;
	bh=qnV3AXf7COvE7UFSs5xfqesFLfDgwIvKrs/BzK/toPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gLb+0LxPNjZnlSJdcharxnVfDSvaO07HdbJDMlvOWPs2uhvF3dgpUsb7SSM3pu/Tn
	 MtUQxIDllo+u42TEGBiVvBkQhMgDgGqLUhL6+Q7r2zJowh7c6jWlxTJZzzkZMeKeuY
	 Y3g4AFbM/giJShtZEwNVX8xrwkNAUXqFv53ymMX3ZywcboFDkAAxyEbFgHJOPo0xUQ
	 o0CbU9dm3TU3krw1VXoKVwOJa3MYbfit8esBQKTEjluFb7PbYBuTommVc4Yr7PtlMb
	 2EGXaD5oRJD/yUNy3ZE8Zn5rP1NSnodO8NFMMwBlF1/THpdmzRWT01btJXVAbD5rmV
	 aUquwMFiUunnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261001-imem_restart_reason-v1-3-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
 <20261001-imem_restart_reason-v1-3-79f516906010@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:20:26 +0000
Message-Id: <20261001152026.7A60C1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: mmio-sram maps inaccessible memory into genalloc pool
--

commit 9c529a16f97d21ecf65fd333c3ade51834ef2084
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5332: add the IMEM node

This commit adds the IMEM node to the ipq5332 device tree to extract debugg=
ing
information. It defines an 80KB IMEM region, noting that only the initial 4=
KB
is accessible by all masters in the SoC.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5332.dtsi
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -493,6 +493,13 @@ qpic_nand: spi@79b0000 {
>  			status =3D "disabled";
>  		};
> =20
> +		sram@8600000 {
> +			compatible =3D "qcom,ipq5332-imem", "mmio-sram";
> +			reg =3D <0x08600000 0x14000>;

[Severity: High]
Will this map the inaccessible 76KB of memory into the generic allocator po=
ol?

The commit message notes that only the initial 4KB is accessible, but the
defined region is 80KB (0x14000). Because this node uses the mmio-sram
compatible, the generic sram driver will unconditionally ioremap the full
region and add all unreserved memory into the kernel's genalloc pool:

drivers/misc/sram.c:sram_reserve_regions()
    ret =3D gen_pool_add_virt(sram->pool,
            (unsigned long)sram->virt_base + cur_start,
            res->start + cur_start, cur_size, -1);

If a driver dynamically requests SRAM, or if speculative hardware accesses
occur across the mapped device memory, could this trigger a fatal synchrono=
us
external abort (SError) and system panic?

Would it be better to either restrict the reg property size to the accessib=
le
4KB (0x1000) or add a driver quirk to explicitly avoid mapping the inaccess=
ible
regions?

> +
> +			no-memory-wc;
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-imem_resta=
rt_reason-v1-0-79f516906010@oss.qualcomm.com?part=3D3
