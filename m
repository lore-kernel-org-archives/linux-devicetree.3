Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA63D300F
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962263; cv=none; b=E0r1nqrMsn4Mjzy6dlxUkXDEUStLDCRX+x1viOj/W/9RH5kdTJKgVt+0b8jFUNSohjyFoChI7sxgZV93PmNMzEzsEZ1mOGcXaN6tUOOc7veCVLgJ3gP8SYjcb+QNv6QB7D7szB8YQ0zVJH1VAspy6HBBlnW25JnIhoFZ3220CFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962263; c=relaxed/simple;
	bh=kphL6aCyl6P7aZmLMNILWal2a/msLduQrWNjpOKkjHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kxyki9pKudVNgyEk+rybPI4pmdJUWKDVqkKWS+L+4+fBjQKwBQQqf4Q9/u8xqS9w1ZAtPy+41QdUESGl+1vC+8zEg0+ToOsL3tcL7YmeWeZuhaFOmQjjEQ5VPK9jEpx38cDn+W8N3fqRBatTdgxwFBZ6VKvSvSv8HJFyks/TAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eu+u6Vq0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eu+u6Vq0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F661F000E9;
	Wed,  5 Aug 2026 20:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785962262;
	bh=DKYBs9qwK1PUYjJaIQ+L4RBv3Iq41xjqKVvTJhMN+Ak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eu+u6Vq0rsI6bpjENeoZOyNBRu4GCsr/PyFRrLcQB6ympBDASaW4EMcQRMcozOMCZ
	 qeznTBwgesUCEQKA4soHYgX2BOFtz6u8fYR1UencAJrXDFxtj3Z62MVlwi+JEFQefq
	 l2rB4XuQsYJHd3BngsiNp4aLwXzho0cOOWuP04Kr72fpOUkKsT42bO1InP93jhXW5Q
	 4Xvb1FUHcH4+NDiqyQYJAjZjlTVNk5817ESgW+OYCdcpuD+HN+pW+Z6PLJUK+lHy5L
	 58vhK5Lqv2W38M/Epyv7KM3jFwD817h2vEyKcpZ+psK22oHJVDovox/JJClr0+aE91
	 TTAxRsrDhcxXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] drivers: media: i2c: imx471: Add Device Tree
 matching support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danila Tikhonov" <danila@mainlining.org>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-imx471-v1-3-7be79f539ed8@mainlining.org>
References: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
 <20260805-imx471-v1-3-7be79f539ed8@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:37:40 +0000
Message-Id: <20260805203741.C3F661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `dev_pm_ops` structure pointer `&imx471_pm_ops` is incorrectly=
 wrapped with `pm_sleep_ptr()`, discarding runtime PM callbacks when `CONFI=
G_PM_SLEEP` is disabled.
--

--- Patch [3]: [PATCH 3/4] drivers: media: i2c: imx471: Add Device Tree mat=
ching support ---
commit 0a7fa78c5d7c772d5834bc87176b5fcc9a6246db
Author: Danila Tikhonov <danila@mainlining.org>

drivers: media: i2c: imx471: Add Device Tree matching support

The IMX471 driver currently only supports probing via ACPI. This commit adds
an OF device ID table with the sony,imx471 compatible string to allow
probing on Device Tree based platforms.

> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
[ ... ]
>  static struct i2c_driver imx471_i2c_driver =3D {
>  	.driver =3D {
>  		.name =3D "imx471",
>  		.acpi_match_table =3D ACPI_PTR(imx471_acpi_ids),
> +		.of_match_table =3D imx471_of_match,
>  		.pm =3D pm_sleep_ptr(&imx471_pm_ops),

[Severity: High]
This is a pre-existing issue, but is it intended to use pm_sleep_ptr() here=
=20
instead of pm_ptr()?=20

When CONFIG_PM is enabled but CONFIG_PM_SLEEP is disabled, pm_sleep_ptr()=20
evaluates to NULL. This drops the entire dev_pm_ops structure and its runti=
me=20
PM callbacks in imx471_i2c_driver.=20

Will this cause the device to permanently leak power on embedded platforms=
=20
because the regulators and clocks are never disabled after probe or between=
=20
streams?

>  	},
>  	.probe =3D imx471_probe,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx471-v1-=
0-7be79f539ed8@mainlining.org?part=3D3
