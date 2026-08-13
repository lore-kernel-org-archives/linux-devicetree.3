Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C403955DE
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610094; cv=none; b=atDXGNNkFlKbFqMmY0cUqEbiUa1jXExqgO3rWAadlLYuCdxi8FWgbldmgWIugIFp0Qq3heljmIci4yvByPOJjPkfQLLmwALLvDOSkR7yqeMAxnjnkCHsUD6IV6cAcWOC6pBYVNvbdhmOBfKj0WTqtRR+zkLDwazKWKVK6yGK6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610094; c=relaxed/simple;
	bh=k7PVDXMBcfoxrLAk+M+M4f+0eO3irwSzZBRjOZwnqJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hu98WukM6stnJIePaf02mfdksFbJJ1/IBUnHHemKtkj9yvSvdFaixUCar9uMkgqE6/KQRHAwqxIcqk9naBh4EV+NEE8aAr5uFNzrGOqMgb8sLAqAzbmTQ/jctRenZg5FvxDAmLqDrywJ+MFY5Ou77i/YOqLAqPEiwQ9m6UM13k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpipdPtA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpipdPtA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAF01F000E9;
	Thu, 13 Aug 2026 08:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786610090;
	bh=LHLNxG4489Xg0eFDnIzHZSii5WL2gp+UyVZcEDk1h7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NpipdPtAgfkfy5pGQnUPNlE2+eeEkKwyf5Zs2zMeUunW156YJ5pm3AqQhY66WcN51
	 r3RyeZDVVQLwrC23iCwmjAp3SXJMRGxuTS2cUk3OM8Wk5O4hBDd+z/pt36OZW/8zHu
	 i9kbtEdhE3nGdf8TYFXTAX0dXplIkMiRUWrab54e/HryFK0TItC00JtY8ne0hljhUd
	 UmB8rR8bu7CTTYXU3yGsEe2pdvd4iqKNL1SaXr9AXg46enDviRsACD9MCnD4tZis51
	 M0Fqm+zGExpkkDHtl0t96yPVU45uAnunEJJ9Rp6EZbroB9zbVoLBXEs3VMnO7s/fS+
	 2ZrPugiuzTp+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Add boot phase
 tags for pmic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anshul Dalal" <anshuld@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-beagleplay_pmic_boot_phase_fix-v1-1-4518e7cba940@ti.com>
References: <20260813-beagleplay_pmic_boot_phase_fix-v1-1-4518e7cba940@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 08:34:50 +0000
Message-Id: <20260813083450.7AAF01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing `bootph-all` from the parent PMIC node prevents U-Boot fr=
om probing the PMIC and its regulators during early boot.
--

--- Patch [1]: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Add boot phase =
tags for pmic ---
commit 7e0324188396a118a77eb80307cd8f4be050d7cb
Author: Anshul Dalal <anshuld@ti.com>

arm64: dts: ti: k3-am625-beagleplay: Add boot phase tags for pmic

This commit moves the 'bootph-all' tag from the parent tps65219 PMIC node
to all of its regulator sub-nodes. The intent is to ensure the PMIC
regulators are available during the boot phase.

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/=
boot/dts/ti/k3-am625-beagleplay.dts
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -681,7 +681,6 @@ rtc: rtc@68 {
>  	};
> =20
>  	tps65219: pmic@30 {
> -		bootph-all;
>  		compatible =3D "ti,tps65219";
>  		reg =3D <0x30>;

[Severity: High]
Will removing bootph-all from the parent PMIC node prevent U-Boot from
probing the PMIC and its regulators during early boot?

During U-Boot's early boot phases, the driver model only binds nodes with
properties like bootph-all. If this is removed from the parent tps65219
node, the parent PMIC might be skipped.

Because the parent wouldn't be bound, would the driver model fail to scan
or bind its child regulator sub-nodes, even though this patch adds
bootph-all to them? Additionally, the U-Boot SPL fdtgrep tool strips
essential properties (such as reg and compatible) from untagged parent
nodes, which could break the I2C bus device attachment entirely.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-beagleplay=
_pmic_boot_phase_fix-v1-1-4518e7cba940@ti.com?part=3D1
