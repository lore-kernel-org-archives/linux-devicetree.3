Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB8D33F5B0
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042782; cv=none; b=fL80+NEerXs318dD7XFvFYq5M++SGcv0JFUMU63Da/VakFZjWsGeOTU9oCvvoGLVug9V9QcsnQv7TaFRev4uCXNmPTlb8O85dFgcYahaUdCHRxfHGqkCKqucsQGwAED4ROH2e7BHI/52+vx7IrmzY7oqzbDqP+8G0J88Y6giXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042782; c=relaxed/simple;
	bh=MgxAUkxpTBpOJvxn1LZGdb3VZiu4fzAPsufR2SmtxnA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oz/7g1nBiqjzO5LahFFtqljXZG5no6tML/XDF6WGHyEqPy+Xvvtp6Q7tL9bhqODsz45fAi83urTgAO25JNutEFKTXwzPX28FSTyoiGQEAOe+hkzr4ozkmBV+oH1N6tu/6VvW8Lvrk7mlo5bZYyEn5t2cAD4anAbgLYUfSLdhx8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQ/F31WC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQ/F31WC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046651F00893;
	Fri, 29 May 2026 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780042781;
	bh=14ccDOC5JgwcKlEq2EiKOtk4nkG4zPRtdzUaDZwXGhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQ/F31WCFBRhSPl4WAsz3h4hOxpnOjKCspTHAMLTFHl+EVO1UuQ3EVdszFYEPKO5k
	 tzkOpc227qNQTrtlGkw75bWzlFXkkxbzAhVsbuE+751XUAW+LeAhdrcw6aRkwAKRxL
	 dQlL3tSdkSjuiDYT0viP9Nvx7MT5JChPNh3eChZp9R0/jZMU60LK2VZlzywOW44qUs
	 kD2lJbjlPL1vSX308nQDF0Z5zq9Sk7aeAPIJZ57rp+GzmhTy6ov691Hc38ZLSNm1C8
	 Gxuqp7Hli2WNQg8ElFflorlssfSE3WGgCylrAuSOejtQHp3LiyCI1VExiW41ey1oz/
	 AQBO9ehT8adKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-enable_iris_on_purwa-v8-2-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-2-b1b9670459ab@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 08:19:40 +0000
Message-Id: <20260529081941.046651F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown ordering in `iris_vpu_power_off_hw()` disables =
power domains before hardware clocks.
--

commit 99a4b6ceed030f2e0c99e6828095cd2e45157242
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

media: iris: Add hardware power on/off ops for X1P42100

This commit wires an extra BSE clock into the power on/off sequence for
the Iris block on the X1P42100 platform. The BSE clock drives the Bin
Stream Engine and is required to be enabled separately from the core clock.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index c6cfc1d9fd9ec..a3238bf118eb9 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
>  {
>  	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAI=
N], false);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);

[Severity: High]
This isn't a bug introduced by this patch, but does this function disable
power domains before disabling the hardware clocks?

In iris_vpu_power_on_hw(), the sequence first enables the power domain,
then enables the clocks, and finally sets the hwmode. The error path of
iris_vpu_power_on_hw() correctly follows a last-in, first-out (LIFO) order
and disables the clocks before disabling the power domain.

However, iris_vpu_power_off_hw() calls iris_disable_power_domains() before
disabling the clocks. On ARM/Qualcomm platforms, turning off a power domain
(such as a GDSC) while its associated clocks are still running can prevent
the domain from fully collapsing, lead to bus hangs, or trigger
asynchronous external aborts (SErrors) when the clock controller
subsequently attempts to access unpowered registers.

By inserting the new IRIS_BSE_HW_CLK here, this patch perpetuates the
unsafe sequence. Should the teardown in iris_vpu_power_off_hw() be updated
to strictly mirror the reverse order used in the error path of
iris_vpu_power_on_hw()?

>  	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-enable_iri=
s_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com?part=3D2
