Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E343CE79
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921794; cv=none; b=MBtnpoUOSlWEnOYhpFv8R4vxAgq/ZIft+Jd7rLASmPuXw2N5yoSc4jr/jmjHVqau2MHDPej5+RYTnUp1B25zcFH1tyrt1TF6CNEy2C8lgbntd76uvaevm8YIsn1wMuWuyEj1DN/+EmGNYvrVwegRlRSVobL67Q6VZ4MEl9QI9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921794; c=relaxed/simple;
	bh=4pT15ZM7dV8uYeXvHWxtjyVsEn8AdrdDlC4YUW02V9k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=maRZJ3GxkEi19hK7bqfjG/FdgdNpQK9F7AFtLLwPHi+tayWkt0Rce9IMmBhS88vXk0/ludfs8QdkrmRI3+tLJG3Ff44m0dDdYgE50gWpEYT/zij63wbFQNXgqeNVeCgvDIIv7HVzXCiZ2Rr0gh+3mCrxZA7YCs9jCxeEfBUVUcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlVTzn1W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlVTzn1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C921F000E9;
	Fri, 28 Aug 2026 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787921793;
	bh=b036/vlvOzZy0pvU3HXb/Lg8axjx61SNPA0EiuvKQ4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LlVTzn1Wc7XQEx4/Hc1r/xcEiw3OURZwYquzOEVH6tUbAKr2YcB5W5qLH5kfWuX4c
	 hHwEF6dbDbuG5tL58fiqfn49cHl503ZlNC7XFaR1QOB5bOst3aj/v8df4oDFxm59uY
	 1aZi0pUo5jKnI7YVcT5WD2bu6U41aFiRvSso0U/TA3xl9rAqtfjis8hCc+6GMh9XaP
	 WEeTXVTMKvBNcZQq6shgJZ0hgH6NzHh2xozTPtVdRNt2FMb7tRX3fpC4fg6l2483ja
	 v1BUgKEYZpTWmmN1m4XHiNP9Z3FhLsDSG3PRq2L11QY7tWKkmxiw8+FQBJgXAI7DCV
	 SjyrObhxWW2Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/11] arm64: dts: qcom: kodiak: Disable Inline Crypto
 Engine by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-9-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
 <20260828-b4-dts-qcom-disable-ice-by-default-v1-9-1d6e0c2f5a69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 12:56:32 +0000
Message-Id: <20260828125632.B0C921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] UFS host controller probe fails completely if the attached ICE dev=
ice is marked as disabled in the device tree.
--

commit d5ed75549915409ece5532bca3c5d000fa3bc031
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Disable Inline Crypto Engine by default
   =20
Disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it. This prevents the UFS_PHY_GDSC
from remaining enabled while the device is idle on boards with no consumers.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index f2da3706d5c88..ffbf037b38386 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -2586,6 +2586,8 @@ ice: crypto@1d88000 {
>  			clock-names =3D "core",
>  				      "iface";
>  			power-domains =3D <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			status =3D "disabled";

[Severity: High]
This is a pre-existing issue, but does disabling the ICE node by default ca=
use
the UFS probe to fail completely for any board that leaves it disabled?

When a board's device tree disables the ICE node without deleting the qcom,=
ice
property from the UFS node, the ICE node is not populated as a platform
device. This causes of_find_device_by_node() to return NULL:

drivers/soc/qcom/ice.c:of_qcom_ice_get() {
	pdev =3D of_find_device_by_node(node);
	if (!pdev) {
		dev_err(dev, "Cannot find device node %s\n", node->name);
		return ERR_PTR(-ENODEV);
	}
...
}

This error is then returned to the UFS probe:

drivers/ufs/host/ufs-qcom.c:ufs_qcom_ice_init() {
	ice =3D devm_of_qcom_ice_get(dev);
	if (IS_ERR(ice)) {
		if (ice !=3D ERR_PTR(-EOPNOTSUPP))
			return PTR_ERR(ice);

		dev_warn(dev, "Disabling inline encryption support\n");
		return 0;
	}
...
}

Because ufs_qcom_ice_init() treats -ENODEV as a fatal error rather than
gracefully falling back to disabled hardware encryption, the entire UFS dri=
ver
probe aborts and storage fails to initialize.

>  		};
> =20
>  		cryptobam: dma-controller@1dc4000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-b4-dts-qco=
m-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com?part=3D9
