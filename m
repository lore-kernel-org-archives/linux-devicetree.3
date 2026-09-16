Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F184FC8C7
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554977; cv=none; b=omO+ooiJpqQfc4q45D7euzhlEed0itResuWYZIjtle+FG5ZtrYZBVFLAgMCNFREk0p93MnYHwVOWTtPQP2WOvsycm3+FkoYi/C2CKaocnnTmP+W5bUurNjJHlmpetavE9Mp5HHkCP+ZOjbjHJmYQt6W0A14W+cekKhrLOk3Yjxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554977; c=relaxed/simple;
	bh=0R/xGHBRSJRYPig81vFxIttqbLD5LeANieiE1cXEkS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J/FZQbJ9tm+Pmi5UXf0XmCf1j74Ma2u1P1soxmeRke9ISPgLnUGSM7hD276J/BLbCAArQeVpk8I8pc8ruPNa6/7jEX82kUk2hoUX6+mzylKioZS7kYMvtxSYO0ZOlNsfR7nKn1xQt/Xq5RhHrDr67MnkGUcTxRp641OPN34mdAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rb28TyB3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rb28TyB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899091F0089C;
	Wed, 16 Sep 2026 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789554947;
	bh=91BCzjqGVJnPpwUhAtCe5GvXB0bZN20yFqXlfeTUMUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rb28TyB3fkDJgQcRGuzt+owNvhx3sdsZOQLXOsb47V5k1XXw3t2Gr7ZCXNnPL0P2o
	 aV8uQBCYHOtLMBsQlIMemiMVuAjrrZhDTI5CNmpVEg8OheRqH9Yb4QJ3+VMXol0oQD
	 NRqUAuUltme6kF28wwx2tH8sKA+kJOs+Nl6u1lt0QKmb0SucUJEOeLlDPdegN7i0SJ
	 afVeUa0sXNgTu/jaMTv4A70dE3/NouMakTlteSs7ophwSW2NyE8GlRczB0mL30ZLJS
	 M2WSQNDZqBqG2nloGtEbsMLrDVNQ8Vkis/rthXAGnPYDqhvpVWSAI/a4dXpKK6x0xF
	 PE3RR65xXcgHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen
 regulator vote for QCS8300 and SA8775p PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziyue Zhang" <ziyue.zhang@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 10:35:46 +0000
Message-Id: <20260916103546.899091F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phy: qcom-qmp-pcie: probe failure on SA8775P due to missing refgen=
 supply
--

commit 6ebdf3508e888642443e5fd08f439c12e51dcc9d
Author: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>

phy: qcom: qmp-pcie: Add qref and refgen regulator vote for QCS8300 and SA8=
775p PHY

Adds a new sa8775p_qmp_phy_vreg_l array that includes the refgen supply,
using it for QCS8300 and SA8775p PCIe PHY configurations to fix
initialization timeouts.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-pcie.c
> index da83358c97ead..ab81c6e584a84 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] =
=3D {
>  	"vdda-phy", "vdda-pll", "vdda-qref",
>  };
> =20
> +static const char * const sa8775p_qmp_phy_vreg_l[] =3D {
> +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
> +};
> +

[Severity: High]
Will this cause a probe failure on SA8775p platforms due to a missing
refgen supply?

The new sa8775p_qmp_phy_vreg_l array unconditionally includes the "refgen"
supply, but is applied to both QCS8300 and SA8775p PHY configurations.
Since the "refgen" supply requirement is a hardware workaround specific
only to QCS8300, the SA8775p device trees omit the "refgen-supply"
property.

When devm_regulator_bulk_get() is called for the SA8775p configuration,
it requires all listed supplies to be present in the device tree. If
"refgen-supply" is omitted on SA8775p, won't the regulator lookup return
-ENODEV and unconditionally abort the probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916102023.2054=
761-1-ziyue.zhang@oss.qualcomm.com?part=3D2
