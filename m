Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F03471265
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793537; cv=none; b=SKGqrwxVGFbNoi4Sm1jQmsfA/tz7wo4UQ2MwavrpGPMXQFJzEviJioyhSZ+Gsg8gvBDvXHK0wyntn88aOIxyszuT61a/BDJej38KWYAeLmdnWW+JLt7iIPCHspbUew121gge2scEaUCfzlTT3lLyHP/EklV1BCyrY4sfTeyECZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793537; c=relaxed/simple;
	bh=8pyY58Lx3x8K8ElLcYcvmsp2/T0Vt/uq6hHoQEGvIVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EMpso8P9XdQ+LhQDxcw+b7jNqRw3xzifuv9qHs6WNvcF1Jr7qsHAncK6M2hH2nUnu7bhmuB6+xZl9lkLFffj+HUVFoIRBqASLNh7VliItR3Dg84iPDuUboCH79a0QvJARlRzNxgLMUHxQtbol7CL9FzjPO0IR3hYHq0njhnPTbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCqK3ZXb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCqK3ZXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9331B1F00A3A;
	Mon,  7 Sep 2026 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788793535;
	bh=4oq8ZpywwRD2vQxXdKevZzjzZN90SDXuHErZ7Kh1LvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XCqK3ZXbugjp4iXswaf7BEgHR8exWSvhPZ+IDgKRuU1L3SHfjeroGUVjuJRBZHxgk
	 yV5Zi30KgnHDY5+GochSAS5kXVR3jyaWERFCIzENVVQOfwvaIjHVVDDOmBedQH8OnQ
	 AfCPaMeixtWDTBRpMiJm17Z7oFbLxmiKnkdgQrZ/MRYqBWCPpnGrYltg67sYtMinbz
	 qv8e8CTkUxyBRM1Sr1KnMRnipnNyb6zAgUYjxIjw2lMofhLm1/NCbctKp8ogLwHqku
	 DFqusjr7TECV72+t90dBiTpui43btcIJntIWUCnAtpJ3y9yK/RzwevWmwpeLte336B
	 MDhomk1ZlcFmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/9] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907-mma8452-open-drain-v8-7-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
 <20260907-mma8452-open-drain-v8-7-c17407e22118@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 15:05:35 +0000
Message-Id: <20260907150535.9331B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware configuration context is lost across runtime suspend/resu=
me cycles involving power loss.
- [High] Raw reads fail when the device is idle due to waiting for data rea=
dy before resuming the device.
--

commit 74793c7cf1159fd96130d4ae4c8de1b7780ff4b3
Author: Esben Haabendal <esben@geanix.com>

    iio: accel: mma8452: Allow open drain interrupt pin configuration
   =20
    When designing systems sharing the interrupt for mma8452 chips, it is
    helpful to be able to configure the irq pin in open-drain mode (default=
 is
    push-pull).

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 2c1b97b77bc19..b5ab85a86e72a 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -1792,6 +1816,10 @@ static int mma8452_runtime_resume(struct device *d=
ev)
>  		return ret;
>  	}
> =20
> +	ret =3D mma8452_set_interrupt_pin_mode(data);
> +	if (ret)
> +		goto runtime_resume_failed;
> +
>  	ret =3D mma8452_active(data);

[Severity: High]
This isn't a bug introduced by this patch, but does mma8452_runtime_resume()
fail to restore the hardware configuration after regulators are turned off
during suspend?

The device autosuspends after 2 seconds of inactivity, which disables the
VDD/VDDIO regulators via regulator_bulk_disable(). When it resumes,
mma8452_runtime_resume() appears to only restore CTRL_REG1 (via
mma8452_active()), and now CTRL_REG3, permanently dropping the rest of the
configuration.

Will the sensor lose settings like full-scale range (DATA_CFG), interrupt
routing (CTRL_REG5), and threshold configurations (TRANSIENT_THS) since
they revert to factory defaults upon power loss?

[ ... ]

While reviewing this driver, I noticed another pre-existing issue:

drivers/iio/accel/mma8452.c:mma8452_read() {
...
	int ret =3D mma8452_drdy(data);

	if (ret < 0)
		return ret;

	ret =3D mma8452_set_runtime_pm_state(data->client, true);
...
}

[Severity: High]
This is a pre-existing issue, but will raw sysfs reads fail when the device
is idle?

The mma8452_set_runtime_pm_state() call to wake the device is placed after
the polling loop for data ready in mma8452_drdy().

If the device has been idle for 2 seconds and entered autosuspend, the
chip is in STANDBY (or completely unpowered). Because of this, the Data
Ready (DRDY) bit is never set. The function times out after polling and
aborts the read before it ever attempts to wake up the device.

Should the device be resumed before polling for data ready?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-mma8452-op=
en-drain-v8-0-c17407e22118@geanix.com?part=3D7
