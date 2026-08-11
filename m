Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B438B7DC
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485370; cv=none; b=SCdUT8Qgvtupfu/+OBnSUN0hu0tHiyYfbbwLxzvNdL05rNZ2d4OPswgOl1SoQUALNuAyyF9U95+PBsAOZGwAoA82Wtf9GThRrykN4ELaE0SAQWIkMXpp/doAEidOIbpHTfXeAs431/nbvpN0Gxlj5VvyTU4ZH9RZ3rPEzDRRzqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485370; c=relaxed/simple;
	bh=IJ99tD7ImFj2MJn/clQc68dlYnz/kUCpvzMEdwfKMtM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IjNg7XZZ45mKK+7erdJYlIW0JryzsPmua0OnipxfJTMFyat5Ul3mpIQyuon4eDks6K1b1hTMItmXq+9FM9jt7L15e+h/ZCYCxq1E2UtMXYidCCd0kUdR7P4YkUJpPfy1kvzqB11gmeCUbdN0EU7b0biM09JQO0s0FnCI/4WY2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6ELXTTv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6ELXTTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4DA1F000E9;
	Tue, 11 Aug 2026 21:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485368;
	bh=ysX0k102bVF4/3FwmGQq1gp1+M6XVHQaguAZcWljJ10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V6ELXTTvAMW0TPZhxwP7/TYVG5Rn19G2bTg+PrcANrCqSvwVE23c+zdJzfWFzIiJw
	 m4bM4kWaIkwINe3upaYZUoD6Ix8173dU7eODiNPTyHai6Sn6O6CPEn66X7CMM9KGtt
	 iXufVQPYhZ/A3bEO7QmaamwwZpI+F+ZiNPYwaRn3RbeJjOLrS9pgBj/1+ACtRdDJkz
	 qc1aFmydhrMx6y3DEf64xeMBc3OR/E3Y4O1Tivv8NlOtM6TubAaskFBPLHQi1cibW/
	 gk4c+/aTQef5BSzpol8DZfXhGoXASXb5MwNBvUp3bQzrz0fkkglKPMLF1LNDmiK6dF
	 YInK4Wm+iFosA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] usb: misc: qcom_eud: improve enable_store API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260811213610.2956147-6-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-6-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 21:56:07 +0000
Message-Id: <20260811215608.3F4DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The early return optimization in `enable_store` causes a state des=
ynchronization if the hardware was left enabled before probe (e.g., by the =
bootloader), preventing userspace from disabling it.

Pre-existing issues:
- [High] `pet_eud()` calls the sleeping function `readl_poll_timeout()` whi=
le executing in the top-half hardirq handler, which causes a kernel panic.
--

--- Patch [5]: [PATCH v6 5/9] usb: misc: qcom_eud: improve enable_store API=
 ---
commit ba15c5168dac3d6c5421e3601396a69dd6a1abdb
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: improve enable_store API

This commit adds duplicate state checks to skip redundant enable or disable
requests when the EUD is already in the desired state. It also adds explicit
error logging to provide better feedback.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 48a4441b0c9c0..e83a4402e4b84 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
>  	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
> =20
> +	/* Skip operation if already in desired state */
> +	if (chip->enabled =3D=3D enable)
> +		return count;
> +

[Severity: High]
Does this early return risk a state desynchronization if the hardware was
left enabled before probe?

Since chip is allocated via devm_kzalloc(), chip->enabled initializes to fa=
lse
without reading the actual hardware state. If the bootloader or a previous
instance leaves the EUD active, and a boot script subsequently writes '0' to
the sysfs enable attribute to explicitly disable it, this check will evalua=
te
to false =3D=3D false and return immediately without actually disabling the
hardware.

[ ... ]

Additionally, while reviewing this file, I noticed a pre-existing issue in =
the
interrupt handling path:

drivers/usb/misc/qcom_eud.c:handle_eud_irq() {
        ...
        case EUD_INT_SAFE_MODE:
                pet_eud(chip);
                return IRQ_HANDLED;
        ...
}

drivers/usb/misc/qcom_eud.c:pet_eud() {
        ...
        ret =3D readl_poll_timeout(chip->base + EUD_REG_SW_ATTACH_DET,
                                 reg, (reg =3D=3D 0), 1, 100);
        ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does pet_eud() call a sleepi=
ng
function while executing in a top-half hardirq context?

When the EUD_INT_SAFE_MODE interrupt is asserted, the primary IRQ handler
handle_eud_irq() is invoked in hardirq context. It calls pet_eud(), which
uses readl_poll_timeout() with a sleep_us parameter of 1. This invokes
usleep_range(), forcing a sleep in an atomic context and likely causing a
scheduling while atomic panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D5
