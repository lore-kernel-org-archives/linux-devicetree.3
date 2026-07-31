Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D042E8C2
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517895; cv=pass; b=RhXHzTr1h1et1Lh2OtNlo4XhDLjpoFfL3HnuXAWqn19iLda4m3NW+lkAR8kOKuizqKd+g+MFuZQZPFB7kHqiYrV+qJW+w6GUBYSXJvkffCJWQ+Jks5uEPdFduCvg2lI2k6HRP6cV8IyXNk8BaXrBUXjRT3Gs3qnwQiqoaSauY0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517895; c=relaxed/simple;
	bh=Uhh8q41hmOlByjiX1nPXF362Jh+d49ZbfzvIl+Q5Sug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjePa0P1pl+kM8lcRQfa6PAFb1a+dQ4NEInNAGFHoKRsu4gHFQyR7LX3Ql3o56vD20jS7RVHeVm5UYYcNPWLgi1Xbu3P6VmFKwjbtYoloM8RDipO7onN0uE9tI/oiX92Lh/vb5VTQ30kb6oNnzmcYa3YKlhPR2K6Elg+u1XE6Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Exy5EQ16; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Exy5EQ16"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso2054106a12.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785517890; cv=none;
        d=google.com; s=arc-20260327;
        b=N+YJaVLdG8gNg/Nk8Xd+7w/ojN//HqBcpZNN5k9AuhERWf02PFCvGleKk+Dnbtw8gi
         N5ViNPOj4bPuX3WCmQA4pnLbLRlzgUkK7e43FAx1yqEcboH0jgI5bnB6bvf/+5LDvDJX
         z7pjeQnzZSy544rqadb91xA8Zybna0WR1oaXVuoh+iEwxkmVos7+2nr69gGQ0aedc1Ce
         7N3b44/loT3I0kwIuL5muXvV4Pypt806yVNDRr2/bFeybGEdDZBOhapoZmbOLHDt/4dv
         WjwFGisnTUqQngC7EhwNm3GYe8wT+Q3cKsX2yOBFwmnQSVyHOeBd3eCZNdPge0YnoZ1J
         XqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        fh=SzzmBkZPXAkW1VjGVgS1R0oyiN1kavicWv9xCNQYOWU=;
        b=ejwR6rg+enJceSQrXW1fPnA9WU4GUmKbZSXl4QWHjvz56cn89MvO7NKfR3t+cY+j+K
         dQPMiqy6SazTID1UGBZfoIlxiWQBkzk1lOHtLAHdhVAjCVUPOJeSNTEdH1RlEnyT0EJH
         ss+TBPu72gn8sZk6ZYs5jIuwiMrGT3Oav794B5RD6yL/zS8qsOlEvJBSFEuRx9A8O5nP
         KHw8mH3ZYfZA3WMRNqgu2+2MHsCfnRq131NQhz5Rh4GJajVH4vwQPUxrvPcoSHwe8fVi
         LX7FuNS7QuuNaKMh1AQUFKUgTWaRExYbzzjr5824uwdMZ8dHSK3E15cw513amGRCSi7o
         cYQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785517890; x=1786122690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=Exy5EQ162dvgPIB46DJfZCIj898OhNHYTDXIQagaTUngdPry8jW88hSxi6aVeP31S7
         YzgozmElj0AURbi6rlolpsPiLByD3Dd4Ii6jY6wqjM621Fqqa0b22PEBuASgo8mAw4De
         q9L3mNgaXd9xOA1YKaScbjzyuSCFbwu3UiiXTk2ghLdVxl1k256wj9vTvGHuymhzwrX5
         N1QWFADLLAUwVNfVysAJrQvM98upHj4eMDVgmRkgOseJP/GEExxCmGqFNrQL6nBDdWuh
         5q9mOh7bcYV0Wbl5Q5V2ykhADYOUtuUfmzcCHvOZ5sPgDDKDntg7uK7b27OmDy1F3uAo
         XHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517890; x=1786122690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=U7kRdZZ/Rx9Dzysr2PdIaJ0idTSuf1vRfpaLyoHusHU0X4C1L+G1PeE8nGjj0ulEBa
         ohBfx/8BSmMAK+KLtQuyCbPqj79yNWOlnrKrJtyI1nAOxPnSIBddXrPh1XPXg1G1AXz+
         tv/00TWGqMtzVQXaOcIJv1yv0BdmpsvNgMEenEU8hQ5WhqxdyqVDHVXmGKcw01gv1emv
         7AdOaIctQhH/M9x6UZJSNwa6NL03GifeGJ/OjNzVMBhZDE4L9DYP4UxSRtQ5wxWiD3Gk
         5h10og/G7rqwAVKLW3hAHZE/SeNmPbe/hDNuemGhte7zHkbF3fe5AIczgV2CyZBBo+bV
         LNMg==
