Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC628488F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455719; cv=none; b=HwzfxXsVbVvXAiTjqmX9xN3Ha17aWFnLJ5VhdvI63+QNUV4LdTSHl/9NRdeTJ9E/fPIZZa4b6lbDkRS2FhYs6WB3RNLHDplqr33/l6JGRXB8hvufWJiNzTGde8At/uQPtC1rzh0044wM4W+k4IGpt7MfqmH2SS+KT4B0u1pAzzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455719; c=relaxed/simple;
	bh=eYtBpb/TNeNAeMhhgFvIrzbT7zJxJfNxdMqTQo7WAvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FYAkpEZaxpfcwqI603WRUrSWbmAA+j3VmdI6m/5A4op8Ug3Ki0CZj6HqpfH3ViDEUWcHCecccdIk65rQUTKsSUetQall2Ut+yvGCO8mnwDJeOgWwSh1WT6rpfkDG5J3chd+lY8B0h9xQdku4Kgrx0tIjzxCt4VFPvPyUmv8AXuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BucKeSkq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BucKeSkq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4013D1F00A3D;
	Fri, 22 May 2026 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779455717;
	bh=+d/b9nUsVFt0quqFAPyaZIa0IMqG6+4LHZZFHMp14GI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BucKeSkqxbmVHsavZslmcr+rkUuLJjVXvJxORWwlauHYZzSDgxdjtdkpgat+OdBzi
	 YCuzI2ZscH/LWqIHhw6Dt0w3mlpS20rc3K+W2kcr8Un4+q3Wy4YbjnHosqP8LFnR4u
	 rwSm3QkCxYh3tvm3Vb1Zser8EmHYx82G/NRKc0kBNUifOXjatTTU93HE7f87cVOebN
	 TJrO5eGHyP98AIYK0Cp87lQtzH2XFxkoRxQEQzfyDUYQMzOZ5A/h23p+Xkw13B+zhy
	 Jz44H7bfMRs7nuW4WIYSPfN8Ucy70EyqYjJoowsUZONlYNTfMawzzIQXIKuv/uN7rc
	 JMKCtJ1INI+vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/9] reset: eyeq: Add EyeQ7H compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522-clk-eyeq7-v7-2-14ad6c2c5213@bootlin.com>
References: <20260522-clk-eyeq7-v7-2-14ad6c2c5213@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:15:16 +0000
Message-Id: <20260522131517.4013D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `valid_mask` values for several new EyeQ7H reset domains are i=
ncorrectly calculated based on the total number of items rather than acting=
 as a bitmask of valid hardware offsets, causing valid reset requests to be=
 rejected.
--

commit 8189291a57ece537a6cbcca42424bb22f1515514
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

reset: eyeq: Add EyeQ7H compatibles

This commit adds support for the reset controllers found in the EyeQ7H OLB.
It introduces three new types of reset domains, defines their respective
configurations, and updates the wait timings.

> diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
> index 1a38579838970..381237d50f061 100644
> --- a/drivers/reset/reset-eyeq.c
> +++ b/drivers/reset/reset-eyeq.c
> @@ -73,6 +74,40 @@
>   *  9. PMA0	10. PMA1	11. MPC0	12. MPC1
>   * 13. MPC2	14. MPC3	15. PERIPH
>   *
> + * Known resets in EyeQ7H acc domain 0 (type EQR_EYEQ7H_ACRP)
> + *  1. VMP0	2. XVMP1	3. VMP2		4. VMP3
> + *  5. MPC0	6. MPC1		7. PMA0		8. PMA1
> + *
> + * Known resets in EyeQ7H acc domain 1 (type EQR_EYEQ7H_ACC)
> + *  1. NCORE0	 2. NCORE1	3. NCORE0_M	4. NCORE1_M
> + *  5. NCORE_NOC 6. VMP_NOC	7. MPC_NOC	8. PMA_NOC
> + *
> + * Known resets in EyeQ7H ddr (type EQR_EYEQ7H_CFG)
> + *  0. APB	2. DMI		3. DFI		4. PHY_SMS
> + *  5. CTL_SMS
> + *
> + * Known resets in EyeQ7H east (type EQR_EYEQ7H_CFG)
> + *  0. ISP	2. VEU		3. LBIST
> + *
> + * Known resets in EyeQ7H periph (type EQR_EYEQ6H_SARCR)
> + *  0. gpio	1.EXT TIMER	3.UART		4. SPI
> + *  5. I2C0	6. I2C1		7.I2C2		8. I2S

[ ... ]

> @@ -558,6 +681,113 @@ static const struct eqr_match_data eqr_eyeq6h_acc_d=
ata =3D {

[ ... ]

> +static const struct eqr_domain_descriptor eqr_eyeq7h_ddr_domains[] =3D {
> +	{
> +		.type =3D EQR_EYEQ7H_CFG,
> +		.valid_mask =3D 0x1F,

[Severity: High]
Will this valid_mask reject valid reset requests for the CTL_SMS (offset 5)
reset?=20

The known resets listed above include APB (0), DMI (2), DFI (3), PHY_SMS (4=
),
and CTL_SMS (5). Using 0x1F only covers bits 0 through 4, meaning a request
for offset 5 will fail the bitmask check in eqr_of_xlate_internal() and
return -EINVAL.

Should this mask be 0x3D instead?

> +		.offset =3D 0x008,
> +	},
> +};

[ ... ]

> +static const struct eqr_domain_descriptor eqr_eyeq7h_per_domains[] =3D {
> +	{
> +		.type =3D EQR_EYEQ6H_SARCR,
> +		.valid_mask =3D 0xFF,

[Severity: High]
Is this mask calculated based on the total number of items rather than acti=
ng
as a bitmask of valid hardware offsets?=20

The known resets for the periph domain include I2S at offset 8, but a mask
of 0xFF only covers bits 0 through 7. This appears to affect several other
new domains as well (like east and xnn), where the valid_mask value seems
to be calculated as (1 << num_resets) - 1 rather than setting the specific
bits that correspond to the valid offsets.

> +		.offset =3D 0x030,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-clk-eyeq7-=
v7-0-14ad6c2c5213@bootlin.com?part=3D2
