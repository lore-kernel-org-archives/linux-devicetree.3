Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB61337AA99
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675203; cv=none; b=Pvehk7V4gTu1U3zokdIEowRV0NViWltZo1sCoGhhXPi1lS6NfZNUSgtUNAqFUBkIyCoviuOR0bMymH5iuofPwEfz/rw2CwaezEef6UK0s2BiZlTow7RS61oscSwf75HYk/j8p+aS2qohnbVO0Y++ybVM/1+k+jXaLLOQFJ7ZTKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675203; c=relaxed/simple;
	bh=DboHiimy+fIyGhJ4Tqt6sUu6u50/QleTL8jeVHS4BBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MXQfQv/oWqa2XElUEggPYg47pm7tN3Dwn8qWhE4ohmtJ7yU0qaCpI7PLUQKkUkVJLAQv9VTjHFW0tsxErv1MBYLeFxP1zL7kURIQRSw2lPtpame+vAMi0ZXJLF6AyRhczyj/+UU71h6EPtO1/Gd1WK0eJ2ryXasetdodsfTpNtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3XHA0KI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3XHA0KI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB61F000E9;
	Fri, 10 Jul 2026 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783675201;
	bh=Ya6OU+hKpKU8ohmRDR9xrRsYcFj8J27jOWYwPudjSMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P3XHA0KIUgyxfKkcUIMbLvWbwkwdxrXXJRE/vf/JN7Zj4ASVZ3Cj/DaW2Z5x1bY0w
	 4+n32LjPNf/p5yx4cDAGp0Pp90ODp2HQCe01CND2QYvBf7UYazFSGnozh8v/5M/Roh
	 1lMf3kqyym7mV5ydljyDu0Uo3nua1m8d5I1+XM78UEtEfXzHv0s7Edx49tqZQ3e2tS
	 XwWAd4kyMWG1WkgNTSKHjQTN0rHE2kPiwbyBENEmpyjJ76qBF8NCDV2vM1M69gdG8Q
	 NZobwrpEu3Je5plysBCUG6ZKgfHtmtsf+br86+3tM+kTR3bWxXlIvKx2a8V5ogdm4o
	 7KJF0ThNCk/Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/7] media: qcom: camss: Add camss-pipeline helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-camss-isp-ope-v4-1-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-1-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 09:20:00 +0000
Message-Id: <20260710092001.1EDB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Synchronous freeing of pipeline structure causes use-after-free fo=
r embedded V4L2 objects.
- [High] Missing file operations (`vdev.fops` =3D NULL) causes an immediate=
 NULL pointer dereference on device registration.
- [High] Video devices are exposed to userspace before their internal state=
 and media controller links are fully initialized.
- [High] Inverted subdevice cleanup order in teardown exposes freed state t=
o concurrent userspace ioctls.
- [High] Providing NULL subdev operations triggers a kernel BUG_ON, directl=
y violating the API contract.
- [High] If base entity registration fails, the error teardown path mistake=
nly unregisters it, causing a crash.
- [Medium] `v4l2_subdev_init_finalize()` is called after `v4l2_device_regis=
ter_subdev()`, exposing uninitialized state.
- [Medium] Missing validation for `desc->name` causes a crash if NULL, or a=
 silent resource leak if empty.
- [Medium] Link validation silently allows misconfigured one-sided links to=
 be dropped.
--

--- Patch [1]: [PATCH v4 1/7] media: qcom: camss: Add camss-pipeline helper=
 ---
commit 1a345e2180f40422d57cb436157b91e6ed4a268d
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add camss-pipeline helper

Add a declarative MC topology builder for CAMSS offline ISP drivers.
Drivers describe their entire media graph, entities (video devices,
subdevs, or base entities), their pads, and the links between them
in a static descriptor table. The builder validates the table,
allocates and registers all entities, and creates all MC pad links.

> diff --git a/drivers/media/platform/qcom/camss/camss-pipeline.h b/drivers=
/media/platform/qcom/camss/camss-pipeline.h
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-pipeline.h

[ ... ]

