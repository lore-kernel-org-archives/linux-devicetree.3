Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3469B51CF72
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905750; cv=none; b=ay1LX6loPOACx6X7GrVRyDcPnxxrIQrlsmbQcMjd0LTM/m4lKcMPvWiV2Hh10JNHi8OVQZEIHPk1UTuA/T6EpSkLMOevtROc3KyOfN/7GxoF+3QGdaiarwt+Chw6091kf2z72AsBiTxvFqstyzMy+zZSkOZ1TvnohWZN3hLIMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905750; c=relaxed/simple;
	bh=8yUDOULnABKyjwFk327yA8lvlk52CaKaNQCtqCEDyEo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KLhC26d9XobPoiTRa623zQa8rEscMEfWr3GxuZzYkAltO16DSPK4zy8K+qI60AhxtIogvyq5fzcBOKQ82NdhsKIPIc+IR9EBh1+WTBW4BZCwP6cy3D9je2/T4mKkY3P4/s7FKQdjX/9ZaUc8nDFTXi4FiWxgFjM7b4LsPB+5H+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0RFyw7H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0RFyw7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05D81F000FF;
	Tue, 13 Oct 2026 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905749;
	bh=cobc2ylzpg0S/PqL6EnfCErMuoEOZpOvyYxiDs5WUH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g0RFyw7HwQfXePQbr1bX7SMQmr7pVGgDzU82AkE148CJrShUuGjG9gev+FQQkzcmE
	 mrgYcy207xpvVNUiU4sLBMyliuTOhdVN8Ho4ogqnE5Vb9co/1ryI5d8f1OVg6Su4Od
	 Nxviq0yonIor2zRNFJ0Ct7Qspxftv7U9Oe3NQ3C3jHTRyC72SHZb8iHe2PHAgv3mZz
	 5w16M1F6CxxIQfgDAXS26Zk7ZSsEfzmSjW2F4eRn4aT+qbi2PrOAeJBFrsbHSNmE5s
	 viq6d5Z3WcXeJdFihrWufcx8TKEtp30q5X/Qe3mvgu8TO5JStdJr40PvG0ayoLrFl8
	 3My9k/ZZExTkg==
Message-ID: <sashiko-outbox-170022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/13] media: sony-starvis2: Parameterise the
 configuration to allow for other models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261013-media-starvis2-v2-4-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
 <20261013-media-starvis2-v2-4-3670722d250a@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:35:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: sony-starvis2: missing hardware init if PM is disabled
--

commit 7eb8011a8d0af06bdae270bac96946f8a554e9b6
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: sony-starvis2: Parameterise the configuration to allow for other mod=
els

This commit parameterises various sensor configurations such as the pixel
array size and timings in preparation for supporting other Starvis 2 varian=
ts.

> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> index 20f3489b58d36..f62a957ff1a8c 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c
[ ... ]
> @@ -895,8 +926,12 @@ static int starvis2_write_common(struct starvis2 *st=
arvis2)
>  {
>  	int ret =3D 0;
> =20
> -	cci_multi_reg_write(starvis2->cci, common_regs, ARRAY_SIZE(common_regs),
> -			    &ret);
> +	if (!starvis2->variant)
> +		/* Powered on during probe to do detection. Variant unknown. */
> +		return 0;
> +
> +	cci_multi_reg_write(starvis2->cci, starvis2->variant->common_regs,
> +			    starvis2->variant->num_common_regs, &ret);
> =20
>  	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
>  		  &ret);

[Severity: High]
If CONFIG_PM is disabled or userspace prevents runtime suspend, does this
skip hardware initialization entirely when starting the stream?

In starvis2_probe(), starvis2_power_on() is called before
starvis2_identify_model() populates starvis2->variant:

starvis2_probe() {
	...
	ret =3D starvis2_power_on(dev);
	...
	ret =3D starvis2_identify_model(starvis2);
	...
}

Because starvis2->variant is NULL during the initial probe,
starvis2_write_common() returns early here and skips writing the common
configuration.

If the device never runtime suspends after probe, the later call to
pm_runtime_resume_and_get() in starvis2_enable_streams() will return
immediately without invoking the resume callback, bypassing any subsequent
call to starvis2_power_on(). This appears to result in the stream starting
without the sensor's common configuration and clock settings being programm=
ed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-media-star=
vis2-v2-0-3670722d250a@raspberrypi.com?part=3D4
