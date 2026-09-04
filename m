Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B793A872D
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505492; cv=none; b=QUiIDafWvyiPqD83oXFQuWtOiuELoOI8agBs+1XA1KrisXqPRR+lKRuCnghsJ6Z0/8XIQ0T82CXC7TSVGqCfWo6u4qysIy+tTeP/RrnJTFeT7DWeVAEHBo6yzxbwFw0UPZYRvCnS17sUBs8Hzpp2nL+jqk4vlLm7gAh7CgSZ0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505492; c=relaxed/simple;
	bh=lE2X9UAZSMQRP+wH/814ZJDgk+DidHYmp4IIQy4wBvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XF8Ek11gX6H9lBGQrYcG49K42vyAiCFzNbj+9N+T5g4N9HpwrW03eYuChsotDGfrqJwiD+eFa8gt+4w3nh2EnEABdoE4n6LF7fRXFlRw6GmIFlJEoAZXWppf4y92Wh+mumB1tjiz+Nz6wxWc347mEj24KlT1MRoxnmZgp7dNIKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyxSE15M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyxSE15M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A561F00A3D;
	Fri,  4 Sep 2026 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505490;
	bh=pTWmW3FsNMIpCxxNMpEGx6OhSLa+K4aOLoMHaG/Z3Uw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cyxSE15Mde9zQzKQQRTD51JU+kZc+EBsRiRqoP75dffu0UBTrfLlg2aywHaxMQKT0
	 fK+VcIvkcxpSlwIQvtTMboJ5VeHVJqgVuEyBxWeLA4OvVlr1suJqlnkswiu01jD9yv
	 /F69LHnVSX1pg8gHbYDIwIY2nA0hVfK5iI4AuIjp/mh22q6Ksw8rIGmcQHER1QmZQg
	 CyRmlP4z9wYKHnPsLKZE5jh058MccBy+a115R7SSbh2z+wkzehQHO7AtHU4HrB0n+T
	 cWvxmhy7C5qBTVCZ1f8MJFXyyQiBdnq1xrCD3O02TOpJwznM8wbD8OGdEuAkMbIYT7
	 GZmnZbhgcWiiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <39115ce2f3d9cc18350cddc650b7cb40317e5ef3.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <39115ce2f3d9cc18350cddc650b7cb40317e5ef3.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:04:50 +0000
Message-Id: <20260904070450.80A561F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Integer underflow when calculating end index for frame buffer regi=
stration causes out-of-bounds hardware configuration.
- [High] Encoder frame buffer registration fails to group configuration com=
mands, allowing array index overflow into adjacent MMIO registers.
- [Medium] Silent truncation of RGB chroma format due to mismatched bitmask.
- [Medium] Display buffers are silently ignored when the metadata array is =
full.
- [Medium] Hardcoded little-endian memory layout breaks compatibility with =
big-endian host architectures.
--

commit 5d00a062981a74f9de3d4d2750b7f43dba64822e
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 VPU interface

Add an interface layer to manage hardware register configuration and
communication with the Chips&Media Wave6 video codec IP.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/driver=
s/media/platform/chips-media/wave6/wave6-hw.c
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
> @@ -0,0 +1,2030 @@
[ ... ]
> +static void wave6_dec_set_display_buffer(struct vpu_instance *inst, stru=
ct frame_buffer fb)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int index;
> +
> +	for (index =3D 0; index < WAVE6_MAX_FBS; index++) {
> +		if (!p_dec_info->disp_buf[index].buf_y) {
> +			p_dec_info->disp_buf[index] =3D fb;
> +			p_dec_info->disp_buf[index].index =3D index;
> +			break;
> +		}
> +	}
> +}

[Severity: Medium]
WAVE6_MAX_FBS is defined as 31. If userspace requests and registers 32
buffers, what happens when this loop completes without finding an empty
slot?

Does this silently drop the tracking metadata for the buffer, leading to
failures later in wave6_vpu_dec_get_output_info() when it tries to match
the display buffer address?

[ ... ]
> +int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst)
> +{
[ ... ]
> +	fbc_remain =3D fbc_count;
> +	mv_remain =3D mv_count;
> +	group_num =3D DIV_ROUND_UP(max(fbc_count, mv_count), 16);
> +	for (i =3D 0; i < group_num; i++) {
> +		bool first_group =3D i =3D=3D 0;
> +		bool last_group =3D i =3D=3D group_num - 1;
> +		u32 set_fbc_num =3D (fbc_remain >=3D 16) ? 16 : fbc_remain;
> +		u32 set_mv_num =3D (mv_remain >=3D 16) ? 16 : mv_remain;
> +		u32 fbc_start_no =3D i * 16;
> +		u32 fbc_end_no =3D fbc_start_no + set_fbc_num - 1;
> +		u32 mv_start_no =3D i * 16;
> +		u32 mv_end_no =3D mv_start_no + set_mv_num - 1;

[Severity: High]
If either fbc_count or mv_count is initially 0, or if they are uneven
and one depletes before the other in subsequent loop iterations,
set_fbc_num or set_mv_num becomes 0.

Does this cause fbc_end_no or mv_end_no to underflow when subtracting 1,
sending invalid boundaries to the hardware?

[ ... ]
> +int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, str=
uct frame_buffer fb)
> +{
[ ... ]
> +	reg_val =3D SET_DISP_COMMON_PIC_INFO_BWB_ON |
> +		  SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(c_fmt_idc) |
> +		  SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING) |

[Severity: Medium]
When the format is RGB, get_chroma_format_idc() returns C_FMT_IDC_RGB
which evaluates to 4 (binary 100).

Since SET_DISP_COMMON_PIC_INFO_C_FMT_IDC uses a 2-bit mask, does this
silently truncate the value to 0 (C_FMT_IDC_YUV400) and misconfigure
the hardware for RGB displays?

[ ... ]
> +int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst)
> +{
[ ... ]
> +	for (idx =3D 0; idx < fbc_count; idx++) {
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y(idx), fb_arr[idx].buf_y);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C(idx), fb_arr[idx].buf_cb);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR(idx), fb_arr[idx].buf_cr=
);

[Severity: High]
Unlike the decoder buffer registration which batches commands into groups
of 16, this loop writes sequentially up to fbc_count.

If fbc_count exceeds 16, could this overflow past the 16 available MMIO
slots for W6_CMD_SET_FB_FBC_Y (and others) and corrupt adjacent hardware
registers like W6_CMD_SET_FB_DEFAULT_CDF?

[ ... ]
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b=
/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> @@ -0,0 +1,649 @@
[ ... ]
> +#define		SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(x)	FIELD_PREP(GENMASK(25, 24=
), (x))

[Severity: Medium]
As noted in wave6_vpu_dec_register_display_buffer(), this mask is only
2 bits wide. Could this be extended to correctly support C_FMT_IDC_RGB
(which requires at least 3 bits to store value 4)?

[ ... ]
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b=
/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> @@ -0,0 +1,72 @@
[ ... ]
> +#define HOST_ENDIAN			VDI_128BIT_LITTLE_ENDIAN
> +#define VPU_STREAM_ENDIAN		HOST_ENDIAN
> +#define VPU_USER_DATA_ENDIAN		HOST_ENDIAN
> +#define VPU_SOURCE_ENDIAN		HOST_ENDIAN

[Severity: Medium]
Does hardcoding the host endianness to VDI_128BIT_LITTLE_ENDIAN break
stream decoding and encoding on big-endian architectures?

Could this be set conditionally using standard kernel endianness macros
to support big-endian hosts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788496816.gi=
t.nas.chung@chipsnmedia.com?part=3D3
