Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF220331ED6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356382; cv=none; b=J1gNhlUkMVvL+ZI9RR48wzbXC/fSrQEyGAyHiqgMcrdNaxEWXkLfEzu1NBaRu7ez4iu4OzS0LXSVgUql5Mte61yNil/jrxdZbK4Xve7WefGrJin1P45NDsMFzdpeN1U0qMeZmXm3ygPZq7EKbnK6/NU4PmBlRWPivFePmNDn0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356382; c=relaxed/simple;
	bh=NIJXp5gDnoRxjvM80zTOkwr0v3e+FKmh+rguOp/xFQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I8LwbfFiELYU/xTtqF/WY/DP48NmfrXze8oOildKSqPjL6xHS+iUKfM+zKnQHQM4Biwqp3YdcnLoDQ0IEGgQW1buu6q5v7KFMGZx7H7E0G6j2cYkru9+YT1fEglDuyypJkMT/trHialXXXSG0tnRQdAk4to1pEWcx4ifBdqzpT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwFjhvWb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwFjhvWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BD21F000FF;
	Mon, 14 Sep 2026 03:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789356378;
	bh=LWP9f2Lq7+QzWfn/pvBgYbcAxddCt8wlvxZT8cUzg3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MwFjhvWbIQi3zeVhbe0HAGWBccVKXjT7G8WAEqO3kp8FO5KaEDfL4n7U1nxYTRxvA
	 yb+m0Ach+TFkWDkyYXofxjLrEdXaieINKM95/Z/Or/NN6ePyfXcvH4roNUHqS0xqI5
	 am30Rufe9h0Uy1fp+piyhW8xWbMe4umPf/P2Huc5xG6FFLZBw57t3587bPwBuapcqu
	 PHiFImNp9OpdrMICB1wqT2uafqALX1SVCZXPTRQ0lMuCtPiqTjPvlzzyJKz0GHBdul
	 ZSFTZQ2JtdxWKoGzVCu7OIBWiKhgeGb6VsDuuuAH/82Ds93QUlnPY/hEQyvEKN5CGf
	 wLOrVQIL6TieA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914031412.140856-2-shengchao.guo@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
 <20260914031412.140856-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 03:26:17 +0000
Message-Id: <20260914032617.B7BD21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] All `trip-point1` (critical threshold) thermal trip points are inc=
orrectly configured as `type =3D "passive"`, disabling emergency shutdown o=
n SoC overheat.
--

commit 064e0b2912cbdce3f68bb9c83f53cc3134182d27
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SoC series

Add base device tree include (nord.dtsi) for the Nord SoC series
describing the core hardware components:

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

[Severity: High]
Are these maximum temperature trip points intended to be passive rather than
critical?

If the SoC overheats to 115C or 125C, the Linux kernel will not trigger an
emergency shutdown because the maximum trip points are marked as passive
instead of critical.

The Qualcomm TSENS driver explicitly disables hardware-based critical therm=
al
interrupts on Linux, deferring shutdown entirely to the software thermal
framework. Because the framework will treat this as a passive cooling thres=
hold
crossing, it will not initiate orderly_poweroff(), risking hardware damage.

This pattern appears to be repeated across all thermal zones in this file
(e.g., cpu-0-0-0-thermal, ddr-0-0-thermal).

> +				};
> +			};
> +		};
> +
> +		cpu-0-0-0-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens0 1>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <105000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914031412.1408=
56-1-shengchao.guo@oss.qualcomm.com?part=3D1
