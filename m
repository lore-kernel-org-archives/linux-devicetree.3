Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914DA4746AD
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109201; cv=none; b=kBaWbnS1knIoXaaP/ALOkGmMaAYQmT9/ODELRul/l3VNfMJ5u42BHchpYLMk+qf9xBNZz6LzZ4o/Xp82x722K2PLU2lnQWZI7O8f/yxLRU+qWph3z5C/dA9fP+gP9zuS+igaQp4bixXxkRWCRLePRUR5dBSzaCTeYeO3t030WOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109201; c=relaxed/simple;
	bh=JUPgL6R1jVVEeGgYN8KMu/Lfsk6Hb9Gr2t6Zu5etbwY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JN2TexCIYBqoG3eSXRHU/lrBFZ/cJPmP++ODXVVJNLKvWNY9PBfENq0hxQBVjCDHIgJqTeQwUDNNnWa2tvOroBDPmDA2fRUFi41P6B7b0fSE1DRR+El0BGqhOdG8qN8hW/PYqk+Z2J+pyiqQK0V7mDHsB7jq5JAE7udUNrLWqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyyK6Mqa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyyK6Mqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5D11F000E9;
	Fri,  7 Aug 2026 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786109197;
	bh=36ayfx+aWwqBE5P3GRF9Oe04zLW5PXCzQFiO7lfu1qs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyyK6Mqao7XhdLRG/hfFKeio+XopHMbNk0Z9eYW+vYBgd0IZQMD7aOTMHvvrJLmV0
	 YM1kB6VEsAiQdBsygGca4J8+rsiwLIOXveCgl6jn8Ibfbw36jfScx7/7G20nAHS8Bv
	 BaNALfWZqQsCERbH1XXxNEM0bJ1yiFA3ntD5xOL9b6S46eF52xTNR8KRYSXt/BtYdU
	 Z9zQCf+6lKc6TL8wG1r0JSidIYFVhkvQbfjrU2JeEdPQpx7rotYY1U6vFQw44pgTxd
	 Vsrt+qOl2cRH+x7Dx8yEFeLAI0tgmABiErNpG+gDnFlX4afg8WXHTfMvdvX0/3X6ro
	 oBSiIEOdIY6dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 11/22] dt-bindings: media: i2c: max96714: add
 support for MAX96714R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-11-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-11-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:26:35 +0000
Message-Id: <20260807132636.CD5D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked `v4l2_subdev_state_get_format` dereference in `max96714_=
apply_patgen_timing` leading to NULL pointer dereference and kernel oops.
--

--- Patch [11]: [PATCH v15 11/22] dt-bindings: media: i2c: max96714: add su=
pport for MAX96714R ---
commit c4bf3be89835d23de9ff33f00865d0fa24fed633
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96714: add support for MAX96714R

This commit adds device tree binding support for the MAX96714R, a lower
capability variant of the MAX96714. It operates at a fixed 3Gbps rate in
the forward direction.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> index 3ace50e11921b..ec6a91c4a51c0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
[ ... ]
> @@ -31,6 +33,7 @@ properties:
>        - items:
>            - enum:
>                - maxim,max96714
> +              - maxim,max96714r
>            - const: maxim,max96714f
> =20
>    reg:

[Severity: High]
This is a pre-existing issue, but while looking at the corresponding driver
for this device, I noticed a potential NULL pointer dereference that could
be triggered by userspace:

drivers/media/i2c/max96714.c:max96714_enable_streams() {
    ...
	if (!priv->enabled_source_streams)
		max96714_enable_tx_port(priv);

	ret =3D max96714_apply_patgen(priv, state);
    ...
}

If userspace sets a custom routing table via VIDIOC_SUBDEV_S_ROUTING with a
source stream greater than 0 (and no stream 0), sets a test pattern via
VIDIOC_SUBDEV_S_CTRL, and enables streams for that stream,
max96714_apply_patgen() will be called unconditionally.

This in turn invokes max96714_apply_patgen_timing(), which attempts to fetch
the format for the source pad:

drivers/media/i2c/max96714.c:max96714_apply_patgen_timing() {
    ...
	struct v4l2_mbus_framefmt *fmt =3D
		v4l2_subdev_state_get_format(state, MAX96714_PAD_SOURCE);
	const u32 h_active =3D fmt->width;
    ...
}

Because v4l2_subdev_state_get_format() implicitly defaults to stream 0, cou=
ld
the lookup return NULL since stream 0 doesn't exist in the user-configured
state in this scenario, resulting in a kernel oops when dereferencing
fmt->width?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D11
