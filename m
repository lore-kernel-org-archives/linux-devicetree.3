Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF5D37A846
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516983; cv=none; b=I0X6w4hVgqZNb762HtvZ/cJcIsZxePF8QdEMCGxj6gNXx4kx//xx2I0O/xRta39L7se90jnsoL8oYr4iaFzwpg88A9yQ4fByfHkqF0Dg9p3TQrSpFY2FNcuze0z+5rXnWriHXt96rbSfN406oRUqlv3CtVR/acD2Z8qJbhgDBfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516983; c=relaxed/simple;
	bh=h5T7XUShWjvFwG+rgVZgunp9QKvsTO0KPuJ8FZv/3Rs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jKfmMs9bH/r3cmXgUqIW74ANFzKKuu7ThBd/uRUD+OxlgTVCiyLnBo+cksiKg3rc05ccevW3DphaC2/bfMYmA1vtPcoWrOIZEQ2Yv+xCwIgu4yi5WDfmLgjx/OOrmIoRLR78fVPp5ZjDM2rGf/c00hZEBmqpEMNF9ZM06kPla98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U47oqWPN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U47oqWPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685021F00A3D;
	Fri,  4 Sep 2026 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788516981;
	bh=kYWcM1mi7RauYKI+a8ok3pphJjs4GwJHxHXBTwCo4v8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U47oqWPNgwqhNafu7rJ5bKF/oPOvJPPBUCO4nPuQMagBRCw//ET+7f9UCg8kreUvp
	 adfMGGBc29s1dYwbaDjNp1Udgp999ai7jDkIL+s2WC1sUnpQja409Q5EWamM/mHzXU
	 QQIgJezS4o2s54PmDvrSeoAaSmo+P53zX/+qdoc3/VXKFHGTkZnjPG/OEPc3ZvWALH
	 B1ncGEbSwKjtLP18xltJ1/6eQSHtk2Tr7ylRfC0jdB282msnSCwYgAeIUOWmsiFN6C
	 sNLuJpOVew1VJzchZnlhJiARx88KYZUghPgdWjBaY0RQgnt8RtGERf9qyNRjwrsvGI
	 LjkKVElHp2AHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: altera: move all SoCFPGA device trees from
 dts/intel
Reply-To: sashiko-reviews@lists.linux.dev
To: evon.chiam@altera.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com>
References: <802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 10:16:21 +0000
Message-Id: <20260904101621.685021F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Silent change to the deployed dtbs_install path for the migrated=
 dtbs.
- [Low] Stale MAINTAINERS entry scopes arch/arm64/boot/dts/intel/ to SoCFPG=
A maintainers.
--

commit 49f800875761e8815d7059a16da432b877f9c50f
Author: Chiam, Evon <evon.chiam@altera.com>

arm64: dts: altera: move all SoCFPGA device trees from dts/intel

This commit moves all Altera SoCFPGA device trees from dts/intel/ to
dts/altera/, leaving only the Keembay platform files in dts/intel/. The
move involves renaming the files and updating the respective Makefiles.

Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kern=
el.org/

>     Move the remaining SoCFPGA DTS/DTSI files from dts/intel/ to dts/alte=
ra/
>     to consolidate all Altera SoCFPGA device trees under a single
>     directory. Only the Keembay files remain in dts/intel/.

[Severity: Low]
Does this leave a stale entry in the MAINTAINERS file?

The SoCFPGA architecture entry currently covers F: arch/arm64/boot/dts/inte=
l/.
Since only Keembay files remain there, will this falsely CC SoCFPGA maintai=
ners
on patches modifying Keembay platforms?

> diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/al=
tera/Makefile
> index 540bb5ae746b3..8f41349103b80 100644
> --- a/arch/arm64/boot/dts/altera/Makefile
> +++ b/arch/arm64/boot/dts/altera/Makefile
> @@ -1,5 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D socfpga_stratix10_socdk.dtb \
> +dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D socfpga_agilex_n6000.dtb \

[Severity: Medium]
Will this implicitly change the deployed path during dtbs_install?

Running make dtbs_install on ARM64 typically mirrors the source vendor
directory structure. Compiling these dtbs from the altera/ Makefile would
shift their target installation directory from intel/ to altera/.

Could this cause bootloaders (like U-Boot) or deployment scripts that have
hardcoded configurations expecting the intel/ vendor prefix to fail to find
the DTB and fail to boot? This seems to contradict the commit message's cla=
im
that "The set of DTBs produced by dtbs_install is unchanged".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/802bf0d27fbff9b1ddb=
6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com?part=3D1
