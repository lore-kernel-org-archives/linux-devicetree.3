Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC43CC7DB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780557318; cv=none; b=FT8CyLHkCyHMCxzavrbmWOEYAn+Frzt/bS1wXOAZ1wsfgknQurVXIWQCyWPTNa85njk7d3ccCBf2+w9/EicugMi54y8TMMx4tyZzK7zF7n+spRuRVCRHJ2PpQX5LUSyILRV6aIlRxmnVu4APDY76qrIRqErPIJbo/cWfSOY43zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780557318; c=relaxed/simple;
	bh=dUzFxdTKDTiwlNQUBE9dQXsBccFePjJDio1K4ELuJ/U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GHZxK1K7rdLrdvh107IdZ0DPaAalLePBp62CYlPsO0qyOf1sQTUB8ZwFtL1aQpkBpcCDUA/+/jbJ05xw5fonHZEOr63snDBnoD/Nx8G2Av+8wHi6f2GS/HfCmqI8UmnGteP6GiJB+kAS+3980oJM8kRR6u7FlBlJLyjtm4ozgEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijq5GlFH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijq5GlFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4101F00893;
	Thu,  4 Jun 2026 07:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780557317;
	bh=l153knO/tHX2Hd3/PUzresPpFuHptAtK225Im0aa/w8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijq5GlFHWpRA7e7pwI4P6j9XJ8wLgrxKgoFEU301OSGU9lmzReymhcU3fajdAt0gv
	 AWM4x7Izfrey57IMA6MIWje1bDc6SjU4tke3WDqBJdO53K8nZEwYPUirSbC5GNQE7i
	 V3+hwn2IXcVPYBcv4klGdqpr8lmIYe/BqssE0E/poA1S1W/ljX/aOxKIUKm0l5CoVg
	 8s27bCSsu/EfsLEQI8kUiZUyntMmGw2VlSJtkCBttyfLtjXFehGIunUqY6f5PATlVv
	 1+Q62SVLAngxf5sAU6PHoOKqflaLZftzHOV5IWQY8xVxiPtuVsUVzpjtlj2YG+l8Wk
	 jIOHUNShaBn0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 01/10] ARM: tegra: tf701t: Configure CPU DFLL clock
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604065556.137614-2-clamor95@gmail.com>
References: <20260604065556.137614-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:15:16 +0000
Message-Id: <20260604071516.9D4101F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undocumented property `vdd-cpu-supply` in the CPU node causes DT sc=
hema validation error.
--

commit 6008fcd28f85175352ead4c8b62a3dd577cf2865
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Configure CPU DFLL clock node
   =20
Enable DFLL for ASUS TF701T since it is now supported by Tegra114.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index f02e2cf65fe82..041ea6e06531a 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts

[ ... ]

> @@ -1752,6 +1760,12 @@ connector_in: endpoint {
>  		};
>  	};
> =20
> +	cpus {
> +		cpu@0 {
> +			vdd-cpu-supply =3D <&vdd_cpu>;
                        ^^^^^^^^^^^^^^

[Severity: Low]
Will adding vdd-cpu-supply to the cpu@0 node introduce a regression by
triggering a dtbs_check schema validation error?

The device tree binding for ARM CPUs in
Documentation/devicetree/bindings/arm/cpus.yaml specifies
unevaluatedProperties: false and does not define or allow the vdd-cpu-supply
property.

Is this property ignored by the kernel when placed in the CPU node?

The Tegra DFLL clock driver reads vdd-cpu-supply exclusively from its own
clock node, and cpufreq-dt checks for cpu-supply or cpu0-supply instead.
Removing this assignment in cpu@0 might prevent a schema regression without
affecting kernel functionality.

> +		};
> +	};
> +
>  	extcon-keys {
>  		compatible =3D "gpio-keys";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604065556.1376=
14-1-clamor95@gmail.com?part=3D1
