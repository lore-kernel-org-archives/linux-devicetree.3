Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793191575;
	b=1xYFA5D8Uav2x1fx3vLY1n5Qlb7zewe9g0m539yJbXnwfcb8upif551tWEoCVbAfVbCt
	 Vjjy0FsAFn8YucxTmKRU+J//gyHvCYK34ngJmNVpHo8kav4Hd9TzmiL+AhsmsPi7EMuif
	 TAzVEXMPhXEUdK8oTbArL+zmljPisTuUpy1GRK0rZyNR0B7co64RM8K0BPIGDxqmC2xU1
	 sg/ulmKeaEUrFPsZY6psp9l/qh2cEscJ1RjjcHg7J/kIMpEfhKsCCS8m5v252qUTBUkM2
	 doAacAGYfrLPm6Xh7G+6WPqYfmGzOVEZzfkw/oWaH7NR18jsvSyl2x7dmTD4xXVcj9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Pr+Qh9RwQ2EtytMAMXYpVvXWO/lPy5jLS4bDF48/ePg=;
	b=1zotcCA+iAv1QL1zdsemTsvrQf25DTwJFM/odQGP9iV13AP8Q4S5we51FOlqFP/gV3WR
	 Sy6IIz4zgS5MwFzqNqo4yiE4rEZaQEaNpcSfYj073s9btbYuLRBFOu3+Q4iC1Xp/U55PO
	 lPfAhcme+3e/54Bj5AmyD1u0Gy8lF3mHtneWcAJeG9NDvT7Rx8liANTaKzpyhGrC5Fu9o
	 kTZ01mEzi0KlLVrhRZ7AGx7e7AO9UboQ6sfqEJgEHiwL9g/0VtIydIW1+9AceUEkCbQQO
	 3gCMq/fn4GS4+4mVBU24Q8cJI95ZJ/Uk9UY+GR48d64z8Qhc7vxq/M1WK2T/bVGyvZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC75606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC75606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so1766185eec.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793191574; cv=none;
        d=google.com; s=arc-20260327;
        b=Skzsu0z5LLy8mTARYIOyxVzBYIgdI3cpS2yNHE5o6SkNk64/fH7IGL12o8EIT+ZG7x
         fpQ2kHOTGXzEWBcEhZC57nz6sDCfzLgB8Cy4idWH3H4iTbwWlXpvxMZIEQ8UF6xZw1sD
         SJFNEz2KYOt1k8fOAcE/aP7wTI59krfUfCgpWbHcH94A9DePSQgYKqSqJb5rAgYakBtV
         dRGf/vy1+j5JKzU44+R02Fl6Th2Syu5X/9VoSvRXWWDmLPL2cFoLYw2pbZC4jFcxzR0Z
         6M2ZNDDAoavppVZ7Dsb48/zYcGR/m/KPJZ9MmX/o2Gz6rPjVzyIZxYCm43EP3Jw/729t
         kXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pr+Qh9RwQ2EtytMAMXYpVvXWO/lPy5jLS4bDF48/ePg=;
        fh=wo5cyauCgkullpj+HfchJeWs3jJccKmUgib8BMVMvZM=;
        b=FFP55pL3i2THTiPOc3DbpwcBMVv+NwABURPugc7fpD7SZIhgfArF6GOpVJb+WxPGnG
         VuoCijgei5+EFZJhC8PQxWTtqQKmrATQClxmCwGSsvDQkkP10ViJHOeli5Aa8wyQpHIf
         QByolegBem9bhVQduNrdQIDvnbPVxZhg+Mgg1NUPQIreGsmW1lQKV7AcZN2XpfGORcsE
         tiyLyDQbWHWc7CrZrayQ9wP7a/Ozkx1TrH51bNgZbQu3i974VOjKt7qXr0FhfbKIH2sd
         ufilrm5518MDlQBBLIvclFvuLGsv3hZKV7igH8adENrGMul6toNi8xUVMQvPeWOeR/HE
         3WXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191574; x=1793796374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pr+Qh9RwQ2EtytMAMXYpVvXWO/lPy5jLS4bDF48/ePg=;
        b=NvCNg+hEj1GXa1PRFxoLoNiYzUhef+0uHJboLonS+/zNc5dMN5k3f0Zt2Ahy1xFZwr
         QyFN58dy11p85F771z5tTe/di7qPb6PsxdHZboYrwY3cnDtsg4np9V5pRH/h3zqrre7U
         xYNzsZt63dNqTMIXUaC8ikrrQlsbtdurOkZ+HcgLJa7pXvt8QOKF8wTuVJo9HiaWHuf1
         YmpbxIzayqGQGF0iu4Zwi0JsFMj+JqD743iNYPBvbRe9MKcgQ8ynKsnE23ViRdZTGmnJ
         6OsY/QM9izfyU5t5p5O9jflxl0fR8qlEcWVWAQQvPDHu5tyoU5pU/+D91HJ+EJXuhRvM
         +uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191574; x=1793796374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr+Qh9RwQ2EtytMAMXYpVvXWO/lPy5jLS4bDF48/ePg=;
        b=LvnPhgAdqX0fetCOB54a8GM3yHhS2EpNbjkWk9hQy4E5i5bUhJPGiD5qtHn2AzCQKE
         JlS4lsecx963MRI3W/UVT1oEceVv0zxBvrQ9Ho0IiGrvGRjJGspUo2iB7TCe+VvqJ81R
         OBcO0YIeIzlytwgns40iu17I9p6zPAJJGWbZM3ARenIhBfeJVprjTzo150dXHNiHFFlN
         R5VwMiTt2pMrfM1iq5VE5LAEhoZ7WN5UcJBR4uM++PrguYtAdBvBbwuci8/OpfGcDJBE
         p71HnS3tAZWNVrJTmH22MVgOECMEnTL3YAUfONZStL1tLcz8Qdg3fyowDrVOS/rSwFKd
         b5kA==
