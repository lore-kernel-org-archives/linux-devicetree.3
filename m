Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6D447812
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823946; cv=none; b=MzVrnDoZq4uHdrn2p8WnniMFNdX8mpV0EjuaxAMzblO34tUC36cymmxs03++n5wpVWuM7YhzHUHZlGvwI3Os82TMdDjBGzox1KjEgX/7PzxwVYuSna3v1n2KrgM6uc4/rcHEsibiLxWWbzEgMykboyEsFb3Unqj+Oy0cDvi2ydA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823946; c=relaxed/simple;
	bh=+fBjyUrawxADdAgOwoSfkFz0tULE6iYdjb7CJBxW6Sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iTifoL0ECyBNTJ60BYfAYKUMThlDDAOu2ZSE9mg+84KpBnTmtNdqbQO0eZ+zYWug1FPs2jIjkAVhghsgpDmNVAjM+gBrrmsBfwzL7EdjjWoMvCqyDufEiKFeLEwApMpBI10P8TBnF2J1y6OH/1Jlb77sZ+UrGBkY/a311Meq7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F340B1F000E9;
	Thu, 23 Jul 2026 16:25:38 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:25:34 +0000
Message-Id: <20260723162538.F340B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `audiocore_csr` reset controller is unconditionally enabled by=
 default in the common DT, exposing unclocked or XPU-protected registers on=
 the IQS variant.
--

--- Patch [4]: [PATCH v3 4/4] arm64: dts: qcom: shikra: Add support for Aud=
ioCoreCC and AudioCoreCSR nodes ---
commit b6e6ad0368fe6b888bc449723d713689e91d35e8
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

Add support for Audio Core Clock Controller and Audio Core CSR nodes on the
Qualcomm Shikra SoC. The clock and reset requirements differ based on the
audio subsystem enablement across variants. Notably, the IQS variant does n=
ot
use soundwire codes, and therefore requires no clocks or resets.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 4e5bc9e17c8ed..b744534572d63 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
[ ... ]
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
Should this node default to disabled or reserved status in the common dtsi?

The commit message notes that the IQS variant does not need clocks or reset=
s.
Since the status property is omitted here, the node will be unconditionally
enabled by default in the common dtsi.

If HLOS probes this device and registers a regmap with debugfs, could a sys=
tem
diagnostic tool or a privileged user reading the regmap entries trigger an
abort?

Accessing unclocked or XPU-protected registers via
/sys/kernel/debug/regmap/a0b4000.reset-controller/registers could panic the
system on variants like IQS where the hardware is inaccessible to HLOS.

Would it make sense to disable this node by default in shikra.dtsi and only
set status to okay in the board files that require HLOS access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-shikra-aud=
iocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com?part=3D4
