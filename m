Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768342EED5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899296; cv=none; b=VlWMahtyAlcTqQUo6N3V/8prcdwp+To00mpi5v4XUeI4klfL2HJLsieO/UPv+QX6xj4lSpiHJQrUdwVKQ+5+Mp4u9Ns8QzQhnlx5/4gnBbS5Qj8edIrXqkcs4KvVQkRCrFtKu2Ltre7h4IRRnXmzE2/OmYgh7S3WG85xiRog7gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899296; c=relaxed/simple;
	bh=MOBky9TyIHryKYjm/swaJnxAa04nTGoo48Q+KTOf498=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C8tdLFSFjao+ar/bD4BFA/97ZcOGg0weOE9P/W5RlbxUMCdAJhkJwBE+kBWsLWxfwq2PI6+slQ/9qHiYbypcjuJ3WgVwwXBgBMVHD42K5Ko2jW/bdL/3d5iqXW4MsMDJ/ZZYfk5g+WM+WnqiL/ockdP785kQKFDao84D6DCVPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoTwr1Vy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoTwr1Vy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34B81F000E9;
	Wed, 27 May 2026 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779899286;
	bh=HdDWMIHq/mFPYIxqxsWUL3b6Kj+r6u2T786LNFaBe2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BoTwr1VyZv1jm0ijOTfA7HJD+E5L6/PykqZTLzFnUm87u14CVF/Q0ZdAez2XA1xNb
	 R0Z69/0BVe+u5c5GGb6MUsjKPvPfxs1jeFJVTWwb5QfEE4auSder+48c9jPJHSfkHn
	 9F8B9MZc+6hmZTcNoKMeSWXknzFCC7B75MICIhT4mx5cJTPLpEQw0Fz7KplPUyYhp5
	 H8agxCKMqa/ZKLIuH0PGtvWF2qwQKHD8MhgFZ6F0Hirct4yG5uPuJ3tKtoGVNsox+r
	 Z9gnLDiK9MgDck0IeUp0IwRBKscKEdDZXBbsmyQbS5O6AiVyiUiciOSgI0Stu8d9c3
	 6AKBflpUV4f7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527-shikra-dt-v4-2-b5ca1fa0b392@oss.qualcomm.com>
References: <20260527-shikra-dt-v4-2-b5ca1fa0b392@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 16:28:05 +0000
Message-Id: <20260527162805.D34B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect grouping of heterogeneous cores into separate clusters i=
n `cpu-map`.
- [High] Missing `clock-names` property in the Global Clock Controller (GCC=
) node.
--

commit a88352d8dd5b4d1d3fc313dace6282e258e6b324
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: Introduce Shikra SoC base dtsi

This commit adds initial device tree support for the Qualcomm Shikra SoC.
It enables support for CPU nodes, global and RPM-based clock/power
controllers, interrupts, TLMM, UART, eMMC, and system timers.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> new file mode 100644
> index 0000000000000..a4334d99c1f35
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu =3D <&cpu2>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu =3D <&cpu3>;
> +				};
> +			};
> +		};

[Severity: High]
Does this cpu-map configuration accurately reflect the hardware topology?

The Cortex-A55 cores (cpu0-cpu2) and the Cortex-A78C core (cpu3) physically
share the same Last Level Cache (&l3), and their reg values (0x0 to 0x300)
indicate they belong to the same physical cluster.

Splitting them into cluster0 and cluster1 might cause the scheduler to wron=
gly
assume the cores do not share an LLC, which can impact cache locality load
balancing. Should these cores be grouped under a single cluster node?

[ ... ]

> +		gcc: clock-controller@1400000 {
> +			compatible =3D "qcom,shikra-gcc";
> +			reg =3D <0x0 0x01400000 0x0 0x1f0000>;
> +			clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			power-domains =3D <&rpmpd RPMPD_VDDCX>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <1>;
> +		};

[Severity: High]
Is this node missing a clock-names property?

The gcc node defines an array of 8 clocks, but omits the corresponding
clock-names property.=20

Since Qualcomm GCC clock drivers map input parent clocks using string
matching, could the driver fail to resolve its parent clocks without this
array, potentially causing the GCC probe to fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-shikra-dt-=
v4-0-b5ca1fa0b392@oss.qualcomm.com?part=3D2
