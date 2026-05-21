Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D33EB818
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369163; cv=none; b=BNsmGYv2E03q1LMWhMXsRcE0a4K6JCiSWnfhgKORWwxo9QRkoY8STywd/DKXD2R/93/37tHmTniYGcvF8usFQHRBEMDSx+UT/ZZ/hyH/q1J2+B5BywDjBLnfaUbwDCOD/fdb8ihqLC6KDhul/cGn7v2AAy6UkYEA6GcTyHC1NIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369163; c=relaxed/simple;
	bh=F1EkC9CuBumBHIEIR3fQQDzP4n9OcsAhFbA8uoEA3Q4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mICSuFqHaRxLz3xBlfIIddKeFvsmk/5/YNMA1CKe4StgpySxYx2wv17WGj7jeLpRz+NDVZCRE1SuzVwcyCDuOLpSp1rV5YSePbNrb9PPkoj8IolLnwQldTnOrS7yf8xin0fGPD54AWhMIw9VNx5SDKXQ33wc4K6Hx2jdoSmwu6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgZArrmt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgZArrmt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B2F1F00A3B;
	Thu, 21 May 2026 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369162;
	bh=pTS59Z7a97+cNNGmU81cjYBLIC2oRxSo7UsBzDPzx20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OgZArrmtkExRgbvAv/wYPpOx9boX7an7hQTGTAlCuvx6fxVPzypXZm4oFABJKxwVh
	 6oHWDZuL4Glayy+gTc7m45peLlFQ7S4pGRfNpVebU3VylOAYSOuIxiHVGwAITW+hkJ
	 YKPKDT3KI4L8fP8Zykxru5zRRxwI5KDYGy+4q0ME+oiI5ZF0f+PBM2Z2wM3lu33l4J
	 W0Nk8VtFpyF2TRnSXGdpRjuDDli6p5iouHmz0uwMN2iqvRrOAbzLqjwByHoI8jZ6LF
	 80eUGhmV1EEyC+hDeH+uwtDw8Fcsl5A3KGObx56fNJizoVkSc5yrjPPnBgWiFcXE+0
	 Xgy1eIjhpDuQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 13/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-13-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-13-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:12:41 +0000
Message-Id: <20260521131242.55B2F1F00A3B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] max_serdes_get_streams_masks inadvertently clears unaffected pad m=
asks and the source pad mask due to incorrect array initialization.
- [High] max_serdes_get_streams_masks uses devm_kcalloc for dynamic stream =
mask allocation in a runtime operation, leading to a memory leak.
- [High] Tautological pointer check in max_serdes_xlate_enable_disable_stre=
ams leads to a potential NULL pointer dereference.
--

commit 3a9623717272197fc2bda2f941c128e58eebdcaa
Author: Cosmin Tanislav <demonsingur@gmail.com>
Subject: media: i2c: add Maxim GMSL2/3 serializer and deserializer framework

This commit adds a common framework for Maxim GMSL2/3 serializers and
deserializers, enabling support for Streams API, GMSL link negotiation,
and other shared functionality across the chips.

> diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/=
i2c/maxim-serdes/max_serdes.c
> new file mode 100644
> index 0000000000000..bed70b8ce99a4
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_serdes.c

[ ... ]

> +int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *so=
urces,
> +					    u32 source_sink_pad_offset,
> +					    const struct v4l2_subdev_state *state,
> +					    u32 pad, u64 updated_streams_mask,
> +					    u32 sink_pad_start, u32 num_sink_pads,
> +					    bool enable)
> +{
> +	u32 failed_sink_pad;
> +	int ret;
> +	u32 i;
> +
> +	for (i =3D sink_pad_start; i < sink_pad_start + num_sink_pads; i++) {
> +		u64 matched_streams_mask =3D updated_streams_mask;
> +		u64 updated_sink_streams_mask;
> +		struct max_serdes_source *source;
> +
> +		updated_sink_streams_mask =3D
> +			v4l2_subdev_state_xlate_streams(state, pad, i,
> +							&matched_streams_mask);
> +		if (!updated_sink_streams_mask)
> +			continue;
> +
> +		source =3D &sources[i + source_sink_pad_offset];
> +		if (!source)
> +			continue;
> +
> +		if (enable)
> +			ret =3D v4l2_subdev_enable_streams(source->sd, source->pad,
> +							 updated_sink_streams_mask);

[Severity: High]
Will this check actually prevent a NULL pointer dereference?

Since source is assigned the address of an element in the sources
array, the pointer itself will never be NULL. If the corresponding
sink pad is not linked to a remote subdevice, the unpopulated element
might have source->sd set to NULL.

If userspace configures an active route to an unconnected sink pad
and starts the stream, will v4l2_subdev_enable_streams() dereference
the NULL source->sd pointer and panic the kernel?

[ ... ]

> +int max_serdes_get_streams_masks(struct device *dev,
> +				 const struct v4l2_subdev_state *state,
> +				 u32 pad, u64 updated_streams_mask,
> +				 u32 num_pads, u64 *old_streams_masks,
> +				 u64 **new_streams_masks, bool enable)
> +{
> +	u64 *streams_masks;
> +	unsigned int i;
> +
> +	streams_masks =3D devm_kcalloc(dev, num_pads, sizeof(*streams_masks), G=
FP_KERNEL);

[Severity: High]
Could this lead to a memory leak during runtime operations?

This function appears to be called during stream enable and disable
operations, which userspace can trigger repeatedly via V4L2 ioctls.

Because devm_kcalloc allocations are bound to the device's lifetime,
will continuous stream toggling exhaust memory and lead to an OOM
condition since the allocations are only freed on driver detach?

> +	if (!streams_masks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_pads; i++) {
> +		u64 matched_streams_mask =3D updated_streams_mask;
> +		u64 updated_sink_streams_mask;
> +
> +		updated_sink_streams_mask =3D
> +			v4l2_subdev_state_xlate_streams(state, pad, i,
> +							&matched_streams_mask);
> +		if (!updated_sink_streams_mask)
> +			continue;
> +
> +		streams_masks[i] =3D old_streams_masks[i];
> +		if (enable)
> +			streams_masks[i] |=3D updated_sink_streams_mask;
> +		else
> +			streams_masks[i] &=3D ~updated_sink_streams_mask;
> +	}
> +
> +	if (enable)
> +		streams_masks[pad] |=3D updated_streams_mask;
> +	else
> +		streams_masks[pad] &=3D ~updated_streams_mask;

[Severity: High]
Does this logic accidentally clear the state of unaffected pads and the
source pad?

The streams_masks array is zero-initialized by devm_kcalloc. Inside the
loop, if updated_sink_streams_mask is 0, the continue statement skips
the assignment of streams_masks[i] =3D old_streams_masks[i]. This leaves
unaffected pads with a cleared state of 0.

Additionally, when updating the target pad itself after the loop, the
operation directly applies updated_streams_mask without inheriting its
prior state from old_streams_masks[pad].

Will this cause the tracking to forget previously enabled streams and
break stream state management?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D13
