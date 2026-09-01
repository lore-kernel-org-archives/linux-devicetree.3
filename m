Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DC244062F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279732; cv=pass; b=OOlb/ee+0c2CutGJpJCe7MFTRvjlFC/xaTmznycTjwzNLrDSMHHbBDaNqf/VkC6J4sHqESpOrfFd6ruSIPo4udJnFY71XelNVm0kyLArA2DdHBbWBKgv9Pvq2JHJxEKx8fDgrlFEDFqn8ljpC9lo1Bg3TdzHgG8ZWyUjKVOxsCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279732; c=relaxed/simple;
	bh=Zh9Qo22DVdgyIWE9/JgEgDmjV2v+axogH4c+ynR+9BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brf66rXj26MkXFr7lkuHcI4Ht4v5pvPuIiRAwWW1rvpbRddS9AgYaRxbq6rX7i2H6k2WMR2xXO8ACOBcQQi58BoN1M7ojFyyXruuHQt4cOf7KrqZn6f0+o21p1EbmxrxSRg3eQrJCiGrGIyuJgnWhH6Sg4aBf1d46IPiwjdsv9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVrFmLqc; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVrFmLqc"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2530cabcf4so769824766b.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 09:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788279729; cv=none;
        d=google.com; s=arc-20260327;
        b=PfL3XEbOExoE4/fXLjK91LUDOGSsF6FK3mGmp2/wSTy4wkz4yJ3fGcK5HJiPH1ZRPK
         ubm01Lp6GYxkfgYE6Wdi6zsH7HLqE/GdCL7/D4qO2DjlQ7R8ohPik0hBeUnpozvs4d1T
         L9ituuPjp1+SeIB3bZmCQr7IQSjZsgDqPR/QOsBmbnuwGCihLWojIIwseo95qYnZL/AE
         z9i0hC13KNTJlKtQhuOuKOraRD5Y8vCZxTjYQBxYjLxWW+LouASNrSvwzyW79otUEauV
         2UtvUKQBLr7UI8aRHGarl2enMsEf4u7dzArBmD+IJmpd+usNmLv3X5VxRVsMtpA7Fls9
         bxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        fh=OJLcZQtkYLuoG6ZcdrIl7FwMPYW+nWQaUcQxr1bfUvA=;
        b=dEca4tjXeVFM8s8EELQxkAcQXd2ej3cKFeY83aW8LWwk+ROs5pm1jlcw4EgrKAuRN2
         Q8QcfibB9zGJ7Jjsbs9gJ2FNGW8Ih8CXiGd+a2jkw0uZ5Gf6a3G1IPpKeOUEEr/xX3/P
         6pschQxsmVvp5uBakBDDixn5GYukTVibzcNU+X1NSL23nhpFRpZUGLvufwNs4KyHNz1i
         ypdQLPAOiY1LfB0HB+I3ce5T6syWnJ3+6+fVLBXfXBvfuqtp6a0CL+LR5ug6ptVeG1S5
         nOS1MSTFZ5It1FlPnLJJUrySWIzCpzvqelxDo3qEcGbY8Oeqr6myP0/TD2jpJ40XP4lL
         Fgjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279729; x=1788884529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        b=rVrFmLqcP/25rlRoRXtjiedV7T4N4hODM2cU6Ep1ojhMUJDRoEyu/7YGgTeF6sfrfw
         2ihIUl6g6LSTR59t2HrqEEeBpT/JdkSyWio265iHlpmFu3UPy8Lt4X4VjxsO3w24ZrTY
         2w8AMtpbh8k/PGr1huQsXYbENZtS29q/7dQ8FWqheoyWfYrChkGWMGWGJj2gSAdwhKiF
         TjfJ8/1VtG50+CBNY9umIUarJqMywld3MHG0ECsWY70eYtgcp4jDHg+lZUVglRPjO6aJ
         ktlbJ1SVHw9TdZkIm06pDrhx+m05zs2LGDURPL76lXdUDXSSEen1n9wAoa/ap71VPymu
         eIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279729; x=1788884529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        b=hsz+a+5ijr3v9WHpYKZDWg1DuRFw/oUd68sAB4iIO+S1FBwMnkC6qoYyMaDMWRUImm
         oHRwKh9t7rx0cGkR4l9nAqOzwl2/zsQqYlst+r4Bd+JDSTMOWSkeRDcxxvE8Y2NkviJ5
         DDO3UGbyen09mtBcdbYnYS2SArD5TslRcsLGvvWVE/qdQssRCGADiBBhfuURDDGCGGlA
         JVhDS1BzLb2VMNcMBf/S5ck2HNDZM6akXhEmcy52uWZHFGqw4VKUnAvcM/E3cpOmmkeh
         epeK51GdIpmTZnvOnC1il3FQASjD1MFLaqBbEVgvrmTjOHXt+dsnIAQ4ew1dRVatftcI
         Ef0g==