X-Gm-Message-State: AFq9FYLko/elnsof/1LOWgpkcApUEg6/l+VhuhIOl5YppOKsgpd+NO6t
	qZylRl2c/zm5Xe9ycf7fr9Y+33idPPCjkFydQvEaVK2mhsAtSmFWS22ONkfaBXYxnlRVCn+7KTI
	H3AXtxUa8LhE3n3pU/KJSrC8BJN3JBiY=
X-Gm-Gg: AYBFou16Jby4DPmsyCInerF92mFlfzi2hyG4krkp3SIx8AVCBr2Zeg+hKfWK7XYgReq
	r7v3DJFss0soiUgVGdQw1wBZ0beTZaZ6TlCu/wAf3qQ/Dxrt/9fY8bD8DbjjIuJn8ZkzQGaxfTV
	UAK1bGrfRD1unLYWc7TYabWpwKwL4q/zvWcsMEQGjXfotbLJZ34HkhKlSyVnY6SYkj35j5NIPYt
	vVM3N8DFRz6B7/4u6smipXC8E9hknwWMp4KCErADuSsSs9/Bv35weHwSp1OePJNc1fYvatIW3CW
	5XrXFalosnwc3XNUjTUt5AEhjd0FUyMWTKM2SjYlNNCGZ14DfGIdW8n1v+jNLB1oLC7cIySabnc
	XhMaACfm/8BxAThy97Qy+zkghBUFkCyW2lKNcYQjPtK6a6UPdj44iiehG7hYsGzuLpja4IQ==
X-Received: by 2002:a05:693c:83c3:20b0:369:f182:8e99 with SMTP id
 5a478bee46e88-36a20114838mr3697076eec.35.1793191573518; Wed, 28 Oct 2026
 05:46:13 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <0g7damfVTZ2r6s4H0kv6Lg@nvidia.com>
 <CAPVz0n1G0cDuUj7WRfj9YRgvMSd0sqSCjnir2p=QxUGu5BWTXQ@mail.gmail.com> <gXWEBbhSRWKBIHUcDXZu7w@nvidia.com>
In-Reply-To: <gXWEBbhSRWKBIHUcDXZu7w@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 28 Oct 2026 14:46:01 +0200
X-Gm-Features: AclHuK_z6xlcnPRnX5tVTskqs4cNcLBGx7AePFeqnVIxnyi6sGqea_4KfJ43bfE
Message-ID: <CAPVz0n3PeDm3X+hwP_yMhZPk22-gRL0+vFRj5J7QsyUhcAahtw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 28 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:3=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, October 25, 2026 5:51=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
03:46 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Friday, October 23, 2026 11:14=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 11:26 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =
=D0=BE 10:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > >
> > > > ...
> > > > > > > +MODULE_ALIAS("platform:tegra-dbi");
> > > > > > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > > > > > +MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver=
");
> > > > > > > +MODULE_LICENSE("GPL");
> > > > > >
> > > > > > No separate platform driver or device. If a separate struct dev=
ice is
> > > > > > needed for some technical purpose, we need to create a minimal =
separate
> > > > > > virtual device, but unless there is a strong reason to have tha=
t we
> > > > > > should be fine with just the dc device.
> > > > > >
> > > > > > Thank you
> > > > > > Mikko
> > > > > >
> > > > >
> > > > > ATM, I use bridge framework to describe interface and I am attach=
ing
> > > > > it to RGB since it basically uses RGB to transfer video data. It =
works
> > > > > pretty nice so far.
> > > > >
> > > > > You propose to replicate how RGB works just for DBI?
> > > > >
> > > >
> > > > One of the reasons I used separate pdev was to be able get mipi_dbi
> > > > from it using dev_get_drvdata() from patent (dbi bridge in this cas=
e).
> > > > DBI framework seems to not have a way to pass it in any other way,
> > > > unless you know smth I don't.
> > >
> > > Right, I think using a bridge is fine; passing the mipi_dbi interface=
 is
