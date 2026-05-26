Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A03A0B3F
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792767; cv=none; b=rUrPO9TieNi69BQYMzFrmD/NLerwKiqWnJG6jTeq0riamhvYVnBpCpqTGPNtIf+fQFJIKjBcMqLlpZFfCGdOU2BrRAF/jBqpxPhWUWVGum1MD0JBcgPm2T57mYP12+NyX2aZePKztoOz/+JkbH+qpTjrU0SBehL/oDdDdCTqN6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792767; c=relaxed/simple;
	bh=8DOkPIis1AYTSzeHeH+nYHRkjPZcAuQxTTXQ8M7jcP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C2h7UKhPrfTFJ3Vemfnl3fK12rPsfi+8nuYIlrf3BsE1FtXKG10hvd83USsUCEHmQXzjCU7HL+g3zZnk+SdMppyVfSilER1ZMVU+A+CHrweSjt1c+uN2Brl9p06cF8NhmAkMRn7QRyCaoGa371chhcbE1Azl+EKC5oXVJqPoQT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGo9aFEH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGo9aFEH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585C01F000E9;
	Tue, 26 May 2026 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792765;
	bh=Gayi9SUsTHaaljxmB0CXDW0V4QlqAg6SFnjFuwGj9ow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGo9aFEH/0oVDZm929buzHRtft77VXgPlo5o6gcRnubaGeCSOhPOPJTFVQWf/d9Jq
	 rJJOnLYGNqnWNbXAmQmxMFiV5wtclQWk7/oLkp4LokxrVmzmLJQvcChQ10R2rp4S4E
	 7R+klGoSYtrq9L6kkBfVNcJgf0n/sO9uPn/n4Fp0ljaY5IfCrkdy6HxKImu20BwV23
	 VocvUrtqU4mHw4PHUngvDlRZUfS4nhR/NrjL7OO3aCmqIXUcjyQGLePVSA/DdiUY4h
	 vkytVQS4cWyY99ES+75MTFf7i0kmeD1zDZ+MPbbN8Tx8airHky4tAkXLa7baXogGgS
	 wuasw6KK+xv0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 6/6] arm64: defconfig: Enable
 CONFIG_VIDEO_AMLOGIC_VDEC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-6-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-6-33bc817f93f4@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 10:52:44 +0000
Message-Id: <20260526105245.585C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] CONFIG_VIDEO_AMLOGIC_VDEC selects MESON_SM without satisfying its A=
RM64_4K_PAGES dependency, causing Kconfig warnings under COMPILE_TEST or wh=
en using 16K/64K pages.
- [Low] CONFIG_VIDEO_AMLOGIC_VDEC is inserted manually out of order in arm6=
4 defconfig.
--

commit 482a11927128f3e0aa6ba1ce2517d29726af8f3b
Author: Zhentao Guo <zhentao.guo@amlogic.com>

arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC

This commit enables the Amlogic V4L2 stateless video decoder driver as a
module in the arm64 defconfig.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 4567f4b34f293..14caac24d2009 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -913,6 +913,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=3Dy
>  CONFIG_SDR_PLATFORM_DRIVERS=3Dy
>  CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
>  CONFIG_VIDEO_AMPHION_VPU=3Dm
> +CONFIG_VIDEO_AMLOGIC_VDEC=3Dm

[Severity: Low]
Does enabling this configuration expose a dependency issue in the driver's
Kconfig?

In the Kconfig definition for VIDEO_AMLOGIC_VDEC introduced earlier in this
patchset, it unconditionally uses select MESON_SM. However, MESON_SM has a
strict dependency on ARM64_4K_PAGES.

Selecting a symbol without meeting its dependencies forces it on, which can
trigger unmet direct dependency warnings during builds on architectures or
configurations where ARM64_4K_PAGES is not met. This can happen on non-ARM64
COMPILE_TEST builds or ARM64 builds configured with 16K or 64K pages.

Could the driver use depends on MESON_SM instead of select to avoid
breaking automated Kconfig build testing?

[Severity: Low]
This isn't a bug, but was this defconfig change generated using make
savedefconfig?

In the media platform Kconfig hierarchy, the Amlogic platform Kconfig is
included before the Amphion platform Kconfig. Running make savedefconfig
would naturally place CONFIG_VIDEO_AMLOGIC_VDEC before
CONFIG_VIDEO_AMPHION_VPU.

Manually inserting it after Amphion will cause unnecessary churn the next
time make savedefconfig is executed.

>  CONFIG_VIDEO_CADENCE_CSI2RX=3Dm
>  CONFIG_VIDEO_WAVE_VPU=3Dm
>  CONFIG_VIDEO_E5010_JPEG_ENC=3Dm

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-b4-s4-vdec=
-upstream-v5-0-33bc817f93f4@amlogic.com?part=3D6
