Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668E4FD261
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739171; cv=none; b=Bs0lZfVPSrahvDpPZL/rO3HfsQuiAI+fEHt+VzqxrhkrnokVDAAZ1cX+9cXXV2gRyTHJYyFLRmFf9E/bo92oqbkP+W7Zr4CtzXLE0RT7X5CxqL+02/rKu1RbdTWiW261Yl2h/eyjpKGbZu2kmry8dNOOlu203b6VHqPkdnrodjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739171; c=relaxed/simple;
	bh=246rxNIC28aSEckdBScLDf9SAADjEJ6oWZVM/+3n3l8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FDKTNdSfKriR5FzkDLlmmk+5MORqvvrLZ6Qxd5F0/Rn/xOOX6u4PXMh959GEnbSa5jdp7XuNnr0/6BVkS8ceqS/aMCK/MfmU9c27eojbtX36C0EOjjjHm0vxTRU+Oi3s983XY6I8QCJjUN5xeLChvrV77K0g0vaezBb5TAaIfRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqyeOgLD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqyeOgLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A221F000FF;
	Fri, 18 Sep 2026 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739168;
	bh=RKlbQwsGidUmzvWWsWsInL9EEVXKveH9nKm+QpDwk1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SqyeOgLDy9/kUBrpCXp5p7cEmLXQ08oRkzNUV8WX3YWGzFLRKBXrfExGqYBShisFn
	 4PDtdi4SbboFOKz0NMqv6oCFRbZ98AuSmeNKgQAaEd/w2owAxmMs/3Z6EspQBrctFz
	 9D9PSoMl0FKTzBPoup3yX+mXelbpx+5tffkZE4PuCAC1ZMj1VOXxOxrK/WRKr8p+vT
	 5+fD3t1vw6M9vw0T1hcVatA3b1wks/oFwCk11Ya4iS1NEFpuwyg0chGiJ1JjVNnQkc
	 kYXNN32KUNQaAGweZW1S1ddjKCuP+IaptTgxxfGj8hfD/IXaS5VvogHHXQELoU9jbb
	 /e44jBRjcUS8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/14] media: apple: avd: add hevc support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-avd-v1-13-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-13-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:46:08 +0000
Message-Id: <20260918134608.80A221F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] media: apple: avd: fix stack buffer overflow in hevc tile comp=
utation
- [Critical] media: apple: avd: fix heap buffer overflow due to tile calcul=
ation underflow
- [Critical] media: apple: avd: fix DMA memory corruption due to integer ov=
erflow in sizing
- [High] media: apple: avd: fix out-of-bounds read via unvalidated collocat=
ed_ref_idx
- [High] media: apple: avd: add check for zero slices to prevent NULL deref=
erence
- [High] media: apple: avd: fix invalid free of uninitialized stack pointer=
s on error
- [High] media: apple: avd: fix division by zero and UB via unvalidated SPS=
 shift
- [High] media: apple: avd: fix arbitrary heap OOB read via unvalidated sli=
ce_segment_addr
- [High] media: apple: avd: fix stack out-of-bounds read due to unbounded p=
os increment
- [Medium] media: apple: avd: fix off-by-one out-of-bounds read in entry po=
int offsets
- [Medium] media: apple: avd: fix WPP decoding by properly handling entry p=
oint offsets
--

commit ffeb8047e5f921e7625c552fc61eb6bcdf4c0d7e
Author: Sofus Forstreuter <sofus.c@icloud.com>
Subject: media: apple: avd: add hevc support

This commit adds HEVC support to the Apple Video Decoder (AVD) driver.
It introduces avd-hevc.c and registers the necessary controls and pixel
formats in avd-v4l2.c.

