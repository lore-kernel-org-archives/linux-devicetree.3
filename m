Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D49B4AEBD6
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786404; cv=none; b=i7a8pVTlWEcv53Y1qPRYnIvr9Luj6539uTjXarotJMWLbdsBc/gKu3vX38oRPHw4aGgIeQL7mknzJY4mR8ocn1PvS965DesDZcvUdsisyzTxQPpfcrOSQyW2wK/xn8phyTNhaSgivZMMGUrG4NV8aSWvYeWyROxzsmx8A2Izd1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786404; c=relaxed/simple;
	bh=qJBiejHnMUpTGrf/KQ3Ox/US0+1XD0x4xw8c+EO5pkY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n8wY7Q7UYBJ1xL5nN5RLq5VpA9X3jyoMA1BcyxYJqyt1Lhwrm4Wv1eduOKqyuuK7Tt3LzpfexN324XjxwWaUxStXNc07akrMOMqF9+3iaKpcsI32zuBwlzbO6V0EKRyc+aZfJhUnU0BNUP67hpY0TCgROuXgaTyYQXcG9g5PTCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDf94LKL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDf94LKL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E673D1F00A3A;
	Mon,  7 Sep 2026 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788786394;
	bh=AxbGZPmHx0BObJ0+cww/U0bN0G/xmViudIJnn9VJkF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BDf94LKLvo18RQ+yVjzLjp6aN4RmP2cNNnUzZpdXPwuoh3a/qF8IR/JFC55L+f24H
	 H3ZfkHMy8oiayp4INPIaxlDu1p5f8NOL/jlNFtKygd3z10Cfe7+yYkvOPtMJ8Xdqm3
	 5GEvQrLYj+8cHOltth0qSplmF0DowS3h5P1PU942+01FXJcJZlU1BszrUfGD9sLMug
	 aSf0wHailcRHC90z1ztEk8M7yeCjoUHqN8UjIZKmssk1mP0hq6OvLZJnR0jvRbMK1Z
	 jig9kJHGupYrhQhu97BnMlAsj7E6UQfnweKTASCYjvCfs3ApyJylHpu8tfK6HiKY9W
	 z9tci5rdDx6PA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-1-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-1-b097cf1eac77@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 13:06:33 +0000
Message-Id: <20260907130633.E673D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing regulator disable on the newly added clock enablement er=
ror path.
--

commit 89a12851603b82367d9387f6f70068a1f77f92b9
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure

This commit adds an error cleanup path to msm_hdmi_phy_resource_enable()
to ensure resources are properly unwound if regulators or clocks fail to
enable.

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hd=
mi/hdmi_phy.c
> index eb1088755cb3a..fd675f537f2b8 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -67,16 +67,26 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
>  	ret =3D regulator_bulk_enable(cfg->num_regs, phy->regs);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
> -		return ret;
> +		goto err_pm_put;
>  	}
> =20
>  	for (i =3D 0; i < cfg->num_clks; i++) {
>  		ret =3D clk_prepare_enable(phy->clks[i]);
> -		if (ret)
> +		if (ret) {
>  			DRM_DEV_ERROR(dev, "failed to enable clock: %s (%d)\n",
>  				cfg->clk_names[i], ret);
> +			goto err_clk_unprepare;
> +		}
>  	}
> =20
> +	return 0;
> +
> +err_clk_unprepare:
> +	for (; i > 0; i--)
> +		clk_disable_unprepare(phy->clks[i - 1]);
> +err_pm_put:
> +	pm_runtime_put_sync(dev);

[Severity: Medium]
Does this new error path leak the regulator enable count?

If clk_prepare_enable() fails, the code jumps to err_clk_unprepare,
unwinds the clocks, and drops the PM runtime reference at err_pm_put.
However, it appears to skip calling regulator_bulk_disable() for the
regulators that were successfully enabled earlier in the function.

>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-drm-msm-hd=
mi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com?part=3D1
