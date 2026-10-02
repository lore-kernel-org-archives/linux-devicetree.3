Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA6451996
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932425; cv=none; b=n/NGS+dlIznAUJCWuZiM0K+c63DBddkpdPKwqYSGgpsujj4akdtVXcHnVn/tqMfLA/CwcvOtlUsCv4+YXS/bIhqdcoGwepA/1hgHLQVj8wMVbU/cPwMvvZxPdf2lCWJhs2Tr55dmky4B0UVFPsR1Yl70Tn0UVR6H25ZAo1IxTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932425; c=relaxed/simple;
	bh=IkCmL1KrMzPrFCN/8+H25JFQIwgyzHM/P63Q4QZyZmg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AAGnSTWXMiPkcaSqRHN/QPz8GeeOzNvzolQ8rJk/LCxQDJ7HxTrXoS06Gk0uor+lZpbC3/U4z44qrfXTokcH32hakGriFHit7C6zwut9mM5Qq/s6Bm4YAlVu/Hjg63LpmKnejK5eZDcY2Fubr92b8wl1XfsSv2CV3cHMHy8EOBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzJfGaL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzJfGaL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64EB1F00893;
	Fri,  2 Oct 2026 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932420;
	bh=YuS2t0RyM6ZUcZcxmciZXs1Kr+MRiGKNscW4T4dBREU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gzJfGaL34ICpS2OuEPP9oCD7ivNkwpBqkMJmBEuxvVRWdUNXB4CrbgJPDJfZhlIvl
	 i+ZTDsZhntCE8SGbjxdVgAaxS9JO6Wdr3sJ1XHMgwksVU5tPMNOXWFRWUs5Q30A+92
	 /q89ulqTsRrLVxnnlgqd4AV2Euaqqeppm5SeT+3bnMfpYPygpoDw0S+G4L/ycr2RMt
	 qiQRxr5TfTFDGqBunjV2kJ50K43iGw99pJVMmUAg5dYuodVT7lGvucdOiIrWWo+nKf
	 boKySPREZXqZ+DnCMQ3HZ+4geI34RJY8X8iqGF8Rq8TJo3kyqSwb67QcAgrXvNh6Hi
	 pTrGBWP2Rc9kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 03/13] drm: client: add splash client
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TcOgeGltIFBlZHJhemEgUGFkaWxsYQ==?= <maximpedraza@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261001195847.141192-4-maximpedraza@gmail.com>
References: <20261001195847.141192-1-maximpedraza@gmail.com>
 <20261001195847.141192-4-maximpedraza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:39 +0000
Message-Id: <20261002091339.B64EB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/client: splash: UAF of drm_framebuffer on hotplug error path
- [Medium] drm/client: splash: memory leak of scanout array on hotplug -ENO=
DEV
- [Medium] drm/client: splash: firmware blob leak if render thread exits wi=
th -EBUSY
--

commit 86a0b0be0de60a4b9d33ab49ce7a129fe48448a6
Author: Francesco Valla <francesco@valla.it>
Date:   Thu Oct 1 19:58:37 2026 +0000

    drm: client: add splash client
   =20
    Add a DRM client that draws a simple splash, with possibility to show:
   =20
      - the logo provided by EFI BGRT;
      - a static BMP image (loaded as firmware);
      - a colored background.

> diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clien=
ts/drm_splash.c
> new file mode 100644
> index 0000000000000..66c192139d9c4
> --- /dev/null
> +++ b/drivers/gpu/drm/clients/drm_splash.c
> @@ -0,0 +1,1028 @@

[ ... ]