> > > properly done in other ways. The direct parent devdata link is a bit =
of
> > > a "poor man's bus", and sometimes it breaks down, such as here.
> > >
> > > MIPI DBI is comparable to MIPI DSI -- both have a hardware channel th=
at
> > > sends both pixel data and commands. I think we should follow DSI's
> > > example and have a DBI bus and devices while keeping it as simple as
> > > possible.
> > >
> > > The DC driver would register a DBI host and the panel would bind as a
> > > DBI device. The DC driver can then supply the mipi_dbi object in a fi=
eld
> > > of the mipi_dbi_device.
> > >
> > > This is a bit more complicated than a parent devdata pointer but much
> > > cleaner, and follows the existing DSI pattern.
> > >
> >
> > I understand your intentions, but ATM kernel lacks any DBI type B
> > framework. No hosts, ho devices, noting granular. Implementing
> > everything just not worth my time to support 2 panels of device based
> > on Tegra 20. And I am talking not about time to actually implement
> > this in the code, but to upstream. DSI framework is huge, copying even
> > part of it to wrap legacy DBI interface and ustreaming it does not
> > worth hassle. And yes, I am a poor man, I use a parent devdata bus.
>
> I sketched out the bus implementation and I really don't think it's that
> complicated -- about 200 lines in total. See below. If there turn out to
> be issues we can put an equivalent into drm/tegra/.
>
> -- drm_mipi_dbi_bus.c
>
> /* MIPI DBI devices with command transport through parallel interface */
>
> #include <linux/err.h>
> #include <linux/init.h>
> #include <linux/of.h>
> #include <linux/of_device.h>
> #include <linux/slab.h>
>
> #include <drm/drm_mipi_dbi.h>
> #include <drm/drm_mipi_dbi_bus.h>
>
> static int mipi_dbi_match(struct device *dev, const struct device_driver =
*driver)
> {
>         return of_driver_match_device(dev, driver);
> }
>
> static int mipi_dbi_uevent(const struct device *dev, struct kobj_uevent_e=
nv *env)
> {
>         return of_device_uevent_modalias(dev, env);
> }
>
> static const struct bus_type mipi_dbi_bus_type =3D {
>         .name =3D "mipi-dbi",
>         .match =3D mipi_dbi_match,
>         .uevent =3D mipi_dbi_uevent,
> };
>
> static void mipi_dbi_device_release(struct device *dev)
> {
>         of_node_put(dev->of_node);
>         kfree(to_mipi_dbi_device(dev));
> }
>
> static void mipi_dbi_device_unregister(void *data)
> {
>         struct device *dev =3D data;
>
>         of_node_clear_flag(dev->of_node, OF_POPULATED);
>         device_unregister(dev);
> }
>
> /* called by dbi host driver to create panel device */
> struct mipi_dbi_device *
> devm_mipi_dbi_device_register(struct mipi_dbi_host *host, struct device_n=
ode *np)
> {
>         struct mipi_dbi_device *dbidev;
>         int ret;
>
>         if (!host || !host->dev || !host->dbi || !host->dbi->command ||
>             !host->ops || !host->ops->attach || !host->ops->detach || !np=
)
>                 return ERR_PTR(-EINVAL);
>
>         if (!of_device_is_available(np))
>                 return ERR_PTR(-ENODEV);
>
>         dbidev =3D kzalloc_obj(*dbidev);
>         if (!dbidev)
>                 return ERR_PTR(-ENOMEM);
>
>         if (of_node_test_and_set_flag(np, OF_POPULATED)) {
>                 kfree(dbidev);
>                 return ERR_PTR(-EBUSY);
>         }
>
>         dbidev->host =3D host;
>         dbidev->dbi =3D host->dbi;
>         device_initialize(&dbidev->dev);
>         dbidev->dev.parent =3D host->dev;
>         dbidev->dev.bus =3D &mipi_dbi_bus_type;
>         dbidev->dev.release =3D mipi_dbi_device_release;
>         device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np)));
>
>         ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->dev), =
np->full_name);
>         if (ret)
>                 goto put_device;
>
>         ret =3D device_add(&dbidev->dev);
>         if (ret)
>                 goto put_device;
>
>         ret =3D devm_add_action_or_reset(host->dev, mipi_dbi_device_unreg=
ister,
>                                        &dbidev->dev);
>         if (ret)
>                 return ERR_PTR(ret);
>
>         return dbidev;
>
> put_device:
>         of_node_clear_flag(np, OF_POPULATED);
>         put_device(&dbidev->dev);
>         return ERR_PTR(ret);
> }
> EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
>
> static void mipi_dbi_detach(void *data)
> {
>         struct mipi_dbi_device *dev =3D data;
>
>         dev->host->ops->detach(dev->host, dev);
>         dev->attached =3D false;
> }
>
> /* called by panel on probe completion to attach to dbi host */
> int devm_mipi_dbi_attach(struct mipi_dbi_device *dev)
> {
>         int ret;
>
>         if (dev->attached)
>                 return -EBUSY;
>
>         ret =3D dev->host->ops->attach(dev->host, dev);
>         if (ret)
>                 return ret;
>
>         dev->attached =3D true;
>         return devm_add_action_or_reset(&dev->dev, mipi_dbi_detach, dev);
> }
> EXPORT_SYMBOL_GPL(devm_mipi_dbi_attach);
>
> int __mipi_dbi_driver_register(struct device_driver *driver, struct modul=
e *owner)
> {
>         driver->owner =3D owner;
>         driver->bus =3D &mipi_dbi_bus_type;
>
>         return driver_register(driver);
> }
> EXPORT_SYMBOL_GPL(__mipi_dbi_driver_register);
>
> void mipi_dbi_driver_unregister(struct device_driver *driver)
> {
>         driver_unregister(driver);
> }
> EXPORT_SYMBOL_GPL(mipi_dbi_driver_unregister);
>
> static int __init mipi_dbi_bus_init(void)
> {
>         return bus_register(&mipi_dbi_bus_type);
> }
> subsys_initcall(mipi_dbi_bus_init);
>
> static void __exit mipi_dbi_bus_exit(void)
> {
>         bus_unregister(&mipi_dbi_bus_type);
> }
> module_exit(mipi_dbi_bus_exit);
>
> -- drm_mipi_dbi_bus.h
>
> #ifndef __DRM_MIPI_DBI_BUS_H__
> #define __DRM_MIPI_DBI_BUS_H__
>
> #include <linux/device.h>
> #include <linux/module.h>
>
> struct device_node;
> struct mipi_dbi;
> struct mipi_dbi_device;
> struct mipi_dbi_host;
>
> struct mipi_dbi_host_ops {
>         int (*attach)(struct mipi_dbi_host *host, struct mipi_dbi_device =
*dev);
>         void (*detach)(struct mipi_dbi_host *host, struct mipi_dbi_device=
 *dev);
> };
>
> struct mipi_dbi_host {
>         struct device *dev;
>         struct mipi_dbi *dbi;
>         const struct mipi_dbi_host_ops *ops;
> };
>
> struct mipi_dbi_device {
>         struct device dev;
>         struct mipi_dbi *dbi;
>         struct mipi_dbi_host *host;
>         bool attached;
> };
>
> static inline struct mipi_dbi_device *to_mipi_dbi_device(struct device *d=
ev)
> {
>         return container_of(dev, struct mipi_dbi_device, dev);
> }
>
> struct mipi_dbi_device *
> devm_mipi_dbi_device_register(struct mipi_dbi_host *host, struct device_n=
ode *np);
> int devm_mipi_dbi_attach(struct mipi_dbi_device *dev);
>
> int __mipi_dbi_driver_register(struct device_driver *driver, struct modul=
e *owner);
> void mipi_dbi_driver_unregister(struct device_driver *driver);
>
> #define mipi_dbi_driver_register(driver) \
>         __mipi_dbi_driver_register(driver, THIS_MODULE)
>
> #define module_mipi_dbi_driver(driver) \
>         module_driver(driver, mipi_dbi_driver_register, mipi_dbi_driver_u=
nregister)
>
> #endif
>

Looks promising. I will give it a try.
