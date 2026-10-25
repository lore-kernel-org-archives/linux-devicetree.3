Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960055;
	b=D+4J1KAlErk3wLvs7HApUuKGHgBNHLAmNw/2v0qAWT4SNE81BcQDkUu2CuXvDutB4Cq5
	 Ll6ew7zXFDp/i5sL6/zkYeCnaOfwQKWWqWmU1EoTokZYSiJmfmajXMk2EiKNBz/Cs0Wm5
	 QoWOIo+VlMdlkl6DLYH+O4kSAO5zjz0nxqYOoXYf83nu+g4b11hediGNOUXuDRYFfryRE
	 NRv7VJLHFwRvnbeZ6iMLy5gdNJ7E/OeBzAmUy4pv5Z9R7OthBTe8rqL28i73JcRCaYUIl
	 Y9fH6XVCPeFFSDq+Y4o++ZSaSdu9VDctzGRz2wPyZAsa6J4X9P8iUghpeVUdHWhAkfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960055;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=39T7/si6JAyxDX8RF+i0POE9eBeV6NAYtOjXoeBojL8=;
	b=Vrm2D2GgNBprepG1SnotL9GKeDyXA8dLhTx7yEakgn1hCTR6Du7ImqtjaCGCJiMWI4fm
	 RT9kl4FVbFepQjvzoY1VuAIlrOxazZYZsCz+A5aVShqOkksWmpG1UxZoS9u6xWzoVWmBP
	 vPSZUCIL3GmO2GfQ7ds/LzW97MhLxUCDMudASJ6Q91n2dxZnAIwCWs/8Y2Es0s5JrFaSv
	 tfWS+NeNf0+T/TJ+/YpAwmPRs++ToyxupulK1u2PzP7rkleDFxNLcAWIvlkneiIR7tCWg
	 6Uc4AjQLg/eLinjsF/rJtwnOWVE0lKyDggbh6BJ3t26ia0V06el65/JmD6SArbxu81w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XLfrguqW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF702606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XLfrguqW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157B51F01825;
	Sun, 25 Oct 2026 20:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792960054;
	bh=39T7/si6JAyxDX8RF+i0POE9eBeV6NAYtOjXoeBojL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XLfrguqWJpPvjRaufJNHt7laN2P6tUDoFVLePjAIbp9LQr8EVMnM0QB0NUzFo/zHO
	 zLdI2iYeBRuSnyPUbNeuAslG3mWUHlsVeVDCLS5fTo+ZDKYLpb5QvEx7sNnF4Wo/F7
	 oAEKVJisjgyAuR/+YNavYf06bhUh9q3FWP77+3IWCSKsO+uBCkCK/cDzsKVz3qW9ww
	 3U4KRFaUhXqdiln8oj/wEpYKxxWMtfrH2ybbltwd9cKqEleFkWwrQKhxLdBIFFca0V
	 A8uLK11fteMlSAkR1kq/x6HOQKaLRuXrKPBwWqEg4ZeE6GVgv0yGZi0ekw3NIKeRlq
	 hTMRkx3swO/QQ==
Message-ID: <sashiko-outbox-184430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] media: amlogic: vdec: add AV1 decoding on the
 HEVC core
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261025192507.210058-8-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-8-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:27:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 17 potential issue=
(s) to consider:
- [Critical] media: amlogic: vdec: active DMA and IRQ race on timeout in am=
l_av1_dec_run()
- [Critical] media: amlogic: vdec: unsynchronized IRQ teardown in aml_av1_e=
xit()
- [Critical] media: amlogic: vdec: broken stride/bounds check and show_exis=
ting_frame in DW path
- [Critical] media: amlogic: vdec: out-of-bounds memcpy in av1_copy_out() w=
hen av1_dw_target_y is 0
- [Critical] media: amlogic: vdec: height bound in aml_av1_config_picture()=
 allows workspace overrun
- [High] media: amlogic: vdec: av1_finish() completes buffers before metada=
ta copy
- [High] media: amlogic: vdec: race on av1->started in aml_av1_dec_run() ca=
uses DMA UAF
- [High] media: amlogic: vdec: stream FIFO updated before halting core in a=
ml_av1_dec_run()
- [High] media: amlogic: vdec: DMA buffers leaked on early error in aml_av1=
_dec_run()
- [High] media: amlogic: vdec: unbalanced hvdec_enable() in aml_av1_dec_run=
() leaks PM refs
- [High] media: amlogic: vdec: LEB128 size truncation and missing bounds in=
 OBU parsers
- [Medium] media: amlogic: vdec: static AV1 decoder state is not reset acro=
ss sessions
- [Medium] media: amlogic: vdec: av1_apply_reference_ts() skips ts 0 and ma=
tches stale slots
- [Medium] media: amlogic: vdec: wrong show_existing_frame ref reset in aml=
_av1_config_picture()
- [Medium] media: amlogic: vdec: aml_av1_config_picture() treats SWITCH_FRA=
ME as intra
- [Medium] media: amlogic: vdec: aml_av1_config_picture() misprograms loop =
filter registers
- [Medium] media: amlogic: vdec: dead bring-up helpers with filp_open() and=
 unused DMA in av1.c
--

commit a46d92fb9c757233f35e346c8e20a00518a6480a
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

media: amlogic: vdec: add AV1 decoding on the HEVC core

This commit adds V4L2 stateless AV1 decoding support on the Amlogic S4 HEVC
core, handling 8-bit and 10-bit main profile streams up to 4096x2304. It
rebuilds sequence and frame OBUs with AMLV headers, manages reference slots
and the frame MMU, and outputs NV12 frames into CAPTURE buffers.

> diff --git a/drivers/media/platform/amlogic/vdec/av1.c b/drivers/media/pl=
atform/amlogic/vdec/av1.c
> new file mode 100644
> index 0000000000000..ddadc83c8d866
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/av1.c
> @@ -0,0 +1,3140 @@

[ ... ]

