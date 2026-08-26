Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B22D73A0
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787718307; cv=none; b=nVOA5X8R5gRDooQFF/Z+Ksnx1BM5VTdQI3N3zroWF2dMWQfEZc8t+ubynzUnZBSv1fCb1oJde0/a8vg7FnbhgbZMi4j4qv/SSwQfkhBiMtbmpy8jzmBLkcwpEXkzHR4X+iXzC1HFnLU6q17dgbrII/L1KxHrfoJhOPCKScMd2yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787718307; c=relaxed/simple;
	bh=Qes2tCXnzQ5JRN3lX3ovM7dorPlXBNjX7ceqzbFR90k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gZFVa+4qDgpU3z/F00y2ZXr/ZJGQQ4vyFiRl1rDZebFLsvXU9T8nMGe/qoOpf/8pekIaBvTm7y0K8fjv9cZhNZGIbfQquHYPGqq37sH9hYVV9PDqe4YpjefmRRcLGtPOcNKeFT1CX8TEO3BJfpo/HCgHfs7HhFswSLkTRtJyaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYftMLBL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYftMLBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FED31F000E9;
	Wed, 26 Aug 2026 04:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787718305;
	bh=b2xn1tP4voFZzGy1Am5VKrcV+UOO+UWLsDqUX4fXCys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LYftMLBLs3MTr95YgIwy8umD2TAVtkflGE4LJxvZ0hbdsb/FPNlLDaT2Cr2KNjj89
	 lBX1rnWpp09+BT9/8MJF7eOk06NpQI9Wau1aUEvB7A0AhmQ120OYwGmhrmmSk5OHRy
	 6EDl1ZsDjz5BbIDF63OnQMSJZDOuH449WbzWvY9DolmUVVb0Slu5tftWI8LTy6M4lZ
	 6EiJx2TQS26Hha/RgN4QYMs8HqIyZ7fuOTakNGqFnSPPwtvl8DkgKPpMrJCCp023+A
	 W9OJlI+sqkfFndU6e48DvelJR7bYgIfpwEk4GfuJhtL2LAwIxHEQTFSy08rDAzXSpc
	 Whd17CNOFQlZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826041200.528588-2-shengchao.guo@oss.qualcomm.com>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
 <20260826041200.528588-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 04:25:05 +0000
Message-Id: <20260826042505.6FED31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] All extreme thermal trip points are incorrectly marked as 'passive=
', missing mandatory 'critical' trip points for emergency thermal shutdown.
--

commit 6e3bfb1f9821f33e3d30b78dc5ea0382cf919e13
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include (nord.dtsi) for the Nord SoC
series, describing core hardware components such as Oryon cores, GICv3,
TLMM, and TSENS thermal sensors with their thermal zones.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..e0496fd40c308
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

[ ... ]

> +		cpu-0-0-0-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens0 1>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <105000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};

[Severity: High]
Does setting the extreme upper threshold (125000 millicelsius) to passive
instead of critical disable the thermal framework's emergency shutdown
protection?

Without a critical thermal trip point, the Linux thermal framework will not
trigger an emergency hardware shutdown via orderly_poweroff() when the SoC
reaches unsafe extreme temperatures. If passive cooling strategies fail
during heavy workloads (especially since there are no cooling-maps bound to
these trips), the temperature could exceed safe silicon limits. Because the
extreme upper thresholds are defined as passive, the OS will take no
shutdown action, potentially leading to hardware damage.=20

(Note: This pattern appears across all the extreme thermal trip points defi=
ned
in this file).

> +			};
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826041200.5285=
88-1-shengchao.guo@oss.qualcomm.com?part=3D1
