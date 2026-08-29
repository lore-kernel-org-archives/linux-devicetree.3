Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B07306B0A
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982567; cv=none; b=cT/jOkIn9+xMIfFwxoln3BzbHb6O6tfH2ljKAqzSspcq6zqSiW2T4e5BAEi7zAHQ2YBcjo4hYgJ2fkXv8v2XdxTDNB2rHzaTTwiudSZ2WzYCmOHk/Br9pnygOQeU/I1yFhdht/0mCG7BxmtUfmln0726kBgBCOnAEexBcG4HqFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982567; c=relaxed/simple;
	bh=FMQjvQagWo3wMYF/zc1q1lBPGY27yjisSZkE2ax+W4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LMwynSC/JtwNoueAWo/QOvfQivGEDwYEZB+lR18tOe6m+Dwej0qcNbpAXM+Dsy7Ux5a+jGhblQZFf40umyu4z20eIfZye8HsxPFzjzCYCXHWf+IxcT3DmTfBpCjpqeDN73KCxVtFG4v9TE+ErbooITN7aSI20T8kQoZzuqNNYUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsRwj57I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsRwj57I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18E41F000E9;
	Sat, 29 Aug 2026 05:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787982566;
	bh=nkDF1BqTMuv99gl2BOvSXQZVD86C1hGkDDZs0c6TnAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HsRwj57IH+3CT2CzlsNWsd98+pMl9wAXvgs8eJnKdtkwkvL5AXy+zBWWy2uHcz7eK
	 /ZPOgtnLpXS38AZSmoKtHwSenctUu6ZO4CGlq4/9v0880ec28XUOpAonhGLrMB6Be7
	 WoDG77zTK1jYOv5baJMltcTaqUQ1GMWDOU+rHn4VqSKAMFSM0tBSOzyThfXPU5bdTG
	 jKC6Q3Cc90jCP/+MpA9cVBAiB75GB7o3MwUM9Jv/IwsYJFuT5tHRETSIpBVK+HXswS
	 UO18HhPEIh6qdjVCMG2LUbqpir/hKSqqUgV6AkXcYjKaIiwBJHef7pd90ZdbRQh3P7
	 vs933F7nor9ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ak7375: Do not mark the VCM active
 before powering it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan-Michael Brummer" <jan.brummer@tabos.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260829052514.18178-4-jan.brummer@tabos.org>
References: <20260829052514.18178-1-jan.brummer@tabos.org>
 <20260829052514.18178-4-jan.brummer@tabos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 05:49:25 +0000
Message-Id: <20260829054925.F18E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message incorrectly attributes a regulator leak to `p=
m_runtime_idle()`, which is structurally impossible.

Pre-existing issues:
- [Critical] Use-After-Free of `struct ak7375_device` on driver unbind due =
to `devm_kzalloc`.
--

commit a4a5fe00ce60666a1ebfccbdf63f44f93d436c10
Author: Jan-Michael Brummer <jan.brummer@tabos.org>

media: i2c: ak7375: Do not mark the VCM active before powering it

This patch replaces pm_runtime_set_active() with pm_runtime_set_suspended()
in the probe function to correctly reflect that the regulators are initially
off. It also adds a call to disable the regulators in the resume error path
to prevent leaking an enable count.

> probe() calls pm_runtime_set_active() while the regulators are still
> off, so runtime PM believes a powered device is present.  The following
> pm_runtime_idle() runs the suspend path against an unpowered chip, which
> fails its I2C writes and then calls regulator_bulk_disable() on
> regulators that were never enabled - later tripping the enable/disable
> balance check in regulator_bulk_free() on unbind.

[Severity: Medium]
Is this description accurate?

Looking at ak7375_vcm_suspend(), it explicitly checks the active state and
returns early:

drivers/media/i2c/ak7375.c:ak7375_vcm_suspend() {
    ...
    if (!ak7375_dev->active)
        return 0;
    ...
}

Since ak7375_dev is zero-initialized by devm_kzalloc() during probe, active
is false. This means pm_runtime_idle() would never reach the I2C writes or
regulator_bulk_disable() during probe.

Could the actual leak have occurred strictly on the resume error path inste=
ad?

> diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
> index 4f311c4c06ba0..2763bbed6cbd4 100644
> --- a/drivers/media/i2c/ak7375.c
> +++ b/drivers/media/i2c/ak7375.c
> @@ -235,9 +235,12 @@ static int ak7375_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto err_cleanup;
> =20
> -	pm_runtime_set_active(&client->dev);
> +	/*
> +	 * The regulators are off at this point, so the device is suspended,
> +	 * not active.
> +	 */
> +	pm_runtime_set_suspended(&client->dev);
>  	pm_runtime_enable(&client->dev);
> -	pm_runtime_idle(&client->dev);
> =20
>  	return 0;

[Severity: High]
This is a pre-existing issue, but does this devres cleanup lead to a
use-after-free on driver unbind?

The ak7375_device structure is allocated with devm_kzalloc() earlier in
ak7375_probe(). If a user-space process holds the /dev/v4l-subdevX node open
and the driver is unbound (e.g., via sysfs), ak7375_remove() will complete
and trigger devres to free ak7375_device.

When the process later closes the file descriptor, the V4L2 core functions
(such as subdev_close calling sd->internal_ops->close) will dereference the
now-freed v4l2_subdev pointer.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829052514.1817=
8-1-jan.brummer@tabos.org?part=3D2
