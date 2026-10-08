Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679FD3EB0E9
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444789; cv=none; b=pcbw/rPCWNWPDJ5bEkNieK3iCVJDf+RBrNwX82wa9dcHdS6Cqo4JZdXZGU8bqgtQdcW7FAmAnHVMo6aQVHqp3bvno4WKXZGhT8jax+ERPBd7RWEF3M+73lVl2qjADcRzl9dbifyPjirIBNqaCKVcuv4FYN53EaCkVoPeMuS+TMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444789; c=relaxed/simple;
	bh=iMCuWnYezqWEqZ1UgJ+xdDf7SYLllLuUKICSyH49QIo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=h9UzVG29juVfSgkCm/ut6ZIJYn6ALw5uAskhrONEfSxVtMpgBIwFjjy3FMZjhCdY/66mMUZKPeOJz+6gt1iKNiZ6eIfo+mM3YDtQoS4E0wHl9r/LsDJrfW9FJsNxpNUT1eNPhlW/8maRCaJ7exoUKLiOrEmi8Vuf/I12ET7lfzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHWR7bTg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHWR7bTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214CE1F000FF;
	Thu,  8 Oct 2026 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444775;
	bh=qL0f3zWSOBG7sG3mN4VY8+QAxFs5hxiR8d+gHZ7b/vg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHWR7bTg2sHfrnnyrhwKexYeO5rO5rLgshUh3cT/Bkz+lE6RxJVM7h9nc2SeW31v/
	 YSWMTVfGtcJ6o2JC9Ys9UU0tIKJpIlg8E1xIkGGRqgm0WopSJvxazhPutvsN/Bel/I
	 fT3/IppnA03yNDr184jWLNRjAnoRcEwqfZJycl7RksWZU01M5w8/SUR/cZ5x/x3a8o
	 dJUX/7JTRmXpP0ytJCemqIwwx40FaEKOtSGv2VOcJEI5T7q3phQg/ptFAfeD/ks4FN
	 ocwMP+yOZsIS94gvVPWzQEeFPW9tkmmIDSSCYsbrVzzgexH3QS2OVVcCuRBT7947fO
	 DoGg1zH1qfyaQ==
Message-ID: <sashiko-outbox-163768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 07/12] media: qcom: camss: csid: Add support for
 CSID 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, media-ci@linuxtv.org, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008-kaanapali-camss-v19-7-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-7-b2c583ef50e0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:32:54 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: data race on aup_update and rup_update masks between proces=
s and IRQ context
- [High] media: missing IRQ mask programming prevents INFO_RUP_DONE interru=
pts
- [Medium] media: camss: csid-1080: data race on aup_update and rup_update =
bitmasks
--

commit c1ffc650d77cc9e495d5b9cec2dfa9e85e2f485e
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1080
   =20
Add support for the CSID 1080 hardware found on Kaanapali SoC.
Introduce CSID 1080 hardware resource descriptions and implement the
hardware-specific register programming, reset sequence, and BUF_DONE
interrupt handling.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 0000000000000..46e443e05195a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c

[ ... ]

> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}

[Severity: High]
Does this code introduce a data race between process and hard IRQ context?

In process context, csid_configure_stream() updates these variables via
non-atomic bitwise OR (|=3D) using __csid_aup_update() and __csid_reg_updat=
e().

Concurrently, the hardware interrupt handler csid_isr() (running in hard IRQ
context) clears bits in these exact same variables via non-atomic bitwise A=
ND
NOT (&=3D ~) through __csid_aup_rup_clear().

Because there is no spinlock or atomic bit operations protecting these
read-modify-write sequences, an interrupt firing on the same or another CPU
during stream configuration could cause a TOCTOU data race.

Could this lead to lost bit updates, resulting in hardware commands being
dropped or spuriously re-triggered?

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
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & INFO_RUP_DONE)
> +				csid_subdev_reg_update(csid, i, true);

[Severity: High]
Is the INFO_RUP_DONE interrupt properly unmasked?

The driver relies on the INFO_RUP_DONE interrupt to clear the pending
aup_update mask in the ISR via csid_subdev_reg_update().

However, the driver never writes to CSID_CSI2_RDIN_IRQ_MASK(i) to unmask
these interrupts, nor does it enable the corresponding top-level aggregation
bit (CSI2_RX_IRQ_STATUS) in CSID_TOP_IRQ_MASK during setup or reset.

Because the interrupts appear to be permanently masked in hardware, the
RUP_DONE interrupt might never trigger the csid_isr() independently.

Could the aup_update state be left orphaned if no BUF_DONE interrupt happens
to fire, breaking asynchronous updates?

[ ... ]

> +static int csid_reset(struct csid_device *csid)
> +{
> +	unsigned long time;
> +	u32 val;
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	val =3D INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	val =3D 0;
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			/*
> +			 * Only need to clear buf done IRQ status here,
> +			 * RUP done IRQ status will be cleared once isr
> +			 * strobe generated by CSID_RST_CMD
> +			 */
> +			val |=3D BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
> +		}
> +	}
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);

[Severity: High]
This appears to be where top-level masking explicitly omits
CSI2_RX_IRQ_STATUS, and CSID_CSI2_RDIN_IRQ_MASK is never programmed,
as noted above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-kaanapali-=
camss-v19-0-b2c583ef50e0@oss.qualcomm.com?part=3D7
