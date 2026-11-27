Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791047;
	b=Nc93sVxYmaUbZo34STZxQAqi7qfJ00tWco+3dcsazzFyIcwc1Q3cJK0U+cSn4bHD5wLV
	 xBIqZ+OOzg94DwQ7N/mfffAetbc4MZ41U0XnO39aHNIl8/mJVhtQAaLB6YtjmwE1uhENQ
	 ozvrFKmREgwmWsL1w0t34e2CC26QEqSqVcoPGiVsrznLEWNr9lcZLj31/Nkg42swAj4Cp
	 iMyVyd478KFiTgJOrZvrflIX2OLM3ifKhmMjSft5cKoxqzwwFsOGbv+c0WT/aRMoti6Np
	 yKjUuFcBinOW/fPYLFWyphSoVXZkXSiIbXLrteetuYAdCr9soH2TpUvPIv1hb5Sskjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791047;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QFuXpyUCsGlGNOuQRVqH+DYx7n5XHLMkTitnaSj5Z9E=;
	b=DSHX8ft5W3IG82mUJC6OQjOyUdO2vOIGDx38udg7VOTVE5eoolo1UbTALawVQqtRXG+K
	 mfCPWqDNBaQcYFj9n2T2hhzdt8UdliwegNi+xQKx0+EClk095pZtrcxZOiIw6sKsuR0oV
	 7JpVpwnd/Pqs+x5EnW8a+NJfmr3ai5uipVOwcHOnB9g6Uqi0jCNMR3Qy71lkiIBhaxveK
	 +aSsq23oDUzM8TPZ2v+lRhwacOaXeNsDUCo98AWIw4DqwLUZpCx+pwMX0G6+BOQ683ZV/
	 O/1JI7nnpY7xXYu3FREy/fCr3vRHhAwybdVYinfMGqmkXuNxbJyApPtUCNi//J54wKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jWeod/zM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA586606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWeod/zM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A9C1F0089B;
	Fri, 27 Nov 2026 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791047;
	bh=QFuXpyUCsGlGNOuQRVqH+DYx7n5XHLMkTitnaSj5Z9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jWeod/zMqHnA7R3PsX1cIHQFrVfRUGeLnWjxrPp820tKQOo6yuix5pB5YtkhdmiuC
	 QJl+Sfj2X0gtA2Fxtup1d6EQ3BOCGr+bMcTOv5I1QCoDWo1JWizk5AMrbqtgGxNQry
	 PW4Oz/LHXhwFHljiSKGVRwabm54NOUhKjIE2Zhj9aX0JAowbUxD4svl3SCd71r2ryK
	 6S18LGfqBX5xu8f1tOYht1dpJBL+QT2F6BnjZhT8pzDePWY2ke7eSzvPFoGzS8CQjC
	 C30MZF/p3Jy9E9tm3ZOqOAMNjFMt6eUEv7uWbMNoOczIz5vDnYo6tNuOcFmCBzk2TW
	 GFnXbrWg9LA0g==
Message-ID: <sashiko-outbox-237611@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v28 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-2-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
 <20261127-arm-psci-system_reset2-vendor-reboots-v28-2-da05a33b08d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 14:50:46 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] reboot-mode: duplicate mode entries in
  reboot_mode_add_predefined_modes()
--

commit 92584772bb5470229d1e0aa19cc27e08912a4e4d
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

power: reset: reboot-mode: Add support for predefined reboot modes

This commit adds support for driver-defined predefined reboot modes and
introduces reboot_mode_driver_init() to initialize reboot-mode driver
state.

> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index 328fa37598df3..2345ebd2c1ef7 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c

[ ... ]

> @@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_=
mode_driver *reboot)
>  	return 0;
> =20
>  error:
> -	reboot_mode_release_list(priv);
> +	reboot_mode_release_list(&priv->head);
>  	kfree(priv);
>  	return ret;
>  }
> =20
> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *r=
eboot)
> +{
> +	const struct reboot_mode_entry *modes =3D reboot->predefined_modes;
> +	struct mode_info *info;
> +	size_t i;
> +
> +	if (!modes)
> +		return 0;
> +
> +	for (i =3D 0; i < reboot->predefined_mode_count; i++) {
> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
> +			return -EINVAL;
> +
> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
> +			return -EINVAL;
> +
> +		info =3D reboot_mode_create_info(reboot->dev, modes[i].name,
> +					       modes[i].magic, modes[i].count);
> +		if (IS_ERR(info))
> +			return PTR_ERR(info);
> +
> +		list_add_tail(&info->list, &reboot->head);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Should reboot_mode_add_predefined_modes() skip predefined entries whose
name is already present in reboot->head?

When a DT node overrides a predefined mode with the same name,
reboot_mode_register() parses the DT modes first and then appends the
predefined mode onto reboot->head without checking for duplicates.
reboot_mode_create_device() copies every entry from reboot->head into
priv->head, so reading /sys/class/reboot-mode/<driver>/reboot_modes emits
the duplicate mode name twice.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-arm-psci-s=
ystem_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com?part=3D2
