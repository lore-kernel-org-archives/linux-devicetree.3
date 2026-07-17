Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F2388E6B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283180; cv=none; b=GZbJybsN6H1iytIQmLEQq033/RylmQDIXK9ukWzrlEo6USmTMc+qc8k5EbnQm2jvwvZ71Kls8WXemDDoZXwEa7Ik3sjeQsBrAJhSqzZr6P59At1QMyOLBs0oCGEE2zZqHEVpKnIM03Fy6f7rJ6YCm8inqoJoM9WgCPXeLpEBI5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283180; c=relaxed/simple;
	bh=9Tfzk9RVQRiye+btluULCi0AinZitB5f2QZqSJisc78=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UElCc1asxhvI9wmhumPZ4p0HLW8hDKU/EgN4M+ZDAl+zeM37ygWVcLO/GNHHa+I6rkg97Bd3zt8fM9AdJPpWxsUjZmG5Cu2rfpMNGDfxWxAnkKfFAWl2zTg3k1KpAJGvWjL+1v+eL9liAvczTPOIDgtxYE+VMoC4X88TlHIEryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aro5V0CW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aro5V0CW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BDA1F000E9;
	Fri, 17 Jul 2026 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784283179;
	bh=EefTUGytdUMHvDIfKyQaiaphnf0O/ng8Fjsyz8EvzYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aro5V0CWumwaFSI2bbkDPmeNq+ZL45It3TEX43goJ9WA3NURnLT4FqWWroV4a2pf8
	 KSSuId1Sm+NmMxJwgIjDAwnct4KlbnPb1uzcs4aZoWC3brkRAbkB8jNCLhZy+tk6ov
	 GhCmntTwuJUKV/m9QcmkIXIJfp6GTL2f2BR+kyXJzHs0HS0UhntxKlu7aAbufTmltF
	 xkqd7wqAoUvrzpx2PZ5LvQrjf/sAt0GsIiOiGh3zXXqnPg7bJcNYc0pkDnKnMwpXE+
	 JaI8+efF2zpABp0Ohdo54j4Eyhsx8H6HFqrhz/yb07kDqiNNNYcjvT4uB0WM+R7qCW
	 pdsFugiobxmwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C
 PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amber Kao" <amber.kao@ite.com.tw>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-ucsi-itepd-v4-2-f3ba5addd0df@ite.com.tw>
References: <20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw>
 <20260717-ucsi-itepd-v4-2-f3ba5addd0df@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 10:12:58 +0000
Message-Id: <20260717101258.D4BDA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-After-Free vulnerability in teardown sequence due to incorrect=
 free_irq() placement.
- [High] Unhandled hardware events or I2C errors in the interrupt handler s=
kip acknowledging the interrupt, causing an interrupt storm.
--

--- Patch [2]: [PATCH v4 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-=
C PD controller driver ---
commit 17d94bce1f3a61576b21089ce840ef1e6562fa4c
Author: Amber Kao <amber.kao@ite.com.tw>

usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD controller driver

This commit adds a UCSI driver for the ITE IT8851 and IT8853 I2C-based
USB Type-C Power Delivery controllers. It implements the I2C interface to
read and write UCSI commands and handles shared interrupt lines to forward
events to the UCSI core.

> diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi=
/ucsi_itepd.c
> new file mode 100644
> index 0000000000000..ceaadb0b3fef6
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_itepd.c

[ ... ]

> +static int itepd_process_event(struct itepd *itepd, u32 *cci)
> +{
> +	u8 msg_in[ITEPD_MSG_IN_MAX_LEN] =3D {};
> +	__le32 le_cci;
> +	u8 event, ack;
> +	u8 len =3D 0;
> +	int ret;
> +
> +	mutex_lock(&itepd->event_lock);
> +
> +	ret =3D itepd_read_reg(itepd, ITEPD_VENDOR_INT, &event, sizeof(event));
> +	if (ret)
> +		goto out_unlock;
> +
> +	event &=3D ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT;
> +	if (!event) {
> +		mutex_lock(&itepd->received_lock);
> +		*cci =3D itepd->cci;
> +		mutex_unlock(&itepd->received_lock);
> +		ret =3D ITEPD_EVENT_NONE;
> +		goto out_unlock;
> +	}

[Severity: High]
If an unrecognized event occurs (neither VDM nor UCSI) and this path takes
the goto out_unlock, it skips writing to ITEPD_VENDOR_WC_INT to clear the
interrupt. Will this leave the interrupt line asserted and cause an
interrupt storm once the IRQ is unmasked?

> +
> +	if (event & ITEPD_ALERT_UCSI_EVENT) {
> +		ret =3D itepd_read_reg(itepd, ITEPD_UCSI_CCI_REG, &le_cci,
> +				     sizeof(le_cci));
> +		if (ret)
> +			goto out_unlock;

[Severity: High]
Similarly, if this I2C read fails (for example, if the kzalloc inside
itepd_read_reg fails), this goto out_unlock also skips acknowledging the
interrupt. Can this lead to an interrupt storm?

[ ... ]

> +static void itepd_remove(struct i2c_client *client)
> +{
> +	struct itepd *itepd =3D i2c_get_clientdata(client);
> +
> +	ucsi_unregister(itepd->ucsi);
> +	free_irq(client->irq, itepd);

[Severity: High]
Could this sequence result in a use-after-free? ucsi_unregister() disables
notifications and frees ucsi->connector. If an interrupt fires or is
already pending before free_irq() is called, the threaded interrupt handler
itepd_irq_thread_fn() can run, process the event, and call
ucsi_notify_common().

In ucsi_notify_common(), this could lead to dereferencing the freed
ucsi->connector array via ucsi_connector_change(). Should the IRQ be
freed or disabled prior to unregistering UCSI?

> +	ucsi_destroy(itepd->ucsi);
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-ucsi-itepd=
-v4-0-f3ba5addd0df@ite.com.tw?part=3D2
