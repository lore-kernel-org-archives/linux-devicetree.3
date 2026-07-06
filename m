Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D1309F09
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322609; cv=none; b=HS9YMyeXHmADRc8ry3CzbU/RC8656shjQ+EiI8yvyS0BA6FRko2WmVQBz+uSomrVrjaY7UZOu9dSF+gz05Dq6h5qLf+wJHdoWJfF9xlsnjVlxSL0xLaLqynG/1Acr0GJNQ9t956rTU0a0/uQYw4Y/feHqsppW6eR/sjwEFs7NJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322609; c=relaxed/simple;
	bh=Jjpmb8U+Ia7SUe0hiylJm41EN/tZP0hvdbpZgIo5lMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W25ygnOU/oqiMA0RKTH5Td9qLm3LuT6n0J0vTIITWdsUDcXBj7h9BQ1LgfwHj7GLMxzvbLdb6Z0QOAZW3SgTKaSxiovnuiWgPJ4KIgQRMzUm5jTQb5g/FrbDPuLYCE81hxoeAbZ7rjXz8mGpWYBGvBSrOLNulXsXmfH14oJbkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5/knTGm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5/knTGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E807C1F00A3A;
	Mon,  6 Jul 2026 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783322598;
	bh=5Ygok8FvPz70cWWjRSeTvKlYj7bdvWn0xgnptd3Xrto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C5/knTGmlnF+TVhur9407pOWvKKqwkLNgx+vZ5QMRtGScMJrmgXCrePklPa91qNPT
	 6jw4GzIwutLFsGQGDw+Az4+DbqW4Ak2MAzNzvUD9qIeqlL90qN/+EphJ+cy+WeYK5l
	 suHC8yICxxVcrHbNaP6nP2eGcOnjG0cczCQp0tTLm0WmfLy2cQJLgBAI8Nk4wBX/L/
	 TiNwVE3sdJzmKVInhLA7OszWNiqymcZvkhJH1ALGzdkwaZ3bsIGmyTW42kFe9Z1Bok
	 M/PTGRQzZeczmsrseR+Oh0lsgzFqQh3cdMxPqpISzmtJZ7+QBnQNEQ5CD42R/deEIp
	 FKKwkjqwn10+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:23:17 +0000
Message-Id: <20260706072317.E807C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The return value of `devm_of_platform_populate()` is silently igno=
red, potentially leaving the subsystem in a broken state without propagatin=
g the error.
- [High] Incorrect devres ordering causes child devices to be populated pre=
maturely and depopulated too late, leading to hardware faults and Use-After=
-Free during teardown.
--

commit 87e3279291715684d9b1d07a1326244dc96aa857
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Populate CAMSS child devices via DT

Use devm_of_platform_populate() so that child nodes declared under the
CAMSS device tree node (e.g. OPE) are automatically instantiated as
platform devices.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..95e655a8b6aa0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
> =20
> +	devm_of_platform_populate(dev);

[Severity: High]
Does this code silently ignore initialization errors?

If devm_of_platform_populate() fails, the driver proceeds without propagati=
ng
the error. This could leave the required child devices unpopulated and the
camera subsystem in a partially initialized and functionally broken state.
Should the return value be checked here?

[Severity: High]
Could calling devm_of_platform_populate() this early in probe cause hardware
faults or use-after-free during driver teardown?

Because devm_of_platform_populate() is called at the very beginning of
camss_probe(), its devres cleanup (of_platform_depopulate()) is pushed to t=
he
bottom of the LIFO devres stack and runs last.

During driver removal, camss_remove() manually disables PM runtime and
destroys power domains via camss_genpd_cleanup() before the devres cleanup
unregisters the child devices.

This leaves a teardown window where the child video devices remain fully
registered and active while the parent's resources, memory, and power domai=
ns
are completely destroyed. If userspace accesses the child video device duri=
ng
this window, will it interact with unpowered or freed parent hardware?

> +
>  	camss->res =3D of_device_get_match_data(dev);
> =20
>  	atomic_set(&camss->ref_count, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706071113.3832=
15-1-atanas.filipov@oss.qualcomm.com?part=3D1
