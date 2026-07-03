Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109AC374A03
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090709; cv=none; b=HWxGlBH4Kwx1Ww2oILIXLNyifTNvEI7aGFQxcCqrF4Fq4F18wnldQsypch9kY3ysELRKa2eA1XbkM6B8lxKJUgGyRlU/2glnQusEdiNKdiEJazKPGj5kp7Kt0jHVKxVHTdD//VKcvTVzvpBvRdDP/KJ1JnZXRVJEWCBsvBo4BYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090709; c=relaxed/simple;
	bh=pYpYiqZ84jTXGXuySY4iYWw4iJlpR/Iq/n280XX5kXY=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ntrRKgaItgRJ/DuLwKFeco4cTEyw0Eo8PN2fUdZioJAcv1lDxC5qpUM+ZBB9o2jZEQpDl1RMFMHPVIgepmaXGYTD8nl4Xr7nT51X40aDGGMg4ir26CYunjL+sHydV8SEabR885n+Erdg62ZUYnlVGA+nRswMGq4WD7KKQckMO04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUbm3HzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUbm3HzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AA01F00A3A;
	Fri,  3 Jul 2026 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783090706;
	bh=DvrpvqGblID0rS++1Ub8v0LgvCo3/roEmjPgZqzuH4I=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=JUbm3HzH6+aLyYQrAOsDFNHakjwJIQmJn26TWpvgPJPr2fQ5Ls35GIRFiLwuLQ2wF
	 0kWSm46NumbWHZW1aya31FnrS9IhfPEI6X+ikYhI6JjSCZ8UUPGYz54Wl0PgBqZRWO
	 Ew7XPsPBi+pBTsVraeiAzTCrqsz76tj8cVEmPx2ccsKGMKPDUNh5nxNY9NAjeJisGa
	 3LE8CWxBGWjSeZxky5Z94mW8g6r0DqLhC76N13SmH97Hd+qwCDkR7uRtLkTXi2nY4h
	 Ii0aS5dJAiWOtSAketLzwanunYCwOvCzDpQ1iiis73k+gjgVMGGJJ9WPDJt6Io1Qm3
	 7TDRGNZQLm46A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: ti: k3-j742s2-ti-ipc-firmware:
 Reserve memory for LPM metadata
Reply-To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703143717.177362-7-richard.genoud@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
 <20260703143717.177362-7-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 14:58:25 +0000
Message-Id: <20260703145826.09AA01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Adding the firewalled LPM metadata region to the R5 core's `memory=
-region` array causes the Linux remoteproc driver to unconditionally map it=
 as Normal Non-Cacheable memory, creating a risk of speculative access viol=
ations.
- [Low] Typo in the device tree header comment: 'J42S2' instead of 'J742S2'.
--

commit c8beda67fe9ff009082210810a32125f13239503
Author: Richard Genoud (TI) <richard.genoud@bootlin.com>

arm64: dts: ti: k3-j742s2-ti-ipc-firmware: Reserve memory for LPM metadata

This commit declares a carveout memory region to store LPM metadata on
J742S2. The memory region is firewalled to be accessed only by TIFS, and
is used by U-Boot R5 SPL to save and restore context during suspend/resume.

> diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi b/arch=
/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi
> new file mode 100644
> index 0000000000000..d66bcd2f4e194
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/**
> + * Device Tree Source for enabling IPC using TI SDK firmware on J42S2 So=
Cs

[Severity: Low]
This isn't a bug, but there's a typo in the SoC name.
Should this be J742S2 instead of J42S2?

> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.co=
m/
> + * Copyright (C) 2026 Bootlin
> + */

[ ... ]

> +&mcu_r5fss0_core0 {
> +	memory-region =3D <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>,
> +			<&lpm_memory_region>;

[Severity: High]
Does adding the firewalled lpm_memory_region to the mcu_r5fss0_core0
memory-region list risk speculative access violations?

During probe in ti_k3_r5_remoteproc.c, k3_r5_cluster_rproc_init() iterates
over all memory-region entries past index 0 and unconditionally maps them
using devm_ioremap_resource_wc().

This establishes a Normal Non-Cacheable memory mapping, which allows the
architecture's prefetcher to issue speculative reads to the region.

Since the commit message notes this memory is firewalled to be accessed
only by TIFS, wouldn't a speculative read from Linux be blocked by the
hardware firewall and trigger a fatal abort?

> +	memory-region-names =3D "dma", "firmware", "lpm-metadata";
> +	bootph-pre-ram;
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703143717.1773=
62-1-richard.genoud@bootlin.com?part=3D6