> +static struct av1_slot av1_slots[AV1_SLOTS];
> +static size_t av1_slot_body_size, av1_slot_mv_size, av1_slot_hdr_size;
> +static size_t av1_slot_dw_size;
> +static int av1_cur_slot;
> +static u32 av1_last_width, av1_last_height;
> +static int av1_prev_slot;
> +/* False for a key frame and for any frame with PRIMARY_REF_NONE. */
> +static bool av1_prev_valid;
> +/* Slot a show_existing_frame header asked to be displayed again. */
> +static int av1_shown_slot =3D -1;
> +/* Slot that should be handed to the display next, -1 when there is none=
. */
> +static int av1_out_slot =3D -1;
> +static bool av1_cur_show;

[ ... ]

> +static bool av1_stateless;

[ ... ]

> +static dma_addr_t av1_dw_target_y, av1_dw_target_c;
> +
> +/* Bytes the hardware may write at av1_dw_target_y, the CAPTURE buffer s=
ize. */
> +static size_t av1_dw_target_size;
> +/* AV1 keeps eight reference slots; each names one of our picture slots.=
 */
> +static int av1_ref_slot[8];
> +static u32 av1_pending_refresh;
> +/* OUTPUT timestamp of the frame being decoded, stateless path only. */
> +static u64 av1_cur_ts;
> +/* The picture slot each reference frame LAST..ALTREF resolves to, plus =
[0] =3D current. */
> +static int av1_frame_slot[8];
> +
> +static struct av1_workspace av1_ws;

[Severity: Medium]
What happens when a second AV1 decoding session is opened after a previous
session closes?

All of the stream and reference tracking state (av1_seq_obu, av1_seq_len,
av1_ref_slot[], av1_cur_slot, av1_prev_slot, av1_prev_valid, av1_shown_slot,
av1_out_slot, av1_last_width, av1_last_height, and av1_ws.dw_width /
av1_ws.dw_height) is kept in file-scope static variables.

None of these variables are reset in aml_av1_init(), aml_av1_bringup(),
aml_av1_teardown(), or aml_av1_exit(). On a subsequent session,
aml_av1_have_sequence() will return true using the previous session's cached
av1_seq_obu, and the slot and reference indices will start from stale value=
s.

Should this state live in struct aml_av1_ctx or be explicitly cleared during
session initialization and teardown?

[ ... ]

