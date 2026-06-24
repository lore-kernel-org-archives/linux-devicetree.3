Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AC822538F
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287032; cv=none; b=Utt41SEYpaxXAxUUi37HfBKrly74Wrsr6q0PO57jp9pQwH0TDIWEEYqzJXhKgNyjgjXMiUEAt0XWMNYkreed4vyv5GaGY/NgkDZeKQx7MaQF2KZ1K31NsdtHFX885z7sarX1CLIsUZtOEG6yG8QBXHlCUeztZR10yyiikgnTwhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287032; c=relaxed/simple;
	bh=DfcN4EFpNAK0o2wJ9oGjdQPvltOpXRkvRJKBtuSppBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VhPaGT+ibrpvSrgOriFCk8vcsasnmANq3AoiXzt2DzP/adsgPln7vDN2we683n1XRxnbrRuTqz/BlNfuMs8kgLyiOAxakKbqhGYNA18SVd8YpCfGusdLpT0fnA+EVJhjr4MqAiu2boy/cY+wLltc1e14vN45iHFKBooAFknUvD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRYC+5uA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRYC+5uA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E4A1F000E9;
	Wed, 24 Jun 2026 07:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782287030;
	bh=YjEdyBBFRIpSP9mvhkgA6jIVI6kSVHM8wksakE1l34E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jRYC+5uAtg4CkukFOOfQQkvOzDoaJWJFdAGeKVKUaUEvn5AxaaYjh/m2FxIiz1EoC
	 iu5X5DpTr8fps4tjFQ7HgPVjAH3hzdX4lWvYu4uhXfpaLn3kIffukEsPbgpO1Tl2my
	 Jz/WJ9DllvqnkdkhcbmPP22bmc+4EVzKHF07CrsxozSukvmmyKGhiW28nVLc+nWMQB
	 sn4qEQjQjs+m6IXzJeybk80Iiv51dA3FIpxDooUavNL5yUoLcYCzWue6l8oQwxX43S
	 t3LavXw7xmgGb8aT/cQNjqacKJJeGKI40uADgDJoMzy+VpdXvgnIjBgJvNjKfFgsDP
	 w2gSR4k5PJolw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] media: chips-media: wave6: Add Wave6 VPU
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624072043.238-4-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-4-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 07:43:50 +0000
Message-Id: <20260624074350.81E4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing bounds validation on hardware-supplied frame buffer counts=
 causes array buffer overflows and potential infinite loops.
- [Medium] Leaking dynamically allocated `inst->codec_info` when closing de=
coder/encoder instance fails.
- [Medium] Hardcoded `BIG_ENDIAN` mismatch leads to byte-swapped decoder pi=
xel formats on little-endian hosts.
- [Low] Endianness bug on Big-Endian architectures during product name stri=
ng extraction.
- [Low] Mixing goto-based cleanup and `guard()` in the same function violat=
es cleanup subsystem guidelines.
--

commit 61aa06e0583bb5f57f21d3d07d1ad5f6245d0508
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 VPU interface

Add an interface layer to manage hardware register configuration
and communication with the Chips&Media Wave6 video codec IP.
The interface provides low-level helper functions used by the
Wave6 core driver to implement video encoding and decoding operations.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/driver=
s/media/platform/chips-media/wave6/wave6-hw.c
> index 0000000000000..b49348d6119c8 100644
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
> @@ -230,22 +230,22 @@ int wave6_vpu_get_version(struct vpu_core_device *c=
ore)
>  	if (ret)
>  		return ret;
> =20
>  	reg_val =3D vpu_read_reg(core, W6_RET_PRODUCT_NAME);
>  	str =3D (u8 *)&reg_val;
>  	attr->product_name[0] =3D str[3];
>  	attr->product_name[1] =3D str[2];
>  	attr->product_name[2] =3D str[1];
>  	attr->product_name[3] =3D str[0];
>  	attr->product_name[4] =3D 0;

[Severity: Low]
On big-endian architectures, vpu_read_reg() returns the integer in native
byte order. If the bytes are reversed using fixed indices like this, could
it result in the string being stored backwards or reading a null terminator
first?

[ ... ]

> @@ -345,13 +345,13 @@ int wave6_vpu_dec_register_frame_buffer(struct vpu_=
instance *inst)
> =20
>  	fb_arr =3D &inst->frame_buf[0];
>  	fbc_count =3D p_dec_info->seq_info.min_frame_buffer_count;
>  	mv_count =3D p_dec_info->seq_info.req_mv_buffer_count;
> =20
>  	for (i =3D 0; i < fbc_count; i++) {
>  		if (!inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i].daddr)
>  			return -EINVAL;
>  		if (!inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i].daddr)
>  			return -EINVAL;
>  	}

[Severity: High]
If the hardware returns a value for fbc_count that is larger than
WAVE6_MAX_FBS (31), could this loop read past the end of the inst->aux_vbuf
arrays?

[ ... ]

> @@ -377,7 +377,7 @@ int wave6_vpu_dec_register_frame_buffer(struct vpu_in=
stance *inst)
> =20
>  	fbc_remain =3D fbc_count;
>  	mv_remain =3D mv_count;
>  	group_num =3D (fbc_count > mv_count) ? ((ALIGN(fbc_count, 16) / 16) - 1=
) :
>  					     ((ALIGN(mv_count, 16) / 16) - 1);

