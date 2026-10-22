Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648435;
	b=pt/koKSbkdQfMbq32Yfrhf+NyE8SMC3M9Np57TwNBWQeB/6aG9z+Nya7HIKbBS0CPyoY
	 p+F9ZCFHF6gx61RJ0EbgnXGTeoDzOZU5cy1pRvOWyRu3wH3syYeCxYRmNUZIOsYS+n1X2
	 XU4OseEL5R/xFGbe1i7Kdx+eH5VGzzGYovlY/Zq5bdA0oibGm8S/y3iy1nJH75hmV6aNb
	 QYdaKMwqELjZrPDpuiUDUzLSedQWsvXUHjzZYKUONkiCaqNfBRK984Ql4ySiUr0OZUA8c
	 SQTlnByKTy4l9TAbMRNQK358MiGj2QieYYu5QuiDB4jN+2ooIIvixQ8qH9ywxR89QVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648435;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1ElKY0kmh0e852o+L2kly0As0zw7JarN4pKMgpjOj1E=;
	b=tsSlU88M7y1M5WANJ2Lw+OL0+lDrCEcJUHGUknM/M1C8En3W7tKW6FJVHBoXwFRfXoOH
	 +XX+crACpi1FfkNoYOAK+Px/zNbvBRBHQircohQdTeLKs53tLmU487eVSKoBLciFE8k1S
	 Zcy5HT5SQJZzkeYFsmftcAa5Cxjevj/gUjyFx3lI6c7srfFQzByv62L6LtfZAKpEYjNg8
	 RMQ10T74sVPKMoOOpsFIyZ9XLqth4eqBh6j8zk9rdRi2x4YXSywfASx/5Vowgm2aKrpUR
	 eGtqUemh2EwiHZ7j2NOv72XrYeE6HLp31VjCBaA6BPaYQ01zecU9AsIiQlWjPP/Sz7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8FcSFW2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC01606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8FcSFW2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE181F000C1;
	Thu, 22 Oct 2026 05:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792648434;
	bh=1ElKY0kmh0e852o+L2kly0As0zw7JarN4pKMgpjOj1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8FcSFW2wQJgkXuUlgMnIup8ghcrfZ31+kbaWlTvwaRXwAhkOHqGITLYLQRBHK8qy
	 pSJvH9L8IsrsbVjcQdFYRVjsqf9mC+/jxxlW50u+Z0khtEV+FWPzj+CzK9EgBd47hb
	 cLu7TVRPiwOvibQ8Kl+wX8txX737TpH6iRwGk75+kbxJT5q/VwlrFBxR1S5Q7tNT+B
	 FXfGRWmllFSijw3YygJvriX5vZhA+t3hx4+nr001NzI9lqdDlLK1ElhHUHXQVBx5VL
	 xbB+PrHIrVx2KebiAfInJXSRHceCH5ApYdt+mm5U0/juzslhOXIQZcXeLa4kUmReWj
	 VNsFf6DmIeG1w==
Message-ID: <sashiko-outbox-181043@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/6] arm64: defconfig: Enable
 CONFIG_VIDEO_AMLOGIC_VDEC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, media-ci@linuxtv.org
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-6-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-6-616240978792@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 05:53:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] media: amlogic: vdec: unchecked ref_list bounds and canvas lif=
ecycle in h264
- [High] media: amlogic: vdec: aml_vdec_init_dec_inst() returns -1 on outpu=
t restart
- [High] media: amlogic: vdec: check DPB entry flags in poc_is_in_dpb() and=
 get_dpb_by_poc()
- [High] media: amlogic: vdec: out-of-bounds SPS workspace write in h264_co=
nfig_params()
- [High] media: amlogic: vdec: ignored pm-domain error, unenabled clk, earl=
y vdev reg
- [High] media: amlogic: vdec: wrong IS_ERR() check on meson_sm_get() return
- [Medium] media: amlogic: vdec: uninitialized pic_info, prematuresizeimage=
 calc, and split locks
