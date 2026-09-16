Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154754D957E
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584437; cv=none; b=tWn2qkcerqKmYWFsL3Apu2nP7kXUO2XyfTSkWK3GJWqJcc6FGsMo0uyJ/oHQc9sBuXsnFpGBbiRGRDV+GvA349VThXilpMG5Q2hmFy20vVE9NFEhELpcYJBUVFHL7GfhUQeqjQJ8zlUm6e2//i951+TK80ChkU7zaFdzQFCPSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584437; c=relaxed/simple;
	bh=eoj5LnlLFnqWGYtoj54g1TPW+Au1tVPd/Qkho3P1fz4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=REhKSfmD9XhkNHABXgIkSC3KX8KmcAVJ547QDOJrRxOW2OLE4q6qEeI+e2UZxWGklo1vfJWjDQ+7cDNHlsPGm0KA96p2UlzyOjofRjK/VCOoJGwknCAm4yAJzTWTuF5Y6QCW0GUTkBlfgFcIos5varLP+amych5BlHBLz35lgPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqmJkGWL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqmJkGWL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2381F00893;
	Wed, 16 Sep 2026 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789584422;
	bh=Fw3bbw2C6I5af6YuRppv3mIAN6eKYFCwExa+3Z3rhqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FqmJkGWL2TO/gcli2jLS451IkTvr2N+u/CV+brPZPdtX1HC/4u1JyU5RJPklj+zrG
	 6pY7aH8aygG+m9DxGnihdQ5u708zzmZZWu0N6b3jz4RX9j7SsobortMt4XxTo2TVDn
	 l+z2uMA3zAW9EHsYs3TxFvlqxgWeuCkHOm4xtdWdNn6iWxeVTRQWlGUM3XYBvYp6f0
	 0KeJ0N59u5EWAScW4+ask8DWDqtFHvbV4CuuQBAjsig47XZv7lEAkFu5FlqGVEMjAh
	 BwUmJ/xLovy6d8sNcZhLPDCwX80+3NbR5Jd9gZSDQns8gAIhSBfzOtkrfQXHLST8sq
	 mIYt9L/fdgavw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-combo: Add USB3+DP PHY support
 for Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260916-nord-usb-phy-v2-3-2c8461bb30e6@oss.qualcomm.com>
References: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
 <20260916-nord-usb-phy-v2-3-2c8461bb30e6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 18:47:01 +0000
Message-Id: <20260916184702.2D2381F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: qcom: mismatch between commit message and nord_usb3_tx_tbl
--

commit 1b7c23f467a9a0ffe85f80b15fdee3ce3ad5c895
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
are identical to sm8550, but the sub-blocks are not laid out the same way.
A dedicated USB3_PCS_AON region at offset 0x1e00 is added, modifying how
the I/O clamp is driven.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index a4f130fc33e39..c4e88b0384cb5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
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
The commit message claims that the initialization sequences are identical to
sm8550. However, this configures QSERDES_V6_TX_RCV_DETECT_LVL_2 to 0x14,
whereas sm8550 uses 0x12.

Is this an intentional hardware difference for Nord that should be mentioned
in the commit message, or is it an accidental typo?

> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x21, 1),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x05, 2),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-nord-usb-p=
hy-v2-0-2c8461bb30e6@oss.qualcomm.com?part=3D3