> +struct camss_isp_entity_desc {
> +	const char				*name;
> +	u32					obj_type;
> +	u32					function;
> +	const struct camss_isp_pad_desc		*pads;
> +
> +	union {
> +		/* MEDIA_ENTITY_TYPE_VIDEO_DEVICE */
> +		struct {
> +			u32					caps;
> +			void					*drvdata;
> +			const struct v4l2_file_operations	*fops;

[Severity: High]
The documentation for this struct mentions that fops can be NULL to use
kernel defaults, but won't that cause a crash during registration?

If fops is NULL, video_register_device() will directly dereference it to
grab the module owner.

> +			const struct v4l2_ioctl_ops		*ioctl_ops;
> +			const struct media_entity_operations	*entity_ops;
> +		} vdev;
> +		/* MEDIA_ENTITY_TYPE_V4L2_SUBDEV */
> +		struct {
> +			const struct v4l2_subdev_ops		*ops;

[Severity: High]
Similarly, the documentation says ops can be NULL, but won't that trigger a
BUG_ON?

If ops is NULL, v4l2_subdev_init() will immediately hit BUG_ON(!ops).
Should these fields be made mandatory in the documentation?

> +			const struct v4l2_subdev_internal_ops	*internal_ops;
> +			const struct media_entity_operations	*entity_ops;
> +		} subdev;
> +	};
> +};

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss-pipeline.c b/drivers=
/media/platform/qcom/camss/camss-pipeline.c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-pipeline.c

[ ... ]

