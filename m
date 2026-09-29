Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FFC347FC0
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662677; cv=none; b=WxI/NyCIMytp0sgHta/k10TDoQ+TmAkoeFJeptCmBW3xDECDMwgGhNmgJ9qxC5UdCN572M9zrfo3rcCgZfFOVIIZIDA3tQDrlzStYusYrEecrQDW9h44tPJ4ZhA0jPDDqbHT1wKZWEooCH0f2wfw3MW5VqxEw3ge5itezgkiGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662677; c=relaxed/simple;
	bh=E0DbOGOXqmwTs+gvoi0wcjrj0cbmCo05bJuP8QAhOlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CBqiTCg+CUKMu6/1/huDQu41KpUg47TYSvQ8ZfrgDfkQJvPIc0xNAHhQi5coTkpTK20bItLuiP5bbbs0h12pFEK1b6aBkrnB681ClH/IyXwvl+5UcuSEdGLhaiDByq4CpswcfEJQcsBNhccri1n+wG8EYFLanbVzZyftqZChoEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sod+t1SB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sod+t1SB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA321F000FF;
	Tue, 29 Sep 2026 06:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790662676;
	bh=174VKadjpnQO2aVNnniXDbyR10JgcnxfaZociXI3Cck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sod+t1SB7SCKCVbr12Cx6/UQh2LpXgIr2X7dkRFXzdotWwFOGIxduSKZxw/GTc7Ps
	 hvK9htPNevX1F6kHBYy5D9iffI+N0UPrYkHdhqel5jsaaBIDqyrLva5UWSawLhBK93
	 i/54kwGumEfaY1ze4ASbPsfU+B748nHnJUETgr1YXOpJ+6bgGHAf93xIUs+0Bjiguv
	 bZJNXG8pd0Zp5/8CJKvm+WdaFXtsDVAKJUWHxYnbFqYorqoFMMfVHnZ0Kw3lnjf/hE
	 Iw8L1O7Why+osJ9EAOzXe38phojoYOX3+DrBiLnER47MRo47ZOcTX+Y9b+UoBpDhtw
	 45iL5LXz706tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 07/11] media: qcom: camss: vfe: Add support for VFE
 Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260928-kaanapali-camss-v17-7-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-7-dcf3fd37f76c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:17:55 +0000
Message-Id: <20260929061755.8BA321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] camss: hardware constraint violation due to unconditional AUP_UPDA=
TE loop in CSID
- [High] camss: subsystem API violation where IFE Lite's 4th RDI line is in=
correctly configured as PIX
--

commit def99c6cf972d2305c4c27701233f42e411f7857
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE Gen4

This commit adds support for the VFE Gen4 (TFE) found on the Kaanapali SoC.
It configures the hardware blocks and clock requirements, while deferring
REG_UPDATE and AUP_UPDATE until after CSID configuration completes.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c

[ ... ]

> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>  		output->gen2.active_num++;
>  		ops->vfe_wm_update(vfe, output->wm_idx[0],
>  				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);
>  	}
> =20
>  	spin_unlock_irqrestore(&vfe->output_lock, flags);

[Severity: High]
The commit message states: "the number of AUP_UPDATE requests must match the
number of buffers queued to the write master while it is being enabled."

In vfe_enable_output_v2(), the VFE loop shown above queues pending buffers
dynamically up to CAMSS_INIT_BUF_COUNT, but breaks early if userspace queued
fewer buffers. By setting reg_update_after_csid_config to true for Kaanapal=
i,
this defers the update to CSID.

However, the corresponding CSID code at csid_configure_stream() in
camss-csid-gen4.c blindly issues AUP_UPDATEs matching the maximum buffer
count:

for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
    __csid_aup_update(csid, i);

If userspace queues fewer buffers before starting the stream, does this cau=
se
a mismatch between the generated AUP_UPDATEs and the actually queued buffer=
s,
violating the hardware constraint?

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -158,6 +158,157 @@ static const struct camss_subdev_resources csid_res=
_kaanapali[] =3D {

[ ... ]

> +	/* VFE3 - IFE Lite */
> +	{
> +		.clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "vfe_lite_ahb", "vfe_lite",
> +			   "cpas_vfe_lite", "camnoc_rt_axi",
> +			   "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate =3D { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg =3D { "vfe_lite0" },
> +		.interrupt =3D { "vfe_lite0" },
> +		.vfe =3D {
> +			.line_num =3D 4,
> +			.is_lite =3D true,

[Severity: High]
The commit message explicitly states: "Support is currently limited to three
output lines, matching the constraints of the CAMSS framework."

But line_num is initialized to 4 for the IFE Lite blocks.

Since the CAMSS framework hardcodes VFE_LINE_PIX to index 3, does configuri=
ng
4 lines cause the 4th line (RDI3 with id 3) to be incorrectly subjected to
PIX-specific logic? For example, in vfe_try_format(), this would force a raw
RDI dump stream to use PIX format tables and validation:

if (line->id =3D=3D VFE_LINE_PIX) {
    struct v4l2_rect *rect;
    rect =3D __vfe_get_crop(line, sd_state, which);
    fmt->width =3D rect->width;
    fmt->height =3D rect->height;
}

Is this initialization to 4 lines unintentional given the 3-line limit
mentioned in the commit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapali-=
camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D7