X-Forwarded-Encrypted: i=1; AHgh+Rpxdam1qKqtPaqnwjKLGrIeP2V1a9UeyWTUHpfZcQQX1og8Oi6Fb2isx8+GsQWWPmnLXwTwXhuHpmy+@vger.kernel.org
X-Gm-Message-State: AOJu0YxVcZ4T6sF+xq4i5Tb0w2s6xTyhXw6KucbVa001whVUubs6QF+l
	vMj038s54FJOmrUl/N7hcSvcSf8vuSKQjbILvs79TLHCmTnQcrBdFgdrDadjlLcWLh3voeESOa9
	55VZJg0YQcO0iV/lLk8uDsKcvf8qh1Mv+VGop+QPO6w==
X-Gm-Gg: AR+sD12Dn9mot4kSqu2A54o8VbNQkeMZqzuLY+m5S0Kb4YgEAVYjt2fIeSDhjE/G4Va
	2dqkZtmOQqdN7me+gjmqIFvKoEZp30AzH4+KoNLVB3pgUaB8ltuqyYWx6HM3GiH/EVfg5iImizO
	QaJWbDwmLuRvQBa9keHDigJYI/V49L9Dwk3/3NB7kZFNfODyiOHEz4siMc7szRhaEQXa7NDioY+
	a0yeL2fT8FirIMBErt7VNriV5QoBFFBWW4xE2N3Q2orbI/B4r3Eo4Kdte1NPeFzC1k7Lg7lDWy7
	84CalKpm1fFZ7DfOX2gAtafq1nedEabFHTWhUkyBR9s7omhnDBv3uFb+2pkmRwHvi/JfrGS5Zv2
	y3Xx+7Tg8e9bO0Q==
X-Received: by 2002:a05:6402:449a:b0:697:de29:c802 with SMTP id
 4fb4d7f45d1cf-6a0a7ccb364mr275774a12.18.1785517889487; Fri, 31 Jul 2026
 10:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2026 11:11:17 -0600
X-Gm-Features: AUfX_mwyptmYyOf4p0ZyWTJXkdByXi3n4edVXueGHxTjG-w_nq_PAPMefUUmQKw
Message-ID: <CANLsYkyJ=qOz_7x8igcwkiHsJQWP8JizB4-q5QV5gv-s+e6eVA@mail.gmail.com>
Subject: Re: [PATCH v15 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I won't be able to review this patchset until the week starting August 17th=
.

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote=
:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v15:
>  - Update Kconfig description per AndrewD and Julian's feedback
>  - Enable the GPIO driver even without a DT node per AndrewD's feedback
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback
>  - Code cleanup according the new gpio-rpmsg.rst and sashiko-bot's review
>    feedback
>
> Changes in v14:
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
>  - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.
>
> Changes in v13:
>  - drop the support for legacy NXP firmware.
>  - remove the fixed_up hooks from the rpmsg gpio driver.
>  - code cleanup.
>
> Changes in v12:
>  - Fixed the "underline" warning reported by Randy.
>
> Changes in v11:
>  - Expand RPMSG for the first time per Shuah's review comment.
>
> Changes in v10:
>  - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
>  - Add a kernel CONFIG for fixed up handlers and only enable it on
>    i.MX products.
>  - Fixed bugs reported by kernel test robot.
>
> Changes in v9:
>  - Reuse the gpio-virtio design for command and IRQ type definitions.
>  - Remove msg_id, version, and vendor fields from the generic protocol.
>  - Add fixed-up handlers to support legacy firmware.
>
> Changes in v8:
>  - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
>    by the kernel test robot.
>  - Move the .rst patch before the .yaml patch.
>  - Handle the "ngpios" DT property based on Andrew's feedback.
>
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
>
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
>
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
>
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
>
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
>
> Shenwei Wang (5):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   rpmsg: core: match rpmsg device IDs by prefix
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 587 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
