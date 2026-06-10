Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C592376463
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073635; cv=none; b=hXXCgPmHoCfNkG1iUGWHuEOx7CPl5a/NeDF3FR5fhVm573tIPx/9IMeB/N7CbSUJbNGYUmgX2qpPwELIoSRf2lFHhUdPETzHz33Y/GWFKi8Mu6vqYiaQFk9Aj8HVOKCQHdmxjI2jGcP99m1ksyx59J0W9Qj9RbnkROE9RwBf+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073635; c=relaxed/simple;
	bh=OHZRMsjBtW5Rq4f3eKz3RDhvMlylWSDHiK4pj17azgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OOrq92TfWlW+5bdJ7deC3Ho6YGmZKi+ysDZTZCyAKme+Qa1ZHewY6GNpoMabfKURjPWmQg9zYt2WxXSvOzyV5iUzpDCTQ4b8Ospqg4XP9LIzqlvqMV2kXQGfVopJ3D+dwL6hRS71EeF8oA8u1zycIrWux4dsCSriQa8uNLnxdSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xrurtmpt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xrurtmpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA401F00893;
	Wed, 10 Jun 2026 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781073634;
	bh=Dpytz5hF+55xUgOwpjgSwFmBuPHKcJHpAydED+UhC34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XrurtmptejV58RnbT442pgMJBEkH2FBi9+APra0Au0JVEFeCGTRBGcpdPBXJZDnFe
	 nEH+TgTdkvGHPJY6B8q+FRboY0QVvk9/muYc5jGQODrVuqFtuhE/L+eMyV2PI9sOVp
	 LB0GD7kRnrX0nSjvY4060ozGK+4qyyxVN/KZCw7P2X4A7uX9hHzTbAPQIBJIl0P1F8
	 QX1pwOA621LlyAK+tjr0MYiBF+Nh39M6j5ZooiyBbRsljyk2in6pJSmv08J5KFxb03
	 gjynmWwF5RqCsINUR5yPY8RHN/gd3IQQVr6LdbMp3K1j1I0EG9LV0KR+6IFepLk2u8
	 uHuI/MO4ZYU6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/12] media: iris: Add context bank hooks for
 platform specific initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610-glymur-v8-4-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-4-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 06:40:33 +0000
Message-Id: <20260610064034.0DA401F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Timeout during core initialization causes a permanent resource lea=
k of DMA queues and context bank devices upon subsequent initialization att=
empts.
- [High] Premature state transition to `IRIS_CORE_INIT` allows concurrent t=
hreads to operate on an uninitialized core.
- [High] Unprotected modification of shared hardware state leads to data ra=
ces.
--

commit f9ddd8e9794631e591729427a306735897ceefd1
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add context bank hooks for platform specific initialization

This commit adds context bank initialization and deinitialization hooks
for the Iris VPU operations. This is necessary for platforms like glymur
that require dedicated firmware context bank devices where Linux manually
manages the firmware IOMMU mapping.

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index 52bf56e517f91..89dbe9bbf6b0a 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
[ ... ]
> @@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
> =20
>  	core->state =3D IRIS_CORE_INIT;

[Severity: High]
This is a pre-existing issue, but does setting the state to IRIS_CORE_INIT
before the hardware initialization completes allow concurrent threads to
operate on an uninitialized core?

After starting the boot process, the function drops core->lock to wait for a
completion signal in iris_wait_for_system_response(). If another thread
calls open() and thus iris_core_init() concurrently during this wait, it
will acquire the lock, see core->state =3D=3D IRIS_CORE_INIT, immediately
return 0, and proceed to interact with the device before the VPU hardware
has finished booting.

> -	ret =3D iris_hfi_queues_init(core);
> +	ret =3D iris_init_cb_devs(core);
>  	if (ret)
>  		goto error;
[ ... ]
> @@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
>  	iris_vpu_power_off(core);
>  error_queue_deinit:
>  	iris_hfi_queues_deinit(core);
> +error_deinit_cb_devs:
> +	iris_deinit_cb_devs(core);
>  error:
>  	core->state =3D IRIS_CORE_DEINIT;

[Severity: High]
This isn't a bug introduced by this patch, but does the handling of the err=
or
state here cause a resource leak?

When iris_wait_for_system_response() times out, it returns -ETIMEDOUT but
leaves resources unfreed since it executes after the cleanup jump labels in
iris_core_init().=20

On a subsequent open() call, iris_core_init() sees
core->state =3D=3D IRIS_CORE_ERROR and jumps to this label, transitioning
the state to IRIS_CORE_DEINIT without performing teardown. A third open() w=
ill
then allocate resources again, leaking previously mapped DMA buffers and
potentially unbalancing power votes.

>  exit:

[Severity: High]
This is a pre-existing issue, but does iris_wait_for_system_response() modi=
fy
core->state locklessly and introduce a data race?

In iris_core_init(), the core->lock is dropped just before returning
iris_wait_for_system_response(). On a timeout, iris_wait_for_system_respons=
e()
writes to core->state:

drivers/media/platform/qcom/iris/iris_core.c:iris_wait_for_system_response(=
) {
    ...
	if (!ret) {
		core->state =3D IRIS_CORE_ERROR;
		return -ETIMEDOUT;
	}
    ...
}

Because core->state is evaluated and modified in other paths like
iris_core_deinit() under core->lock, modifying it locklessly on a timeout
could lead to inconsistent hardware teardown and potential use-after-free
if a concurrent iris_core_deinit() reads it just before the timeout fires.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-glymur-v8-=
0-1c79b9d51fc0@oss.qualcomm.com?part=3D4
