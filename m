Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0D3BE643
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059814; cv=none; b=qVrP12+sTAdEAJLeNfEx6Qeu48f9isLECe6NZ/7bILHv4QDxFIBk2LDTqNyTE7EW7bBPdB8J4/V9erkcZLj2ttBW4U1QZ5wVOhvn+2BYE6ntnZK5fPNY28GFS+FCVz395X+iVfcaG4+fWH+FDJHT2b7lihWyNGO/xWQtoIJUh7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059814; c=relaxed/simple;
	bh=aFCvJNBEFfEqh6W1SuKCaWyyVtZKDQQ+6aMW8krKy0w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TBSnnWzivDOni+rAbC8CYG+JsFdw5fm1ebLYSaK6r5jNtMOnEBnHzL22BCV1ibFZBFQM4BA0cHCo/xuEuauI15turAY8elx7Aovgt4NvJ9qS4Clx5lfdjzX+6iwaZ6UD4h6dOd8wyDquh3lc5fk241wJZBtbo2Gv12GYNW8veL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUl4tImb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUl4tImb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134881F000E9;
	Tue, 14 Jul 2026 20:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059812;
	bh=zrJKkcP3X4Aez9RcBpHL8hL0/bSOM339BosYqe6jOKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUl4tImbX0fohsle+g48eF0o3joAe7wZKbGPZY9cI46V1kPt7XnqtLkVnGteg4IbZ
	 IDlV6SfTR0z0YnII2wyhdycYy6v0j94yyJPLCb1hmbNrvIjdeCgFZRQciemlRaNH6t
	 344LwWXb5j5s62TK0JweNLDZk+Tvq9xzbrAYOyYu5u+8WKQGtA4gpc/bNrFtveY+U6
	 jSPkS3mrhM4onddS1r/xqtRvx7uJhk1YBl43a32neHxDyXPcwYtU9iIWLP/DUBSqtr
	 H2Ir62YVIIq73SVJQyqAHvU7eMtU1qC2ehsfoaSwp58Nrfl9VDmC/GToo/3yLK5BNc
	 WlAoDfoxZfelA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 28/35] phy: core: add notifier infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-28-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-28-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:10:11 +0000
Message-Id: <20260714201012.134881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing rollback mechanism in PHY reset notifier chain
--

--- Patch [28]: [PATCH v13 28/35] phy: core: add notifier infrastructure ---
commit ec60b7ba41c261654c48fb56546b6b42f913f6e5
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: core: add notifier infrastructure

This commit introduces a new PHY notifier API to allow consumer drivers to
hook into reset events from a PHY device. This helps multi-port PHY devices
handle configuration or cable orientation changes without causing undefined
behavior in consumers.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..51d261daae7a9 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c

[ ... ]

> +int phy_notify_reset(struct phy *phy, enum phy_notification event)
> +{
> +	int ret;
> +
> +	if (!phy)
> +		return 0;
> +
> +	ret =3D blocking_notifier_call_chain(&phy->notifier, event, phy);
> +	return notifier_to_errno(ret);
> +}

[Severity: Medium]
Since blocking_notifier_call_chain() aborts on the first error, does this
leave earlier consumers permanently suspended?

If phy_notify_reset() is called with PHY_NOTIFY_PRE_RESET on a multi-consum=
er
PHY, and the notifier chain stops halfway through due to an error, the prov=
ider
receives a negative error code. The earlier consumers in the chain will have
already handled PHY_NOTIFY_PRE_RESET and quiesced their hardware.

Would it be safer to introduce a rollback mechanism to notify the successfu=
lly
suspended consumers that the reset has been aborted, so they don't remain
stuck indefinitely?

> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index ea47975e288ae..3779a4d0a02c3 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h

[ ... ]

> +/**
> + * enum phy_notification - PHY notification events
> + * @PHY_NOTIFY_PRE_RESET: PHY is about to be reset, consumers should qui=
esce
> + * @PHY_NOTIFY_POST_RESET: PHY reset is complete, consumers may resume
> + */
> +enum phy_notification {
> +	PHY_NOTIFY_PRE_RESET,
> +	PHY_NOTIFY_POST_RESET,
> +};

[Severity: Medium]
Is there a missing abort event here to support the rollback path mentioned
above?

If a pre-reset notification fails, broadcasting PHY_NOTIFY_POST_RESET might
break consumers that were never notified of the pre-reset in the first plac=
e.
Adding a dedicated abort event might give consumers a safe way to recover w=
hen
a provider has to cancel a planned reset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D28
