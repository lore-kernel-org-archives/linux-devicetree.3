Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD73C8C5E
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389539; cv=none; b=rPbyxWY1NCS0Ftoo5NA9vNbruvSunc0baJ9QeLFDGUw1GRyCJDNBoXrMdKWGWyUXge2K09X+BLZ9CJKU0AjnF4QQrcvjxDHnNI/Nk+LHqG9b8+36ny1Lb+DarEDHtW8hJodVt5SweGRRv8xIzBak9+kyf83qvnLLy4qkyBhEJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389539; c=relaxed/simple;
	bh=GJ3A2lVvlGjoFTNy9KY2HX/+oA6eFBJ3qUV3d1dmUF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qx/FwJJGSMX6g31kT0QUf2p/Sczw2jwrV87nGxEN1+XqkQRTiIyJLuhP2m9BPvujpYRjDRaY3LmC16MyuQ9Xt7VfdM7JgZYAVYujUAQqjaepH9FL8D6p/rHQ/fjcq09wVGbmtrQ6TVH5yElw8p8F6Y7pETnjXet1ZC/svxSfk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNoSIv5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNoSIv5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92081F00898;
	Tue,  2 Jun 2026 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780389537;
	bh=snrZ+Yne5ySmBFquNK6XTiD+YCZe8k5Pqw8/c2nWpzo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TNoSIv5vJa4FLXzNbGyWkhzRH9wJbiUYujacoc2VgL7M9aJiNakGmpuiBq/CW7cDr
	 p4THnJ7V1GrZ+D9Acuik5VGnrxDgHWAOZrYsz8tQj+gHv1GSBUExygmRdXLWiGq+dn
	 syyaxPVLXe8SwD7+6GPH0VeaOUlHFO1L82ath3PK/Y6BS/nT2efJ8llPL4Kog/VLbI
	 pQQGhYwoR6NpCh2wEZ2Uc9o+Gd5GgMKQf+0jOIcZnF7oetKfOubt8ZvsEDd1PEdlUi
	 TifIAaRAJcplUU/VFeFY/5qtU+7rpRjOUrvo9w/Na9GTWEnGcpoeRdPRewwNAPm/+h
	 snZKYBnoGVdzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] phy: add basic support for NXPs TJA1145 CAN
 transceiver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dimitri Fedrau via B4 Relay" <devnull+dimitri.fedrau.liebherr.com@kernel.org>
Cc: olteanv@gmail.com, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260602-tja1145-support-v6-2-0e0ffc8ee63d@liebherr.com>
References: <20260602-tja1145-support-v6-2-0e0ffc8ee63d@liebherr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 08:38:56 +0000
Message-Id: <20260602083856.E92081F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] If setting the CAN operating mode fails during `tja1145_phy_powe=
r_on`, the PHY hardware is left in normal operating mode without rolling ba=
ck to standby mode.
--

commit 4b999361552fc4af356fbf9fbd3b1ca5f2dd59bf
Author: Dimitri Fedrau <dimitri.fedrau@liebherr.com>

phy: add basic support for NXPs TJA1145 CAN transceiver

This commit adds basic driver support for the NXP TJA1145 CAN transceiver.
It enables bringing the PHY up or down by switching between normal and
standby modes using SPI commands.

> diff --git a/drivers/phy/phy-nxp-tja1145.c b/drivers/phy/phy-nxp-tja1145.c
> new file mode 100644
> index 0000000000000..1e8bd169743ab
> --- /dev/null
> +++ b/drivers/phy/phy-nxp-tja1145.c

[ ... ]

> +static int tja1145_phy_power_on(struct phy *phy)
> +{
> +	struct regmap *map =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	/*
> +	 * Switch operating mode to normal which is the active operating mode.
> +	 * In this mode, the device is fully operational.
> +	 */
> +	ret =3D regmap_update_bits(map, TJA1145_MODE_CTRL, TJA1145_MODE_CTRL_MC,
> +				 TJA1145_MODE_CTRL_NORMAL);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Switch to CAN operating mode active where the PHY can transmit and
> +	 * receive data.
> +	 */
> +	return regmap_update_bits(map, TJA1145_CAN_CTRL, TJA1145_CAN_CTRL_CMC,
> +				  TJA1145_CAN_CTRL_ACTIVE);
> +}

[Severity: Medium]
If the second regmap_update_bits call fails to set TJA1145_CAN_CTRL, does
this leave the hardware in normal mode without reverting to standby?

Because tja1145_phy_power_on would return an error here, the PHY framework
will not consider the PHY powered on and will not invoke
tja1145_phy_power_off later. Could this result in the hardware being
permanently left in a higher-power state?

Should the driver intercept this error and attempt to roll back
TJA1145_MODE_CTRL to TJA1145_MODE_CTRL_STBY before returning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-tja1145-su=
pport-v6-0-0e0ffc8ee63d@liebherr.com?part=3D2
