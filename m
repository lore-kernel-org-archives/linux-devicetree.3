Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794536860;
	b=LGdHck0NWOgX3c9euVeAssWd2mf44Nmp9hJyTFvAXn1XUnRsjmdNuofoP+eGqf5Msi5Y
	 ic/24W/IFSVn/NIA63sjaO+o43KWWx5RFve+1wt3+v5zVyJ/8lkjFiIrdNG4cSFw2+4yX
	 SX5kaizDE1nel9zp6mAcmNKdOtDUTCa8emx2ZGZtfmG8v+wQqLyCVRrvJaqFY8B24HD+E
	 bysrqc3Hdo6r//yGB7LLgeCTiCP/uQ9ImA/f4G0DGt60Hwu19/ovOPr7nHwYtKs3gIGBR
	 RB3TQKDJg7J+gBZk1uVv5FdHxYGEkw2Ecauz5aSgh91f2pL0wJ+jLQp6jxWEKmyMcyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mhmgHqxT9q9D0dhD6vPj0pvXXso4EsLhMvW2R188fnU=;
	b=GQQCQKmHnrCrjnbzVM54MxYzIGl9O/bq0OlCO0gUnBfBY+dpQCYdUxy7zWtooHi+hF6Q
	 7FvnsPHP5R2SAnP3nK0kI1dpEN01c9Hc2odOtZ4pTE7+xtkbD2nnk975K4inkTNbfWBRu
	 0hI896HLZD0Yuj0a4Xc26fKBLG+PJbGMMH5Mp6QXGHwPxlT3o+b15IW8tjXeFJmfhuFbm
	 NU9iJHQDamxwEsRk/K7zrmabTGer7gsQI6TGdnWP6OcMwIgjSXMWDKdZiBD89rRFa5bid
	 K8rJJoK3HERZ4CSB1V9MdxdS/XpwbGQDUWXw+Pjgm1qoYm2/hRnobRRxkf5yZkeDPyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wi9X0uD2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD17C606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD17C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wi9X0uD2
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5066da8aa1so70274066b.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794536858; cv=none;
        d=google.com; s=arc-20260327;
        b=oEmQzjdDvNDzUrlKXlxETZrfA3wKHKTDHkS2x9NMQHA0uxdEmqkP0lvGHAzq63zqzF
         IY7GZUEc4aSUHGTPwWT5dY3K6TESIYhxrTelORgptgBCWrlJ8oSkgQKVSrQK1RhvhPb8
         gJ99YPQ3lXQKJyUIl7M5cbER3qPCYci4Mm5PWHcGh9Mui73V36HkNqsKnY4gAeaW5E/m
         /PPll0/2Vp8u0t9TbPgBuOscNI4wogymXTemg39ouij8zMICwRBbiNNkx25N8Mo5nN3m
         G5nZOQ8wTlyOfO3W8/f4mJk1sN5dU1pkNRhJuQGIto3cU3Ebzv58rfY5+7F8jJzz1W5I
         XsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mhmgHqxT9q9D0dhD6vPj0pvXXso4EsLhMvW2R188fnU=;
        fh=zIwr+jzmIbBT7YggfWspFD3a+j14NcMD5uUOFd681f4=;
        b=faUbQ29IB+YaIS2Cjhf02q/oERgo0vvJtCVsbCsKLUaTuCRvDQTiBAUwvhjPScRs1M
         yQq6O8KYFHawoKS62nHLEkCsA2Cjtpz8IsYLYnwli6hRRk31m+noZk2r+6/ZV+MK+rjs
         wysa+b67nsaR/NbPidC0zuDsxKSAkh/FEAp/GapD67UFGwAULFOGg++yaKIZ/4HZQ87X
         MY/JIngWIY1AUUVvtKD+mXU9u1hEpnxP6mMgJqJ0XV5CSMdNVlukD5KuxatzAWkN7ad1
         WvSPirNa4z9nZiVwZli2IVw+uS4rwfggNEDEIl6APRW7ZB9hlCW1pdn+QXI3JaZK7idy
         xvmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536858; x=1795141658; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhmgHqxT9q9D0dhD6vPj0pvXXso4EsLhMvW2R188fnU=;
        b=wi9X0uD23pyD1hwud2ZUTYw9RLw7zgv2HRQixNQf4/ghFgY7jliAhsEY3WdB5s8p+l
         5LniB4F4Cn/5YKoegW1i7RA91FP86bwpiHaCVfnZHvXRUMgzaL8qf+0w/PoXnwsA1TDW
         bHUK/q2+fSmCNCH3V4JwSCOGLLE8SocrEKSjFZzlihMEuShMuitJ8BRBCp7GJ1fEbbLg
         Piv2YNNY6UyEwojmjTB7RqDOtTGPPDQNrVjiyEbpNKw3iFkqSXn3sLLivRYfnwg90SaZ
         Bg2f0gcsIaEZUYt4FEF8riYyvgneE234ST27Me1UjA6kDF9eiKZOG0RqO18Kx6y776nv
         O6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536858; x=1795141658;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mhmgHqxT9q9D0dhD6vPj0pvXXso4EsLhMvW2R188fnU=;
        b=eRxQWhW21COdYZ1rF9le0SnX47tTVLdcK0VgZc4hzK6qGMWcNZB2BJujUzHWm32net
         3nllFHhhszzwKJa/5Vyn3gH4YdvCgPhrSaoK1vPiPH4ZMOuxQ7HUNXov1v72uVuRp0Si
         AlTjamsfin/6K5UwaP9ohG85skynJm1xyNwEOFzeP6EfCGlsZiG13bg1EcpqkMJpJrai
         0TKwiTkBRV50Qoymuh+bDdIGZXqLirpOx10FUceqmJdqaSpKJTrl+HsJHwWYBJWItBus
         n9y+VIvbVlFBVz97VsN7d/0nSl7ISU0g7NTJCyNsTazke/WraapskpGhGEkCUaSjKMWk
         YizQ==
