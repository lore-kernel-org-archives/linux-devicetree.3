Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CAA36B92A
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649361; cv=none; b=iFhYPjZFqWt9BhpGDL9L8LJLE5fA3hzRetXa1IcosolvOMVkw4tWnhtitjwDOo+RUmjHAlbmVtidJfBT6Htl124720nKa6+T6zQhEE4K1lmwzyDkCevBVTfHsKimQ7bxMKUEn0LClQiSA2sPCbsbXauHq7uMsZ4aE4D7K2E/1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649361; c=relaxed/simple;
	bh=GSmN13+hLPlbNX4bsHI9VKhj0po1FH/EeaXTBTbp2ks=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ba34Dlv0S4yf9K8aG/B8uT4kuZa4LGJZlbt+zuEyAUwWyWwB4pM1YNvvY87ZdRpgXMxqiWOpIELGhz4OwdkWNs5mLcMq4y1fwR+x8Npq18C2nvPZpEerb6v7q63sXpK3r7XwkVlKpxgxYtxDwsmLP8TpfRfcBxziE7/Jy55i+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaLep3p4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaLep3p4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B65D1F000FF;
	Sat, 10 Oct 2026 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649359;
	bh=iyQMQvkgLVkrSmqrliS75QL5GDQcftYU41q5VoLCJ5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VaLep3p4Rs6rqyWDwPNoifjYGyUU2uBpY2vtajyL/H3uD1dp8TIDv31pb/FCwYGQa
	 CrM0Hp9VFBl+aPFjZqgUYhyeFPaiWYYhDTeQqmx1wHb/Czb565qKbMf7GDfxXOh9uh
	 kG0wKWd2FQpoJnh/lS88bFy0KgMOcZoThVArjBdiSd1glhYFdj+J9FKsUfC21mPyZ1
	 LOIs9Rapv72j7+MDIs2GjmbywtkDWjYaivIaHukpq2Enm4ovZL7TTresh4lLdbGlrI
	 2Uhci6kds+Fs8jEh4TRZHcITqHzKP/xJCgMuj18D1lIrkTtpsHD2B0n1GYUdsPRuBY
	 o44CKRg2VffBw==
Message-ID: <sashiko-outbox-166733@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 07/13] media: qcom: camss: csid: Add support for
 CSID 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, media-ci@linuxtv.org, linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20261010-kaanapali-camss-v20-7-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-7-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:22:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: camss: data race on csid aup_update and rup_update
- [Medium] media: camss: missing initialization of CSID_CSI2_RDIN_IRQ_MASK
--

commit 929222812c3090d4d0069fbedd13096bba380a7a
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1080

Add support for the CSID 1080 hardware found on Kaanapali SoC.
This introduces CSID 1080 hardware resource descriptions and implements
hardware-specific register programming, reset sequence, and BUF_DONE
interrupt handling.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
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
Could these bitwise operations lead to a data race between process and
hardirq contexts?

The __csid_aup_update() and __csid_reg_update() functions are called from
process context via csid_configure_stream(). They perform non-atomic bitwise
OR operations on csid->aup_update and csid->rup_update.

Meanwhile, __csid_aup_rup_clear() performs non-atomic bitwise AND operations
on these same fields from hardirq context (called from csid_isr() when an
INFO_RUP_DONE event occurs).

If a hardirq preempts the process context during its load-modify-store cycl=
e,
the ISR's clearing of the bits could be silently overwritten when the proce=
ss
context writes back its loaded value. This could cause the tracking bits to
get stuck, potentially leading to unintended hardware updates.

Should these state updates be protected by a spinlock or use atomic bitops?

[ ... ]

> +/* RDI IRQ Status in wrapper */
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0x224 + (0x10 * (rdi)))
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0x228 + (0x10 * (rdi)))
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0x22C + (0x10 * (rdi)))
> +#define		INFO_RUP_DONE				BIT(23)

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

[Severity: Medium]
Is the CSID_CSI2_RDIN_IRQ_MASK(i) register supposed to be initialized here =
to
enable the INFO_RUP_DONE interrupt?

The mask register is defined but never written to anywhere in this driver.
In csid_isr(), the driver polls CSID_CSI2_RDIN_IRQ_STATUS(i) to check for
INFO_RUP_DONE in order to clear the driver's software state tracking via
csid_subdev_reg_update().

If the hardware mask defaults to 0, the INFO_RUP_DONE status bit might never
be recorded. This would cause csid_subdev_reg_update() to be skipped,
allowing pending RUP updates to accumulate and causing redundant updates to
running streams.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-kaanapali-=
camss-v20-0-63e98ce9ac0c@oss.qualcomm.com?part=3D7
