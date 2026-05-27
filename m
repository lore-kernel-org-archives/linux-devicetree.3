Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F85F3C4164
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877076; cv=none; b=hH90f+RBG+RShKuglMh+HLhDt9vhyQUmHZ3vhEnjULgmfCg9BVkoblQJy0khuwihFDCvqCznWm0Fl1y32uTKUlGuodYcLmgqs6R2YkZqIOwx/ZJ4xYB3strPqcKpJXApxuoXfBYTuPYb5dSF0rXaeJMNyUTgqUY4LBFrxYU/SZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877076; c=relaxed/simple;
	bh=LFS17O6bGmoa0JNFp+ZjlUDXMx85kmZxZbPbozLRFdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gw2mxnPbK/0ctVIOWvprbzhe7OZEdDlBfXCJA4rRb97o+VtBGqRKDO/ybhoG5YhgdAi3p7UiI6niOGt2UIBLclTbu6uuxtqQ38y7J7HzOg3ijbdIIGNAnqAB5UcpEK3YD9usXaWcmgQXhm8KuN8lBAYn4vZokVTjaP03x/nux3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHR1NYdO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHR1NYdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0281F1F000E9;
	Wed, 27 May 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877073;
	bh=v44GXtXboOO6jwCpZN9LEuqor1VAHXokd2dID6MK2Pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YHR1NYdORuDfJPv5H0VLIGJ2tyQX38iuZDeqG3BQ2HbAdJJM6z8umJMTJy0yU4/a1
	 mYBWj/O7GGb689LHdXwOqN6DI44IlS2AvxXSt0mTGdMotiNiSZRat0G5C7mIyu65oN
	 2t7lt559lFbP3xPrnGmlPeWLjInD1LYfF5Sh188qaE7d7/pQiLT7/KO/ZDWXWGZyJo
	 fKmRPX4Hhc+o5Nv4xy/mIKiRwA0mOXw2USNHZKmh6OssHqV8wgcP09ieseTCwzWt0t
	 Yew79QGxIqDgfIyf2X3vHIwvUG1odrniVCgFP3uURmKm/rQJvVpheppxFJ9Fhln6xZ
	 tzhCqz8Bn/5Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/24] arm64: dts: qcom: sdm845: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527094333.2311731-3-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:17:52 +0000
Message-Id: <20260527101753.0281F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC `reg` size to 0x10000 in the device tree trigge=
rs a kernel warning on boot and fails to reduce the actually mapped memory =
window due to driver hardcoding.
--

commit 525b0faef29c12db278a9396c520eabc83c6363b
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sdm845: Reduce OS PDC DRV span to 0x10000

This commit reduces the OS PDC DRV register window size from 0x30000 to
0x10000 in the sdm845 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -5102,7 +5102,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc_intc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sdm845-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>;
> +			reg =3D <0 0x0b220000 0 0x10000>;

[Severity: Medium]
Will reducing this register size trigger a boot warning from the qcom-pdc
driver?

Looking at the driver implementation in drivers/irqchip/qcom-pdc.c, the
probe function appears to enforce a minimum mapping size of 0x30000 via a
hardcoded QCOM_PDC_SIZE limit.

If the device tree specifies a smaller size, does the driver emit a warning
like "invalid reg size, please fix DT" and then map 0x30000 bytes anyway?

Since there are no corresponding driver patches in this series to adjust
QCOM_PDC_SIZE, will this result in a persistent boot-time warning without
actually reducing the mapped memory window?

>  			qcom,pdc-ranges =3D <0 480 94>, <94 609 15>, <115 630 7>;
>  			#interrupt-cells =3D <2>;
>  			interrupt-parent =3D <&intc>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D2