- [Medium] media: amlogic: vdec: missing error unwind and propagation in vd=
ec_poweron()
- [Low] media: amlogic: vdec: missing select REGMAP_MMIO in Kconfig
--

commit 05491c1c72b85040b071b152b79a908d403d95f0
Author: Zhentao Guo <zhentao.guo@amlogic.com>

arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC

This commit enables the Amlogic V4L2 stateless video decoder driver
(CONFIG_VIDEO_AMLOGIC_VDEC=3Dm) as a module in the arm64 defconfig for
Amlogic SoCs such as the S4 (S805X2) platform.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7b4985b29b21c..f00c8a418a464 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -929,6 +929,7 @@ CONFIG_USB_VIDEO_CLASS=3Dm
>  CONFIG_V4L_PLATFORM_DRIVERS=3Dy
>  CONFIG_SDR_PLATFORM_DRIVERS=3Dy
>  CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> +CONFIG_VIDEO_AMLOGIC_VDEC=3Dm

[Severity: Critical]
Can h264_config_ref_lists() and h264_reorder_reflists() in
drivers/media/platform/amlogic/vdec/h264.c overflow ref_list0 and ref_list1
and leak meson_canvas indices?

First, in struct aml_h264_ctx, ref_list0 and ref_list1 are sized to
V4L2_H264_NUM_DPB_ENTRIES + 1 (17 elements). However, in
h264_config_ref_lists(), v4l2_h264_init_reflist_builder() sets
builder.num_valid up to V4L2_H264_REF_LIST_LEN (32) when
V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC is set in decode->flags, and passes
builder.num_valid as list_size to config_p_reflist() and config_b_reflist():

drivers/media/platform/amlogic/vdec/h264.c:config_p_reflist() {
	for (i =3D 0; i < list_size; i++) {
		index =3D v4l2_p0_reflist[i].index;
		h264_ctx->ref_list0[i].used =3D 1;
		...
	}
}

Won't list_size > 17 write past the end of ref_list0 and ref_list1 in
config_p_reflist() and config_b_reflist(), as well as in the loops using
h264_ctx->list_size[] in h264_config_decode_spec(), get_canvas_index(), and
h264_release_decode_spec()?

Second, when all 16 dpb entries are active and num_ref_idx_lx_active is 16,
reorder_short_term() and reorder_long_term() shift ref_list_reordered[15] i=
nto
the sentinel slot ref_list_reordered[16] without clearing the sentinel
afterward:

