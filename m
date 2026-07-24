Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81F433BA4
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913891; cv=none; b=AtuANf3UJthP1D17eIk3NA05vHgMCu8yDkHU/3HGcX0nLYtQVoq6rM5iwMNBvZnt+U0M4a42R45zn0csaStoydwtb2oZKnOE+IIKQPfp9Tsg4Rr1e8flGNXQKQ+CXrVAeLwYrYEQuhxVDo4MUntByaNtg5H/5oBE6n6Cn4G7VyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913891; c=relaxed/simple;
	bh=Xvsl1lKt/lzK1o5jq1fSU5N55nneYWEqFtmsADKOzp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k93Yg/6uwkmKtCEQWsQV9PBVQ1ya0JdNjgxe5+mKafSVI/Y85j8w0PhM6XWp6PuIliDojy1QGFERD5HcmnGfW3wGCHC90Fsj6g/9mtuo5DnrxW4DOnR1DctMxL4/XB4NiGnxSREVdthOJPH3FaKWa+r6bsiIROYp1boxU1Stmt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKenU+QJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKenU+QJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D0C1F000E9;
	Fri, 24 Jul 2026 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784913889;
	bh=ZhdRoo7M0bTjB+44WoygF/O82WXAw2q6PRyOHHa3y4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hKenU+QJL8TozlcK+ahBDPRsjkKz0GZVAcfZBS2+SZ4b8KGLkGK4Ij+uO09Y9jvXP
	 DorybrzMvDriV4UB29c7nuZntBLsa8P66gz6Y4/WxX9+ekoLOY+wHIvEBnQK+6JqRH
	 TejArI33DbG/0gX/pgHJJcBs1fpDKAZ9/iuAIpN7vOfgq/bdEv4dQ/euIuzP06zdod
	 UPM2yIccR5N+B2hskskk+5CQ3B+AG8cMsGilQfcOyWQk+PSkYDn086oEPIHzwHQM+L
	 rpB6FzwVffhy+ktFO8qZtT9MdWg1HsLKkctDGhhCBqc8r5onAUK1zgdAHCgq/NcPV3
	 gHnOdES8q/nWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-shikra-audiocorecc-v4-3-0a89bb13d817@oss.qualcomm.com>
References: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
 <20260724-shikra-audiocorecc-v4-3-0a89bb13d817@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 17:24:49 +0000
Message-Id: <20260724172449.92D0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unclocked MMIO regmap exposure on IQS variant leads to synchronous=
 external abort.
--

--- Patch [3]: [PATCH v4 3/3] arm64: dts: qcom: shikra: Add support for Aud=
ioCoreCC and AudioCoreCSR nodes ---
commit a056f645f45682f1008b321f5e639505f22bb979
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

This commit adds support for the Audio Core Clock Controller and Audio Core
CSR nodes for the Qualcomm Shikra SoC. It describes different enablement
requirements based on the SoC variant (CQM, CQS, IQS).

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 4e5bc9e17c8ed..b744534572d63 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> @@ -640,6 +641,22 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
> =20
> +		audiocorecc: clock-controller@a0a0000 {
> +			compatible =3D "qcom,shikra-audiocorecc";
> +			reg =3D <0x0 0x0a0a0000 0x0 0x10000>;
> +			clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <0>;
> +			#clock-cells =3D <1>;
> +			status =3D "reserved"; /* Owned by Modem firmware */
> +		};
> +
> +		audiocore_csr: reset-controller@a0b4000 {
> +			compatible =3D "qcom,shikra-audiocore-csr";
> +			reg =3D <0x0 0x0a0b4000 0x0 0x1000>;
> +			#reset-cells =3D <1>;
> +		};

[Severity: High]
Will this node probe by default on the IQS variant?

The commit message mentions that on the IQS variant, no clocks or resets are
needed. Since this node lacks a status =3D "disabled" property, it appears =
it
will be left enabled and probed on all variants, including IQS.=20

If the audiocore-csr driver registers an MMIO regmap without clock manageme=
nt,
could reading from the regmap debugfs file on an IQS device attempt an=20
unclocked register access and trigger a synchronous external abort?

>  		sram@c11e000 {
>  			compatible =3D "qcom,shikra-imem", "mmio-sram";
>  			reg =3D <0x0 0x0c11e000 0x0 0x1000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-shikra-aud=
iocorecc-v4-0-0a89bb13d817@oss.qualcomm.com?part=3D3
