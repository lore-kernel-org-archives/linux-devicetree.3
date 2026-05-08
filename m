Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980B23612CF
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275334; cv=none; b=EySxcytgOzUtptwwYtRVELPYHXVyJbvtGNK1VabvvSbk9xwGnJ53idbEyvJhGcMNnsH5ptvIrx04OY3iRj4P0W5CLsCNoefG9ojO/jRxZD6S5h6X6ScWbwIdeHSoLyU4YUAN2IVVWFXXI4NFyFrefRSOhsMLY0ujiI2KgkGoq90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275334; c=relaxed/simple;
	bh=WDDI0TAFGerkjqc5r4hsuzlVGlILMCOWEaN+J+YyUTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YvhpJv+sEg2bL/Gvj8ImUyMDLFLTTAcBnifCyfFdJxj609wAThrgNoNu3QYoZO524UZ/mfgzInnjqaJd3Bm/jTg9Q338x1LhZm+ZkpqrBUMJ5TdoT12LneDVnlvH75lMn8UwhO8nZU6gpMvTekQGcqmBo+EsAuuIttEdkQFJl9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0yhavm2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0yhavm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED319C2BCB0;
	Fri,  8 May 2026 21:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778275334;
	bh=WDDI0TAFGerkjqc5r4hsuzlVGlILMCOWEaN+J+YyUTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=F0yhavm2JbMC2yJLHr7hpdbhlw5GM36/FxFoKcMAXoXhtNq5i2Cnt2kp5O2qBAfhX
	 dBvEYd2jTa4HCsk2uIXxXJhQwl+cHu48WmF+QLxO612eWge95WERkQYz0GGs2WELZD
	 LK5qCdM8gL0IzmHWY5/DDkNhz328ZpxXjxHwANR7qbwAE7wlh7rHgR/iOKhcB+bl4Q
	 VyZn7q1ekd5mmG3AeEXzDEG05MTzPKJ0Ds4uDOfJxs20Uv/A1flgDmnROyJ/BnSnGX
	 ctHOXA+l/uOsf+QQpz4kF7Z1x/S7X1u0sW/IRv3wp1mpAMkcNdhF/WUtiRs2hkQqji
	 gtRo7+4ow7DCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/5] media: qcom: camss: csid: Add support for CSID
 gen4
Reply-To: sashiko@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-kaanapali-camss-v13-4-2541d8e55651@oss.qualcomm.com>
References: <20260508-kaanapali-camss-v13-4-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:22:13 +0000
Message-Id: <20260508212213.ED319C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Hardcoded virtual channel (VC) parameter breaks multi-VC support a=
nd leaves dead code.
- [High] Out-of-bounds array access on `csid->fmt` when configuring the 5th=
 stream.
- [High] Concurrent read-modify-write on shared hardware update state witho=
ut locking.
- [High] RDI and RUP_DONE interrupts are permanently masked, causing hardwa=
re update states to drift.
- [Medium] Integer underflow in `__csid_configure_rx()` when `lane_cnt` is =
zero causes severe register corruption.
- [Low] Meaningless back-to-back hardware command triggers due to redundant=
 loop.
--

commit ac71c3367c14093dee35b321f0ec55ce9cc5f586
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID gen4
   =20
Add more detailed resource information for CSID devices along with the
driver for CSID gen4 that is responsible for CSID register configuration,
module reset and IRQ handling for BUF_DONE events. And aggregate a common
definition CSI2_RX_CFG0_PHY_SEL_BASE_IDX into csid header file.
   =20
In this CSID version, RUP and AUP update values are split into two
registers along with a SET register. Accordingly, enhance the CSID
interface to accommodate both the legacy combined reg_update and the
split RUP and AUP updates.
   =20
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen4.c
> new file mode 100644
> index 0000000000000..41035352c4bb0
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> @@ -0,0 +1,376 @@

[ ... ]

> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}

The variables csid->aup_update and csid->rup_update track global hardware
update bits and are modified via non-atomic operations here and during
stream configuration.

Since these are accessed from both process context and ISR context, could a
race condition occur where an interrupt firing during a read-modify-write
cycle corrupts the shadow states, silently dropping AUP/RUP commands for
other active ports?

[ ... ]

> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	int val;
> +
> +	val =3D (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;

If phy->lane_cnt is 0, will the subtraction underflow to 0xFFFFFFFF?

This would result in writing all 1s to the register, potentially causing
hardware misconfiguration.

There is a fallback condition explicitly handling a 0 lane count in
__csid_configure_rdi_stream(), which sets lane_cnt to 4 if it is 0.
Should a similar check be added here?

[ ... ]

> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
> +{
> +	u32 val;
> +	u8 lane_cnt =3D csid->phy.lane_cnt;
> +
> +	/* Source pads matching RDI channels on hardware.
> +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> +	 */
> +	struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_PAD_FIR=
ST_SRC + port];

The macro MSM_CSID_MAX_SRC_STREAMS_GEN4 evaluates to 5 for non-lite CSID
hardware, meaning the loop index port can reach 4.

Since MSM_CSID_PAD_FIRST_SRC is 1, MSM_CSID_PAD_FIRST_SRC + port evaluates
to 5.

However, the csid->fmt array is sized by MSM_CSID_PADS_NUM, which remains
hardcoded to 5, meaning valid indices are 0 through 4.

Can this result in an out-of-bounds memory read when attempting to process
the 5th stream?

[ ... ]

> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_GEN4; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i, 0);
> +			__csid_configure_rx_vc(csid, 0);

The functions __csid_configure_rdi_stream() and __csid_configure_rx_vc()
are invoked with a hardcoded 0 for the vc argument instead of passing the
actual virtual channel or the loop index i.

Does this force all enabled streams to capture Virtual Channel 0, breaking
the driver's ability to handle multiple virtual channels?

Additionally, passing 0 to __csid_configure_rx_vc() makes the internal
condition if (vc > 3) always evaluate to false. Is this code intended
to be reachable?

> +
> +			for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
> +				__csid_aup_update(csid, i);

CAMSS_INIT_BUF_COUNT is intended for ping-pong buffer queues in the VFE.
Since CSID does not manage memory buffers, this loop repeatedly triggers
identical AUP commands to the hardware without any intervening state
changes.

Is it necessary to repeatedly trigger these commands here?

[ ... ]

> +static irqreturn_t csid_isr(int irq, void *dev)
> +{
> +	struct csid_device *csid =3D dev;
> +	u32 val, buf_done_val;
> +	u8 reset_done;
> +	int i;
> +
> +	val =3D readl(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +
> +	reset_done =3D val & INFO_RST_DONE;
> +
> +	buf_done_val =3D readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_GEN4; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & INFO_RUP_DONE)
> +				csid_subdev_reg_update(csid, i, true);

The macro CSID_CSI2_RDIN_IRQ_MASK is defined in the source but never written
to hardware.

Additionally, in csid_reset() below, only INFO_RST_DONE and
BUF_DONE_IRQ_STATUS are unmasked in CSID_TOP_IRQ_MASK.

Without unmasking CSI2_RX_IRQ_STATUS at the top level and writing to
CSID_CSI2_RDIN_IRQ_MASK, will the INFO_RUP_DONE interrupt ever fire?

If this interrupt is permanently masked, __csid_aup_rup_clear() won't be
called, which might cause the software cache of the hardware triggers
to permanently drift out of sync.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-kaanapali-=
camss-v13-0-2541d8e55651@oss.qualcomm.com?part=3D4
