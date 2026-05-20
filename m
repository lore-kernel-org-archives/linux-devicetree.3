Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834CC3D16EC
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272864; cv=none; b=iLuSPm6KalKQD4nZ/RNwhDJuXWTIQqC6MwJk+KhghHFxfbR+t0lrmY0BKyU113yGgr9uQFQBkBO57DVw9P6BODx/GVrOTS7PT4pIOdV5ygyC1JrsxkPaP3auXDHcqG4LJ/Bt48bljk93CLFtvw/e5DoScYWMmBkFxoJa/eG4f4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272864; c=relaxed/simple;
	bh=o1Woul44EzPpAerOy0vRblTW4xT59S/sdGv/ve1MSME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sSFdlxG9paJNWTRkeit3ji7IwOFbBp8XFDPURd/HKMHv1LV7WEoxxo2OrX5glPT7OA4ITqXyg5wog6LJqhKDVaAS/jo/c463i2prvfeR7kMtRrPeQLzbRrceXniByA0VTBRKFLnhRab7aSh6l+1CCjvKxVhUJHTheN0DmBt7Cxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XljYEZi0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XljYEZi0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF0E1F000E9;
	Wed, 20 May 2026 10:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779272856;
	bh=wSo94q0NAT4C3ekCJLAovhRmoIFTaFBQltXXYZJK0p0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XljYEZi0XHFLTadNplpms7MMYChrQfEE/6cK9Xvuep10Wo5HTn+w0GozWLKkTW56y
	 blEZhSxQpAZjauHthRLkqucQvisD3J3z7/WNUazw8PHx2JQ2FHLgMo9Nhx/Gk6LSGj
	 g6mc35PPGRgrqF7E8KFvrBM81x4u9QniArJyGzqHr6+K9JEDk9laybahLF57/SYC8H
	 DWTzTTbp6JcrQhLngSP0gpvQqzgK52knJBBF4ZSx4x9j4GR/Q5fZXmW3RGNTkY62kp
	 Tv68W4nPRVvT7mtw6/h+AgQudgOWf2QcmixjKvO7o0RoskgdstQ0N49xxVIr0PWfKf
	 qvkOCdwEHoW7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 10:27:36 +0000
Message-Id: <20260520102736.7FF0E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown order in ucsi_ccg_remove allows the IRQ handler=
 to execute after ucsi_unregister and ucsi_destroy have freed the ucsi inst=
ance and its connectors, leading to a use-after-free vulnerability.
--

commit d51e27a1b01686843b28a09a37b6e7b3a61e453b
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

usb: ucsi: ccg: Add support for CYPD6129 (CCG6)

This commit adds "cypress,cypd6129" to the UCSI CCG driver match table.
This allows the driver to bind to CCG6-based platforms using this
controller.

> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/u=
csi_ccg.c
> index 199799b319c2a..0695ce348135c 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1520,6 +1520,7 @@ static void ucsi_ccg_remove(struct i2c_client *clie=
nt)

[Severity: High]
This is a pre-existing issue, but does the teardown order in ucsi_ccg_remov=
e()
cause a use-after-free of the ucsi instance and its connectors?

Looking at ucsi_ccg_remove():

	ucsi_unregister(uc->ucsi);
	ucsi_destroy(uc->ucsi);
	free_irq(uc->irq, uc);

Because free_irq() is called after ucsi_unregister() and ucsi_destroy(), an
interrupt could fire during the teardown process.

If this happens, the IRQ handler would execute and call ucsi_notify_common(=
),
which dereferences the already-freed uc->ucsi pointer and accesses the freed
ucsi->connector array.

Should free_irq() be moved before ucsi_unregister() so that any pending IRQ
handlers complete and no new ones are scheduled?

> =20
>  static const struct of_device_id ucsi_ccg_of_match_table[] =3D {
>  		{ .compatible =3D "cypress,cypd4226", },
> +		{ .compatible =3D "cypress,cypd6129", },
>  		{ /* sentinel */ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520093902.2064=
730-1-akash.kumar@oss.qualcomm.com?part=3D3
