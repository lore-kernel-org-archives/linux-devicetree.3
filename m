Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7904B3B71D0
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172042; cv=none; b=EBm+aJw7SYzygCnnTBk3qv4tG+2HT/ESigB5eCFdw2mCj7tMFCcZc4hFfwFJJ7GbcGw4Wh4qxjFNxPD8bH5Vm/Ni7/HkDGzqu2OmXyB/y5mdmf6OcF2dnirdU7XW1PUwpY1H/Tx88fFv68PjytHODS4Ih2CSyviKdBFbyNocO94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172042; c=relaxed/simple;
	bh=NvqHAGqAzj3zeicenN/77zUQIjbshxu3ZuE4WX0Ds/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nNq6D/TKEMUH9jAhdfbTVQvMffT3qVy8QLJxgMIiHLvaMhsPOo6OKm3+lKDQyqSR2BQkR2JZlu4FdukTpLXi18XoUfdWAh/NG9fGPJJulhh02eRM4qvBYr3llLWLAVb/4gjduQD3PZLzyQfZGFdd46AL4i4nIkh3VqCh9KvyTJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0+ZqofS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0+ZqofS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C0C1F000E9;
	Mon, 31 Aug 2026 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788172041;
	bh=RnmOThDsrP2xl33Kp8BpzIqBjAdLc76p1mvBSlEh9jA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h0+ZqofSBWBdm+1AyldH724NovI3MPswsvPeQx8bEVYZSFg8QFwBJu4niTduWNCJK
	 apOxwKgPfDx/rHxItAnlangGjE/mQfDqsgcZuT4pLhmBYMUbShi7er/z8KMWQ9FNhZ
	 ojd819TEomfs+iyqMsG+LE7/OjcOYMJ8AhlF/vJ0d6bm2EAfbomRjrfsMUvNr+N85S
	 Wf0Hi6KJhOSE6xsK5v/j19t09wkWGxMR/VhcQdQs9iCP90f5fjHIjQ4UpnGaKwfs+X
	 nKfX1FWI2NbHNjD99hW8YuHhK1bE80YbsK5H6WzC8Iy9hm5M8EYwuoB0hvnYRIHApb
	 N+dzqA6CAchiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add more thermal zones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xilin Wu" <sophon@radxa.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
References: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 10:27:20 +0000
Message-Id: <20260831102720.C7C0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The NSP (Neural Processing Unit) thermal zone node names have swapp=
ed suffixes relative to their tsens instances.
--

commit 092e957a85480db5b06f08e884f71660fcf25523
Author: Xilin Wu <sophon@radxa.com>

arm64: dts: qcom: sc8280xp: Add more thermal zones

This commit adds thermal zones for the remaining undocumented TSENS sensors
on the SC8280XP. It includes missing NSP1 thermal zones and renames CPUSS
and DDRSS thermal zones.

Link: https://patch.msgid.link/20260507-sc8280xp-thermal-zones-v1-0-33d4395=
b1be9@radxa.com

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index fbcfd3883bbb4..880570d0a41c6 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi

[ ... ]

> +		cpuss1-thermal {
> +			thermal-sensors =3D <&tsens1 9>;
> +
> +			trips {
> +				cpu-crit {
> +					temperature =3D <110000>;
> +					hysteresis =3D <1000>;
> +					type =3D "critical";
> +				};
> +			};
> +		};
> +
> +		nsp0-2-thermal {
> +			thermal-sensors =3D <&tsens1 10>;

[Severity: Low]
Is this node name suffix intentional? The naming convention throughout this
file appears to use the tsens instance index as the suffix for the thermal
zone node name (e.g., aoss-1-thermal uses tsens1), but here nsp0-2-thermal
maps to tsens1.

> +
> +			trips {
> +				nsp0-crit {
> +					temperature =3D <110000>;
> +					hysteresis =3D <1000>;
> +					type =3D "critical";
> +				};
> +			};
> +		};
> +
> +		nsp1-2-thermal {
> +			thermal-sensors =3D <&tsens1 11>;

[Severity: Low]
Similarly, should this be named nsp1-1-thermal to match the tsens1 instance
it uses?

[ ... ]

> +		video-thermal {
> +			thermal-sensors =3D <&tsens2 8>;
> +
> +			trips {
> +				video-crit {
> +					temperature =3D <110000>;
> +					hysteresis =3D <1000>;
> +					type =3D "critical";
> +				};
> +			};
> +		};
> +
> +		nsp0-1-thermal {
> +			thermal-sensors =3D <&tsens2 9>;

[Severity: Low]
Should this node be named nsp0-2-thermal to match tsens2? Currently, the -1
and -2 node suffixes appear to be swapped relative to their tsens instances.

> +
> +			trips {
> +				nsp0-crit {
> +					temperature =3D <110000>;
> +					hysteresis =3D <1000>;
> +					type =3D "critical";
> +				};
> +			};
> +		};
> +
> +		nsp1-1-thermal {
> +			thermal-sensors =3D <&tsens2 10>;

[Severity: Low]
As with the nodes above, does this nsp1-1-thermal node incorrectly map
to tsens2 instead of tsens1 due to the swapped suffixes?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-sc8280xp-t=
hermal-zones-v2-1-8c2b89b4c9c5@radxa.com?part=3D1
