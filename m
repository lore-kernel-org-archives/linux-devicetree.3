Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91AF42087D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401501; cv=none; b=XKYPNOGtn/b4LzyItjZPaPiN1GwCYY/Lhtrv889dM8kE6YoXTIVN9TjXKOsFhKPI2zJwdwpfxzY457TEu3iTpeM6sPAVx24NoYgwGpykencBAoW5c4LFxEyAKhlSfWU2/BkuSHeEHaVfogbLHcY9LEihGpj3anq4FKFTCoQ/eaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401501; c=relaxed/simple;
	bh=UWKqq4bnPtzKjJn/c937GUQJ8DtZMZpyzGnJC6ZfsU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YEeHN/KtuHHG+64UBQrbCO9jWMniFWch48auSkj+1Kk4507+0HvY60H8TMf2nweyY9/4F0afqGUrcLpHZJhk4l02bQ/EgpZRSN0KEC6gz7vTw5E8T0y3LLmzZUrbyBISIxlM/UHv3MYAFbgf+2kx+2ucMfrQNJi9fMFDK4xatc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjRq1R9o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjRq1R9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF181F000E9;
	Tue,  7 Jul 2026 05:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783401500;
	bh=r4+sdoKgiTmrnjb4SgVTgXCcpoWSHat4VDO2pZEWvFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XjRq1R9ocLmSRx8rGSYCqH+BeOFid5ylkK4H4DSdUfGizaphdD7LNQfuBkq8DR7xd
	 nVGLvcUbSlAPa36uMH5lUeGjKg3JJm2l9KT73obQbvgiO28U/qnTNvM8CwqoGVrOsu
	 hJpMZY6HEvjwhvaSCuwr4xrdF16ZKoI8cV8P67qJYcumZtitYK0X262EgByUi+Cn36
	 BTiXODdXQNGWl2P5S9eHxzXxaT1omdG2nU+VbMVaMajE9fR5l75NpwMXbrq4WCoI5r
	 H59vuHQAr9qsIK5rODbJql9ZEfpJ1jv6MpwJgz432gmqGhIBSpRKk9JwLVCHPxETSc
	 zzcHqvekbeMfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-kaanapali-pmic-glink-v1-2-3f7d476672d9@oss.qualcomm.com>
References: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
 <20260707-kaanapali-pmic-glink-v1-2-3f7d476672d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 05:18:19 +0000
Message-Id: <20260707051820.1DF181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `&usb` node lacks the `usb-role-switch` property, causing th=
e DWC3 controller to silently fall back to peripheral mode and breaking Typ=
e-C dual-role functionality.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink =
node ---
commit 904c19a1a664815102c7af84e0fb9891b1a979d7
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node

Add PMIC Glink node on Kaanapali QRD Platform and add remote-endpoint
linkages to DWC3 controller and QMP phy respectively.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot=
/dts/qcom/kaanapali-qrd.dts
> index 55d02219ef4e9..a79ae73acf0de 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
[ ... ]
> @@ -823,8 +866,6 @@ &ufs_mem_phy {
>  };
> =20
>  &usb {
> -	dr_mode =3D "peripheral";
> -
>  	status =3D "okay";
>  };

[Severity: Medium]
Does removing dr_mode =3D "peripheral" without adding the usb-role-switch
property cause the DWC3 controller to silently fall back to peripheral mode?

During boot, when dwc3_get_dr_mode() initializes the DWC3 core driver,
omitting both dr_mode and the usb-role-switch property causes the driver
to fall back to USB_DR_MODE_PERIPHERAL and skip registering a USB role swit=
ch
device.

Because of this, does the PMIC GLINK Type-C driver fail to acquire the role
switch handle via the endpoint graph, breaking the intended Type-C dual-role
functionality?

Should the usb-role-switch property be added to this node to allow the
registration of the USB role switch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-kaanapali-=
pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com?part=3D2
