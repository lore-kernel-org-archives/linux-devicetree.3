Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3371B6D08
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 23:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789255012; cv=none; b=QadnQckPD8tOV6UkAZG/JFk+O/ymuP08hY5erlDTzgmag8/80ywPN7ZGbhjoBWtAgSCja2lRQVTb2Zt2MendP/QmSlD9qkfE5L3zhChKW1xa/5IBFefql5ZyLpCWDUQqXf4J2VXlrJkt9oSFnlB7ZiJyikZTgf9VINmhpvk1ua0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789255012; c=relaxed/simple;
	bh=y/y8JG3Rw2ukD/6cPnUBr2BPVnIF6abZsZldEpskO4g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j/S/CAysqo9Czh7BqRtacUz0l/ukrHXcu3Pk6926J6FVWofZDO8CtYMmkRN8KsEtckWBPDHIvvS8OsYwf9/Nx2hzqOGjmhL5UaQnn/n5ASGzEegyttV0Y4+37ezsbIYivoXBV0BLfbqNBQMJt4/VDdsYEBLi7SStmW0qVDC4O6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVPQg1Hk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVPQg1Hk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375C71F000FF;
	Sat, 12 Sep 2026 23:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789255010;
	bh=O991C9+HSrtJEWcXV3DSCr4HP42HWZvkvXQDqGD4WgI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVPQg1HkWwYdPnuy5ILA+KBiKCXCmhIRZdYp8m4ECK9MzYC0Y4/dEnkIJ7YF/BL5/
	 bzLQ8LRxSj+cCIoF13XW4F9ZqKHF8mNzJptR4GiUENDl3hSPNkZAgTiWp+ikpK7451
	 82IsVRh1lPpk55Bl4ic9WmKf9y5UchLWqmiCuVIBBpKfGeNFppyy8uWO9DnP1zFhKq
	 qTjhAB55MEcLNGzdRvz0P6x57pkAxU+xlF4L5Uawnh2fOjQf3E29u4YB6fKAp0LXBC
	 GxrF1uSDH2tENEdv5LjWxnHm5696QS5tEqYie8XLvuytLeJzS9wQndl9FkFt45V+vW
	 rmOOnTJDuTWzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/8] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260912225301.3396556-4-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
 <20260912225301.3396556-4-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 23:16:49 +0000
Message-Id: <20260912231650.375C71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Early return in disable_eud skips PHY disablement, leaking High-=
Speed PHY resources.

Pre-existing issues:
- [High] Calling readl_poll_timeout from a hardirq handler sleeps in atomic=
 context.
--

commit 895071c1614ba92a198085df0882e77e4e133a74
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path High-Speed PHY control

EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. This patch restructures the driver to implement
per-path PHY management, ensuring that the PHY for the currently selected
path is properly initialized and powered.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 25a6a8f110ec8..868725ad35e09 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -75,6 +135,8 @@ static int disable_eud(struct eud_chip *priv)
>  		return ret;
> =20
>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> +	eud_phy_disable(priv);
> +
>  	return 0;
>  }

[Severity: Medium]
Does this early return bypass the newly introduced PHY disablement on error?

If qcom_scm_io_writel() fails, the function returns early and skips
eud_phy_disable(priv). Will this leave the High-Speed PHY resources
initialized and powered on, leaking the hardware state?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to call
readl_poll_timeout() from a hardirq handler?

When the EUD_INT_SAFE_MODE hardware interrupt fires, the primary hardirq
handler directly calls pet_eud():

drivers/usb/misc/qcom_eud.c:handle_eud_irq() {
	...
	case EUD_INT_SAFE_MODE:
		pet_eud(chip);
		return IRQ_HANDLED;
}

Which then calls readl_poll_timeout() with a non-zero delay:

drivers/usb/misc/qcom_eud.c:pet_eud() {
	...
	ret =3D readl_poll_timeout(chip->base + EUD_REG_SW_ATTACH_DET,
				reg, (reg =3D=3D 0), 1, 100);
	...
}

Since readl_poll_timeout() internally uses usleep_range() which sleeps,
can this cause a panic or deadlock by sleeping in an atomic context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912225301.3396=
556-1-elson.serrao@oss.qualcomm.com?part=3D3
