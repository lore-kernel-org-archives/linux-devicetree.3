Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F7641C6A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917098; cv=none; b=lSKsingomQKZhrfVl535faUxao9aWJwYgKUhTJqIxVQVtZpNTsz2aGCOmoB9eZbpLFw7cU5IePOsbZdO0rNdT0y4+MhiP+SH6dkYOjQyksamfe9fcqb7Pptf0qx3ii00uoATuw3UDKeubJm3uucuSNdzLuYsutLggl9emwpcj+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917098; c=relaxed/simple;
	bh=I0zpAAYSMFno60v8fqWQEQPjdXds9VgEAYUtY2ILeNo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e5A1GTWvLz5xhBDOTM0WZkdLsNc/Jeqx/+7GT2rHQp7vR27laOwvfHNcdjNzb50YYI/4KMhPi+xc2y/WVGUMLKgezncG5b9Cs+TRkDHSDlxFx+9QgXDSAE10Os70I1/YPj9upiLnrMDcqCOUOjfrnBoURdreuJgQW22MdPP13pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lo5Hfxdn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lo5Hfxdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD711F000E9;
	Fri, 24 Jul 2026 18:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784917096;
	bh=ltUOEv0ypbV3SnJM9XqR9Hprs4KUi0x2Ummbk7k0iRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lo5HfxdngScr2d/19XpU7KOWj9xdHt+FXRdHlBhAcTFNVxI+Rh4/KPouIGduUl1V/
	 1uA4k5xlTWWhJnc0B8z0jK1rkcXqEGHhHciLqUhMPoGL5pbiqyAuSJZlyu3MI7dvZr
	 mXCB4BHZ3aknu0Xjzi9sTZ3nbf/KI4DPUbFi6boJ/Pi9jUaRIzDXLq+rBtoERuABnU
	 tqF1tnRKGq2sOTEsbvQTifRK640fi6AV7OeBkCseAmcb5BfQDe+EEBCSG8tiocvRLg
	 0vqfnU1d46AEIanCc5Nh2p761sy1MYKgV1KdyGuISzvtFCXDLVm03QCmxLqjZqTW4d
	 O/LYmyVDewvBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/16] drm/bridge: synopsys: dw-dp: Fix incorrect
 resource lifetimes in bind callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-1-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v6-1-041d99a19c4e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:18:15 +0000
Message-Id: <20260724181816.4BD711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Reusing the `drm_bridge` object across component bind/unbind cycle=
s causes subsequent binds to permanently fail with `-EBUSY`.

Pre-existing issues:
- [High] Missing cancellation of `hpd_work` in the unbind path leads to a U=
se-After-Free.
--

--- Patch [1]: [PATCH v6 01/16] drm/bridge: synopsys: dw-dp: Fix incorrect =
resource lifetimes in bind callback ---
commit 7f5878cc180f32e03ed02693838ae580e5707a02
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Fix incorrect resource lifetimes in bind callb=
ack

This commit moves resource allocations to a new probe helper function to fix
resource lifetimes on driver removal. It updates the rockchip driver to use
the new probe and bind split.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 3445c82e6f50e..368e1f85e6253 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
[ ... ]
> +int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
>  {
[ ... ]
> +	ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_C=
ONNECTOR);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to attach bridge\n");
> +		goto unregister_aux;
> +	}
[ ... ]
> +void dw_dp_unbind(struct dw_dp *dp)
> +{
> +	disable_irq(dp->irq);

[Severity: High]
This is a pre-existing issue, but missing a work cancellation here can lead
to a use-after-free.

While disable_irq() waits for currently executing IRQ handlers to finish,
it does not cancel work items that have already been scheduled. If the IRQ
handler schedules dp->hpd_work right before disable_irq() runs, the work
remains queued.

If the component unbind is followed by a driver removal, devm will free the
struct dw_dp memory. Won't the asynchronously executing dw_dp_hpd_work() th=
en
access freed memory? Could a cancel_work_sync(&dp->hpd_work) be added to
safely flush pending work?

>  	phy_exit(dp->phy);
> +	drm_dp_aux_unregister(&dp->aux);
> +	drm_bridge_remove(&dp->bridge);

[Severity: High]
Because the bridge allocation (embedded in struct dw_dp) was moved to
dw_dp_probe(), the same bridge object is now reused across component
bind/unbind cycles.

When drm_bridge_attach() is called during bind, it successfully links the
bridge and sets bridge->dev. However, drm_bridge_remove() in this unbind
path does not clear this pointer.

Doesn't this mean a subsequent bind attempt will permanently fail with -EBU=
SY
when drm_bridge_attach() sees that bridge->dev is already populated from the
previous bind?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synopsys-d=
w-dp-improvements-v6-0-041d99a19c4e@collabora.com?part=3D1