> +static int av1_reframe(struct aml_vdec_hw *hw, const u8 *src, size_t len,
> +		       u8 *dst, size_t dst_cap, size_t *out_len)
> +{
> +	size_t pos =3D 0, outp =3D 0, obus =3D 0;
> +
> +	while (pos < len) {
> +		size_t hdr_len =3D 1, size_len =3D 0, consumed, total;
> +		u64 payload;
> +		u32 obu_size;
> +		u8 h[AV1_AMLV_HEADER_SIZE] =3D { 0 };
> +
> +		bool synth =3D false;
> +		u8 obu_hdr[2];
> +		u8 leb[8];
> +		size_t leb_len =3D 0;
> +
> +		if (src[pos] & 0x04)		/* obu_extension_flag */
> +			hdr_len =3D 2;
> +		if (pos + hdr_len > len)
> +			return -EINVAL;
> +
> +		if (src[pos] & 0x02) {
> +			if (pos + hdr_len >=3D len)
> +				return -EINVAL;
> +			if (av1_read_leb128(src + pos + hdr_len,
> +					    len - pos - hdr_len,
> +					    &payload, &size_len))
> +				return -EINVAL;
> +			consumed =3D hdr_len + size_len;
> +			total =3D consumed + payload;
> +			if (pos + total > len)
> +				return -EINVAL;

[ ... ]

> +static u8 av1_seq_obu[192];
> +static size_t av1_seq_len;
> +
> +static void av1_cache_seq_header(const u8 *src, size_t len)
> +{
> +	size_t pos =3D 0;
> +
> +	while (pos < len) {
> +		size_t hdr_len =3D 1, j;
> +		u64 payload;
> +		int type =3D (src[pos] >> 3) & 0xf;
> +
> +		if (src[pos] & 0x04)
> +			hdr_len =3D 2;
> +		if (!(src[pos] & 0x02)) {
> +			/* no size field: this OBU runs to the end */
> +			if (type =3D=3D 1 && len - pos <=3D sizeof(av1_seq_obu)) {
> +				av1_seq_len =3D len - pos;
> +				memcpy(av1_seq_obu, src + pos, av1_seq_len);
> +			}
> +			return;
> +		}
> +		if (pos + hdr_len >=3D len)
> +			return -EINVAL;
> +		j =3D pos + hdr_len;
> +		if (av1_read_leb128(src + j, len - j, &payload, &hdr_len))
> +			return;
> +		j +=3D hdr_len;
> +		if (j + payload > len)
> +			return;
> +		if (type =3D=3D 1 && j + payload - pos <=3D sizeof(av1_seq_obu)) {
> +			av1_seq_len =3D j + payload - pos;
> +			memcpy(av1_seq_obu, src + pos, av1_seq_len);
> +			return;
> +		}
> +		pos =3D j + payload;
> +	}
> +}
> +
> +static bool av1_has_seq_header(const u8 *src, size_t len)
> +{
> +	size_t pos =3D 0;
> +
> +	while (pos < len) {
> +		size_t hdr_len =3D 1, j;
> +		u64 payload;
> +
> +		if (((src[pos] >> 3) & 0xf) =3D=3D 1)
> +			return true;
> +		if (src[pos] & 0x04)
> +			hdr_len =3D 2;
> +		if (!(src[pos] & 0x02) || pos + hdr_len >=3D len)
> +			return false;
> +		j =3D pos + hdr_len;
> +		if (av1_read_leb128(src + j, len - j, &payload, &hdr_len))
> +			return false;
> +		pos =3D j + hdr_len + payload;
> +	}
> +	return false;
> +}

[Severity: High]
Can a crafted LEB128 payload value cause size truncation or an infinite loop
in av1_has_seq_header() and av1_reframe()?

av1_read_leb128() decodes up to 56 bits into u64 payload. In
av1_has_seq_header(), pos =3D j + hdr_len + payload is updated without chec=
king
whether payload exceeds len - j - hdr_len. On 32-bit builds (allowed via
COMPILE_TEST or 32-bit Meson), a payload such as 0x100000000ULL - (j + hdr_=
len)
wraps size_t pos back to its previous offset and loops forever.

Similarly, in av1_reframe(), total =3D consumed + payload truncates the 64-=
bit
sum to size_t before checking pos + total > len, which can wrap total to 0 =
on
32-bit systems and repeatedly emit headers until dst_cap is exhausted. Even=
 on
64-bit systems, u32 obu_size =3D total + 4 and the 28-bit LEB128 encoding in
h[16..19] will truncate if payload exceeds 28 bits.

In addition, when src[pos] & 0x04 is set (hdr_len =3D 2) and !(src[pos] & 0=
x02)
on the final byte of the buffer (len - pos =3D=3D 1), av1_has_seq_header() =
returns
true and av1_cache_seq_header() copies a truncated 1-byte OBU into av1_seq_=
obu
without verifying pos + hdr_len <=3D len first.

Should payload be validated against len - j - hdr_len (and capped to the
28-bit AMLV limit) before adding it to size_t offsets, and should pos + hdr=
_len
<=3D len be checked before inspecting the OBU type?

[ ... ]

> +static void av1_apply_reference_ts(const struct v4l2_ctrl_av1_frame *f)
> +{
> +	int s, k;
> +
> +	for (s =3D 0; s < 8; s++) {
> +		u64 ts =3D f->reference_frame_ts[s];
> +
> +		if (!ts)
> +			continue;
> +		for (k =3D 0; k < AV1_SLOTS; k++) {
> +			if (av1_slots[k].ts =3D=3D ts) {
> +				av1_ref_slot[s] =3D k;
> +				break;
> +			}
> +		}
> +	}
> +}

[Severity: Medium]
Could av1_apply_reference_ts() miss a valid reference frame with timestamp 0
or match a stale slot after a keyframe reset?

In V4L2, 0 is a valid buffer timestamp (commonly used for the first frame i=
n a
stream), so skipping !ts ignores references to a frame whose OUTPUT buffer =
had
timestamp 0. Also, av1_slots[].ts is initialized to 0 and is not invalidated
when a shown keyframe resets av1_cur_slot and av1_ref_slot[] in
aml_av1_config_picture(), so unused or pre-reset slots still hold old
timestamps.

Would tracking a per-slot valid flag instead of treating ts =3D=3D 0 as emp=
ty
avoid this?

[ ... ]

> +int aml_av1_config_picture(struct aml_vdec_hw *hw)
> +{

[ ... ]

> +	width =3D pr[AV1_RPM_MAX_FRAME_WIDTH];
> +	height =3D pr[AV1_RPM_MAX_FRAME_HEIGHT];
> +	/*
> +	 * Everything downstream sizes DMA from these: the MMU page table, the
> +	 * compressed body, the picture slots.  If the microcode never saw a
> +	 * sequence header they are whatever was left in the RPM, and building
> +	 * a page table from that points the hardware at memory it does not
> +	 * own - which resets the board outright, with no oops to read
> +	 * afterwards.  Refuse instead.
> +	 */
> +	if (width < AV1_MIN_DIM || height < AV1_MIN_DIM ||
> +	    width > AV1_MAX_DIM || height > AV1_MAX_DIM) {
> +		dev_err(hw->dev, "av1: implausible picture size %ux%u, refusing\n",
> +			width, height);
> +		return -EINVAL;
> +	}

[Severity: Critical]
Can a stream with height between 2305 and 4096 overrun the workspace buffers
in av1_ws?

The workspace sub-buffers allocated in av1_alloc() (such as AV1_SEG_MAP_SIZ=
E,
AV1_DBLK_PARA_SIZE, AV1_DBLK_DATA_SIZE, AV1_CDEF_DATA_SIZE, AV1_UPS_DATA_SI=
ZE,
and AV1_MMU_VBH_SIZE) are sized for 4096x2304, matching AML_VDEC_4K_MAX_W a=
nd
AML_VDEC_4K_MAX_H.

However, aml_av1_config_picture() checks height against AV1_MAX_DIM (4096).=
 A
bitstream with height > 2304 and <=3D 4096 (for example 2048x4096 or 4096x2=
880
at 8-bit, where comp_body_size() also fits within AV1_MMU_MAP_SIZE) passes
this check and lets the hardware write past the end of the height-dependent
workspace buffers.

Should height be bounded by AML_VDEC_4K_MAX_H (2304) instead of AV1_MAX_DIM?

[ ... ]

> +	if (pr[AV1_RPM_SHOW_EXISTING_FRAME] & 1) {
> +		u32 idx =3D pr[AV1_RPM_EXISTING_FRAME_IDX] & 7;
> +
> +		av1_shown_slot =3D av1_ref_slot[idx];
> +		av1_out_slot =3D av1_shown_slot;
> +		if (av1_slots[av1_shown_slot].intra)
> +			for (i =3D 0; i < 8; i++)
> +				av1_ref_slot[i] =3D av1_shown_slot;
> +		av1_pending_refresh =3D 0;
> +		dev_dbg(hw->dev, "av1: show existing frame, slot %d\n",
> +			av1_shown_slot);
> +		return -EAGAIN;
> +	}

[Severity: Medium]
When show_existing_frame is set in aml_av1_config_picture(), does checking
av1_slots[av1_shown_slot].intra reset the reference map on intra-only frames
as well as keyframes?

In aml_av1_config_picture(), slot.intra is set to !inter, which is true for
both KEY_FRAME (0) and INTRA_ONLY_FRAME (2). Per the AV1 specification,
show_existing_frame only refreshes all eight reference slots when the target
frame's frame_type is KEY_FRAME (0). In addition, returning -EAGAIN here sk=
ips
aml_av1_frame_done(), so av1_config_next_ref_info() is not called to update
the parser's reference table at 0x11a0 until the core is restarted.

Should this check av1_slots[av1_shown_slot].frame_type =3D=3D 0 and call
av1_config_next_ref_info() when the reference slots are updated?

> +
> +	frame_type =3D pr[AV1_RPM_FRAME_TYPE];
> +	inter =3D (frame_type =3D=3D 1);

[Severity: Medium]
Does setting inter =3D (frame_type =3D=3D 1) in aml_av1_config_picture() mi=
sclassify
AV1 S-frames (SWITCH_FRAME, frame_type =3D=3D 3) as intra frames?

In AV1, a SWITCH_FRAME is an inter-predicted frame that uses active referen=
ce
frames. With inter false for frame_type =3D=3D 3, aml_av1_config_picture() =
points
av1_frame_slot[1..7] at av1_cur_slot instead of the reference slots, clears
av1_prev_valid, resets GMC to identity, and zeroes the motion prediction
reference registers.

Should inter be true for both frame_type =3D=3D 1 and frame_type =3D=3D 3?

[ ... ]

> +	base[0] =3D pr[AV1_RPM_LF_LEVEL_0];
> +	base[1] =3D pr[AV1_RPM_LF_LEVEL_U];
> +	base[2] =3D pr[AV1_RPM_LF_LEVEL_V];
> +
> +	for (i =3D 0; i < 8; i++)
> +		ref_deltas[i] =3D (s8)(i =3D=3D 0 ? 1 : (i =3D=3D 4 || i >=3D 6 ? -1 :=
 0));
> +	mode_deltas[0] =3D 0;
> +	mode_deltas[1] =3D 0;
> +
> +	/*
> +	 * lfi->lvl[plane][seg][dir][ref][mode], flattened the way the hardware
> +	 * wants it: 192 words, each packing the two directions and two modes f=
or
> +	 * one (plane, segment, ref).  Every block in a key frame is intra, so
> +	 * only the INTRA_FRAME reference delta contributes.
> +	 */
> +	for (i =3D 0; i < 192; i++) {
> +		u32 lvl;
> +		int seg;
> +		int ref =3D i & 7;
> +		int scale, v;
> +
> +		plane =3D (i >> 6) & 3;
> +		seg =3D (i >> 3) & 7;
> +		(void)seg;
> +
> +		scale =3D 1 << (base[plane] >> 5);
> +		v =3D av1_clamp_lvl(base[plane] + ref_deltas[ref] * scale);
> +		lvl =3D ((v & 0x3f) << 24) | ((v & 0x3f) << 16) |
> +		      ((v & 0x3f) << 8) | (v & 0x3f);
> +		if (!pr[AV1_RPM_LF_LEVEL_0] && !pr[AV1_RPM_LF_LEVEL_1])
> +			lvl =3D 0;
> +		wr(hw, HEVC_DBLK_CFGA, lvl);
> +	}

[Severity: Medium]
Are the loop filter levels in HEVC_DBLK_CFGA and HEVC_DBLK_DBLK1 programmed
accurately when horizontal and vertical luma levels differ or when custom
loop filter deltas are present?

In aml_av1_config_picture(), all four bytes of each HEVC_DBLK_CFGA word (co=
vering
both directions and both modes) are computed from base[0] (AV1_RPM_LF_LEVEL=
_0),
ignoring AV1_RPM_LF_LEVEL_1 for the second luma direction. Also, ref_deltas=
[]
and mode_deltas[] are hardcoded to the default table rather than reading
AV1_RPM_LF_REF_DELTAS_0 and AV1_RPM_LF_MODE_DELTAS_0 from the RPM buffer, a=
nd
ref_deltas[ref] * scale is applied even when AV1_RPM_LF_MODE_REF_DELTA is
disabled or when base[plane] is 0.

Should the loop filter table incorporate AV1_RPM_LF_LEVEL_1 and the parsed
ref/mode deltas from the RPM buffer?

[ ... ]

> +int aml_av1_save_nv12(struct aml_vdec_hw *hw, const char *path, bool app=
end)
> +{
> +	const u8 *y;
> +	size_t i, nz =3D 0;
> +	struct file *f;
> +	loff_t pos =3D 0;
> +	size_t len;
> +
> +	/* Only write a frame the stream actually asked to be displayed. */
> +	if (av1_out_slot < 0)
> +		return -EAGAIN;
> +	y =3D av1_slots[av1_out_slot].dw_v;
> +	dma_sync_single_for_cpu(hw->dev, av1_slots[av1_out_slot].dw_p,
> +				av1_slot_dw_size, DMA_FROM_DEVICE);
> +	av1_out_slot =3D -1;
> +	if (!y)
> +		return -ENODEV;
> +
> +	len =3D av1_ws.dw_width * av1_ws.dw_height * 3 / 2;
> +	for (i =3D 0; i < len; i++)
> +		if (y[i])
> +			nz++;
> +	dev_info(hw->dev, "av1: nv12 %zu/%zu non-zero, Y[0..15] %*ph\n",
> +		 nz, len, 16, y);
> +
> +	f =3D filp_open(path, O_WRONLY | O_CREAT |
> +		      (append ? O_APPEND : O_TRUNC), 0644);
> +	if (IS_ERR(f))
> +		return PTR_ERR(f);
> +	if (append)
> +		pos =3D i_size_read(file_inode(f));
> +	kernel_write(f, y, len, &pos);
> +	filp_close(f, NULL);
> +	dev_info(hw->dev, "av1: wrote %zu bytes of NV12 to %s\n", len, path);
> +	return 0;
> +}

[Severity: Medium]
Can the unused bring-up helpers and unused workspace carve-outs be removed?

aml_av1_save_nv12() writes directly to a filesystem path using filp_open() =
and
kernel_write(), and along with aml_av1_feed(), aml_av1_dump_stream_state(),
aml_av1_dump_ucode_output(), aml_av1_frame_type(), aml_av1_dump_params(), a=
nd
aml_av1_dump_output(), has no callers in the tree.

Similarly, in av1_alloc(), side_vaddr allocates and carves out prob, count,=
 mv,
and cm_header[16] (~249 KiB of coherent DMA memory) which are never referen=
ced
once the per-slot allocations are used.

[ ... ]

> +static void av1_copy_out(struct aml_av1_ctx *av1, struct vb2_v4l2_buffer=
 *dst)
> +{
> +	struct v4l2_pix_format_mplane *pf =3D
> +		&av1->v4l2_ctx->pix_fmt[AML_FMT_DST];
> +	struct vb2_buffer *vb =3D &dst->vb2_buf;
> +	u32 w =3D av1_ws.dw_width, h =3D av1_ws.dw_height;
> +	u32 dst_stride =3D pf->plane_fmt[0].bytesperline ? : w;
> +	u32 dst_h =3D pf->height ? : h;
> +	const u8 *src;
> +	u8 *y, *c;
> +	u32 row;
> +	int slot =3D av1_out_slot;
> +
> +	if (slot < 0)
> +		return;
> +	src =3D av1_slots[slot].dw_v;
> +	av1_out_slot =3D -1;
> +
> +	/*
> +	 * Zero copy: the hardware already wrote this picture into the CAPTURE
> +	 * buffer.  Nothing to move, only the payload to declare.
> +	 */
> +	if (av1_dw_target_y) {
> +		if (vb->num_planes >=3D 2) {
> +			vb2_set_plane_payload(vb, 0, dst_stride * dst_h);
> +			vb2_set_plane_payload(vb, 1, dst_stride * dst_h / 2);
> +		} else {
> +			vb2_set_plane_payload(vb, 0, dst_stride * dst_h * 3 / 2);
> +		}
> +		av1->have_picture =3D true;
> +		return;
> +	}
> +
> +	dma_sync_single_for_cpu(av1->hw->dev, av1_slots[slot].dw_p,
> +				av1_slot_dw_size, DMA_FROM_DEVICE);
> +	if (!src)
> +		return;
> +
> +	/*
> +	 * The decoder writes a tightly packed w x h picture; the capture
> +	 * buffer may be wider and taller, because the format is aligned up.
> +	 * Copy row by row rather than assuming the two agree - they do not:
> +	 * a 320x240 stream gets a 320x256 capture buffer, so chroma starts a
> +	 * stride times 16 rows further in than the source has it.
> +	 */
> +	y =3D vb2_plane_vaddr(vb, 0);
> +	c =3D vb->num_planes >=3D 2 ? vb2_plane_vaddr(vb, 1)
> +				: y + dst_stride * dst_h;
> +	if (!y || !c)
> +		return;
> +
> +	for (row =3D 0; row < h; row++)
> +		memcpy(y + row * dst_stride, src + row * w, w);
> +	for (row =3D 0; row < h / 2; row++)
> +		memcpy(c + row * dst_stride, src + w * h + row * w, w);

[Severity: Critical]
Does av1_copy_out() overflow the destination CAPTURE buffer when
av1_dw_target_y is 0 and the stream dimensions exceed the negotiated CAPTURE
format?

When av1_dw_target_y is 0 (such as on the raw-OBU path or when direct
double-write is not used), aml_av1_config_picture() does not check width and
height against the CAPTURE buffer size. In av1_copy_out(), the loops copy h
rows of w bytes into y and h / 2 rows of w bytes into c without verifying t=
hat
w <=3D dst_stride, h <=3D dst_h, or that vb2_plane_size() for each plane ca=
n hold
the data.

If userspace leaves the CAPTURE format at a smaller resolution (e.g. 64x64)=
 and
feeds a larger frame, will memcpy() write past the end of the CAPTURE buffe=
r?

> +	aml_vdec_dst_cpu_written(av1->hw->dev, vb);
> +
> +	if (vb->num_planes >=3D 2) {
> +		vb2_set_plane_payload(vb, 0, dst_stride * dst_h);
> +		vb2_set_plane_payload(vb, 1, dst_stride * dst_h / 2);
> +	} else {
> +		vb2_set_plane_payload(vb, 0, dst_stride * dst_h * 3 / 2);
> +	}
> +	av1->have_picture =3D true;
> +}
> +
> +static void av1_finish(struct aml_av1_ctx *av1, enum vb2_buffer_state st=
ate)
> +{
> +	struct aml_vdec_ctx *ctx =3D av1->v4l2_ctx;
> +	struct vb2_v4l2_buffer *dst;
> +	unsigned int i;
> +
> +	/*
> +	 * A buffer holding only a hidden frame decodes fine and produces
> +	 * nothing to show.  Say so with a zero payload - otherwise the
> +	 * capture buffer goes back to userspace still describing whatever it
> +	 * held last time, which reads as a repeat of an older picture.
> +	 */
> +	if (!av1->have_picture) {
> +		dst =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +		if (dst)
> +			for (i =3D 0; i < dst->vb2_buf.num_planes; i++)
> +				vb2_set_plane_payload(&dst->vb2_buf, i, 0);
> +	}
> +
> +	/*
> +	 * Complete the request before the buffer is handed back.  Doing it
> +	 * afterwards - which is what device_run() would do, since run() only
> +	 * returns once this has already finished the job - binds the control
> +	 * objects to a request that has already completed, and the media
> +	 * controller warns about it.
> +	 */
> +	dst =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +	if (dst && dst->vb2_buf.req_obj.req)
> +		v4l2_ctrl_request_complete(dst->vb2_buf.req_obj.req,
> +					   &ctx->ctrl_handler);
> +
> +	ctx->int_cond =3D 1;
> +	ctx->job_finished =3D true;
> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev_dec, ctx->m2m_ctx,
> +					 state);
> +	wake_up(&ctx->queue);
> +}

[Severity: High]
Does calling v4l2_m2m_buf_done_and_job_finish() inside av1_finish() return
src_buf and dst_buf to userspace before m2mops_vdec_device_run() copies buf=
fer
metadata?

In drivers/media/platform/amlogic/vdec/aml_vdec.c:m2mops_vdec_device_run():

	ctx->job_finished =3D false;
	ret =3D ctx->codec_ops->run(ctx);

	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);

While aml_av1_dec_run() waits on ctx->queue, av1_irq_thread() calls
av1_finish(), which invokes v4l2_m2m_buf_done_and_job_finish(). That marks
src_buf and dst_buf done (allowing userspace to dequeue dst_buf without its
timestamp or flags copied) and finishes the M2M job before aml_av1_dec_run()
returns to m2mops_vdec_device_run(), which then touches src_buf and dst_buf=
 in
v4l2_m2m_buf_copy_metadata().

[ ... ]

> +void aml_av1_exit(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_av1_ctx *av1 =3D ctx->codec_priv;
> +
> +	if (!av1)
> +		return;
> +
> +	av1->hw->hevc_irq_thread_fn =3D NULL;
> +	av1->hw->hevc_priv =3D NULL;
> +	if (av1->started) {
> +		regmap_write(av1->hw->map[DOS_BUS], HEVC_MPSR, 0);
> +		aml_av1_teardown(av1->hw);
> +		/*
> +		 * Deliberately not hvdec_disable(): powering the HEVC core
> +		 * down here leaves it in a state the next context's bring-up
> +		 * does not recover from, and every frame of the *second*
> +		 * decode session on this core then times out - whichever
> +		 * codec it is.  The domain is left up until the module is
> +		 * unloaded.
> +		 */
> +	}
> +	kfree(av1);
> +	ctx->codec_priv =3D NULL;
> +}

[Severity: Critical]
What prevents aml_av1_exit() from racing with hevc_irq_thread() and freeing
av1, av1_ws, and av1_slots while av1_irq_thread() is running?

In drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:hevc_irq_thread():

	if (hw->hevc_irq_thread_fn)
		return hw->hevc_irq_thread_fn(irq, hw->hevc_priv);

In aml_av1_exit(), hevc_irq_thread_fn and hevc_priv are cleared before halt=
ing
HEVC_MPSR or masking HEVC_ASSIST_MBOX0_MASK, and synchronize_irq(av1->hw->h=
evc_irq)
is never called.

If hevc_irq_thread() loads hw->hevc_irq_thread_fn just before it is cleared=
 and
then passes a NULL hw->hevc_priv to av1_irq_thread(), av1_irq_thread() will
dereference NULL. Furthermore, if av1_irq_thread() is still executing (for
example right after calling wake_up(&ctx->queue) in av1_finish(), or after a
decode timeout), aml_av1_exit() can tear down all DMA buffers and kfree(av1)
underneath the running IRQ thread.

Should aml_av1_exit() halt the processor and mask the mailbox interrupt fir=
st,
call synchronize_irq(av1->hw->hevc_irq), and only then clear the IRQ callba=
ck
pointers and free the buffers?

> +
> +/*
> + * Point the double-write unit at the CAPTURE buffer this frame will be =
handed
> + * back in.  Only safe when the buffer is laid out exactly the way the h=
ardware
> + * writes: stride equal to the picture width, chroma immediately after l=
uma.
> + * Anything else falls back to the slot buffer and the row-by-row copy.
> + */
> +static void av1_set_dw_target(struct aml_vdec_ctx *ctx)
> +{
> +	struct v4l2_pix_format_mplane *pf =3D &ctx->pix_fmt[AML_FMT_DST];
> +	struct vb2_v4l2_buffer *dst =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	struct vb2_buffer *vb;
> +
> +	av1_dw_target_y =3D 0;
> +	av1_dw_target_c =3D 0;
> +	av1_dw_target_size =3D 0;
> +	if (!dst)
> +		return;
> +	vb =3D &dst->vb2_buf;
> +
> +	if (pf->plane_fmt[0].bytesperline !=3D pf->width)
> +		return;
> +
> +	av1_dw_target_y =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +	if (!av1_dw_target_y)
> +		return;
> +	if (vb->num_planes >=3D 2) {
> +		av1_dw_target_c =3D vb2_dma_contig_plane_dma_addr(vb, 1);
> +		av1_dw_target_size =3D vb2_plane_size(vb, 0) +
> +				     vb2_plane_size(vb, 1);
> +		if (!av1_dw_target_c) {
> +			av1_dw_target_y =3D 0;
> +			return;
> +		}
> +	} else {
> +		av1_dw_target_c =3D av1_dw_target_y +
> +				  (dma_addr_t)pf->width * pf->height;
> +		av1_dw_target_size =3D vb2_plane_size(vb, 0);
> +	}
> +}

[Severity: Critical]
Are there three issues with the direct double-write path configured by
av1_set_dw_target()?

1. In aml_vdec.c:vdec_try_fmt_mp(), pf->width and pf->height are aligned up=
 to
64 before v4l2_fill_pixfmt_mp() sets pf->plane_fmt[0].bytesperline =3D pf->=
width.
Because pf->plane_fmt[0].bytesperline =3D=3D pf->width is always true,
av1_set_dw_target() enables direct double-write even when the stream's actu=
al
width (e.g. 854x480 or 720x480) is not a multiple of 64. The hardware then
writes tightly packed rows of width bytes into a CAPTURE buffer expecting a
64-aligned stride, and av1_copy_out() skips the row-by-row stride conversio=
n.

2. For NV12M (vb->num_planes >=3D 2), av1_set_dw_target() sums the two plane
sizes into a single av1_dw_target_size, and aml_av1_config_picture() only
checks width * height * 3 / 2 <=3D av1_dw_target_size instead of checking e=
ach
plane's size individually. For single-plane NV12, av1_dw_target_c is placed=
 at
av1_dw_target_y + pf->width * pf->height without verifying in
aml_av1_config_picture() that the parsed width and height match pf->width a=
nd
pf->height, so a height or width mismatch can cause luma DMA to overwrite
chroma or chroma DMA to write past the end of the buffer.

3. When aml_av1_config_picture() encounters show_existing_frame, it returns
-EAGAIN without running a decode. Because av1_dw_target_y is non-zero,
av1_alloc_slots() did not allocate per-slot dw_v buffers, and av1_copy_out()
returns the untouched CAPTURE buffer to userspace as a valid frame.

> +
> +int aml_av1_dec_run(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_av1_ctx *av1 =3D ctx->codec_priv;
> +	struct aml_vdec_hw *hw =3D av1->hw;
> +	struct vb2_v4l2_buffer *src;
> +	struct vb2_buffer *vb;
> +	struct v4l2_ctrl *seq_ctrl;
> +	int ret;
> +
> +	src =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +	if (!src)
> +		return -EINVAL;
> +	vb =3D &src->vb2_buf;
> +
> +	ret =3D hvdec_enable(hw);
> +	if (ret)
> +		return ret;
> +	dos_enable_hevc(hw);

[Severity: High]
Does calling hvdec_enable(hw) on every frame in aml_av1_dec_run() leak the
HVDEC power-domain reference count and clock?

hvdec_enable() calls vdec_poweron(hw, HVDEC), which increments
hw->pm->pd_data[HVDEC].ref_count on every invocation and enables the hevcf
clock and runtime PM on the first call. However, hvdec_disable() is only
called on the two early error paths in aml_av1_dec_run() when loading
firmware or bringing up the workspace fails, and is never called when a fra=
me
finishes or in aml_av1_exit().

> +
> +	if (!av1->ucode_loaded) {
> +		/*
> +		 * As for VP9: after a 10-bit stream the core decodes the next
> +		 * 8-bit one to garbage until its memories are cycled.
> +		 * av1_ten_bit still holds the last stream's depth here.
> +		 */
> +		if (av1_ten_bit)
> +			hw->hevc_dirty =3D true;
> +		av1_ten_bit =3D false;
> +		hvdec_switch_codec(hw, CODEC_TYPE_AV1);
> +
> +		/*
> +		 * Halts the AMRISC first: the other codec on this core may
> +		 * still be running - VP9 and AV1 share it - and loading over a
> +		 * running microcode leaves the core timing out every frame.
> +		 */
> +		ret =3D hevc_load_fw(hw, CODEC_TYPE_AV1, AV1_FW_FORMAT_MMU, AV1_FW_COR=
E_HEVC, "av1");
> +		if (ret) {
> +			hvdec_disable(hw);
> +			return ret;
> +		}
> +		av1->ucode_loaded =3D true;
> +	}
> +
> +	if (!av1->started) {
> +		ret =3D aml_av1_bringup(hw, ctx->pix_fmt[AML_FMT_SRC].width,
> +				      ctx->pix_fmt[AML_FMT_SRC].height);
> +		if (ret) {
> +			hvdec_disable(hw);
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * Two shapes of OUTPUT buffer have to work.
> +	 *
> +	 * The stateless API keeps the sequence in a control and hands over the
> +	 * frame OBU's *payload*, header stripped - that is what GStreamer's
> +	 * v4l2slav1dec sends.  Rebuild the sequence header from the control
> +	 * and put the frame's OBU header back.
> +	 *
> +	 * Without that control the buffer is taken to be a plain OBU stream,
> +	 * carrying its own sequence header, which is what a simple client
> +	 * feeding temporal units does.  The microcode parses the bitstream
> +	 * either way, so it has to end up with real OBUs.
> +	 */
> +	seq_ctrl =3D v4l2_ctrl_find(&ctx->ctrl_handler,
> +				  V4L2_CID_STATELESS_AV1_SEQUENCE);
> +	if (seq_ctrl && aml_av1_set_sequence(seq_ctrl->p_cur.p)) {
> +		struct v4l2_ctrl *frame_ctrl =3D
> +			v4l2_ctrl_find(&ctx->ctrl_handler,
> +				       V4L2_CID_STATELESS_AV1_FRAME);
> +
> +		av1_cur_ts =3D vb->timestamp;
> +		if (frame_ctrl)
> +			av1_apply_reference_ts(frame_ctrl->p_cur.p);
> +		av1_set_dw_target(ctx);
> +		ret =3D aml_av1_feed_frame(hw, vb2_plane_vaddr(vb, 0),
> +					 vb2_get_plane_payload(vb, 0));
> +	} else {
> +		av1_dw_target_y =3D 0;
> +		av1_dw_target_c =3D 0;
> +		av1_dw_target_size =3D 0;
> +		if (!aml_av1_have_sequence() &&
> +		    !av1_buf_has_sequence(vb2_plane_vaddr(vb, 0),
> +					  vb2_get_plane_payload(vb, 0))) {
> +			dev_err_once(hw->dev,
> +				     "av1: no sequence header, and no usable sequence control\n");
> +			return -EINVAL;
> +		}
> +		ret =3D aml_av1_feed_buf(hw, vb2_plane_vaddr(vb, 0),
> +				       vb2_get_plane_payload(vb, 0),
> +				       AOM_AV1_SEARCH_HEAD);
> +	}
> +	if (ret)
> +		return ret;

[Severity: High]
If aml_av1_dec_run() returns an error here before av1->started is set to tr=
ue,
does it leak the coherent DMA buffers allocated in aml_av1_bringup() and
av1_alloc_stream()?

When !av1->started, aml_av1_bringup() allocates av1_ws.vaddr,
av1_ws.side_vaddr, and av1_ws.guard_vaddr, and aml_av1_feed_frame() /
aml_av1_feed_buf() allocates av1_ws.stream_vaddr. If feeding the buffer fai=
ls
(or returns -EINVAL when no sequence header is present), aml_av1_dec_run()
returns while av1->started is still false. When the context is later closed,
aml_av1_exit() only calls aml_av1_teardown() if (av1->started), leaving ~6 =
MiB
of coherent DMA allocations leaked.

> +
> +	av1->rounds =3D 0;
> +	av1->have_picture =3D false;
> +	ctx->int_cond =3D 0;
> +	atomic_set(&hw->hevc_irq_count, 0);
> +
> +	/*
> +	 * The microcode runs for the life of the stream: it is started once
> +	 * and afterwards simply told to look for the next frame header.
> +	 * Restarting it per buffer - or powering the core down between
> +	 * buffers - loses its state, and every buffer after the first then
> +	 * times out with the program counter parked at 1 or 2.
> +	 */
> +	if (av1->started) {
> +		/*
> +		 * The microcode reports NAL_DECODE_DONE when it runs out of
> +		 * data and parks in its search loop; handing it another
> +		 * SEARCH_HEAD there does not make it look at a refilled FIFO.
> +		 * Restart it instead.  Everything that has to persist between
> +		 * buffers - the picture slots, their compressed data, the CDF
> +		 * contexts - lives in DRAM and is re-pointed for every
> +		 * picture, so a restart costs only the parser's reference map.
> +		 */
> +		regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 0);
> +		regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
> +	}

[Severity: High]
On frames after the first (when av1->started is true), is it safe to call
aml_av1_feed_frame() or aml_av1_feed_buf() before halting HEVC_MPSR and
resetting the core?

While HEVC_MPSR and HEVC_STREAM_CONTROL bit 0 are still active from the
previous frame, aml_av1_feed_frame() / aml_av1_feed_buf() can free and
reallocate av1_ws.stream_vaddr in av1_alloc_stream(), zero the live stream
buffer, rewrite the FIFO registers, and write AOM_AV1_SEARCH_HEAD to
HEVC_DEC_STATUS_REG in av1_program_fifo() before aml_av1_dec_run() resets
av1->rounds, av1->have_picture, ctx->int_cond, HEVC_MPSR, and DOS_SW_RESET3.

Should the AMRISC halt (HEVC_MPSR =3D 0, HEVC_CPSR =3D 0) and state reset h=
appen
before modifying the stream buffer and programming the FIFO?

> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, BIT(12) | BIT(11));
> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, 0);
> +	if (av1->started)
> +		aml_av1_restore_refs(hw);
> +	regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_CLR_REG, 1);
> +	regmap_write(hw->map[DOS_BUS], HEVC_DEC_STATUS_REG, AOM_AV1_SEARCH_HEAD=
);
> +	regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 1);
> +	av1->started =3D true;

