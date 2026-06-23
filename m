Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD38371048
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179732; cv=none; b=s1uger6MHBqGiAMMWdtPccARGTle03dnCoObxTgk19HryZk/O32QPsf7L5iGjSEM/G+d3kXCutVmyGwFuDPeHplTSfSCpSGJ5hfw/M9ddBTc1AskGMEUpUhHRvF9jTkK60eo+UZk+MHoSUVOJnAHEV3fUQHtmKinuj1E5MS9jyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179732; c=relaxed/simple;
	bh=FXpymLlYRu5/nAoMycuDmIKJ8Tobnn9AXX2k4rHc2vA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vAm9cUHN49SEMLYNKTVLMrxQHYNCZJPaGsM4o0yZNbbN0KenxeOU3H/PTo9P8034D/oxdvwVVmo+FLr7OEmMyOqjv8tEI59w4lvpwkfj3NwYpsmS/Ngo6SldltDfieYS4cPUeloSbmvL/xCjcLvfzfgyeub8dDTlWa3cqGS/k24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fc/Evi4X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fc/Evi4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B40E1F000E9;
	Tue, 23 Jun 2026 01:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782179731;
	bh=UsbgGg7EN+kYAaD9kOchGVkRoV7cgUzxPovRCHIx8+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fc/Evi4XknK80haoc6ITH8yTCf0zOGGWDHkv2BEtVsxfdGXRVDp/t3EUs+v8rITuq
	 /aR7hR2HtR4nLIrcOnpwd90xk+2MgKXFesF0zDqD6qnG+Js9KZ38anw1c+gLwvm0o1
	 93fpe9h6lrRXNrntp9N1Ewn/ULTnIpnbK6vHMA2kV+G7XLhH/OZzIxt0wpRD0DyJzc
	 pBcpOr4JPQM/yqpyRoDramGfdyFcfH9sZIWcYg5lSu/XxBlwCuqN6lwzGpsNqXEp6/
	 SarqnUSpNY2rQxvtK03budXddeHMQTmzm6tb2cT3e9qnSvucHAUVi8WEEj1fPx5gGu
	 +nLsSmkbiJzCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bjorn Andersson" <andersson@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 01:55:30 +0000
Message-Id: <20260623015531.1B40E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing regulator configuration for `&smb2370_j_e2_eusb2_repeater`=
 causing potential USB port failure.
--

commit 8c025a2ed8f0bc5c7861b62d7eff8a38ae127ae5
Author: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)

This commit adds device tree support for the Asus Zenbook A14 (UX3407NA),
built on the Qualcomm Glymur platform. It configures the typical platform
capabilities, including NVMe storage, screen, USB, and HDMI.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dt=
s b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
> new file mode 100644
> index 0000000000000..734fd3aea5d02
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts

[ ... ]

> +&smb2370_k_e2_eusb2_repeater {
> +	vdd18-supply =3D <&vreg_l15b_e0>;
> +	vdd3-supply =3D <&vreg_l7b_e0>;
> +};

[ ... ]

> +&usb_0_hsphy {
> +	vdd-supply =3D <&vreg_l3f_e0>;
> +	vdda12-supply =3D <&vreg_l4h_e0>;
> +
> +	phys =3D <&smb2370_j_e2_eusb2_repeater>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Does this configuration miss the supplies for &smb2370_j_e2_eusb2_repeater?

The usb_0_hsphy node references &smb2370_j_e2_eusb2_repeater, but unlike the
k instance (&smb2370_k_e2_eusb2_repeater) shown above, the j instance does
not have its vdd18-supply and vdd3-supply configured in this file.

Without these configured, the driver falls back to dummy regulators. Since
vreg_l7b_e0 is not regulator-always-on and is only requested by the k
repeater, usb_0 might lose power and fail whenever usb_1 is suspended or
unused.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-zenbook-dt=
s-v1-0-3f80f680381d@oss.qualcomm.com?part=3D2
