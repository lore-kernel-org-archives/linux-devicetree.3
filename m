Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A034B1A7
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073982; cv=none; b=rx6epLHJmyMmsjA31ep5hg6hzqi3ZZH/KC+OTAiZiz9Lz5vBCEFPRveFnzfirmRnDpxCA9qnos18p7pyWMvtACFDMiWkQ3nILAJaQuRizlXI4670RX6JUz6siJgQ7qiZMuCxQ3LbAa+Kpj7SVIf+MSSRCmHIWNeoXtw2j0vOmSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073982; c=relaxed/simple;
	bh=uSUJp+9Fpyhdb91hwJqRMTnOFYL57v5XmpIsFvXej+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VxxFMS1uvazxgY3DPzBl8APE3rVvMpi1t4dLPdhfXXTFDSe2mqxUhlAF1vrpo0/lRs0cTZeFi+Z4kXLxhFWY833CtwOOB7Ibt7iDZoUov6WylvLe/8IMKmr5mTySQ0B7exB+lwOf3jXYYMDtf97oGRuhkoTMevVUGPHlySgjJik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Amj5CHzN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Amj5CHzN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441D61F00893;
	Wed, 10 Jun 2026 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781073981;
	bh=sFhjYI2JpSLft7YV5q7rIs6EQDn1mrRv+0t+lgij0wk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Amj5CHzNBA/+rPMNFIW8Jl4tWRDVReJr76cCqJJIHMrFU0+8CfjfQwh3AhLek8t5r
	 4a1Qqw/TE3YRWHdVHeuC9/F4NRMyciEmHtLN4Ar7ecAjX9VfYoQClz+PRfWKtVtq5N
	 blCJy2wicUCM4BnxHKXJ3dSTyMrkO6gjIwedo430KT7luI9oAJjM092o3+k7p/85QB
	 QkwN1EvsVD0jhOX+6HgAb6A5RUt0zE71isGoDJd4VijoADysDxUEnaaQY5HD6o7cRG
	 lNaS/oQsHuI9nDOfqOGa3I00Ju18kU2Yh2jix9vz+Y/GTuC+dC80VWqhkThVy8GCQb
	 mqpjKcF/2cbRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/12] media: iris: Add power sequence for glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610-glymur-v8-7-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-7-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 06:46:20 +0000
Message-Id: <20260610064621.441D61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Direct writel() to shared CPU_CS_AHB_BRIDGE_SYNC_RESET register ov=
erwrites the adjacent core's state, asserting hardware reset prematurely.
--

commit 0a8584c1c055cb2958fb73836b1a4ff132552257
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add power sequence for glymur

This commit adds power sequencing for the glymur platform, which features
two video codec cores (vcodec0 and vcodec1). It ensures both cores vote for
the clock and power rails based on the combined workload of both cores,
since they share the same power rails.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index 7cda946015558..afd2a0e2a3a54 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
[ ... ]
> @@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core=
 *core)
>  	iris_vpu33_power_off_hardware(core);
>  }
> =20
> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core=
_id)
> +{
> +	u32 bridge_hw_reset[] =3D {CORE_BRIDGE_HW_RESET_DISABLE, VCODEC1_BRIDGE=
_HW_RESET_DISABLE};
> +	u32 power_down_prep[] =3D {REQ_POWER_DOWN_PREP, REQ_VCODEC1_POWER_DOWN_=
PREP};
> +	u32 bridge_sw_reset[] =3D {CORE_BRIDGE_SW_RESET, VCODEC1_BRIDGE_SW_RESE=
T};
> +	u32 idle_status[] =3D {VCODEC_SS_IDLE_STATUSN, VCODEC1_SS_IDLE_STATUSN};
> +	u32 lpi_status[] =3D {NOC_LPI_STATUS_DONE, NOC_LPI_VCODEC1_STATUS_DONE};
> +	u32 power_status[] =3D {VCODEC0_POWER_STATUS, VCODEC1_POWER_STATUS};
> +	u32 value, i;
> +	int ret;
[ ... ]
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(bridge_hw_reset[core_id], core->reg_base + CPU_CS_AHB_BRIDGE_SYN=
C_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);

[Severity: High]
Will this writel(0x0) overwrite the adjacent core's state and cause an AHB
bus stall?

CPU_CS_AHB_BRIDGE_SYNC_RESET appears to be a shared register containing
configuration bits for both vcodec0 and vcodec1. By using a direct writel()
instead of a read-modify-write, writing 0x0 unconditionally clears the
HW reset disable bits for both cores (e.g., VCODEC1_BRIDGE_HW_RESET_DISABLE=
).

When iris_vpu36_power_off_hw() shuts down core 0, this immediately forces
core 1 into a hardware reset while it is still fully powered on. During the
next loop iteration, iris_vpu36_power_off_vcodec(core, 1) attempts to read
core 1's VCODEC1_SS_IDLE_STATUSN. Because the AHB bridge to VCODEC1 was
already thrown into reset, won't this read crash the kernel due to a
synchronous external abort?

Should this sequence preserve the adjacent core's active state bits when
writing to this shared register?

> +
> +disable_power:
> +	iris_genpd_set_hwmode(&core->vcodec[core_id], false);
> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-glymur-v8-=
0-1c79b9d51fc0@oss.qualcomm.com?part=3D7