[Severity: High]
Can setting av1->started =3D true after writing HEVC_MPSR =3D 1 race with t=
he
error path in av1_irq_thread()?

Once HEVC_MPSR =3D 1 is written, the microcode starts immediately and can t=
rigger
an interrupt on another CPU before aml_av1_dec_run() executes
av1->started =3D true. If aml_av1_config_picture() fails in av1_irq_thread(=
):

			regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 0);
			regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
			aml_av1_teardown(hw);
			av1->started =3D false;

aml_av1_dec_run() can then overwrite av1->started back to true after
aml_av1_teardown() has already freed all workspace buffers, causing the next
frame to skip aml_av1_bringup() and DMA into freed memory.

Should av1->started =3D true be set before writing HEVC_MPSR =3D 1?

> +
> +	/*
> +	 * Uninterruptible on purpose: a signal must not abandon a decode the
> +	 * hardware is still running - see the note in vp9.c.
> +	 */
> +	ret =3D wait_event_timeout(ctx->queue, ctx->int_cond,
> +				 msecs_to_jiffies(AV1_TIMEOUT_MS));
> +	if (!ret) {
> +		/*
> +		 * Report the failure and let device_run() cancel the job.
> +		 * Finishing it here as well was a double completion: the
> +		 * caller runs its own error path on a negative return, and
> +		 * the media core warns about the second one.
> +		 */
> +		dev_err(hw->dev, "av1: decode timeout, status %02x pc %08x\n",
> +			hw->hevc_irq_status,
> +			read_dos_reg(hw, HEVC_MPC_E));
> +		hw->hevc_dirty =3D true;
> +		ret =3D -ETIMEDOUT;
> +	} else {
> +		ret =3D 0;
> +	}
> +	ctx->int_cond =3D 0;
> +	return ret;
> +}

