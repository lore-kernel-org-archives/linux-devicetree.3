Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C80492E52
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991710; cv=none; b=H1OD8JQs4JqUGcfh1GT1a1e7Egb+jvKad+bdvV1N9N5nSSR8uizEEiNtBhzqFGESCdLEwfu/dpOYueVi5pGQH00w+1Kw3M2vghuaCVQ050eTA3dMrgCD4805YLDlrloSSeGqLPGrua61A4VVTcBXjMAjJBEIHc93u54GoscO2FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991710; c=relaxed/simple;
	bh=fPNrH22eOKpn8TqqCFi9S1ipvFl4N/6RxQphkDK+SEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KOOm3ee1ImQVBKRBKK7VnYoBUBN7M10kDxqdwVkNqXOznKswWGasIRQMJHeuR5IeAM16z2nzMac+AMxprEqggsTDVOZSYbyGVq/YxLpzeL98DmfCgZacYyjkpICl3KiInKmYy9Lvw/v2C4ujpWVFp6/KlGL6EeAZ5rDI996pqoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9LQvYpq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9LQvYpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592601F000FF;
	Mon, 21 Sep 2026 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789991708;
	bh=nK1A2wjpEHFyOqcSnc2DeOTvPdBOcuCe16Ggt/qd/zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l9LQvYpqmniKRiMrpK1OzLhq+RRwNjXNZPJRrSrxJfIljsYETCKia/uppVAVMC4kt
	 eQF4c4grXXO07xQ58wxOslg/8rqDt8MWGinHjgCaEjWcvVM8bnJ2EP4vrrO7mJawmM
	 +H9hTy/KUNgzNOONAUhEm8fwccNxEQUeQM+2HgVbIZuult4L6w2U1VoJJgOcn+5uca
	 pYlSud8lp3RMZbcgA/BDhqhet98P+DDvZ9gbdLnO1j5CRF1W58Hls9LzAHnj+hQLus
	 wK2jFJ3oos/riXUMejhUE1AberRFk82Etu79y73/2k/8KMQ98b+BAFLXBJe1PoVo++
	 ucKXT0oM7/+Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] phy: qcom: qmp-combo: Add USB3+DP PHY support
 for Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-nord-usb-phy-v3-3-68aa02b12b96@oss.qualcomm.com>
References: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
 <20260921-nord-usb-phy-v3-3-68aa02b12b96@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 11:55:07 +0000
Message-Id: <20260921115508.592601F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Meaningful code and commit message mismatch for nord_usb3_tx_tbl
--

commit 463808de5f918fa656e070bb28cb3c49135072fb
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

This commit adds USB3+DP combo PHY support for the Nord SoC, introducing a
new layout offset table (v6) to handle its dedicated USB3_PCS_AON region.

>     Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequen=
ces
>     are identical to sm8550, but the sub-blocks are not laid out the same=
 way:

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index a4f130fc33e39..c4e88b0384cb5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
[ ... ]
> @@ -2356,6 +2356,20 @@ static const struct qmp_phy_init_tbl hawi_usb3_pcs=
_usb_tbl[] =3D {
>  	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
>  };
> =20
> +static const struct qmp_phy_init_tbl nord_usb3_tx_tbl[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_TX, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_RX, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0xf5),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_3, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_4, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_5, 0x5f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RCV_DETECT_LVL_2, 0x14),

[Severity: Medium]
Is this value intentional? The commit message explicitly claims that the
initialisation sequences for Nord are "identical to sm8550". However, the
sm8550 equivalent uses 0x12 for QSERDES_V6_TX_RCV_DETECT_LVL_2, whereas
nord_usb3_tx_tbl sets it to 0x14.

Does the commit message need to be updated to document an intentional
hardware tweak for Nord, or is this value a typo?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-nord-usb-p=
hy-v3-0-68aa02b12b96@oss.qualcomm.com?part=3D3
