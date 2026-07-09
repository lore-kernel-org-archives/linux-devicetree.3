Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E0421EE4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600191; cv=pass; b=r0HKRU4xB8MkkWRxtj2saYHyS6VroGJ8VPuLusCffq0blf2OJA55G7OGcRWRg+1FbykJitHPY8yNlOMglX5FWXBGyThDPl4V/L/7RYlA84vm7YJ4oOLCR3E1XTJAAQFm/y8AweDxyTi1MCNGe7zTajlpkxGTVi5dtLnvuLUMCwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600191; c=relaxed/simple;
	bh=G0PslGe3kpFCA+8uA25BtvnVDVTOwMzK2ZCHyS7DQRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCr9kU2fcmVCWzCerZwUNDfuEP5Up0CjaE2ngJ64l2Zaw/b+5g24qgDkhR7f9dwtc+FX+HZsPfEdi1mcaSIOr5jXQDHy2Nvy/ctAY/ZzVlHz1jtWqlR5MMzGyFbPPtu0pLYMC1xAoWIvnHU6OMP6QapVrAoqueCRSFBAN81vPtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkQOnhR/; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkQOnhR/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1163272a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600188; cv=none;
        d=google.com; s=arc-20260327;
        b=ZNzez2vGWiq+lo+z4gStaeCrGSKJGJw4AS5zO4VPCU3TmIqT+DwIz77DafzKUNzctt
         e20JbN05aAeoyyjdJiZBA8mz2eHnc8zatLvPuRzPWhC73D/oU+PYENJfARVxJrCA5gD7
         GiXBahoa/lOVA9Hp9G3iwtSteH1r5szdV0pPFC18/gm9AFHzLRwU8S0XLz63HWId7mvL
         S2sAx3o8iWqfRVO/S1ggTmevjh9e5Gnsuti9wXXHcjNmARodJkKUhfYiZ7l5Fkyvc5uc
         XYu2yhk8tn06ckBUMnSkWxuWsIQsy2NhYQTznaWTxoODuBViBp02oGMyZywUp9cF1BTu
         FO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        fh=mQCxjQED/3UYUc3A36hvDaHGwN0DRwtnjDFTBaHO0XM=;
        b=fiYEOYhEjk4opJunFiw9B3HjQ34CPSeHmeLrazvIGIp/Fb3S3Dy1G3lzhtm9hE/4m3
         LtmE5atZb4mgteV5Lyci3pAH8qBLqDbcfLOA5j6z8o10mUlXqoFKaBwzUMkDzmc5JciF
         mW+pa70r46AoEwQjnMbLwBn9tSvImv08D8osZWKjqTXrgrNvxolNVxFMUyQ0TeGEcuKi
         Mbg6DtOaBWFOgBgnwHk2tMhPrQJICpHPK13RRqTKhqPnlXlbvUFdYNinAlkgkQ9Frymn
         A+cv6A7df2HAsEceJm8zhJQmIF2UCFFypInwp/f45UnLNdWalhf04yTlzHMSZXbMejsB
         hLyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783600188; x=1784204988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        b=VkQOnhR/Ddqqw+wqT/cgWvKtcvTaxdqPtBeE34FXH54ESVC+TUiCOKcRczC6DJfC8Z
         xa7IxjSyjK4O6agALSuw5nGm/nx7pw5iqfJFyTdVW8vcsXKd7ymmi7s6nwF2r0zJtnur
         RniMKJRbgPWKjuYmXBe4Ya6hgylfzr8ssqvBRtPT9j5Nw/5xsQFkctGChmi9gdLSn3OJ
         M9ywrP0/EP64IMooBwbbluHgj67EAMykDDyiek0svAnuOx/mF/pSQeE2cMd4JYuf/6eO
         3/RKu+v62V49guG2P3Ah9JbWLuNM31qXW4SA61eCoFQxjs34g/sLXMHbf0aEqV4grSOf
         vBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600188; x=1784204988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        b=aiCO1yri0ct8xOcxfKWNr/0IB7B4V3w6xpCMEZ7adCT+pTasBkZ17rZ6jtL36OJmOE
         IOkOsuLTKdDmVBgX7yZB2je+KCz4D9OEDn8/GX+NzS7ovhKVkbVQsrV0xZvl1jeXqFCi
         9ztYhCnSm9qn7dSGaSQQ8eXlNmknSxZwJoDMgzFkuQMBB5hEERsimMDDy+m331HQBlyu
         wKEfO8Mavx7Jm1EG7CHwK4DCLSjHUBdJrQSj/P8p6DFgDOOvs0rLbjmSZcDVAPtBByV4
         oWNAMF3caqWeQeyDVmL12bROvywfZ1kbocRf4cVMqfTuJP8ZrgnT/UbOI7ZSH814l5ET
         iGag==
