Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617378;
	b=O/ALUkusdH0zQIa31rmNOTSo1WTIMxNB2/SjQoRDAqezWgm+3A6RPSXJZrjloeqcKNLs
	 dtgWyJHRxN5WhMCtDJVsympCNyJETG4WfbF1TTHWa3EsR/nowAEzMnEKOcNBw4ePPnWqO
	 NuK+2PoQs3D13FA441n7LB5nqPqeFi2SEB3yK0l757gQML6V7KBsHZqrALMvs4gbqT85T
	 tvnvG3fDjNRePkSR0PYMaJ0cARmYT/CYoWjWh05EnSkzGcL7kRISJCT62PNAXR+golgDV
	 zx46wmxOVPcCateeY6J7irfv7VnvadTX6aioT5JUKS/2CDx8NLrAkXcGm2cpBofg4Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617378;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CuPo69Bt2d/Z2NHIpCqclmwAPbn4rVhCPPDO1+/ROOc=;
	b=Ww+QuxobQr9iOKMjX0J7cz7BRg+m+fB7nn29IEefoXt8++kgnRwUiHBafwXwneHXKs95
	 hwjxitaSUHJyBMHo485hQKfgpGM34ETTeKA6NWz0CCKBhQKpWTW4P6eIdK3aeJhi1d4zp
	 ug6oKfeiKpv9HwO03+oo1/9BcW7FX6sdUx+383RjQTb4lzFkcCVt61XP8awyqKiF4bobj
	 OohB5nYdsIP5q+4pWr7aCgrkpL1b+Obq6hkN9Xsomdxpj3xNG9cTGJSJNG3JWwB6mBQCB
	 ny283ei+LxnIKWoEwNV4ylHFVsjl5SbzYdukFQvrnLi/pGCYn5PzunC55qjyMcSrt4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCoq82Dj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA30606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCoq82Dj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F7F1F00A16;
	Mon,  2 Nov 2026 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617377;
	bh=CuPo69Bt2d/Z2NHIpCqclmwAPbn4rVhCPPDO1+/ROOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fCoq82Dj+epzxNNfzBmtUPNqc8RWFdMfOHBTkKVH9QDpgg3myKV8AiZEUYqy8MTYC
	 CW2M/lRldCBrq0ERfdDcRfwEQCqjwFO/IxfzEoYcVpPnDLlK2kfx3f7nPtvXKoG+n9
	 /Ye8oY+mN+pwpl52ZHoWoNEvKrVVVpbVdpKEl6fFwFLGB2tW+8XmLXBL1oMdUicx/h
	 Hx1p1ZuUb0EItcg07ay8FrXuh+nVGgOE5KGFRD18rtpNcTRIiNHQBFnUIoSbXC1MxB
	 bvzeAJ9gBulK4//OdhUOSEejENAF2rTMaL9Xq2i0NbOL3lnsJ4HNy95Tlah5MXXGQo
	 C8ScFweaxzzlg==
Message-ID: <sashiko-outbox-193308@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 09/15] media: qcom: camss: csid: Add support for
 CSID 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102-kaanapali-camss-v24-9-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-9-d6b8f3f6f66f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 11:02:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] media: qcom: camss: unconditional AUP triggers in csid_configure_s=
tream()
- [Medium] media: qcom: camss: out-of-bounds csid->fmt access in __csid_con=
figure_rdi_stream()
- [Medium] media: qcom: camss: race on addr_update and reg_update in csid_i=
sr()
- [Low] media: qcom: camss: unused variable lane_cnt in __csid_configure_rd=
i_stream()
- [Low] media: qcom: camss: malformed kernel-doc Return sections in camss-c=
sid-1080.c
--

commit b46b9d6d26210a3faaa024307adfd55c2501ce00
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1080

This commit adds hardware resource descriptions, register programming,
reset handling, and interrupt support for the CSID 1080 module found on
the Kaanapali SoC.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 0000000000000..3d90d31201fa5
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> @@ -0,0 +1,402 @@

[ ... ]

> +#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)

[ ... ]

