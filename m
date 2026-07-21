Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55463397E96
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657698; cv=none; b=uBypG2uitn1+7CjBYHmjD5mjaJPKPjIwsqnkZ2h5podTSt4ws5v9nSv5hPRdE9KqmXzNOY52C7yR/aVMg6IcK0+W3bln6KY1aopyFmLvgPTUo1/Oh8K3+ZE9tM115ttAXqzKDn9QskeB9gnNQOVvPYb3rSa/rS3Gk0jZ3Oy4Gag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657698; c=relaxed/simple;
	bh=SXXQK9gakQy0vChiYKP8QsKCyIyiLasUI5+cRBsqOLE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uFzPqf2G8L5gmwIssG65HnbB03cD9zYQhP8VWwtNv0xmO+IhVNL/trq6QOUgx1M+cUK3GhOOHPEwLzXOwMd7JpagR0qywGz2a8qHYsPBzM+fvm/QMuFShrMpO0weVqiMRcnujyjlRt6rBGFgdK1sjxiYZZFQKoa4OhR4G+oAURs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFWLFC3j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFWLFC3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF271F00A3A;
	Tue, 21 Jul 2026 18:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657697;
	bh=b9TxdQy0//5Ha8Gm5yJXnTz0DY13wIxZMlP4M1iFGzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HFWLFC3jV4hlIppjT+uoMbAPLd/eKhg8bz7wkz4NSsQMMqfshtHpFx7KLWGk76lAA
	 BE0ykQ9NaRBNxOqs5UT8lWEaq4fDHhsmd8yQuZxDR9RibZ5Vt8gxxXPIq33fUlAJRU
	 p1h+qSt+Tzx5X0kuaDVb465ZrscO5DWXioXMDBWPOHKzHYzaFr2pcdzRHz43Wfd/Ot
	 tx+jW4YIRwS9c5+DMQFTQ/U7cDbchWQm/QRN+zCMcoBBgxZ6UGxK46eaPnqgH3450I
	 zDNqxxZfm4gBkG17Z6hI+cjtPbknntmE/ybCfppCmS4a2qa/j1RwYdNVXb0MWKM5x3
	 aRcQMrgvUGkVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/10] drm/bridge: synopsys: dw-dp: Support software
 triggered OOB HPD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-5-f0f4a4ede712@collabora.com>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-5-f0f4a4ede712@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:14:56 +0000
Message-Id: <20260721181456.AEF271F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing Workqueue Cancellation / Use-After-Free in teardown path
--

--- Patch [5]: [PATCH v4 05/10] drm/bridge: synopsys: dw-dp: Support softwa=
re triggered OOB HPD ---
commit 27d73c3f273597742127e6851884d387b3ffe886
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Support software triggered OOB HPD

This patch adds support for USB-C DP AltMode out-of-band hotplug handling
by allowing platform-specific drivers to implement HPD software
configuration and selection.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 0e8ecd73a0002..8eb2699dc7ab0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -2052,6 +2086,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *=
pdev, const struct dw_dp_plat_
> =20
>  	dp->dev =3D dev;
>  	dp->pixel_mode =3D plat_data->pixel_mode;
> +
> +	dp->plat_data.hpd_sw_sel =3D plat_data->hpd_sw_sel;
> +	dp->plat_data.hpd_sw_cfg =3D plat_data->hpd_sw_cfg;
> +	dp->plat_data.data =3D plat_data->data;
>  	dp->plat_data.max_link_rate =3D plat_data->max_link_rate;
> =20
>  	mutex_init(&dp->irq_lock);

[Severity: High]
This is a pre-existing issue, but is there a missing workqueue cancellation
in the driver teardown path?

In dw_dp_probe(), the driver initializes a work item for hotplug detection
shortly after the modified code block:

    INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);

However, looking at dw_dp_unbind(), the work is never canceled:

    void dw_dp_unbind(struct dw_dp *dp)
    {
        disable_irq(dp->irq);
        phy_exit(dp->phy);
        drm_bridge_put(dp->next_bridge);
        drm_dp_aux_unregister(&dp->aux);
        drm_bridge_remove(&dp->bridge);
    }

Since the dp structure is automatically freed by devres after the remove
callback completes, could this result in a use-after-free if the IRQ
handler schedules the work right before unbound is called, and the work
executes after the dp structure is deallocated?=20

Would it make sense to add a cancel_work_sync(&dp->hpd_work) call to the
teardown path to ensure the work item finishes safely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-synopsys-d=
w-dp-improvements-v4-0-f0f4a4ede712@collabora.com?part=3D5
