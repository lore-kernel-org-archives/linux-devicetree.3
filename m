Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8885375ABE
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754545; cv=none; b=IQkbDEHrp2hvcXyKXZQ+PyUhXZsOwQchZt/HrmEHzIevTDmYFIOZRrd5LNpocJc58hKuzv1/cjDO1joPSMBvRfDjAUkgCl4aI6DlgfyQSLtmq4AKU+roWrIyhrf7n4FAo5KptHQP4OY3XVrRgrxLT0aUmZtXL9o9wv8NGwDLBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754545; c=relaxed/simple;
	bh=UVreRM6EPcMpmGBKlFRv6XaRtS7sxkc3v51LECt1568=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=odQAUb4FDSCrGuKO7cS7h7hAjBc1E+KyFI9EeoiSUkjbkM8QxioiPa5yKfR0//MkWKeBX43rDg7briVqNm3pBATo0YRO8c/y5qJ/TAJCZ1DMGJgeUjQERARk2vUG5SdAIwRLUSvwf3RICBN+B2NYwEHuuiPwydJy6tKxt6fqwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/3nSpU3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/3nSpU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D9E1F000E9;
	Mon,  3 Aug 2026 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785754544;
	bh=FTpPiDJ3u0ifL9RSNI20HgU26PdKP7ZhC/mAvui+l7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e/3nSpU3S948vTqnixuLJFis7kZtk5zShAneRvEyDnuXpXVgic3DjOvAA4+ofw2rt
	 6KBZaHRe4hWUI2m9QOkhAOKFcsQwtb7fISZjQAKYwQj7KHLLfW024XGHXLlTBZpo5p
	 iet2LzVqQCWiLtbe+LGqd35nouPEJr/5rSre2dGLQyrFtgaiUtzSxwzi+SaNFpliUl
	 iPF99ILUHiijem1xSUExzfxtYSBtuIOIeZZV5ek1WiQgeMVZZ7ppeKvciIBT+3cVQk
	 XmJD0j91ELrvd2bNwmlvGbPNyCE7RbxzVhy34aZCUkpH+5Srm2EFdby4ZCAGaxCymK
	 m0OqqIlVeQH2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to
 pass metadata size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:55:43 +0000
Message-Id: <20260803105544.54D9E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The format specifier `%pe` is used with `PTR_ERR(gunyah_wdt_dev)=
`, causing a variadic type mismatch since `%pe` expects a pointer while `PT=
R_ERR()` returns a `long`.
--

--- Patch [1]: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to =
pass metadata size ---
commit fc14da7f3ebc47ea633f966df3048e0592f524ee
Author: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

firmware: qcom_scm: ipq5332: add support to pass metadata size

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
this passes the metadata size as well.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 3eaa4c9ccf3cc..8902c445cf19f 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
[ ... ]
> @@ -2528,7 +2536,7 @@ static void qcom_scm_gunyah_wdt_init(struct qcom_sc=
m *scm)
>  	gunyah_wdt_dev =3D platform_device_register_simple("gunyah-wdt", -1,
>  							 NULL, 0);
>  	if (IS_ERR(gunyah_wdt_dev)) {
> -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
> +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
>  			PTR_ERR(gunyah_wdt_dev));

[Severity: Medium]
Will this type mismatch cause formatting or build issues?

The %pe format specifier strictly expects a pointer, but PTR_ERR() returns a
long. Passing a long to %pe violates C variadic argument typing rules and
triggers a compiler warning that could break the build in configurations
using -Werror. At runtime, accessing a long as a pointer from va_list can
lead to undefined behavior depending on the architecture's calling
convention.

Could PTR_ERR() be removed so that gunyah_wdt_dev is passed directly to %pe?

>  		return;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-rproc-v14-=
0-a1f87b0b0ad2@oss.qualcomm.com?part=3D1