X-Forwarded-Encrypted: i=1; AL+hErFMwwEy2SRo9NjvNGSMfoMZc16DRIic1i0J2ecAon+G5oERWOUB16icuYFhIX69SpTTBECNcFdl0qOi@vger.kernel.org
X-Gm-Message-State: APuU4Z+mShRoiNEkbyTk70S71swSv/GRLTik8l4LdFlnEPrLBQpcseC+
	jHnrUXS946dflsAmjLVDhDYVgHQ+WxG/4AK8CBWbc/Plyjvd4DyVAAi4KQPhdp2yhdLFVnzNfA/
	3HGkrSfNckFYLmEWU5R/m27Jl882l7fk=
X-Gm-Gg: AYBFou1eamMtIfqbgMt0VdHFpNoo0DdBfFgEnZ7urb1Usd8ETHtJ48nJHiujLiZ4VR/
	j8160BeCiacUAdNZjeIk8uMnopb7ue7jFg15krG4uZk4fKVlAgRzp+td3YN/31xQnrvLvQEA5QM
	6QUUVS1NI6eYei/gyqA2Qs6FJrKygg1oVWE7inHIJXvbUdLjjIlliuC+DMnmrwVu/NSakhgsKYc
	l6JslnlwhGQ+jGEbZMnwxfH+eIcEncJGcF2OVM2zfv8m0KwYmZcXWdiq+k+fH3yMk5dousaalyS
	P9nBDMEvPziccU+L2yVIW7wvLqivL6NANKl6OG/nPbk9W6+2Si1Yh8fdzJR5Un60gGje9meBeBS
	nhw+cBML4xMYzeULJgnjJGfCHz0S4sSlm/5j9EP3aPdOeFwarZCcfTKhozEQqU9f7Md+M
X-Received: by 2002:a17:907:3f18:b0:c4d:212a:192a with SMTP id
 a640c23a62f3a-c509642889emr75412566b.48.1794536858155; Thu, 12 Nov 2026
 18:27:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 13 Nov 2026 07:57:23 +0530
