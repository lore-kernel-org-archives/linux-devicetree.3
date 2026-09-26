Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75FC3E3170
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429741; cv=none; b=h4RsJEECEfseipv7IpL7i/0n+ENCUESdcBVnOuAjod//O/35MkliYf0H73ra3SwizZ9H9qHdnwtXHGsjcQqYl1NtHM+6+u3FPD/UhVyRCfQdoZtcZm6R5vW+S7cVYrT8fgAW8V/irzw/4m0jIAkiIxwBkrutCL6088YROqktcFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429741; c=relaxed/simple;
	bh=fxQ52lg9kqeyB9Q+HqRfOjqonCHF5teTnlCwVl5qzV8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HbIsDYJOoaKbMgYb2sk0m3eU1sNGQgrIhP4oKP64HWisPiO0caVNzWZhrcQqIoJA9+DmOyhFSJPje5XkJjvH98qLLUy0sUxM5JAK7ocJwLqTDgfF/tzXSymMHaZqTCi4dne3SwgZqjIHPFD0sX5hIgernkTWJqdxNctCCkHKXh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owOqFizo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owOqFizo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FDE1F000FF;
	Sat, 26 Sep 2026 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429739;
	bh=pV0NV2NyQdsZT+nhwn9LVPXfmF4bY2rCT2F3M6+UauA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=owOqFizoHndQB96olXmwUC0NZIf37HQD7udRzbOoX6h0uHku2PVnfhYJajNTTN+dp
	 LiVmzKIY9wQeL0mScYPW2MdmoY2XUxc8KhBufC+6iFehoP997CRVVZe2w5nHZ3981y
	 38GNjI2wZlFGI8KNnblwH55d5VKEsQ5dXJgPHbe8aXLyZnJVjzez4rUTY1wxrbxC6e
	 nT1BhZ6TwJPQfeX9ikTiL9RroIXSGz/BXqCWcrdC+Z+3QdL20sGvZFTfb04SbuvY48
	 gmCijcNIz6ike/IwHv2/C82QdnCiiO7rvAhCg/JBZGPdVcuLIfMp9yOvURxpDk/W4w
	 szPKof0H9J6Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/17] arm64: dts: apple: t8112: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260926-avd-v2-12-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-12-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:35:38 +0000
Message-Id: <20260926133539.15FDE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] media: apple: null pointer dereference in avd_init_job() on alloca=
tion failure
- [High] media: apple: use-after-free of avd_ctx in avd_watchdog_func()
- [Low] media: v4l2: off-by-one error allows out-of-bounds context_update_t=
ile_id
- [Low] dt-bindings: media: apple,avd: missing t8132 and t8140 compatible s=
trings
--

commit 55c4cd1f1e93f6dcc1e853c4ea8a083b87538669
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t8112: add avd nodes
   =20
This patch series adds the Apple Video Decoder (AVD) driver to support
stateless video decoding on newer Apple SoCs.

> diff --git a/Documentation/devicetree/bindings/media/apple,avd.yaml b/Doc=
umentation/devicetree/bindings/media/apple,avd.yaml
> new file mode 100644
> index 0000000000000..0aa2cffae50f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/apple,avd.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t6030-avd
> +              - apple,t6031-avd
> +          - const: apple,t8122-avd
> +      - enum:
> +          - apple,t8103-avd
> +          - apple,t8112-avd
> +          - apple,t8122-avd
> +          - apple,t6000-avd
> +          - apple,t6020-avd

[Severity: Low]
Do the dt-bindings miss the apple,t8132-avd and apple,t8140-avd compatible
strings?

The AVD driver explicitly registers support for apple,t8132-avd and
apple,t8140-avd via the avd_of_match array in avd-drv.c.

Because the device tree binding schema documentation omits these compatible
strings, validating device trees that contain these hardware variants fails
with a dt-schema validation error.

[ ... ]

> diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/p=
latform/apple/avd/avd-drv.c
> new file mode 100644
> index 0000000000000..68752c44d4ec6
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-drv.c

[ ... ]

> +int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segme=
nts)
> +{
> +	int ret =3D 0;
> +	struct avd_job *job =3D &ctx->job;
> +
> +	job->codec =3D codec;
> +	job->dest =3D 0x1000;
> +	job->num =3D 0;
> +	job->num_submit =3D 0;
> +	job->num_alloc =3D segments;
> +	ret =3D avd_buf_alloc(ctx->dev, &job->buf,
> +			    job->num_alloc * sizeof(*job->segments));
> +	job->segments =3D job->buf.cpu;
> +	memset(job->buf.cpu, 0, job->buf.size);

[Severity: High]
Is there a risk of a null pointer dereference of job->buf.cpu on allocation
failure?

If avd_buf_alloc() fails and returns -ENOMEM, it leaves job->buf.cpu as nul=
l.
Since the return value assigned to ret is not checked, the subsequent memse=
t()
will unconditionally use the null pointer.

This path is reachable from userspace by submitting decode jobs, meaning
memory pressure could induce a kernel panic.

> +	return ret;
> +}

[ ... ]

> +static void avd_watchdog_func(struct work_struct *work)
> +{
> +	struct avd_dev *avd;
> +	struct avd_ctx *ctx;
> +	int ret;
> +
> +	ctx =3D container_of(to_delayed_work(work), struct avd_ctx,
> +			   watchdog_work);
> +	if (!ctx)
> +		return;
> +
> +	avd =3D ctx->dev;

[Severity: High]
Could this result in a use-after-free of ctx if it runs concurrently with
avd_release()?

In avd_release(), cancel_delayed_work() is used to stop the watchdog timer,
which doesn't block if the work is currently executing on another CPU.
Following this, avd_release() frees the context:

avd-drv.c:avd_release() {
	...
	cancel_delayed_work(&ctx->watchdog_work);
	...
	kfree(ctx);
}

If avd_watchdog_func() is running concurrently, won't it dereference the
freed ctx pointer when accessing ctx->dev?

This race condition can be triggered by closing the video device while a
decoding timeout occurs, resulting in memory corruption or a kernel panic.

[ ... ]

> +static int avd_release(struct file *filp)
> +{
> +	struct avd_ctx *ctx =3D file_to_ctx(filp);
> +
> +	cancel_delayed_work(&ctx->watchdog_work);
> +
> +	v4l2_fh_del(&ctx->fh, filp);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +	v4l2_fh_exit(&ctx->fh);
> +	avd_buf_free(ctx->dev, &ctx->inst);
> +	avd_buf_free(ctx->dev, &ctx->pipe_state);
> +	avd_buf_free(ctx->dev, &ctx->job.buf);
> +	kfree(ctx);
> +
> +	return 0;
> +}

[ ... ]

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 9caca56478d1a..11ced5f639071 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c

[ ... ]

> @@ -800,10 +800,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl=
_av1_film_grain *fg)
>  	return 0;
>  }
> =20
> +static int validate_av1_tile_info(struct v4l2_av1_tile_info *ti)
> +{
> +	if (ti->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
> +	    ti->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
> +		return -EINVAL;
> +
> +	if (ti->context_update_tile_id > ti->tile_cols * ti->tile_rows)

[Severity: Low]
Does this check allow an out-of-bounds context_update_tile_id to pass
validation?

Since context_update_tile_id is a 0-based index for the tiles, an ID exactly
equal to ti->tile_cols * ti->tile_rows is out-of-bounds.

Shouldn't this check use >=3D instead of > to properly enforce the AV1 bits=
tream
specification, which mandates that context_update_tile_id must be strictly
less than TileCols * TileRows?

This allows an invalid tile ID to be passed to hardware drivers, which could
result in undefined logic or hardware state.

> +		return -EINVAL;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D12