> +static void drm_splash_fw_callback(const struct firmware *fw, void *cont=
ext)
> +{
> +	struct drm_splash *splash =3D context;
> +	struct drm_client_dev *client =3D &splash->client;
> +
> +	if (!fw || !fw->data) {
> +		drm_err(client->dev, "splash: no firmware");
> +		release_firmware(fw);
> +		fw =3D NULL;
> +	}
> +
> +	scoped_guard(spinlock, &splash->fw_lock)
> +		splash->fw =3D fw;

[ ... ]

> +static int drm_splash_render_thread(void *data)
> +{
> +	struct drm_splash *splash =3D data;
> +	struct drm_client_dev *client =3D &splash->client;
> +
> +	while (!kthread_should_stop()) {

[ ... ]

> +		if (draw_count > 0) {
> +			ret =3D drm_client_modeset_commit(client);
> +			/* If commit returns EBUSY, another master showed up.
> +			 * This means that the splash is no more required.
> +			 */
> +			if (ret =3D=3D -EBUSY) {
> +				drm_info(client->dev, "splash: not master anymore, exiting");
> +				break;
> +			}

[Severity: Medium]
Can the firmware blob be leaked if the render thread exits early here?

If drm_client_modeset_commit() returns -EBUSY, the thread breaks out of the
loop and exits. If the firmware request later completes,
drm_splash_fw_callback() stores the firmware in splash->fw. Since the thread
is already dead, won't this firmware remain unreleased until the DRM device=
 is
completely unregistered?

> +		}

[ ... ]

> +static int drm_splash_init_client(struct drm_splash *splash)
> +{

[ ... ]

> +	/* And point every modeset at the buffer of its scanout */
> +	i =3D 0;
> +	drm_client_for_each_modeset(modeset, client) {
> +		unsigned int idx =3D i++;
> +
> +		if (idx >=3D 32)
> +			break;
> +
> +		for (k =3D 0; k < splash->n_scanout; k++) {
> +			struct drm_splash_scanout *scanout =3D &splash->scanout[k];
> +
> +			if (scanout->buffer && (scanout->modesets & BIT(idx))) {
> +				modeset->fb =3D scanout->buffer->fb;
> +				break;
> +			}
> +		}
> +	}
> +
> +	mutex_unlock(&client->modeset_mutex);
> +
> +	return (fb_count =3D=3D 0) ? -ENODEV : 0;
> +}

[ ... ]

> +static int drm_splash_client_hotplug(struct drm_client_dev *client)
> +{
> +	struct drm_splash *splash =3D client_to_drm_splash(client);
> +	struct task_struct *thread;
> +	int ret =3D 0;
> +
> +	guard(mutex)(&splash->hotplug_lock);
> +
> +	/* The modesets that get a splash are defined at first hotplug event */
> +	if (splash->initialized)
> +		return 0;
> +
> +	ret =3D drm_splash_init_client(splash);
> +	if (ret =3D=3D -ENODEV) {
> +		drm_info(client->dev, "splash: no modeset found");
> +		return 0;
> +	} else if (ret) {

[Severity: Medium]
Could this error path leak the splash->scanout array?

If drm_splash_init_client() successfully extends the array using krealloc()
but fails to create any buffers, it returns -ENODEV. This early return hand=
les
the -ENODEV case but does not free the array.

Could subsequent hotplug events keep appending to it and leaking memory on
every failure?

> +		drm_err(client->dev,
> +			"splash: failed to init client: %d", ret);
> +		return ret;
> +	}
> +
> +	/* Create the render thread, waken later */
> +	thread =3D kthread_create(drm_splash_render_thread, splash,
> +				"drm_splash_%s", client->dev->unique);
> +	if (IS_ERR(thread)) {
> +		ret =3D PTR_ERR(thread);
> +		drm_err(client->dev,
> +			"splash: failed to create render thread: %d", ret);
> +		drm_splash_free_scanout(client);
> +		return ret;
> +	}

[Severity: High]
Does this error path leave dangling pointers in the client's modeset array?

In drm_splash_init_client(), modeset->fb is assigned the framebuffer of the
newly created buffer. If we fail here and call drm_splash_free_scanout(), t=
he
buffers and their framebuffers are freed, but modeset->fb is not cleared.

Since the client remains registered on dev->clientlist even after a hotplug
error, could a subsequent modeset commit or sysrq trigger a use-after-free
by dereferencing the freed modeset->fb?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001195847.1411=
92-1-maximpedraza@gmail.com?part=3D3
