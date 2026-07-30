Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BED23C1D70
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425552; cv=none; b=NCucYOjlXRJyzsqg2FxhkcbXegYgTMWqGald4ZYo3gNKNc+peoGYdQ9X4I0Xc1HdEzsOEDoOZ/pcpCyETc54hJNkwqxwjdLeb/nmsMfqAiaOzj5hBDZ75MZrHeiS4dB7/0hD+2JPlp4r05kfhiysLghgk6CEM3zZ5RSvSy478u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425552; c=relaxed/simple;
	bh=0s5wzu4q/Y7Pyx2udO6rOgZ1rvvN+FvD/kubSe2xWVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=us7uuGQSBmeOvearZ46vJnnRVA5mvyNtVF7uzBO9jv+EwHLVGptf+oeU5TH1/fv2BsIWjov6cYmGOHGaLk8cfp23R1+9g5dGK5dW+SyxdKPCaHXuuz3nTpCVTSw3aFnyL+964k9MOb0dDDQUWcDerT5zSVLTysL4aLhLeEpP0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtZrvLhi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtZrvLhi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEDF1F000E9;
	Thu, 30 Jul 2026 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785425551;
	bh=q7ebgAO+8SzC4aKu74psayKb6S6HHSQsWGoqk2HltPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LtZrvLhifZGY8Sm9T8DTg3DoaMv+J2Yst9LXgB5L9Tcx9h2Xib6UsjM5L5GlNf85+
	 VWOWUx2hSDxJIWhLo2BOwDjiWsmM+878A92523eDaaoR8xhP6zuYqbs2KeeIdGqjQN
	 rzQqNL3Z6igHl/XJPGXHbUnVpx9aadjDKCGgracA6aM4MmhDLwY1LyyNHfVdGRtp5Q
	 h5N+YmIwsteFQ/4UP73UwQvKA8Cp5QQhp+P8XlDqAKK/oZSruoGgkLcefp4yQVzSfa
	 Pf8hXFXW4wmUwq2OaVlSLdv6gpHTU8a1rF9fyd+jKWm7FxY8oUx688fGBPEdUN/spJ
	 BgIXDDibU9TcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/18] media: iris: Add platform data field for
 watchdog interrupt mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260730-iris-ar50lt-v8-8-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-8-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:32:30 +0000
Message-Id: <20260730153230.9BEDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete refactoring of watchdog interrupt bitmask. The new `w=
d_intr_mask` field is used for clearing and handling interrupts, but the ha=
rdware unmasking in `iris_vpu_interrupt_init()` still uses the hardcoded `W=
RAPPER_INTR_MASK_A2HWD_BMSK` (`BIT(3)`).
--

--- Patch [8]: [PATCH v8 08/18] media: iris: Add platform data field for wa=
tchdog interrupt mask ---
commit 7b1829b3b98fff57fbf33321045b38db86f344d4
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add platform data field for watchdog interrupt mask

This commit introduces a new platform data field, wd_intr_mask, to support
different watchdog interrupt bitmasks per platform. It updates the interrupt
clearing and watchdog handling routines to use this field instead of the
hardcoded WRAPPER_INTR_STATUS_A2HWD_BMSK macro.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h=
 b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index 72168b9ffa738..4fffa094c52fe 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -41,7 +41,6 @@
>  #define MSK_CORE_POWER_ON			BIT(1)
> =20
>  #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
> -#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
>  #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
> =20
>  #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

[Severity: Medium]
While WRAPPER_INTR_STATUS_A2HWD_BMSK was removed and replaced with the
platform-specific wd_intr_mask, does iris_vpu_interrupt_init() still
hardcode the mask?

drivers/media/platform/qcom/iris/iris_vpu_common.c:iris_vpu_interrupt_init(=
) {
    ...
	mask_val &=3D ~(WRAPPER_INTR_MASK_A2HWD_BMSK |
		      WRAPPER_INTR_MASK_A2HCPU_BMSK);
    ...
}

If AR50LT has a different bit for the watchdog interrupt, will it
remain masked in the hardware because WRAPPER_INTR_MASK_A2HWD_BMSK is
still defined as BIT(3)?

Should the WRAPPER_INTR_MASK_A2HWD_BMSK macro also be removed and replaced
with wd_intr_mask during initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D8
