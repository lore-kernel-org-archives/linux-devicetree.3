Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE869DF59
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 00:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778287269; cv=none; b=Hdh/3FGEiiGMc+gnxldhpv9JVWhqIkjUySNj144s8cD/To20c/ThI1eNk0sXQm2oye6CxIsC2ExsiFtaJivjoNiXN06CNQbC+PIXWnb+wOE0kzlGekghbNj6z+THk2u8UHp2kATwapHSSnhJwC0Dr5eA3O1LLHllnOtLFz5kEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778287269; c=relaxed/simple;
	bh=29WVLVFWi8hJ+ceLLoeezuTv/ayvA94MnkpP9/BcI1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KzG5gsUyhZ0neIWgyP9UNzMdV2s9lRQ1E9B6ljZsyzMOZXkdmd3rKWLLQf8KnMV7xFibbVu40YGCmFcyP2U52O5PViMIfYAOPZka4W2Vx3+kDmaHylseQEIJLgVsdU9uBzHfDZFPHbr8bysJl4XcAjQ1wQhYlS4RIPT3rwYv4Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngJaiNUG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngJaiNUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A59C2BCB0;
	Sat,  9 May 2026 00:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778287269;
	bh=29WVLVFWi8hJ+ceLLoeezuTv/ayvA94MnkpP9/BcI1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ngJaiNUGDlbirXV34zy62iem/0fnAsVqPR6yj7NrLtCzwyYnrzqvi2ajP18lMMCQZ
	 owAGxAkErfE/zoh11EqZzB9udaWDRXqRg6F6BggiCWhATewyQWjce5lX9MmfIDJPzB
	 3Mbu/hf2UjieeJG1YAQaMIQhMfWkHGrUElXU22DOYrZa4GMS7NvNL87AOIS5xrufCh
	 t5DTpJ49RgvQTX4WE2HxecBwAjt6GKjE7BhubCiecSX3VpHYFYi+J/7Pw2pzvdsFQ4
	 RPtsQD8XpKB2Q1nNMgm3Y6O/PKnAqnSo1boAG/+eX3W2gzHM8/a82O8p/bSmVzh4ut
	 RWgYl2sqly6wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/14] media: iris: Add context bank hooks for
 platform specific initialization
Reply-To: sashiko@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509-glymur-v5-6-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-6-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 00:41:08 +0000
Message-Id: <20260509004109.42A59C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Teardown order violation in `iris_remove()` creates a race conditi=
on with userspace, potentially leading to Use-After-Free or IOMMU faults.
--

commit 4def10f3c3b40c622d9f01893a1225d37915f0d3
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add context bank hooks for platform specific initialization

This commit adds initialization and deinitialization hooks in the platform
data for context bank setup. These hooks allow platform-specific code to
configure dedicated firmware context bank devices mapped to the firmware
stream ID.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
[ ... ]
> @@ -193,6 +207,7 @@ static void iris_remove(struct platform_device *pdev)
>  		return;
> =20
>  	iris_core_deinit(core);
> +	iris_deinit_cb_devs(core);
> =20
>  	video_unregister_device(core->vdev_dec);
>  	video_unregister_device(core->vdev_enc);

Could this teardown order create a race condition with userspace?

The patch calls iris_deinit_cb_devs() before video_unregister_device(),
which leaves a window where the hardware context banks are destroyed while
the v4l2 character devices remain registered and accessible to userspace.

If userspace calls open() on the device during this window, the standard
v4l2_open() will succeed and could eventually call into iris_core_init().
Since iris_core_init() acquires the core lock, detects the deinit state,
and calls iris_fw_load(), it could attempt to load the firmware while the
context banks are being torn down.

Attempting to use destroyed context banks for DMA or firmware mapping could
result in IOMMU faults or memory corruption.

While the pre-existing code already called iris_core_deinit() before
unregistering the video devices, this patch introduces a new failure mode
by explicitly tearing down the context banks during this exposed window.

Should iris_deinit_cb_devs() be called after the video devices are fully
unregistered, similar to the LIFO teardown order followed in the
iris_probe() error paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-glymur-v5-=
0-7fbb340c5dbd@oss.qualcomm.com?part=3D6
