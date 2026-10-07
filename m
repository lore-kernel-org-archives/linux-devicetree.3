Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EB495036
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377749; cv=none; b=h33XkheYlIXKRMdLhgoxeccTzVKJYZfTpKgNbTgxvA8bSr0Kzzdm5H1hApyC3gtVpnLjvmeUy5/py97DVttDH+bSn64Dld9XVpv2fvkeeBNluYleN2JzJQ6r+mylbH8c0XRxJxTsgOiBL14sQmkaPa/uKJv3OUCzx33L1zYRduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377749; c=relaxed/simple;
	bh=gSChBMexVvrsBiEpHgR37nB5udyVy+s/fJd+puVh0Yk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=e3EHF+mwzgmckRsbjWJe5NZMs7sHus/YwP4uz7FtcLiLmWu8r4GVVCpP3YD5l87Tt0m2GK1XWTB7qTbcb2ql+JtSmKXgqdZduDr9QuiL9p/VtjHTFVXasxlPWFxdnM/IuNI3gMnz/8EVKImvp4rZ15S4neuZ1y8iJgNTUNPN7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUAhZYCx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUAhZYCx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878091F0089B;
	Wed,  7 Oct 2026 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791377737;
	bh=L0QmGE87PAnydDKuxf6XSHVU+OK6BpG18ACfmlVnb5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eUAhZYCxlOXvSs1OzP9ETCQF5F2R4OSFstJnTaIUc7R+80HQxuQw27tM0wFUb9/lj
	 J9JNKH9cZFkEWtVXVl+LSuw54jLSbGaIpvep7NbZapVeXdXiujhb43SUvIUCRr5Zpr
	 +Nb3gxlM15neGv+UhmxJjK/N819OiyZNnjea1s1aYfW28sJhHdtB3vG36una7+bkoT
	 QNpkXCgtWjO10hogfqyGcDVLPK7LMqUU8ETtH7NBF4XJPJjxfHGpiQkHXAHQBPG7YT
	 Emf+mb9Pr0BLWodik8CF3sZu9h8mZeY3DlmzF5XNRHgGp8XewdMa5XbyAkpC2iYfMb
	 g+ofizvBucglw==
Message-ID: <sashiko-outbox-163013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohit Dsor" <mohit.dsor@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 12:55:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: undefined CONFIG_DRM_LONTIUM_LT9611C added to defconfig
--

commit d7fcead75041287b78534a901e1cd8e93f2636d2
Author: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

arm64: defconfig: Enable LT9611C bridge driver
   =20
Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
This driver supports the LT9611UXD chip used on the Shikra IQS EVK
board to provide HDMI output via the MDSS DSI interface.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index fce418fe6ff65..b4be8ec8d4c86 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -977,6 +977,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=3Dm
>  CONFIG_DRM_ITE_IT6263=3Dm
>  CONFIG_DRM_LONTIUM_LT8912B=3Dm
>  CONFIG_DRM_LONTIUM_LT9611=3Dm
> +CONFIG_DRM_LONTIUM_LT9611C=3Dm

[Severity: Low]
Is this the intended Kconfig symbol?

The symbol CONFIG_DRM_LONTIUM_LT9611C is undefined in the Kconfig system.
Adding an undefined symbol to defconfig acts as a no-op, and the build syst=
em
will silently drop it during the build process.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-master_lt9=
611uxd-v4-0-9986704e2a7b@oss.qualcomm.com?part=3D2
