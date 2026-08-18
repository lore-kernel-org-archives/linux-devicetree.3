Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497273AB260
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069114; cv=none; b=caxns3ipBLYjEbVTEyvfKzUhSCN4sjZaHTKgca6ND5edtZdjX5lx9YdAJGvYrm2uAk1lTkaY7Lr0pFaUWyYDJ9q1DGU1ftLTKCiEohhDvvmW/ewlVV49GNrJP3vWjOd+RcbXFwkOK5G1Q8jhEMSxsPXwePlvbNDBqmxCBRp18ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069114; c=relaxed/simple;
	bh=JUvJ2emwHK2b0N4UL0n0TV/sDWPaGOaJHvS4b48ogRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lLQwTPuOMKs2nlE1tV2ncjRCRE1izXE38h3JpwcN4AtXKlApXjstJ0iYISap5gHATCrmvC71+z0QCgoZ/qa/07h/XX+Lr8nYdQAnlJ2X7zrCUtH4GczHLWSB6gbnnOX/9fa16Wblh2XIJaOGE51Sox5BHTAH5nqeqpn5quolijM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFJ31gCC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFJ31gCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1F11F00A3D;
	Tue, 18 Aug 2026 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787069113;
	bh=4sC1zQ9XA34cVj4EclZTgg0sE2p8V3gjslvTKMaCsc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eFJ31gCCq9OAxhImOe/d71sh4HGuqhE9JlOIAUcT1MaFPV3WYtVc71vr16wKPgg7i
	 jDU1tEXIv2RQPOleWryQvhcHRiAkbU2/V8BX922O5LoAKvkCrC2UoORfUigGOCHUGW
	 DUEyekF26Vw1E96hRw6QozsWk8V4cE4RFNq5BixdR5n+sKSrKqqnC4StLJc52M/16x
	 zThX35hQHSUE/gD/y6YQfeFAquy1/Wh6uFhIQgln/xeSzt5092cs22eA+qXB9kCrYX
	 0EMpDmI/MvjtvqXn34FUqQbxHZpbFc46fgMAjF+5UzI5tU7cY/m7zsiA1n0rxXV44Y
	 +vATiXWFGbwVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] media: iris: Fix power-off ordering to disable
 power domain after clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-4-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-4-8dc8c4b3880e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 16:05:12 +0000
Message-Id: <20260818160512.BC1F11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes the clock/power domain disable sequence in `iris_v=
pu_power_off_hw()` but misses identical sequence bugs in `iris_vpu35_power_=
off_hw()` and `iris_vpu33_power_off_controller()`, leaving them to operate =
on unpowered clock controllers.
--

--- Patch [4]: [PATCH v2 4/5] media: iris: Fix power-off ordering to disabl=
e power domain after clocks ---
commit f43aeec1ae78e41029af71f7d7db01a62fedc472
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Fix power-off ordering to disable power domain after clocks

This commit fixes the power-off ordering in iris_vpu_power_off_hw() to
ensure clocks are disabled before the associated power domain is removed,
preventing unpredictable behavior or hardware hangs.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index e4847c1077097..3cd493b06d84c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -223,10 +223,10 @@ int iris_vpu_power_off_controller(struct iris_core =
*core)
>  void iris_vpu_power_off_hw(struct iris_core *core)
>  {
>  	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAI=
N], false);
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
>  	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
>  }

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but does
this same ordering problem exist in
drivers/media/platform/qcom/iris/iris_vpu3x.c?

Looking at iris_vpu33_power_off_controller(), IRIS_CTRL_POWER_DOMAIN is
removed before disabling IRIS_AXI_CLK:

disable_power:
	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POW=
ER_DOMAIN]);
	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);

Similarly, in iris_vpu35_power_off_hw(), iris_vpu33_power_off_hardware()
removes the domain before IRIS_HW_FREERUN_CLK and IRIS_AXI_CLK are disabled:

	iris_vpu33_power_off_hardware(core);

	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);

Should these paths also be updated to prevent operating on unpowered clock
controllers and causing system hangs on device teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-iris-fixes=
-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com?part=3D4
