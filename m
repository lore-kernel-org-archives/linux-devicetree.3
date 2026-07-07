Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528DD372045
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410956; cv=none; b=dERREt407BX1vaP1fga0P7RWIwMbt77VnD8vnx0BM/4KiJkWTd0p+4zzS4iLifNsHknCrAeNUzsNTg5NhjJk7In2lIPVzVLoPyMRAYg4OXfcIuKtSK0qDUwfxra+84TrDjwix3u1DFs4z4GFSFkbr4QXrv+v4IuDdHyEKU0ii74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410956; c=relaxed/simple;
	bh=cf2ilN7eLatU+SF8wBU9/5ekZQIujExaJD0tPFadOVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MhyZBteVFD/9rgn5e3WcLqnj1lFPvNtNZrADp5T7NvdUhzHqnS5JcaapkC9aZ2C+jmjQwKDwnmTaZ4yFydkfS/RBVNBPtgJl7AHk5fizUcqYxf9gpb9l1n0/CzcxKZugGaYLZPlsr1OVjGuiq+y24yYaH62XsbaB3ZL9DjeMprw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnCEf3jh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnCEf3jh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8E41F000E9;
	Tue,  7 Jul 2026 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783410955;
	bh=gDAbgYizi7UaAVjp/HG1Kw4ncBOHvNrlzxzupxaDBpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LnCEf3jhRnmd5x/5+dwVo1hXZN8MvcijBcIPP9lmWHU2wUTqj6KNPy6MFGuVuzcLW
	 9uIu8AZJl/ZH1Y5xMozBrV8WACFjgdSXThSav7EfBzKzVs3lBI9be6ubTDq4YspSRp
	 noC+JR9t0sTfFapdk3gxZxQ47EW9CwJrVlC799acGZgFcX4KRzgvNA+YMzdVaUYDuS
	 4pvM5RlUTpTa3xHcKrWjvSPsMeXb9J8UW4qo8bi+jooHkx0ZeGSDnVpSNWlbLXnz0s
	 1Hwh7e42HErCgCul6QVSOG+tjJsvUVHwx/gIveEiUoWLoQm5Zuz/WU7KL5g9/x0Cjg
	 4dD1PovhJgo1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuldeep Singh" <kuldeep.singh@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 07:55:54 +0000
Message-Id: <20260707075554.BB8E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `qcom,ice` property is added to the SDHC controller node (`sdhc=
_1`) but is completely missing from the `qcom,sdhci-msm.yaml` device tree b=
inding schema.
--

--- Patch [1]: [PATCH v9 1/2] arm64: dts: qcom: kodiak: enable inline crypt=
o engine for SDHC ---
commit d2f9d6d523de87c6105a372982b5405f3d09ebde
Author: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

arm64: dts: qcom: kodiak: enable inline crypto engine for SDHC

This commit adds a dedicated inline crypto engine (ICE) node for kodiak and
references it from the SDHC controller via the qcom,ice property. It also
sets up the necessary power domains and clocks.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 90e50c245c0cb..3692be65cc21b 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
[ ... ]
> @@ -1050,6 +1050,8 @@ sdhc_1: mmc@7c4000 {
>  			qcom,dll-config =3D <0x0007642c>;
>  			qcom,ddr-config =3D <0x80040868>;
> =20
> +			qcom,ice =3D <&sdhc_ice>;

[Severity: Low]
Does this new property trigger a dtbs_check validation error?

The Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml schema uses
unevaluatedProperties: false. Because the qcom,ice property is not
currently documented in that schema, adding it to the SDHC controller node
here causes make dtbs_check to report a validation failure.

Should the binding schema be updated to include qcom,ice alongside this
device tree change?

> +
>  			mmc-ddr-1_8v;
>  			mmc-hs200-1_8v;
>  			mmc-hs400-1_8v;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-ice_emmc_s=
upport-v9-0-701c86f3c25b@oss.qualcomm.com?part=3D1
