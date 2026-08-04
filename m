Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BC1421A15
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827801; cv=none; b=FQR7rLkP10wRCTdttgC0HkdiWo+DJKRZi1leIirbDiCVYwz+YuoqgdTZSU6tTjS9f9yOJg75fR3GnuX7JX8vcdcvlt5Q/X6h45vwAo4xsf/nRcTTlr8GkNgQJOCpXHEl0b12Hn2gV2yYktD6KpDm0qvd0CAoN0gGA/h2FfrE5m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827801; c=relaxed/simple;
	bh=rN0UDyHOHWBeImA/KPOGc4bs9PtJpYj6dHt/USZR2/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cRv/85pYTwm6PBmXBShwRAZQ5iN4FO4OICw4Q3LzKdaTVXdp3oaKdpj5xwJgQHq1Qy5CoOgmZpbtY4xA8fp+R3VQLQ34KIr5lPgk2Z5Y2xmkLgPP2hDaokvng2VSvVs3HmZegxcIA6IYEupco4Ea9rK4hFCzL8A5bWmX+yevP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZ04edyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZ04edyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71521F00A3A;
	Tue,  4 Aug 2026 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827800;
	bh=tIgPIzu69ncejqEtJUViK8Bn72v7Z0jqYwUIkonK9G4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZ04edyKhuamu+EmY1VLY3/u4R28NYUBNsqUi0HSkcV5E06nvqGQ4EKHImyG81GMb
	 FzX74RJU25/9hAcddql5WqtRY31PMKRxmHQwNtEhBr2qdn5yeAamLP03N9p0byF1Qm
	 EPnm0a0wlFCk0e4BATAC4tt+2LdcMVAu3JD+5/a1CyOK/gkpIxcsO3bIgAV0mqeWNl
	 RdI5ZU3+5Y+T8atuiz5fZadUgM5KmXlR8zmQaxbsJaNWtuxrKLhJ1HDoRiiF7GvQoD
	 3Wg8lzxdXRMbgexn4qf8AuGicJrWLtyQGuXcoMjSP9i8gLlE02acNcjaVv2YDRk5PP
	 tgOQpskkfrZ8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804070307.117119-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:16:39 +0000
Message-Id: <20260804071639.B71521F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uninitialized stack memory is used to configure the DSP, which can=
 lead to unpredictable behavior or DSP crashes.
--

--- Patch [1]: [PATCH v7 1/7] ASoC: qcom: qdsp6: add topology-driven Audio =
IF support ---
commit 0fae44a436543afc97061ba27a78d9bfd55821bf
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: qdsp6: add topology-driven Audio IF support

Add topology parsing and media-format programming for Audio IF source and
sink modules. This introduces new Audio IF module IDs, required topology
tokens, and the media-format path to send interface configuration to the DS=
P.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index 0cc840aca69dd..cce0ad31ff0c0 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
[ ... ]
> @@ -1052,6 +1066,81 @@ static int audioreach_i2s_set_media_format(struct =
q6apm_graph *graph,
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }
> =20
> +static int audioreach_audio_if_set_media_format(struct q6apm_graph *grap=
h,
> +						const struct audioreach_module *module,
> +						const struct audioreach_module_config *cfg)
> +{
> +	struct apm_module_hw_ep_frame_duration_cfg *fd_cfg;
> +	struct apm_module_param_data *param_data;
> +	struct apm_audio_if_module_intf_cfg *intf_cfg;
> +	struct apm_module_hw_ep_mf_cfg *hw_cfg;
> +	int ic_sz =3D APM_AUDIO_IF_INTF_CFG_PSIZE;
> +	int ep_sz =3D APM_HW_EP_CFG_PSIZE;
> +	int fd_sz =3D APM_HW_EP_FRAME_DURATION_PSIZE;
> +	int size =3D ic_sz + ep_sz + fd_sz;
> +	u32 slot_mask =3D cfg->slot_mask ? cfg->slot_mask : module->slot_mask;
> +	u16 nslots_per_frame =3D cfg->nslots_per_frame ?
> +				 (u16)cfg->nslots_per_frame : module->nslots_per_frame;
> +	u16 slot_width =3D cfg->slot_width ? (u16)cfg->slot_width : module->slo=
t_width;

[Severity: High]
Could this lead to sending garbage configuration parameters to the DSP?

Callers of audioreach_set_media_format() (like q6apm_dai_prepare() in=20
q6apm-dai.c) allocate `struct audioreach_module_config cfg` on the stack=20
without zero-initializing it.

Since callers generally only populate specific fields for their own needs,
the newly added fields (slot_mask, nslots_per_frame, and slot_width) will
often contain uninitialized stack memory.=20

Because the ternary operators here fall back to the module defaults only if=
=20
the config fields are exactly zero, this stack garbage will frequently eval=
uate
as true. This overrides the valid topology configuration and sends malforme=
d=20
interface parameters to the DSP, which might cause audio path failures or
DSP crashes.

> +	void *p;
> +
> +	struct gpr_pkt *pkt __free(kfree) =3D audioreach_alloc_apm_cmd_pkt(size=
, APM_CMD_SET_CFG, 0);
> +	if (IS_ERR(pkt))
> +		return PTR_ERR(pkt);
[ ... ]
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/aud=
ioreach.h
> index 62a2fd79bbcb9..35541b2d8c998 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
[ ... ]
> @@ -907,6 +994,9 @@ struct audioreach_module_config {
>  	u32	channel_allocation;
>  	u32	sd_line_mask;
>  	int	fmt;
> +	u32	slot_mask;
> +	u16	nslots_per_frame;
> +	u16	slot_width;
>  	struct snd_codec codec;
>  	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804070307.1171=
19-1-prasad.kumpatla@oss.qualcomm.com?part=3D1
