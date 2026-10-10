Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2919392807
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649183; cv=none; b=axWRgutjdk8jgPuxQ+CdhkG1uxq426aaio0YPm3GkFUwe4QWadJu/V1fL+Ets/UK2Dcm2TcEO3mV1w1u5u5M/PVDb1784CePJ4hgplFJy7g0XhD7t2q5BrHn/IbPTFKjCl4gtwc50kAbycXF+OVX8dfxkxnzJRpduYgvYG5VpJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649183; c=relaxed/simple;
	bh=Qj3Mv1KqmiTm8jzFOVgGpcujd5BKAuKFsEqgDQjGyTM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QgzM8e7S2UqU7nu5wxDiR2RJg3naHYPZU9fNz8fHGUPJ9CEIJcFOPjxl8nZHu1MzNZG8PJfaYUwl0pG9RbQQ9wyHNkvghLHSEG0yIupZnOOVgtDM0kJyE/zTC0yw1NmiUW+7KdOQ/Un1cLND2dAKC5QS6m5zAxxXS4amdKDelKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABSRWAri; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABSRWAri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0C71F000FF;
	Sat, 10 Oct 2026 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649172;
	bh=oVJlSjap2M7F+7JAB6BD9119AVFpjcCAe5IkWx49Lac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ABSRWAriygV0rggubKJIcr4AKstcUYPqF+ns0NrgfJJHpoCM3rFHkU82rM0KPTrD+
	 /8DObYWdQomHscJJlkmsTYDwJjTHRHXXYSc2jyTLDLty/c9HJ7LZjrLIKii+NR/cvf
	 WFsRTiZtrr1PofJj3D75uj2TlDyd5siku/92ZrvNfkXHpXuAW9xoJe+MSzRRnOsxmv
	 o83E9519QSjEACkP9u40CbletHz5ub9AxfIqtvxxEkGSfyKdNPEGwQeskujkGHwHMx
	 Nul4Y47ju6QpIEEi9sFcsMS0+iVVzJXNhbjKOWmYd+Eo6Cq8aMV5rBTTAVT4x8LxL3
	 PvsJTB9Z3/fQw==
Message-ID: <sashiko-outbox-166731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 09/13] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, media-ci@linuxtv.org, linux-phy@lists.infradead.org
In-Reply-To: <20261010-kaanapali-camss-v20-9-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-9-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:19:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] media: camss: CSID 1080 fallback to CSIPHY breaks graph isolation
- [Low] media: camss: tpg_reset evaluates hw_version before it is initializ=
ed
- [Low] media: qcom: camss: data race on tpg->testgen.mode across subdevices
--

commit 74ebce0fb447af79287e1df16be3097446ecc373
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

Add support for the TPG found on Kaanapali. This updates the CSID configura=
tion
for TPG routing and adds version checks for the TPG hardware registers.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
> index 46e443e05195a..851b3cd712f52 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c

[ ... ]

> @@ -148,8 +151,16 @@ static void __csid_configure_rx(struct csid_device *=
csid,
> =20
>  	val =3D (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>  	val |=3D phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> -	val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> -	       << CSI2_RX_CFG0_PHY_NUM_SEL;
> +
> +	if (camss->tpg && csid->tpg_linked &&
> +	    camss->tpg[phy->csiphy_id].testgen.mode !=3D TPG_PAYLOAD_MODE_DISAB=
LED) {

[Severity: Low]
Is there a data race when reading testgen.mode here?

The CSID subdevice directly reads this locklessly during pipeline
configuration, but the TPG subdevice updates testgen.mode via tpg_s_ctrl()
which only holds the TPG's local ctrls->lock.

Unprivileged userspace could concurrently issue VIDIOC_S_CTRL and
VIDIOC_STREAMON on the respective subdevices, causing a pipeline configurat=
ion
mismatch.

> +		val |=3D FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
> +		val |=3D CSI2_RX_CFG0_TPG_MUX_EN;
> +	} else {
> +		val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +			<< CSI2_RX_CFG0_PHY_NUM_SEL;

[Severity: Medium]
Could this fallback break graph isolation?

If the user-space client links a TPG to the CSID but leaves the TPG test
pattern control set to DISABLED, it falls back to this else block.

This configures the CSID RX PHY mux to read from physical CSIPHY
phy->csiphy_id. If that physical CSIPHY is concurrently active (for example,
streaming to another CSID), won't its data leak into this CSID, receiving
stream data from a physical CSIPHY that is not linked to it in the V4L2
media graph?

> +	}
> +
>  	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> =20
>  	val =3D CSI2_RX_CFG1_ECC_CORRECTION_EN;

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index d29de5f93c18e..cabbb2638cf38 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c

[ ... ]

> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
>  	}
> =20
>  	/* Global TPG control */
> -	val =3D FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
> -	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
> +	val =3D FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>  	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
> -	writel(val, tpg->base + TPG_CTRL);
> +
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
> +		val |=3D FIELD_PREP(TPG_CTRL_TEST_EN, 1);
> +		writel(val, tpg->base + TPG_CTRL);
> +	} else {
> +		writel(val, tpg->base + TPG_CTRL);
> +		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
> +	}
> =20
>  	return 0;
>  }
> =20
>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -	writel(0, tpg->base + TPG_CTRL);
> -	writel(1, tpg->base + TPG_CLEAR);
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +		writel(0, tpg->base + TPG_CTRL);

[Severity: Low]
Will this evaluate to true on the first power-up for v2.4.0 hardware?

Looking at tpg_set_power() in camss-tpg.c:

	tpg->res->hw_ops->reset(tpg);
	tpg->res->hw_ops->hw_version(tpg);

reset() is invoked prior to hw_version(). Since the tpg_device structure is
zero-allocated and hw_version is not initialized during probe, tpg->hw_vers=
ion
is 0 on the first power-up.

Doesn't this cause the driver to execute the very register write it was
intended to skip?

> +
> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-kaanapali-=
camss-v20-0-63e98ce9ac0c@oss.qualcomm.com?part=3D9
