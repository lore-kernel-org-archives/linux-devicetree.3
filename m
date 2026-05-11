Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681F13FD131
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519415; cv=none; b=CWFr1j6tDrN1SSTeOfr2xNhsAFzOMBQDU+3DnNCZh0CrEGsNQSiDoNdG7efm7RoLieZC+PwqVYjW8/r7aNUeLoXGHN3LSV59G7C8LK9CE/QWP0/UmUs/NpR3BZXacN9ipYSVy+r4IAXO/29IiTtphhO7yWF6N9s9cmeCcuq5pT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519415; c=relaxed/simple;
	bh=D/KRR3cWA8YhRg3pD1Dkj2Jx4iqOpEciiw/dqXN+Rvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFazmnfzI5AqtxfVbeSAKr1rvH0/0v50kpmAv4BNRwSfwmC6KqCDJWmA/DCvWK9XGqgQhqu8FDK2BcO7k2CiRszo+g3Y5D1YZcbnl1Qs99afs4Snzkg2ckFnCLKwxRCrng8IxYifUEECwqwfWrpmEWZ8WRyUklzb4gtSqNkNDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/zx59+N; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/zx59+N"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1823260b3a.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778519414; x=1779124214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=;
        b=F/zx59+NL44D/FyyXI2cboR9odacHlRLWqpwqPO/W/rl3er4izrUKs59CoRu1KZ/6c
         J96ro0aJJEpFfZdkVrF0vcLPM8eGuAF+H/kegaCP24qs8iKhFB8fhuJLdipdzauK29on
         l8oc/zx+6+5xyHebRFl3lTfuVjsk1zkk3bY0/mmu2DBZpX7WqOyHMQMjQ5o8J2hvxDGa
         D7brsSXobrV+mgZvi0/Mb4wwZn98YhdeqKyCTOOLwYYhU+jgtgDAb5QPUrj/iUMuAA+j
         7EMIfjoH5rajBsVxEIZGj3RQsRUncW6j6sxglfUIspGPpgsEjeBrC/VQdyHv/565Wx0P
         qxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519414; x=1779124214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=;
        b=kYHbqBA+mwSovzXRA/uPlyrL8FTyFq0q693L25LzCsRzLoDi9+7UAG11rusXFav2+Q
         wFEn3Se3Zq+ba7jQXt1Is1j665pW6c92Ky788e99zECF9GVHDgKv7JhFO6xL32IH0ZlS
         pFKKR7GQkkqq9RmO/cpJoNBzlwoXxcjfwhVJYliXR8qfZHLzCqvZJH0WhP7RcWW9dQEm
         xK51erjtMaD7qK/0nVN1X5Wvk7A912DEgAL4SBPLGoMVEWTS3/JmIhyfu9pluTmpP2pS
         fXtWzarkibhF8ZZcaNEREsUTwBS87Ko3LBS4iDxNQyCYbUWlk9bKxTEGJ+QzyO96zJvt
         eTYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OyJbmJVTkDuAed2lPNjRVKKIazjfOoWi1Ug2RF0XM/DFDFAq6sc+ucF9tiAIXTL5orlQzMojlpIlC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gunPRhOLurr4Pq0Im8Ijb35ryxyVmUwzfjpC7VbmiW0/5JIR
	eAF2uKz0LXXdVIDkE2sfNXGxAB6K5WyA9U5SLbNYKs4kpfxQSKqGGG2NA6z/vPeGtfE=
X-Gm-Gg: Acq92OEGeg0VMeO++eGCk8gSqYBTwFOIRGLejwUBftywjq5anfjzd2NfwZgR6jiqPZj
	BCM3jsM9tFUtybAteE0D5TtlIbrsLF5walsP6s+J5bx56tWunKfmqUqeBw1AdzVCI+9gvPEE8lW
	BjB4ZqLMu37PnS0koPvLWffoxhe1sO7hUhAwem4hh4CD94IN++KtNLsksq6iKYxcOMlZXCatHKW
	FLDEwJ7TQKxis/a5j71xlBnCijnbic66wciPVaw9tvDaSCHfCAeNrXTclp7+4BtXHgd1jz3WaJk
	t95q860HNXwrAQuBZONseHYTOALOcAacyWndU0fPdRq7x85i02ksmnmnVpOmi32pj8LnH38uBXQ
	nr8V6FuzIFt7rYCsw2HA2glxY2I3/TmkakHqvZVRdhQuMgaXoMb0nnX/fkcFhJpxUJjo/rfKVoh
	chKSKi3v94Qp0avso0VMKbmU/4a5A=
X-Received: by 2002:a05:6a00:f9a:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83e3bb9f9ecmr9882717b3a.38.1778519413426;
        Mon, 11 May 2026 10:10:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6a4f:ac45:cc0f:8508])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a52cesm19958782b3a.57.2026.05.11.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:10:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:10:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Jiafei Pan <Jiafei.Pan@nxp.com>, andersson@kernel.org, peng.fan@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/4] remoteproc: add Cortex-A Core remoteproc support
 on i.MX platforms
Message-ID: <agINcH6hVf8G_T_3@p14s>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
 <agF+iYRfUIoBu35M@shlinux89>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agF+iYRfUIoBu35M@shlinux89>

On Mon, May 11, 2026 at 03:00:25PM +0800, Peng Fan wrote:
> Hi Jiafei,
> 
> On Mon, May 11, 2026 at 10:39:24AM +0800, Jiafei Pan wrote:
> >This patch series is to add remoteproc support on Cortex-A Core of i.MX platforms:
> >1. Adding dts binding for Cortex-A Core remoteproc
> >2. Enable Cortex-A Core remoteproc support in remoteproc driver
> >3. Adding dts example on imx93 platforms.
> 
> Normally, we only keep one patch or patch series from the same author that
> modifies the same file in the review queue at a time.
> 
> You already have a patch for imx_rproc.c currently under review(got R-b, but
> need Mathieu to handle), so this patch series might be delayed to be reviewed.
> 
> As I have replied in internal, to make multiple OS run on Cortex-A SMP without
> hypervsior, some GIC changes are required, without those GIC changes,
> this patchset is not testable using upstream tree.
>

If that is the case, please re-submit when the proper background work on GIC has
been merged.

Mathieu
 
> Thanks,
> Peng
> 
> >
> >Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> >
> >---
> >Changes in v3:
> >- Fixed dt_binding_check warnings
> >- Updated prefix of patch subject
> >
> >Changes in v2:
> >- Update arch/arm64/boot/dts/freescale/Makefile to add new dts
> >
> >---
> >Hou Zhiqiang (1):
> >  remoteproc: imx_rproc: add autoboot support for A-core
> >
> >Jiafei Pan (3):
> >  dt-bindings: remoteproc: add imx-rproc-psci
> >  remoteproc: imx_rproc: add support for Cortex-A Core
> >  arm64: dts: imx93: Cortex-A Core remoteproc device node
> >
> > .../remoteproc/fsl,imx-rproc-psci.yaml        |  51 ++++++
> > arch/arm64/boot/dts/freescale/Makefile        |   2 +
> > .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
> > .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
> > .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
> > drivers/remoteproc/imx_rproc.c                | 150 ++++++++++++++++++
> > drivers/remoteproc/imx_rproc.h                |   2 +
> > 7 files changed, 297 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
> >
> >-- 
> >2.43.0
> >
