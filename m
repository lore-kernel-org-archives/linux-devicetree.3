Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404812853F8
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779825160; cv=none; b=uqwj5ViJU/dGRtfbGnXL//yKWNLDMdu57i9mZV8qURo6IBW/0byjMHBjxPdheAVKoGvWZA1Mf/yz4fZrYID3PU5EE31dm3bzos0fMuxN7zDLJnLSQcLJe59s2rnzRMUqjywL9eOlzPo48sl0715Rr6QmnNkM73YVNR2iGpIa8o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779825160; c=relaxed/simple;
	bh=phA/g/Tg7zSPNgIFX92L8f1CSTzVuMPX1fXJOBApHEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H6VIJmA9o50/dtBfIoST88mte3yaMBG2eENVN0aNg6MziH2Vth3CQ1AZrF1PpUr7Zd2D7Quinyit7UX4S6lZeHX9rrd8qEElQZ2G8osLFOGQUg18whu8CRml/A3s7IEjzUAl73v/PLcrUqXFKbsrVEvz+P5dRSmMgm2Eis6Dzg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iV974A3o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iV974A3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7621B1F00A3A;
	Tue, 26 May 2026 19:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779825158;
	bh=fgta5qpMtYouRXGhJBb+FoBguZBQkyT210Gnc22X8hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iV974A3oLoIj2BKpSdk3uiqrmYpagDcK8DsD4qU0dmrZaf9Ul/vEIfjwcyfviOZPE
	 A5ZMGKJa1sRBVxAjJIVXi81q4GdL6nwZCpDKUc9wlAyxE8nxfKhQ+Nxrb11egoI9AM
	 CM9Fpov5cw7+ODibcuvPmp0HyjNhNrBKqN1i+/OqecbtYn/d7dnAeAUW5g5w9cP9PX
	 YnBuM/x9+Ag4cooP/PpI2hsLL6burnzOMuGuzHsr40YDQGnXp2kEIzegtEinjEOJ4I
	 9csF3mEv/vb3xzV2Gisto9SjCRrzlnzs1GH0VlahC5VdIFkvAFOvL4kSQ9R9dLdhEI
	 saZjzri+vWagw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] phy: qcom: qmp-usbc: Add support for "phy" reset
 used on Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratham Pratap" <pratham.pratap@oss.qualcomm.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 19:52:38 +0000
Message-Id: <20260526195238.7621B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Unconditionally adding the 'phy' reset to `usb3dpphy_reset_l` =
breaks the driver probe for existing QCS615 platforms.
--

commit c8024a0d34e805ada6e128fcb57e931ef7692038
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

phy: qcom: qmp-usbc: Add support for "phy" reset used on Shikra

This patch adds the "phy" reset to the usb3dpphy_reset_l array. This extra
reset is needed for the operation of the QMP Phy on the Shikra platform.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-usbc.c
> index c342479a37980..067e7f6e56424 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
[ ... ]
>  static const char * const usb3dpphy_reset_l[] =3D {
> -	"phy_phy", "dp_phy",
> +	"phy_phy", "dp_phy", "phy",

[Severity: Critical]
Will adding this reset unconditionally cause a probe failure for existing
QCS615 platforms?

The length of the usb3dpphy_reset_l array is used by ARRAY_SIZE() to define
the num_resets value for the configuration. Since qmp_usbc_reset_init()
fetches these resets using devm_reset_control_bulk_get_exclusive(), it
strictly requires all requested resets to be present in the device tree.

If an older device tree only defines the two original resets, phy_phy and
dp_phy, won't the driver fail to find the third reset and return -ENOENT,
causing the probe to abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526184401.3959=
717-1-pratham.pratap@oss.qualcomm.com?part=3D4
