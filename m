Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04C83B995E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167788; cv=none; b=J1V9PMgNtlyFixpaimogpPyt3doJ6gnNhyp1bit2xe4Y2wl1/PStFspzUX/teP53hcfQBBq5RC2bOgqA/fOUS3gj0br13nEJ86KjXtM2MWB+c5aK54fIaw9fbjjC+k6b2NyYNEhudkYtuAOPXoTtPafcktZuJrVGAgKnBuoG7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167788; c=relaxed/simple;
	bh=5Zzvg3aNuZOWiRz08MxGLER3VjK5czT5qWK8hB9mR4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rb+7gLLwlAkgHwUbNaaid1FQjzHf0jsYn9FMOp4o8HHTYwSW5ap+/paK9DhM6+XCR/VeVKORYCB4F10NbLXKSMjwBmwGpTUx969C3498eKfl04YhRaatb7psbJM+jYcSMenLcekltOGczvEnPGS5HktS7w+CE5eOer1uapAYSEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=La57D/PC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="La57D/PC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121101F000E9;
	Mon, 31 Aug 2026 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788167786;
	bh=QKvBc5YAIUkjZvnk5bWUmLbVUV116FgKuE+ph+scD0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=La57D/PCuDl/mwr16huPy8JICx4ys0UeYuiGHcNGwp1RpmEVvQHo/LCYmqRrkzvXG
	 rIbKRcLb+b01FC8dcggJy4PY6YnQpBnXFSv7Sx5LlqKeTmBysATcpJ4YAJOJp1FoDJ
	 29gIYnQc7S3N06dhNP45Ihtvm+dCOr8MDD3BBa3ICbJPwHfT1Q7d6H3ds4MIwKGPKj
	 M/bxbXuOBjXNywQ0PboWxuJhNKlBeJ37Bckvs0yI7oYBsP26fRTH1HrGzT/aSoeOTV
	 WZbbtjYX73BJwilsUcqUtk34e+QktvBqELQAr58qYcRDHyHwy36RQgrWA1W4uIJNnX
	 QJdFDEoKPiwYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 13/14] arm64: dts: rockchip: rk3576: add NPU (RKNN)
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260831081956.84871-14-gahing@gahingwoo.com>
References: <20260831081956.84871-1-gahing@gahingwoo.com>
 <20260831081956.84871-14-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:16:25 +0000
Message-Id: <20260831091626.121101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Leaking `iommu_group` reference in `rocket_job_next_locked`.
--

commit 6d0158c8b1c151133b206dc57eb669f47d5dc64e
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: rk3576: add NPU (RKNN) nodes

Add the two RKNN cores and their IOMMUs. Both cores are disabled by
default; boards enable what they wire up.

[Severity: High]
This isn't a bug introduced by this patch, but is there an iommu_group
reference leak in rocket_job_next_locked()?

drivers/accel/rocket/rocket_job.c:rocket_job_next_locked() {
...
	if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
		rocket_job_hw_submit(core, core->in_flight_job);
		return;
	}

	iommu_detach_group(NULL, iommu_group_get(core->dev));
	dma_fence_signal(core->in_flight_job->done_fence);
...
}

The reference acquired by iommu_group_get() is passed to
iommu_detach_group() which does not consume it. Since iommu_group_put()
is never called, this reference appears to leak.

Could this code use the already acquired core->iommu_group pointer instead?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index b0c0d3c8b1b14..2d0133cdf9b5f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831081956.8487=
1-1-gahing@gahingwoo.com?part=3D13