X-Gm-Features: AclHuK-5Jx0NaJBBJK_E2yE52SkSKOFAgAmYCFNDkDQigjVyP_umucpReQmSj6s
Message-ID: <CAA-+uk+=kkeeH-stjS_8=Kgw-m7rxxXoVR2S7UW-TP0gxEktEQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/8] Add initial support for Qualcomm SM7250 SoC
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Sreeshankar K <sreeshankar0910@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 20:45, Sreeshankar K <sreeshankar0910@gmail.com> wrote:
>
> This patchset introduces foundational upstream support for the Qualcomm SM7250
> SoC (internally codenamed Lito).
>
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
>
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memory.
>
> >-----------------------------------------------------------------------------<
> Merged patches:
> dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
> soc: qcom: socinfo: Add SM7250 SoC ID
> dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible
> clk: qcom: rpmh: Add SM7250 rpmh clocks
> dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
> pmdomain: qcom: rpmhpd: Add RPMh power domains
> dt-bindings: arm: cpus: Document Kryo 475 CPUs
> dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
>
> Pending patches:
> dt-bindings: clock: Add SM7250 global clock controller
> clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> dt-bindings: thermal: lmh: Document SM7250 LMh
> thermal/qcom/lmh: Add support for Qualcomm SM7250
> dt-bindings: firmware: qcom,scm: Document SM7250 SCM
> dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
> arm64: dts: qcom: Add SM7250 devicetree file
> >------------------------------------------------------------------------------<
>
> Changelog [v14]:
> Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v13-0-355b65c6f764%40gmail.com
>
> Link [v13]: https://lore.kernel.org/linux-arm-msm/20261104-master-v13-0-355b65c6f764@gmail.com/t/#t
> Changelog [v13]:
> Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v12-0-57fbe9eef978%40gmail.com
> [PATCH v13 3/8] thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> > Switch to match data mapping instead of hardcoded 4-4 cpu configuration.
> [PATCH v13 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
> > Add 6-2 cpu configuration LMh support for SM7250 SoC.
> [PATCH v13 8/8] arm64: dts: qcom: Add SM7250 devicetree file
> > Place the nodes in acesending order.
>
> Link [v12]: https://lore.kernel.org/linux-arm-msm/20261104-master-v12-0-57fbe9eef978@gmail.com/T/#t
> Changelog [v12]:
> [PATCH v12 1/6] dt-bindings: clock: Add SM7250 global clock controller
> > Move dt-binding definition to qcom,gcc-sm8250.yaml. The device tree
> schema of SM7250 matches with SM8250 for clock-controller node.
> [PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
> > Add LMh compatible.
> [PATCH v12 6/6] arm64: dts: qcom: Add SM7250 devicetree file
> > Remove cluster wise sorting of cpus.
> > Add LMh node.
>
> Link [RESEND v11]: https://lore.kernel.org/linux-arm-msm/20261029-master-v11-0-2c29e382162c@gmail.com/T/#t
> Link [v11]: https://lore.kernel.org/linux-arm-msm/20261016042432.824-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v11]:
> [PATCH v11 2/5] clk: qcom: Add Global Clock Controller (GCC) driver
> > Drop hw_ctl clock branches
> > Populate default values for GDSCs
>
> Link [v10]: https://lore.kernel.org/linux-arm-msm/20261015051926.13752-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v10]:
> [PATCH v10 2/6] clk: qcom: Add Global Clock Controller (GCC) driver
> > Update .halt_check and .ops are per the review.
>
> Link [v9]: https://lore.kernel.org/linux-arm-msm/20260901092447.3028-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v9]:
> [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Make all clk_init_data instances const across the driver.
>
> Link [v8]: https://lore.kernel.org/linux-arm-msm/20260901070717.20513-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v8]:
> Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.
>
> Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v7]:
> [PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Fixed missing (struct device *dev) in gcc_sm7250_clk_regs_configure
>
> Link [v6]: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v6]:
> [PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Make all clk_init_data instances const across the driver.
>
> Link [v5]: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v5]:
> [PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> > Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> > Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
>   to one item per line.
> > Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> > Move compatible property to first.
> > Remove clock-frequency property for timer.
>
> Link [v4]: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v4]:
> [PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Update .fw_name with .index
> [PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> > Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> > Added power-domains for cpus and apps_rsc
>
> Link [v3]: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v3]:
> [PATCH v3 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Updated the way of registering critical clocks.
> > Made some more clock critical.
>         GCC_VIDEO_XO_CLK
>         GCC_CAMERA_XO_CLK
>         GCC_DISP_XO_CLK
>         GCC_NPU_CFG_AHB_CLK
>         GCC_CPUSS_AHB_CLK
>         GCC_NPU_BWMON_CFG_AHB_CLK
>   These clocks are flagged as critical in gcc-lito.c
>
> Link [v2]: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v2]:
> [PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
> [PATCH v2 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> > Added SM7250 cpufreq hardware
>
> Link [v1]: https://lore.kernel.org/linux-arm-msm/20260818080754.4362-1-sreeshankar0910@gmail.com/T/#t
>
> ---
> Sreeshankar K (8):
>       dt-bindings: clock: Add SM7250 global clock controller
>       clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>       thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
>       dt-bindings: thermal: lmh: Document SM7250 LMh
>       thermal/qcom/lmh: Add support for Qualcomm SM7250
>       dt-bindings: firmware: qcom,scm: Document SM7250 SCM
>       dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
>       arm64: dts: qcom: Add SM7250 devicetree file
>
>  .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   13 +-
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
>  .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
>  .../devicetree/bindings/thermal/qcom-lmh.yaml      |    1 +
>  arch/arm64/boot/dts/qcom/sm7250.dtsi               |  803 +++++++
>  drivers/clk/qcom/Kconfig                           |   10 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/gcc-sm7250.c                      | 2278 ++++++++++++++++++++
>  drivers/thermal/qcom/lmh.c                         |   84 +-
>  include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
>  10 files changed, 3332 insertions(+), 24 deletions(-)
> ---
> base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
> change-id: 20261106-sm7250-e9ced14be130
>
> Best regards,
> --
> Sreeshankar K <sreeshankar0910@gmail.com>
>


Hi everyone,

A friendly ping on this patchset. Please let me know if there are any
remaining concerns or if anything needs to be updated.

Thanks,
Sreeshankar K