X-Forwarded-Encrypted: i=1; AHgh+RrKYkKefpptfLiZwjknLHjhzLupzWlsMyI+Yu/qzXPg6eUv7tZ4GVbzz+Mq2P9B+hAk1bixB+ZaQ9ow@vger.kernel.org
X-Gm-Message-State: AFuF++kYnb4+3iPEzbJ+MtXDjXG+hR9P5r82HGdOW9YEDbwEMKg7nbqI
	VEFeJLcI9r4Aq7uFHpVtbxi28ax4q+zp4sMQkyraryWhEC37UhEK43yTNEXuygbDq7xrdcp/Sx8
	STCQJJB0x4f6rPqhPFxYzXIXyhGIzmCg=
X-Gm-Gg: AR+sD121lGci55b8VrG5UpPkxX83RxSzsySIswezNCAFMUmcbc3D9t1pNz/hBElusDE
	Suiapr7xyglVCHKec+xeKgP76yovMcSiCjSNi3h0FQlBTKgVgoWD92DRgfJFQWwoYTBeG/wsWm5
	Kj1TGaIQIR6LIGiRW6qMwmDsOo/oJmwnff9/Xjb9gbWdgiWbtUi9SS9QiQ+14n2qHtybwQXvIr9
	wp2812wxlguO+EDR28sRAOqjv7O6E9bWtc1pUUXGn5J7ykDNT7PtRSfR6rd0FGFOgPahyWNQvXY
	sgXSEGf66QR0qJa1aoWzak2r2J/B65oCkJ3AeQ60lcfi2S65y4LBLCIgUkTMYN3jDoYMR/naZNs
	LnCMMlE2AFmpLA1MT1mPAkSSahKSOEfILFBI=
X-Received: by 2002:a17:906:c108:b0:c25:c979:e76a with SMTP id
 a640c23a62f3a-c25c979e7fdmr216147466b.22.1788279729382; Tue, 01 Sep 2026
 09:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com> <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
In-Reply-To: <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 21:51:57 +0530
X-Gm-Features: AcwNN1UgmlzLO2QtgDmTIhpoG6ElFAFHl1rN8oIvI-bmMKMW8f6_U29Z1lRdz4I
Message-ID: <CAA-+ukLdb_98Fx8PCNesvg_-4BmCcU3jxy8QTL1-a46MCJu2ZQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, taniya.das@oss.qualcomm.com, 
	danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org, 
	robimarko@gmail.com, linux@gurudas.dev, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 21:16, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
>
> On Tue, Sep 1, 2026 at 11:25=E2=80=AFAM Sreeshankar K <sreeshankar0910@gm=
ail.com> wrote:
> >
> > This patchset introduces foundational upstream support for the Qualcomm=
 SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featurin=
g an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cort=
ex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, P=
DC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved mem=
ory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-kr=
zysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > Changelog [v9]:
> > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver=
 for SM7250
> >   Make all clk_init_data instances const across the driver.
> >
>
> [...]
>
> Patch 7 and 8 applied for next, thanks!
>
> Kind regards
> Uffe

Thanks,
Sreeshankar K
