Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A314328505E
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557197; cv=none; b=ohjiFO4D9jyrGJEDHqG3oF1kpzYvzBwDTOh8cCsdoyDPnKgK1Z0kSFtuOEoVPFgofYMBXt2zx5J/MmVJ+Cn6HaPXahX2E+s0TQNdlGM9wHVDycuYe/azwX567nND7HIAeRp1YJ+caWqt3Fp149SpOWJ9Wr5cQwqe0O+nydZ3OQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557197; c=relaxed/simple;
	bh=7tB5QmvWVxkEpWls5kq3zlS+mzxLIsK1FOMav6WhlZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MPNDDFkLBOFxm/PrVaa6FP8ReeRt+0qjjjwRnKgt2yD8D1WDREHrJqYiq4Fy93BWnlNUmWM+jWB+CtOViMpS8VGNbdc9traTCWiwaB/yz2/+a4CJFt6nbX0jzRNT4K2hH7qqC0ftsQBraUCah2pLePLqqiu3LghIKF4Cdswm+hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU2DD32A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU2DD32A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C988C2BCB0;
	Tue, 12 May 2026 03:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778557197;
	bh=7tB5QmvWVxkEpWls5kq3zlS+mzxLIsK1FOMav6WhlZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IU2DD32AcjUCrNRtbHdiWsnAK9N8k0Y/uk5Du1Qi9bPh92Eo91tigY6kg/sYTF4GC
	 Fg4TmEL119ZzxxuXv3T2yQVUP4WL4T8+WfQu/jvyTOyM+k/I2DyC1IkBKqmb57MYMj
	 Ck72QjbrItUcoYgbI6GJZ9qpqkc2Pb3EXTu/Pcyp4IjEn7qF0dxZM5uDWjKAkZkfma
	 oC3S3Bb5eVI+zfM7RlUAi1YxcO3WiXNICJIngnniTQXjZVio7HOupGhm8qo02BChY/
	 WSw4jsFlgAAY9FpBX3wnPNWQYsdXZWG+Aj08Okp9gRehyvQUmjIOGrOfEVyA1UaZ9l
	 WfuzL88pYcRvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 9/9 RESEND] ARM: tegra: tf600t: Invert accelerometer
 calibration matrix
Reply-To: sashiko@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511074859.24930-10-clamor95@gmail.com>
References: <20260511074859.24930-10-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:39:56 +0000
Message-Id: <20260512033957.3C988C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The new `mount-matrix` for the IMU has a determinant of -1, repres=
enting an impossible physical mounting (a reflection) that converts the rig=
ht-handed IMU coordinate system into a left-handed one, breaking 3D sensor =
fusion.
--

commit 932efe31306f429e067a9046fd4c2c18e88b38ee
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf600t: Invert accelerometer calibration matrix

IMU calibration matrix used in the device tree is inverted when testing on
the device which results in wrong screen orientation. Invert it to match
the matrix dumped from the device.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/=
boot/dts/nvidia/tegra30-asus-tf600t.dts
> index 0bebea0cb8c48..5c634b0f3f46a 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
> @@ -1091,9 +1091,9 @@ imu@69 {
>  			vdd-supply   =3D <&vdd_3v3_sys>;
>  			vddio-supply =3D <&vdd_1v8_vio>;
> =20
> -			mount-matrix =3D	 "0", "-1",  "0",
> -					"-1",  "0",  "0",
> -					 "0",  "0", "-1";
> +			mount-matrix =3D	 "0",  "1",  "0",
> +					 "1",  "0",  "0",
> +					 "0",  "0",  "1";

Does this new matrix create an impossible physical mounting by introducing a
reflection?

A physical IMU mount-matrix must represent a pure 3D rotation, which
mathematically requires an orthogonal matrix with a determinant of exactly =
+1
to preserve the right-hand rule. The previous matrix had a determinant of +=
1.

The new matrix negates all elements from the original, resulting in a matrix
with a determinant of -1. This applies a spatial point reflection,
transforming the IMU's right-handed coordinate system into a left-handed on=
e.

While this may superficially fix 2D screen auto-rotation (which only relies
on the accelerometer's linear projection of gravity), will this break the
mathematical parity between the accelerometer (a polar vector) and the
gyroscope (a pseudovector)? 3D sensor fusion algorithms (e.g., Android's Ga=
me
Rotation Vector, VR/AR tracking, compasses) may receive contradictory data
and fail or behave erratically.

To properly swap the X and Y axes to fix the screen orientation while
maintaining a right-handed coordinate system, should the Z axis be inverted
relative to the swap, resulting in a matrix of "0", "1", "0"; "1", "0", "0";
"0", "0", "-1"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511074859.2493=
0-1-clamor95@gmail.com?part=3D9
