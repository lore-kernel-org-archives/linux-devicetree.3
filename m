Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30C4028E8
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736249; cv=none; b=TySesmADAxDvw0CVd/UqXtTz0FQqTFFb9JvpyaDIa3XqP6+mqlkx3WkdQ2EASLUjMNIqGvcg/b6gKaWuACi6zL6wjLgGY1M5dNt++HZqeQeS9mNEaHpEZZ1hFopRsQv/yLilGvrA643WHOOve9IV68ZxSoCslegL3Mt9eDKGM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736249; c=relaxed/simple;
	bh=vvoMUrhB2Dj2N96mVX1nRauZI34ueEVl2v6xJ5km2QE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d/beJf2pxKMBkKh8UDko9z9NGzKwFQHlvFtv8QfARDRqg41Nnr27Y74EzxeIsVWol9fD8nMC49vTV8b4s8uqDlHkUyXVN1YLYePx0B78KyETflnJ3nLi3qCU5k32ZKfteY0dWive6Vx9eA3uoLyvg/RgiRJ03d5fEovGcA1ZUEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MECYJnE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MECYJnE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCA91F000E9;
	Mon, 29 Jun 2026 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782736247;
	bh=Zyox5SSv1DXb7rJMlycwShkV0vzIA2Z+JVfFatNugPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MECYJnE+WOVaSevLLPzSqJ/FHYu92vkNTvE+PCGItGblbnkfNJzgk+snnIv7lsBOq
	 lMYysWFdgu90Z1ViEa7pQbi1oHy+5cmeavVwmlmA5nTGaIioVsI5sNPnIIoRB9exE9
	 dL/4Dapr91vTTBmH9UdUicKt/28lrd+cILf96zAmIFg98j5DJKdTOBOqXVnU5QleY/
	 D7xpMtnsd5aLww5Oo4LAD4iHeldKcvxJ+4AJXGcEpICVqAMkVnwPljWrmlnVBpeKHn
	 gIx1q6DH4rQCdIIusvRkstSMCNfz08Uv2DTVuKL6Y+k7LF7RdjV2kYCE2Xv137xBha
	 J4Xx/nY0yXTwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] media: qcom: camss: populate child platform
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629121750.3469292-2-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 12:30:46 +0000
Message-Id: <20260629123047.0FCA91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing use-after-free vulnerability due to mixing `devm_kzal=
loc` with asynchronous V4L2 video device lifecycle.
--

commit 9fa1d355926fe655802b3d013baabb22bd939e3e
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

media: qcom: camss: populate child platform devices

Call of_platform_populate() at the end of camss_probe() so that child
nodes of the CAMSS DT node are registered as platform devices and
probed via their own platform_driver.

Call of_platform_depopulate() at the start of camss_remove() to tear
down child devices before the parent unwinds its own resources.

Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260326-b4-l=
inux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org/

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..d2ecc79d5269f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -5497,6 +5500,7 @@ static void camss_remove(struct platform_device *pd=
ev)
>  {
>  	struct camss *camss =3D platform_get_drvdata(pdev);
> =20
> +	of_platform_depopulate(&pdev->dev);
>  	v4l2_async_nf_unregister(&camss->notifier);
>  	v4l2_async_nf_cleanup(&camss->notifier);
>  	camss_unregister_entities(camss);

[Severity: High]
This is a pre-existing issue, but does camss_remove() lead to a use-after-f=
ree
if a userspace process holds the V4L2 video node open during unbind?

In camss_probe(), the camss structure and its sub-structures are allocated
using devm_kzalloc() and devm_kcalloc():

camss_probe() {
    ...
    camss =3D devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
    ...
    camss->vfe =3D devm_kcalloc(dev, camss->res->vfe_num,
                              sizeof(*camss->vfe), GFP_KERNEL);
    ...
}

If the device is unbound while the video device is kept open by userspace,
camss_remove() checks atomic_read(&camss->ref_count). If the count is great=
er
than zero, it skips camss_delete() but still returns. The driver core then
automatically frees the devres-managed memory for the camss structure.

Later, when userspace closes the file descriptor, the V4L2 core invokes the
deferred msm_video_release() callback:

drivers/media/platform/qcom/camss/camss-video.c:msm_video_release() {
    struct camss_video *video =3D video_get_drvdata(vdev);

    media_entity_cleanup(&vdev->entity);

    mutex_destroy(&video->q_lock);
    mutex_destroy(&video->lock);

    if (atomic_dec_and_test(&video->camss->ref_count))
        camss_delete(video->camss);
}

Will this asynchronous callback access the already-freed video and
video->camss structures when trying to destroy the mutexes and decrement
the reference count?

Is it safe to use devm allocators for structures embedding V4L2 video devic=
es,
or should their lifetimes be strictly tied to the V4L2 release callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629121750.3469=
292-1-atanas.filipov@oss.qualcomm.com?part=3D1
