Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BBA4F55A0
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893191; cv=none; b=Wi7IG+/LVnzchO/ERl5Xw+V/Y6nY/LxPYPExBqVo5LhwlCVpsCHzHdmaO8/JnEtOdqG1XLF1eBokxd56ZSDC3s9/7lepVacVAuHvEED72mJS3xjUKlk+Im5vXKob7siB8Eb0o1sNz9TauEYq+N4/bHqXZ3G0MOeosHped8y1u6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893191; c=relaxed/simple;
	bh=dvKZ8NJsB7AB+75yN1fyf9hYXwn3aKBDUjRKA15+/M4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y82NO/vUGk9hIaZAGvej4nEt8ekEsyfyxntZw3g5T7HwCJ90DA7+yhM8MLFfLI99zbObqQ0kLLAVBzjgZDKr1lZiU+cug8I6DKI/xGf8z8UFHGZdJkdQIaeYGZe/sRbXUX8uL/gbntGJNdZbSqBgQoJGtr5txpDawdploQriy0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPDZyjIZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPDZyjIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381741F00898;
	Tue, 13 Oct 2026 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791893189;
	bh=Ga1K/XGemiicM1+duLSR4yjWxKY6zdOiWG2eLtUmyqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RPDZyjIZ0QG4f7f/FHxa/+BzLkG0aBt5+lVoAutxRjPX02gddnI3FZ1b/OfBVoflz
	 fhXzEAot/RQ5SPnWyl/2ifKH5/cHzNhr7lsGDh4HfZMlQYUI8R31nkNzObaF1RliNK
	 0OPtPTXkEMpughDAwaEZYCxkVhuOTYQoi3NVI6Ya0afAPAlDRpRufDbYZlG3a1T8o8
	 DELUn1LZJEp+Img8IN110+O+UP3aRGph2S0PKWccfEhrxU17BfGyi0koWTQuvpVviA
	 uOHk6QqSKRdpCPgQbWMEVj+D0XkYyv7Wq3QygvDmtDlD8QAdV5D0WZ3vd2K2gwULd+
	 BJmA7GGy1MBKw==
Message-ID: <sashiko-outbox-169671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] media: qcom: camss: csid: Add support for CSID
 1190
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261013-hawi-maili-camss-v2-7-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-7-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 12:06:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] media: qcom: camss: Integer underflow in __csid_configure_rx() cor=
rupts CSID_CSI2_RX_CFG0
- [Medium] media: qcom: camss: Data race on aup_update and rup_update betwe=
en process and hardirq context
- [Medium] media: camss: CSID 1190 5th RDI stream inaccessible due to MSM_C=
SID_PADS_NUM limit
- [Low] media: qcom: camss: Macro MSM_CSID_MAX_SRC_STREAMS_1190 implicitly =
captures local variable
--

commit 479f67e9b9b628614ef82c2426c608857a19f333
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1190

This commit adds support for the CSID 1190 hardware found on Hawi SoC.
It introduces hardware resource descriptions, hardware-specific register
programming, reset sequence, and BUF_DONE interrupt handling. CSID 1190 spl=
its
RUP and AUP updates into separate registers and uses a SET register to comm=
it
them.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1190.c b/driver=
s/media/platform/qcom/camss/camss-csid-1190.c
> new file mode 100644
> index 0000000000000..999733aa8ae63
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1190.c
[ ... ]
> +/* CSI2 RX Configuration */
> +#define CSID_CSI2_RX_CFG0			0x880
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
[ ... ]
> +#define MSM_CSID_MAX_SRC_STREAMS_1190		(csid_is_lite(csid) ? 4 : 5)

[Severity: Low]
This isn't a bug, but this macro implicitly captures a local variable named
csid from the caller's scope. This masks dependencies and breaks if the loc=
al
variable is renamed. Could this be refactored to take csid as an explicit
macro argument?

[ ... ]
> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}

[Severity: Medium]
Are these read-modify-write operations safe from data races?

In hardirq context, csid_isr() calls __csid_aup_rup_clear() which clears bi=
ts
in these same variables using non-atomic operations (&=3D ~).

In process context, __csid_aup_update() and __csid_reg_update() also use
non-atomic operations (|=3D) to set bits:

drivers/media/platform/qcom/camss/camss-csid-1190.c:__csid_aup_update() {
    csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
    ...
}

If an INFO_RUP_DONE hardware interrupt fires while the process-context loop=
 is
preparing the next stream's bits, could the two execution paths race,
potentially clobbering the interrupt handler's bit clear or the stream
configuration's bit set?

[ ... ]
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	struct camss *camss =3D csid->camss;
> +	u8 lane_cnt =3D csid->phy.lane_cnt;
> +	int val;
> +
> +	if (!lane_cnt)
> +		lane_cnt =3D 4;
> +
> +	val =3D (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;

[Severity: High]
Does this code underflow if phy->lane_cnt is 0?

While lane_cnt is correctly guarded against being 0 by falling back to 4, t=
he
bitshift operation uses the unmodified phy->lane_cnt struct member instead =
of
the corrected lane_cnt variable.

If phy->lane_cnt is 0, 0 - 1 promotes to an integer -1. Shifting -1 left by=
 0
evaluates to 0xFFFFFFFF, which would write an all-ones mask to the
CSID_CSI2_RX_CFG0 register, completely corrupting its configuration and all
reserved bits.

[ ... ]
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1190; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {

[Severity: Medium]
Is the 5th RDI stream accessible?

MSM_CSID_MAX_SRC_STREAMS_1190 evaluates to 5 for non-lite hardware, intendi=
ng
to support 5 RDI streams. However, the driver globally defines
MSM_CSID_PADS_NUM as 5 (1 sink + 4 sources) in camss-csid.h.

This restricts the V4L2 media entity to 4 source pads (indices 1 to 4). Sin=
ce
the stream configuration relies on the csid->phy.en_vc bitmask (populated
during link setup based on pad indices), BIT(4) can never be set. Is the 5th
iteration of this loop effectively dead code, rendering the 5th RDI stream
inaccessible?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-hawi-maili=
-camss-v2-0-fc93222da89c@oss.qualcomm.com?part=3D7
