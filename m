Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D983BB674
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145206; cv=pass; b=DRqUbjZZaX9UE4OLpCmTeIJpx2ya97jlOXnrMuGf2Z5gjkXjiw3NXW5uYJ4oXZh4cYqIf3aXGzQSloMdwH89RPEQ29oGiCJWFP5kydwgBCdXWJWhCu0TKsXHgoVjvTQ5WnmbapyBV282rSgFtxllAgRMgGhV5zMSgAdCSDt/+TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145206; c=relaxed/simple;
	bh=6aYsyLRIT7+vY7T3t5Bn20VE9ftHbJ2BhHft7v3ul04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPHJBN6hI9GkFN0fTQP4d1O08kAs5EHq6gHL3FGk10+xGUqRYamPOJoCzFBGZcpirNCNzgm7NGNb35+Ie0Lx7eOCua0Yg3jHwwTqOhEcAG+RlvwwUT+zhzWr2fvTQ+T6ZZYKtIT1lV5NwuvpIUv0qxXGJNgy7JxVGbQXf8oaoLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0V6auo0; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0V6auo0"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c15e9a2f51aso135849666b.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784145203; cv=none;
        d=google.com; s=arc-20260327;
        b=cCUumk+PxYQxk6IIBYjacCCaa/kPkPpHeiViQNLgE4jHwMcBFtUNYmwrtuXGfxEOgL
         qr91b2R/ec5ah/dsmhtIWP7tnZzHllrIEqiIkCIP7UvbC6tcCSuBoLYePxXWfkRZRBHS
         B+bCAl/HNKIhuJV227QR1vgPEkzcw6lPMycfcU7YNP27vATRGpwIwDUDI0j5D5tZvafg
         jELh19R/VY80tDkyDoWgTGBL0vSbLGmAoXexRFqcFs92NngH740dPkytFfy0J3Kyu+3O
         e2CF/IxVERX1+/6gsEcFKkF9NIQnij9P46gqi/phwJQjrodSH9eBJc3AJjRdJr9qHtjD
         0uGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6aYsyLRIT7+vY7T3t5Bn20VE9ftHbJ2BhHft7v3ul04=;
        fh=jWVNgGtnEJFCse423tr8f9KRP4cPY/iOayVR08sXv9g=;
        b=oTSmKZJ38MF5Nr6gabediAFb+vJSrihOiztsssBE6G8deh56ZJPjr8wrJsO5yTjjkU
         b8CifFUMUVDEBlYTlgziZdFRhHdKEhei7TM2/H+uGdznxx4iueKIaluzTo2chdUGjOoJ
         Qt8N5JFPJ3Wc7KCg0gVo0g1BO83xLLwnNWuuMpeIP/mNJ0hRJlHX2ggF75P+840deLbL
         JHbP9wezTDacmF/FbuFel80KhIZAovKd5ITRXCTKwfOLtjK02BsdYuOBi0MaV4070mt2
         c2PS01nKuTwCRF/glg+DXLLf9E8iTJlLnfPgAPkne3IhtQ6pwdm1k4yRsgNQtv+ffYaJ
         vLqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784145203; x=1784750003; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aYsyLRIT7+vY7T3t5Bn20VE9ftHbJ2BhHft7v3ul04=;
        b=o0V6auo0QMPWhRqtiMDlzeuIn4Hv2uHWwUP7ElzfN46fUd48dG6+V50XQ65iyrbrgy
         5yZyJ3Es+7n0QyGrpCrw9sAh3X8/J0J8pc29dDrMOAtNeCfv7K7sD85F7zfQwS20DDkb
         sSI/D9L54PNtnQnCJGDBsu6TqJGtNMl6C5QZuHwHFyKKWVaIDKyuihue64RSLtfXkjPc
         eYCz6sAjV+2M9tFtb7u2E+ARVYoJQ0TVfPrqeTYxiKix5uK2VjC6TyX/8Af+Fk/MTPeY
         z+njEVpBdUaSzYz1zfNkHO5BwLasrj3j1Ug9PVPREL0f7r7bya8rGDMA39DjTH2gNk3p
         2xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784145203; x=1784750003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6aYsyLRIT7+vY7T3t5Bn20VE9ftHbJ2BhHft7v3ul04=;
        b=HkxdR+N5dKgVtRQh6D3TUBEX0nDWi4M4qCrTVKhiMW8wpPrFZRukDoPPKBGJDM4DwS
         k1huHIgpkDCqVHWk6E+O8eHV0SESZEtYMU1dyF15Uy0IodRlShBk3sZ76AMxQsgN8lxe
         hu1m3MkXsel/UByoajDdH8kC3dp4HPBSplFtezVRC2eWc0rCslIRJBqKibzISbsV4Kni
         2eg8ESQiw9nQ/5uI2f1iaroUfo9d8bxxFlAQMqsJnS5Uvd3nyMcATEGwCi2oSErERO2a
         ugo+xAp2m520RutDifcYh77gygMYOCoUFEP3Ez3/yfA/BYmcdfl5E1gYtMt2A2t0WQsK
         Pw8A==
