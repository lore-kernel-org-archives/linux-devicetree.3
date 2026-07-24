Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4C3E1D0D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883440; cv=none; b=T4BH0yptBy6/l06HQXN0QetA7aZyj4xjtpLBZm651ASy9rIqJx53b2cowUaPoVTCSBIaG5HcOJTUKUDwm6+frMNbZAZBC5roZI0k+XU8sDBfOfSmrIxypGOpSwhDmOO5GsuKZZmfyKORZMB29aUJKPSDIlBmevcc15mgBjnqrjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883440; c=relaxed/simple;
	bh=+nBucGgdOokev7XBpvvcfTmgCJg5ox6OJkIvmnpRAAM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iMFutAy/JdTn53GbDZy/g6B0w60KbawrCpUm0ABSEpK45GW8E29HjWyWcw3/Fw9ByVByI7P81cbHAFiQi3lW424jhGEOWT4D/BnaNrxVtPyb+w57tjFdCqTV3bJMsgU84gkJNIeNtbJlipdwAbTkodHvwHkuIGnZkqhLa9yUXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fdo5olEB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fdo5olEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9847C1F00A3F;
	Fri, 24 Jul 2026 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883435;
	bh=jEa1pdIvzcuvyQwL0OwofTNQNJbOitnvXMcxCJWoK6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fdo5olEB82FgdCyvg5wEUp5+QqN0/Tc9ai/tr+6nIob9IJoR/0Ns8iH+9XmW2v1sA
	 dg2YEccsBC6ijpH41SRxPY/Sb+V5L5B54lPH+YPpzEFJMXCe96AnICcF1ZGHeZfn+s
	 DLw3sPMbD7MHP89T5pW6531dk5Kgguh1SeQ+Ro3TVClCGoKD1m2FedzcRvHK4gVkRe
	 Iv2Fjp9w5qOUtKUL95x/fEg+4loiYxUBthPJTZ2PAEH3G71MGha7u5eBiIuGcSRzVd
	 pn2QyCvCsBFMqwqY2qlnYQxQcDiPoULrDum29LnLcxhQJNP/23ik/hycr/uciIlWd3
	 2R4/RJr0nqf5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/5] pwm: dwc: add of/platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724084346.1690-1-dongxuyang@eswincomputing.com>
References: <20260724084153.1473-1-dongxuyang@eswincomputing.com>
 <20260724084346.1690-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:57:15 +0000
Message-Id: <20260724085715.9847C1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Module autoloading for non-OF setups will fail due to a module a=
lias mismatch.
--

--- Patch [3]: [PATCH v13 3/5] pwm: dwc: add of/platform support ---
commit efa310f451f843a8ed2f095d6d6d3c443510ca1a
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

pwm: dwc: add of/platform support

This commit adds platform and OF-based probing support for the dwc PWM
controller, allowing it to be used in non-PCI systems. It implements polari=
ty
control using the timer's dual load registers and updates clock and runtime
PM state management.

> diff --git a/drivers/pwm/pwm-dwc-of.c b/drivers/pwm/pwm-dwc-of.c
> new file mode 100644
> index 0000000000000..4956dd36f93ad
> --- /dev/null
> +++ b/drivers/pwm/pwm-dwc-of.c

[ ... ]

> +static struct platform_driver dwc_pwm_plat_driver =3D {
> +	.driver =3D {
> +		.name =3D "dwc-pwm",
> +		.pm =3D pm_ptr(&dwc_pwm_pm_ops),
> +		.of_match_table =3D dwc_pwm_dt_ids,
> +	},
> +	.probe =3D dwc_pwm_plat_probe,
> +	.remove =3D dwc_pwm_plat_remove,
> +};
> +
> +module_platform_driver(dwc_pwm_plat_driver);
> +
> +MODULE_ALIAS("platform:dwc-pwm-of");

[Severity: Medium]
Does this module alias mismatch prevent automatic module loading on non-OF
setups?

The platform driver registers its name as "dwc-pwm", which means a system
without Device Tree will emit a uevent with MODALIAS=3Dplatform:dwc-pwm. Si=
nce
the provided MODULE_ALIAS is "platform:dwc-pwm-of", udev will likely fail to
find and load this module automatically.

> +MODULE_AUTHOR("Ben Dooks <ben.dooks@codethink.co.uk>");
> +MODULE_DESCRIPTION("DesignWare PWM Controller");
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084153.1473=
-1-dongxuyang@eswincomputing.com?part=3D3
