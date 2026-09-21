Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617371A5B9E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789959797; cv=none; b=oPnZ0AaGkPaFoFcgdPb6EzmMu+UMHSI+Bt570tDy19LYIH+Z/KBLEjrA5oZ6iglRW6luWEHbu/emsgyy//KCcOVxeRThsenJE+KRVHEVyWAlvwvPrSH7EwX5j62z+5Sj21gR8J8gYx50fyFXMlcQr1WqFcNVdwcR55e5MCwA3aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789959797; c=relaxed/simple;
	bh=wu5/8/6QO+EFtsDVEVTiO0n/rkUIYFumNwA8QWXhxms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AnYB6o9+lrg7V8sUTnoLKZQToUZsKkLHabjOxCIv7rC4vTlJVqp0rniAIi1l6tfElWci8fkO9NGBA5qFHE6L8O6N2upSKeRibv3C9WnOoVIp6cCiOm/jRqRf0uj+1pyuTfT9id4Jy951+CzgVhwX6z8HBgZjj2NFWEIMqB/Ey0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/6k+aEB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/6k+aEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF9B1F000FF;
	Mon, 21 Sep 2026 03:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789959796;
	bh=Q8WjvG45TBElduA2GwyT+0UnoG341COfMtB8r3gBQW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/6k+aEB7moZejym9dZkEFoV+z4J2NedhBftbVzczcpFv3LZaQYeuHDaG1ZEYN9sk
	 zORZwliWWqA5EuGmH6XNWnUsIrRJ/CO45FYmrOuUPuyykRy1gQskDgj/78scfpH8HS
	 LUI/QA57SJm9lLydN66I2R8VXvfqgG4FRtpnD3HbGEnLZEJlEXg067A/2lzpydxyLp
	 maKMzNbUWPZiRtYjFaAvudZnJ6YykDrIc1MCypTbwa3gs4l1APklByOrkxNkDSOJuv
	 6z7TUGURd+kCA1ODKgKL9syLqRPEq7Mii88AQjxwis4ANfxa3AHpTNiSIj6XJuzy4N
	 4bubp04pFVgYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Santhosh" <vishnu.santhosh@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 03:03:15 +0000
Message-Id: <20260921030315.BDF9B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] wwan: qcom_bam_dmux: probe error path reclaims DMA pool before dis=
abling IRQ
--

commit 4ad4e0793e663284df130f5d11d5a4f0bb1754cc
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

This commit introduces restricted DMA pool support to the BAM-DMUX WWAN
network driver for Qualcomm SoCs. It assigns the pool to local and remote
execution environments during probe and reclaims it on driver removal
or probe failure.

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..c81e668d4e961 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c

[ ... ]

> @@ -845,6 +938,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  err_disable_pm:
>  	pm_runtime_disable(dev);
>  	pm_runtime_dont_use_autosuspend(dev);
> +	bam_dmux_reclaim_dma_pool(dmux);
>  	return ret;
>  }

[Severity: High]
Could reclaiming the DMA pool here lead to an XPU violation and resource
leak if an interrupt fires concurrently?

If probe fails late (for example, if irq_get_irqchip_state() returns an
error), the code jumps to the err_disable_pm label. At this point, the
pc_irq has already been requested via devm_request_threaded_irq() and
is active.=20

If the remote processor triggers this interrupt, the threaded handler
(bam_dmux_pc_irq) could be executing bam_dmux_power_on() while we are
calling bam_dmux_reclaim_dma_pool().

This concurrent execution would cause the DMA pool to be reclaimed
while the BAM DMA controller is actively using it, resulting in a system
crash. Furthermore, when devres eventually frees the IRQ, any DMA
channels or mappings allocated by the racing handler would leak because
bam_dmux_power_off() is not called in this error path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-qcom-bam-d=
mux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com?part=3D2
