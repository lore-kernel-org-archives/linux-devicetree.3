Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E553B4A384B
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141750; cv=none; b=VhSsQpIpvFZ3nUcAH++RUVjTH98CVrYKflvB8oZXOTeA8I3ype6Jtxj572zPn1uekWaZp+dPMmMRgdpeLC33eQ0+9gI5hhYDTJIOflSbK9Xi2dliNzdeFm+L97GfQ5+iQoihK6mKELs8b/akpbLsBm+jH5XQ13xpwmfYi1Bz0J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141750; c=relaxed/simple;
	bh=/juOXZtBLWQbno0YFrulZjwNq7eszryzjwR/C1HYeaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IMqKU6hu6SS4ZJjHYuAnUHZBRn+DNYdi8WzrVYHNzRjt+ZNKJif6cjAILVNzk/RJIQLV63YMPAHapa5iUtE39sH6ec+YjEl/Q9yh4AHX9YY5+BDHwehJZX85nL4tOXcyFXFH9uwlhTGs/+YmBm0UaVfBwVJhEqA+sU2p7dXStCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCptqKzZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCptqKzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0B81F000FF;
	Fri, 11 Sep 2026 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789141748;
	bh=hd+UvuJiwOUDiM2w6IpVWyqO25djS1xmTmBKKaDCSdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JCptqKzZ75f32yJlRgCuNxgHtGsNfod82lXksNFXwLA9+FtJtt9MsmuYvPM8/dGs/
	 QOvomvRyoUxVkNxGNULfpJ+d3ywbAK01KTQMsxfzGwt4urlJZoFXll7H9AB6K6bt2l
	 aZUekB8Zv78fWUwChnPW/f0Fuo4zlSjSPEkGA0ueaQ7zW3jg8+iwKDSehi+53h3IF+
	 H5jl0IZ509R1ITFFOgHiBPLuTy8sGH1yrhHaTDNL0sDlnUdBC07afOusPlUBWiR+xz
	 1oGFCVWwhiU24LN7Z0Snrpc84pji2E67S5t8kqGbHyXV1M10LYWu1UVu6pKPMH3ZPn
	 TeI6ApyF3+qmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/17] phy: qcom: edp: Add Nord-specific register
 offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, olteanv@gmail.com
In-Reply-To: <20260911-nord-drv-dt-v1-7-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-7-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:49:07 +0000
Message-Id: <20260911154907.BB0B81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added register `DP_PHY_LDO_CFG` is missing the `_NORD` su=
ffix.
--

commit d9b8ac1d640ce0c0f48897f46216bd9e72eb391e
Author: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

phy: qcom: edp: Add Nord-specific register offsets

This commit adds Nord-specific register offsets for the DP PHY and QSERDES
v8 COM to allow Nord sequences to reference them directly by name.

> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/p=
hy-qcom-edp.c
> index a3c893f72908f..bf8a17336c7ec 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
[ ... ]
> @@ -41,9 +41,19 @@
> =20
>  #define DP_PHY_VCO_DIV                          0x0074
>  #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
> +/* Nord uses a different register layout; non-Nord value is 0x00a0 */
>  #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
> =20
> +/* Nord uses a different register layout; non-Nord value is 0x00e0 */
>  #define DP_PHY_STATUS                           0x00e0
> +#define DP_PHY_STATUS_NORD                      0x0110
> +#define DP_PHY_LDO_CFG                          0x00f0

[Severity: Low]
The commit message notes this patch adds Nord-specific defines, and other
newly introduced registers appropriately use a _NORD suffix (like
DP_PHY_STATUS_NORD and DP_PHY_TX_LN0_DRV_LVL_NORD).

Does DP_PHY_LDO_CFG also need the _NORD suffix here? Leaving it off makes it
appear as a generic register rather than a Nord-specific one.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-nord-drv-d=
t-v1-0-e25c073cf1b6@oss.qualcomm.com?part=3D7