[Severity: Critical]
When wait_event_timeout() times out here, isn't the hardware still running =
and
able to DMA into the CAPTURE buffer or fire av1_irq_thread() after the job =
is
cancelled?

On timeout, aml_av1_dec_run() returns -ETIMEDOUT without halting HEVC_MPSR /
HEVC_CPSR, resetting DOS_SW_RESET3, masking HEVC_ASSIST_MBOX0_MASK, or call=
ing
synchronize_irq(hw->hevc_irq). m2mops_vdec_device_run() then jumps to
err_cancel_job and returns the CAPTURE buffer to userspace while the hardwa=
re
may still be DMA-writing into av1_dw_target_y / av1_dw_target_c.

In addition:
1. If av1_irq_thread() is currently running (for instance, blocked in
dma_alloc_coherent() inside av1_alloc_slots()) or fires right after the
timeout, it does not check whether the job was already cancelled and will c=
all
av1_finish(), completing the media request and M2M job a second time.
2. In av1_irq_thread(), the runaway decode path (++av1->rounds > 256) also
calls av1_finish() without halting HEVC_MPSR or masking the mailbox interru=
pt.
3. Setting hw->hevc_dirty =3D true on timeout does not cycle the core memor=
ies on
the next frame of the same context, because aml_av1_dec_run() only calls
hvdec_switch_codec() and hevc_load_fw() when !av1->ucode_loaded.

Should the timeout and runaway paths halt the AMRISC, reset the core, mask =
the
mailbox interrupt, synchronize the IRQ, and force microcode reload on the n=
ext
run?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192507.2100=
58-1-christian.koever-draxl@student.uibk.ac.at?part=3D7
