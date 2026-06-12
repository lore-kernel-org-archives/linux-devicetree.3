Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0BB3876B2
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278904; cv=none; b=hzUc7SfAUb+P8Awl9ErI2BNvawn+75UZWgk+SUpX91nSLT1gU4p1RZyIc5gNZG85je69/e/ZhOezUQAAFgAKrX/D1/t7hhr3sPPP7ZgKbj2B8LQXqj8rPdrizFQDv5z0g+Ksv+WKPxB8wJHE00MoHep4IMiXIvOkK98dEjzQs4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278904; c=relaxed/simple;
	bh=DjGE8IAHayvUoR43d/us7e/zoHg12/xtP3zAuYrrFx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NyS1UEZWBw6weNiWgCj2/YmDgtlRi4xvpCKIuKAkm7pQ821umS/+Hac0dKG78tZ/x8LSWs/TX0PrN6l2H75pXkf+yZxEPyt1PvHlxy+qOsxpf52FEUlQQqbinzXxtaFvurB065ad81n36xvRRoMyOblpGC/CkJ3Elb4EZdv23AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bydhABu+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bydhABu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2D41F000E9;
	Fri, 12 Jun 2026 15:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781278903;
	bh=oFlmgDxFUn7lR8tx2QMeFJW0W7SfvcP+h46LYhSSF8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bydhABu+L88t+ri8a4Yf9ILRff3tk3wA2pw6JPzQWbL4bM1JTbtgc83F9ToOYS6Cc
	 Y62pMh8ELvVLmfyfbDq0S2VyRMreSXSwFDlNZGbWdjxPIoUfoEUukbyuMFgAlzmx7G
	 qnY6lBQukB0FyaR7r/dkxhAlkrMekzhDzDhLWp3aPH0dhHxyy5eGWBp+vqmdAIbXiX
	 UxN02qq5PZ9/cteKy44PtwUFXiFU1LIVk08qcw/rs1NK46DfM0s0TODn0Qd4Qgd4OZ
	 D4T8AIOfVbpm9Xw93n5T2g6lNa2q5s2a5G5PVTLZcfayzOfMLavMO4U45wSnz+/IpP
	 yMDyrnpqyyJeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] regulator: Add support for UGREEN NASync DH2300 MCU
 SATA power gate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-dh2300-mcu-v1-4-ab8db1617bc0@flipper.net>
References: <20260612-dh2300-mcu-v1-4-ab8db1617bc0@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 15:41:41 +0000
Message-Id: <20260612154143.3B2D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The platform driver lacks a MODULE_ALIAS() declaration, which pr=
events automatic module loading.
--

commit 64ccd270dc21c4fa03f9ebc2bb443018b396eeab
Author: Alexey Charkov <alchark@flipper.net>

regulator: Add support for UGREEN NASync DH2300 MCU SATA power gate

This commit adds a driver for the SATA drive-bay power gate function of the
UGREEN NASync DH2300 embedded controller. It acts as a simple on/off regula=
tor
controlled by register 0x41.

> diff --git a/drivers/regulator/ugreen-dh2300-mcu-regulator.c b/drivers/re=
gulator/ugreen-dh2300-mcu-regulator.c
> new file mode 100644
> index 0000000000000..69fda90f7ace6
> --- /dev/null
> +++ b/drivers/regulator/ugreen-dh2300-mcu-regulator.c

[ ... ]

> +static struct platform_driver ugreen_dh2300_mcu_regulator_driver =3D {
> +	.driver =3D {
> +		.name =3D "ugreen-dh2300-mcu-regulator",
> +	},
> +	.probe =3D ugreen_dh2300_mcu_regulator_probe,
> +};
> +module_platform_driver(ugreen_dh2300_mcu_regulator_driver);
> +
> +MODULE_DESCRIPTION("UGREEN NASync DH2300 MCU SATA power regulator");
> +MODULE_LICENSE("GPL");

[Severity: Medium]
Will ugreen_dh2300_mcu_regulator_driver load automatically when built as a
module?

This driver lacks an id_table, of_match_table, or a MODULE_ALIAS declaratio=
n.
When the MFD core registers the sub-device, the platform bus emits a uevent
with MODALIAS=3Dplatform:ugreen-dh2300-mcu-regulator.

Without the alias mapping, udev/modprobe might fail to automatically load
the driver on boot, leaving the SATA drives unpowered unless the module
is manually loaded.

Would it make sense to add MODULE_ALIAS("platform:ugreen-dh2300-mcu-regulat=
or")?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-dh2300-mcu=
-v1-0-ab8db1617bc0@flipper.net?part=3D4
