Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D103D565F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267174; cv=pass; b=stGAG6xnjTdyvRReJda4kx9Wtv50FFPvwo1b0wfj//pIb0hI9w+7Z8+63WO0Q4/T+TiTt+QOHMfFCjSPbBpSw9AgGWRmfjdBNPhHYKRo5IWpspXYsLxSwCyZwKAwTU3maXSswWCMMPLmWPUEbF44lyYUMkrMC1JTAB5prpnkBIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267174; c=relaxed/simple;
	bh=VG0JGy9V9Ess42oO7HJ1M9+yUlNIwa8iKwJ+GuLfhQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPaUa/voC3MHHMlJPws8njSIhFg2GwqbPf8B9A7fZPblN/GT9DdLVGLc9ud1WXMXawtKk92IJMxWCTDICY42TcORYvw+qmtw/ZfR4Q+D33sEPi8RJmP/r4sWGo7wHdqi+bJfKyITUEt8Lbp+vSRqExJR5MD6rz7hGEqNrtOEKc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APws7sjm; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APws7sjm"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1466826a12.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788267168; cv=none;
        d=google.com; s=arc-20260327;
        b=haK/Ur3nuCnkXLrYN5bSVwBk6BxL1/cq+MVvKyyVxCZGEYnzrghrodjzR5ZZt+TXPU
         ifh6G60BlLgtibAeK92j0ndNIUk7wRGGi8ufsw+1WnFzvIfiLrLQqSYwx/xStjuXU35Q
         bmAYuHVDfUGD8yGaK7E+HA50qhq0+49o68eCSkxmL9Y6a46n0rKROEpMwCWIwd/HjCpJ
         pxHnPO4zYhqCdspRurp5ZIFTKUvc3ZK6GMNoScPyRObIajkW+UjNU+nx0qg/Z8Kch7x9
         6mPp8wkKL5rrIN9CiWObVyARm9qxlyMq1m4IAowpqtAx+VaPhAAbKtllhOQH0cPQaQdU
         qpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        fh=TjKX15SQ2X44okW8ezg+ngLPiFX3YYoiKeaPUooGAnI=;
        b=i7cGAcS9p1EC0BupRBKySNrT5MFbqONY8WbTotGWXIMpVnQwJ5DmjxgXTB2wXXSEXt
         Rb+tqme3XEEk23/wn3bbE5SQFqEyjvZ/fu5m+4YW7jqIzSXXRBlZmdZb02XAw1RGBAfp
         MMHa3lVIfySGXmzkOmbkUrMye4fwz1RElt2QcmBjgoxxv5/hAiIcrgFne/1J/ym1oX64
         SAbf9eSXYFLc/sLFu4I0vT5u8plbIQjeK+WSzaoW8f1otGQY/RdrbkZmhBtkmut16Nls
         SRnu0Ywe7CZi4GeV+ozwa68Tta16vCkeTyPpo/bATQh3o6UNZhJhcbiy3YjwtBuyIAx4
         pjGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267168; x=1788871968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        b=APws7sjm7FGRX6eDqzMDTJ6cLbEvx5rf0JczDmKeh6lwitsuvAm68EWNBoHlcj9TZQ
         ryXUqotI5ZY1D783wL43Eqz9xwj2S9Ho3jCdeo2in8E+GMEDFdRa69LUAnc5UA2KwjzO
         HahJHGS0h7NSTdJ4fTQJ4AikeQWZihGAZwL7nEDnrjQNo0/3+OGPHFPoKh/R6H8v2k79
         YnnjDF3ZMrcQ9gfRiTmtODyPPoNCMiEcaDb/1ZIhjPr9an0sNK5/TgYfz8BsTOleITAt
         VAzFDN8mZUuUIqK6xijgMDpq5UXwiKPesyLA1o2p9BmtRoaZQ6OtUiOMcDt2p5o5Q7GA
         cDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267168; x=1788871968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        b=c9y+jaS+UnXp+E2aZIvZBAQg7xSRyuIvUpEyI2ziEkq9iTZ0gv8Ygym56spMxteT5P
         uPfQu9JY8YGj2h7VJ1qTp/I7aR//39nfDs/SLU+JeCxnQpCn6PzzhzLLnLYewwduoG9D
         llgGeb80izlQflhwakBy/b0xIzFJsWNC3Q2K5z4brCgfXnlVtB7QyDeZcM5qauqqSSms
         mQSu891wbiyxlOC6OSW47/cWRSqHRbijjhuCTW9n4Ex8tCB8PSdVVjwL99y7LqaqfzYy
         iWuMCxTcYKV9PbpqUG0G82mKQ6adDuLUlLWyl/EjgUsJ8Zt7zpw7rZP6+E8xF2x0m2Pi
         xxgg==
X-Forwarded-Encrypted: i=1; AKwUvBxnM+GcfHjVqpFagcUleAjqlpAGZknbIubibpUKSP9Hn5cUZdPvKFPsiTAJyJe7XoOr2MjQI32yJ+w+@vger.kernel.org
X-Gm-Message-State: AFuF++nn9aY0moqOCBqMjF2F8dSmI+WIKtPBpHHr/WnaCKsdssuBG+Gi
	Nc/IW5UVlm721rQ6rYkDTfVlPPFYY/yHztWSP1gLStmd/Gjr1P/siYJeb/P5BwMOC9yU8+vjEji
	vtDWozi/2QtLmhRm1AMOOwg93euQ5SCw=
X-Gm-Gg: AYBFou049FPwe3uHxV0EP1jQzLkjaeLNZ9K9eHegrOP7mYZGIXFvuX3t5Ss+Fap5+kg
	db5WZktiEyd/nCYPfLfAMQLtPDbcDXGOINgbSPVACTC83Xgg+9wO79pMxDhSofSfKtcgmVZV24O
	SOgu1UBRR1KKIqUc0l68gL/5pI+WMP6oOKwXSLe5LFoZVaBRGEy9GEWph1WdhaJc9hrCKl7nD8s
	ZKhzdHYWfBrdv8x5j1pRYQYx85eGlZPPIN9PviRCrf0VSBMmMzijQztY8bEKvh5n5SeaeGVzoxr
	mRRV030bZE+kkRBN4CVjR7zrS+bvnDmg5aYgSTPBV/zSwj/O7amwJsso+aizI8PHNcnuGO0BD+N
	W8fw=
X-Received: by 2002:a05:6402:44c2:b0:6a6:32f6:c with SMTP id
 4fb4d7f45d1cf-6a632f6013amr11282461a12.18.1788267168126; Tue, 01 Sep 2026
 05:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com> <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
In-Reply-To: <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 18:22:34 +0530
X-Gm-Features: AcwNN1U55mxl5Buv8KaT17jt0XFpq4P8gD6bW6R2dqKayvNk2vS1r-azwArTaqc
Message-ID: <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 09:24:35, Sreeshankar K wrote:
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
> >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > Changelog [v9]:
> > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> >   Make all clk_init_data instances const across the driver.
>
> You sent 3 versions in less than 24 hours. Please slow down.
>
> Give a chance to the reviewers to have a look at each version before
> sending a new one.


I apologize for my actions. v7 was the intended new patchset. Unfortunately
there was an interruption during submission of patches, only 08/12
patches submitted.
That's why I submitted the v8 patchset.

Regards,
Sreeshankar K
