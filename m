Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898562;
	b=Lvme37001jpioWBhFYPIH8QJF562EXzi8kjkivkuj+NodPcUA2+SRb/DEbevmdN1Yj4x
	 dgvOWBPjs8lH/XyKQDXW5hQMo/s66C/qR9W32yBi5j+q5lkL6p3ixd39jg3CZuwn6UQm2
	 hnJhae7yGTcz8zZgqMp3lj9cQ8ynZjIMdzOOAl55eFtuMBuiVil7FkLM9X3OOEjmlbdLV
	 EN8JGKf4JHqUVuJDzpvwZEmKSciKglQXJdypFtIg7lMhmY4om92rQZaxg70fCWdA7/voB
	 Zh5KxpagUACGL59vv5Nyya2NKA3HRIagKTA/rCaf53fnbXxhd4ZfyJKvfCVrjop7yGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898562;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/xr1+UAGQ7zHcz7qG13dT3Rk/AfQf69SlV83Tvx75Sc=;
	b=zHW9/awTwd5TBLaYaN5Jzui/8Y2ZSFEfGE+c7kXKByaI5aGC/dY7wGCxIFtaSrziNPl0
	 pN00lhi8eUucxJ/r6QMhM/izfo5DXIYcZRRGGqW9idx8IBJgPIZ0BKYAxGCs0x04TejMq
	 mnTDnw7Hp5FGKMnYc+/s5B5A1aXBR/vZ7C7tfdWA2GId67X2GXM5yMwvtjqGBllb9yiGg
	 QSHi8vANjmZJvLvzcUCxnkDhvBt2SAyCk+wY4gH+FhESWt4DwX4EMQiQ9dTRhIGy2PifV
	 x/JyDbo0VBdcqqUfpX/wrR8sI4nw0wM3DaEVibDkJYWJNiVGL/2DpdKNqYMUo+uAHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqhZMj6q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30208606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqhZMj6q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7991F000C4;
	Tue, 17 Nov 2026 06:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794898561;
	bh=/xr1+UAGQ7zHcz7qG13dT3Rk/AfQf69SlV83Tvx75Sc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VqhZMj6qnfhLATFxWZre6WlleqotR8GAidk7rbr+VPOBbYutbvQ82Ji48Vh3FI6ZQ
	 ismOFzTzgKMKZ88NfqlDyUL19IGdDOHyLcDs6swKVs7rRqvvbuuADS5caOepkBIUA/
	 Vn0hT02Ep3jWZkL55d5lKdyVpneqWitMhAH8Dse8dvYqmfRLnyS4XMR2hkKf/N0yyv
	 8KGYxg7tBodLFoCatqkf/I/dcAfVYsw7GFuD2eNEDGAS1RduvtfGdBK0ObVcRgUAFX
	 qARyikDyTdt8TFkHpR9C1OwzXC3dEnwPRW8k3Tm9+r27KR4+Ks+bGAo9jA1wwPWyVl
	 coEcWgxytU1xw==
Message-ID: <sashiko-outbox-218283@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: eliza: Add iris video codec
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:56:00 +0000
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
- [High] arm64: dts: qcom: eliza: missing iommus on iris node breaks
  iris_probe()
- [High] arm64: dts: qcom: eliza: reversed MX and CX required-opps in
  iris_opp_table
- [High] media: iris: missing slice_caps, wd_intr_mask,
  icc_ib_multiplier in eliza_data
--

commit a19bdea4d1c4719e401fe9a32254505afdb19a2d
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add iris video codec node

This commit adds the Iris video codec device tree node and its operating
performance points table for the Qualcomm Eliza SoC.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 4a125ef386c02..0c13d3f9b6c17 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -3429,6 +3429,104 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		iris: video-codec@aa00000 {
> +			compatible =3D "qcom,eliza-iris";

[Severity: High]
Does binding to eliza_data (introduced in commit "media: iris: Add support
for Eliza") leave .slice_caps, .wd_intr_mask, and .icc_ib_multiplier
unset?

Unlike the other VPU3x entries in
drivers/media/platform/qcom/iris/iris_platform_vpu3x.c, eliza_data omits
all three fields.  When multi-slice encoding is configured,
iris_set_slice_count() dereferences a NULL slice_caps pointer:

drivers/media/platform/qcom/iris/iris_ctrls.c:iris_set_slice_count() {
	...
	slice_caps =3D inst->core->iris_platform_data->slice_caps;
	...
	if (fps > slice_caps->max_slice_frame_rate ||
	...
}

Leaving .icc_ib_multiplier at 0 also causes iris_set_icc_bw() to vote 0 peak
bandwidth on video-mem, and leaving .wd_intr_mask at 0 causes
iris_vpu_watchdog() to ignore hardware watchdog interrupts.

> +			reg =3D <0 0xaa00000 0 0xf0000>;
> +
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains =3D <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_CX>;
> +			power-domain-names =3D "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx";

[ ... ]

> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			dma-ranges =3D <0x0 0x0 0x0 0xe0000000>;
> +
> +			status =3D "disabled";
> +
> +			non-pixel {
> +				iommus =3D <&apps_smmu 0x1940 0x0>;
> +				iommu-ranges =3D <0x25800000 0xba800000>;
> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu 0x1947 0x0>;
> +			};

[Severity: High]
Will placing iommus inside the non-pixel and pixel child nodes instead of
on video-codec@aa00000 cause iris_probe() to fail with -ENOMEM?

The qcom,sm8550-iris binding requires iommus directly on the video-codec
node and does not define #address-cells, #size-cells, dma-ranges, or the
non-pixel and pixel child nodes.  At runtime, iris_probe() does not parse
those child nodes and instead calls iris_reserve_iova_region() ->
dma_iova_try_alloc() directly on the top-level platform device, which fails
with -ENOMEM because the device has no IOMMU attached.

> +
> +			iris_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-192000000 {
> +					opp-hz =3D /bits/ 64 <192000000>;
> +					required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +							<&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz =3D /bits/ 64 <240000000>;
> +					required-opps =3D <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz =3D /bits/ 64 <338000000>;
> +					required-opps =3D <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz =3D /bits/ 64 <366000000>;
> +					required-opps =3D <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz =3D /bits/ 64 <444000000>;
> +					required-opps =3D <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-533333333 {
> +					opp-hz =3D /bits/ 64 <533333333>;
> +					required-opps =3D <&rpmhpd_opp_turbo>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +			};

[Severity: High]
Are the MX and CX entries in required-opps swapped relative to
power-domains?

Above, power-domains maps mxc to RPMHPD_MX and mmcx to RPMHPD_CX, and
iris_opp_pd_table_vpu3x attaches them in that order ("mxc" at index 0,
"mmcx" at index 1).  In iris_opp_table, however, the first required-opps
entry tracks the CX corner (scaling up to rpmhpd_opp_turbo) while the
second tracks MX (capping at rpmhpd_opp_svs_l1).  This under-volts MX to
low_svs at 240 MHz and under-volts CX to svs at 366 MHz and svs_l1 at
444 MHz and 533.33 MHz.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-add_iris_f=
or_eliza-v3-0-02a55a9272ef@oss.qualcomm.com?part=3D3
