Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793019482;
	b=ivp5xNHuM+3EpO5wd89yZJja87v22RhFX2h/O3XMsjXwsHWjzk986ruHKmDzOJf0LQ9I
	 1HFhKk+CWEl1WNfJa/cRbWIto9baUctciFqiZQjFepYtL+YWKcwaYcGlLtRqMxzUaTIoz
	 jgmHmCQAMqJAjbs+2mwar0/5VjZZsy9AOrMeq3egouwU2TcuP1Sp3glV3KBRs7ahvmxlW
	 HKdtvTARlFTMyWA9GM4/bl43jI7c4ax6qOzPTmDSFUCNiLHZ7ZJT1REfg3rdC89XoCluG
	 Me7AMXSxidQ/pOLatyAt51WkqK9ERzkaCQCNGEI09LcTAr7tqEMUdOZMln6yTaPyX+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
	b=SzBxvNFvv//IW8NA3iliBRK1Zf9z1zZKcFcmKlKwlglAalXewJ8o1L6q+eIsKaUJUQek
	 qJJNBEG5Mc1apQtD6hRlLBqymLgHL3n0x8RGoNSikSPDb7zOXE7vkLdxDZsMQluZhb/U+
	 Fma9bC9mnDt/L66J3MRomH5b21a1mnzpss4JRwaocagVaPOP45O0rdgmeYMW26syiuAtq
	 2wnwjwiN3gzeDWCH/UZ+hnBYzqI9D+NBsCtYdbr2gpqofMy+7JFW+21jgiwZHtCnZphVc
	 r/IIDTRmbZMYJWslU5bsgKDqtxk/PRl2EFzFu8vIGSTj9ljGXGbVSJbJXXlRx+/CxPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqO1lUQC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6130606A327
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6130606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqO1lUQC
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so410568466b.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793019480; cv=none;
        d=google.com; s=arc-20260327;
        b=ZvUcElOfLNqX4rlKM68YC5vDLI77y/FTeBGrF4awdW+H9lAPoah6ULh150S1vV8pl/
         x+x7BG1RbenKnrGt3BnMdtwRseFr45NjBTD3QEb1DlZZRNUY5Ly7U7Eaig2jNGL4nUdA
         XLXWpTD916F0kOIzLdEASgYw6NXg84RWzHAHqqtbGjypq103kH+QZIMwGQV9BRt9ks8b
         27jElrq0o/+Q8R6r4AhU9poYJx9PKE9mMhr9h55wbQAgtRMnQVVBn0uKsROX8ACfmIhO
         47LHaAV9sm/OmS8vvmqqO7yQUaibdTdPfPtw4UkIEnSJ7QLMInnNRktrSnW4AKQtDDu4
         Xvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        fh=5Luau+FHLEBneFbq8llDdq6e3TnE8lhepFE44yWaUnU=;
        b=OoqLhiZwT+6u+JL+1eMjMDw4U4ANjW3a0SYj6pmZPNAT7o+GnRTgwL+geq/uz3bd6U
         mgXrzPWSys8n0ZWmg0xoJ8amPFJeCnEgn8ILgjhLjR1b/Sr03dGZ3Wmmzh8oc1epLZ9i
         ndJo8mcbhNx76Sf8c9mp9ouTSvqhKMe2LvR0jMLdcKfM9/SOWlUWJc1GDsCKSxel5Ysr
         XrLy3KxLpJ4rDObvDuUs/6V0TmJDrTkY1wdSL4vmhDHXzlUaLSGJden+bNyv30He+UM6
         aD9lDoXftriv0zAIOCA6txW4/SSelbPD6+jxd1TQuUfGGUOhh5l2CJWA594pzfjoJH6U
         IU1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019480; x=1793624280; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        b=VqO1lUQC4/ZB86Bob7PuaqandeKM0dkfftYDf5kB1TzT/vAYMZe3lWFJmSvZDNQ2p9
         sDs/pmOD9xySol00LCkT1+BYr+oRmPmkkXNiLVRP6PmngB72HdMm5g/SZzk+u05QZrCu
         dwTKE/BsTEwIbISZ1/SonNGe9z5faC+s6z1Jaw//IB41QqG1RqiHUDmeu26WlXOt7fbL
         m5pscN98Aazfrf2wgOXYqTbTd3iEaeou3IvdOMut0xwuS7UcIdRKxvYt+4f2c8tojo9g
         8aPAA+x+JKtNX97Dq/ubP+/3fbU7CMAUbo4Ix4cYJ0fz/o9rvSxc3VtFQJlOuo3W+3ok
         8StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019480; x=1793624280;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        b=zZbRQ2gXjZQGYEVsn+RmyluGb2CJYCDvhQSMlVKsc/snd2dYGysd+3rU9unDTAybH4
         3CsrYbcwtnpm67EI5vAoD2R162jkqtEwhlxqsx6mg5acFEjSyAgpTiAlNU56Trv/ww20
         yZvT/nUW3fgThTfXBfa8BPgB+aoGyFSqiF6Rv/pGxNRzQCXigYR3Q0j17wan1UKjH5o9
         CZ6SKXiMOQzsir2tb11/E2CZfmhYhxBztHHJMvBpNJ8mIeess2bgOgf5MJcb6QmcY3Mn
         pouF9dhhvZisAxo4EWNs9GfC7AwxhEGtkpcHVS2IpleGrlCpmyWsHmxgYPHeyOb/j+fu
         5jcg==
