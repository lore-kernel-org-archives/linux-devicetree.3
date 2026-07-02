Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC763AC0E4;
	Thu,  2 Jul 2026 23:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035649; cv=none; b=FmYoh7tBFinqTrtEII1P4UVVc0ON7C83Xp4MrnwyXeKhXNyXFkJ76MhpIkez/24HuZJeHCWbgg52kOiRfBx0/K4F3Ve0uQ5lQlJNGvON/78Xg1vWTDhxzXbxVCMEPYmHCPRNz7l/o6PSJx3AI5gC6utf+FZ/9H/8IfItGc4F6SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035649; c=relaxed/simple;
	bh=jRKxWETOji5ROePLaXTuE1cD9WzUOYWkjOCFSIyuCXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkOeVF8F3YgJbuOvxaFT7oGC7p4/FxRyIhnoiAFiNmtaCoN0Cp1bNLrR+hWSXGmdZJX1JMnmqK3F5FZqRsRJ/vKTGfmIcbwgh4kiwCKSiCrkZUPS2BQyEmFfgDNmh6hBvasg9Btm6GahJpTK9NfbSkXVTtdG6Zc121PJ+zsJ5Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnJ8VGCg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnJ8VGCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546FE1F00A3A;
	Thu,  2 Jul 2026 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035648;
	bh=jlLxd/kiJo4/ynwDfEm6Tz5dANQZqMF4cukX0BATQxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XnJ8VGCgwipVokZejF2BJlOwk2TRbvVwxyHiJ3/soS8rMeLJ584fvRf6dHN1AYWcD
	 xdmo9fJ6tEr7xUBlftAo9dddSuDgPJotctcZGpaVoJuSIc/OwVU5T/16zdQ3wTT2ur
	 MZ5sKNaE033j2TRBcbdJ8RHPQQjCU8UCVcsCc1q13iRA1d3mpwr5p5eQFLxT07vLmE
	 q2eki/LKgcp3Vx2ri6cmOESITseTEo+91BMI7pEHsoJQK5Q9vi+I8GzMIJ3GZDuiWR
	 MSHbBSO/ongJCszxKj139JY5kC6B1gKhyOPvEu2QyeSJW719S2YRsOPr0KRmXgws6I
	 b7hrCAprhGFag==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	freedreno@lists.freedesktop.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: Fix GPU IOMMU property
Date: Thu,  2 Jul 2026 18:40:23 -0500
Message-ID: <178303563649.359079.274555099812261712.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-purwa-gpu-dt-fix-v1-1-4637892156cf@oss.qualcomm.com>
References: <20260410-purwa-gpu-dt-fix-v1-1-4637892156cf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Apr 2026 02:38:51 +0530, Akhil P Oommen wrote:
> Purwa's GPU does not support SID 1, which is typically used for
> LPAC-related traffic. Remove SID 1 from the GPU node's iommus property to
> accurately describe the hardware. This fixes the splat below, seen with
> some versions of Gunyah hypervisor:
> 
>   Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
>   CPU: 0 UID: 0 PID: 80 Comm: kworker/u33:2 Tainted: G   M
>   Tainted: [M]=MACHINE_CHECK
>   Hardware name: Qualcomm Technologies, Inc. Purwa IoT EVK (DT)
>   Workqueue: events_unbound deferred_probe_work_func
>   pstate: 21400005 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>   pc : arm_smmu_write_s2cr+0x9c/0xbc
>   lr : arm_smmu_master_install_s2crs+0x78/0xa4
>   sp : ffff80008039b570
>   x29: ffff80008039b570 x28: 0000000000000000 x27: ffffaddd62f1ab78
>   x26: ffff00080a4ff280 x25: 0000000000000018 x24: ffff00080b896480
>   x23: ffff00080ba9b7a0 x22: ffff00080bb05160 x21: 0000000000000000
>   x20: 0000000000000000 x19: 0000000000000001 x18: 00000000ffffffff
>   x17: 0000000000000000 x16: 0000000000000000 x15: ffff80008039b1d0
>   x14: ffff80010039b37d x13: 00746c7561662d74 x12: 0000000000000000
>   x11: ffff00080b7fbd98 x10: ffffffffffffffc0 x9 : ffffffffffffffff
>   x8 : 0000000000000228 x7 : 0000000000000e87 x6 : 0000000000000000
>   x5 : 0000000000000000 x4 : ffff00080a4ff280 x3 : 0000000000000000
>   x2 : ffff800082a40c04 x1 : 0000000000000000 x0 : ffff800082a40000
>   Call trace:
>    arm_smmu_write_s2cr+0x9c/0xbc (P)
>    arm_smmu_master_install_s2crs+0x78/0xa4
>    arm_smmu_attach_dev+0xb0/0x1d8
>    __iommu_device_set_domain+0x84/0x11c
>    __iommu_group_set_domain_internal+0x60/0x120
>    __iommu_attach_group+0x88/0x9c
>    iommu_attach_device+0x6c/0xa0
>    msm_iommu_new.part.0+0x84/0xe4 [msm]
>    msm_iommu_gpu_new+0x3c/0x104 [msm]
>    adreno_iommu_create_vm+0x24/0xc8 [msm]
>    a6xx_create_vm+0x48/0x78 [msm]
>    msm_gpu_init+0x2d8/0x508 [msm]
>    adreno_gpu_init+0x208/0x324 [msm]
>    a6xx_gpu_init+0x604/0x8cc [msm]
>    adreno_bind+0xb4/0x124 [msm]
>    component_bind_all+0x114/0x23c
>    msm_drm_init+0x1b0/0x1ec [msm]
>    msm_drm_bind+0x30/0x3c [msm]
>    try_to_bring_up_aggregate_device+0x164/0x1d0
>    __component_add+0xa4/0x16c
>    component_add+0x14/0x20
>    msm_dp_display_probe_tail+0x4c/0xac [msm]
>    msm_dp_auxbus_done_probe+0x14/0x20 [msm]
>    dp_aux_ep_probe+0x4c/0xf4 [drm_dp_aux_bus]
>    really_probe+0xbc/0x29c
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0x3c/0x15c
>    __device_attach_driver+0xb8/0x134
>    bus_for_each_drv+0x88/0xe8
>    __device_attach+0xa0/0x190
>    device_initial_probe+0x50/0x54
>    bus_probe_device+0x38/0xa4
>    deferred_probe_work_func+0x88/0xc0
>    process_one_work+0x148/0x28c
>    worker_thread+0x2cc/0x3d4
>    kthread+0x12c/0x204
>    ret_from_fork+0x10/0x20
>   ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: purwa: Fix GPU IOMMU property
      commit: 4cd774c1feb3f720265c512174c5c3312eca1be2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
