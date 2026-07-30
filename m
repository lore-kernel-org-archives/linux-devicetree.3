Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA3415F01
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411572; cv=none; b=AkaLFcSmIFbUS/DrlYmcTn2AQ4i6d8VwkhqNu0F70ZDcxGOn1xj3GMpohx536X7ubuvXYC5gCiue6CufaN4QJIy5iwR+IMiUJ0tUgRXNxFKwj6D0lWFannSCiBLn2pXS8Aleq58SChxzKu945GFJVdanZGymQ1B4sKeW2G7CVgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411572; c=relaxed/simple;
	bh=TMfhEuxZsSwtvfu7deBfKKWPFwbA8NdxyQSy61X6egw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mC8r1HLhJyazIYwDiYzZHPFhmKnsWqqji1z3PMfUOgJkCf/0sLWYn2DCkVEtrGILT816ChehB/98aVELwGGYaC12Urr3RwV1LflMPNjb+MaxIg1D9MxHZ/ygPESyvweNjjVCgI1M7y6nOYOIAV47vHEwF8keBJPyEd0nt9nytN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PH/Dk54k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PH/Dk54k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC151F000E9;
	Thu, 30 Jul 2026 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785411570;
	bh=haGzM566Roz5LwJLqXWqr79S9LhOMexz7BNuRPHXEPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PH/Dk54krXuMqROsaGhpjarjliP8N0WZpOCkuLgK6+wbmofoIdkYPI0ZYfXMH6mT6
	 r9hvHjbThd/Kg+U04EbzkGUOJyCRu8ymatAB9bmAc4VRV0EOiwu49DyMlzzdbIXBEJ
	 sRoPtSDl7g3c0qW5vFQoJ9liZeC8zWCl8fEv8b2taPgzGKZOC+SEL3HSlJlAM6NUJ+
	 7XG/HcdgUbBWTPhr3tqkjOLCOu5BTVXwjUfhcPV9gdM3xAChF6qhlJNWdFSanG/T0N
	 QnB6XLflPmqFRjBtEVggQqva7LkrnZWKRcjOq3EusbLIj9bo9Fq4DMDJLvOd1FijvG
	 Gjvp4WVvq78BA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 3/5] pwm: dwc: add of/platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730111553.1886-1-dongxuyang@eswincomputing.com>
References: <20260730111425.1680-1-dongxuyang@eswincomputing.com>
 <20260730111553.1886-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 11:39:29 +0000
Message-Id: <20260730113930.8FC151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dwc_pwm_runtime_resume() writes the EN bit and timer configurati=
on simultaneously, violating the hardware specification.
--

--- Patch [3]: [PATCH v14 3/5] pwm: dwc: add of/platform support ---
commit b441231de2fcc89e4187b672bde1919622ac7347
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

pwm: dwc: add of/platform support

This commit adds platform and OF device tree support for the DesignWare PWM
controller, enabling its use in non-PCI systems. It also implements polarity
control using dual load registers and adds runtime PM callbacks to save and
restore hardware state.

> diff --git a/drivers/pwm/pwm-dwc-of.c b/drivers/pwm/pwm-dwc-of.c
> new file mode 100644
> index 0000000000000..e96e5569eb81e
> --- /dev/null
> +++ b/drivers/pwm/pwm-dwc-of.c
[ ... ]
> +static int dwc_pwm_runtime_resume(struct device *dev)
> +{
[ ... ]
> +	for (idx =3D 0; idx < chip->npwm; idx++) {
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].cnt, DWC_TIM_LD_CNT(idx));
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].cnt2, DWC_TIM_LD_CNT2(idx));
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].ctrl, DWC_TIM_CTRL(idx));

[Severity: Medium]
Does writing the saved control register directly in dwc_pwm_runtime_resume()
violate the hardware initialization sequence?

The driver notes in __dwc_pwm_configure_timer() that the specification
requires disabling the timer, programming it, and then enabling it.

Since ctx[idx].ctrl may have the DWC_TIM_CTRL_EN bit set from when the devi=
ce
was active, does this single write attempt to configure and enable the timer
simultaneously? Could this cause unpredictable behavior upon resume?

> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730111425.1680=
-1-dongxuyang@eswincomputing.com?part=3D3
