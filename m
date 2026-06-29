Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A68835A395
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719963; cv=none; b=GaBaU8OZ0zs64wIFdIbUXreaj4sjW2uKEX6nqoHI8959d8IWA+khzD6Ub1ncvdhcl8bXSqnDRofuoWV2BPcW7GJ8hOFN7+MT2yeTknL826IK+E1ymXdU3yEikXeHCRopSpy13pS/19RZr1TknfIc95mfTiL0HHozbchDyiVzwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719963; c=relaxed/simple;
	bh=ilmp5/r/vxILNKwXrWpGltehB7NXG6vcL72NHeYieR8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ND2osnERDxI7dczSaez8xfIuW5QlNdlgrpVToezuyVluZhw1KwFWMyNwx/gEQnNZY2O8X4RngFYuMzcAwAcFEo9cm5DUNIybcNpu3unthPWyrOoAi+s8NBCizMOSjzdcrnAxob+4I9G0zlZL2XGKelGqH3IQ9sQE/7RwMaqu0co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/gPVgeU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/gPVgeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EB31F000E9;
	Mon, 29 Jun 2026 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782719961;
	bh=w9glr4HeWElJLpE2bR3Nca6kaifVNh6xp9EHnrn2qwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h/gPVgeUjgKt/caC0TphV9W1LP1KjHU3KprU4Ya12v5iY1j9vzQG+QLgPcaRe5QkO
	 lMuc37InDdFWM0UI7wR26GzdwSAj1ASQtyFukKUrH6qVpF9BSuiQHgwpTJCQJNanNG
	 YMLOV50qgz13oMW/Deao5ZfFTk1rGydXUKFb6K2WJEIifXzYnwodkd1PNLjcpMlU6E
	 7HdC3A3anuQ867MY22HZWFNVLpd3ViojGtdAdwZVp5Z8qU3zy4NJLmtlMcOT+GGi23
	 KZhkVtX08Fry9bBMz3UhbcPa5NcwJM68M90WYCxmWUoJxaaKU9bmaEAEVewYfNmgWq
	 ZdmVvMnZrOtgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuldeep Singh" <kuldeep.singh@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:59:20 +0000
Message-Id: <20260629075921.77EB31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Moving ICE to a standalone DT node with a dedicated `power-domains=
` property permanently prevents the core `SC7280_CX` domain from suspending.
--

commit 069378a35dbb2b4d5a77519ee0c458e99459094d
Author: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

arm64: dts: qcom: kodiak: enable inline crypto engine for SDHC

This commit adds the dedicated inline crypto engine (ICE) node for kodiak a=
nd
references it from the SDHC controller. It keeps the ICE node disabled by
default in kodiak.dtsi and enables it in the respective board DTS files.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index fa540d8c2615d..633ebfd86352d 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
[ ... ]
> @@ -1076,6 +1078,18 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		sdhc_ice: crypto@7c8000 {
> +			compatible =3D "qcom,sc7280-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg =3D <0x0 0x007c8000 0x0 0x18000>;
> +			clocks =3D <&gcc GCC_SDCC1_ICE_CORE_CLK>,
> +				 <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names =3D "core",
> +				      "iface";
> +			power-domains =3D <&rpmhpd SC7280_CX>;

[Severity: High]
This is a pre-existing issue, but does adding the power-domains property he=
re
permanently prevent the SC7280_CX domain from suspending?

The genpd framework automatically powers on the SC7280_CX domain during the
qcom-ice driver's probe sequence. However, the qcom-ice driver in
drivers/soc/qcom/ice.c lacks pm_runtime support.

Without a call to pm_runtime_enable(), the device's disable_depth remains 1,
causing pm_runtime_suspended() to unconditionally return false. When
genpd_power_off() evaluates the domain's state to determine if it can be
suspended, it sees the qcom-ice device as active and aborts the power-off
sequence.

Could this keep the domain active indefinitely and prevent the SoC from
entering deep sleep states like CX retention or power collapse?

> +			status =3D "disabled";
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-ice_emmc_s=
upport-v8-0-1a26e1717b85@oss.qualcomm.com?part=3D2
