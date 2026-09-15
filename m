Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15204CDA2B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499020; cv=none; b=D86AatcbP2wZevmz6zDTHrowzNDT643u3J31Yo/XEWlpi4/ZOd3JvUTlSJwhPyONJxrTtXPI/mMHzGdhIrliV4tJJGYvLNkGKEDsE2YYJHjFbo+/7omElG2or8QLJN1oO7qX7LmejsZHfVQ6QqY//uPh6vCH3BVEMV1ZKnL7AOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499020; c=relaxed/simple;
	bh=q9BLyz9BEt6g+tgQObM8pBlSK33y6Vlnijf/2Q30yaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FlezfMphLIpSUYOc73y9IU4wCTWVRRiyzvpDNRPjVTzm3f08HOre8Au2nhTvDncZFtXYRW643pLT1CxA34F8YdzWzJavvKewQrCRAeNi13CXNamYTTAdzl0mrTBi5s3K8g90McLFtns66YoOnskxcm0djLLKgSpgHbdJ5jNRwN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRKyl7qZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRKyl7qZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607831F000FF;
	Tue, 15 Sep 2026 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789499018;
	bh=/yBT0uXyvbq6/6U7mSSPIWn437Wj9gvhuwkgLpGyM+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RRKyl7qZk06RNwTRElLj3hoLtqqO6h5oPi/JgziEbdETcrHyLYT6gM53ZpXIcotax
	 keostlWVVIoW0PU8sAO7LdhE/UCxtI0eajO928dpx+B8ZYiqfiiXY78IBgsPF9VE1F
	 MjOmcClIXzQD/MlcuWfhuWpgz0z1ArnLLkQdDuETdllHjvxom5bl6dl1L1hXht1lEG
	 aQhnRVVKnUZCFzDt42nPEKvzXuBp6ZfJ7UnRe93n3/QGwNXkYBNxqyDLiEMY6rU1zS
	 a01h0vVtzP1TlWcSG309O55AK2W76GEzu2lctJE257z/xa2+BuyP56jL/uoKSTJoNq
	 M+N2FDBEsPKiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI
 DSI to HDMI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: mohit.dsor@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916-lt9611c-v7-v16-2-c65042fcd245@oss.qualcomm.com>
References: <20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>
 <20260916-lt9611c-v7-v16-2-c65042fcd245@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:03:36 +0000
Message-Id: <20260915190337.607831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/bridge: premature bridge registration causes UAF on probe fail=
ure
- [High] drm/bridge: missing HDMI formats and max_bpc initialization causes=
 display failure
--

commit 845a14001f40c5c49616eeff3efbd5f04313cc72
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

This commit introduces the DRM bridge driver for the Lontium
LT9611C(EX/UXD) MIPI DSI to HDMI converter chips. It supports single or
dual MIPI DSI and I2S signals to HDMI output.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/b=
ridge/lontium-lt9611c.c
> new file mode 100644
> index 0000000000000..54ae535339f74
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
[ ... ]
> @@ -1160,20 +1160,20 @@
[ ... ]
> +	lt9611c->bridge.of_node =3D client->dev.of_node;
> +	lt9611c->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
> +			DRM_BRIDGE_OP_EDID |
> +			DRM_BRIDGE_OP_HPD |
> +			DRM_BRIDGE_OP_HDMI |
> +			DRM_BRIDGE_OP_HDMI_AUDIO;

[Severity: High]
Will setting the DRM_BRIDGE_OP_HDMI flag here cause connector initialization
to fail?

It looks like the bridge.supported_formats and bridge.max_bpc fields are not
initialized before this is set. When drm_bridge_connector_init() calls the
core helper drm_connector_hdmi_init(), it strictly validates these paramete=
rs.
Because they are implicitly zero-initialized, drm_connector_hdmi_init() will
return -EINVAL, which would deterministically fail the connector creation a=
nd
render the display driver non-functional.

Should these HDMI capabilities be explicitly set before enabling the HDMI o=
ps
flag?

> +	lt9611c->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> +
> +	lt9611c->bridge.vendor =3D "Lontium";
> +	lt9611c->bridge.product =3D "LT9611C";
> +
> +	lt9611c->bridge.hdmi_audio_dev =3D dev;
> +	lt9611c->bridge.hdmi_audio_max_i2s_playback_channels =3D 8;
> +	lt9611c->bridge.hdmi_audio_dai_port =3D 2;
> +
> +	drm_bridge_add(&lt9611c->bridge);
> +
> +	/* Attach primary DSI */
> +	dsi =3D lt9611c_attach_dsi(lt9611c, dsi0_node);
> +	if (IS_ERR(dsi)) {
> +		ret =3D PTR_ERR(dsi);
> +		goto err_remove_bridge;
> +	}

[Severity: High]
Can this sequence lead to a use-after-free if the DSI attachment fails?

Because drm_bridge_add() makes the bridge globally visible on the bridge_li=
st,
another KMS driver could concurrently discover and attach to it during this
window. If the subsequent lt9611c_attach_dsi() call fails (for example,
returning -EPROBE_DEFER), the driver calls drm_bridge_remove() and returns =
an
error, which triggers devres to free the memory backing the bridge.

Could the concurrent KMS driver be left holding a dangling pointer to
devres-freed memory? Should drm_bridge_add() be deferred until all resources
are successfully acquired?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-lt9611c-v7=
-v16-0-c65042fcd245@oss.qualcomm.com?part=3D2
