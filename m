Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575226;
	b=CtqS4N2TY0rkgMnZzRNHEEiu0Gk7nX6QsaitlmLmzZD+akrEpBm/yWltXnXuD4afud7c
	 SwmCSZIFTlVi7sEXG0ltPSBHmKF8sgMUWWlr/9T7jSjm5fy3KyCK9qRFse37l+kjMEeeY
	 ReT2fYG1fLKzmwtEaQD16RaqHk7gj7vhxlV63imrgtsNmEjxaUCuupOu79J59wUmBt/94
	 4+NM0U/2doZQ/Y5iX9n7WBG2d8crcTVghDthju5jOXW3R9v9bWXTqU+NKAT5p7JHfjQh6
	 4U6LPkQKtUXg2+uxE9pJc3jNuQJehyI9VJ7pX17WLWeY2JhUDDEGggcwxmrouz5WkjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575226;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A8r/k5hN0McTGZWPQFQOsVgQgAZ0THFJE35pQXKtnqg=;
	b=jGVq2UJIgIN7dlD+sIiiweHl9xYc6+9Fp6+G8KrFP4ice11sDlJ1u9VELpp2hV7LjjcV
	 ouSMqGtcdt43aL9km5eL0FLdX08Jp1S7n0gTx4Wa68MxZcZl3EjHYz7+YY2hpf8E1yylV
	 ocW8gMJKOBYilGEvWxLhqkXZtJE/xVdO0EjX08ztSVYOB4Uru7Ch1l2vsYWjMRJzG+A9L
	 iZr5XOBxrMYMImHjxkUH0RgmPVX+7YBVLlhOMoEEDATcTrpfMPfK1e8rmMNtyV/HGn5e1
	 6uc2duVWfXy29KhTmp0wG9wa6R5araweosuWN008jxrFFAGtqqFosxTWUT4xJjq85eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fenBOW0b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C08960A2616
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fenBOW0b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99491F000C4;
	Fri, 13 Nov 2026 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794575226;
	bh=A8r/k5hN0McTGZWPQFQOsVgQgAZ0THFJE35pQXKtnqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fenBOW0bj5q+z2hgnRcaxzXpiUZ1cnS8srOZ/iMHuD8mc8W1F5LR1Hb5eJ+MKzVua
	 mRYQ2onfhvKfi5KS6ntlq6dmC38bPwlAJ5ow+XkpvV/HQAFYbjPQ8tuaTpksvOnbEf
	 IzKrNpVeOFHSCvodn9qtqZRm0g4C7aSEJltaihzEReqy9phlI/QaO+dlKXaKzzpgFx
	 lSvVHXqejKmy+uMeo5sXI1pSY+cFnabX/cH6Du//jLe7iBy5njI8MATdpy4LDlXp5d
	 AZiJZoh9qnuixzkqqo97jHndjKBktRCOGx0MLhZCyoASnw+JSy9Lzt2tybr40x/dDg
	 NalCDMHp/Vc+Q==
Message-ID: <sashiko-outbox-212822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add EL2 overlay for remoteproc
 SMMU mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anurag Pateriya" <anurag.pateriya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-nord_soccp_el2_dt_change-v1-1-2a7aa55d97dd@oss.qualcomm.com>
References: <20261113-nord_soccp_el2_dt_change-v1-1-2a7aa55d97dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:07:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: qcom: unresolved remoteproc_soccp target in
  nord-embedded-el2.dtso
- [High] arm64: dts: qcom: remoteproc_adsp iommus conflicts with
  early_boot attach
- [Medium] arm64: dts: qcom: remoteproc_soccp iommus exceeds PAS binding
  maxItems
--

commit 7c3911549648c2c9a04bb237b67646f8107b1680
Author: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

arm64: dts: qcom: nord: Add EL2 overlay for remoteproc SMMU mappings

This commit adds the nord-embedded-el2.dtso overlay to define IOMMU
streams for the ADSP, CDSP, and SoCCP remoteprocs when booting Nord
boards at EL2, and builds -el2.dtb variants for nord-ride-embedded and
nord-rrd.

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso b/arch/arm64=
/boot/dts/qcom/nord-embedded-el2.dtso
> new file mode 100644
> index 0000000000000..50c5057f6683a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&remoteproc_adsp {
> +	iommus =3D <&apps_smmu_0 0x09e0 0x0>;
> +};

[Severity: High]
Does adding iommus to remoteproc_adsp break ADSP bringup when booting at
EL2?

In drivers/remoteproc/qcom_q6v5_pas.c, nord_adsp_resource sets
.early_boot =3D true, so qcom_pas_probe() sets pas->rproc->state to
RPROC_DETACHED and rproc_boot() calls rproc_attach() instead of
rproc_fw_boot().  Because rproc->has_iommu is now true, rproc_attach() ->
rproc_enable_iommu() attaches an empty IOMMU paging domain to stream
0x09e0, while qcom_pas_attach() never calls qcom_pas_map_carveout(),
causing immediate SMMU translation faults if the bootloader started ADSP.
If ADSP was not pre-started, qcom_pas_attach() resets state to
RPROC_OFFLINE and returns -EINVAL, and rproc_boot() exits without falling
back to rproc_fw_boot().

> +
> +&remoteproc_cdsp0 {
> +	iommus =3D <&apps_smmu_2 0x0360 0x0>;
> +};
> +
> +&remoteproc_cdsp1 {
> +	iommus =3D <&apps_smmu_2 0x0760 0x0>;
> +};
> +
> +&remoteproc_cdsp2 {
> +	iommus =3D <&apps_smmu_2 0x0b60 0x0>;
> +};
> +
> +&remoteproc_cdsp3 {
> +	iommus =3D <&apps_smmu_2 0x0f60 0x0>;
> +};
> +
> +&remoteproc_soccp {
> +	iommus =3D <&apps_smmu_0 0x1960 0x5>,
> +		 <&apps_smmu_0 0x1966 0x0>;
> +};

[Severity: High]
Does targeting &remoteproc_soccp break the dtbs build when
CONFIG_ARCH_QCOM is enabled?

Neither nord.dtsi, nord-embedded.dtsi, nord-ride-embedded.dts, nor
nord-rrd.dts defines a remoteproc_soccp label yet.  When Makefile builds
nord-ride-embedded-el2.dtb and nord-rrd-el2.dtb, fdtoverlay fails in
overlay_fixup_phandle() with -FDT_ERR_NOTFOUND because remoteproc_soccp
is missing from /__symbols__ in the base DTBs.

[Severity: Medium]
Does specifying two iommus entries on remoteproc_soccp violate the PAS
Devicetree binding and driver expectations?

Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
restricts iommus to maxItems: 1, which causes dtbs_check to fail.  In
addition, qcom_q6v5_pas has no Nord SoCCP match entry yet, and
qcom_pas_map_carveout() maps carveouts with IOMMU_READ | IOMMU_WRITE
without the IOMMU_PRIV flag needed for the privileged SoCCP stream.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-nord_soccp=
_el2_dt_change-v1-1-2a7aa55d97dd@oss.qualcomm.com?part=3D1
