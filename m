Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29A0352005
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727545; cv=none; b=imPBSmBZzdTtWKRiipDUQMBM3LkDz12+U0G4H5fx/mwe8a6CKQ5veDMdC00sxJPpK++hPuxS+jMuQ++rJB7Zm7IxnMVG1gu6HGcSXXMl48E6tlYcGzUhbkNYCcAkbUGImPzjeT6znnQnmHXMOO0S/VcGbHjaXtjaaXFd0HpT3xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727545; c=relaxed/simple;
	bh=r9UBURYGSeY2glHt35hAEfM0LDqsgL3OTbgcDMxKmMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D0dUxHopf0z+NsWhaI/lmAH+z6imBmGWhZEE+dFXmQTMknSlKh0AkZunF/smAQUVito6I95l0klhixH8+sJvPji12OIqAfEmslvq1ODxxp5WBVMzdEN1w8IAjz4J0zpCDuhlzkURI/ryuFkbLrub0Y7Rmbx6q+KdFm0qBv+ShH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1SiD8zq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1SiD8zq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D6C1F00A3A;
	Mon,  3 Aug 2026 03:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727544;
	bh=F71hPfKopcp8KNCF2+qe/jheLOseXt3W3KHwVUaoOKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h1SiD8zqLNP1fqXM5ts1INVSAU5oNVRuvyYTwnYqaqHnT/w2+Gkdhd5c1nmXeMbII
	 enLBK/pTEs58pi3kUVeGE1MDVhMVQt4KK3+3HKByn6P+ZMaTv/NFmg+LbU7TTJFwEY
	 FSvDm6WMjexqWIkHFm01KheNDFPllBUltaDBVm9B5MvknQtkAW1SFOvSs+hmHRmdMd
	 5CL/tc08Xiw60vWoQKSfUpz1gdJ3T1feyhjOgUrn/2A1Y+YD4jRF3seZX/wne/PLIp
	 TKfsmC/FdLA/4Ra6LNrxIiIgOCvKCfYPGviGk2lrNKC1yT6ziiI9E5E+al6PNx8zj/
	 uK9CcpSB6S/+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/9] usb: misc: qcom_eud: improve enable_store API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803031534.2942628-6-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-6-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:25:43 +0000
Message-Id: <20260803032544.46D6C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the sysfs store =
handlers (`enable_store` and `port_store`) lack synchronization, exposing a=
 critical TOCTOU race and hardware state corruption. While this patch attem=
pts to avoid redundant hardware operations by adding a check `if (chip->ena=
bled =3D=3D enable)`, the check is performed without a lock. If multiple th=
reads concurrently write '1' to the `enable` attribute, both can observe `c=
hip->enabled =3D=3D false`, bypass the check, and invoke `enable_eud()` sim=
ultaneously. This results in duplicate unsynchronized MMIO writes and unbal=
anced calls to `phy_init()` and `phy_power_on()`, permanently leaking PHY i=
nternal power/init reference counts. Furthermore, because `port_store` is a=
lso unprotected, a concurrent write to `port` can modify `chip->port_idx` w=
hile `enable_eud()` is executing. This can cause the driver to enable the P=
HY on one port but later disable the PHY on the other port, leading to perm=
anent hardware resource leaks and corrupted PHY state.
--

--- Patch [5]: [PATCH v5 5/9] usb: misc: qcom_eud: improve enable_store API=
 ---
commit daa70bf1af36bae927820d34ca275135da4718d1
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: improve enable_store API

This commit adds a state check to enable_store() to skip redundant=20
operations when the EUD is already in the desired state. It also=20
improves error handling by explicitly logging failures.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
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
>  	if (enable) {
>  		ret =3D enable_eud(chip);

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of=20
synchronization in this sysfs store handler expose a race condition?

If multiple threads concurrently write to the enable attribute, could both
observe chip->enabled =3D=3D false, bypass this new check, and invoke
enable_eud() simultaneously?

Would this result in duplicate unsynchronized MMIO writes and unbalanced
calls to phy_init() and phy_power_on(), permanently leaking PHY internal
power and initialization reference counts?

Furthermore, because port_store() is also unprotected, can a concurrent
write to port modify chip->port_idx while enable_eud() is executing?

drivers/usb/misc/qcom_eud.c:port_store() {
...
	/* Port selection must be done before enabling EUD */
	if (chip->enabled)
		return -EBUSY;

	writel(port, chip->base + EUD_REG_PORT_SEL);
	chip->port_idx =3D port;
...
}

Could this interleaving cause the driver to enable the PHY on one port but
later disable the PHY on the other port, leading to corrupted hardware stat=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803031534.2942=
628-1-elson.serrao@oss.qualcomm.com?part=3D5