> +static int isp_pipeline_validate(struct device *dev,
> +				 const struct camss_isp_entity_desc *descs,
> +				 unsigned int num_entities)
> +{
> +	unsigned int i, pi;
> +
> +	for (i =3D 0; i < num_entities; i++) {
> +		const struct camss_isp_pad_desc *pads =3D descs[i].pads;
> +		unsigned int num_pads =3D isp_count_pads(pads);
> +
> +		for (pi =3D 0; pi < num_pads; pi++) {
> +			const struct camss_isp_pad_desc *pad =3D &pads[pi];
> +			const struct camss_isp_pad_desc *peer_pad;

[ ... ]

> +			/* Verify back-reference consistency */
> +			if (peer_pad->peer_entity >=3D 0 &&
> +			    ((unsigned int)peer_pad->peer_entity !=3D i ||
> +			     peer_pad->peer_pad !=3D pi)) {
> +				dev_err(dev, "entity[%u].p%u <-> entity[%d].p%u: mismatch\n",
> +					i, pi, peer_ent, pad->peer_pad);
> +				return -EINVAL;
> +			}

[Severity: Medium]
Does this back-reference check silently accept invalid graph topologies?

If a SINK pad descriptor defines a peer_entity, but the targeted SOURCE pad
defines no link (peer_entity =3D=3D -1), the peer_pad->peer_entity >=3D 0 c=
heck
evaluates to false, bypassing the mismatch validation.

Since links are only created from the SOURCE side later in registration,
will this silently drop the specified SINK link instead of warning the user?

> +		}
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +void camss_isp_pipeline_free(struct camss_isp_pipeline *pipeline)
> +{
> +	kfree(pipeline);
> +}

[Severity: High]
Could freeing the pipeline structure synchronously here cause a use-after-f=
ree
for the embedded V4L2 objects?

Because isp_register_vdev() sets video_device_release_empty as the release
callback, the V4L2 core won't defer the memory release. If a userspace proc=
ess
holds an open file descriptor to the video node when this module is unbound,
could it later access this freed memory?

> +EXPORT_SYMBOL_GPL(camss_isp_pipeline_free);
> +
> +/* -------- Registration -------- */
> +
> +void camss_isp_pipeline_unregister(struct camss_isp_pipeline *pipeline)
> +{
> +	int i;
> +
> +	/* Unregister entities in reverse order */
> +	for (i =3D (int)pipeline->num_entities - 1; i >=3D 0; i--) {
> +		struct camss_isp_pipeline_entity *slot =3D &pipeline->entities[i];
> +
> +		switch (slot->obj_type) {
> +		case MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
> +			if (slot->vdev.name[0])
> +				video_unregister_device(&slot->vdev);
> +			break;
> +		case MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
> +			if (slot->subdev.name[0]) {
> +				v4l2_subdev_cleanup(&slot->subdev);
> +				v4l2_device_unregister_subdev(&slot->subdev);

[Severity: High]
Could this cleanup order expose freed state to concurrent userspace ioctls?

Calling v4l2_subdev_cleanup() frees internal state like sd->active_state.
Because the devnode is not unregistered until v4l2_device_unregister_subdev=
()
runs on the next line, could a concurrent ioctl like VIDIOC_SUBDEV_G_FMT
reach the subdev and access the freed state during driver teardown?

> +			}
> +			break;
> +		case MEDIA_ENTITY_TYPE_BASE:
> +			if (slot->entity.name) {
> +				media_entity_remove_links(&slot->entity);
> +				media_device_unregister_entity(&slot->entity);
> +			}

[Severity: High]
Could this error handling path cause a NULL pointer dereference?

If an entity fails to register, the err_unregister path calls
camss_isp_pipeline_unregister(), which iterates over all slots and checks
if (slot->entity.name) to determine if they need cleanup.

Because isp_register_base_entity() assigns the name before the registration
attempt:

    isp_register_base_entity()
        entity->name =3D desc->name;
        ...
        return media_device_register_entity(...);

The unregister function will call media_device_unregister_entity() on an
entity that failed registration. Will this dereference a zeroed list_head
and cause an oops?

> +			break;
> +		}
> +
> +		kfree(slot->pads);
> +		slot->pads =3D NULL;
> +	}
> +
> +	pipeline->v4l2_dev =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(camss_isp_pipeline_unregister);
> +
> +static int isp_register_vdev(struct camss_isp_pipeline_entity *slot,
> +			     const struct camss_isp_entity_desc *desc,
> +			     struct v4l2_device *v4l2_dev)
> +{
> +	struct video_device *vdev =3D &slot->vdev;
> +	int ret;
> +
> +	strscpy(vdev->name, desc->name, sizeof(vdev->name));

[Severity: Medium]
What happens if desc->name is NULL or an empty string?

If desc->name is NULL, strscpy() will crash. If it is an empty string,
vdev->name[0] will be '\0'. In camss_isp_pipeline_unregister(), the cleanup
path checks if (slot->vdev.name[0]) before unregistering. Will an empty str=
ing
cause the teardown to silently skip the entity and leak the V4L2 structures?

> +	vdev->vfl_dir     =3D isp_caps_to_vfl_dir(desc->vdev.caps);
> +	vdev->v4l2_dev    =3D v4l2_dev;
> +	vdev->device_caps =3D desc->vdev.caps | V4L2_CAP_IO_MC;
> +	vdev->release     =3D video_device_release_empty;
> +	if (desc->vdev.fops)
> +		vdev->fops =3D desc->vdev.fops;

[ ... ]

> +	ret =3D media_entity_pads_init(&vdev->entity, slot->num_pads, slot->pad=
s);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret)
> +		return ret;
> +
> +	video_set_drvdata(vdev, desc->vdev.drvdata);

[Severity: High]
Is there a race condition exposing this video device to userspace too early?

video_register_device() makes the /dev/videoX node visible immediately.
Could userspace open it and encounter uninitialized driver data before
video_set_drvdata() runs?

Additionally, could userspace interact with an incomplete topology before t=
he
media links are created later in camss_isp_pipeline_register()?

> +
> +	return 0;
> +}
> +
> +static int isp_register_subdev(struct camss_isp_pipeline_entity *slot,
> +			       const struct camss_isp_entity_desc *desc,
> +			       struct v4l2_device *v4l2_dev)
> +{
> +	struct v4l2_subdev *sd =3D &slot->subdev;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, desc->subdev.ops);
> +	strscpy(sd->name, desc->name, sizeof(sd->name));

[ ... ]

> +	ret =3D media_entity_pads_init(&sd->entity, slot->num_pads, slot->pads);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D v4l2_device_register_subdev(v4l2_dev, sd);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D v4l2_subdev_init_finalize(sd);

[Severity: Medium]
Is it safe to call v4l2_subdev_init_finalize() after the subdevice has
already been registered?

Since v4l2_device_register_subdev() makes the subdevice visible via the
media controller, could concurrent in-kernel accesses or ioctls racing with
the initialization dereference uninitialized state?

> +	if (ret) {
> +		v4l2_device_unregister_subdev(sd);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-camss-isp-=
ope-v4-0-51207a0319d8@oss.qualcomm.com?part=3D1
