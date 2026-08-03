Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3D372EFA
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751237; cv=none; b=S4h0YJ7+fJQGxcDbGdmjxy2rdiDKzcIef1LybZY9yIqvhjlFKP00MKbr4iIKF240ZSkJ54Z/dPy9PSQoAHsDmJJKczGEacdU58GpiZ1ThYtqTAB8XrWTusDWNWOnwI/LeYEzxlV8TI39Ymm9als4xo7vIu2xLnzm3gImSsJPCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751237; c=relaxed/simple;
	bh=tcq+NfikfbLQ8jKxRv+FPVL9FcZ5yGHyV7cYgFT8fb4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E3Zfu/a0Zw5ZuWndxYKu1biWhyiEQPStpXAHWVa2K1RVEccTKDjTaCyR3litYrJoCzIB5w5Wrho9mjqZ18hlnmmV9wLClU8UNtC302KmWK2hDgujnxkhpFOsld1jLY7FP9i2/YgVSY1zkeBKDCOwZmkb3Vc85k9Bmzxr8oWEaps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maiJofX8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maiJofX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139691F000E9;
	Mon,  3 Aug 2026 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751235;
	bh=vhIiPuKdiD99XKyI/KBKLbn1uwcu23QsuHv1LIMGDFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=maiJofX8yRBwhKcCJUfu8VGSPiEZnZtQI676esJUgDVBS/H/KYNXPotUshMueL/4q
	 oPpGDD+/YteRveNmnTM7r43xtQS7S2KOqF/HWFge8tEKPvkqoCfBFxSQkN8yOgWmGx
	 jXcGfaADwUJf1ltHf5/kuD0dJJZsVqXzSjX01YxCGVlOnKLQJK4SV5rfRLuZqdRX2j
	 ep4cSDlzlax0LaWtchss08x6mm8ZjeTgc/rv50UTbOrh2yQ1/Y5JyDmfe+NQccxF7X
	 BHofYFK8BX9An5B9gweamLdNMscIrfsV5DhsH2gHTi8Ti6SjTZIep+DnL2TiFpy1ob
	 5juCnDe+RF0Pw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v4 6/6] arm64: dts: rockchip: rk3576-rock-4d: enable
 NPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803094125.3285895-7-gahing@gahingwoo.com>
References: <20260803094125.3285895-1-gahing@gahingwoo.com>
 <20260803094125.3285895-7-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:00:34 +0000
Message-Id: <20260803100035.139691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `vdd_npu_s0` regulator is forcibly kept `regulator-always-on=
`, defeating runtime dynamic power management for the NPU.
- [Medium] The patch only enables the first NPU core (`rknn_core_0`), leavi=
ng the second symmetric NPU core (`rknn_core_1`) disabled.
--

--- Patch [6]: [RFC PATCH v4 6/6] arm64: dts: rockchip: rk3576-rock-4d: ena=
ble NPU ---
commit 2ef1c8164923c68f245bae8c6ee995f5fd70d4d3
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: rk3576-rock-4d: enable NPU

Enable rknn_core_0 and its IOMMU on the Radxa ROCK 4D and supply the
core from vdd_npu_s0.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64=
/boot/dts/rockchip/rk3576-rock-4d.dts
> index 272af1012ab03..965e0906bd07e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts

[ ... ]

> @@ -442,6 +442,7 @@ regulator-state-mem {
>  			};
> =20
>  			vdd_npu_s0: dcdc-reg2 {
> +				regulator-always-on;

[Severity: Medium]
Does keeping this regulator always-on defeat runtime dynamic power manageme=
nt
for the NPU?

The regulator will remain permanently powered, leading to unnecessary power
drain when the NPU is idle. Could we remove regulator-always-on and instead
assign this as the domain-supply for the NPU power domain so the generic
power domain framework can dynamically toggle the voltage?

>  				regulator-boot-on;
>  				regulator-enable-ramp-delay =3D <400>;
>  				regulator-min-microvolt =3D <550000>;

[ ... ]

> @@ -869,3 +870,12 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>  		remote-endpoint =3D <&hdmi_in_vp0>;
>  	};
>  };
> +
> +&rknn_core_0 {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_mmu_0 {
> +	status =3D "okay";
> +};

[Severity: Medium]
Is there a reason to only enable the first NPU core (rknn_core_0) and leave
the second symmetric core (rknn_core_1) disabled?

Since both cores share the same voltage supply and power domains, leaving
rknn_core_1 and rknn_mmu_1 disabled limits the board to half of its
physical AI compute capacity.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803094125.3285=
895-1-gahing@gahingwoo.com?part=3D6
