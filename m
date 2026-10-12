Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62043DED9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788377; cv=none; b=dQkhyBaMLP7y8BoKnDnKYNJ3kxrAYENQVerUtDcW0fYPC2JJsvL7rlFjbKSGJg8fzYo2y1UDTmCxKd2x7wldvEdapxyZf9stW5T+AsvB5zkTnP6NDSrmny1myYB8/ycJKAKp+Zc6jgfuIMkx4ydBe0CWuihIhhjNBfAQzj5Levg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788377; c=relaxed/simple;
	bh=KukewqaBY0xvrLnRnQK2k7JGxgBkcu1uUnelbiSK6iM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=amQeJnCxpVl9u5tuN3l5qaEaM6qtYVadr2FJWJEB1lx9YLuJHEBpAYVxs8kKEvnRvNZgQ2hEfANnPMiSo/OxnRXH0OEWDdssglp9lJvSifpGK3xQGXockVZlQUvzOURKStKtq+TxCXiT53CAVE1CcM0Lka6hs7d9xw6kVJM9ZRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAS4j4vt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAS4j4vt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D0E1F0089B;
	Mon, 12 Oct 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788370;
	bh=PHBb957IgA6MRnaF64Q9ve7cXpoFrFlLO1NKWF1X71w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IAS4j4vtSHqUNGTJyBzvs5XxLMwiQ3xGFcisxfokrMIZC8fu74WyAso9jtvP7lL53
	 6NFOs9t+pQEFh7HO46zk1Q7OdEr8L4pKfi2cKikaCq/Nrg4SaP8X4u0lTf1bLlo1N9
	 TeM6FVg99JGYcjRLWJT2PsgW0bQEdIs9BfxIO69Qe5AMINfQ6IUG701b6+wu5NmQvA
	 PA3XVQaXENNpLSHCUlph2fjHz3S+3FP15BBpujlJq/EMiAdF/i4P8a5Aj3Gz88cViJ
	 ISOoOsPC+iJUtmwjreEN0xngXX+9cB3b/utitx5/3VU5dYk8m3ohRhMWegnsJQproT
	 x5UUil8k+F0QQ==
Message-ID: <sashiko-outbox-167759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 08/14] media: qcom: camss: csid: Add support for
 CSID 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261011-kaanapali-camss-v21-8-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-8-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 06:59:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: qcom: camss: data race on aup_update and rup_update bitmasks
- [Medium] media: qcom: camss: missing RDIN IRQ mask initialization for CSI=
D 1080
--

commit fed0f4820343d4e1580122110f1a96556fcee36c
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1080

This commit adds support for the CSID 1080 hardware found on the
Kaanapali SoC. It introduces hardware resource descriptions, reset
sequences, and interrupt handling. It also updates the CSID interface
to handle separate RUP and AUP registers.

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

[Severity: High]
Can these non-atomic bitwise operations race with the interrupt handler?

__csid_aup_rup_clear() runs in hardirq context via csid_isr(), modifying
both csid->aup_update and csid->rup_update.

Concurrently, __csid_aup_update() and __csid_reg_update() perform non-atomic
bitwise OR operations on these same shared bitmasks from process context
during csid_configure_stream().

Without synchronization such as spin_lock_irqsave() or using atomic bitops,
could process context overwrite the interrupt handler's modifications,
resurrecting cleared bits or dropping newly set bits? This might lead to
missed or redundant hardware updates.

> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}

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

[Severity: Medium]
Will this INFO_RUP_DONE status actually latch in hardware?

The CSID_CSI2_RDIN_IRQ_MASK macro is defined, but it doesn't seem to ever
be written to hardware to enable this interrupt during csid_reset() or
csid_configure_stream().

If the mask remains zero, the status bit might not be recorded. As a result,
csid_isr() would never observe INFO_RUP_DONE, failing to clear
csid->aup_update and leaking stale bitmasks across frames.

> +				csid_subdev_reg_update(csid, i, true);
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
> +				camss_buf_done(csid->camss, csid->id, i);
> +		}
> +	}
> +
> +	val =3D IRQ_CMD_CLEAR;
> +	writel(val, csid->base + CSID_IRQ_CMD);
> +
> +	if (reset_done)
> +		complete(&csid->reset_complete);
> +
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-kaanapali-=
camss-v21-0-04fd28d815c6@oss.qualcomm.com?part=3D8
