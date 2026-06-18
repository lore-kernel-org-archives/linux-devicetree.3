Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515292F39B5
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768919; cv=none; b=GyQB7/+EP4ERBdD2HTKUIbGbdsEkh6ObZclBAz/FgHQ/jwVnPtj78+T4g5SVk84byi9A8Z4gXeuTxvd1q8+eiGk3a8PtAut/N2MYFgTdTB+l2/2otazdFS9rQbKK/cjfFETU/xtwj3k6z22FZKV1YEgZ+Yer+m2aY3n/CrFUVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768919; c=relaxed/simple;
	bh=AehvMD8hyeVWnAe/xXQ/LbG+yItprOo0LEasFz/z5oA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JRwqtTvB3Doo3KP/sg+porq8jw6nUqCxFh5KN0YeGPJM6EYosgOzfeDVuL4FSVmDOLSwZiFjUEKRX86FFL3d+t3tcHICM7cLuV+HyJbX4GwQgBb2BBPNifWL+VNJqropPDg0OiR8DelrBts1I7+ZBxjXdw2wiSGfsQVAUiZoOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3BmcoXH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3BmcoXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6671F000E9;
	Thu, 18 Jun 2026 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781768907;
	bh=7fYQPxZvZtgK9l1GpMhVOfbOwFX+VXvFiQLJeWJlbTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d3BmcoXHc5PudQr0BA4NEGAF7cwWhZBgmgVfBOg420v9LVaNrNmYvOJky62qBA8f3
	 FYVEZh+7w1nFFxKm8B+I6IUzTsW2aTXq+t+Ba5xspHQmplihRTtSlh/e9D8Ftt6qJX
	 FjJ/mBY15o1nqwXH6+q6cPeG5AClq1zNJ9g6ZKjIM3COeus33C84vhxCmVDqOf+feu
	 ytZ55YLGrb6echMGAWXTt0DA5O5J1PDD5cvDdrLCvTNG8RHjWzs82CveXJp7mwq4gv
	 2zX7kOIIg/sjHHGGnDpFf6CYH7/qstQJtDaoUqYnuLQfTK102BYQrBll2uhrep0y0m
	 b/Lnnw7ZoZqNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: add current-range
 property for PDB HSC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mike Hsieh" <mike.quanta.115@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-2-cccf959c9b78@gmail.com>
References: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
 <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-2-cccf959c9b78@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:48:26 +0000
Message-Id: <20260618074826.CA6671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `ti,current-range` property is undocumented in the devicetre=
e bindings, completely unhandled by the kernel, and will cause `dtbs_check`=
 validation failures.
--

commit 896bc796365efa4f0c156564af30ed91fd361842
Author: Mike Hsieh <mike.quanta.115@gmail.com>

ARM: dts: aspeed: sanmiguel: add current-range property for PDB HSC

This commit defines the hardware current limit operating mode for four
TI LM5066i hot-swap controllers on the PDB board. It does this by adding
the ti,current-range property to each sensor's device tree node.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> index 3faac0925a797..e518e3fc1c97e 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> @@ -451,6 +451,7 @@ pdb_ti_hsc1: power-monitor@11 {
>  		compatible =3D "ti,lm5066i";
>  		reg =3D <0x11>;
>  		shunt-resistor-micro-ohms =3D <1000>;
> +		ti,current-range =3D "low";

[Severity: Medium]
Is this property documented in the devicetree bindings?

Looking at the schema for ti,lm5066i in
Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml, it enforces
unevaluatedProperties: false. Will adding this property cause make dtbs_che=
ck
to fail?

The commit message mentions this property configures the hardware current
limit, but does the kernel actually parse ti,current-range?

It appears the driver in drivers/hwmon/pmbus/lm25066.c natively discovers t=
he
limit by dynamically reading the device setup register via I2C at probe tim=
e,
which would mean this property is unhandled by the kernel and effectively d=
ead
code.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-sanmiguel-=
dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com?part=3D2
