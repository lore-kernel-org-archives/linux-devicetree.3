Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41544C501
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917661; cv=none; b=L7bkTvRvJG+g5nSNYgEl0b/5JY3XhgFLXKHWuq4XWzhDyGeuRJnnAnR0SFRmpioIYtaZzm1jOWSLtPfXSpcufe2yX+x/FVvbq5f3pTvQTofbEipIenw9d5soUFeMi7DukxvVRIwZL6P15W6MpNG38P+OdtqC4H3n6euNj81hdmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917661; c=relaxed/simple;
	bh=J+LY0EXGlyYN2LWX6C/G5sfxn98zyGmeHRuqdCH2Pwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q0wPb/663M++xciwmHslgOezSBWU8vUQiPlD8EJliP6Cu0s4Oro2Aj2ced6gsk5ExFjNiJ2hTLF2VPqjc+c0jWE/OFV7Af9M8X/MsijHudQpArZ0RpqReu/sLWDb2cs9rhD/goHEkP5xfZYfZixqRrmvde2L38ubb4Zt2vqczqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOrQxY/f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOrQxY/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7934B1F000E9;
	Fri, 24 Jul 2026 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784917656;
	bh=RK0pJA6FI5zk+xBpHtAiSTkxqbPxYzZaoCr0aVhOkew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cOrQxY/fDgX2pM3Q/ll1oWV4BtRBKcId7fhtEXCGKPtT6rywPRyVjnu+o+LK0lofQ
	 OIZKncZYBFeILR8uP3FmMQSGS7ENGSGNgPmTfSlHR62RuL4JrFhqR0CXISc1qiMXV6
	 j+hcLtPvLamq4ERE471YHmORaiVa8oUsls8psUWcdsTv7Vdna0LqGhOXhTuHD60yzr
	 DnC+DnZ2MlB6cpSu7DjRfeDJw06oIChJ7Pf9o5WxbgOfO6zQOSUvBBSRqXYz8Ye75m
	 JBAX5P51oL0V2C5tRlBqYRzEmysd4zZwjLeow7LUKj7vw2MI5AxW8D8D7QV8DhB/1P
	 8G0jNGow5MalQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/16] drm/rockchip: dw_dp: Add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-12-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v6-12-041d99a19c4e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:27:36 +0000
Message-Id: <20260724182736.7934B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The DW DP core driver uses `guard(pm_runtime_noresume)` in its int=
errupt handler, allowing hardware register accesses while the device is sus=
pended and its clocks are disabled.
--

--- Patch [12]: [PATCH v6 12/16] drm/rockchip: dw_dp: Add runtime PM suppor=
t ---
commit 76fb970e196b210c9742e601b51113d5f65dd02f
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Add runtime PM support

This commit adds support for runtime PM to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index ee0bd696064eb..b8138e796c4d5 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c

[ ... ]

> @@ -247,6 +260,12 @@ static int dw_dp_rockchip_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(dp->base))
>  		return PTR_ERR(dp->base);
> =20
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 500);
> +	ret =3D devm_pm_runtime_enable(dev);

[Severity: High]
Does enabling runtime PM here expose a bus fault in the core dw_dp_irq
handler on suspended devices?

The core DW DP driver uses guard(pm_runtime_noresume) which only increments
the PM usage counter without checking the actual power state:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_irq() {
	/* interrupt can only trigger for running device */
	guard(pm_runtime_noresume)(dp->dev);

	regmap_read(dp->regmap, DW_DP_GENERAL_INTERRUPT, &value);
	...
}

If a spurious or delayed interrupt fires while the DP controller is
suspended and its clocks are disabled, this allows the handler to execute
and read from DW_DP_GENERAL_INTERRUPT.

Accessing memory-mapped registers over a disabled APB bus can cause a bus
fault (such as an SError on ARM) resulting in a kernel panic.

Should the core driver be updated to use pm_runtime_get_if_active()
to safely verify the device is active before accessing hardware registers?

> +	if (ret)
> +		return ret;
> +
>  	return component_add(&pdev->dev, &dw_dp_rockchip_component_ops);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synopsys-d=
w-dp-improvements-v6-0-041d99a19c4e@collabora.com?part=3D12
