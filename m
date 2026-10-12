Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C1643DEDE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788481; cv=none; b=UCnaS7FndpPUifGr41NO/O+36kZ+pL57rmr/har6oM8pmqrMvLgZLxQrpGR7DP3Q1/lhKeXhHKCuRKyG0x8OTTuKr9XEDdF3aI9BykotLeV7jwBSZuRAs/Qg1U+b256J6KYj0IvppG8X5qHq00ONkaroWAzXfRYV3ajAvsRqSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788481; c=relaxed/simple;
	bh=TNb+a+SHc2V9tu2qDmHWOQIC4rHeDBdDpzIPoG4N/Qo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hklpdz1WhCu3kWaoPTzS3gcFLfJQepE55okB1AElcmS9jIf68YU8s9ob5iJXRSjA1Djs/D1l8xeOg5ZffQiN7gIFaG1XRh++GTrBVKqT4X+CW1cXy30hq9pt0pPCehkuBuRkaE6+/+mou2pXzGv3msdUN0W5lSm0y+yBpF1B+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocRAnCNs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocRAnCNs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5F81F0089C;
	Mon, 12 Oct 2026 07:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788479;
	bh=PRY+T6WtU9BxPUl0dyJCXNU0xzVlV8gm7CCcrRvJqFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ocRAnCNsi5VzJ/CQIvIMtUP/iDbLxTSSIKzdpvF5I9t9ulPCirOQ2LJpa+IniOnVO
	 izO7zMG4fAuTCTqf7qpJkprhdRLd6fh0JxoK6qGK84Y3TfdFAtTmNW1CKHPf78VYRv
	 oQnv9QKGEYZPWe2GdTIrA14Fum9Wl6+mG1TXuz6Gcn3nSG5mQ/FSdeN3VJ5eeZY6Mm
	 BWbEcY3iCr5DeUxJQngo+/tal2/D2KMZoInztp/tHlE+SFHagcU1w+A3MB8NZJ6F6Q
	 JUbLVWN1OKHvtrzAfCz6x15yZhqan4ZhKzx2X7QMlU05AwJ5ibFCVczkS/EUr4BZuL
	 0VRNPnC+KaRqw==
Message-ID: <sashiko-outbox-167769@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 10/14] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, media-ci@linuxtv.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261011-kaanapali-camss-v21-10-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-10-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:01:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: qcom: camss: csid: incorrect fallback to physical PHY whe=
n TPG disabled
- [Medium] media: qcom: camss: uninitialized hw_version used in tpg_reset
--

commit 83c15a87930a3b292c2eeb9b034d6436828fd5de
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

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
> +		val |=3D FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
> +		val |=3D CSI2_RX_CFG0_TPG_MUX_EN;
> +	} else {
> +		val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +			<< CSI2_RX_CFG0_PHY_NUM_SEL;
> +	}
> +

[Severity: Medium]
When csid->tpg_linked is true, csid_link_setup() has already overwritten
phy->csiphy_id with the tpg->id. If a user leaves the TPG in the default
disabled mode (testgen.mode =3D=3D TPG_PAYLOAD_MODE_DISABLED), does this
fallback to the else branch mistakenly use the tpg->id as a physical
CSIPHY index?

This appears to misconfigure the hardware to route data from a physical
camera sensor that happens to share the same numeric ID as the requested
TPG, silently bypassing the TPG entirely.

>  	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> =20
>  	val =3D CSI2_RX_CFG1_ECC_CORRECTION_EN;

> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index d29de5f93c18e..cabbb2638cf38 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
[ ... ]
> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
[ ... ]
>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -	writel(0, tpg->base + TPG_CTRL);
> -	writel(1, tpg->base + TPG_CLEAR);
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +		writel(0, tpg->base + TPG_CTRL);

[Severity: Medium]
Is tpg->hw_version properly initialized when this function is called for
the first time? Looking at tpg_set_power() in camss-tpg.c, it invokes
the reset callback before hw_version is populated on power-on:

tpg_set_power()
   ...
   tpg->res->hw_ops->reset(tpg);
   tpg->res->hw_ops->hw_version(tpg);

Since the struct is dynamically allocated and zeroed, the first
tpg_reset() will evaluate tpg->hw_version as 0. This satisfies the
condition and incorrectly executes the legacy write to TPG_CTRL even on
newer v2.4.0 hardware.

> +
> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-kaanapali-=
camss-v21-0-04fd28d815c6@oss.qualcomm.com?part=3D10