drivers/media/platform/amlogic/vdec/h264.c:reorder_short_term() {
	for (c_idx =3D num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
		memcpy(&ref_list_reordered[c_idx], &ref_list_reordered[c_idx - 1],
		       sizeof(struct h264_decode_buf_spec));
	...
	h264_ctx->list_size[cur_list] =3D num_ref_idx_lx_active;
}

Since get_refidx_by_picnum(), get_st_refpic_by_num(), and
get_lt_refpic_by_num() iterate until ref_list[i].dpb is NULL with no upper
bound on i:

drivers/media/platform/amlogic/vdec/h264.c:get_refidx_by_picnum() {
	for (i =3D 0; ref_list[i].dpb; i++) {
		if (pic_num =3D=3D ref_list[i].dpb->pic_num)
			return i;
	}
}

can overwriting ref_list[16].dpb cause these helpers to read past the end of
ref_list0 and ref_list1 on subsequent reordering commands?

Third, reorder_short_term() and reorder_long_term() overwrite
h264_ctx->list_size[cur_list] with num_ref_idx_lx_active. In
get_canvas_index(), config_decode_canvas() is called for every entry below
list_size without checking buf->used or buf->valid, while
h264_release_decode_spec() only calls release_canvas_index() when buf->used=
 is
non-zero:

drivers/media/platform/amlogic/vdec/h264.c:get_canvas_index() {
	if (h264_ctx->list_size[0] > 0) {
		for (i =3D 0; i < h264_ctx->list_size[0]; i++) {
			buf =3D &h264_ctx->ref_list0[i];
			ret =3D config_decode_canvas(hw, buf, h264_ctx->mb_width,
						   h264_ctx->mb_height);
			...
		}
	}
}

drivers/media/platform/amlogic/vdec/h264.c:h264_release_decode_spec() {
	if (h264_ctx->list_size[0] > 0) {
		for (i =3D 0; i < h264_ctx->list_size[0]; i++) {
			buf =3D &h264_ctx->ref_list0[i];
			buf->valid =3D 0;
			if (buf->used) {
				buf->dpb =3D NULL;
				release_canvas_index(hw, buf);
				buf->used =3D 0;
			}
		}
		h264_ctx->list_size[0] =3D 0;
	}
}

If num_ref_idx_lx_active is larger than the initial list_size, won't
get_canvas_index() allocate meson canvases for entries with buf->used =3D=
=3D 0
that h264_release_decode_spec() never frees, and if num_ref_idx_lx_active is
smaller, won't entries above the new list_size retain stale state?

[Severity: High]
What happens in drivers/media/platform/amlogic/vdec/aml_vdec.c when the out=
put
queue is stopped and restarted while the capture queue remains streaming?

When a client stops the output queue via vb2ops_vdec_stop_streaming() while
ctx->is_cap_streamon is still set, aml_vdec_release_instance() is not called
and ctx->codec_priv remains non-NULL:

drivers/media/platform/amlogic/vdec/aml_vdec.c:vb2ops_vdec_stop_streaming()=
 {
	if (!ctx->is_output_streamon && !ctx->is_cap_streamon)
		aml_vdec_release_instance(ctx);
}

When the output queue is subsequently restarted, vb2ops_vdec_start_streamin=
g()
calls aml_vdec_init_dec_inst(), which initializes ret to -1 and skips
ctx->codec_ops->init(ctx) because ctx->codec_priv is already allocated:

drivers/media/platform/amlogic/vdec/aml_vdec.c:aml_vdec_init_dec_inst() {
	int ret =3D -1;
	...
	if (ctx->codec_ops->init && !ctx->codec_priv) {
		ret =3D ctx->codec_ops->init(ctx);
		if (ret < 0)
			return ret;
	}
	ctx->curr_dec_type =3D fmt_out->codec_type;
	...
	return ret;
}

Because ret stays -1, vb2ops_vdec_start_streaming() treats the call as a
failure, returns all queued source buffers via v4l2_m2m_src_buf_remove() and
v4l2_m2m_buf_done(), and fails VIDIOC_STREAMON with -EINVAL:

drivers/media/platform/amlogic/vdec/aml_vdec.c:vb2ops_vdec_start_streaming(=
) {
		if (aml_vdec_init_dec_inst(ctx) < 0) {
			while ((src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_QUEUED);
			return -EINVAL;
		}
}

Should ret be initialized to 0 in aml_vdec_init_dec_inst() so restarting the
output queue succeeds when ctx->codec_priv is already present?

[Severity: High]
Should poc_is_in_dpb() and get_dpb_by_poc() in
drivers/media/platform/amlogic/vdec/h264.c check whether a dpb entry is act=
ive
before matching top_field_order_cnt?

During H264_SLICE_HEADER_DONE handling in
h264_threaded_isr_func()->h264_config_decode_spec()->clear_unused_col_buf(),
poc_is_in_dpb() is called to decide whether to release colocated_buf and
canvas_pos slots:

drivers/media/platform/amlogic/vdec/h264.c:poc_is_in_dpb() {
	for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
		if (poc =3D=3D dpb[i].top_field_order_cnt) {
			ret =3D 1;
			break;
		}
	}
}

Because decode->dpb has 16 fixed entries and poc_is_in_dpb() does not check
dpb[i].flags for V4L2_H264_DPB_ENTRY_FLAG_ACTIVE (or
V4L2_H264_DPB_ENTRY_FLAG_VALID), any unused zeroed dpb entry has
top_field_order_cnt =3D=3D 0, causing poc_is_in_dpb(0, decode->dpb) to alwa=
ys
return 1 and leak the colocated_buf and canvas_pos slots for poc 0 in
clear_unused_col_buf():

drivers/media/platform/amlogic/vdec/h264.c:clear_unused_col_buf() {
	for (i =3D 0; i < h264_ctx->colocated_buf_num; i++) {
		if (!((h264_ctx->colocated_buf_map >> i) & 0x1))
			continue;
		col_poc =3D h264_ctx->colocated_buf_poc[i];
		if (poc_is_in_dpb(col_poc, decode->dpb) !=3D 1)
			release_colocate_buf(h264_ctx, i);
	}

	for (i =3D 0; i < (V4L2_H264_NUM_DPB_ENTRIES + 1); i++) {
		if (!((h264_ctx->canvas_pos_map >> i) & 0x1))
			continue;
		col_poc =3D h264_ctx->ref_canvas[i].poc;
		if (poc_is_in_dpb(col_poc, decode->dpb) !=3D 1)
			release_canvas_pos(h264_ctx, i);
	}
}

Similarly, if userspace clears flags on retired dpb entries without zeroing
top_field_order_cnt, their colocated_buf and canvas_pos slots are never fre=
ed
until all slots are exhausted.

In addition, h264_config_decode_buf() looks up reference entries with
get_dpb_by_poc():

drivers/media/platform/amlogic/vdec/h264.c:get_dpb_by_poc() {
	for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
		if (decode->dpb[i].top_field_order_cnt =3D=3D poc)
			return &decode->dpb[i];
	}
	return NULL;
}

