Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA43499F14
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054837; cv=none; b=Upgf30IRoQ4MyC+w3QXLA0hU+PRwP1r/Fv1FwFa/55c7yhKvMuqe+a+9PfOXRHv5ApHjNyI/1w2EJU+sCw2qmR6rqT85/17ekpvDRO5LywJTp1tVmE4rmb4CmqHoqUXzldFhoAfb4mafJAb4xMpMv81jXzCGr+aqw+XBNdsmXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054837; c=relaxed/simple;
	bh=HlRIrhduT3KFOD7VpoGoA1IJexyyddj6bd194NgMorw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ptl7BkoKEfF45MfVQrc5GY2iFKXsDPwkqYU1UHLKKUcikrLJwsosz0+bIsot8ys2Xx73W+PUgCH0yYlZSHqF+VMKmEL5gAUvZlwqGNukbSuyviC+rOsRnlNzxSP4GkqP1QM/0kPOH41O4bHaW6HmhRYP8Qkg0FdjfRUT1iXDF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f90LJNxl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f90LJNxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989621F000E9;
	Thu,  6 Aug 2026 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054835;
	bh=YQyYEvv2fB0v/GHeGzcIIL7hoOFyo9FjahnV/hf6S8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f90LJNxl2r9+wkteU+cVyA8hXlQTw2lIqLTNPUvUBgsId400a8arWAxHN510Yu85A
	 copvuio7Br1eRyv0TribEY1XMbZVBfbiIJR/UuD96ztpVu8+obn8Ke2t3HbwM3u1aJ
	 xvuM8DVI5eNWnIXpxKnMBArfxCZkRDaVWV/WYc+vBaw+Adfx1WagxS2xQbdaR+Kso3
	 hhtInwyhUiCREcqnvd2MYQ3FL99G5GzkUofkZXdnk5+36Ut+p+3ERFDtvSVZu8MML0
	 mYzkRNwMBOYYSspx75UZYOHH+vwPTnF6FY/Xg2RtZGZ/E4GbmcckaQig5N+cAZuvr7
	 R3kOuUnZeFSgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 10/37] pinctrl: airoha: fix I2C1 pin mux config for
 AN7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806220615.4078303-11-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-11-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:20:34 +0000
Message-Id: <20260806222035.989621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Setting I2C1 to master mode fails to explicitly clear the mutual=
ly exclusive I2C slave mode bit, risking hardware conflicts.
--

--- Patch [10]: [PATCH v11 10/37] pinctrl: airoha: fix I2C1 pin mux config =
for AN7581 ---
commit b286eed89799e719b07da2fdf90f3f9a8f22ef3b
Author: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

pinctrl: airoha: fix I2C1 pin mux config for AN7581

This commit updates the i2c1 pin group configuration to enable I2C1 master
mode by default on the AN7581. It adds the master mode bit to the regmap
update for REG_GPIO_2ND_I2C_MODE.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index ee2bd0ee8c40f..2695342adfc76 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -1158,8 +1158,8 @@ static const struct airoha_pinctrl_func_group i2c_f=
unc_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_2ND_I2C_MODE_MASK,
> -			GPIO_2ND_I2C_MODE_MASK
> +			GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,
> +			GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,

[Severity: Medium]
Does this mask need to include GPIO_I2C_SLAVE_MODE_MODE to ensure the slave
mode bit is explicitly cleared?

If a bootloader leaves the hardware in slave mode before the kernel boots,
could omitting GPIO_I2C_SLAVE_MODE_MODE from the mask result in both master
and slave mode bits being set simultaneously, potentially causing a hardware
conflict on the I2C bus?

>  		},
>  		.regmap_size =3D 1,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D10
