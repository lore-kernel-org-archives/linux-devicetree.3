Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D8E3B8409
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884034; cv=none; b=McJ5xX8tLM5I1LoTQJthTGUDOjRC6pCRTEiikxusMWrEeC3tY7uNviv66HuQT2dMjj1pC1+IDWQ2ERKEzBFx+tKY1jZmCvuYr/hlInFZ4kUqY3qJkbrlmdUKVil6k5pkGKJw4vHJ4XAicuIdHiF6/7H+a5kIvysN8kfPSnAe3b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884034; c=relaxed/simple;
	bh=HfVcWrindkzhMkubkgnk6xG68TZ/Ez3r3x0tX6ib3L8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IJFTXW5+KB5Z7P0A/pYrM/Ri8+q0TbYEPDaKig7rNoUCD6dBXHbxDdiCdcB51T70sZ0Bi5jCxyk0YSc6GinclciH2EeL0H9ne/1kT0b6kaNvirSdrrGFVlXuHaEmzzUuWZfbW+FqvCLk1q4MxUA5fm+rKLMWYGsqUmjddi2JYgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fG1ry8Zt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fG1ry8Zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E415D1F000E9;
	Fri, 19 Jun 2026 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884033;
	bh=LUWQdh1cG7wtvlgGNzJS3V1yUtJw216f7NCqriTE79k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fG1ry8Ztqljdd9rRz8PWU+Zcm5uur9QXebWUVCD9b1rWbyPsKNbEoiQRQjI7gvc48
	 A0Sjr6phxSTGE0FGIUlihN/Mcix/RBxyp/GuBFq5OWiqXsQS/QXRLNDKS3i7qy9Hoi
	 fBg0loOK/TVuTxq600SO2aES7qHFj5BFsOwAeOVvZLWOOd7whJZqSmk3M1u2zg0JxS
	 UK0K4e75JQmJnJh/g++614ycbjHkAd85tHFhBuWKhfZmgyHMfqh7fwXdHuw7CWaMX0
	 CfAoImVjke5VhbRJWafgYkQ7d9Gbr+XNxH2JMEs4JqEZ0j4HVpdKjfC09RnUj7VNsq
	 f1Y9hUKNJ40Nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/23] phy: rockchip: usbdp: Drop seamless DP
 takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-5-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
 <20260619-rockchip-usbdp-cleanup-v6-5-3bb1f54b3f35@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:47:11 +0000
Message-Id: <20260619154711.E415D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unhandled error from reset deassertion leads to unsafe MMIO access
--

commit 8eeae98a635eaf9514a2125a383fcc16fe03b51d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Drop seamless DP takeover

This commit removes the seamless DisplayPort takeover feature if the
bootloader had already enabled DP. The DRM stack currently does not support
this and the code will leak clock resources on module removal.

Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.=
kernel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 2845a012eafcc..ffe39c968c70c 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -936,9 +936,9 @@ static int rk_udphy_get_initial_status(struct rk_udph=
y *udphy)
> =20
>  	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return value of
rk_udphy_reset_deassert_all() which is called immediately before this
regmap_read() in rk_udphy_get_initial_status()?

If the reset deassertion fails, the peripheral block could still be held
in reset. On ARM architectures, performing MMIO access to a block that is
actively held in reset can trigger an asynchronous external abort (SError),
leading to an immediate kernel panic.

Could this be updated to verify the return value, clean up enabled
resources like clocks, and propagate the error? The same pattern appears
in rk_udphy_init() where rk_udphy_reset_deassert() is ignored just before
calling regmap_multi_reg_write() for the PMA block.

>  	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_A=
LL, value))
> -		udphy->status =3D UDPHY_MODE_DP;
> -	else
> -		rk_udphy_disable(udphy);
> +		dev_dbg(udphy->dev, "Started with DP PHY pre-enabled; seamless takeove=
r unsupported\n");
> +
> +	rk_udphy_disable(udphy);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-rockchip-u=
sbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com?part=3D5
