Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960009;
	b=cNqZVoqv4sRrsUJG913BGeMDua2BU0/TNHl1sOvegGJQCsoO6tlVseMhURfzYUhMo15A
	 cJSTy4uBdkjGn621chfN1n/QGhdvHrUs8qoJiYcgkdX5x45pf6sxlLO4ssqhP+GBjWXRz
	 O4/HrmO0rD2lLmgZjgnUnyYjHbheLlCg5W3HholTHtEhYnIgjmKgURnWwCuCqQ7hKknyf
	 Km6ZzTYpsnC75TVo9vjrcYFQZT+LRaxhyCmuTeDh9HorSw6+7FO7Cm9Vhde0g4IFrvMKa
	 HQfuLuZJRJw92bDGl87kkFj6pjINkndH82CIeZpyB1CK6SZqzqVlvz93Y2R3dWm2N1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960009;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vGtMHIQT0AmVDrZaIKlwqAZiaYddatsDoOvXDdq+810=;
	b=zgS0cIif5tnfjFPlAv9axJV2BJNbUuKPGJuTbQxieviV0vToFDEehEmZREmfz94MH2XT
	 Utj/xosxvnbpBXEIdvvNfyenX66o1EvizERCUGLq26HUkevR44UfoCo1KsNTS+3Z3q1Ec
	 EgR1m78UkvhW7KpZpemK4fiXOzxGrZpT7sG1VBcsdmqN3dFFFSS4mtW6ifZkqOw213yS9
	 MSytUBSee/6MptPg3p2r40tE5pRXD1LC+/Qxx39RhdURJhnM5t7r3F4gd6ISn5WeHqy59
	 amRAm+s15+0glBg95OXR4v+7SknLcIHFM9a9SziLhbETghb/0kMiugR8xZcOmnlH3zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NtbSJfdE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D29606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NtbSJfdE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DAE1F01825;
	Sun, 25 Oct 2026 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792960008;
	bh=vGtMHIQT0AmVDrZaIKlwqAZiaYddatsDoOvXDdq+810=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NtbSJfdE3HjIusXFjUZX9aKcHMygl5jdUtV+M+oEX/rS0e3MO0fbQHxBZfdGbTDNG
	 LQYdZnpLcUh8+J0AtKLeOqyjNjcb4nyeWjAV/aBBfzcEYC6GNcEDVy2/TriqQL8rMS
	 ievQ/xO8jNJncOpLE103XVef/u7A3JxV+nxEFuZflVFa2NdbdzpIXAZGHdkN6dY4Sm
	 Chr+pLIG1N0YYAz0l7SLYuJ07YuFHn0X7dFOGX6Jc/OljOqneGQIhEGkZfZvXSCqKd
	 LLNxBzXjF+TrVWxqMORkhXj2sd329eXsgbuQtC2rsv/zk3gaVzn8McijdXAYT0AiwK
	 14pPyboc6RtkQ==
Message-ID: <sashiko-outbox-184427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/11] media: amlogic: vdec: add HEVC decoding on the
 HEVC core
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261025192507.210058-10-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-10-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:26:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [Critical] media: amlogic: vdec: CAPTURE overflow in h265_config_sao() an=
d h265_copy_out()
- [Critical] media: amlogic: vdec: MMU map truncation in h265_fill_mmu_map(=
) above 2304p
- [Critical] media: amlogic: vdec: unvalidated non-first slice state in h26=
5_slice_header()
- [Critical] media: amlogic: vdec: unsynchronized IRQ teardown in aml_hevc_=
exit()
- [High] media: amlogic: vdec: V4L2_PIX_FMT_HEVC_SLICE lacks stateless HEVC=
 controls
- [High] media: amlogic: vdec: OOB read and invalid tile sizes in h265_upda=
te_tiles()
- [High] media: amlogic: vdec: shift overflow and broken POC math in h265_s=
lice_header()
- [High] media: amlogic: vdec: DPB slot leak on IDR pictures in h265_apply_=
rps()
- [High] media: amlogic: vdec: swap buffers not programmed in h265_config_w=
orkspace()
- [High] media: amlogic: vdec: freed DMA addresses left active on slice hea=
der error
- [High] media: amlogic: vdec: timeout recovery and IRQ race in aml_hevc_de=
c_run()
- [High] media: amlogic: vdec: premature job completion in h265_finish() fr=
om IRQ thread
- [High] media: amlogic: vdec: NULL deref in aml_hevc_dec_run() after CAPTU=
RE restart
- [Medium] media: amlogic: vdec: skipped tile init on same POC in h265_slic=
e_header()
--

commit 6edd9c45f2e4b6fa27b412395f4321725272a652
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

media: amlogic: vdec: add HEVC decoding on the HEVC core

This commit adds HEVC Main and Main 10 decoding support up to 4K on the
Amlogic S4 HEVC hardware core. It registers the V4L2_PIX_FMT_HEVC_SLICE
format, manages workspace and DPB picture buffers, and configures the
hardware decoder per slice from the microcode RPM parameter block.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> index f1696aa2fac53..ee020a62836fc 100644
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c

