Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E1369D55
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162266; cv=none; b=hj69oZ9adP70FUnwN9njrsqpIjPZudbuWDJKs6SpgCTS7I+CQYsVVskH82T8djpCFDLkSJk5WqnmvHGZQsrj8nvDRe/N9kG/Db78WF1oaJFU7++aeQMVxpWZeqDEUrvCtQcxNxAX1+lSEyKMU1UW2y53K+TaresYm/sI9InXLHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162266; c=relaxed/simple;
	bh=Jhyci0/ODAPh33oVcCUz3HGGq4+oIpLszH9UxLFtj1w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TNW5N8KjGa9JywSEDf5EVTapeL0v/+kibERwD4UjyrruU8UDNRhp9QEej5d/Gw1SKt6F58FageY7MQFwE3wYWImxRZHd1+b9lkwC6U/LxPko5uEkB6DVt5kZs81mBykuL+mPH/rBOTil5kzCoo19VZx61QQ7em9MpMmjJtcPN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvD7bKNw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvD7bKNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A23F1F000C5;
	Fri, 16 Oct 2026 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162265;
	bh=++4/7c4G0P+hAD4DbNV8k+tpu5WFo/PcRs9uW71hr+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HvD7bKNw+rmjw3A3smwya1ZJUNyGg55ceRmq/O+0/DVBgfKf6fCCZpNYB76bcn9N4
	 vBG556VQanDisirhs6owG/WdKLBBViUGY1l31SKtL+U62AGzdC6kLTKAVsGvLdIG8g
	 9etYX9UaT6mU5yJRsXgHRLyGWXs9rYSgMA+yi/oDEpJKgUJNyZw+kyL/B3pLzIqUuO
	 uMso78D7JU2TlJdzqeytg12FNt/KkoTSielHtRMfvuzifwHlk5GE//dpwixB9gkCpx
	 xBQ1xG2l93izmMT1HIfP13JYFYdHSYijERjIpBvFPTkcENxd9GKf0XcR2XKjXjm3UQ
	 3xFfyN1+3hihA==
Message-ID: <sashiko-outbox-174496@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 3/3] net: phy: Add driver for Motorcomm
 Quad 2.5GbE phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015145021.2216003-4-kyle.switch@motor-comm.com>
References: <20261015145021.2216003-1-kyle.switch@motor-comm.com>
 <20261015145021.2216003-4-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:51:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: phy: motorcomm: concurrent probes bypass DT validation erro=
rs
--

commit 3e7bb92256550d445ce01db4ee78cd8ee5a8b2f1
Author: Kyle Switch <kyle.switch@motor-comm.com>
Date:   Thu Oct 15 14:50:21 2026 +0000

    net: phy: Add driver for Motorcomm Quad 2.5GbE phy
   =20
    Add support for Motorcomm YT8824 quad-port 2.5G PHY to the existing
    motorcomm driver, using the phy_package helpers for the shared top
    extended register space.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ ... @@
> +static int yt8824_probe(struct phy_device *phydev)
> +{
> +	struct device *dev =3D &phydev->mdio.dev;
> +	struct yt8824_shared_priv *shared_priv;
> +	int ret;
> +
> +	ret =3D devm_of_phy_package_join(dev, phydev, sizeof(*shared_priv));
> +	if (ret)
> +		return ret;
> +
> +	/* Ensure other PHY probes wait for shared mutex initialization. */
> +	phy_package_lock(phydev);
> +	if (phy_package_probe_once(phydev)) {
> +		ret =3D yt8824_phy_package_probe_once(phydev);
> +		if (ret) {
> +			phy_package_unlock(phydev);
> +			return ret;
> +		}

[Severity: Medium]
Can concurrent PHY probes bypass device tree validation errors here?

If yt8824_phy_package_probe_once() fails (for example, if the
"motorcomm,package-mode" property is missing or invalid), it returns an
error and the current PHY fails to probe.

However, the phylib helper phy_package_probe_once() has already set the
'once' initialization flag. If another PHY on the same shared package is
probing concurrently, it will wait for the package lock, observe the flag
as set, and skip the package initialization block.

Because yt8824_phy_package_probe_once() initializes the shared state
defaults before validating the device tree:

yt8824_phy_package_probe_once() {
    ...
    /* Initialise shared lock for YT8824 */
    mutex_init(&priv->shared_lock);
    priv->sds_initialized =3D false;
    priv->package_mode =3D PHY_INTERFACE_MODE_INTERNAL;
    ...
}

wouldn't the concurrent PHY successfully return 0 from yt8824_probe(),
bypassing the explicit DT validation and operating inconsistently with
the fallback state (PHY_INTERFACE_MODE_INTERNAL)? Should the driver
record the initialization failure in the shared private data or clear
the flag to prevent this split state?

> +	}
> +	phy_package_unlock(phydev);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015145021.2216=
003-1-kyle.switch@motor-comm.com?part=3D3
