Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A3920FA81
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143585; cv=none; b=PjVEs2cFBl4BBJDH3rAKvuAHFp9VnlY5/GvpIXbXVJU+H6B7Hfk7gIl55SXLta4fKOvfaGDghOZkk+W8Zjq8zAAJ1+e9im/nQ41R/PGjJhPcZny1l5O5balo1zPqY/36CFo7FGDnjdXqOIJAn918KfnOoLFCXBo3l1jlUqeEbhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143585; c=relaxed/simple;
	bh=bc/M8cmUd0tE6KilhRgdOQDqdCF/8JVsPfo+h153I8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TnDHj4XH8GNRx5k1kVMOvIC8Euyi/Zn+8zqxPJsVhUCnzSR3khQN9ulWPprz81+9tzJRw8uuTg+PoSAtQGXyYcBSNrEzNTBn77jpFb2mSn3NUGph4FpVAm7cZJ7g8mQKGfz2Y57TAFxBsY204GzF/0YmOCa+puRPCyzZwjhtDD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLuexE34; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLuexE34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCF61F000E9;
	Wed, 19 Aug 2026 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143583;
	bh=1NmybqzmSK0pZ1f5kLA8ZaFflG6D1IQRF7KT41M26eI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GLuexE34dKk7VWOKuGX5WPSU5fQdg90xsKpaKBad8Tr/RUbEV/5wLtNz/9MRmprwK
	 QCAA0LX6L4+BkoaTJZtIHPanD2B0ElOywhKHAi2aFR6bqhAffRBzh51td4OywbrAVi
	 H0VpOrkr97zvGr6erJo0srzFy+JnPTziFCtoS0sZiwnx/gpXkrHQiiH2m/U6sM7/O1
	 4dnapzvgKcbIaJGQSArCeXWi/GZwCOOe8FBhuOs+l5yjVEskAG2QNue2UvWgrYuQ2w
	 qFTaxIUcngRtq+cMq5vOQgmSjt3YbECTRR9OUIsyAhig4wH2fo1UKyaz6ZNI32yEjr
	 AGnifa98YODSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/9] iio: dac: mcp47feb02: rename command mask define
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819-mcp47feb02_refactor-v4-6-beb2aa3bfd09@microchip.com>
References: <20260819-mcp47feb02_refactor-v4-0-beb2aa3bfd09@microchip.com>
 <20260819-mcp47feb02_refactor-v4-6-beb2aa3bfd09@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 12:46:22 +0000
Message-Id: <20260819124623.2BCF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect initialization of the `powerdown` state when the device =
boots in `1kohm_to_gnd` power-down mode.
--

--- Patch [6]: [PATCH v4 6/9] iio: dac: mcp47feb02: rename command mask def=
ine ---
commit 5165e39a3476c86b84b827af722b000649c5b496
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: rename command mask define

This commit replaces a generic mask definition with two new macros,
MCP47FEB02_GET_VREF_MODE and MCP47FEB02_GET_POWER_DOWN_MODE. These
improve code readability when extracting channel configurations.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index 6f084eb71240b..8ca67c4021a86 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c

[ ... ]

> @@ -1070,7 +1071,7 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47fe=
b02_data *data)
>  			break;
>  		}
> =20
> -		pd_tmp =3D (pd_ch >> (2 * i)) & MCP47FEB02_DAC_CTRL_MASK;
> +		pd_tmp =3D MCP47FEB02_GET_POWER_DOWN_MODE(pd_ch, i);
>  		data->chdata[i].powerdown_mode =3D pd_tmp ? (pd_tmp - 1) : pd_tmp;
>  		data->chdata[i].powerdown =3D !!(data->chdata[i].powerdown_mode);

[Severity: High]
This is a pre-existing issue, but does this logic incorrectly set the chann=
el
to an active state when the device boots in 1kohm_to_gnd power-down mode?

When the device is configured in 1kohm_to_gnd mode in
mcp47feb02_init_ctrl_regs(), pd_tmp evaluates to 1. The preceding line sets
powerdown_mode to 0 (1 - 1 =3D 0). As a result, the check
!!(data->chdata[i].powerdown_mode) evaluates to false.

Does this cause the driver to report the channel as active, desynchronizing
the software state from the actual hardware state?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mcp47feb02=
_refactor-v4-0-beb2aa3bfd09@microchip.com?part=3D6