[ ... ]

> @@ -112,7 +113,19 @@ static const struct aml_vdec_v4l2_ctrl controls[] =
=3D {
>  		.cfg =3D {
>  			.id =3D V4L2_CID_STATELESS_MPEG2_QUANTISATION,
>  		},
> -	},};
> +	}, {
> +		.codec_type =3D CODEC_TYPE_HEVC,
> +		.cfg =3D {
> +			.id =3D V4L2_CID_AML_HEVC_REFS,
> +			.name =3D "HEVC Reference Lists",
> +			.type =3D V4L2_CTRL_TYPE_INTEGER,
> +			.min =3D S32_MIN,
> +			.max =3D S32_MAX,
> +			.step =3D 1,
> +			.dims =3D { AML_HEVC_REFS_LEN },
> +		},
> +	}
> +};

[Severity: High]
In drivers/media/platform/amlogic/vdec/aml_vdec_platform.c,
aml_s4_video_formats[] advertises V4L2_PIX_FMT_HEVC_SLICE:

	{
		.name =3D "HEVC",
		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
		.type =3D AML_FMT_DEC,
		...
		.codec_type =3D CODEC_TYPE_HEVC,

However, controls[] in drivers/media/platform/amlogic/vdec/aml_vdec.c only
registers the private V4L2_CID_AML_HEVC_REFS control (defined in
drivers/media/platform/amlogic/vdec/hevc.h as V4L2_CID_USER_BASE + 0x1f01)
and omits the standard V4L2 stateless HEVC controls
(V4L2_CID_STATELESS_HEVC_SPS, V4L2_CID_STATELESS_HEVC_PPS,
V4L2_CID_STATELESS_HEVC_DECODE_PARAMS, V4L2_CID_STATELESS_HEVC_SLICE_PARAMS,
V4L2_CID_STATELESS_HEVC_SCALING_MATRIX, V4L2_CID_STATELESS_HEVC_DECODE_MODE,
and V4L2_CID_STATELESS_HEVC_START_CODE).

In addition, although the commit description states that the access unit is
rebuilt in Annex-B form with VPS, SPS, and PPS from the stateless controls,
aml_hevc_dec_run() passes the raw OUTPUT buffer directly to h265_feed(), and
h265_irq_thread() under H265_NAL_SEARCH_DONE discards coded slices with
H265_DISCARD_NAL until in-band H265_NAL_VPS, H265_NAL_SPS, and H265_NAL_PPS
NAL units have been seen in the bitstream:

	case H265_NAL_SEARCH_DONE: {
		int nal =3D read_dos_reg(hw, H265_CUR_NAL_UNIT_TYPE);
		u32 parse =3D H265_DISCARD_NAL;
		...
		} else if (h->have_vps && h->have_sps && h->have_pps && nal <=3D H265_NAL=
_CRA) {

How can standard V4L2 stateless HEVC clients drive V4L2_PIX_FMT_HEVC_SLICE
without the stateless HEVC controls and Annex-B header reconstruction, or
was this intended to use the stateless controls rather than in-band paramet=
er
sets and a driver-private control?

> diff --git a/drivers/media/platform/amlogic/vdec/hevc.c b/drivers/media/p=
latform/amlogic/vdec/hevc.c
> new file mode 100644
> index 0000000000000..6d9f457436cfd
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/hevc.c
> @@ -0,0 +1,1728 @@

[ ... ]

> +static int h265_alloc_pics(struct aml_hevc_ctx *h)
> +{
> +	struct device *dev =3D h->hw->dev;
> +	u32 w =3D h->pic_w, ht =3D h->pic_h;
> +	size_t body =3D ALIGN(h265_comp_body_size(w, ht, h->ten_bit), PAGE_SIZE=
);
> +	/* Size the MV buffers for the smallest LCU, so they fit any. */
> +	size_t mv =3D h265_mv_buf_size(w, ht, 16);
> +	size_t hdr =3D h265_hdr_alloc_size(w, ht);
> +	size_t dw =3D h->dw_target_y ? 0 : ALIGN(w * ht * 3 / 2, SZ_64K);
> +	int i;
> +
> +	if (h->alloc_w =3D=3D w && h->alloc_h =3D=3D ht && h->dw_size =3D=3D dw=
 &&
> +	    h->alloc_ten_bit =3D=3D h->ten_bit && h->alloc_nslots =3D=3D h->nsl=
ots)
> +		return 0;
> +
> +	h265_free_pics(h);
> +	for (i =3D 0; i < h->nslots; i++) {
> +		struct h265_pic *pic =3D &h->pic[i];
> +
> +		pic->body_v =3D dma_alloc_coherent(dev, body, &pic->body_p, GFP_KERNEL=
);
> +		pic->hdr_v =3D dma_alloc_coherent(dev, hdr, &pic->hdr_p, GFP_KERNEL);
> +		pic->mv_v =3D dma_alloc_coherent(dev, mv, &pic->mv_p, GFP_KERNEL);
> +		if (dw)
> +			pic->dw_v =3D dma_alloc_noncoherent(dev, dw, &pic->dw_p,
> +							  DMA_FROM_DEVICE, GFP_KERNEL);
> +		if (!pic->body_v || !pic->hdr_v || !pic->mv_v || (dw && !pic->dw_v)) {
> +			h->body_size =3D body;
> +			h->hdr_size =3D hdr;
> +			h->mv_size =3D mv;
> +			h->dw_size =3D dw;
> +			h265_free_pics(h);
> +			return -ENOMEM;
> +		}

[Severity: High]
When h265_alloc_pics() reallocates picture buffers on a resolution, bit-dep=
th,
or DPB size change, it first frees the existing buffers with h265_free_pics=
(h).
If one of the subsequent allocations fails and returns -ENOMEM,
HEVCD_MPP_ANC2AXI_TBL_DATA is not cleared, and if a smaller body_size is
allocated later, h265_fill_mmu_map() only overwrites the first pages entries
of h->mmu_map, leaving stale PFNs from the freed buffers in the remaining
entries.

Furthermore, when h265_slice_header() returns a negative error in
h265_irq_thread():

		ret =3D h265_slice_header(h);
		if (ret < 0) {
			dev_err(hw->dev, "hevc: slice setup failed (%d)\n", ret);
			h265_finish(h, VB2_BUF_STATE_ERROR);
			return IRQ_HANDLED;
		}

neither HEVC_MPSR nor HEVC_CPSR is cleared to halt the AMRISC, and h->cur is
not reset to -1 even if a slot was already claimed and marked valid and
referenced in h265_slice_header().

Could this leave the hardware running with stale physical addresses in
HEVCD_MPP_ANC2AXI_TBL_DATA and h->mmu_map, or leak the claimed slot on slice
setup errors?

[ ... ]

> +/* hevc_config_work_space_hw() */
> +static void h265_config_workspace(struct aml_hevc_ctx *h)
> +{
> +	struct aml_vdec_hw *hw =3D h->hw;
> +
> +	wr(hw, HEVCD_IPP_LINEBUFF_BASE, h->ipp);
> +	wr(hw, HEVC_RPM_BUFFER, h->rpm);
> +	wr(hw, HEVC_SHORT_TERM_RPS, h->short_term_rps);
> +	wr(hw, H265_VPS_BUFFER, h->vps);
> +	wr(hw, H265_SPS_BUFFER, h->sps);
> +	wr(hw, HEVC_PPS_BUFFER, h->pps);
> +	wr(hw, H265_SAO_UP, h->sao_up);
> +	wr(hw, HEVC_ASSIST_MMU_MAP_ADDR, h->mmu_map);
> +	wr(hw, H265_SCALELUT, h->scalelut);
> +	wr(hw, HEVC_DBLK_CFG3, 0x4010);	/* <=3D 4096x2304 */
> +	wr(hw, HEVC_DBLK_CFG4, h->dblk_para);
> +	wr(hw, HEVC_DBLK_CFG5, h->dblk_data);
> +	wr(hw, HEVC_DBLK_CFGE, h->dblk_data2);
> +	wr(hw, H265_LMEM_DUMP_ADR, h->lmem);
> +}

[Severity: High]
In h265_alloc_workspace(), h->swap_buf and h->swap_buf2 are carved out of t=
he
workspace allocation:

	h->swap_buf =3D h265_carve(&p, H265_SWAP_BUF_SIZE);
	h->swap_buf2 =3D h265_carve(&p, H265_SWAP_BUF2_SIZE);

However, h265_config_workspace() never writes h->swap_buf or h->swap_buf2 to
HEVC_STREAM_SWAP_BUFFER (HEVC_ASSIST_SCRATCH_7) and HEVC_STREAM_SWAP_BUFFER2
(HEVC_ASSIST_SCRATCH_8), and those scratch registers are not cleared before
starting the microcode.

If the microcode accesses the stream swap buffers, will it DMA to address 0
or to stale physical addresses left in the scratch registers by a previous
VP9 or AV1 session?

[ ... ]

> +/* apply_ref_pic_set(): everything the current RPS does not name stops b=
eing
> + * a reference.
> + */
> +static void h265_apply_rps(struct aml_hevc_ctx *h)
> +{
> +	int i, j;
> +
> +	for (i =3D 0; i < H265_SLOTS; i++) {
> +		struct h265_pic *pic =3D &h->pic[i];
> +		bool found =3D false;
> +
> +		pic->long_term =3D false;
> +		if (!pic->valid || !pic->referenced || pic->poc =3D=3D h->curr_poc)
> +			continue;
> +		for (j =3D 0; j < 16; j++) {
> +			int poc;
> +			bool used, lt;
> +
> +			if (!h265_rps_poc(h, j, &poc, &used, &lt))
> +				break;
> +			if (poc =3D=3D pic->poc) {
> +				pic->long_term =3D lt;
> +				found =3D true;
> +				break;
> +			}
> +		}
> +		if (!found)
> +			pic->referenced =3D false;
> +	}
> +}

[Severity: High]
In h265_slice_header(), h265_apply_rps(h) is called on a new picture before
a slot is chosen and before h->cur is updated. When a new IDR picture arriv=
es,
h->curr_poc is set to 0 first:

	if (h->nal_type =3D=3D H265_NAL_IDR_W_RADL || h->nal_type =3D=3D H265_NAL_=
IDR_N_LP) {
		h->curr_poc =3D 0;

Because h265_apply_rps() skips any existing slot where pic->poc =3D=3D h->c=
urr_poc,
any picture from an earlier GOP that still has pic->poc =3D=3D 0 and
pic->referenced =3D=3D true is skipped instead of having pic->referenced cl=
eared.
When subsequent frames in the new GOP reference POC 0 in their RPS, both the
old POC 0 slot and the new IDR slot match poc =3D=3D pic->poc and remain ma=
rked
referenced.

Across multiple IDR frames, doesn't this leak one DPB slot per IDR until all
h->nslots slots remain referenced and h265_slice_header() fails with -ENOBU=
FS?

[ ... ]

> +static void h265_update_tiles(struct aml_hevc_ctx *h, int w_cu, int h_cu,
> +			      int sao_mem_unit)
> +{
> +	int sao_vb_size =3D (sao_mem_unit + (2 << 4)) * h_cu;
> +	int sao_abv_size =3D sao_mem_unit * w_cu;
> +	int i, j, x, y;
> +	bool uniform;
> +
> +	h->tile_enabled =3D h->p[P_TILES_ENABLED_FLAG] & 1;
> +	if (!h->tile_enabled) {
> +		h->num_tile_col =3D 1;
> +		h->num_tile_row =3D 1;
> +		h->tile[0][0] =3D (struct h265_tile){ 0, 0, w_cu, h_cu,
> +						    h->sao_vb, h->sao_abv };
> +		return;
> +	}
> +	h->num_tile_col =3D h->p[P_NUM_TILE_COLUMNS_MINUS1] + 1;
> +	h->num_tile_row =3D h->p[P_NUM_TILE_ROWS_MINUS1] + 1;
> +	if (h->num_tile_col > H265_MAX_TILE_COLS || h->num_tile_col <=3D 0)
> +		h->num_tile_col =3D 1;
> +	if (h->num_tile_row > H265_MAX_TILE_ROWS || h->num_tile_row <=3D 0)
> +		h->num_tile_row =3D 1;
> +	uniform =3D h->p[P_TILES_ENABLED_FLAG] & 2;
> +
> +	y =3D 0;
> +	for (i =3D 0; i < h->num_tile_row; i++) {
> +		x =3D 0;
> +		for (j =3D 0; j < h->num_tile_col; j++) {
> +			struct h265_tile *t =3D &h->tile[i][j];
> +
> +			if (j =3D=3D h->num_tile_col - 1)
> +				t->width =3D w_cu - x;
> +			else
> +				t->width =3D uniform ? w_cu / h->num_tile_col :
> +						     h->p[P_TILE_WIDTH + j];
> +			if (i =3D=3D h->num_tile_row - 1)
> +				t->height =3D h_cu - y;
> +			else
> +				t->height =3D uniform ? h_cu / h->num_tile_row :
> +						      h->p[P_TILE_HEIGHT + i];
> +			t->start_cu_x =3D x;
> +			t->start_cu_y =3D y;
> +			t->sao_vb =3D h->sao_vb + j * sao_vb_size;
> +			t->sao_abv =3D h->sao_abv + i * sao_abv_size;
> +			x +=3D t->width;
> +		}
> +		y +=3D h->tile[i][0].height;
> +	}
> +}

[Severity: High]
In the RPM parameter layout enum, P_TILE_HEIGHT has 8 entries before
P_MISC_FLAG0:

	P_TILE_WIDTH,			/* 12 entries */
	P_TILE_HEIGHT =3D P_TILE_WIDTH + 12,	/* 8 entries */
	P_MISC_FLAG0 =3D P_TILE_HEIGHT + 8,

However, H265_MAX_TILE_ROWS is 20, so when uniform is false and
h->num_tile_row > 9, indexing h->p[P_TILE_HEIGHT + i] for i >=3D 8 reads pa=
st
P_TILE_HEIGHT into P_MISC_FLAG0 and subsequent RPM fields.

Also, if non-uniform tile widths or heights in h->p[] sum to more than w_cu=
 or
h_cu, w_cu - x or h_cu - y becomes negative, which passes the zero-only che=
ck
in h265_slice_header():

	if (!h->tile_width_lcu || !h->tile_height_lcu)
		return -EINVAL;

and writes negative dimensions into the MPRED registers. Should
h265_update_tiles() bound P_TILE_HEIGHT accesses to the RPM array size and
reject non-positive tile widths and heights?

[ ... ]

> +static void h265_fill_mmu_map(struct aml_hevc_ctx *h)
> +{
> +	struct h265_pic *pic =3D &h->pic[h->cur];
> +	u32 *map =3D h->side_v + (h->mmu_map - h->side_p);
> +	u32 pages =3D h->body_size / PAGE_SIZE, first =3D pic->body_p >> PAGE_S=
HIFT, i;
> +
> +	for (i =3D 0; i < pages && i < H265_MMU_MAP_SIZE / 4; i++)
> +		map[i] =3D first + i;
> +}

[Severity: Critical]
H265_MMU_MAP_SIZE is 0x1200 * 4 bytes (4,608 page entries), which matches t=
he
page count of a 4096x2304 10-bit compressed body. However, h265_slice_heade=
r()
accepts picture heights up to H265_MAX_DIM (4096):

	if (p[P_PIC_WIDTH] < H265_MIN_DIM || p[P_PIC_HEIGHT] < H265_MIN_DIM ||
	    p[P_PIC_WIDTH] > H265_MAX_DIM || p[P_PIC_HEIGHT] > H265_MAX_DIM) {

For a 4096x4096 picture, h265_comp_body_size() is up to 8,192 pages, and
h265_config_comp() programs that full length into HEVC_CM_BODY_LENGTH and
HEVC_CM_HEADER_OFFSET while h265_fill_mmu_map() silently stops filling map[]
at 4,608 entries.

When the hardware writes beyond page 4,607, won't the MMU DMA engine read p=
ast
h->mmu_map into h->aux and DMA compressed frame data over unrelated physical
memory (including page 0)?

[ ... ]

> +static int h265_slice_header(struct aml_hevc_ctx *h)
> +{
> +	struct aml_vdec_hw *hw =3D h->hw;
> +	u16 *p =3D h->p;
> +	int i, ret, col_ref;
> +
> +	h->temporal_id =3D p[P_TEMPORAL_ID];
> +	h->nal_type =3D p[P_NAL_UNIT_TYPE];
> +	h->misc_flag0 =3D p[P_MISC_FLAG0];
> +
> +	if (!p[P_FIRST_SLICE_SEGMENT_IN_PIC_FLAG]) {
> +		h->slice_segment_addr =3D p[P_SLICE_SEGMENT_ADDRESS];
> +		if (!p[P_DEPENDENT_SLICE_SEGMENT_FLAG])
> +			h->slice_addr =3D h->slice_segment_addr;
> +	} else {
> +		h->slice_segment_addr =3D 0;
> +		h->slice_addr =3D 0;
> +	}
> +	h->iprev_poc =3D h->curr_poc;
> +	h->slice_type =3D p[P_SLICE_TYPE];
> +	h->tmvp =3D p[P_SLICE_TEMPORAL_MVP_ENABLE_FLAG] & 1;
> +	h->is_next_slice_segment =3D !!p[P_DEPENDENT_SLICE_SEGMENT_FLAG];

[Severity: Critical]
When p[P_FIRST_SLICE_SEGMENT_IN_PIC_FLAG] is set, h->slice_segment_addr is
set to 0 above, but the rest of h265_slice_header() never reads
h->slice_segment_addr and instead checks raw p[P_SLICE_SEGMENT_ADDRESS] and
p[P_DEPENDENT_SLICE_SEGMENT_FLAG].

On a non-first slice (p[P_SLICE_SEGMENT_ADDRESS] !=3D 0 with h->cur >=3D 0),
h265_slice_header() also updates h->pic_w, h->pic_h, h->ten_bit, and
h->lcu_size without reallocating picture buffers or verifying that they mat=
ch
h->alloc_w, h->alloc_h, and h->alloc_ten_bit, and it does not check that
h->slice_addr < h->lcu_total before h265_config_mpred() computes:

	dma_addr_t rd_ptr =3D rd_start + h->slice_addr * unit;
	dma_addr_t wr_ptr =3D cur->mv_p + h->slice_addr * unit;

Can a continuation slice with a larger SPS/PPS or an out-of-range
slice_segment_address cause the hardware to DMA past the allocated MV, SAO,
and picture buffers?

[ ... ]

> +	h->lcu_size =3D 1 << (p[P_LOG2_MIN_CB_SIZE_MINUS3] + 3 +
> +			    p[P_LOG2_DIFF_MAX_MIN_CB_SIZE]);
> +	if (h->lcu_size < 16 || h->lcu_size > 64)
> +		return -EINVAL;
> +	h->lcu_size_log2 =3D ilog2(h->lcu_size);
> +	h->lcu_x_num =3D DIV_ROUND_UP(h->pic_w, h->lcu_size);
> +	h->lcu_y_num =3D DIV_ROUND_UP(h->pic_h, h->lcu_size);
> +	h->lcu_total =3D h->lcu_x_num * h->lcu_y_num;
> +
> +	/* POC, 8.3.1 */
> +	if (h->nal_type =3D=3D H265_NAL_IDR_W_RADL || h->nal_type =3D=3D H265_N=
AL_IDR_N_LP) {
> +		h->curr_poc =3D 0;
> +		if (h->temporal_id - 1 =3D=3D 0)
> +			h->prev_tid0_poc =3D h->curr_poc;
> +	} else {
> +		int max_lsb =3D 1 << (p[P_LOG2_MAX_POC_LSB_MINUS4] + 4);
> +		int prev_lsb =3D h->prev_tid0_poc % max_lsb;
> +		int prev_msb =3D h->prev_tid0_poc - prev_lsb;
> +		int lsb =3D p[P_POC_LSB];
> +		int msb;
> +
> +		if (lsb < prev_lsb && prev_lsb - lsb >=3D max_lsb / 2)
> +			msb =3D prev_msb + max_lsb;
> +		else if (lsb > prev_lsb && lsb - prev_lsb > max_lsb / 2)
> +			msb =3D prev_msb - max_lsb;
> +		else
> +			msb =3D prev_msb;
> +		if (h->nal_type =3D=3D H265_NAL_BLA_W_LP ||
> +		    h->nal_type =3D=3D H265_NAL_BLA_W_RADL ||
> +		    h->nal_type =3D=3D H265_NAL_BLA_N_LP)
> +			msb =3D 0;
> +		h->curr_poc =3D msb + lsb;
> +		if (h->temporal_id - 1 =3D=3D 0)
> +			h->prev_tid0_poc =3D h->curr_poc;
> +	}

[Severity: High]
There appear to be three issues in the LCU and POC calculations here in
h265_slice_header():

1. Both 1 << (p[P_LOG2_MIN_CB_SIZE_MINUS3] + 3 + p[P_LOG2_DIFF_MAX_MIN_CB_S=
IZE])
   and max_lsb =3D 1 << (p[P_LOG2_MAX_POC_LSB_MINUS4] + 4) shift a signed 3=
2-bit
   int by unvalidated u16 values from the RPM buffer. If
   p[P_LOG2_MAX_POC_LSB_MINUS4] is corrupted (for example >=3D 27), max_lsb=
 can
   overflow to INT_MIN or 0 and trigger a divide error in
   h->prev_tid0_poc % max_lsb.

2. When h->prev_tid0_poc is negative, h->prev_tid0_poc % max_lsb produces a
   negative prev_lsb in C rather than h->prev_tid0_poc & (max_lsb - 1),
   miscomputing prev_msb and h->curr_poc.

3. Per ITU-T H.265 section 8.3.1, prevTid0Pic should only be updated when t=
he
   picture is not a RASL, RADL, or sub-layer non-reference picture, whereas
   h->prev_tid0_poc is updated here for all pictures with temporal_id =3D=
=3D 1
   (even RASL pictures skipped immediately below).

Should the shift exponents be bounds-checked first, prev_lsb masked with
max_lsb - 1, and h->prev_tid0_poc restricted to non-RASL/RADL reference
pictures?

[ ... ]

> +	if (h->iprev_poc !=3D h->curr_poc) {
> +		h->new_tile =3D true;
> +		h->tile_x =3D 0;
> +		h->tile_y =3D 0;
> +	} else if (h->tile_enabled) {
> +		int t =3D h265_tile_index(h, p[P_SLICE_SEGMENT_ADDRESS], h->lcu_x_num);
> +
> +		if (t !=3D -1 && t !=3D (h->tile_x | (h->tile_y << 8))) {
> +			h->new_tile =3D true;
> +			h->tile_x =3D t & 0xff;
> +			h->tile_y =3D (t >> 8) & 0xff;
> +		} else {
> +			h->new_tile =3D false;
> +		}
> +	} else {
> +		h->new_tile =3D false;
> +	}
> +	if (h->tile_x >=3D H265_MAX_TILE_COLS || h->tile_y >=3D H265_MAX_TILE_R=
OWS)
> +		h->new_tile =3D false;
> +	if (h->new_tile) {
> +		struct h265_tile *t =3D &h->tile[h->tile_y][h->tile_x];
> +
> +		h->tile_start_lcu_x =3D t->start_cu_x;
> +		h->tile_start_lcu_y =3D t->start_cu_y;
> +		h->tile_width_lcu =3D t->width;
> +		h->tile_height_lcu =3D t->height;
> +	}

[Severity: Medium]
If two consecutive pictures have the same POC (such as back-to-back IDR
pictures with curr_poc =3D=3D 0, or an IDR picture following a skipped RASL
picture whose curr_poc was 0), h->iprev_poc !=3D h->curr_poc is false on the
first slice of the new picture.

When that happens, h->new_tile is set to false and h->tile_width_lcu /
h->tile_height_lcu are either left at 0 (failing the check below with -EINV=
AL)
or retain stale dimensions from the previous picture. Should this test
h->new_pic instead of h->iprev_poc !=3D h->curr_poc?

[ ... ]

> +static void h265_copy_out(struct aml_hevc_ctx *h)
> +{
> +	struct aml_vdec_ctx *ctx =3D h->v4l2_ctx;
> +	struct v4l2_pix_format_mplane *pf =3D &ctx->pix_fmt[AML_FMT_DST];
> +	struct vb2_v4l2_buffer *dst =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	struct h265_pic *pic;
> +	struct vb2_buffer *vb;
> +	u32 stride, dst_h, row, w, ht;
> +	u8 *y, *c;
> +	const u8 *src;
> +
> +	if (!dst || h->cur < 0)
> +		return;
> +	vb =3D &dst->vb2_buf;
> +	pic =3D &h->pic[h->cur];
> +	stride =3D pf->plane_fmt[0].bytesperline ? : pic->width;
> +	dst_h =3D pf->height ? : pic->height;
> +
> +	if (!h->dw_target_y) {
> +		src =3D pic->dw_v;
> +		if (!src)
> +			return;
> +		dma_sync_single_for_cpu(h->hw->dev, pic->dw_p, h->dw_size, DMA_FROM_DE=
VICE);
> +		w =3D pic->width;
> +		ht =3D pic->height;
> +		y =3D vb2_plane_vaddr(vb, 0);
> +		if (!y)
> +			return;
> +		c =3D vb->num_planes >=3D 2 ? vb2_plane_vaddr(vb, 1) : y + (size_t)str=
ide * dst_h;
> +		if (!c)
> +			return;
> +		for (row =3D 0; row < ht; row++)
> +			memcpy(y + (size_t)row * stride, src + (size_t)row * w, w);
> +		for (row =3D 0; row < ht / 2; row++)
> +			memcpy(c + (size_t)row * stride, src + (size_t)(ht + row) * w, w);
> +		aml_vdec_dst_cpu_written(h->hw->dev, vb);
> +	}

[Severity: Critical]
Can a bitstream with dimensions larger than the configured CAPTURE format
overflow the CAPTURE buffer in both h265_config_sao() and h265_copy_out()?

In aml_hevc_dec_run(), the CAPTURE buffer size check runs before the hardwa=
re
parses the current access unit's SPS and slice header:

	h265_set_dw_target(h);
	if (h->dw_target_y && (size_t)h->alloc_w * h->alloc_h * 3 / 2 > h->dw_targ=
et_size &&
	    h->alloc_w) {
		h->dw_target_y =3D 0;	/* stream outgrew the capture buffer */
	}

On the first frame (where h->alloc_w is 0) or on a mid-stream resolution
increase, h->dw_target_y stays non-zero even if the new h->pic_w and h->pic=
_h
exceed pf->width, pf->height, and h->dw_target_size. When h265_config_sao()
then programs HEVC_SAO_Y_START_ADDR and HEVC_SAO_C_START_ADDR with
h->dw_target_y and h->dw_target_c without checking h->pic_w and h->pic_h
against pf->width and h->dw_target_size, the hardware double-write unit DMAs
past the end of the CAPTURE buffer.

Then, on the second frame, h->alloc_w is non-zero, so aml_hevc_dec_run() cl=
ears
h->dw_target_y to 0. That changes dw in h265_alloc_pics() from 0 to non-zer=
o,
which calls h265_free_pics(h) and wipes all decoded reference pictures in t=
he
DPB. Finally, in the fallback path in h265_copy_out() above, memcpy() copies
ht rows of w bytes into y and c without verifying that w <=3D stride,
ht <=3D dst_h, or that the destination planes are large enough.

> +	if (vb->num_planes >=3D 2) {
> +		vb2_set_plane_payload(vb, 0, stride * dst_h);
> +		vb2_set_plane_payload(vb, 1, stride * dst_h / 2);
> +	} else {
> +		vb2_set_plane_payload(vb, 0, stride * dst_h * 3 / 2);
> +	}
> +	h->have_picture =3D true;
> +}
> +
> +static void h265_finish(struct aml_hevc_ctx *h, enum vb2_buffer_state st=
ate)
> +{
> +	struct aml_vdec_ctx *ctx =3D h->v4l2_ctx;
> +	struct vb2_v4l2_buffer *buf;
> +	unsigned int i;
> +
> +	if (h->finished)
> +		return;
> +	h->finished =3D true;
> +
> +	if (!h->have_picture) {
> +		buf =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +		if (buf)
> +			for (i =3D 0; i < buf->vb2_buf.num_planes; i++)
> +				vb2_set_plane_payload(&buf->vb2_buf, i, 0);
> +	}
> +	buf =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +	if (buf && buf->vb2_buf.req_obj.req)
> +		v4l2_ctrl_request_complete(buf->vb2_buf.req_obj.req, &ctx->ctrl_handle=
r);
> +
> +	ctx->int_cond =3D 1;
> +	ctx->job_finished =3D true;
> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev_dec, ctx->m2m_ctx, s=
tate);
> +	wake_up(&ctx->queue);
> +}

[Severity: High]
h265_finish() runs in h265_irq_thread() and calls
v4l2_m2m_buf_done_and_job_finish() before waking ctx->queue and before
aml_hevc_dec_run() returns to m2mops_vdec_device_run() in
drivers/media/platform/amlogic/vdec/aml_vdec.c:

	ctx->job_finished =3D false;
	ret =3D ctx->codec_ops->run(ctx);

	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);

Because v4l2_m2m_buf_done_and_job_finish() removes src_buf and dst_buf from
their queues, returns them to userspace, and schedules the next M2M job
immediately, doesn't this return the buffers to userspace before
v4l2_m2m_buf_copy_metadata() has copied the timestamp and flags, and allow =
the
next M2M job (or a concurrent streamoff/close after v4l2_m2m_cancel_job()) =
to
race with the tail of h265_finish() and aml_hevc_dec_run()?

[ ... ]

> +void aml_hevc_exit(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_hevc_ctx *h =3D ctx->codec_priv;
> +
> +	if (!h)
> +		return;
> +	h->hw->hevc_irq_thread_fn =3D NULL;
> +	h->hw->hevc_priv =3D NULL;
> +	if (h->started)
> +		regmap_write(h->hw->map[DOS_BUS], HEVC_MPSR, 0);
> +	h265_free(h);
> +	kfree(h);
> +	ctx->codec_priv =3D NULL;
> +}

[Severity: Critical]
In aml_hevc_exit(), h->hw->hevc_irq_thread_fn and h->hw->hevc_priv are clea=
red
before stopping HEVC_MPSR, HEVC_ASSIST_MBOX0_MASK is not cleared, and
synchronize_irq(h->hw->hevc_irq) is never called before h265_free(h) and
kfree(h).

In drivers/media/platform/amlogic/vdec/aml_vdec_hw.c, hevc_irq_thread()
invokes the callback without locking:

static irqreturn_t hevc_irq_thread(int irq, void *priv)
{
	struct aml_vdec_hw *hw =3D priv;

	if (hw->hevc_irq_thread_fn)
		return hw->hevc_irq_thread_fn(irq, hw->hevc_priv);

	return IRQ_HANDLED;
}

If hevc_irq_thread() is running or about to run when aml_hevc_exit() execut=
es,
can h265_irq_thread() be called with priv =3D=3D NULL or continue accessing=
 h and
its DMA buffers after h265_free(h) and kfree(h) have freed them?

> +
> +int aml_hevc_dec_run(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_hevc_ctx *h =3D ctx->codec_priv;
> +	struct aml_vdec_hw *hw =3D h->hw;

[Severity: High]
In drivers/media/platform/amlogic/vdec/aml_vdec.c, vb2ops_vdec_stop_streami=
ng()
calls aml_vdec_release_instance(ctx) -> aml_hevc_exit(ctx) (setting
ctx->codec_priv =3D NULL) when either the OUTPUT or CAPTURE queue stops, wh=
ereas
vb2ops_vdec_start_streaming() only calls aml_vdec_init_dec_inst(ctx) when t=
he
OUTPUT queue starts.

If userspace stops and restarts the CAPTURE queue while OUTPUT remains
streaming, ctx->codec_priv is NULL when aml_hevc_dec_run() is called. Won't
dereferencing h->hw here cause a NULL pointer dereference?

[ ... ]

> +	/* Uninterruptible on purpose - see aml_vp9_dec_run(). */
> +	ret =3D wait_event_timeout(ctx->queue, ctx->int_cond,
> +				 msecs_to_jiffies(H265_TIMEOUT_MS));
> +	ctx->int_cond =3D 0;
> +	if (!ret) {
> +		dev_err(hw->dev, "hevc: decode timeout, status %02x pc %08x shift %08x=
\n",
> +			hw->hevc_irq_status, read_dos_reg(hw, HEVC_MPC_E),
> +			read_dos_reg(hw, HEVC_SHIFT_BYTE_COUNT));
> +		wr(hw, HEVC_MPSR, 0);
> +		h->cur =3D -1;
> +		hw->hevc_dirty =3D true;
> +		return -ETIMEDOUT;
> +	}
> +	return 0;
> +}

[Severity: High]
When wait_event_timeout() times out here in aml_hevc_dec_run(), there appear
to be two recovery issues:

1. The timeout path sets h->cur =3D -1 and returns -ETIMEDOUT without maski=
ng
   HEVC_ASSIST_MBOX0_MASK, setting h->finished =3D true, or calling
   synchronize_irq(hw->hevc_irq). If h265_irq_thread() is running concurren=
tly
   (for example sleeping in h265_alloc_pics() inside h265_slice_header()),
   setting h->cur =3D -1 races with h265_fill_mmu_map(), h265_config_mpred(=
),
   and h265_config_sao() indexing h->pic[h->cur] (reading h->pic[-1] out of
   bounds), and h265_finish() can race with err_cancel_job in
   m2mops_vdec_device_run() to complete the request and M2M job twice.

2. Although hw->hevc_dirty is set to true on timeout, aml_hevc_dec_run() on=
ly
   calls hvdec_switch_codec() and hevc_load_fw() when !h->ucode_loaded:

	if (!h->ucode_loaded) {
		hvdec_switch_codec(hw, CODEC_TYPE_HEVC);
		ret =3D hevc_load_fw(hw, CODEC_TYPE_HEVC, H265_FW_FORMAT_MMU,
				   H265_FW_CORE_HEVC, "hevc");

   Because h->ucode_loaded is not reset to false on timeout (and hw->hevc_d=
irty
   is not set when decoding 10-bit frames), won't subsequent frames in the
   same context skip cycling the core memories and reloading the firmware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192507.2100=
58-1-christian.koever-draxl@student.uibk.ac.at?part=3D9
