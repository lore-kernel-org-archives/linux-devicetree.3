Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8D43786F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444523; cv=none; b=NWAJltsOqvN8ZZhPDprFqwgjOHvk35w/2/QMe0m/TJ9Tb0JopWCjn8mEy0OUEwF7QrTOCOf5ulJFViFOcV4kxs5OmlgNIGYDpMvSJtrDv76DOQlAW/GPP45d4NGaT+Bs84xGIcyj77QKqCzinWy8J7E7pBYhQj8VbVlZB/v3hos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444523; c=relaxed/simple;
	bh=uleilE4EQ5NofELDKGIdatXPWdAJDOmSKJlekuG+XqE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WCkjLJ4fuxqaFX0vbS78YJdflajpCGOHyo9D7w4uZrG/zes8N2KNEjl174sl2GZz/vM7Ww6o+xWDOEE/MxOnitZ5QxfGO5fXyJT/C/sbgD5O402tj8gRA3kyNz16eOgObZxr8s7qno3nfe4F213I3Upx1OLSlPMohIbGhXycIRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=febOPB6M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="febOPB6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8027F1F000E9;
	Tue,  7 Jul 2026 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783444521;
	bh=Fx0DIYy8QJtowEf3WHpMDEcEIsLijK16d79KNPOThPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=febOPB6MhRRRquNu3DToFNPRqOewab8HEUaggVO5yJXyIdoyB19hMu5NKZM98ebVQ
	 PioXPCkb4FWA0eL/ykB7FkHpoxiH/LmcQp3voxSJvh8v8q20ZlzLu7/8kaFNiV01+R
	 iyofe+q5/Il11s9AlJkA4Nh+SU+QjQpB2b530ZEpeVq25s/9QLnimRo9IeaUksuEub
	 qtxBal8rM2mFoIpDplk0ScXVl6xC6Op3BbEChCjMt5blmjgHc4VQ+sGJMdtXKo2Z6e
	 fYm90+2G4ZwHO2pWuFVkhfuPdtVyhCxgOu7eEjmq+QDVOLSzzVHcRLvzpzm0ldECwc
	 CyRBVysUYwnlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/20] media: imx355: pixel_rate never changes, so
 don't recompute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-media-imx355-v2-9-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-9-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:15:20 +0000
Message-Id: <20260707171521.8027F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In the probe error path, `imx355_power_off()` can be called twice =
if `v4l2_async_register_subdev_sensor()` fails, leading to unbalanced clock=
 and regulator disables.
--

--- Patch [9]: [PATCH v2 09/20] media: imx355: pixel_rate never changes, so=
 don't recompute ---
commit b383e35f1be32e2228da9d8a41ed9f15cb5ff8e5
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: pixel_rate never changes, so don't recompute

The pixel rate is always the same, so there is no need to try and
recompute it in imx355_set_pad_format, and then no need to have the
pointer to it stored.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 20cf6afee43ee..9d977bac23b6c 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c

[ ... ]

This is a pre-existing issue, but I noticed a potential double power-off
in the probe error handling path while reviewing this file.

drivers/media/i2c/imx355.c:imx355_probe() {
        ...
        pm_runtime_set_active(imx355->dev);
        pm_runtime_enable(imx355->dev);
        pm_runtime_idle(imx355->dev);
        pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
        pm_runtime_use_autosuspend(imx355->dev);

        ret =3D v4l2_async_register_subdev_sensor(&imx355->sd);
        if (ret < 0)
                goto error_media_entity_runtime_pm;

        return 0;

error_media_entity_runtime_pm:
        pm_runtime_disable(imx355->dev);
        pm_runtime_set_suspended(imx355->dev);
        v4l2_subdev_cleanup(&imx355->sd);
        media_entity_cleanup(&imx355->sd.entity);

error_handler_free:
        v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);

error_power_off:
        imx355_power_off(imx355->dev);

        return ret;
}

[Severity: High]
If v4l2_async_register_subdev_sensor() fails after the device was already
suspended by pm_runtime_idle(), won't the code fall through to
error_power_off and call imx355_power_off() a second time?

Calling regulator_bulk_disable() and clk_disable_unprepare() on already
disabled resources might cause unbalanced disable warnings and refcount
underflows. If these resources are shared with other active devices, could
this unexpected force-disable break functionality for those other devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D9
