Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAE03DB651
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994089; cv=none; b=BLj8YjfwBDsp4U0vz1ZwXl3iSNwIZNPs4JqWIxEQXfoUxz/q5P1kAX2kgA2MAMU9fXoHFS9XCoDdf1oDbb2SW7uIQsQGxUX4AMrhlXg23Ccihb1fALhTtC54Amwo7mFSy/dUM4doX5BNu53u60wXTz1lGitAgqk+d/OooyU5mmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994089; c=relaxed/simple;
	bh=nHGlkRJ75BhxiqYS25fCxlZu4mM27NVQUCDOHdnQ5wM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kHPjOHkJajCi1kZrvwOY/bgt7yILSK1CEsv2L3RJsdWqyvboAYCOaO5wdw/IoPHDYACt6Ns5glMfG/pH38AmPN7BfiIEteNfV/qrC4UhcLIplCBzwCvEmC3GQEi6s9j8MKkk2UTQ4kiQj5nLPBGvdM9p6bgTfLaxGU2UJVvfb5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAbPjZGW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAbPjZGW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742501F000C4;
	Wed, 14 Oct 2026 16:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791994087;
	bh=drYYxaek0jJZUf6qB0impicKBIxDQhs89hynF7U6K80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YAbPjZGWQpjls47WvEvQqtX15CeNHEg+GspggXu48lWNrVPpuZIdVAGY6bUo0s6ko
	 uW5xRHCy8hfFLV43Vs8vErt4LEUIHPFFVhsfJUnjxAUYncYTXNwcvkTp1oGpLXZMe0
	 qFFbtC8Va4+6sWgmRn2jBgWrxwPIREdueP5mOhcM4nJ78eU68isri/ALZDEn/JmILS
	 3bMUydto/IdnNIxSuI+4+gHollI0PnGaD7fLQY9oB50SlGFVglpR/IUCml5CWmMsIJ
	 Aee53twU47Jbzr1AzM+eW+9A6CCszF0TDaLtgUnz1L1QGIfJZqCy0OzH1aGFUhjVA1
	 qAncHJzWbLwaA==
Message-ID: <sashiko-outbox-171515@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt
 to LLCC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faiyaz Mohammed" <faiyaz.mohammed@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-master-v1-4-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-4-aba3cfcfbac9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 16:08:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] edac: qcom: UAF in IRQ handlers due to asymmetrical devm vs manual=
 teardown
--

commit fab541f0482e82717fee45392a6aa89253bbeef9
Author: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to LLCC node

Add a second interrupt for LCP/SRP DDR DRAM ECC reporting and
interrupt-names ("llcc-ecc", "llcc-lcp-ecc") to the Shikra LLCC node,
as required by the updated DT binding.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 2623e139196f6..ff572c003b396 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1108,7 +1108,9 @@ llcc: system-cache-controller@e00000 {
>  			reg-names =3D "llcc0_base",
>  				    "llcc1_base",
>  				    "llcc_broadcast_base";
> -			interrupts =3D <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupts =3D <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names =3D "llcc-ecc", "llcc-lcp-ecc";

[Severity: High]
Does adding this new interrupt expose a use-after-free race condition in the
EDAC driver?

In drivers/edac/qcom_edac.c, devm-managed IRQs remain active until the devr=
es
phase, but edac_device_free_ctl_info() manually frees the payload object:

drivers/edac/qcom_edac.c:qcom_llcc_edac_remove() {
	...
	edac_device_free_ctl_info(edev_ctl);
	...
}

If the newly enabled lcp_irq or the ecc_irq fires during module removal
(after qcom_llcc_edac_remove() frees edev_ctl but before devres deregisters
the IRQs), can the interrupt handler dereference the freed edev_ctl?

drivers/edac/qcom_edac.c:llcc_lcp_ecc_irq_handler() {
	...
	struct llcc_drv_data *drv =3D edac_dev_ctl->dev->platform_data;
	...
}

This could lead to invalid memory accesses, unpredictable behavior,
or a kernel panic.

The same race seems to exist on the probe error path if
edac_device_add_device() fails, leaving the IRQ active until the function
returns:

drivers/edac/qcom_edac.c:qcom_llcc_edac_probe() {
	...
	rc =3D edac_device_add_device(edev_ctl);
	if (rc) {
		edac_device_free_ctl_info(edev_ctl);
		return rc;
	}
	...
}

>  		};
> =20
>  		gcc: clock-controller@1400000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-master-v1-=
0-aba3cfcfbac9@oss.qualcomm.com?part=3D4
