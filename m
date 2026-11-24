Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540898;
	b=LyCSu0WJ7OG2yS3Q/TNT5Dlg67aE8ycunabRFRbSSlaYdwRENC1agB59Q4BX+I4nTSKo
	 3xJUKhIKdLX/h0oFMF9YU5mI3k7WiVTYVcNdBgkmVwZovxYw/uwInbkwKKwq+CKldLXAv
	 0UMk/FP8f8BEH8y1KZxYqgJOtJlthjJ/eC/NI2A6Q81cSpoyKbc07l9wIW5m5tgxw+jGC
	 DX6BTniWOnm2up8aZFuFFm7Q4V4B910EgX7I93s9mQHtaUNKLre/0NRP22w97jMS2c/Yc
	 7eQRz47SQ1RMPA2tHx3UwGD50pNUo8UtJhdUFKwmdcKNMvgb2pqhlJ8uiqEixoXyoLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540898;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QOE9tLv8iBUPXviQlcW4ty3xl5blRuHsSayLmoDU4qQ=;
	b=wVaDe1AVJxUYAeE6ObuKUWkMk1JjmjkVGaLMtV6w6cgPUz9z9ygIH5KMxWyoeDGQp2lL
	 r17chy7GkKLAp/kF3DHNsPrdgmh+FH6D9ke10uwTXBTwtk0AIF/1q+ePPP4V85B9qF6pG
	 NWponNX13NOSVq48WH+B8/KZJO2m7gNnaUrq5QPiyB4nUHehb6LEmfAss+2CCMX7S/ui7
	 SyqpvZX/Y/mirBwiMStSJ3BFUjsi4apNzVEuXfJwEWaSzZtOs3OTgKqKN8qkgB98/qb1T
	 2JPIyXLAtKuTYpLO5Y9EV2E5RBJramS9rD5sioyu1ZySFmeIKbQ4OiB9ssMyPK7Y55Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICyJa1fP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EBF606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICyJa1fP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B721F000CA;
	Tue, 24 Nov 2026 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540898;
	bh=QOE9tLv8iBUPXviQlcW4ty3xl5blRuHsSayLmoDU4qQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ICyJa1fPj7nHng8oHiOaGfZryOM/CD3tT9Ew1yGZzb5DfycHLTthy0hF3FR6NWpXb
	 780ahlvzzdWbWF/6PpxaeVtmPitSNQz4kNxsW1mG2ht2PGM75fG7kF4sONKF5ogMkz
	 pVqK+fm6P3NXxZFXDz09O5ukmC8hy0BOvC+nc3HriRob3LdbvdYaFflAGj8V3LVo41
	 1toXdZLnPdwGCGqIajZVd9rvt0Nhpp1N8Q4OTm/9Y9TcAuMEs4Fi2uymPUn8x6foeB
	 swjZ+Wnohal7iyvagMwQ0XM0+jOmzDUGv2Uz77IVEBy9vwqN03yZw4Fz4vtnR8arfl
	 51QFy6sIKEanw==
Message-ID: <sashiko-outbox-231696@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/24] media: mali-c720: Add full-resolution output
 subdevice
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-11-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-11-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:21:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: mali-c720: premature stream disable in
  mali_c720_fr_pipe_disable_streams()
--

commit e9291c2295f3f6641b25d61f1e2d851fc6eecc95
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: mali-c720: Add full-resolution output subdevice

This commit adds the full-resolution output 0 (FR0) V4L2 subdevice with RGB
and YUV source pads, including scaler and crop configuration.

> diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-fr-pipe.c b/d=
rivers/media/platform/arm/mali-c720/mali-c720-fr-pipe.c
> new file mode 100644
> index 0000000000000..a2f97ebce609b
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-c720/mali-c720-fr-pipe.c
> @@ -0,0 +1,1178 @@

[ ... ]