X-Forwarded-Encrypted: i=1; AHgh+RqOkqw5XRa+0FPGNoSkRA/ddHm0MXSLM6HoYi64vw8FHtpLmzrsjrKaayfFQHeVQTvbsk4LMZZhEvqk@vger.kernel.org
X-Gm-Message-State: AOJu0YwBPaIn3ykBOn641cRvOQ5dH9m2XXWfFtt1BpSRyVHZtH7N+RPN
	73usmzKjqnI78SwQIqDLFwEub8csPxGTp6Oa/opJGE7sbvMwMPETiuMpNv7KzjSnNkYqOQXT9q7
	ZN6GbH4PILejdxnRWdJ2MIw8o7QQK/b8=
X-Gm-Gg: AfdE7clt6U0H1Ga0QI/iP69mEMUW2AS6IJ3VO/aBAgvZogN2+JFtV5BQY13TUkYrRDW
	D7ln9Eqw1YLXYf4NfrnSztLalLhP3QFjfJU1BZsM/60a+6wi73uDDbh3/kcQzrF0b790aJURgU1
	jgER+v7Iuhs43Stae0EwIX2dx3jr/qLI+mrY3ViSCZodF8g5bk9vQgefCUiSZk+eoKWjVJ7+Ty2
	PLiDDNAy17KDGteonrjyLmNtjkBnSBjS2a7GfxvTBseRxfzt5isS2LnzBM/hGcZwoC3s7TEMEw=
X-Received: by 2002:a17:907:1c09:b0:c0d:43b2:e8e7 with SMTP id
 a640c23a62f3a-c161f3536b6mr986415666b.35.1784145202911; Wed, 15 Jul 2026
 12:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-3-coiaprant@gmail.com>
 <20260715191449.437E11F00A3A@smtp.kernel.org>
In-Reply-To: <20260715191449.437E11F00A3A@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 03:53:11 +0800
X-Gm-Features: AUfX_my3OiYGnoG1-0LHJeJhHkihNhk5NRWBF7PzkFitZB2KLvNMBb4XjsCN-hg
Message-ID: <CALj3r0gK5atP4An=04Bjery3_A1n4QwWF2tkQk+TmPemKDOMOw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/10] dt-bindings: phy: rockchip: naneng-combphy: add
 rockchip,sgmii-mac-sel property
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. I'll address both issues in v2.

> --- Patch [2]: [RFC PATCH 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property ---
> commit 0d950b4055dd144fecf5059f16535f2c8d94b5d3
> Author: Coia Prant <coiaprant@gmail.com>
>
> dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
>
> This commit adds the "rockchip,sgmii-mac-sel" property to the Rockchip
> Naneng combphy device tree binding. It allows selecting between GMAC0
> and GMAC1 for the SGMII interface on the RK3568 SoC.
>
> > This is necessary for boards such as the Ariaboard Photonicat, where
> > the SGMII interface is connected to GMAC0 and needs to be explicitly
> > configured.
>
> [Severity: Medium]
> Is it actually necessary to explicitly configure the property to 0 for
> GMAC0?
>
> The schema defines the default as 0, which implies that omitting the property
> would naturally default the hardware to GMAC0. If explicit configuration is
> required, does this mean the hardware or bootloader leaves the register at 1,
> making the `default: 0` documented in the schema incorrect?

Regarding the default value: the hardware reset value for the
`pipe_sgmii_mac_sel` bit is GMAC1 (1). I have updated the binding
to set `default: 1` and revised the commit message accordingly,
removing the contradictory "default 0" statement.

The default now matches the hardware reset value.

> [Severity: Low]
> Should this property be conditionally restricted to the RK3568 compatible
> string?
>
> Because it is defined in the top-level properties block, it will pass
> validation for all other hardware variants (like RK3528 or RK3588) that do
> not actually support SGMII. Could an `if-then` block in the `allOf` section
> be used to set this property to false for compatibles other than
> `rockchip,rk3568-naneng-combphy`?

Regarding the property scope: you are correct that this property
only makes sense for RK3568. I have added an `if-then` conditional
in the `allOf` section to restrict this property to
`rockchip,rk3568-naneng-combphy` only.

Thanks,
Coia
