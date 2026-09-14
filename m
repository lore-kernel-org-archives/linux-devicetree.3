Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6BB415F08
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380859; cv=none; b=UP1iCvpuK11nO1qjjMFWiY3hhVLcuSGWrhySGjPqluQgdUalU8uShoDhNPkNUEPOITh5GZJ2U1e+pS5d0WPHNyYzfQLSr+OSEamqATiuQeKJp6YODeNWgwVhMyZ6nswv8bfPVbkWZwQE6QCM08rmH3aGQfvpXfWKDXAo5TSpXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380859; c=relaxed/simple;
	bh=ND54zP4E5qpqzsM4D4OTFXCufpmZ3NHGMoJ83u/FFVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o3Y7XWbimagQBSOuo//VEd3bT6yRrCm0/uxXiobn/ZJXqaQYZ48rvkTcEUUkCLI5hTfXyBRarL9l7NN3iKFdxBkkGtSpLyBZ1Nk+v9WmYMtOblzwGmk9i/z4l+qXcDJRTa9dVSkvB0TKM58M+/yfiOTzxBO203+iiEcKMHdSaYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYVUiJVL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYVUiJVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034911F00893;
	Mon, 14 Sep 2026 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789380856;
	bh=j2IJSJyuyvYy1s3pyeu+qwktKWG6Apdrf4CAI1e1Zfw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZYVUiJVLPwpF1opDrsVChag6itjLkHxRBoiHO/leyyNC+IHnb45/D9Avn3R+Tg/oz
	 SJLM03BwaCvPt4rLca/9UgTXhQPMNbl+hMExWjomJeTrpwUyErHwkhtOeCrFlFNJV0
	 kHDUACTqFMdc9bnD6JQSnbqvsGDzUi4FHGXRYkYDNQ/lwQ++NWP15MPc3zWWSBNcwp
	 1t1OKk4GFbwXSUKUHxyAylICX+Fq92HS64bthWw19cD3bnb6zaEaHD+y4m86NHXM+C
	 dtxIAFOq3YZxc77ghJRbDUKv10NyF6OBy0F9p96kFNORGR534YRgJAIV1HRFFTdNmL
	 DpeL4D//pVPqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host
 controller and PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shujath Mohd" <shujath@outlook.in>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <PUZPR01MB514158F5EDA660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB5141BA498FEEA594E61CCFB1C3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <PUZPR01MB514158F5EDA660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 10:14:15 +0000
Message-Id: <20260914101416.034911F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Enabling the UFS controller on the Sony Xperia Tama platform w=
ithout the required driver workaround risks erasing the bootloader and perm=
anently hard-bricking the device.
--

commit 91d507f63b9143b3c7a96ab7389c84dca2784cd5
Author: Shujath Mohd <shujath@outlook.in>
Subject: arm64: dts: qcom: sdm845-sony-tama: Enable UFS host controller and=
 PHY

This commit enables the UFS host controller and PHY on Sony Xperia Tama
devices. It removes the previous status disabled guard and configures the
necessary regulators and reset GPIOs.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch=
/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
[ ... ]
> @@ -774,9 +774,21 @@ &uart9 {
>  	status =3D "okay";
>  };
> =20
> -/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
> -&ufs_mem_hc { status =3D "disabled"; };
> -&ufs_mem_phy { status =3D "disabled"; };
> +&ufs_mem_hc {
> +	status =3D "okay";
> +
> +	reset-gpios =3D <&tlmm 150 GPIO_ACTIVE_LOW>;

[Severity: Critical]
Does enabling the UFS controller here on the Sony Xperia Tama platform
without the required driver workaround risk erasing the bootloader and
permanently hard-bricking the device?

The original commit (30a7f99befc6) that introduced the platform explicitly
documented that sending a specific UFS command on these devices effectively
erases the bootloader. If the system or a user issues that UFS command,
such as via block discard, secure erase, firmware upgrade, or during
specific error-recovery paths, the device becomes unbootable. Userspace
operations such as fstrim or background kernel maintenance tasks can trigger
these commands.

Is the required downstream UFS driver workaround (kholk/kernel@2e7a9ee)
ported to the mainline drivers/ufs/ core? Removing the status=3D"disabled"
protection without the driver-level mitigation active appears to expose
users of this device to a known hardware brick, even if normal boot and
reboot cycles appear stable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/PUZPR01MB514158F5ED=
A660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com?part=3D1
