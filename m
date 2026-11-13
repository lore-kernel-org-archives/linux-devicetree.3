Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560251;
	b=MWcdEhaOqIVg9ac2ekA2jfKrzbi2WZJvHoZ900MNBsn0KX/AvW1cWuvFk8LgxHV358vE
	 JxfMJF0ZpqcrOR79ULmFd78Oi8YtqWsvJYEuN/AeEsUF+PkU9h+JTGHG6wPwLiDaKL+ca
	 UNQLMC2ZVPGq1NXY+mlCZyRLgODJLjHuGXJcMMXSrfHYMIGe7Rh+eOAhxjynDwnPRYn2Q
	 XVaCXakZh2K6Rnx+fNaL+260VO/urCZmfPSu3MxV5hMshEVSQ/FYL3FxQeLmQfLSK9hXl
	 9yxUEiD5PPcBmJ9SOO90qd18quDYxapQVMmBkqW6xbc1FtTij3pwZMKRwURn/DiN9xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560251;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8A7dKthLvwoh4RQG7+h9vasbTYupXyW7t8ZWOoNLBDQ=;
	b=G0seAmiVm3wRMp760StggTl66sMRSUMR3kyM9Gs/FFn+8KHUpPB8bsccNN3itcuEactL
	 AriXKdseuHxp9Le+mfqJ00q9aRmzCGLfE3hZ2eiBpXYPYNMS09yBf5g5KsYx1QfB7Wlfa
	 nb3f5nX4AF3dZvrVuR+gXB5oByILsm7XSlyG7EPLgQazoDUHurfxdMt8Td20wcGYVWG+5
	 CPWyJNKVDruCSKId9xWF6YkiVjCkfEIE2B9vTVAE3+xo2hLCfeiwHoNmuwTJE6gwpR5W2
	 Qgy4qbWsI7uTwLB9uY3IRKxM6e2aXLQSVaZ0DrwHYxQonp+iy22Mce766/Y80auBHzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=il7POKc2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA7606A333
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=il7POKc2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8041F000C4;
	Fri, 13 Nov 2026 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560250;
	bh=8A7dKthLvwoh4RQG7+h9vasbTYupXyW7t8ZWOoNLBDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=il7POKc2YIvtaQmSHI2djK/ZFRg2LUWTfSJddZ2HQZH4fOf8KLxf7/HpJyMAdmmIa
	 6hSwkH+vjVHrgaXk9lHF4RrMM2lwl7l7uwnuap1U5Z0wWpEOpdemC30b8s2M9nskD3
	 eDh56iOMgOi2ENtOPRuykaB3ja+i4MOEDrhLow5aSH1zGtVl1oGmegOlzcpOB+cHuQ
	 mgSMAVuU7E7pLdeHMvbHZ8PhwfrG4k592GP7vGkxUHLjVXb6VVR+Fbj3XLOD68BvYR
	 Gv7OkKeoEZID3iymphVo4svvyFDIm7iNV38ZEqOUjSp0qwrQe1L1ApXJSwfGYDsYVx
	 /SyRNRl9iWgGg==
Message-ID: <sashiko-outbox-212484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm8750: describe all MDSS
 block resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
 <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:57:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: sm8750: wrong DISP_CC_MDSS_CORE_INT2_BCR
  reset on mdss
--

commit 40e1c76742905572ea3b661e7e1c52df77536978
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750: describe all MDSS block resets

This commit adds a second display clock controller reset to the mdss node in
the sm8750 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index cf947acc57602..0f3e649787315 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3359,7 +3359,8 @@ mdss: display-subsystem@ae00000 {
>  				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> =20
> -			resets =3D <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +			resets =3D <&dispcc DISP_CC_MDSS_CORE_BCR>,
> +				 <&dispcc DISP_CC_MDSS_CORE_INT2_BCR>;

[Severity: Medium]
Is the second reset entry actually for an interrupt controller rather than a
separate secondary display core domain?

In drivers/clk/qcom/dispcc-sm8750.c, the 0x8000..0x9000 register block holds
the primary display core reset, primary clocks (disp_cc_mdss_mdp_clk,
disp_cc_mdss_ahb_clk) and mdss_gdsc, whereas 0xa000..0xb000 is a secondary
domain with its own clocks (disp_cc_mdss_mdp1_clk, disp_cc_mdss_ahb1_clk,
etc.) and dedicated power domain (mdss_int2_gdsc at 0xb000):

drivers/clk/qcom/dispcc-sm8750.c:
static const struct qcom_reset_map disp_cc_sm8750_resets[] =3D {
	[DISP_CC_MDSS_CORE_BCR] =3D { 0x8000 },
	[DISP_CC_MDSS_CORE_INT2_BCR] =3D { 0xa000 },
	[DISP_CC_MDSS_RSCC_BCR] =3D { 0xc000 },
};

static struct gdsc *disp_cc_sm8750_gdscs[] =3D {
	[MDSS_GDSC] =3D &mdss_gdsc,
	[MDSS_INT2_GDSC] =3D &mdss_int2_gdsc,
};

The mdss interrupt controller in drivers/gpu/drm/msm/msm_mdss.c lives at
offset 0x10 in the primary mdss register space, which is powered by
mdss_gdsc and reset by the primary core reset.  Wiring the second reset here
causes msm_mdss_reset() to assert and deassert the block reset of a separate
clock and power domain whose gdsc and clocks are not attached to the mdss
device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794558882.gi=
t.xiaqinghuan@mail.ustc.edu.cn?part=3D3