drivers/media/platform/amlogic/vdec/h264.c:h264_config_decode_buf() {
			dpb =3D get_dpb_by_poc(decode, poc);
			if (dpb && (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) {
}

If an earlier inactive dpb slot has the same top_field_order_cnt as a later
active dpb slot (for instance, an unused zeroed slot before an active poc 0
entry), won't get_dpb_by_poc() return the inactive slot and cause
h264_config_decode_buf() to skip writing the active reference frame's info
into H264_BUFFER_INFO_DATA?

[Severity: High]
Can a userspace V4L2_CID_STATELESS_H264_SPS control with
sps->seq_parameter_set_id >=3D 32 cause an out-of-bounds write in
h264_config_params() in drivers/media/platform/amlogic/vdec/h264.c?

In drivers/media/v4l2-core/v4l2-ctrls-core.c, std_validate_compound() does =
not
validate that p_h264_sps->seq_parameter_set_id is within 0..31, and
aml_vdec_ctrls_setup() in drivers/media/platform/amlogic/vdec/aml_vdec.c do=
es
not provide custom validation. When aml_h264_dec_run() calls
h264_config_params()->config_sps_params(), p_sps_base is calculated directly
from sps->seq_parameter_set_id (a u8 up to 255):

drivers/media/platform/amlogic/vdec/h264.c:h264_config_params() {
	p_sps_base =3D (unsigned short *)(h264_ctx->workspace_vaddr +
		MEM_SPS_BASE + sps->seq_parameter_set_id * 0x400);
	p_pps_base =3D (unsigned short *)(h264_ctx->workspace_vaddr +
		MEM_PPS_BASE + pps->pic_parameter_set_id * 0x200);
}

drivers/media/platform/amlogic/vdec/h264.c:config_sps_params() {
	memset(sps_base, 0, 0x100);
	memset(data_tmp, 0, sizeof(data_tmp));
}

Since MEM_SPS_BASE (0x01c3c00) to MEM_PPS_BASE (0x01cbc00) only has room for
32 entries of 0x400 bytes, won't seq_parameter_set_id >=3D 32 cause
config_sps_params() to overwrite the MEM_PPS_BASE table and adjacent regions
of h264_ctx->workspace_vaddr?

[Severity: High]
Could drivers/media/platform/amlogic/vdec/aml_vdec_hw.c and
drivers/media/platform/amlogic/vdec/aml_vdec_drv.c access unclocked or
unpowered DOS_BUS registers if power domain attachment fails or before
vdec_enable() runs?

In pm_vdec_power_domain_init(), errors from dev_pm_domain_attach_by_name()
(including -EPROBE_DEFER) are ignored and pd[i].dev is set to NULL:

drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:pm_vdec_power_domain_init=
() {
		pd[i].dev =3D dev_pm_domain_attach_by_name(hw->dev, pd[i].name);
		if (IS_ERR_OR_NULL(pd[i].dev)) {
			err =3D PTR_ERR(pd[i].dev);
			dev_dbg(hw->dev, "Get %s failed, pm-domain: %d\n",
				pd[i].name, err);
			pd[i].dev =3D NULL;
			continue;
		}
}

When pd_data[core].dev is NULL, vdec_poweron() skips hw->pm->power_on(hw, c=
ore)
and leaves both the vdec power domain and vdec clock disabled, so subsequent
DOS_BUS register accesses in m2mops_vdec_device_run()->dos_enable() can
trigger a synchronous external abort:

drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:vdec_poweron() {
	mutex_lock(&hw->pm_mutex);
	if (!hw->pm->pd_data[core].dev)
		goto out;
	...
	hw->pm->power_on(hw, core);
}

In addition, vdec_clock_gate_init() acquires the dos clock in
hw->gates[CLK_DOS]:

drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:vdec_clock_gate_init() {
	hw->gates[CLK_DOS].id =3D "dos";
	hw->gates[CLK_VDEC].id =3D "vdec";
	hw->gates[CLK_HVDEC].id =3D "hvdec";

	return devm_clk_bulk_get(hw->dev, CLK_MAX, hw->gates);
}

Yet pm_vdec_power_domain_power_on() only enables vdec and hvdec and never
enables hw->gates[CLK_DOS].clk.

Furthermore, in aml_vdec_drv_probe() in
drivers/media/platform/amlogic/vdec/aml_vdec_drv.c, video_register_device()=
 is
called before dev->v4l2_dev.mdev is initialized and before
vdec_enable(dev->dec_hw) is called:

drivers/media/platform/amlogic/vdec/aml_vdec_drv.c:aml_vdec_drv_probe() {
	ret =3D video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
	if (ret) {
		v4l2_err(&dev->v4l2_dev, "Failed to register video device");
		goto err_vid_dev_register;
	}

	dev->mdev.dev =3D &pdev->dev;
	strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
	media_device_init(&dev->mdev);
	dev->mdev.ops =3D &aml_m2m_media_ops;
	dev->v4l2_dev.mdev =3D &dev->mdev;
	...
	vdec_enable(dev->dec_hw);
}

Should pm_vdec_power_domain_init() propagate errors from
dev_pm_domain_attach_by_name(), should CLK_DOS be enabled before accessing
DOS_BUS registers, and should vdec_enable() and media_device_init() run bef=
ore
video_register_device() publishes the device node?

[Severity: High]
Why does dev_request_hw_resources() in
drivers/media/platform/amlogic/vdec/aml_vdec_hw.c check meson_sm_get() with
IS_ERR() instead of checking for NULL?

In drivers/firmware/meson/meson_sm.c, meson_sm_get() returns NULL when the
secure-monitor device is missing or has not finished probing:

drivers/firmware/meson/meson_sm.c:meson_sm_get() {
	if (!pdev)
		return NULL;

	fw =3D platform_get_drvdata(pdev);

	put_device(&pdev->dev);

	return fw;
}

However, dev_request_hw_resources() only checks IS_ERR(hw->sec_fw):

drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:dev_request_hw_resources(=
) {
	hw->sec_fw =3D meson_sm_get(sm_np);
	of_node_put(sm_np);
	if (IS_ERR(hw->sec_fw))
		return PTR_ERR(hw->sec_fw);
}

If meson_sm_get() returns NULL, probe succeeds with hw->sec_fw =3D=3D NULL,=
 and
when a decode job runs m2mops_vdec_device_run()->load_firmware() in
drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c:

drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c:load_firmware() {
	meson_sm_call(hw->sec_fw, SM_LOAD_VIDEO_FW, &ret,
		      video_fw->fw_format, video_fw->core,
		      video_fw->is_swap, 0, 0);
}

won't meson_sm_call() dereference a NULL hw->sec_fw pointer instead of probe
returning -EPROBE_DEFER?

[Severity: Medium]
Are ctx->pic_info, plane_fmt[0].sizeimage, and the format/queue locks in
drivers/media/platform/amlogic/vdec/aml_vdec.c initialized in the right ord=
er?

First, when a file handle is opened, fops_vcodec_open()->aml_vdec_reset_fmt=
s()
calls reset_output_fmts(), which sets ctx->pix_fmt[AML_FMT_SRC] without
calling set_pic_info():

drivers/media/platform/amlogic/vdec/aml_vdec.c:reset_output_fmts() {
	vdec_try_fmt_mp(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, &fmt,
			out_fmt);

	ctx->pix_fmt[AML_FMT_SRC] =3D fmt;
}

If userspace starts streaming with the default format without calling
VIDIOC_S_FMT on V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, ctx->pic_info.fb_size[0]
remains 0, so h264_config_decode_spec() and h264_config_ref_spec() in
drivers/media/platform/amlogic/vdec/h264.c set c_dma_addr equal to y_dma_ad=
dr
for single-planar capture formats:

drivers/media/platform/amlogic/vdec/h264.c:h264_config_decode_spec() {
	h264_ctx->curr_spec.y_dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
	if (ctx->pix_fmt[AML_FMT_DST].num_planes > 1)
		h264_ctx->curr_spec.c_dma_addr =3D
		    vb2_dma_contig_plane_dma_addr(vb, 1);
	else
		h264_ctx->curr_spec.c_dma_addr =3D
		    h264_ctx->curr_spec.y_dma_addr + ctx->pic_info.fb_size[0];
}

Second, in vdec_try_fmt_mp(), plane_fmt[0].sizeimage for the output queue is
computed from pix_mp->height and pix_mp->width before ALIGN() and
v4l2_apply_frmsize_constraints() clamp and align them:

drivers/media/platform/amlogic/vdec/aml_vdec.c:vdec_try_fmt_mp() {
	if (V4L2_TYPE_IS_OUTPUT(type)) {
		pix_mp->num_planes =3D dec_fmt->num_planes;
		pix_mp->pixelformat =3D dec_fmt->fourcc;
		if (!pix_mp->plane_fmt[0].sizeimage)
			pix_mp->plane_fmt[0].sizeimage =3D
			    (pix_mp->height * pix_mp->width * 3) / 2;
		pix_mp->height =3D ALIGN(pix_mp->height, align);
		pix_mp->width =3D ALIGN(pix_mp->width, align);
	} else {
		...
	}

	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
				       &dec_fmt->stepwise);
}

If userspace passes width =3D=3D 0 or height =3D=3D 0 with sizeimage =3D=3D=
 0, sizeimage
remains 0 even after width and height are clamped to the minimum frame size.

Third, aml_vdec_reset_fmts() and aml_vdec_queue_init() set
ctx->m2m_ctx->q_lock, src_vq->lock, and dst_vq->lock to &ctx->v4l2_intf_loc=
k,
whereas aml_vdec_drv_probe() sets vfd_dec->lock to &dev->dev_mutex:

drivers/media/platform/amlogic/vdec/aml_vdec.c:aml_vdec_reset_fmts() {
	ctx->m2m_ctx->q_lock =3D &ctx->v4l2_intf_lock;
	reset_output_fmts(ctx);
	reset_capture_fmts(ctx);
}

Doesn't using two different mutexes allow VIDIOC_S_FMT and VIDIOC_G_FMT to
race with queue ioctls such as VIDIOC_REQBUFS, VIDIOC_QBUF, and
VIDIOC_STREAMON?

[Severity: Medium]
What happens in drivers/media/platform/amlogic/vdec/aml_vdec_hw.c when
pm_runtime_resume_and_get() or clk_prepare_enable() fails during
vdec_poweron()?

In pm_vdec_power_domain_power_on(), if clk_prepare_enable(gate_node->clk)
succeeds and pm_runtime_resume_and_get(dev) fails, gate_node->clk is not
disabled and unprepared, and the error is not returned to the caller:

drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:pm_vdec_power_domain_powe=
r_on() {
	if (gate_node) {
		ret =3D clk_prepare_enable(gate_node->clk);
	...
	if (!ret && dev) {
		ret =3D pm_runtime_resume_and_get(dev);
		if (ret < 0)
			dev_err(hw->dev, "failed to power on %s domain: %d\n",
				pm->pd_data[id].name, ret);
	...
	if (!ret)
		dos_local_config(hw, 1, id);
}

Because vdec_poweron() increments hw->pm->pd_data[core].ref_count before
calling hw->pm->power_on(hw, core) and vdec_enable() always returns 0 to
aml_vdec_drv_probe():

drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:vdec_poweron() {
	hw->pm->pd_data[core].ref_count++;
	if (hw->pm->pd_data[core].ref_count > 1)
		goto out;

	hw->pm->power_on(hw, core);
}

when aml_vdec_drv_remove() later calls
vdec_disable()->vdec_poweroff()->pm_vdec_power_domain_power_off():

drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:pm_vdec_power_domain_powe=
r_off() {
	dos_local_config(hw, 0, id);

	if (dev) {
		pm_runtime_put_sync(dev);
}

won't pm_vdec_power_domain_power_off() access unpowered DOS_BUS registers in
dos_local_config(hw, 0, id) and cause unbalanced pm_runtime_put_sync() and
clk_disable_unprepare() calls?

[Severity: Low]
Should VIDEO_AMLOGIC_VDEC in drivers/media/platform/amlogic/vdec/Kconfig
select REGMAP_MMIO?

In drivers/media/platform/amlogic/vdec/aml_vdec_hw.c,
dev_request_hw_resources() initializes regmaps via devm_regmap_init_mmio():

drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:dev_request_hw_resources(=
) {
		if (i =3D=3D DOS_BUS) {
			hw->map[i] =3D devm_regmap_init_mmio(&pdev->dev, reg_base[i],
							   &dos_regmap_conf);
		} else if (i =3D=3D DMC_BUS) {
			hw->map[i] =3D devm_regmap_init_mmio(&pdev->dev, reg_base[i],
							   &dmc_regmap_conf);
		}
}

However, VIDEO_AMLOGIC_VDEC in drivers/media/platform/amlogic/vdec/Kconfig
does not select REGMAP_MMIO:

drivers/media/platform/amlogic/vdec/Kconfig: {
config VIDEO_AMLOGIC_VDEC
    tristate "Amlogic Video Decoder Driver"
    ...
    select VIDEOBUF2_DMA_CONTIG
    select V4L2_H264
    select V4L2_MEM2MEM_DEV
    select MESON_CANVAS
}

Could configurations enabling CONFIG_VIDEO_AMLOGIC_VDEC without another dri=
ver
selecting CONFIG_REGMAP_MMIO fail to build or link?

>  CONFIG_VIDEO_AMPHION_VPU=3Dm
>  CONFIG_VIDEO_CADENCE_CSI2RX=3Dm
>  CONFIG_VIDEO_WAVE_VPU=3Dm

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-b4-s4-vdec=
-upstream-v12-0-616240978792@amlogic.com?part=3D6
