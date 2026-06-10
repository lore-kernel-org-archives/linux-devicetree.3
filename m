Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287FA374A19
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073661; cv=none; b=qMd3Q2yq4p2ZT+G/2Q4QD2S3/P8llCx+/aOOM3DqNe/9+tM57D2GKt6YMgf84EIYSUulj1FhHhyauvB/Ho2VkC4W3tzOqoLbey8ttoaWa5wapoi5vBE6SqhdOlPKzs+b/AiiyeYfiVjFsAnIeUwdaWJMuovjeiUiJqmz54dx6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073661; c=relaxed/simple;
	bh=cPUlNh/RLxeowhPHN9NXiC3pjnOWGKoa7q+ngv3QWRo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fsjviOrEZtJTwvxouJ2Wo8i6Vu3rD9wqPr+E4GSKldaLCUWdEwOZL+YqWG8yHx+OYL7WkHx6/ylkzh25SvqLFEyTJ9sDKWSky5hEp2L1EH8B0EuObeqZmFizEb5ZfxTSlW6kF4KHkOFhJlpzXgjJjcgELabdsR7UEfIieDjvVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7wGPqFJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7wGPqFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F2A1F00893;
	Wed, 10 Jun 2026 06:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781073660;
	bh=TwbSEN4k3q6DKlCCOEgrrQ+bqNReG05xzBPUOkhD9e8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B7wGPqFJ1yvu050i0SYkhjDdhQkjTmYtQdpD2NiIsoWIc9Ij1thHWwFp3L7xS8Yue
	 iaepfkIrG+BbekNikaLNZxF8ZTiphgOLVU62QTSqAPt9o0tlu+6F7AydfLwDVzeIot
	 pMVi3/r1teh9yip0MSyk4Ub2mHwXbVe02jhaHX8iRvLZv/eNACjrn3kDDVHh9vPldj
	 U5auksjcUafe+6dx8bmcxQTso3Oj+fwoNBPwcni2rLhpWuJgoKslpt+vCEZxxtPhb3
	 la+02ZHwV3ZkaseZtAkzYQcPkTtndP8U8njLbkZuIY566QSVJ346dwa/HRVlr83KKS
	 H1bNPhxoNXb3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/12] media: iris: Handle CPU_CS_SCIACMDARG3
 register write via program bootup registers hook
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-glymur-v8-8-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-8-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 06:40:59 +0000
Message-Id: <20260610064059.B5F2A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error path for checking `CTRL_ERROR_STATUS__M` breaks out of t=
he timeout loop but erroneously returns success.
--

commit c710baa8452aee4bafd7c2c310b77e43ce0faf2f
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup re=
gisters hook

This commit moves the CPU_CS_SCIACMDARG3 register write into the bootup
registers hook and provides a platform-specific value for the Glymur
platform to avoid firmware miscalculating the VM count.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index 330fc85d232b4..a42554272964e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
[ ... ]
> @@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	iris_vpu_setup_ucregion_memory_map(core);
> =20
>  	writel(ctrl_init, core->reg_base + CTRL_INIT);
> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
> =20
>  	while (!ctrl_status && count < max_tries) {
>  		ctrl_status =3D readl(core->reg_base + CTRL_STATUS);

[Severity: High]
This is a pre-existing issue, but I noticed something concerning in the
error handling within iris_vpu_boot_firmware.

If the firmware initialization sets the error bit, the code logs an error
and breaks out of the polling loop:

    if ((ctrl_status & CTRL_ERROR_STATUS__M) =3D=3D 0x4) {
        dev_err(core->dev, "invalid setting for uc_region\n");
        break;
    }

Since the loop is broken early, the loop counter remains less than the
maximum number of tries. The subsequent timeout check evaluates to false:

    if (count >=3D max_tries) {
        dev_err(core->dev, "error booting up iris firmware\n");
        return -ETIME;
    }

This causes the function to proceed with enabling interrupts and eventually
return success instead of failing early.

Does this logic cause the driver to ignore a fatal firmware error and
leave the hardware in an invalid state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-glymur-v8-=
0-1c79b9d51fc0@oss.qualcomm.com?part=3D8
