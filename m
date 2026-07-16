Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B605E42F6E0
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213799; cv=none; b=lD1Rb+O0kzobXYXqSBW5uU1MXZGu8C8ou2gR4AsZxdn5mI4D0BHVnU5Wvr+QXoYl0Ppy6icEMii76xS0/xrZvPaMU8ecIVKyHVvLAq0jAJzK6fXFqvLvhTxGoPRBXzyzzb/9pvtkoWcmiNI56M6P2/ONgVZ0rahFnrPmpOQ1GQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213799; c=relaxed/simple;
	bh=SWBP01s/m1vPA/mPcbb2vkHHDikS1i3ck+muvdfw1oY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S3Yd/15Pv68d7AuskaITdT+2WIrzTv5+5TqMdrRb1PIf25pELfuTr6qJDNi+x9b8D9YqLSNpPY6dJMixHHV2merKohmbogOhG9QOEFPRlTm9B4y0JwHR5/YQK2ylnJ6Pv8Ub3S5XNDU/f434q4qLUiU/bh390l87aq7/ioivhdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5G1ijFH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5G1ijFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617FD1F000E9;
	Thu, 16 Jul 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213798;
	bh=SB9V62YbGf2jK474E47EqA3eiCtYNcsoQtpuKvYZDtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j5G1ijFHK+Nbw4dyaCmT7QmBf9BTyxkyaJGpVKXsG4PCWDHYqrJkjacMCClLtKopx
	 /uRIv5elBVcZpdw3eCYIG2H5yv79bfunzqZt6K81I3c4p6gcDGxiNUOELwg9tUxLsH
	 dPFHyAO8KWDF6trsMvCOpP2BjdCRwEwbb4f9cEGDZtm4CZUmfRU9T7xRi/SrcnbD/3
	 jKL90/VhsqFmUy8zB02Av9Jpk01Qy8ZNvmhh4+uWuQoYakkriqaD5x/2KTNCIOC8lE
	 AX2iyM9oWjhQMOFOS0WXon+8ei/OD8qCh4gA7R0v53r/Rh2R4LB+9ZHlPSezon4iZj
	 Lczu51a9+DJoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:56:37 +0000
Message-Id: <20260716145638.617FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused SCMI channel 15 enabled in device tree
--

--- Patch [5]: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ri=
de board ---
commit e4e282e1a5c3a7d85da20a185bf57e0515d81e29
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord Ride board

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant. Configures UART, UFS storage,=20
and thermal zones.

> diff --git a/arch/arm64/boot/dts/qcom/nord-ride.dts b/arch/arm64/boot/dts=
/qcom/nord-ride.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-ride.dts

[ ... ]

> +&scmi3 {
> +	status =3D "okay";
> +};
> +
> +&scmi11 {
> +	status =3D "okay";
> +};
> +
> +&scmi15 {
> +	status =3D "okay";
> +};

[Severity: Low]
Is scmi15 needed here? It doesn't look like there are any devices in this=20
board or included dtsi files that consume its protocols.=20

Enabling it will cause the kernel to map shared memory and issue SMC calls=
=20
to discover protocols (like power domains, DVFS, resets) that have no=20
consumers, which wastes a small amount of memory and boot time.

> +
> +&scmi23 {
> +	status =3D "okay";
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716142605.2398=
433-1-shengchao.guo@oss.qualcomm.com?part=3D5