X-Forwarded-Encrypted: i=1; AHgh+RoQM6vBBSwn1TtBgSLu8W7c0tfY9LzcMb8Sbp+aoDCBymeLlITaRkpUZOCfJ5jR0XzWJuCE82wwqlfK@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHT7/zn/5rEPXBBUFirMKSQmcdBgavcuTjk66WjuIAWZj4cDq
	lAz/hJ5byHIDttDBAUEseyPR73IUz+5MkGtlPeJgUtAsp2qEUNJ96MmTd8Vmsa8yfopEdljrGMf
	VPrxM6nDFH93HMdfc9ttqp6PGui6pWzn+zUrMVBxwLA==
X-Gm-Gg: AfdE7clbiHS8LbsuCNfMb0c5wSrVqU+kR12Nlkj36cb92NZkuZvkT9kIc+0okL4vZ1C
	q/jIseF7qoDQ4ZKLvjJ7BCMEk8LWJnrGV/WnBEQ+6xQ5hQ7beFGRsMUgCecsC9ccr5uEfw1ZFIm
	AA8yDndZKdoUL2GpNr6nglNoig34uO9lBVM0xWd3oNiTnWPTcw1JZF83AthaFyXxKzki0Qh1Mkj
	OREzF2p3GRHn3SmCtZ7JKrM4CkHvigJrp5fsQ38+DsXAwpn4ezHoMkKhdJ6H7V+9mlahDGQDAN9
	qmmW915jTOiaEmTgJHXTHA5lnPEQMvY=
X-Received: by 2002:a05:6402:3788:b0:698:3ce6:767f with SMTP id
 4fb4d7f45d1cf-69ab445dd6amr2888399a12.12.1783600187901; Thu, 09 Jul 2026
 05:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com> <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
 <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com> <49883bf8-1c7d-4708-9d38-07767b6b229e@kernel.org>
In-Reply-To: <49883bf8-1c7d-4708-9d38-07767b6b229e@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 13:29:36 +0100
X-Gm-Features: AUfX_mxLAIz9GenjSL4rKk7I5VYNpMJH1YlyVSe7GNzqspORApk7jhTGMyL-e6o
Message-ID: <CADrjBPq59s8A3Qp_RU_kabscafMZWUfEsGWNzKNxp0O1BSd4OA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim / Ivaylo / Krysztof

On Mon, 6 Jul 2026 at 17:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 06/07/2026 05:44, Alim Akhtar wrote:
> > Hi Ivaylo,
> > Thanks for your review.
> >
> >> -----Original Message-----
> >> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> >> Sent: Monday, July 6, 2026 4:11 AM
> >> To: Alim Akhtar <alim.akhtar@samsung.com>; krzk@kernel.org;
> >> peter.griffin@linaro.org; robh@kernel.org; conor+dt@kernel.org;
> >> linusw@kernel.org
> >> Cc: linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> >> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org;
> >> hajun.sung@samsung.com
> >> Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung
> >> Exynos8855
> >>
> >> On 6/27/26 20:12, Alim Akhtar wrote:
> >>> Add Samsung Exynos8855 smdk board to documentation
> >>>
> >>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> >>> ---
> >>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> index 753b3ba1b607..273464400477 100644
> >>> ---
> >>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-
> >> boards.yam
> >>> +++ l
> >>> @@ -235,6 +235,12 @@ properties:
> >>>                - winlink,e850-96                 # WinLink E850-96
> >>>            - const: samsung,exynos850
> >>>
> >>> +      - description: Exynos8855 based boards
> >>> +        items:
> >>> +          - enum:
> >>> +              - samsung,exynos8855-smdk         # Samsung SMDK
> >>> +          - const: samsung,exynos8855
> >>
> >> Is there any particular reason for using "exynos8855" rather than the
> >> commercial name - exynos1580? We've already established using the latter
> >> naming scheme as a convention (e.g. exynos3830 -> exynos850, exynos9830 ->
> >> exynos990) rather than the development model numbers, so I don't think
> >> breaking that will help anyone with the already painful model number confusion.
> >>
> > The reason for using Exynos8855 is that it comes from the chip-id register, which is RO register.
> > And in my opinion it has to be chip-id, maintaining two names is confusing (as you also mentioned).
> > Yes, there were couple of deviation but let's come back to the "original" convention (which is to use chip-id).
> >
> > @ Krzysztof, Peter
> > Any input on this?
>
> Back in Exynos850 upstreaming, my preference was the chipid value, but I
> agreed for marketing name. Marketing names are tricky, because:
> 1. They change,
> 2. They might multiply (two or three marketing names for the same die -
> common case in Qualcomm),
>
> That's why for Samsung SoCs, I rather prefer chipid value. For
> Google/Axis/Tesla the case is different and we should use their naming -
> some engineering name for example.

Using the chip ID value for Samsung Exynos SoCs and an engineering
name for ASICs sounds like a good approach to me.

For gs101 I also tried to document the various names in
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/arm/google.yaml.

Peter
