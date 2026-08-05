Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3493546F6
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934165; cv=none; b=LO2p/m0P0NWoMQFuJkoiAp+b72uy0CjoIG791Wjbz3dAWdvmYN5Xsj836S342dtttNGmCd7NLAnrJtjVlTYqrrI8w5Typ3rRLPU21nZEP2lrshcd8YWnrSrOJ+kLxUkelrF1s4jEzVTXcSOXt0Np85f0gHrAR5zD6gvvMgyDWbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934165; c=relaxed/simple;
	bh=rIQ1o1woYRx5yuqiMZZ8sy6+kCSg/DMmSalPYsrZ9oY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZQ98PS4lY5RGIPv0Z5KWZ+AKHqXVbjAvA2x5n5WQS8g8noWKL1Osez2yxMRR3SOO7bseeSj5GwIgEu6w8GFbDh9ija6CIcViAnSOb0xN0P5j2808oHXXukJtFt4BhgnRnfvDt/Di6Pfb6e+oRNi+B5WkTBwej42SVD+kHk9q6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Br6yLajf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Br6yLajf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7FA1F000E9;
	Wed,  5 Aug 2026 12:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934164;
	bh=pdMNiSS5a2l0vy52FDXZIXAeDL8hIrePI86ha9eti+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Br6yLajflGytiezR+/0akzbipD/fv7zD+HcVqPTwip8scO6p8e+rpUcnnv+arPLpF
	 wS0vPdU9KlWmYm4EGGB5RmS9y9Qd38daQIDukAq2jNXvFpYMX9GZn9OalGrXUWLDiv
	 /HZTK7bicKWCm6oIFyZwyS+5q2m9g0naeGx42KSqzgOP+uHbKLOxZc0YYoS860Oc7B
	 /JW58M8ijs3PgypYv5yOj+ih+q+3bNLIDJkN4p/zuP3D2xXlRiS9wkKLNXp6K21epU
	 niZGztKJjSEec3FjeeF05moYNMEUH6b2Ykkt1ubcCidy5KfWm5RajPaHCQjyQ9jmgs
	 +6KyyHmx+GKxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/36] pinctrl: airoha: fix I2C1 pin mux config for
 AN7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805123408.3767648-11-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-11-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:49:23 +0000
Message-Id: <20260805124924.3C7FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The pinctrl mask enables I2C master mode but fails to explicitly=
 clear the mutually exclusive I2C slave mode bit, potentially leaving the h=
ardware in an invalid state.
--

--- Patch [10]: [PATCH v10 10/36] pinctrl: airoha: fix I2C1 pin mux config =
for AN7581 ---
commit d4a94527c7cabb1267ba3d80a5ef64b6898faf1e
Author: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

pinctrl: airoha: fix I2C1 pin mux config for AN7581

The pin mux on GPIOs 1 and 2 on AN7581 supports I2C in master and
slave mode. When selecting I2C the according bits (bit 13 for master,
bit 11 for slave) must be set in REG_GPIO_2ND_I2C_MODE. This commit
fixes the i2c1 pin group to set bits 0 and 13 to set I2C1 master mode by
default.

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
Will this configuration mask leave the mutually exclusive I2C slave mode bit
set if it was already enabled?

Because GPIO_I2C_SLAVE_MODE_MODE is omitted from the mask, the slave bit
won't be explicitly cleared when applying this configuration via
regmap_update_bits().=20

If a bootloader had previously enabled slave mode (bit 11), setting master
mode (bit 13) here without clearing bit 11 could leave both bits set and
potentially cause the hardware to enter an undefined state.

>  		},
>  		.regmap_size =3D 1,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D10
