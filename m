Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31472F5313
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428657; cv=none; b=kHhkJD+T38yXLpPd5HiERS+o7/6ypyd++pkEhNLqRlNEqOOyqyl/xRM6lUCMCurHbDO/CcSljc6lylHPP5lHmn1sJybFGg54Pu6iVQinC+F3N4YDlFFMX1offvDKeEghZBEVbIunhtLfTBCX+42Nz2re5GKiHS/y3ILFEw+svbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428657; c=relaxed/simple;
	bh=/ZBIjG0dt/xo++SL/CX9msMWxEK6FJgJ6YRk0pXBckw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SAA1j7Vqz8jlh4F+vxxs4Ujgi8KsX987IA458sjCoB5b95bDntp8IsSfw5KxKQChUPkAw4d8BdbxF4QfSmX4YoZox/laclzF1brBijwnY0+5l5ecUjlIWsxy2L3Cxt2SCUDO/rCCMCHJoqN0Iq7gf4OC+nuwBvYl0Q1pNOlh7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7sYk5tj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7sYk5tj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591F81F000E9;
	Tue,  7 Jul 2026 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783428655;
	bh=Vy5A5FRCYpUzIU6Rj3eVN3syWKDrCPt1IOZxXhx5Uos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E7sYk5tjBfft4QHyyarKRjlvVe4f/KDSa2YAZ7LDhLENBt+/Mr0FNDf5akAKJBI+I
	 VXcEc17eQh5zEQaxrKejjmWOBdkgjGFtRDayLf1zzpMn0yb10S7OWXDK4CbESYEjH+
	 i6XNKpL1Le+ohzKWCveqWepQOtso/zU3RyB1AlFHCepXvydg5M7IfQ6eLFwTEQ1YJ5
	 2NexLnSdNi7u71Wp9QH18yYyxZ2TK7E/8KLoaCSVXrd21T6m0EBQls13FGP3mOWtDa
	 hG3hY5eCezxKmJ4X6Pj3iDkCMRkuNauN7VyNuwfVbtqKTDQfNVnyUKn7hPcwpoQADC
	 G+Mn7nvDwAQjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add device tree for SA8797P
 Ride board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707123902.3868016-5-shengchao.guo@oss.qualcomm.com>
References: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
 <20260707123902.3868016-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 12:50:54 +0000
Message-Id: <20260707125055.591F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unnecessary enabling of the `scmi15` node without any consumers =
in the device tree.
--

--- Patch [4]: [PATCH v4 4/4] arm64: dts: qcom: Add device tree for SA8797P=
 Ride board ---
commit 2bf6cb71544bf0d531e0d5f6d64fb13a53cb31fc
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for SA8797P Ride board

This commit adds the initial device tree for the Qualcomm SA8797P Ride
reference board. It configures primary and secondary serial ports, enables
UFS storage support, and defines various thermal zones sourced from SCMI.

> diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/=
dts/qcom/sa8797p-ride.dts
> new file mode 100644
> index 0000000000000..d1c28698a9709
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts

[ ... ]

> +&scmi11 {
> +	status =3D "okay";
> +};
> +
> +&scmi15 {
> +	status =3D "okay";
> +};

[Severity: Medium]
Is it necessary to enable the scmi15 node here?

Looking at the device tree, there don't appear to be any consumers for scmi=
15
such as scmi15_pd or scmi15_dvfs.

Enabling this channel could result in spurious SCMI probes during boot. This
can execute unnecessary SMC calls and potentially cause boot delays, SCMI
timeouts, or firmware errors if the channel is not provisioned for this
virtual machine.

Could this be a mix-up with uart15? I noticed uart15 is enabled in this pat=
ch,
but it typically draws its power domains and performance scaling from scmi11
rather than scmi15.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707123902.3868=
016-1-shengchao.guo@oss.qualcomm.com?part=3D4