X-Forwarded-Encrypted: i=1; AKwUvBx4Erj0FmcN450/3e/tm9n25dOletMfObdNd2uELTsxcHipny3XyU3ohzYJk0zTWDChVFxtPykcm4YD@vger.kernel.org
X-Gm-Message-State: AFq9FYK76XVEeSpHvTG6xujXMvCpnKbP33qQGq1tSml53sU7aPWFqaPb
	o/LsMW3LUCZV7nwhp6JGPjU1j7JfyAIvkcIlFt5CMSSsv9rjH8D2f3DGp33H9JCiOl9xocnEihG
	dl6nJ6R0OkXNIRtzqFyM1eegY4wgmRDE=
X-Gm-Gg: AYBFou2hc8TeTExvP/WRiXOYv7Tb3jhCxc7HcJOqDsFUfMS8iUXgYMIg9cb44rKqEnM
	pHzG9bnzKh3IN6M9nE7pFBjGxSSz2pWH6IW7HNNs3+RFfIVq4/phZ6f2QWIsm6YFSQ/ySpDUGU1
	NV4qmwDYxWw6nWVI5hegiWL9cLYbQjIKCYVduAHbUWNclDBqQ4T/jyVGUp26KmifXJyrGhHXAAH
	uggCX0l1TL5Z7dmq06MLMVwKnoauHuQ9FulH6es07YYe+ta2UimfRsqBj0XGmF9bIpRNmqoxG9s
	BpbU12vCStr++Wa93RbU0oh8gRsrcOu9ykYC/lSnchj2tQyGAI2MoS3645nXBehI3jAplCGKIMS
	0pQailoB/xERd+DKKLkk2FwgOMsnDcDLZtOG4+12Xk2c9bkJZAzIZpDMyiIwPtfdJ2yP9z7fjAJ
	zl8d+Jd7M24qaKRpGFEXfKmfhImPA=
X-Received: by 2002:a17:907:6e86:b0:c3f:c878:7c1d with SMTP id
 a640c23a62f3a-c46bddb3308mr817681666b.9.1793019479919; Mon, 26 Oct 2026
 05:57:59 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 26 Oct 2026 18:27:48 +0530
X-Gm-Features: AclHuK-qVOdu5LbOqp6_F0580cdJ42kSYQZoFTTe2Es-FxZ1SlI0qmd8PhmgExM
Message-ID: <CAA-+ukL=H6W84__TtD2C5oxbRr7jgsDqOj=2KN4rMtJ6wBgc=g@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] Add initial support for Qualcomm SM7250 SoC
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org
Cc: danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org, 
	robimarko@gmail.com, linux@gurudas.dev, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 09:57, Sreeshankar K <sreeshankar0910@gmail.com> wrote:
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
> dt-bindings: firmware: qcom,scm: Document SM7250 SCM
> dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
> arm64: dts: qcom: Add SM7250 devicetree file
> >------------------------------------------------------------------------------<
>
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
> Sreeshankar K (5):
>   dt-bindings: clock: Add SM7250 global clock controller
>   clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>   dt-bindings: firmware: qcom,scm: Document SM7250 SCM
>   dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
>   arm64: dts: qcom: Add SM7250 devicetree file
>
>  .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
>  .../bindings/firmware/qcom,scm.yaml           |    1 +
>  arch/arm64/boot/dts/qcom/sm7250.dtsi          |  771 ++++++
>  drivers/clk/qcom/Kconfig                      |   10 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-sm7250.c                 | 2286 +++++++++++++++++
>  include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
>  8 files changed, 3236 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
>  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
>  create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h
>
> --
> 2.43.0
>

Hi everyone,

A friendly ping on this patchset. Please let me know if there are any
remaining concerns or if anything needs to be updated.

Thanks,
Sreeshankar K
