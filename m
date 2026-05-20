Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4003DE447
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281132; cv=none; b=Fw6clhfxnl1FzWqgsObtCVw3qQ0lnmVHsTLHxMIKvG1X5GSGuGJLJypL2s4nDFk8uqs83LpfbQuzIBSpM8P4l46Wl61uE7FU0FYZbG6vExv93K5RmvdiDGSnVUG6gV0CmLC6/Nwy5ImAUZ0quG6DmPv7d7SmgBuhMh041inDMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281132; c=relaxed/simple;
	bh=eWXaWqG50NVVPpGc43GiRMOVY9TYyBSoyfOyWZql9NQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sMSPEMDgRJ+coXmER23nHmzrhgw9jVrcGg4Yc+dWtZ35s6f4iGriduZs/UBKWf0YG3U8gKXhTyeF7pLQqr9H5m3ftIYbBfJYOhHw6wQSV/BdDvRv1I4FQzZhdgv/ECN8O0SeCkOg/Yg8I8SOClTkRFVGshn3aCst4Ezkoflb5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqyBpWKI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqyBpWKI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1578E1F00893;
	Wed, 20 May 2026 12:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779281131;
	bh=lC47SQx6SjuDPpTkdvT0LD2anEoFECU+5DzdqbQ2fMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XqyBpWKIx4ePYUcIHWbRrXBCJklqG/08zKDoZXDUCDtJRCJiqXLTv9kU1Q98/hwAl
	 388TW/Nr9Y2GbzPI3h1qTgwrSvzGIp5x61Yq62BNrukUCh0IGj3LOHKqMqPm9KnF8c
	 nfrCX/tzCh8zU2ECWpTWPrfFvHmhTEtDNCUKWFgioEcRxXtkznjjcdII7WLvdmWJWG
	 dBbuJmXF1P7rke9vXYUZj3qXgKl6MZQou9GggPSWJDYLowQpdHEkvkrLQ0OvMGaHoK
	 tJWg+iTzdBmCBssa+ZN3jS/hhDMAeter7T99k7U3ctoeX25+MVROD5pkyAsblNea7U
	 oUWusvscVFMjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 08/17] media: ti: j721e-csi2rx: get number of
 contexts from device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260520120022.539913-9-r-donadkar@ti.com>
References: <20260520120022.539913-9-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:45:30 +0000
Message-Id: <20260520124531.1578E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The V4L2 async notifier is unregistered after video contexts are d=
estroyed, creating a race condition where the notifier can trigger and acce=
ss freed contexts.
- [High] The driver uses `devm_kzalloc` for its main structure but exposes =
video devices to userspace, leading to a Use-After-Free if the device is un=
bound while file handles remain open.
--

commit 9a0321175e1c07f7aebfefcee8f80ac7be62df13
Author: Pratyush Yadav <p.yadav@ti.com>
Subject: media: ti: j721e-csi2rx: get number of contexts from device tree

This commit updates the driver to determine the number of DMA contexts
dynamically from the device tree's DMA channels, rather than hardcoding it
to 1. It adds validation against the maximum supported contexts and iterates
up to this dynamic count.

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index e01d95eab19c3..26a8eaa98b3da 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
[ ... ]
> @@ -1345,8 +1347,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx =
*ctx)
> =20
>  static int ti_csi2rx_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np =3D pdev->dev.of_node;
>  	struct ti_csi2rx_dev *csi;
> -	int ret, i;
> +	int ret =3D 0, i, count;
> =20
>  	csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);

[Severity: High]
This is a pre-existing issue, but does using devm_kzalloc() for the main
structure cause a use-after-free if userspace holds a file descriptor open
during unbind?

The ti_csi2rx_dev structure embeds the video devices which are exposed to
userspace with video_device_release_empty. If userspace keeps a file
descriptor open when the device is unbound, devm will free the structure.

Later access or closure of the file descriptor by userspace could access the
freed video device and destroyed mutex.

[ ... ]
> @@ -1410,7 +1430,7 @@ static void ti_csi2rx_remove(struct platform_device=
 *pdev)
>  	struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
>  	unsigned int i;
> =20
> -	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++)
> +	for (i =3D 0; i < csi->num_ctx; i++)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> =20
>  	ti_csi2rx_cleanup_notifier(csi);

[Severity: High]
This is a pre-existing issue, but could unregistering the async notifier
after cleaning up the contexts create a race condition?

The contexts are cleaned up via ti_csi2rx_cleanup_ctx() which destroys
the mutex, unregisters the video device, and releases the DMA channel.

If a sensor driver probes concurrently, the V4L2 async matching could
trigger csi_async_notifier_complete() before the notifier is unregistered.
This could cause csi_async_notifier_complete() to register a video device
using a destroyed mutex and released DMA channels, leading to panics if
userspace accesses it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D8