> +static void __csid_aup_rup_trigger(struct csid_device *csid)
> +{
> +	/* trigger SET in combined register */
> +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
> +static void __csid_addr_update(struct csid_device *csid, int port_id)
> +{
> +	csid->addr_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->addr_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_addr_update_clear(struct csid_device *csid, int port_=
id)
> +{
> +	csid->addr_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->reg_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->reg_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update_clear(struct csid_device *csid, int port_i=
d)
> +{
> +	csid->reg_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}

[Severity: Medium]
As reported by Sashiko on v14 [1], can concurrent updates to
csid->addr_update and csid->reg_update race between process context and
interrupt context?

In __csid_addr_update(), __csid_addr_update_clear(), __csid_reg_update(),
and __csid_reg_update_clear(), the bitmasks in csid->addr_update and
csid->reg_update are modified with non-atomic |=3D and &=3D ~ operations, a=
nd
the full multi-port mask is written to CSID_AUP_CMD and CSID_RUP_CMD.

While vfe_queue_buffer_v2() and vfe_enable_output_v2() invoke
csid_subdev_addr_update() and csid_subdev_reg_update() under
vfe->output_lock, csid_configure_stream() calls __csid_addr_update() and
__csid_reg_update() without a lock, and csid_isr() clears those fields via
__csid_addr_update_clear() and __csid_reg_update_clear() before
camss_buf_done() acquires vfe->output_lock.

In addition, within csid_isr(), camss_buf_done() is called for port i
before higher-numbered RDI ports have had their INFO_RUP_DONE status
checked and cleared in the loop, so a buffer update triggered from
camss_buf_done() on port i can re-write CSID_AUP_CMD and CSID_RUP_CMD
with stale bits still set for those higher-numbered ports.

[ ... ]

> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
> +{
> +	u8 lane_cnt =3D csid->phy.lane_cnt;
> +	u32 val;
> +
> +	/* Source pads matching RDI channels on hardware.
> +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> +	 */
> +	struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_PAD_FIR=
ST_SRC + port];
> +	const struct csid_format_info *format =3D csid_get_fmt_entry(csid->res-=
>formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +
> +	if (!lane_cnt)
> +		lane_cnt =3D 4;

[Severity: Low]
As reported by Sashiko on v23 [2], lane_cnt is initialized and updated in
__csid_configure_rdi_stream(), but it is never read anywhere in the
function. Will this trigger an unused-but-set-variable compiler warning?

> +
> +	val =3D RDI_CFG0_TIMESTAMP_EN;
> +	val |=3D RDI_CFG0_TIMESTAMP_STB_SEL;
> +	val |=3D RDI_CFG0_RETIME_BS;
> +
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |=3D vc << RDI_CFG0_VC;
> +	val |=3D format->data_type << RDI_CFG0_DT;
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
> +
> +	val =3D RDI_CFG1_PACKING_FORMAT_MIPI;
> +	writel(val, csid->base + CSID_RDI_CFG1(port));
> +
> +	/* Configure pixel store using dedicated register in 1080 */
> +	if (!csid_is_lite(csid))
> +		__csid_configure_rdi_pix_store(csid, port);
> +
> +	val =3D 0;
> +	writel(val, csid->base + CSID_RDI_CTRL(port));
> +
> +	val =3D readl(csid->base + CSID_RDI_CFG0(port));
> +
> +	if (enable)
> +		val |=3D RDI_CFG0_EN;
> +
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i, 0);
> +			__csid_configure_rx_vc(csid, 0);

[Severity: Medium]
As reported by Sashiko on v14 [1], can __csid_configure_rdi_stream() index
past the end of csid->fmt[] when i reaches 4?

For non-lite CSID 1080 instances, MSM_CSID_MAX_SRC_STREAMS_1080 evaluates
to 5, so csid_configure_stream() iterates i from 0 to 4 and passes i as
port to __csid_configure_rdi_stream():

    struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_PAD_FIR=
ST_SRC + port];

However, in drivers/media/platform/qcom/camss/camss-csid.h,
MSM_CSID_PAD_FIRST_SRC is 1 and MSM_CSID_PADS_NUM is 5 (1 sink pad and 4
source pads), sizing both csid->pads[MSM_CSID_PADS_NUM] and
csid->fmt[MSM_CSID_PADS_NUM] to 5 elements (indices 0..4). When port is 4,
MSM_CSID_PAD_FIRST_SRC + port evaluates to 5, which is one element past
the end of csid->fmt[].

> +
> +			for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
> +				__csid_addr_update(csid, i);
> +
> +			__csid_reg_update(csid, i);

[Severity: High]
Does unconditionally calling __csid_addr_update() CAMSS_INIT_BUF_COUNT (2)
times here match the buffers actually programmed in vfe_enable_output_v2()?

During stream startup, vfe_enable_output_v2() in
drivers/media/platform/qcom/camss/camss-vfe.c only calls
ops->vfe_wm_update() for buffers actually present in the pending queue:

    for (i =3D 0; i < CAMSS_INIT_BUF_COUNT; i++) {
        output->buf[i] =3D vfe_buf_get_pending(output);
        if (!output->buf[i])
            break;
        output->gen2.active_num++;
        ops->vfe_wm_update(vfe, output->wm_idx[0],
                   output->buf[i]->addr[0], line);
        if (!ops->addr_update)
            ops->reg_update(vfe, line->id);
    }

If userspace starts streaming with 0 or 1 buffer queued (or when
csid_configure_stream() is called with enable =3D=3D 0),
csid_configure_stream() still triggers two AUPs and one RUP, which can
latch uninitialized or duplicate WM buffer addresses into the hardware
FIFO. Even when 2 buffers are queued prior to stream-on,
vfe_enable_output_v2() writes both buffer addresses to the WM register
before any AUP is issued.

> +
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +	}
> +}

[ ... ]

> +/**
> + * csid_isr - CSID module interrupt service routine
> + * @irq: Interrupt line
> + * @dev: CSID device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t csid_isr(int irq, void *dev)
> +{

[ ... ]

> +}
> +
> +/**
> + * csid_reset - Trigger reset on CSID module and wait to complete
> + * @csid: CSID device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */

[Severity: Low]
This isn't a bug, but the kernel-doc comments for csid_isr() and
csid_reset() use "Return" instead of "Return:", which causes
scripts/kernel-doc to warn about a missing return value description under
W=3D1 builds.

[1] https://lore.kernel.org/r/20260601162737.8D2531F00893@smtp.kernel.org
[2] https://lore.kernel.org/r/20261028-kaanapali-camss-v23-9-95f250b18612@o=
ss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-kaanapali-=
camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=3D9
