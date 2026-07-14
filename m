Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D337A847
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011995; cv=none; b=fV9VOFT/Sk5KiZPWY9BpmAoN99PLU+aJ2KP4qFukEuJb8XZvdAvrwfqRRoudV5xiWWOXJQLROpoFBZJTYd4K0zwnrYe6uXg/tkMMufhtDTXZdB/38VOaFW5MBzGy5xChinSYamJpAO/5vF2E+Ysdi7ngRvy54XYmjm+B2W8YV1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011995; c=relaxed/simple;
	bh=Onxzsj0Q9DV0eu6ozC9CJboyC4jtjgDcJxz5bfGWsuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cw22tJb8ppittVA8sQtM7w2lYpUnPVECVyWpJgMu3HWH8t9BKqNJ8h2S9cx2rlkBo5JbHB5vQsnbYqHVbSYdXxzeskEJLkDY1VyQNyKtkLHrq56DyHRuw/yPjOvdGVqCZo7pGLkYcIQAW7s4ubcWQU6bAMYf6uLn03I/gsdFHdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfW4k/2f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfW4k/2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA56D1F000E9;
	Tue, 14 Jul 2026 06:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784011994;
	bh=a+06sBeVaMr0O+Qr5MRt+JcVThTh2IjiE1te939gX8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LfW4k/2fbi5F7wG+FTq6TlxkG0MU1hIdlh+AIhvn0xDKa4hX3CQTXBnfGpR0iAmm+
	 6BS/mvJeMbsbvol26WOD4ChsY8CWZyh57ACaEkRNa8Ju2PcXpuArRj9oM8rvOe83Yq
	 lNwDD0mkFGhfmNA18ZZhk2TMvM4Wd1nSHCed6zhpEdE2DsCU5Ae1Y4bF/dm9eBBA7J
	 liY6qvLumCE11v5E0xMhPrtsjIOHsE2p3lXv53VBwXpSWLu2xADFDpTtYb/ZyGTbdV
	 BTZEcyWj1X0seCr7p2+KG4E36lCwcs/vprzOv6KxRyU5+EY+k5nXJXwJwR2q+4ETaI
	 DTfXQ7GBRQ4uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5
 offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260714-sm8475-bup-v1-2-b2871be2b4ec@proton.me>
References: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
 <20260714-sm8475-bup-v1-2-b2871be2b4ec@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 06:53:13 +0000
Message-Id: <20260714065313.AA56D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `.pcs_lane1` offset in `qmp_pcie_offsets_v6_20` causes sil=
ent out-of-bounds register overwrite of the `tx` block.
--

--- Patch [2]: [PATCH 2/6] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5 =
offsets ---
commit 796aa959cc0a08be913f9eb871fe4312d98e16fc
Author: Esteban Urrutia <esteuwu@proton.me>

phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5 offsets

Some SoCs such as SM8475 write data to registers using this offset,
specifically SW_CTRL2 and MX_CTRL2. Add pcs_lane1 offset to V5 offsets using
the proper offset, otherwise these registers would be part of RX and would =
not
be defined.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-pcie.c
> index d3effad7a074b..3618812e84d5f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -3554,6 +3554,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offse=
ts_v5 =3D {
>  	.pcs_misc	=3D 0x0600,
>  	.tx		=3D 0x0e00,
>  	.rx		=3D 0x1000,
> +	.pcs_lane1	=3D 0x1400,
>  	.tx2		=3D 0x1600,
>  	.rx2		=3D 0x1800,
>  };

[Severity: High]
This is a pre-existing issue and wasn't introduced by this patch, but while
you are adding the pcs_lane1 offset here, is it also missing from
qmp_pcie_offsets_v6_20?

Looking at drivers/phy/qualcomm/phy-qcom-qmp-pcie.c, qmp_pcie_offsets_v6_20
omits the .pcs_lane1 mapping:

static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_20 =3D {
	.serdes		=3D 0x1000,
	.pcs		=3D 0x1200,
	.pcs_misc	=3D 0x1400,
	.tx		=3D 0x0000,
	.rx		=3D 0x0200,
	.tx2		=3D 0x0800,
	.rx2		=3D 0x0a00,
	.ln_shrd	=3D 0x0e00,
};

This omission causes .pcs_lane1 to implicitly default to 0x0000, which is t=
he
same offset as the .tx block.

However, sdx65_qmp_pciephy_cfg pairs this offset structure with a valid
pcs_lane1 table:

static const struct qmp_phy_cfg sdx65_qmp_pciephy_cfg =3D {
	.lanes                  =3D 2,

	.offsets		=3D &qmp_pcie_offsets_v6_20,

	.tbls =3D {
// ...
			.pcs_lane1       =3D sdx65_qmp_pcie_pcs_lane1_tbl,
			.pcs_lane1_num   =3D ARRAY_SIZE(sdx65_qmp_pcie_pcs_lane1_tbl),
		},

Will this cause the pcs_lane1 table to blindly overwrite the PHY transmitter
registers in the tx block during initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-sm8475-bup=
-v1-0-b2871be2b4ec@proton.me?part=3D2
