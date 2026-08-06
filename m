Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2786E42CB18
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054693; cv=none; b=Dp//jJ7EK7etcXT61XiNQ1VzR2rubaBRL/3xpj7R3TCMO9LzdIXvucg9Fx6oZiFX1K7C2czHfig89+D1JyzASl/P/TtNtFeqKNcaowXDlZVAJjG1Ku7UlSOO86r1/lJozccchrXYWYuV2onidFyu5kd981bPyRF5o9rwtdv4+qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054693; c=relaxed/simple;
	bh=9X2kqmMHopSLMQWXML2utmh32bt0+F/ccqFLqmKX3y4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C4aXDSH6LiBWlcWNqEyMaVC00CKPML47qKNU14zBa5EJ7rj+9rEBnFDa+QBBjDPZk8YZKauKl30L27U66u1W6r3+ZtZRDePGNYSAuo2lQuaoBKIxSs6P0Ku4yEC53BOJkfyPWrwe+UAyu2oOjjOs6KaW6DF+v6OHed7ruyLGaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB7Cmwhd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB7Cmwhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110851F000E9;
	Thu,  6 Aug 2026 22:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054689;
	bh=3c6dmcWJbZVH67mzuIZDnM7ucTVnkXHDUz8r2CNzGh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RB7Cmwhdk4JiyklJsRMCfypJSQhHhFnJunc3QKE/PJXxj125B197sZfvY72kQCPap
	 hPmCjh1CN6pILmCSflh+NTsWRckqruggpyNzYPKlseFu7kDrHf7z/kXTGyW+aN7QwG
	 5FaZI/r5u8tiUD3UWa6rKEtb7zbeEPCz8O0XXfsQw6e9I2y7Y+GfJYcaIsvpYfnAnd
	 jYY/EuABDGBDI7K6D/W8sgW48cMiPOUzkBv/MFAAtWotHRTaSmF9RFtpqec5NnNRea
	 LjmgquTjZSxiskI1KCXUrlb+S9m+mRtNHIMp+kQVgbHEOWtw9lCYh5n94kfWP0L+++
	 RC4y8yJchxWBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 04/37] pinctrl: airoha: an7581: fix pinconf of
 i2c_scl/i2c_sda pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-5-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-5-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:18:08 +0000
Message-Id: <20260806221809.110851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The macro definitions for AN7583_I2C1_SCL_PD_MASK and AN7583_I2C1_=
SDA_PD_MASK are swapped compared to their PU, E2, and E4 counterparts, resu=
lting in a cross-configuration of pulldown settings for AN7583 I2C1 pins.
--

--- Patch [4]: [PATCH v11 04/37] pinctrl: airoha: an7581: fix pinconf of i2=
c_scl/i2c_sda pins ---
commit fc9a8553da742d5b51b742208157bbf029a89fdf
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins

Pinconfs of i2c_sda/i2c_scl pins are swapped, this needs to be fixed.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 4d0b76f270300..817d51141fed1 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -2078,8 +2078,8 @@ static const struct airoha_pinctrl_conf an7583_pinc=
trl_pulldown_conf[] =3D {

[Severity: High]
This is a pre-existing issue, but since you are fixing the I2C pin
configurations here, could there be a similar mismatch in the AN7583 I2C1
pulldown definitions?

Looking at drivers/pinctrl/airoha/pinctrl-airoha.c, the macro definitions
for the AN7583 I2C1 pulldown masks are swapped compared to their pullup, E2,
and E4 counterparts:

#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
#define AN7583_I2C1_SCL_PD_MASK			BIT(15)

These swapped masks are then used in the an7583_pinctrl_pulldown_conf
array:

static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] =3D {
    ...
	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PD, AN7583_I2C1_SCL_PD_MASK),
	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PD, AN7583_I2C1_SDA_PD_MASK),
    ...
}

Does this cause a hardware misconfiguration where setting a pulldown on the
I2C1 SCL pin erroneously configures the pulldown on the SDA pin, and vice=20
versa, potentially causing bus lockups?

>  static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] =
=3D {
>  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
>  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
> -	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
> -	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
> +	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
> +	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D4
