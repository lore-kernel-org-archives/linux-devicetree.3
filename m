Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818315;
	b=h7NBB0/abl5fg62RbtQfQ6ob07eww1wLJQ4C61vELLl9/A21wlLv1ne8GqgujrUDIU3Z
	 QepWD8mXZaFyl2kFJH+ELJg4Sa6ySpj+06H8HNo91lwfU30ac3unimK35QsKbxLBcudhs
	 btLNsH5x74VpE1X955cZwjMO7asYBd9zO+ml3OHVCbK0aKhDxZiEySNSQMhKikIDsGlcu
	 7zlNpAZp7k9nfTkLdMzq+Im7FXp6kZ5PN9uXF8WiBBOYq351kuwH5vgTrvoNywpDQ4Y1i
	 /GoO2SGB0zBScD7HCXontyOwHk+bLsuNRE33vWg46EnaDMQDoaiE1pQiPESSzYDP8UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818315;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FPPm4Ifo7WxrNg+H9UhHD74zvq+SEmbeIyWBnjDCO4A=;
	b=1X7mJBJ5SJu5g1dRcfqf5Z/N2oIQz5H7EmKuHrLtTP9itg9Y24qhQcT265TfNi33yxqK
	 WcRTH6L5X0A2h5BWZrqPSwtNxRoxIYmq/FigKiuj7U+uChRzBVpFW6RyeKvRfxpQGPtK9
	 ZCgpUqyohoKB87j+jnLCe6RAP7UwRxqXSjIGfm8deIV+ObnFbfF7YKodDZALB83BCYFSe
	 Tl7fUCZ6jt96qOWUdxuA+WyzUOYfprZDLRBGitdYaVro1htQLvA+n6XOzSLt44ZQqvvVq
	 VTprwr83syfc2jgZjXTwHP+VraNo5kXMhv8NRrhJz2lAqp4cUWsTeEcS1WzDvj/l7GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=vxJUKcRu;
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF25606D805
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF25606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=vxJUKcRu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793818308; x=1794077508;
	bh=FPPm4Ifo7WxrNg+H9UhHD74zvq+SEmbeIyWBnjDCO4A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vxJUKcRuU1J3D9RxT0BjZUPto1pvptqtA1sdv7uTPU5Wd5CabFWDfvXI4OhKgYq1b
	 RmVcmxn6lGV0KLIRbmf0XAMW9tsaJOJb1JcYZ3OawY1xtGMmQ4D1it1d0DyD4XwrZs
	 49Ii/TQ1mULHm9DPR4SJjhxDYPylYoD6cZbwbtgNaM3EOHWW1hvXwL9Y3Bbxen6AiC
	 qNZ+uGwCJzpT6M6sXxSlJZYuTLnSYT2Kma95yD57dtoS02X7DCYbjtNM6n3RuR3GEd
	 sLq0NxA1mvS5iAVouV0Q+anJZF5XV7R5XUU5a50YPpPRfVJ5h5horz6/hQWDSX1bhx
	 SeWJTVGccxEVg==
Date: Wed, 04 Nov 2026 18:51:41 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chunkuang.hu@kernel.org
From: Roman Vivchar <rva333@protonmail.com>
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v9 02/13] drm/mediatek: Implement Display Stream Compression support
Message-ID: <8fcdd2fa-7c9c-4af5-a7b4-45fb881d88a8@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 8d12c3e225616d3655c04ed7e4412cce821e564c
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

I have tested this series with my out-of-tree mt6595 (command mode=20
panel) and mt6768 (video mode) DRM. There's no regressions, but I=20
spotted an issue with kconfig.

On 9/16/26 14:08, AngeloGioacchino Del Regno wrote:
> Add a real driver for the Display Stream Compression (DSC) Display
> Controller IP, implementing support for DSC v1.1 to v1.2.
>=20
> In order to do this, it was necessary to remove the basic DSC IP
> bypass setup from mtk_ddp_comp: this functionality is retained in
> the new mtk_disp_dsc driver, which checks if DSC was actually
> requested by other components (with the only one that currently
> supports this being DSI) and, if not, it will set BYPASS mode in
> the DSC IP.
>=20
> Like before, the BYPASS mode is set before starting the DSC IP,
> but unlike before, this is being done in the component start
> callback instead of the config one.
> Notably, the config callback is called by mtk_crtc always
> immediately before the calling start callback, so the order of
> register writes is retained.
> The only real difference is that now this is being done through
> CPU writes instead of CMDQ, but since that's called only once
> and since it's just three registers, the performance impact will
> not be minimal and not even measurable.
>=20
> As anticipated, DSC handling was also introduced in the mtk_dsi
> driver: when performing dsi_host_attach, the driver now checks
> if the DSI panel adds the DSC configuration structure to the
> mipi_dsi_device structure and, if it does, it will store a
> pointer in the driver-local mtk_dsi structure's `dsc` member.
>=20
> The DSI driver will then check whether the DSC configuration
> that comes from the panel is valid (in regard to MediaTek DSI)
> and will call the DRM API's DSC helpers to calculate and set
> all of the const and RC parameters for the actual DSC setup.
>=20
> For the time being, even though the latest MediaTek SoCs do
> support DSC v1.2, only DSC v1.1 pre-scr support is implemented
> as an initial contribution (which is rather big, and 1.2 would
> make it even bigger - but that can anyway be implemented later).
>=20
> As a last step for validation of DSC parameters in DSI, a check
> for the hdisplay against DSC slice sidth and one for vdisplay
> against DSC slice height was added to the mode_valid callback,
> making sure that H/V are, as expected, multiples of slice W/H.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

...

> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -18,6 +18,8 @@
>   #include <video/mipi_display.h>
>   #include <video/videomode.h>
>  =20
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>

...

>   static void mtk_dsi_config_vdo_timing_per_frame_lp(struct mtk_dsi *dsi)
> @@ -565,26 +610,68 @@ static void mtk_dsi_config_vdo_timing_per_line_lp(s=
truct mtk_dsi *dsi)
>   =09writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
>   }
>  =20
> -static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> +static int mtk_dsi_set_dsc_params(struct mtk_dsi *dsi)
> +{
> +=09struct drm_dsc_config *dsc =3D dsi->dsc;
> +=09struct device *dev =3D dsi->host.dev;
> +=09int ret;
> +
> +=09if (dsc->bits_per_pixel & GENMASK(3, 0)) {
> +=09=09dev_err(dev, "Fractional bits_per_pixel not supported\n");
> +=09=09return -EINVAL;
> +=09}
> +
> +=09if (dsc->bits_per_component !=3D 8) {
> +=09=09dev_err(dev, "%u bits per component is not supported\n",
> +=09=09=09dsc->bits_per_component);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09dsc->simple_422 =3D false;
> +=09dsc->convert_rgb =3D true;
> +=09dsc->vbr_enable =3D false;
> +
> +=09drm_dsc_set_const_params(dsc);
> +=09drm_dsc_set_rc_buf_thresh(dsc);
> +
> +=09ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);

If config doesn't have DRM_DISPLAY_DSC_HELPER (selected by few panels),=20
linking will fail with "error: undefined symbol: drm_dsc_set_const_params".
Should MediaTek DRM select it?

Best regards,
Roman
