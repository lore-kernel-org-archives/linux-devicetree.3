Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65582D8378
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726429; cv=none; b=EQHOgQKtcfSbJDWvdkEktyvw7NoUA4imz9KYX7G/33r9YtjSmGsc8PAPvUi/nlMJFaaBC0liIgwbbmvPq+FwDFnF8DUDoZzQOb/jbsBPQycXl+Ea90lrbDBcUF98YxXqiOhbT/gUaVd2glfPmqVZpnRVvoYvYkcwUVQpM1IYak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726429; c=relaxed/simple;
	bh=vLnYfNt6wVJu2MbZFCkgeAoDnbnq7YgKlxy1niSnaRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M7Mg6TX9Xz0Zn0pgjHlGtiaxLAKRDXWIQh0Hb8lJimHEXM5OeGiRrLFwrTSbOJagcYBbScZ3LnvX89+UKxpQfz3TZQLd9TzQvo5EDyDdoZa9H6OKWHJYYGXSsziZeiyj5FJxda6Z1qLY2pvECwrcOYCNe+xsXqcvpNep2RLPWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiU5h7Uu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiU5h7Uu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDA91F000E9;
	Mon, 29 Jun 2026 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782726428;
	bh=25uXwRoYK3zia5mE2CwImEPPHOYkn1v2Gf8xHF2A5EU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kiU5h7UuokUwdlANijWDCOFklNPHwIplMIg1gGtb+SGyteXwi0kcYjAYUeq2d2Twa
	 OjxNOBDh42f22WGoRCO5XEn8ui0oZCRkkGYIhiOFsxHRf1VVC2xqCMe1W3xHKS9T0r
	 +hdqwiwkX+kiAymgEzL11wOzOaAcQQjl9qmA0CUAKhiH2ualkKS0x4mNRdI76tXNTY
	 YWTXNyPwFEv8AjlJ8UHCVcb1fQTGpOYwEBEI8H42stlEba5xMkWHcyyDD0eUbsC4Hi
	 Bypi1JlLUsYZACNBJqo9qKUo8cqTeQ6I4G+DhlEIdPOtAuwoOxBEnJSgTjzMQ1/stI
	 37QCtYU6bXROQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] usb: host: xhci-tegra: Add Tegra264 XHCI support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Chang" <waynec@nvidia.com>
Cc: olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260629093406.1118594-9-waynec@nvidia.com>
References: <20260629093406.1118594-1-waynec@nvidia.com>
 <20260629093406.1118594-9-waynec@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:47:07 +0000
Message-Id: <20260629094708.2FDA91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `tegra264_soc` struct explicitly sets `enable_firmware_messa=
ges` to `false`, contradicting the commit message that claims the only diff=
erence from `tegra234_soc` is `max_num_wakes`.
--

commit f38c91ea7436bccae268e6611e1931cff02f07ec
Author: Wayne Chang <waynec@nvidia.com>

usb: host: xhci-tegra: Add Tegra264 XHCI support

This commit adds XUSB host mode controller support for the Tegra264 SoC.
It defines a new tegra_xusb_soc struct for Tegra264 and adds it to the
OF match table.

>     The host controller is very similar to the existing Tegra234 XHCI,
>     except the number of max_num_wakes.

[ ... ]

> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 7d56f35ec9e71..9a55d5818efb0 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
[ ... ]
> @@ -2752,12 +2752,40 @@ static const struct tegra_xusb_soc tegra234_soc =
=3D {
[ ... ]
> +static const struct tegra_xusb_soc tegra264_soc =3D {
[ ... ]
> +	.lpm_support =3D true,
> +	.has_bar2 =3D true,
> +	.enable_firmware_messages =3D false,

[Severity: Medium]
Is this value intentional?

The commit message states that the only difference from Tegra234 is
max_num_wakes, but tegra234_soc sets enable_firmware_messages to true.

Setting this to false means the driver will skip sending the
MBOX_CMD_MSG_ENABLED command to the controller via
__tegra_xusb_enable_firmware_messages() during initialization.

If Tegra264 requires these messages for clock scaling or power management
like Tegra234 does, this omission might lead to performance or power
management issues. Could you clarify if this should be true, or update the
commit message to reflect this difference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629093406.1118=
594-1-waynec@nvidia.com?part=3D8
