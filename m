Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D14252A7
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605558; cv=none; b=RKZzwcWf4LmjbMfoUyTWJAlCt5dQU6hKvTP83qkAEheEv2i1C91OtaP0mBBnrX5qra4cFVqoY9xJOqs+WAy8RlCtPzRQFA6VfMkBfLIh42h4Q6mQ95+G9aK2t949uuU36ZMrm3QYP6XTD0SKBH0SpONNn4WbhEKxBrBMYYOuemI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605558; c=relaxed/simple;
	bh=vNeUOF+rMpNDYclUpAAIfvGZIqj26dEN/PMb5akAJrc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cXKgbFKcCZEfFtp8u44hOumCwdSK72HhDxMKvuu2t492vRHHN7kAkZAHX3vdXcl2G1NZl61U66S9EEIN1s/+Y0/1/0gFDgx138gc5+SnMPLl1kuhpowX891pt8zMzu2ZeTDBsy6F107+pYZjhXY+DcrkBWN5g/6LppSspZhAipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAcrR2vh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAcrR2vh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FF41F00A3D;
	Thu,  9 Jul 2026 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605556;
	bh=yzKaDOxPlvmguQtLCE6MoVtpsA5Kh3NlID5p451Sico=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BAcrR2vh1J2qCgJ16NqVlE1fvGiVjXr+LW8mbgivsgMxSOO86ShOcMbOfFtsuOn3o
	 3MpMOwkwMBYTGrwj357hMRh31NqXFI8hc+6X+jiNWChExT+sVzg2ajYIOFqkUjAdhm
	 PwNxRW4yJ/ToHpZ5UA9UZ9hXQOz381DsTZonzGVeGhOsUkVxgHFTozGk4//QSnjYUn
	 4C2Or93zdYEmY7TDPaHDQX7oU+FM8JwV8WqaYNNLU1RDBTmUs+153YngfidifXs4zG
	 b45LKsxwLBDRsD3nUivvH9muwqUBgRLcJBQm0cM9T+bKKrQm9ZdUGupVzf0ZOkJlco
	 RvexRHRMtiUQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/18] media: iris: Add platform flag for
 instantaneous bandwidth voting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-9-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-9-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 13:59:16 +0000
Message-Id: <20260709135916.99FF41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but the `iris_co=
re` structure is allocated with `devm_kzalloc`, leading to a Use-After-Free=
 during device unbind because the video device and delayed work outlive the=
 device-managed allocation.
--

--- Patch [9]: [PATCH v7 09/18] media: iris: Add platform flag for instanta=
neous bandwidth voting ---
commit 5567f5c1da418821cf2cb0c55e4585a7cba76a62
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add platform flag for instantaneous bandwidth voting

This commit introduces a platform-configurable instantaneous bandwidth (IB)
multiplier and enables IB voting for all SoCs. It prepares for AR50LT core
support, which requires explicit IB voting in addition to average bandwidth
(AB) for interconnect QoS. Existing platforms will default to an equal IB
and AB, whereas AR50LT will require 2x peak bandwidth.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..caeaf199cef74 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -18,6 +18,7 @@
> =20
>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
>  {
> +	u32 icc_ib_multiplier =3D core->iris_platform_data->icc_ib_multiplier;
>  	unsigned long bw_kbps =3D 0, bw_prev =3D 0;
>  	const struct icc_info *icc_tbl;
>  	int ret =3D 0, i;

[Severity: Critical]
This is a pre-existing issue, but the iris_core structure is allocated with
devm_kzalloc, which can lead to a use-after-free regression during device
unbind. The video device and delayed work appear to outlive the
device-managed allocation.

In drivers/media/platform/qcom/iris/iris_probe.c:iris_probe():

    core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);

The unbind path fails to explicitly cancel the delayed work and exits,
triggering devm to free the core structure while V4L2 file descriptors may
still be open:

drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
        struct iris_core *core;
       =20
        core =3D platform_get_drvdata(pdev);
        if (!core)
            return;
           =20
        iris_core_deinit(core);
       =20
        video_unregister_device(core->vdev_dec);
        video_unregister_device(core->vdev_enc);
       =20
        v4l2_device_unregister(&core->v4l2_dev);
       =20
        mutex_destroy(&core->lock);
}

When a lingering file descriptor is eventually closed, iris_close() invokes
iris_remove_session(), which dereferences the freed core structure and its
destroyed lock:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_remove_session() {
    struct iris_core *core =3D inst->core;
   =20
    mutex_lock(&core->lock);
    ...
}

Can this corrupt memory if the driver is unbound while the video node is in
use, or while the error handling delayed work is active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D9
