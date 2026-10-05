Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21E4908CD
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208963; cv=none; b=AjHlG02NA4ErwvP2/vpemV8Rp3QY+KU+NFwogsPAKApmYs2bgZWtUFIf6/VW+BzUibwo6r/Pj4xTf3+0xDhfanDbIdzHQrDm1Zt3EO+Af4qNDDLps7ho79mT6frQIwykeo3SxQQzsYr0W+QG16k2711kWd04YeDeRzs+EdOdrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208963; c=relaxed/simple;
	bh=ryk3zoix9eZQlhJtkvEAH8KIqg/RgzkBKEjS4nsfUC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TzNY1vB0KstzwkRbs4ksxto3D7kBT+GOosDk05lrwzrav+Fn5PGeTqnqxl+eVJiAyMePHc89no58ISME2xCvMGErXNd4/Ly0KW8UXxaHbQiX2hYZZNnD1Nlm5nHUchNydjVyP/9VVKSZNFBnHuoKltox/Un55AdF6MTUU0L4Oqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBC2B7kN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBC2B7kN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644461F000FF;
	Mon,  5 Oct 2026 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791208960;
	bh=IOJ/CxqebTmLTW6gACH4+Zng/yc+b/aunsZBTq4rAjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cBC2B7kNvDbTHJhMx9Y6xBJZ20UPt3mY1qIHusYEdmzQt8Qe69vH8D9C0fRvQL4nL
	 HOPIsxJELag0cmRC5tEZLTdsGalSTU62IJoBJmZHeLpnCuxWyjSHLEp83UeCKEdv+M
	 re/P4jmUZnlcH1NZa11rG+N/JkSXoiJrao9k5eGjP8R0XQGW8L7ijDfn4sMnxA0zkW
	 KuJMBljovoK/ZJEP7he3sY1tjxAmDFlnJfsyY5CPVEPcsp5qOpAGo+KeTzIgpSctL+
	 6U5397noXp+4p/wvMujdDAt3/VbvsLwRk3+gJYZu4577n1fHvaE/TdDq9/CoF0+PCf
	 PVc2OP83Rmoiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/10] media: v4l2-subdev: notify the bridge when the
 source power changes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-hdmirx-media-v3-9-71a11a2e3e76@pengutronix.de>
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
 <20261005-hdmirx-media-v3-9-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:02:40 +0000
Message-Id: <20261005140240.644461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: missing V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT producers bre=
aks hotplug
--

commit 6a92b4c6dc1e86451bb217218d03ed0f4be33caf
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: v4l2-subdev: notify the bridge when the source power changes

This commit adds a new V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT notification
macro. It allows subdevices to notify the bridge when the source power
changes on the connector's +5V line, so devices can act on hardware
changes instead of only handing the value to userspace.

> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
[ ... ]
> @@ -29,6 +29,14 @@
> =20
>  #define	V4L2_DEVICE_NOTIFY_EVENT		_IOW('v', 2, struct v4l2_event)
> =20
> +/*
> + * The source power state a receiver publishes as
> + * V4L2_CID_DV_RX_POWER_PRESENT has changed. The argument points at an
> + * unsigned int holding the same per-input mask as that control, so zero
> + * means no input sees a source.
> + */
> +#define	V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT	_IOW('v', 3, unsigned int)

[Severity: Medium]
Is this notification actually emitted by any subdevices in this series?

While this macro is added to allow subdevices to notify the bridge of power
changes (and is consumed by hdmirx_notify in patch 10 to detect hotplug
events on boards lacking a dedicated 5V GPIO), it doesn't appear to be
used by any upstream subdevice drivers like adv7604 or tc358743 in this
patch series.

When a user plugs or unplugs the HDMI cable at runtime, the upstream
subdevice updates the V4L2_CID_DV_RX_POWER_PRESENT control but fails to
emit this V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT event. Without the producer
side implemented, the receiver (e.g. snps_hdmirx) never receives the
notification and fails to rescan the link state.

Does this leave runtime hotplug functionality incomplete or broken on
boards that rely on this notification rather than a dedicated 5V GPIO?

> +
>  struct v4l2_device;
>  struct v4l2_ctrl_handler;
>  struct v4l2_event;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-hdmirx-med=
ia-v3-0-71a11a2e3e76@pengutronix.de?part=3D9