> diff --git a/drivers/media/platform/apple/avd/avd-hevc.c b/drivers/media/=
platform/apple/avd/avd-hevc.c
> new file mode 100644
> index 0000000000000..d4815c031f7d4
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-hevc.c
[ ... ]
> @@ -563,6 +563,16 @@ static void stream_slice_mv(struct avd_ctx *ctx, str=
uct avd_hevc_run *run,
>  							      sl->ref_idx_l1;
> =20
>  	dst =3D vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
>  	ref =3D avd_get_ref_buf(
>  		ctx, &dst->base.vb,
>  		decode->dpb[ref_list[sl->collocated_ref_idx]].timestamp);

[Severity: High]
sl->collocated_ref_idx is a user-controlled __u8 (up to 255) from the V4L2
slice control. The core framework does not validate it against the number of
active references. In stream_slice_mv(), it indexes ref_list (a 15-element
array), leading to an out-of-bounds read. Could the resulting garbage byte
then be used to index decode->dpb, causing a secondary out-of-bounds read
from the dynamically allocated V4L2 control structure on the kernel heap?

[ ... ]
> @@ -647,6 +647,15 @@ static int submit_slice_segment(struct avd_ctx *ctx,=
 struct avd_hevc_run *run,
>  				bool hflip, bool vflip, u32 coded_flags,
>  				u32 last_tile_block)
>  {
>  	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
>  	u32 tb_x, tb_y, tile_block, tile_boundary;
> =20
>  	if (coded_flags & NEW_SLICE) {
>  		tb_x =3D sl->slice_segment_addr % pic_in_cts_width;

[Severity: High]
The user-controlled V4L2 SPS fields log2_diff_max_min_luma_coding_block_size
and log2_min_luma_coding_block_size_minus3 are not validated. If their sum
is 32 or greater, doesn't the shift "1 << sum" in avd_hevc_compute_tiles()
invoke undefined behavior (resulting in 0 on many architectures)? This would
cause max_cu_width to be 0, subsequently leading to a division by zero in
pic_in_ctbs_width or here when doing % pic_in_cts_width?

[ ... ]
>  	} else {
>  		tile_boundary =3D AVD_OP_SL_LOC_Y(row_bd[row]) |
>  				AVD_OP_SL_LOC_X(col_bd[col]);

[Severity: High]
pos counts the total number of slice segments and new tiles across all
submitted slices. With up to 600 slices and multiple entry points per slice,
pos can reach thousands. Since row is calculated as pos / num_cols without
validation in stream_slices(), could submit_slice_segment() use this to
access row_bd[row], leading to a large out-of-bounds read from the kernel
stack since row_bd is only a 23-element array?

[ ... ]
> @@ -732,8 +732,10 @@ static void compute_tiles_non_uniform(struct avd_hev=
c_run *run,
>  	int i;
> =20
>  	for (i =3D 0; i < pps->num_tile_columns_minus1; i++) {
>  		column_width[i] =3D pps->column_width_minus1[i] + 1;

[Severity: Critical]
pps->num_tile_columns_minus1 and pps->num_tile_rows_minus1 are
user-controlled fields up to 255. avd_hevc_try_ctrl() lacks validation for
these. Since col_width, row_height, col_bd, and row_bd are fixed-size stack
arrays of size 22 and 23, could untrusted input overflow these arrays on the
stack?

>  		sum +=3D column_width[i];
>  	}
>  	column_width[i] =3D pic_in_cts_width - sum;

[Severity: Critical]
sum accumulates user-provided V4L2 array values without validation. If sum
exceeds pic_in_cts_width, does the subtraction underflow? Assigning the
negative result to the u16 array column_width[i] would wrap it to a large
positive integer. When used in compute_tile_ids(), could this result in an
arbitrary heap buffer overflow?

> =20
>  	sum =3D 0;
>  	for (i =3D 0; i < pps->num_tile_rows_minus1; i++) {
>  		row_height[i] =3D pps->row_height_minus1[i] + 1;

[Severity: Critical]
Similarly to the above, could this overflow the 22-element row_height array?

[ ... ]
> @@ -751,2 +751,2 @@ static void compute_bd(struct avd_hevc_run *run, u32 =
*col_bd, u32 *row_bd,
>  	for (col_bd[0] =3D 0, i =3D 0; i <=3D pps->num_tile_columns_minus1; i++)
>  		col_bd[i + 1] =3D col_bd[i] + column_width[i];

[Severity: Critical]
Does this code also write directly into the stack-allocated col_bd array
using the unbounded user-controlled limit?

[ ... ]
> @@ -784,4 +784,4 @@ static void compute_tile_ids(struct avd_hevc_run *run=
, u32 pic_in_ctbs_width,
>  			for (y =3D row_bd[j]; y < row_bd[j + 1]; y++)
>  				for (x =3D col_bd[i]; x < col_bd[i + 1]; x++)
>  					tile_ids[ctb_addr_rs_to_ts
>  							 [y * pic_in_ctbs_width +
>  							  x]] =3D tile_idx;

[Severity: Critical]
As mentioned earlier, if the widths are corrupted due to underflow, could t=
he
loop limits rely on these corrupted widths, leading to an out-of-bounds read
followed by an out-of-bounds write here?

[ ... ]
> @@ -849,2 +849,2 @@ static void stream_slices(struct avd_ctx *ctx, struct=
 avd_hevc_run *run)
>  	for (s =3D 0; s < run->num_slices; s++) {
>  		sl =3D &run->sl[s];
>  		slice_segment_offset =3D 0;
>  		to =3D tiles_enabled ? sl->num_entry_point_offsets + 1 : 1;

[Severity: Medium]
Wavefront Parallel Processing (WPP) uses entry point offsets to parallelize
CTB rows but does not enable tiles. By forcing to =3D 1 when tiles_enabled =
is
false, aren't all WPP entry point offsets silently discarded, causing the
slice to be submitted as a single segment?

>  		/*
>  		 * since we are the only one using entry_point_offsets verify
>  		 * that we actually have enough.
>  		 */
>  		if (tiles_enabled &&
>  		    sl->num_entry_point_offsets + entry_point_idx >
>  			    run->num_entry_point_offsets + 1) {
>  			return;
>  		}

[Severity: Medium]
The bounds check allows the loop to proceed when the sum exactly equals
run->num_entry_point_offsets + 1. Because the loop consumes
sl->num_entry_point_offsets elements, wouldn't the final read inside the
loop access index run->num_entry_point_offsets, causing an out-of-bounds
read of exactly one element from the kernel heap?

[ ... ]
>  			if (tiles_enabled && to > 1) {
>  				if (i < sl->num_entry_point_offsets) {
>  					size =3D run->entry_point_offsets
>  						       [entry_point_idx++];

[Severity: Medium]
Is this where the out-of-bounds memory read physically occurs as a result
of the off-by-one check above?

[ ... ]
>  			tile_id =3D tile_info->tile_ids
>  					  [tile_info->ctb_addr_rs_to_ts
>  						   [sl->slice_segment_addr]];

[Severity: High]
The userspace-provided sl->slice_segment_addr is not validated against the
maximum number of coding tree blocks (pic_in_ctbs_size). When used as an
index into tile_info->ctb_addr_rs_to_ts, could a large value read an arbitr=
ary
32-bit value from the heap, which is then used as a secondary out-of-bounds
read into tile_info->tile_ids?

[ ... ]
>  			row =3D pos / num_cols;

[Severity: High]
Could this calculate a large index that later gets dereferenced on the
stack in submit_slice_segment(), as pos can reach thousands while row_bd
is only 23 elements long?

[ ... ]
> @@ -918,2 +918,4 @@ static void update_dec_buf_info(struct avd_decoded_bu=
ffer *buf,
>  static void update_dec_buf_info(struct avd_decoded_buffer *buf,
>  				const struct v4l2_ctrl_hevc_slice_params *sl)
>  {
>  	buf->hevc.is_intra =3D sl->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_I;

[Severity: High]
Could this dereference a potentially invalid or NULL slice pointer if
userspace submits a V4L2 job with an empty dynamic array for
V4L2_CID_STATELESS_HEVC_SLICE_PARAMS?

[ ... ]
> @@ -1006,2 +1006,3 @@ static int avd_hevc_alloc_scratch(struct avd_ctx *c=
tx, struct avd_hevc_run *run)
>  	ret =3D avd_buf_alloc(avd, &hevc_ctx->bufs.ip_above,
>  			    ((max_col * max_cu_width) / 4) * bit_depth);

[Severity: Critical]
max_col is derived from unvalidated tile column widths (which could be up to
~65535) and max_cu_width from SPS fields. Since the calculation uses signed
32-bit arithmetic, could a large max_col and max_cu_width overflow and wrap
to a small positive value, resulting in an undersized buffer being allocated
and handed to the hardware DMA engine?

[ ... ]
> @@ -1071,3 +1071,3 @@ static int avd_hevc_compute_tiles(struct avd_ctx *c=
tx, struct avd_hevc_run *run)
>  	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_size +
>  			     log2_min_cb_size);

[Severity: High]
If the unvalidated sum of these SPS fields is 32 or greater, doesn't this
shift invoke undefined behavior, causing max_cu_width to be 0 on many
architectures?

>  	pic_in_ctbs_width =3D (width + max_cu_width - 1) / max_cu_width;

[Severity: High]
Would this then perform a division by the corrupted max_cu_width, leading to
an arithmetic exception?

[ ... ]
>  	tile_info->ctb_addr_rs_to_ts =3D kzalloc_objs(
>  		*tile_info->ctb_addr_rs_to_ts, pic_in_ctbs_size, GFP_KERNEL);
>  	if (!tile_info->ctb_addr_rs_to_ts)
>  		return -ENOMEM;

[Severity: High]
If this allocation fails, it returns before initializing tile_info->tile_id=
s.
Since run is declared on the stack without zero initialization, won't the
error path in avd_hevc_run() pass uninitialized stack garbage to kfree()?

[ ... ]
> @@ -1242,4 +1242,4 @@ static int avd_hevc_run(struct avd_ctx *ctx)
>  {
>  	struct avd_hevc_run run;

[Severity: High]
The structure containing the pointers is allocated on the stack and never
entirely zeroed. Could this lead to invalid frees on error paths?

>  	struct avd_decoded_buffer *dst;
>  	int ret;
> =20
>  	ret =3D avd_hevc_run_preamble(ctx, &run);
>  	if (ret)
>  		return ret;
> =20
>  	dst =3D vb2_to_avd_decoded_buf(&run.base.bufs.dst->vb2_buf);
>  	update_dec_buf_info(dst, &run.sl[0]);

[Severity: High]
This unconditionally accesses the first slice element without verifying if =
any
slices were provided. If userspace submitted a job with an empty dynamic ar=
ray,
could this pass a NULL pointer to update_dec_buf_info()?

[ ... ]
>  done:
>  	kfree(run.tile_info.ctb_addr_rs_to_ts);
>  	kfree(run.tile_info.tile_ids);

[Severity: High]
Are uninitialized pointers blindly passed to kfree() on the error handling
path if kzalloc_objs() fails earlier?

> --- a/drivers/media/platform/apple/avd/avd-drv.c
> +++ b/drivers/media/platform/apple/avd/avd-drv.c
[ ... ]
>  static irqreturn_t avd_irq_handler(int irq, void *priv)
>  {
>  	struct avd_dev *avd =3D priv;
>  	struct avd_ctx *ctx =3D v4l2_m2m_get_curr_priv(avd->m2m_dev);

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under
review, but avd_irq_handler() reads ctx locklessly. If preempted, concurrent
teardown routines can invoke avd_job_finish(), clear the current context,
and free ctx. When the threaded IRQ handler resumes, could it dereference
the stale ctx pointer, causing a use-after-free?

[ ... ]
>  static int avd_release(struct file *file)
>  {
[ ... ]
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	kfree(ctx);

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under
review, but ctx is freed here without ensuring that the embedded
watchdog_work has been synchronously cancelled. If the watchdog completes t=
he
job and unblocks the release thread, could ctx be freed while the workqueue
is still processing the return from avd_watchdog_func(), leading to a
use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D13
