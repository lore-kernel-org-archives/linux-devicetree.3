Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73F13DA7E2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176160; cv=none; b=FFbThaWjLSxm3xH6yc6hCOOjXyHHRiilHg0wrD9H/CeFXVqL32ANmPeUGwbADEdDWaHtrN13NUYZSwSDrBYtkQOTIy+vHF2/vK4FWGSgewW/sT8/7qC4ekNBPXkAcwXTBMwgvKp4BEvp+V6I+ND+0pWW+3O908aBde9fAGfp+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176160; c=relaxed/simple;
	bh=co+ehvt9DDbgqhQECIDonHiltKE1gk/Dp9hE7jZsTBI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VwKUQ73rs02ZI07D/OLhhFE4zUonUnxl1Rbzfu3HD6Y0ve5oeBnXpj7dUd9kNcPfcfstrMrcUEZU3y/LtEa4fLNZX8xTl+Nyn8BMSORPiMqHWu0fIFnmAtABsAW4K844og/qY6nYW8h66HAwEAbPaswghRKIYJiJ4WGCJvsKVLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeUmQ+1j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeUmQ+1j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E042C2BCB3;
	Tue, 19 May 2026 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176159;
	bh=co+ehvt9DDbgqhQECIDonHiltKE1gk/Dp9hE7jZsTBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WeUmQ+1jJbocVYmI5exl/2yBDZOAfHYLZXhUyUFNzjUAk10CfbpnfOx+AbEBrjCd4
	 9Tm2AOEm10ch/D9deQATmW0NiKRpz0duA/DWQRp24+mNNA8vvX8vvkWLh81xAOqRJ/
	 zLA71x+5TTd1eBQw1H6QwZXUUQOvQb1tzlZD+Vf5OMQ+BxVnndTRsTJbAPqAWekqtZ
	 M+wEQO87zmdI7zC7XcmnvGAM7alLT/7tIS6VtkI77fCXT69/A/JAw+CCWLeczhI+Mv
	 D+SoStlwE44wXOfzQ3yPOwv4kUDb3XxIbIRpuQ4Wf70x5HL2fCPniseibuWQ1ZKaH5
	 SvGMZzTgzyNYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: Add device tree for SA8797P
 Ride board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260519063505.883379-9-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-9-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:35:58 +0000
Message-Id: <20260519073559.5E042C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Flawed thermal zone configurations with incorrect types, descendin=
g order, and identical duplicate trip points.
--

commit feec939ce542144572175512accde079d1c6829f
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for SA8797P Ride board

This commit adds the initial device tree for the Qualcomm SA8797P Ride
reference board. It configures UART ports, enables UFS storage, and
defines various thermal zones using the SCMI sensor protocol.

> diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/=
dts/qcom/sa8797p-ride.dts
> new file mode 100644
> index 0000000000000..2eab2c6fc173d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts

[ ... ]

> +	pm_kobra_thermal: pm-a-die-thermal {
> +		polling-delay-passive =3D <100>;
> +		polling-delay =3D <0>;
> +		thermal-sensors =3D <&scmi23_sensor 3>;
> +
> +		trips {
> +			trip0 {
> +				temperature =3D <135000>;
> +				hysteresis =3D <5000>;
> +				type =3D "passive";
> +			};
> +
> +			pm_kobra_trip1: trip1 {
> +				temperature =3D <115000>;
> +				hysteresis =3D <5000>;
> +				type =3D "passive";
> +			};
> +		};
> +	};

Should trip0 be configured as an emergency hardware shutdown trip point
instead of passive, considering the high 135C temperature limit?

Also, does the thermal framework expect these trip points to be defined in
ascending order of temperature rather than descending?

[ ... ]

> +	pm_kai_ufs_thermal: ufs-thermal {
> +		polling-delay-passive =3D <0>;
> +		polling-delay =3D <0>;
> +		thermal-sensors =3D <&scmi23_sensor 0>;
> +
> +		trips {
> +			trip0 {
> +				temperature =3D <125000>;
> +				hysteresis =3D <5000>;
> +				type =3D "passive";
> +			};
> +
> +			trip1 {
> +				temperature =3D <125000>;
> +				hysteresis =3D <5000>;
> +				type =3D "passive";
> +			};
> +		};
> +	};

Are these duplicate trip points intentional? Both trip0 and trip1 are defin=
ed
with the exact same temperature, hysteresis, and passive type.

Is it possible that trip1 was intended to have a higher temperature and
serve as a different type of trip point?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519063505.8833=
79-1-shengchao.guo@oss.qualcomm.com?part=3D8
