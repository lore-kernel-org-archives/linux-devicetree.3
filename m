Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4591478F2B
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 21:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508374; cv=none; b=Jww/eXDcXTfIslr9XE2+t7Zci4+P9tyWtY2dmY6GV+Tkru/w7QtMvnG98yZ30o+7QYCsLVy+0W8l/wAqH7g0LyJ7av57oQFTS32mRRTl/qjAPOGVSfWgM80JuPiACeD28J5XelWi/Pg6MrU+bSkZn/ASpR8KCUD7Tl/kSL1nB7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508374; c=relaxed/simple;
	bh=zxeosFfo9BBtn1RqrQyW3YoCwL5gnAN+He0xkHqZj4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e4B6DYwAAVjHdbGQGKFGRTF0TLEXVw9pRHTSKHGzgCeKV6CUIznVHOCMFY36f6N7bAfQrmjtIdKOjstYWfllRT4Tl/aDH+pZbfRfn+jDlI5/+q/jfAfmMw2IhmRzP47Gxl1XTkmzGa9gO1MN6wLLQeLy4FD+D55MiZW567/PCiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFqeo51Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFqeo51Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4BF1F000E9;
	Fri, 26 Jun 2026 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782508372;
	bh=jAzKw3sYNsEZPrktY99qprlST9OPPx+mTpJe43RxvGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFqeo51YNT8iH297xKh1QgaKS+okorFjPgQzSu8qXd2f3TcnszaZIg9+LKtDMDhIE
	 NRTdQViCnmaM8FxyL+knr6Ch62gIj+tOgc9pXeFdzWE7WgRf5KX4XxFE9HQWnjPw5s
	 TUnLDOPx9e8dPmMvDufeQQEjNGoD9IdfXDsJkaLS4tHiO+PQKFVmBnWQxScualKMXE
	 gasuIuwIJkKW3FM3UO23F/tCFTMIikZ3SmdtLiOxrCGtsZHG6DwcJ1dh2NGEzl8+Qn
	 y8kHBZp6W1JFpHAsR3qgPhfUFwVv7KLz94UdxvK/DHTxdn0PnqtqibL2OaVrv0v1Hp
	 gaMQrOC1fA77Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/29] phy: rockchip: usbdp: Handle missing
 clock-names DT property gracefully
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-5-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
 <20260626-rockchip-usbdp-cleanup-v8-5-47f682987895@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 21:12:51 +0000
Message-Id: <20260626211252.5E4BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: NULL pointer dereference on missing `clock-names` =
device tree property remains unpatched in sibling rockchip PHY drivers.
--

commit 76423f2a5c05c96f96a6a0ac328646bd389ab49c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Handle missing clock-names DT property gracefully

This commit fixes a NULL pointer dereference in the rockchip usbdp PHY driv=
er
that occurs when the device tree specifies clocks but omits clock-names. It
adds a check to ensure the clock ID string is set before passing it to
strncmp().

Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.ke=
rnel.org

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 2845a012eafcc..3fc8222fcaec2 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, =
struct device *dev)
> =20
>  	/* used for configure phy reference clock frequency */
>  	for (i =3D 0; i < udphy->num_clks; i++) {
> +		if (!udphy->clks[i].id)
> +			continue;
> +

[Severity: High]
This is a pre-existing issue, but does this same missing clock-names
vulnerability need to be addressed in sibling rockchip PHY drivers?

Looking at phy-rockchip-inno-usb2.c in rockchip_usb2phy_clk480m_register(),
the same pattern appears:

	for (i =3D 0; i < rphy->num_clks; i++) {
		if (!strncmp(rphy->clks[i].id, "phyclk", 6)) {
			...

Similarly, in phy-rockchip-naneng-combphy.c in rockchip_combphy_parse_dt():

	for (i =3D 0; i < priv->num_clks; i++) {
		if (!strncmp(priv->clks[i].id, "ref", 3)) {
			...

If the device tree omits clock-names for these drivers, won't
devm_clk_bulk_get_all() leave the id field as NULL and cause a NULL pointer
dereference during strncmp() just like it did here?

>  		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
>  			udphy->refclk =3D udphy->clks[i].clk;
>  			break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rockchip-u=
sbdp-cleanup-v8-0-47f682987895@collabora.com?part=3D5
