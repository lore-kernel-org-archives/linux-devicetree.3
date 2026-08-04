Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C824746CB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860896; cv=none; b=egZ1MimLx5pBkW3v3xDJWUKjchvZFig6NV+/2d5MdQ0sKhW8pFmUiiH7Eodd7ALdYi3bfPTAzsiNutBwAo4TiNCOS69A+AR9lUCOvZ/gt5oJiikV5TocrJEk7f/K5PY91y/IfYJ/H0E9jLdUn3rTTQJJRTUWS1l7vCjsvCyu0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860896; c=relaxed/simple;
	bh=clujNkLaVE3SRMsOLhYcUOjuX3YaxbUHf2ZJPzZCdEc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b0u8tAUkMQ/ySJV86s2CBaYTMqyV9Woay+xm4XKxvuEYN4+Ez0Jx19Ac2ROGtPzVpbY+jzzjRLrMM3rJ1IdLZtco73/FTdulNA9wPoJTM7RbRWqjBDkAqovpy/wyCd5Db3LyHrWVCRaZQGxyySCKGxKld5a+zL2V1Ttr4byoKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drK/hpfA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drK/hpfA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABDB1F00A3A;
	Tue,  4 Aug 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860894;
	bh=S17FAxDRTPfRbopGgrqFGjZdqTJMJvG3c67urQ2Z0nU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=drK/hpfAlXDglqTMx+qgFs2xbDoz4IVXNVq7oViAIZm3BLy5tr5Xh9eDxlU6MvGl5
	 3kJHnL4LPGH/RJWJsM5UJlzuWJHWeL1/qy09Xk9w/SjqqmUpn3FJtPGoh7wbu7fHOs
	 rlUPga5MR+AxqTIliDtXUpM7W+DSsCruw8xjxy8z2oHYoj7cBa1DS3I+1Cr9X1lA5m
	 x/MqXliheK8sZmr8wDjpGoaddxc9w7yg97Mb/CQJ5h/80V8rvKvZGvr8BBO8ea0F4z
	 bCtEJz5/TURLm2w7EAZRhq0cbSqn6o9SiA7oisWHkYuV2z1lXVxHo7JT/fJeGsARPo
	 VPrfGvJzIJw8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/36] pinctrl: airoha: fix I2C1 pin mux config for
 AN7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804160419.3592327-11-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-11-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:28:13 +0000
Message-Id: <20260804162814.1ABDB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The I2C1 pinmux configuration mask sets the master mode bit but =
fails to include the mutually exclusive slave mode bit, potentially leaving=
 the hardware in an undefined state if slave mode was previously enabled.
--

--- Patch [10]: [PATCH v9 10/36] pinctrl: airoha: fix I2C1 pin mux config f=
or AN7581 ---
commit 7aaf099c9130097177ef6d5edb5a5f51b5fd1d25
Author: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
pinctrl: airoha: fix I2C1 pin mux config for AN7581

This commit updates the I2C1 pin group configuration to set bits 0 and 13,
enabling I2C1 master mode by default on the AN7581.

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
Will this leave the hardware in an undefined state if the bootloader
previously set the slave mode bit?

The commit message notes that bit 13 is for master and bit 11 is for slave.
By omitting the slave mode bit (GPIO_I2C_SLAVE_MODE_MODE) from the mask here
in i2c_func_group, the regmap update won't clear bit 11 if it is already se=
t.

Does this mask need to include the slave mode bit to ensure it is properly
cleared when enforcing master mode?

>  		},
>  		.regmap_size =3D 1,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D10
