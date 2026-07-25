Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83621883E
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988027; cv=none; b=M13T7DbEwv9z81VnS3fy6a2K2UAWOSTSSeLY2cofx1YKelR8GzxJ5sv/YfVywgeTAg9W7c/94pOyTMfEHwyZzpTOhwxWMXajg5P0JHD0J7h5Ct43ubeOxUP661vO+3c/UR5VfQZaOouIB2paa7H412+Ks8C2dCIfkhDaHlMd560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988027; c=relaxed/simple;
	bh=ne1e+vMvJCOh/p92tuk9qmsHPMt6OmOMrc92qcSAfbs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=de+mzioEWNi4Hpbnx12u/LJ+liMLlQ9v7zdimFllYAuRULDISxxdYWzlkCeVDfRYADPBXSVE52ZajbqvXzJtKf42aZg2sy51PMT9IbKYzHpAA/R2dIYAAABcCSBcWOB8NGr8u0oexQR5iDeMQCc9hU/XJjkTrrY0w5nqCt0U1eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agGjMo7G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agGjMo7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798431F000E9;
	Sat, 25 Jul 2026 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988025;
	bh=uP16DNA9nrsdRrTku7zteIga3Bk2T8baXAZYgBXBvXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agGjMo7G+koJSWpbE4af7RXSWID6kw6w6806nNH9sTdRKkSKgPUHujyjxERu3z0HZ
	 jHZIKtrVBRisC3syDnr45PmoN+tOSGiNU/vNKvric3b5zgm8jLTOL5qir9swMyxhla
	 vg1nr2D+rkPFNjbpVTGu7JRu7gFKPqrGn7UiPrrbgH/cHIx12R0pzJITm6AjCDiBxQ
	 vFBPny062Nv9NT6dg9i4zsEymQsVf1FX8+DR7/dnzUfME9lX6CU5LhBowRZcg3ScbT
	 0JqF39SqXcsra2QejxaxGThuuKWAnJATisvVOebxSMXJQbfb4/axGfUYg3+118RGO2
	 Pr/xTu4qQgOXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] spmi: apple: Validate FIFO state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260725-t603x-spmi-v1-2-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-2-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 14:00:25 +0000
Message-Id: <20260725140025.798431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver detects unexpected extra data in the RX FIFO but fails =
to drain it, leaving the hardware permanently desynchronized for subsequent=
 SPMI commands.
- [High] The driver lacks synchronization locks, allowing concurrent SPMI b=
us transactions to interleave and corrupt the command and FIFO state.
--

--- Patch [2]: [PATCH 2/7] spmi: apple: Validate FIFO state ---
commit c5c6cb6b2f161dd887167b0a07acf4d194f4cc70
Author: Alba Mendez <me@alba.sh>

spmi: apple: Validate FIFO state

This patch adds checks to ensure there is data before reading the body of a
reply, and checks for the end of data afterwards.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 376cf682c43e0..b4f442d0b4ad7 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -78,6 +78,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,

[Severity: High]
This isn't a bug introduced by this patch, but I noticed spmi_read_cmd()
performs a multi-step bus transaction without acquiring any locks to prevent
concurrent interleaving.

Since the SPMI subsystem core does not serialize callbacks across different
slave devices, if two threads concurrently initiate SPMI transactions, could
their command writes and FIFO reads interleave? This might lead to data
corruption or misdirected responses on a busy bus.

>  	/* Read SPMI data reply */
>  	while (len_read < len) {
> +		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
> +			return -EIO;
> +		}
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);

[ ... ]

>  		}
>  	}
> =20
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");

[Severity: High]
This is a pre-existing issue, but since we are now checking for extra data
at the end of spmi_read_cmd(), shouldn't we also drain the FIFO here?

If a device misbehaves and leaves extra data in the RX FIFO, the next SPMI
read or write will immediately see this stale data. It could consume it as
its own response, leaving its actual response in the FIFO, creating a
permanent cascading desynchronization on the bus.

>  	return 0;
>  }
> =20
> @@ -115,6 +122,9 @@ static int spmi_write_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,

[Severity: High]
This is a pre-existing issue, but similar to the read command above,
spmi_write_cmd() also appears to lack synchronization locks.

Would it be safer to wrap the entire transaction in a mutex to prevent
concurrent bus transactions from corrupting the command and FIFO state?

>  	/* Discard */
>  	readl(spmi->regs + SPMI_RSP_REG);
> =20
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");

[Severity: High]
This isn't a bug introduced by this patch, but does this code need to loop
and read from the FIFO until it is actually empty? Otherwise, the hardware
may remain permanently desynchronized for subsequent commands.

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-t603x-spmi=
-v1-0-e1a29fcd2d38@chaosmail.tech?part=3D2
