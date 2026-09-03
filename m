Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6EF171B1
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417705; cv=none; b=TyVwoQfvrFBqdjTm2R4Uq7uozG92qjncZ1JJzALBKjWiTD/oRopaQXAbAU1ZFLOFEbxVjGuU5isjtrszM2n/K6k7+KALtg+c3XLruiG9ToJiKsE+7NH4dHMZ4UEXr0mBcmyeAjmCG1YGTNouVDbl9oIDqBUu9TtqVLvRUpZDQS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417705; c=relaxed/simple;
	bh=PopOuomsZ6vCi8sye3u934wNxZgSzE6agJneR+U8o7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ij+Yc9X+ht68uNLQKBv6jpQHAiXVQ2V4XHgo9bSMTf91Ulu3MBTl2Nb8g5avAcFoe4u6H/QdxOa28tqylubCjuiUSjmDhbH9keEEIc4ZWUeOgm6ivd1EYa3sAB8XZPm1fyHWXe7/O927MwSxCTXBuFXX/1AHWaOUOVtqpw4Jxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCuDJlzk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCuDJlzk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89161F000E9;
	Thu,  3 Sep 2026 06:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417701;
	bh=f0fkFWfgIQKwFTf22poqIfizIFr1Wu4c/nzEgFL4MVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mCuDJlzko6+0tBgX4Yw/Nw/2fAiaIrqIuesjQ9PW86JnrJzsCfLXrBFczU4aDK9kp
	 mo47FmYFaOlNYxld+UensRVSIoKd8/9/VEYQMy1kBdfNaM+/Y95RvqtAlONIc/y4ol
	 RfRp5XUm2cke6ExMVTgzUWU40rZZEfzQI+G2z5zcYCdeUw1IVyn7YW6FopTICFcuwo
	 h7QctjuLTHen3wsxN0WFXRhgKCyGKbLuByWhSyRb09BsNbCz5pnNHR+xRa1hRRnMub
	 NX9mmqO+0WsdurnOd2hMfVtE4Ro7ZPAXnQ940jijyRZea1CGgQajsnR3SoCR1rj3OC
	 aheDTw6fRrF+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
In-Reply-To: <20260903062108.2712296-9-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-9-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 06:41:40 +0000
Message-Id: <20260903064140.A89161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] W1C race condition during SMBus overflow handling causes dropped p=
ackets due to unintended clearing of buffer receive flags.
--

commit e4cc436823b4732e048945defcd4e5c9e5598e8d
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: p3h2x4x: Add SMBus slave mode support

Add SMBus slave mode support for the P3H2x4x hub SMBus target ports.
The hub SMBus slave agent can receive downstream payloads into target
buffers and report receive events through IBI.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> index a3324cc365956..7fdfa79dfeb6c 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
[ ... ]
> @@ -15,6 +17,178 @@ enum p3h2x4x_smbus_desc_idx {
[ ... ]
> +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> +			 const struct i3c_ibi_payload *payload)
> +{
[ ... ]
> +		/* process data receive buffer */
> +		switch (FIELD_GET(BUF_RECEIVED_FLAG_MASK, target_port_status)) {
> +		case P3H2X4X_TARGET_BUF_0_RECEIVE_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
> +			break;
> +		case P3H2X4X_TARGET_BUF_1_RECEIVE_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
> +			break;
> +		case P3H2X4X_TARGET_BUF_0_1_RECEIVE_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
> +			break;
> +		case P3H2X4X_TARGET_BUF_OVRFL_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
> +			regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     P3H2X4X_TARGET_BUF_OVRFL);

[Severity: High]
Since P3H2X4X_TARGET_BUF_OVRFL is defined in drivers/i3c/hub/p3h2840_i3c_hu=
b.h
as GENMASK(3, 1), does this W1C (write-one-to-clear) operation inadvertently
clear bits 1 and 2 in addition to the overflow bit (bit 3)?

If a new SMBus packet arrives immediately after reading the buffers (which
would set BIT(1) again), writing GENMASK(3, 1) to this W1C status register
would clear the overflow bit but also clear the newly set receive flags.
Can this race condition cause the driver to drop incoming packets without
processing them?

> +			dev_err(&i3cdev->dev, "Overflow, reading buffer zero and one\n");
> +			break;
> +		default:
> +			regmap_write(p3h2x4x_i3c_hub->regmap,
> +				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     target_port_status & BUF_RECEIVED_FLAG_MASK);
> +			break;
> +		}
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903062108.2712=
296-1-lakshay.piplani@nxp.com?part=3D8