> +static int mali_c720_fr_pipe_enable_streams(struct v4l2_subdev *sd,
> +					    struct v4l2_subdev_state *state, u32 pad,
> +					    u64 streams_mask)
> +{
> +	struct mali_c720_subdev *mdev =3D v4l2_sd_to_mali_c720_sd(sd);
> +	struct mali_c720 *mali_c720 =3D mdev->mali_c720;
> +	const struct mali_c720_pipeline_regs *pipeline =3D mali_c720->registers=
.top->pipeline;
> +	struct mali_c720_fr_pipe *pipe =3D
> +		mali_c720_sd_to_sd(mdev, struct mali_c720_fr_pipe);
> +	struct mali_c720_context *ctx =3D mali_c720_get_active_context(mali_c72=
0);
> +	struct v4l2_subdev *src_sd;
> +	struct media_pad *sink_pad;
> +	int ret;
> +
> +	sink_pad =3D &pipe->pads[MALI_C720_FR_PIPE_PAD_SINK_VIDEO];
> +	pipe->remote_src =3D media_pad_remote_pad_unique(sink_pad);
> +	if (IS_ERR(pipe->remote_src)) {
> +		dev_err(mali_c720->dev,
> +			"No remote source for fr 0 pipe\n");
> +		return -EINVAL;
> +	}
> +
> +	src_sd =3D media_entity_to_v4l2_subdev(pipe->remote_src->entity);
> +	mali_c720_ctx_group_write(ctx, mali_c720->top_base,
> +				  &pipeline->fr0_hv_cv_mux_sel,
> +				  ISP_TOP_FR0_HV_CV_MUX_SEL_HV);
> +
> +	/* Enable the upstream subdevice unless another output already enabled =
it. */
> +	ret =3D v4l2_subdev_enable_streams(src_sd, pipe->remote_src->index, BIT=
(0));
> +	if (ret && ret !=3D -EALREADY)
> +		return ret;
> +
> +	mali_c720_fr_pipe_update_resizer_config(pipe, state);
> +	if (pad =3D=3D MALI_C720_FR_PIPE_PAD_SOURCE_YUV)
> +		mali_c720_fr_pipe_program_output_formatter(pipe);
> +
> +	guard(spinlock)(&pipe->resizer_lock);
> +	pipe->enabled_crops |=3D BIT(pad);
> +
> +	return 0;
> +}
> +
> +static int mali_c720_fr_pipe_disable_streams(struct v4l2_subdev *sd,
> +					     struct v4l2_subdev_state *state, u32 pad,
> +					     u64 streams_mask)
> +{
> +	struct mali_c720_subdev *mdev =3D v4l2_sd_to_mali_c720_sd(sd);
> +	struct mali_c720_fr_pipe *pipe =3D
> +		mali_c720_sd_to_sd(mdev, struct mali_c720_fr_pipe);
> +	struct v4l2_subdev *src_sd;
> +
> +	if (pipe->remote_src) {
> +		src_sd =3D media_entity_to_v4l2_subdev(pipe->remote_src->entity);
> +		v4l2_subdev_disable_streams(src_sd, pipe->remote_src->index,
> +					    BIT(0));
> +	}
> +	pipe->remote_src =3D NULL;
> +
> +	guard(spinlock)(&pipe->resizer_lock);
> +	pipe->enabled_crops &=3D ~BIT(pad);
> +
> +	return 0;
> +}

[Severity: Medium]
Does mali_c720_fr_pipe_disable_streams() stop the upstream subdevice while
the other source pad is still streaming?

mali_c720_fr_pipe_enable_streams() allows both the RGB and YUV source pads
to share the upstream stream by ignoring -EALREADY, and records each active
pad in pipe->enabled_crops.  However, mali_c720_fr_pipe_disable_streams()
unconditionally disables the upstream stream and clears pipe->remote_src
without checking whether the other pad bit is still set in
pipe->enabled_crops.

Also, if media_pad_remote_pad_unique() fails in
mali_c720_fr_pipe_enable_streams(), pipe->remote_src is left holding an
ERR_PTR, which the truthiness check in mali_c720_fr_pipe_disable_streams()
would treat as a valid pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D11
