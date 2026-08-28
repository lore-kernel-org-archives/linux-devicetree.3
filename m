Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB483B4EA2
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912098; cv=pass; b=ON+NmnOhX+khrqqoMMb0UOXmBFtChVD8PwP5ELDQ5hu3QAvieBHwVHW9OdXP2mA5B92tZ8oxy5aLq5Pb0lJ/F3gVCvDSTOm6x6DObE4r3rSw5kewAkcfibMefoUgll9rtGPVHGZaxkVSt7tN9l8kOyDf22HngvPmU3EkpgegVTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912098; c=relaxed/simple;
	bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcd09BktUnhDPm+AcywNRRlL4nsvkZ4SzcZwt8kpEUQI0MKDvklakWLFL0Jv5S6RPcjGQ3921PuD4Bwrfflv4xko+h2pP6sk0u6ZrfE9XuD/3uLOIcWlTwXKK0UZoo0r2ih9we45yoYnj7gNeFrv7HySZH+q91lzoXqeybf5LuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no6m/T5B; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no6m/T5B"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c252e703fa3so125119166b.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787912095; cv=none;
        d=google.com; s=arc-20260327;
        b=mkojwAbbnaHqx979i7dCfk7J7rhBM53UjSDb3tEMz3oO3arj4xuBRumj1hze+nCRlC
         XNFEfJcBmCFJCfP/ZTeSx2cufTnLTo0+mZvpfE3abql8J/RSRjfWoP7xY7ekzQcySvb3
         mLbEcH1qzL5DNOKwUNvptMcVlptjoKRYjbwNIsEXaHQ3a6RVgoeZZYiL/bHtssb5TN/O
         vNjtgdCYTXrmJbM/A9/Gx04rz3hpnZoeNAlbHJ5hNymtEmPEnvePaoIQM+gC/DIPkFEU
         y/GAEGgsfjS0D09d3Vk+0OmXaTthUQYumHTPp96wuXrG0EBJl/bObldU1PgyDx5ncfkF
         WVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        fh=2uaBnbJYwhjNORk7Qb5q8uuO757jarg8iVo35i/ypzk=;
        b=Lgsf9I5MpFQzVK/uQWWNyhmJTDDUB6VU11Oe6FTFYx4HRhuCwqHKhJqsmXhgKMbxMM
         yUw8FEYeFuIb8DXNMubHVEIgnfyDQ4kw2HViEChc4FdRmOdpNTqtgeYAlO19+XC8n0zZ
         JZfGODsZ2Kd5FMHMsjQNxhOp8BMQBREYEfA1COBIeah4tX8YAhEfOQNOagATMF8o/lUn
         +30mJlzMX4ZJ7HzSxuwo+XiYiC3KSljPrwlXiEyO99Ur1FJVjPAMpjp4jy1yxQCeXH6z
         ISAtCxPfLn+dSJzpPPqbaBWsnzdjl56Xy5FZwwhgfJw38vFlq811VmJIpydMIrj/UWHd
         Tmhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787912095; x=1788516895; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        b=no6m/T5Bw8c0DLSeM5A22ornHVbSjgkRZwqR3U2HtV6WyaEpB6lcmVAz8OpqsWQn6n
         k0UFY2zZ+AAFgBlq19ptPsX5aS9Ed+lv5FaV0kFkHNi6ULX9Gz7jhCFDC8vZBR19Km12
         gosgw/9brnv0PsIRROiroFwImYB7XEyZnDc9Eo2ietqRa6WkoLoRLBBn1TrzWQYL9y5n
         7hJyzBgQsJbv87gqIiQjdo4yHX+TCZ3xBEN7KehsnhAq37TCpJK2KOuJ0NOnVsnKynq0
         zdQZ42ESzDOPfyH58UrNlbXf/pokJRApl5inRFNmWRWZJP/gF+LHckYfMy3wyAwuzNQ6
         SPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912095; x=1788516895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        b=dJaBW+junRW5K/VIwsGvNOEHb6YGU5JG+67IEX3hKlTb83ByoWbR3EuozlSpww4Bi/
         RBJmF16xxPEm3rutM+rR8OKK41xQJdPXAe1/Br/IWPXpyTtv4Qe97490edunfuapBGwx
         YgHpsDD36hxyUlcTU16hGs653jHSp0PVSUv4U2e9EL+xT7mbE6/ra1lbS7NSHZf30opw
         NnhL6vIzthLaHOuS9nTKp6kltJT0EB3AY8mVO7+QyO0HGtY7vw/l5z2KfHRdMOVr4FAx
         dxqD9LaRViX+/DA62nAtE4m/qbMybldC0JWERZ3xfBmgc/2vyqcmFEclj8q01rMJztIY
         4ZlA==
X-Forwarded-Encrypted: i=1; AHgh+RolaTXNJHibRltxwmMUxezJbBNivJQnZC9JW5x5ExX6ro1I6iviIgJozCVMFTkNzW4OmKDfRFASmr60@vger.kernel.org
X-Gm-Message-State: AFuF++lVzi3/0ZI6gH6NtZlJb8U1j6tovyV73yC81LXKsws+4nO6S2RU
	fdS1M23G1YD7Ya1qyueyRQi47uI/lxNF/WWS9wNeSLUZilQyTImLMgvkIuOKee7TFOOvCw/pT5j
	8C7lKmIYOeBLDTc2iZ41Vk5vW2KJpwNk=
X-Gm-Gg: AR+sD12MQx/IMy5MF5dlkIsr3cguw7dXQrNKLIjUIv13hfWUAMAmEqSUHc3ikffiguX
	F+gcpPVH7wRRqBENo6MwX46aqpqrHxsM0DSZPlgb6bwE3iR4X7Bxa20OqZtpu9qvITKnV9zJBTa
	XtTSOYbRvUBIbuEbMT5Mwe7n1d8jWjo4SpAv2+kjssuPd4iFBKd9XHnTKHedE6QvQiYSI1y9eWW
	vyg9smnl8JBtCs13qfeMlB4YJGhLOtwh5rF9O7/zpkpIraIP5Fq4QWPevjRubwI1OLT1zlSig42
	mc7HYyQxf7NPZql+5cdoIJ5Cd9xatDbgZV3MpvlkVzr4I55ujWpgGzcDQz+AbMchedBRERRlsk4
	FvXvf
X-Received: by 2002:a17:907:d0a:b0:c25:32b0:e56c with SMTP id
 a640c23a62f3a-c2556bc8abfmr482808166b.4.1787912095085; Fri, 28 Aug 2026
 03:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com> <20260828-liberal-jumping-quokka-cff4da@quoll>
In-Reply-To: <20260828-liberal-jumping-quokka-cff4da@quoll>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 28 Aug 2026 15:44:42 +0530
X-Gm-Features: AcwNN1WwE4fV98-9nbf9QfdMe5RP3mFos-H2h5xcNNdmEyy-SXjW6DtC1QoidsA
Message-ID: <CAA-+uk+5zWvmTB5NCbWpBqHSw6MswBAaJHGHw5LnKm4SBhXcLg@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 15:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 03:01:43PM +0000, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved memory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > [PATCH v5] Link: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
>
> Please keep the previous changelogs and links.
>
> Best regards,
> Krzysztof
>

I will include changelogs and links of all previous revisions
in future revision.

Thanks,
Sreeshankar K