[Severity: High]
If the hardware unexpectedly returns zero for both fbc_count and mv_count,
would the subtraction of 1 after division underflow to SIZE_MAX and cause
an infinite loop here?

[ ... ]

> @@ -445,9 +445,9 @@ int wave6_vpu_dec_register_display_buffer(struct vpu_=
instance *inst, struct fram
> =20
>  	reg_val =3D SET_DISP_COMMON_PIC_INFO_BWB_ON |
>  		  SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(c_fmt_idc) |
>  		  SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING) |
>  		  SET_DISP_COMMON_PIC_INFO_OUT_MODE(out_mode) |
>  		  SET_DISP_COMMON_PIC_INFO_OUT_FMT(out_fmt) |
>  		  SET_DISP_COMMON_PIC_INFO_STRIDE(fb.stride);
>  	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO, reg_val);
>  	reg_val =3D SET_DISP_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
>  	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_OPTION, reg_val);

[Severity: Medium]
Is it expected to strictly use VDI_128BIT_BIG_ENDIAN here? On little-endian
hosts, enforcing BIG_ENDIAN for output buffers might cause the hardware
state machine to output byte-swapped pixels. Should this use HOST_ENDIAN
instead?

[ ... ]

> @@ -1585,11 +1585,11 @@ static void wave6_gen_set_fb_reg(struct vpu_insta=
nce *inst, struct enc_cmd_set_f
>  	reg->num_fb =3D SET_FB_NUM_FBC_END_IDX(fbc_count - 1) |
>  		      SET_FB_NUM_MV_COL_END_IDX(mv_count - 1);
>  	reg->fbc_stride =3D SET_FB_FBC_STRIDE_L(fb_arr[0].stride) |
>  			  SET_FB_FBC_STRIDE_C(fb_arr[0].stride_c);
>  	reg->default_cdf =3D 0;
> =20
>  	for (i =3D 0; i < fbc_count; i++) {
>  		reg->fbc_y[i] =3D fb_arr[i].buf_y;
>  		reg->fbc_c[i] =3D fb_arr[i].buf_cb;
>  		reg->fbc_cr[i] =3D fb_arr[i].buf_cr;
>  		reg->fbc_y_offset[i] =3D inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i].daddr;

[Severity: High]
Could this loop overflow the reg->fbc_y array if fbc_count exceeds
WAVE6_MAX_FBS?

[ ... ]

> @@ -1617,11 +1617,11 @@ int wave6_vpu_enc_register_frame_buffer(struct vp=
u_instance *inst)
>  	struct enc_cmd_set_fb_reg *reg;
>  	struct enc_info *p_enc_info;
>  	u32 fbc_count, mv_count, idx;
>  	int ret;
> =20
>  	guard(mutex)(&inst->dev->hw_lock);
> =20
>  	p_enc_info =3D &inst->codec_info->enc_info;

[ ... ]

> @@ -1665,11 +1665,11 @@ int wave6_vpu_enc_register_frame_buffer(struct vp=
u_instance *inst)
>  		goto exit;
>  	}
> =20
>  	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
>  		ret =3D -EIO;
>  		goto exit;
>  	}
> =20
>  	ret =3D 0;
> =20
>  exit:
>  	kfree(reg);
>  	return ret;
>  }

[Severity: Low]
The cleanup subsystem guidelines strictly forbid mixing goto-based error
handling with scope-based cleanup helpers like guard() in the same function,
as it can create confusing ownership semantics. Could the dynamically
allocated reg object be managed using __free(kfree) to avoid manual goto
blocks?

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c b/dr=
ivers/media/platform/chips-media/wave6/wave6-vpuapi.c
> index 0000000000000..266885de92afd 100644
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
> @@ -42,16 +42,16 @@ int wave6_vpu_dec_close(struct vpu_instance *inst, u3=
2 *fail_res)
>  	if (WARN_ON(!inst->codec_info))
>  		return -EINVAL;
> =20
>  	guard(mutex)(&inst->dev->hw_lock);
> =20
>  	ret =3D wave6_vpu_dec_fini_seq(inst, fail_res);
>  	if (ret) {
>  		dev_warn(inst->dev->dev, "dec seq end timed out\n");
> =20
>  		return ret;
>  	}
> =20
>  	dev_dbg(inst->dev->dev, "dec seq end complete\n");
> =20
>  	kfree(inst->codec_info);
> =20
>  	return 0;
>  }

[Severity: Medium]
If hardware teardown in wave6_vpu_dec_fini_seq() fails and returns an
error, does this skip freeing the inst->codec_info struct?

[ ... ]

> @@ -233,16 +233,16 @@ int wave6_vpu_enc_close(struct vpu_instance *inst, =
u32 *fail_res)
>  	if (WARN_ON(!inst->codec_info))
>  		return -EINVAL;
> =20
>  	guard(mutex)(&inst->dev->hw_lock);
> =20
>  	ret =3D wave6_vpu_enc_fini_seq(inst, fail_res);
>  	if (ret) {
>  		dev_warn(inst->dev->dev, "enc seq end timed out\n");
> =20
>  		return ret;
>  	}
> =20
>  	dev_dbg(inst->dev->dev, "enc seq end complete\n");
>  	kfree(inst->codec_info);
> =20
>  	return 0;
>  }

[Severity: Medium]
Similarly, if wave6_vpu_enc_fini_seq() fails here, will it result in a
memory leak of inst->codec_info?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624072043.238-=
1-nas.chung@chipsnmedia.com?part=3D3
