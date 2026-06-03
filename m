Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C0F3E9C17
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503102; cv=none; b=KKZ3wG9+ziJ8c000RCUC9UXxup+1919BsAdI6NvOx6lxRD2UM6H9cBCpo5rDjKiIRT3S0Qk/23zRPxHNa0U5TySh8MF0vGQpJdXsTQY7p+/qBg9aBnPgjjS9iLWWquyMz5szXV2OnweT51vl7maB7gjuCU0E99hAB4yu+IoYWz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503102; c=relaxed/simple;
	bh=y2QuyY9y2+W4x7yh5ykXMaqwBn2DYWfupWcvW61vm5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FWfEV2nqFESQDrT2TzKD+cvSgQOI5c1uL8/kmJK8lCR+ScNsbub3rFnm1JWVL3+olKFjblTLd7Ib9t/HD4ysmqhk9Dq3wf0PV1qogSpxqyPgdejMlYhVffuX6Mmn9yloj6LEQEXLPjU4+iM6mMyD3K5kN7iKLFZCYe47uc5rkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RV8e9YxZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RV8e9YxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB40E1F00893;
	Wed,  3 Jun 2026 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503100;
	bh=QN1r+q0ZGpsWtyExTWja+w3VVP7AF6HclrwBJiZg1N0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RV8e9YxZgKgxplc0wyZf6S/YX0W+LrurLrpDYm+Sh0qWTDuHNmAQSiD0eBNAwZ+D+
	 dCspjZROPUKxQyi9EaLmqjWCJjXeYH+QddR1lPSxJZGGLRXnLLcsDRMgubjb3bDOkr
	 pA8MLHAqJkPoeg61YsHYSRG7iOqHLL8FRGzyRveRi9uV9uKNPS5pH7skOZoye3Q42p
	 AcEd0FDDTd6JSotFHM/e74ZvJS1C3WZUe1R6L2/xLWZcyt6bTfVjMKYp/XHxCudBQ6
	 JjhFbISdXTCTxvJWFwFYlP07sWFd2hjtYQzcJ2cbdxdXyIjZU/Av8Gmu9rCkXHrJ4b
	 0ZqB+WW0PNaaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
References: <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 16:11:39 +0000
Message-Id: <20260603161139.BB40E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The vibrator node (`pm8226_vib`) is enabled in the device tree but =
is completely absent from the commit message's detailed list of initial fea=
tures.
- [Low] Invalid property `chassis` in the root node; should be `chassis-typ=
e`.
- [Low] Inconsistent device tree filename and Makefile entry.
--

commit a5fd28eda39f46cd80de271c0a53f281a8f9fdf4
Author: Erikas Bitovtas <xerikasxx@gmail.com>

ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

This commit adds a new device tree for the Sony Xperia M2 (sony-eagle)
smartphone, based on the Qualcomm MSM8926 SoC. It includes initial feature
support such as the framebuffer, GPIO buttons, regulators, storage, and
various sensors.

> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Mak=
efile
> index 32a44b02d2fa6..6b471a346d829 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_QCOM) +=3D \
>  	msm8226-motorola-falcon.dtb \
> +	msm8926-sony-xperia-yukon-eagle.dtb \

[Severity: Low]
Is this filename consistent with established naming conventions? The other
MSM8926-based boards in arch/arm/boot/dts/qcom/ typically use a qcom-
prefix. Should this be renamed to qcom-msm8926-sony-xperia-yukon-eagle.dtb
to match?

>  	qcom-apq8016-sbc.dtb \
>  	qcom-apq8026-asus-sparrow.dtb \

> diff --git a/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts b=
/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
> new file mode 100644
> index 0000000000000..8ca834796e2c8
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
> @@ -0,0 +1,403 @@
[ ... ]
> +/ {
> +	model =3D "Sony Xperia M2";
> +	compatible =3D "sony,eagle", "qcom,msm8926", "qcom,msm8226";
> +	chassis =3D "handset";

[Severity: Low]
Does this property name pass dt_binding_check validation? The standard
property for specifying the system form factor in the root node schema is
chassis-type, not chassis.

> +
> +	aliases {
[ ... ]
> +&pm8226_resin {
> +	linux,code =3D <KEY_VOLUMEUP>;
> +
> +	status =3D "okay";
> +};
> +
> +&pm8226_vib {
> +	status =3D "okay";
> +};

[Severity: Low]
This isn't a bug, but this node enables the vibrator, which is absent from
the detailed list of initial features in the commit message. Could the
commit message be updated to mention that vibrator support is also included?

> +
> +&rpm_requests {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-yukon-eagl=
e-v2-0-f86b440583f5@gmail.com?part=3D2
