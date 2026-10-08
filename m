Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB463DAABE
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444450; cv=none; b=HaBrudV2XJ0PX8Pq+EyUlq1ErzjhmNyVowdouWhRe7rjFTLMhFJr3E+nN78t74jK2nGPnM40Mv/2QMJm2JEhqXFMXdHWP6LCsAhZQX+j6TfpIQPY/uLb1eDNO5tRfbb0/IuwXf8/ALGNft3SqgCtFtehr4Ko0uSmT9N0+9Pb5pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444450; c=relaxed/simple;
	bh=SXWRat4UqRS0pGCXMNkWhTJepxhs4XqU6Wpmi6n+H7Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CGPDq1R4DsmHs64eZLBIB504qhswoTSQElxDclcVQDsjgDXu5TqQDlHTosd2+Yhde2r/ePIWY8wbtGnHWqMWaWpbgVXisXW5Hs5q7KdJO1b5Mswtn2YogMloxPZ4QVxsiBsrjLY3XYAaglSqlRRWJ+HdPzW7LPyunPryFRzr7AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0eUGrEY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0eUGrEY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B691F00898;
	Thu,  8 Oct 2026 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444448;
	bh=AYY88Me7TA7KUYgh6xyZP+abNAUdUmSOBT0v8TqVYjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0eUGrEY9jtkDOSlvH5x3Sg6184FyzBbbGP+U41qLHJHpwcr9Z6lldUnsgbVu6DJm
	 RWpbxsU0Zakbpy2MkqmzpeMLmtWDqy+OcwZkjOjU8lfNBjru3aPfIAxpYYejU4oki6
	 5ghX/e5ShWMmZBAEhEEXxdGz1ZFHvDNgqJ9lacxshgCNyQiTcnTf8X6zweV6urQy88
	 oe0t6ErSeFl70ayD468o1iZabuXg2JQQVb+VwxLIxUchG1tqnTZCX4it8J6sHxE4Od
	 gfUvh4Sll1zx/Hvy0cS/UEEwl/7ex3M5clnTqoLjUo7AGHije5PtZt5jWbQYfvh3sO
	 zk4NeO746BevQ==
Message-ID: <sashiko-outbox-163752@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 09/12] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20261008-kaanapali-camss-v19-9-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-9-b2c583ef50e0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:27:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: qcom: camss: data race in __csid_configure_rx reading TPG st=
ate
--

commit 0224a6f288ad77d57684837805849143fea2532e
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

This commit adds support for the Test Pattern Generator (TPG) on Kaanapali
using hardware version 2.4.0. It updates control logic for test-enable and
reset, and routes the TPG output into the CSID 1080 RX.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
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
Does reading camss->tpg[phy->csiphy_id].testgen.mode here introduce a data
race with concurrent V4L2 control updates?

The V4L2 control framework modifies testgen.mode in tpg_s_ctrl() while
holding the TPG control handler lock:

tpg_s_ctrl() -> tpg_configure_testgen_pattern()

Since __csid_configure_rx() reads this foreign subdevice state locklessly,
it bypasses the control framework's locking. Can this trigger a race condit=
ion
leading to a transient stream misconfiguration during concurrent VIDIOC_S_C=
TRL
calls?

> +		val |=3D FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
> +		val |=3D CSI2_RX_CFG0_TPG_MUX_EN;
> +	} else {
> +		val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +			<< CSI2_RX_CFG0_PHY_NUM_SEL;
> +	}
> +
>  	writel(val, csid->base + CSID_CSI2_RX_CFG0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-kaanapali-=
camss-v19-0-b2c583ef50e0@oss.qualcomm.com?part=3D9
