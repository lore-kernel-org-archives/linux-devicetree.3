Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B533123D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781299845; cv=none; b=cui6ULlP20QQB4UDVOxoKAV/7OjzpH8FSyC+H0x/nNboUeBxB92DyojFpcMiwc8SfLj//b0MkTbEJHuq0yNQFBiqy1tDoc/LVbysJmRP2LzKtavdjw7dWpcpMF8aRackXmZzWVwI32/Ggg1LagtUkASMDZnmJN9qUscZFk22eeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781299845; c=relaxed/simple;
	bh=EZhTyFuk78FEDoH7wm6E6oYZKK+8broLgU5doNWXO7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ouOPkN1lhQtUdsCyrOFuK7QBSfteWkOWhkUaK29MqmiXwBn6FvgWLdigsyBQIylgPIHH19yaJX/Hjv0C+F742aNR3NGgauOIQ8Nq3HMlRbC9W7tet9TW+HwbC3YxYiUbS0G7qW3ScqYnajIW6jj5mt0GFRUdUCzf9iB7035Rywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhbEmyI1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhbEmyI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB98D1F000E9;
	Fri, 12 Jun 2026 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781299844;
	bh=O1v+VsJN+/v6V7SUw6+Zj+EpZ+iCIQUm3XCC3Iugdtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OhbEmyI1J4d7IcbYMo8SmFF+kk0tm5R45w4djJXymAISwcxgMurvA3QbfpB13fRV7
	 0V/nIA2PG65acavYtrClC+mXhNNVUNyIUz6TXDTOdzKwYmUFAgu54GXpn0DFnv1UtA
	 1f7zwK/EsGPNI231VI5e+gH6htsNU4vzBR2RyePiGbgsOxTDL59J6DjOOach0e8UZI
	 SxnjYLQLkftUs6n2e9jkVg/paWEBmXNubeOPITY6zKGDJJATzR9cdEthzfUi0FOGk+
	 V8s5IGRkByi5/uc6q46AM3E3HPPlmYgMSCeOB/DL8RQR9yr7VzDTtu2N6MbYKCGZ/L
	 tW3NqjYvYyYlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 phy-next 8/8] phy: lynx-10g: use RCW override
 procedure for dynamic protocol change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260612210859.266759-9-vladimir.oltean@nxp.com>
References: <20260612210859.266759-9-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 21:30:43 +0000
Message-Id: <20260612213043.BB98D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Read-modify-write in `fsl_guts_rmw()` drops dynamic overrides of o=
ther lanes sharing the same register.
- [High] If `fsl_guts_init()` fails during `soc_device_register()`, the new=
ly added call to `fsl_guts_lane_set_mode()` will trigger an uninitialized s=
pinlock BUG.
--

commit b8f6b1d355d36a951d62ed32d06cbd69afef40c2
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

phy: lynx-10g: use RCW override procedure for dynamic protocol change

This patch enables dynamic protocol changes beyond 1000Base-X/SGMII and
2500Base-X. It removes the previous limitations by utilizing the RCW
override procedure provided by the guts driver.

diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/freesca=
le/phy-fsl-lynx-10g.c
index 38def160ef1aa..5ece7889aed7b 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-10g.c
+++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c

[ ... ]

@@ -1225,6 +1223,13 @@ static int lynx_10g_set_mode(struct phy *phy, enum p=
hy_mode mode, int submode)
 	if (powered_up)
 		lynx_10g_lane_halt(phy);
=20
+	if (lynx_10g_lane_mode_needs_rcw_override(lane, lane_mode)) {
+		err =3D fsl_guts_lane_set_mode(priv->info->index, lane->id,
+					     lane_mode);
                 ^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This isn't a bug introduced by this patch, but does calling
fsl_guts_lane_set_mode() here expose a bug in fsl_guts_rmw() where dynamic
overrides on other lanes are dropped?

When fsl_guts_lane_set_mode() calls fsl_guts_rmw() to update the hardware m=
ux,
it incorrectly reads from the boot-time status register (RCWSR) instead of =
the
control register (RCWCR):

drivers/soc/fsl/guts.c:fsl_guts_rmw() {
    ...
    u32 tmp =3D fsl_guts_read(&soc.dcfg_ccsr->rcwsr[offset]);

    tmp &=3D ~mask;
    tmp |=3D val;
    fsl_guts_write(&soc.dcfg_dcsr->rcwcr[offset], tmp);
    ...
}

Because RCWSR is read-only and reflects the boot-time configuration, and
multiple lanes share the same register, won't dynamically changing the
protocol of one lane revert any previous dynamic changes applied to the oth=
er
lanes?

[Severity: High]
This is a pre-existing issue, but could this also trigger an uninitialized
spinlock BUG if fsl_guts_init() fails?

In drivers/soc/fsl/guts.c, if fsl_guts_init() fails during
soc_device_register(), the error path doesn't clean up the global soc.data
and skips initializing soc.rcwcr_lock:

drivers/soc/fsl/guts.c:fsl_guts_init() {
    ...
    soc_dev =3D soc_device_register(soc_dev_attr);
    if (IS_ERR(soc_dev)) {
        ret =3D PTR_ERR(soc_dev);
        goto err;
    }

    spin_lock_init(&soc.rcwcr_lock);
    ...
}

Since soc.data is left populated, the readiness check in
fsl_guts_lane_set_mode() will pass. Won't this then proceed to acquire the
uninitialized soc.rcwcr_lock, triggering a SPIN_BUG_ON?

> +		if (err)
> +			goto out;
> +	}
> +
> 	err =3D lynx_10g_lane_disable_pcvt(lane, lane->mode);
> 	if (err)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612210859.2667=
59-1-vladimir.oltean@nxp.com?part=3D8
