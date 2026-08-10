Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CEC3BF67A
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360909; cv=none; b=YDOIzYS0ysLWJvJJV+ESnyNQZF/OwpKcamG82HxX00WNSWnzSWWoDjrD6H7dnAbOlYLvkLbIStl4ocBQRRa78LevkBKxGlRVj4vq24Id6Dfuc3ePThci9rA5nPp+wFOv2fii+7l91MMKoA+QkF/zYyvh2ULzqupT60qCSIUX1+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360909; c=relaxed/simple;
	bh=WKX/fGLk5NfCsQ8MKkn9X0VYgiMNRsyUtqaoH7B2SwM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=osC9A66ndLyKXVQEbGp3COlCLHr6XN1ri80d0A/rQhwl8oDHzEoi1cJhVysQLhQtWfnBzfzxgcc+kd5PGD4+fbIFX5XZOZGr6b78gkSgV0OBA8VVVbwR+upxeRGRX/WTWrE0vQK7GGFt0tdo5SgGV3OVOumPcu/QziRJzJ9MVmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3wVr9Dm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3wVr9Dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9F21F000E9;
	Mon, 10 Aug 2026 11:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360907;
	bh=UtxRYvSbMrLhX0iCBoM+EXF5kESVienmkegHYp7kOKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R3wVr9DmTRof12SdXppXWV/JzeN5+ZL9inMsTixu750IJoRShZFHhZ51OS1xSwdeX
	 GxOj9yKlN+B7/bu8qyTSSD96BIx+9Ro0Rgf4UL3WO7KViW1cm4NuAv5KAbZo+Zfglm
	 +B5AixDAFYnTA7d/ihvLpsUx4yWYBtg4ZnhuVkpcZGBiFWEFsXIQ8ffzPSHKnQnbqr
	 p2sdPUz1ir5/iO3zDv5NjhzyeNEr8hRnCbVWmojEo/QBgodDvPOccdjHNK3tqSxmhH
	 wv7jpCZeQ7//6sgxFBbmr0N/tVDw7rbyxyn3gNlnpBAugzwg7eqcIeTE5nT95/SRle
	 4p3/lRFuA/XUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810110726.775084-2-shengchao.guo@oss.qualcomm.com>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
 <20260810110726.775084-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:21:46 +0000
Message-Id: <20260810112147.2F9F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing 'critical' trip points in thermal zones.
--

--- Patch [1]: [PATCH v10 1/6] arm64: dts: qcom: Add device tree for Nord S=
oC series ---
commit 2e111a76a0005ef21158cf2e53ba21499ce90eed
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include for the Nord SoC series.
It describes core hardware components including Oryon cores, GICv3,
TSENS thermal sensors, and various other controllers.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> +	thermal_zones: thermal-zones {
> +		ddr-0-0-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens0 0>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <105000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature =3D <115000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};

[Severity: High]
Should the upper-bound trip points (like trip-point1 here, and throughout
the other thermal zones in this file) be defined as "critical" instead of
"passive"?

If the SoC reaches these peak temperatures (115C or 125C) and passive
cooling fails to mitigate the temperature rise, the thermal framework will
only attempt further passive cooling rather than an emergency shutdown.

Additionally, without a critical trip point, does this prevent the TSENS
hardware driver from properly programming the upper-bound thermal protection
interrupts?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810110726.7750=
84-1-shengchao.guo@oss.qualcomm.com?part=3D1
