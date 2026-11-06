Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940226;
	b=JRHKk9mew9GjvADBV6D2+B25XnsNzNJS+3vQXTQmqGEKn583aEp1mTvkixkXdK6fgkrt
	 975vLW9Di8hfpO+VOc47OhlJ7Jjv+R5KBYkwkGNqnhpVnCE8T4XttI65jxRe89i8aXjjJ
	 tHP9fUaOMU55tXaRFrrqFqA47GcH/Pj+03FbdE5XFwW6X5HyaVuidTqd6cDtvYEo/bv1Q
	 a9oqx0doRZbharoYH64dFgVW9YuL5NwzwkN8LIs6l5Hufm297BkeJMd4g75+toprHRcqh
	 hk8JAH8la1ytd/xlI4J26nTRWICgBXGqp7VWayH1bK+inPz72bDK/oIJQUmuWmiB/ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940226;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nOW2h5Asfqkopfxrf8dpFYXq65iQ5TyZ2tVDQf4hEeA=;
	b=tiVnUcssKin7A3eX5d2MHvu7q+oTYMExWzZgzxG6Vhsjj6bRgAK05ZCjp4M96vOUGF4F
	 uZxiS8o8PzTp+uZogn2lHPQEtvbvwC0yCCjpuLX+NNkW3zxtLuGCTueqIVDWvVBrnp4cm
	 vtvzgCdAR50tKsz7D8GLcZ+6CA97iOPof/iNfDmSHqPuSrkDoMtCuYD9nzO57IQQmfPJo
	 Z+VQUlg7IfinL8vxNj9fatyT0fK7qF1eoNxCtfJogz+Rm3xWaMcpUDUbRcbVpqLOGr0wX
	 BYYEGmCCidGmgsjaySTlfl20bgS5f7WCq6WfG+44ZN8qiKPQZx7GBq7xCp9AePx9W+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DR0a1NnC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD024606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 04:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DR0a1NnC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0481F0089F;
	Fri,  6 Nov 2026 04:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793940225;
	bh=nOW2h5Asfqkopfxrf8dpFYXq65iQ5TyZ2tVDQf4hEeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DR0a1NnCqjSAc6NOCUL3TUSn8S4Ols0EEmelYkXz69wbbvFRQxIV8UEPUqhgep5nx
	 dnfGkhhAJZh9DpAm3Ow6EdJXklyyumBLI/Pp/cHALcBo9lUWiQ339I4pVGdhoboQoC
	 OMrqlcZ/CsJOUYDaS1u3XauefdR58ABoiYNRdY527QFNUyF586WwcIlgAVml9R/nBV
	 l4t9l98jrfnCHjWUShws16cR/RHF06Byymt9RH5+Gr0lRTC9NeD7kP3HDW4rcmzuV/
	 MCZ2B8uindOdhJDA0CLQONzEBoMtjOXOl3/WVo0Q0t71rKgAp+Bm1gi0kFgImLcC2z
	 jIXIywnBE2z0g==
Message-ID: <sashiko-outbox-200755@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] media: ipu-bridge: Add Sony IMX681
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261106041116.78937-4-lsa.uz@pm.me>
References: <20261106041116.78937-1-lsa.uz@pm.me>
 <20261106041116.78937-4-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 04:43:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: i2c: imx681: unbalanced power off on imx681_probe() error=
 path
--

commit 948d595796e70ce27a350282b1ce33a466c43a6f
Author: Sergey Lebedev <lsa.uz@pm.me>

media: ipu-bridge: Add Sony IMX681

This commit adds the SONY0681 ACPI sensor configuration to ipu_supported_se=
nsors
so ipu_bridge_connect_sensors() connects the Sony IMX681 sensor endpoint on=
 the
Microsoft Surface Pro 11 for Business.

> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
> index 3739c4a2a8c43..2759c776cfcae 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -124,6 +124,8 @@ static const struct ipu_sensor_config ipu_supported_s=
ensors[] =3D {
>  	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
>  	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
>  	IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
> +	/* Sony IMX681 */
> +	IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),

[Severity: Medium]
With SONY0681 added to ipu_supported_sensors[], ipu_bridge_connect_sensors()
populates the sensor endpoint so imx681_probe() in drivers/media/i2c/imx681=
.c
proceeds past imx681_parse_endpoint(). Can this trigger an unbalanced
imx681_power_off() call if a later step in imx681_probe() fails when
CONFIG_PM is enabled?

In drivers/media/i2c/imx681.c, imx681_probe() powers on the sensor and enab=
les
runtime PM without taking a usage reference via pm_runtime_get_noresume():

drivers/media/i2c/imx681.c:imx681_probe() {
	...
	ret =3D imx681_power_on(imx681->dev);
	if (ret)
		return dev_err_probe(imx681->dev, ret, "power on failed\n");

	ret =3D imx681_identify_module(imx681);
	if (ret)
		goto error_power_off;

	/* Enable runtime PM */
	pm_runtime_set_active(imx681->dev);
	pm_runtime_enable(imx681->dev);
	pm_runtime_set_autosuspend_delay(imx681->dev, 1000);
	pm_runtime_use_autosuspend(imx681->dev);
	...
}

Because dev->power.usage_count is 0 and use_autosuspend is not yet set when
pm_runtime_set_autosuspend_delay() runs, the call chain:

  pm_runtime_set_autosuspend_delay()
    -> update_autosuspend()
      -> rpm_idle()
        -> rpm_suspend()
          -> imx681_power_off()

synchronously suspends the device and disables imx681->xclk and
imx681->supplies.

If imx681_init_controls(), media_entity_pads_init(),
v4l2_subdev_init_finalize(), or v4l2_async_register_subdev_sensor() subsequ=
ently
fails, the error path jumps to error_pm and falls through to error_power_of=
f:

drivers/media/i2c/imx681.c:imx681_probe() {
	...
error_pm:
	pm_runtime_dont_use_autosuspend(imx681->dev);
	pm_runtime_disable(imx681->dev);
	pm_runtime_set_suspended(imx681->dev);
error_power_off:
	imx681_power_off(imx681->dev);

	return ret;
}

Calling imx681_power_off() unconditionally a second time will call
clk_disable_unprepare() and regulator_bulk_disable() on already-disabled
resources. Should imx681_probe() hold a runtime PM reference across probe (=
via
pm_runtime_get_noresume() before pm_runtime_enable(), paired with
pm_runtime_put_autosuspend() on success and pm_runtime_put_noidle() in
error_pm), or guard imx681_power_off() with
!pm_runtime_status_suspended(imx681->dev) as in imx681_remove()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106041116.7893=
7-1-lsa.uz@pm.me?part=3D3
