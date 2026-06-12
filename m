Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D1395ADC
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246720; cv=none; b=Pdz5wIVHwWhVW/JbCFF05yiQgOsYN4ViVsctIYCj4ss4nfhEPLf19JrLwdi9odXMCDdi/ietAvETVL73oz867U+OeMPEjuDm9F9kD2AIdOToxOopP8K0RMOWRUxbGEfGcWssgt1fQXpD8EmG6TdsRrMtUnUkHG1OCzuohllQC/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246720; c=relaxed/simple;
	bh=aHmJFdNwRdkqK4xfeyuVcRtUivGMFo5h5x/Bt+hRnhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a3edqG8rsqF2EZem4ffYvB/dhRA8Dk1Tt+DCrueP5FD/aInvVc39vZUAvPhcTja+UKh0m/o01obY2sayaRSZILS2Zp+tojNuNGDPCs+ggLVVaIrm1s1qvnxurRFiiaKQEh7+KsoQ0kXLd7JlwsizZljbz9jEyRupH3XfEqf0fdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvsEKtxw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvsEKtxw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DBE1F000E9;
	Fri, 12 Jun 2026 06:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781246719;
	bh=+5IpYshApii4IKiGZyWZ+dz3SHGPGdPyQdxJvvkBw0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IvsEKtxwmYHcH5fF6WtIO3D9noEUvd7vPkM4Cp5Y9X6da4Lp0Jocb+qDd9fQ3IxIe
	 5TqCqYohvOH01H35QCEtCsTJmHr6NqTopyBVempxnsLO5Z3LCCc/sS7CouV1mwhwGX
	 MF5yVL4+wHu8fNbcFQPuEX9tRLagQqVR/yp2BpaRj7soWj9NsPQgCM8ucx/MkYbKLd
	 ZZh8HCAGrYENnJKFgiT/v2KhNMzcXLeKkV61csRjRM9Q8EZ/WRk3W8hvibJk7p2Xdz
	 EJR5JuQpGnnucSApFV4Vu9ucO1miyPz+1sZFN6xccJeloYnTJUnSU5dQPba0tXdht6
	 k6XyCllVVgZlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] gpu: host1x: Correctly parse linear ranges of
 context devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-t264-host1x-v1-3-8d934987de67@nvidia.com>
References: <20260612-t264-host1x-v1-3-8d934987de67@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 06:45:18 +0000
Message-Id: <20260612064519.20DBE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver synchronously frees the dynamically allocated `cdl->dev=
s` array immediately after calling `device_unregister()`, while using an em=
pty `.release()` callback. This violates the Linux device model and leads t=
o a Use-After-Free.
--

commit 46b291569da04e8306d82ff644615dfc60ee956f
Author: Mikko Perttunen <mperttunen@nvidia.com>

gpu: host1x: Correctly parse linear ranges of context devices

The commit updates the parsing of the iommu-map property to support
linear ranges of context devices instead of assuming each device has
a one-length entry.

> diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
> --- a/drivers/gpu/host1x/context.c
> +++ b/drivers/gpu/host1x/context.c
[ ... ]
> @@ -34,7 +34,16 @@ int host1x_memory_context_list_init(struct host1x *hos=
t1x)
>  	if (err < 0)
>  		return 0;
> =20
> -	cdl->len =3D err / 4;
> +	devs =3D 0;
> +
> +	for (i =3D 0; i < err / 4; i++) {
> +		u32 length;
> +
> +		of_property_read_u32_index(node, "iommu-map", i * 4 + 3, &length);
> +		devs +=3D length;
> +	}
> +
> +	cdl->len =3D devs;
>  	cdl->devs =3D kzalloc_objs(*cdl->devs, cdl->len);

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing
issue with how the cdl->devs array is managed during cleanup.

In host1x_memory_context_list_init(), if an error occurs later in the
initialization, the unreg_devices error path unregisters the devices and
immediately frees the array:

host1x_memory_context_list_init() {
    ...
unreg_devices:
    while (i--)
        device_unregister(&cdl->devs[i].dev);
       =20
    kfree(cdl->devs);
    ...
}

The same pattern appears in host1x_memory_context_list_free() during
normal teardown.

The driver also provides a dummy release callback:

static void host1x_memory_context_release(struct device *dev)
{
    /* context device is freed in host1x_memory_context_list_free() */
}

Could this lead to a use-after-free? When device_unregister() is called,
it drops the initial device reference, but sysfs or userspace might still
hold elevated references to the embedded kobjects.

Since kfree(cdl->devs) is called synchronously while references could
still exist, would userspace interaction with the sysfs attributes for
these devices during teardown end up accessing freed memory?

>  	if (!cdl->devs)
>  		return -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-t264-host1=
x-v1-0-8d934987de67@nvidia.com?part=3D3
