Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6910A13A86C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548944; cv=none; b=shzQi6v6QcEswbxhTIAXTf9HFz8ov/WtxId7r+0YODj3wKeLiQOSiLtrk4QSkpMhQvXPn4J/ylGeq71fxHrZx6h4mTfIi/G9m3bAtM+Xywe0JC+GQ9yX4jQu2MKbURAjEQensTrb/JA6Dc8A8wYQ1tFnox97GyAWVebCH4AVRMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548944; c=relaxed/simple;
	bh=eVWSX3qoUnLNprt23AnHi6t/3utg25jC6tbMCv0v57s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MSZnhFjzAtbfMCu922ldo15cRxerEvEHTTE119Ta9Y9WCcpSrV9w3XDHKvySSyC8nOb1jd/VYlCF/KK4Y7HeG+aqtsaWN1VSUdZB358He90+dfhffJg9/qt4N/LyQ3Z+13sxHl6IYCLcSis/ZxnOkSn6Y1uMolZpT8vuLtDrvwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJ5N/A7d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJ5N/A7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39551F000E9;
	Wed,  8 Jul 2026 22:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783548943;
	bh=7DTJJU6TlX9Bg2RWnPOawNG7pfIEmDlVMYVPRfNZoVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lJ5N/A7d1GPYbKaAlGkZ+p5EzTNQN1W/0ZsotGYkRcNqJznxV9b868O51u5N/zsYM
	 Yr2oe4qhmUIcQ0L4y4LtxVDcx3Ri6/4qpn2W7xGISzJHoqx9rbjdQT22pYsxfVa708
	 tOdEB5x2Ja6J6QF5RAufbMDpb5FPsIONKGg/xxXr/GbQkVA8yN5en4KjO5tNrDs7eP
	 Og6oZ0KFkcOTXIB28HsYiJQng2V+L8BZAZsVlvk4RC4QTXL8IdWPdNQHOsXPyQl++4
	 IECXZ4lUMl1P/A5YTttJd581x2api0T2xTE8c6ApMpGcjE674C5j9JPMKxnlz5lobF
	 O8J3c6JkbrIIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/14] drm/rockchip: dw_hdmi_qp: Enable YUV420 output
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-13-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
 <20260709-dw-hdmi-qp-yuv-v3-13-a4a982a9f2e7@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:15:41 +0000
Message-Id: <20260708221542.C39551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Modifying hardware or global driver state within atomic_check call=
back.
--

--- Patch [13]: [PATCH v3 13/14] drm/rockchip: dw_hdmi_qp: Enable YUV420 ou=
tput format ---
commit 886f3880152ce2fc09e568484e921ca99dad89d4
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Enable YUV420 output format

Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
color format, and the required bus-format handling and VOP2 support are
already in place.  Advertise it via the platform supported formats so
the HDMI core can select it.

YUV420 halves the TMDS bandwidth compared to RGB/YUV444, which enables
high-resolution modes such as 4K@60Hz on links that cannot otherwise
carry the full-bandwidth signal.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 78473f9a0fce3..1af29066a0a31 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed something concerni=
ng
in dw_hdmi_qp_rockchip_encoder_atomic_check() in this same file:

drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rockchip_encoder_=
atomic_check() {
    ...
	ret =3D phy_configure(hdmi->phy, &phy_cfg);
	if (!ret) {
		hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
		s->output_type =3D DRM_MODE_CONNECTOR_HDMIA;
		s->output_bpc =3D conn_state->hdmi.output_bpc;
		s->bus_format =3D ingest_fmt;
	} else {
    ...
}

Does this code accidentally configure the hardware PHY and modify global
driver state (hdmi->tmds_char_rate) during the atomic_check phase?

When userspace performs an atomic modeset with the DRM_MODE_ATOMIC_TEST_ONLY
flag, dw_hdmi_qp_rockchip_encoder_atomic_check() is invoked to validate the
state. Modifying hardware or global state here breaks the guarantee that
atomic test-only commits are free of side effects. This could cause the
hardware state to desynchronize from the DRM core's expectations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-dw-hdmi-qp=
-yuv-v3-0-a4a982a9f2e7@collabora.com?part=3D13
