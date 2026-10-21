Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593211;
	b=mVhNH0LrJpjLslbgVn5XlrpHKYp0Yo+Jmwspez5k32pMnOiv02UnSLYiYXr6hozBAiDQ
	 LwU/HYJ6ees5XeEuBO546SeKbF4UVnUMCGKD+bSarF27UiQzdx3xXRAFCoUj8bOkorrWK
	 fiXMze26Nbcts1hrzopixSARVudSp332TnR6n/7iPJ4NGbqhl32uqXnu9u7uLpmtOfy61
	 tMdJWjoxiU5FG50FM4VnC6LV+7CtmPNcZEY3Rtq0/FAi52i8RDm3mnPsDtx0/6UKxvhyK
	 daX8TEPczdF6hOF5KclqJy3F8VFhdyCTWODGFRBS2lhUI4yKHyi7HjdgLTfv3aR4MLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593211;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Mq942IleiIzHrvI1POetZLl7VpsrY3Lu+KxZ4zssW40=;
	b=JoAPACuCCQtTjrRIZ+fZp1UKrJu1XqLK2S4RI+TjaiYjG5mOgQxR/9JJqXfK4CQneWm3
	 jr1doPgt8ccsium7uHxa29jz23MkugGUtXwxU1z7eM58fGWL+6/+CJ901ZsWaK8Az5PM5
	 YZZSMARtycdswioIA7kPYUVfbXudKiQxzNQNa7XzxCoIEVXq4PRpKqMZiYXjYHX3oCqUm
	 +oVwLWZcsGbZzbQ322CiLkvp3W6X2Q7ci1LNCSBydNtxJ4zy6MMQc7xWHP1jekZObrPal
	 vYuEa2hdYz3vRZ14fKcEeixKsk4wxAesyGXzlvE9m51d1ZYxtTMkBZ7fP1pEInbK0xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glefdBlU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E14606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glefdBlU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027B11F000C4;
	Wed, 21 Oct 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593210;
	bh=Mq942IleiIzHrvI1POetZLl7VpsrY3Lu+KxZ4zssW40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=glefdBlUVoNIAwL1WLDg9INhkdeJJNo1zxfP0oEoc5w/WLGS/QMGrwYJKrdPpjtKr
	 Ug6RRhsXbrqqMgWXsEWir87z6DBYoEt/GLcltZ/iTWBWMtHbVbHDYbrvOkvKIaiCip
	 8lT5yckE3NTRzDpPXNRoJ6Bgp/ZHTjOVbqbAoh7YPWaO7XkAzrQ8IsqtlbBsCrBkuQ
	 05j+bi/s2RxgYQ3FgVhSgEgXEn3SshyG/qjMglVn3TIKUDyg7K/PFQ7/wazYo6pN4T
	 F3Uu6yNHsu10Z46pfp+/IwffR7H0afz4QilCCo9ASdgFPYRRS0+/xJupm3mhRMeeYG
	 /BYjXaUsgplRw==
Message-ID: <sashiko-outbox-180381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-quarkpi-ca2-v9-2-b75006b22bc5@163.com>
References: <20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com>
 <20261021-quarkpi-ca2-v9-2-b75006b22bc5@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:33:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: rockchip: missing rknn_mmu_0/1/2 enablement breaks NPU=
 open()
- [High] arm64: dts: rockchip: missing domain-supply on pd_gpu and pd_npu
--

commit e4632e8324e154e7c3c642a2039af079523bc6b6
Author: Bob Hui <bg9oxa@163.com>

arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

This commit adds the device tree for the ALIENTEK QuarkPi-CA2, an RK3588S
based board, enabling its onboard storage, regulators, display outputs,
networking, USB, audio, GPU, and NPU peripherals.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..68ee2c0ad9d80
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

[ ... ]

> +&gpu {
> +	mali-supply =3D <&vdd_gpu_s0>;
> +	status =3D "okay";
> +};

[Severity: High]
Should &pd_gpu and &pd_npu also specify domain-supply =3D <&vdd_gpu_s0> and
domain-supply =3D <&vdd_npu_s0>?

In drivers/pmdomain/rockchip/pm-domains.c, rk3588_pm_domains marks both
RK3588_PD_GPU (&pd_gpu) and RK3588_PD_NPU (&pd_npu) with
need_regulator =3D true, and rockchip_pm_add_one_domain() powers those doma=
ins
off during PMU probe. When a consumer attaches or resumes via
genpd_power_on() -> rockchip_pd_power_on() -> rockchip_pd_regulator_enable(=
),
the PMU driver looks up domain-supply on the power-domain node:

drivers/pmdomain/rockchip/pm-domains.c:rockchip_pd_regulator_enable() {
	if (!pd->info->need_regulator)
		return 0;

	if (IS_ERR_OR_NULL(pd->supply)) {
		pd->supply =3D devm_of_regulator_get(pmu->dev, pd->node, "domain");

		if (IS_ERR(pd->supply))
			return PTR_ERR(pd->supply);
	}

	return regulator_enable(pd->supply);
}

In arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts, vdd_gpu_s0 is only
regulator-boot-on (without regulator-always-on) and both vdd_gpu_s0 and
vdd_npu_s0 configure regulator-off-in-suspend. Without domain-supply on
&pd_gpu and &pd_npu, the regulator core falls back to a dummy regulator with
a warning and rockchip_pd_power() attempts the PMU power-on handshake before
vdd_gpu_s0 or vdd_npu_s0 has been enabled (such as when panthor probes as a
module after unused boot-on regulators are disabled, or across system suspe=
nd
and resume).

> +
> +&rknn_core_0 {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_mem_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_core_1 {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_mem_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_core_2 {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_mem_s0>;
> +	status =3D "okay";
> +};

[Severity: High]
Will opening the NPU accel device fail with -ENODEV unless &rknn_mmu_0,
&rknn_mmu_1, and &rknn_mmu_2 are also enabled?

In arch/arm64/boot/dts/rockchip/rk3588-base.dtsi, rknn_core_0, rknn_core_1,
and rknn_core_2 reference iommus =3D <&rknn_mmu_0>, <&rknn_mmu_1>, and
<&rknn_mmu_2>, which default to status =3D "disabled":

	rknn_mmu_0: iommu@fdab9000 {
		...
		power-domains =3D <&power RK3588_PD_NPUTOP>;
		status =3D "disabled";
	};

Because arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts enables the
three rknn_core_* nodes without setting status =3D "okay" on &rknn_mmu_0,
&rknn_mmu_1, and &rknn_mmu_2, of_iommu_xlate() in drivers/iommu/of_iommu.c
returns -ENODEV:

	if (!of_device_is_available(iommu_spec->np))
		return -ENODEV;

This leaves the NPU core devices without an attached IOMMU. When userspace
opens the NPU device, rocket_open() in drivers/accel/rocket/rocket_drv.c
calls rocket_iommu_domain_create() -> iommu_paging_domain_alloc() ->
__iommu_paging_domain_alloc_flags():

drivers/accel/rocket/rocket_drv.c:rocket_open() {
	...
	rocket_priv->domain =3D rocket_iommu_domain_create(rdev->cores[0].dev);
	if (IS_ERR(rocket_priv->domain)) {
		ret =3D PTR_ERR(rocket_priv->domain);
		goto err_free;
	}
	...
}

which checks !dev_has_iommu(dev) and fails unconditionally with -ENODEV.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-quarkpi-ca=
2-v9-0-b75006b22bc5@163.com?part=3D2
