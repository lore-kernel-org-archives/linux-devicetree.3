Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115C3D45DD
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448540; cv=none; b=OIsfCb6OUMoFeswDQ+esR8xVnSd8qKri6Vd4LEzxzycxJu5EHwUF3OTOEVk1ZxmSkU6zGlqmQKIvmZEDzYsoB4qPtIkEm19SlLXV50w64iUNBRcT/mrQpOiEN+pteLCbWYXwazhx6JF2r/pP6klUd8gCvHPpRBu1ON5sgsUxQBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448540; c=relaxed/simple;
	bh=LJu7pBsWT1zJXh3hVKPp/YRTnhk+qoW+ynj2rFF7uKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqYVMJV1uSTA/BqzlPIcxIdKgrdFBl6Za2IwCDLErXSFef5/ZHREz9i/sHnYowroQEnR9VA3U7pKuwvqAUfZWpaMMCy43cUOCQQISLgaf4SnZ+sMZfQn5VEjeR8qocNXxB2deUR6skQGthfknrwu/QDw531rG/Lf2M5RtuQRlWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iD3bYPF9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iD3bYPF9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-459bf19e87bso4306024f8f.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779448537; x=1780053337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HN/hsx6lfR44lC83hjnSLBrsWCAhLrNXnVphsYvBado=;
        b=iD3bYPF9GaOynjGiajnEjaB2avyO8o+b75xtfZYweJLPWFORU7zIr0wvjXxx6yQK8K
         K7zv4+WhYmk4153t1CIyoFGg9qd/+x6+M90OkuOqz7nBRgHZvtn0H+Kc+FNtXXDWgOb9
         vYtJUaCAjFzl/eV+lxbLnF/BmcDxiF7T9Xa4E0jJYU1RD33HgI5VAq3B9H+2x/FasriX
         R5xOcsj1Rf9dSWE2EvAcuN3Dq0DuGjOssnUIpPKvXpAVlayVHY+K5WJ9IeaCQqsKtWXd
         oBaSrxfqCWgYtL6gzYbEjDENGSU+qw/gJwAqmrErtH2nYVdd8wyFdhBHlnTRjvafGq0C
         MTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448537; x=1780053337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HN/hsx6lfR44lC83hjnSLBrsWCAhLrNXnVphsYvBado=;
        b=T3hWah+a4TryTE66MLjp6FL/EMSsxQTW90fGYSXWJZRuyBALGnUKZd9O8U6XnHqTLa
         hFlILGcU+tsd3BILOXzkVKo69M1XRQyin0bYIcMN10sJ46gCblvCCu7vCWxf5M2p6w4V
         oiqO6lq6iugVaLnygmwjNd0rc3vSnButqFx5Atxb6upda0QSDbt5vWZEFIObVr13MFc7
         EIWPZXtY4MkB3zhBB0fNDhhQsuvZaM4G4Ss2N9725LH9nb368Ij1pO3zXnZQFkakxIzL
         VmiT90UBrd4EkpCoC01xrkLeU9cr2DbSpqpWZQBiNEHHHstGxKxmwzTsDxO3HIbqJ1HW
         vexw==
X-Forwarded-Encrypted: i=1; AFNElJ+NSY1XnK0q9R8BWSp+FrRujmak6hgmlz8Pdi+GqJibTGJCPXuAK7QV6n6VF1+/NEeyvIFzUYGPHwOF@vger.kernel.org
X-Gm-Message-State: AOJu0YxH2aofTVjHPsy+bcwjdFzHU52fLYb3eQZ6Jf3t/2tapDq3CIK7
	1IMOsXYtwgZ2Fmq6JIqsE76LRWY4PI/R3127U+szfVPmsIgjOu4mE5Wf1RBgMLQGOVc=
X-Gm-Gg: Acq92OFYOcjBRDM3TPKv9lGmSuZ3SpXAdVslkla8yNeIlB9OZWDSN7JQf21awz4gkXn
	rfnDtVcff/qPCRED62X9YAOS6a8c30xDoKNwXlVafdtjB0fzcb4uIf4deMW6rlvqfqbZODiYuAR
	pml0SSXsNVGPtIXI3gis67sHkubDYQqAfTVVeMQj0BSWk6Mvlp4V2v6jLv2CFu3w0DsxjUGFegJ
	KaieDtU6vvLL12t6gDlUTvBi+6H88bkO+QCVvd1/eG8SyXrKP3nvP86Sdpvsh6rPFmGGFf9ZUPG
	JZ5mpAkWrAD68fTuVX4iAuwbM8nJIJfI9n7ihcQEETU7u8dvSIau2nqlTtLthb3iReBRm9pc67w
	6PwBxRo6uygDN+kZu3zUMZQF8DBjxb8bHiuXZJQfrsLstLDe6qq8a4uKGBDBeLCBnWK2zYz4MXL
	IVTM1L8u6ONymB0SezHLL8ybKww+gcNOVtMaw5ILQWZFX9VSQ7oA==
X-Received: by 2002:a05:6000:26d1:b0:43d:7275:c1eb with SMTP id ffacd0b85a97d-45eb38e4a5cmr4530608f8f.39.1779448536777;
        Fri, 22 May 2026 04:15:36 -0700 (PDT)
Received: from linaro.org ([77.64.147.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm3407569f8f.30.2026.05.22.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:15:36 -0700 (PDT)
Date: Fri, 22 May 2026 13:15:04 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
Message-ID: <ahA6uEon1BNg0rsl@linaro.org>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
 <eizcoxjnjgbobjwndnq7gewqnynnm2o2aqhh4muposgnhhagaf@tnomg2p4uj27>
 <771a8f63-90d1-45b5-960e-342d9041fc4d@oss.qualcomm.com>
 <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>

On Fri, Mar 13, 2026 at 12:49:22PM +0100, Konrad Dybcio wrote:
> On 3/13/26 7:40 AM, Maulik Shah (mkshah) wrote:
> > On 3/13/2026 7:52 AM, Dmitry Baryshkov wrote:
> >> On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
> 
> [...]
> 
> >>> All the SoCs so far default uses pass through mode with the exception of
> >>
> >> Is it something that must be configured by the bootloaders?
> > 
> > yes, currently changing the the mode can be done from secure world either at boot
> > or after boot via scm write.
> 
> ..which won't work on almost any X1E devices, except CRD and IOT..
> 

FWIW: The "actively-maintained" X1E Windows laptops (e.g. T14s, Dell
XPS) have received support for the new SCM call through BIOS updates
sometime last year when the BSP was upgraded. There will, however,
always be devices that are stuck at their original launch time BIOS,
unfortunately. Those will not be able to use the SCM call.

> >>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> >>> boards whereas it may be set to pass through mode for IoT-EVK.
> >>>
> >>> There is no way to read which current mode it is set to and make PDC work
> >>> in respective mode as the read access is not opened up for non secure
> >>> world. There is though write access opened up via SCM write API to set the
> >>> mode.
> >>
> >> What are going to loose? The ability to latch the wakeup sources on the
> >> CRD?
> > 
> > CXPC (SoC level low power mode) would be lost if the device can not wake up from GPIO wakeup sources.
> 
> To the best of my understanding, that's only because your approach chooses
> to ignore supporting the secondary controller mode and force-reconfigure,
> since GPIO wakeup functionality is otherwise available regardless of the
> mode.
> 
> >>> Configure PDC mode to pass through mode for all x1e based boards via SCM
> >>> write.
> >>
> >> Would it make sense to always use the secondary mode instead?
> > 
> > No, it would not make sense to support the secondary mode in Linux.
> 
> Why?
> 
> [...]
> 
> >>> +		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
> >>> +		 *	- Prevent SoC low power mode (CxPC) as PDC is not
> >>> +		 *	  monitoring GPIO IRQs which may be needed to wake
> >>> +		 *	  the SoC from low power mode.
> >>
> >> This doesn't quite match the description of "latches the GPIO IRQs".
> > 
> > It does, PDC would continue to still latch the GPIO IRQs (as the mode change failed)
> > but PDC won't forward them to parent GIC as they are masked at PDC with __pdc_mask_intr().
> 
> Can you not refrain from masking them then, and clear them upon reception,
> with a write to IRQ_i_CFG[IRQ_STATUS]?
> 
> The HPG states that this mechanism is only engaged for GPIO IRQs and that
> the forwarded interrupt will be of LEVEL_HIGH type (which is what TLMM
> accepts anyway)
> 
> FWIW, some related work:
> c7984dc0a2b9 ("pinctrl: qcom: Add test case for TLMM interrupt handling")
> 

All these changes actually exist already. I created 3 different patch
sets for the PDC on X1E at some point:

 1. SCM call only with "no deep suspend wakeup" for older firmwares
 2. Support for secondary/auxiliary interrupt controller with fallback
    to SCM call if supported
 3. Unconditional use of secondary/auxiliary interrupt controller for
    all firmware versions

If I remember correctly, the preferred option in discussions with
Bjorn/Johan back then was to go with option (3). We wanted to support
all X1E laptops and the additional effort of supporting two different
interrupt handling approaches on a single platform did not seem worth
it. In addition, there were reported crashes when resuming from suspend
when using the SCM call approach (but not using the secondary interrupt
controller feature). The crashdump was pointing to unrelated SMMU
problems, but perhaps that was just coincidental. It could be perhaps
related to the recently fixed USB clock issue [1]. Not sure, but if we
end up using the SCM call we should test that to be sure.

I was not able to post these patches upstream back then because of
ongoing discussions about the errata handling etc, but I think Maulik
should have a copy of them. I was close to submitting option (3), it
passes all tlmm-test cases except one related to latching of interrupts
while disabled. The intended behavior of that is not well-defined in the
Linux API.

I pushed the latest draft to a public repo sometime last year. That repo
is not available anymore, but I have now restored the branch here:
https://github.com/stephan-gh/linux/commits/wip/x1e80100-6.15-pdc/

You can find details about the open test failure in this commit:
https://github.com/stephan-gh/linux/commit/59ca2a7335ede83e4a7cf02704dd7c469c725c14

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/36bbe3c6-e83d-48be-8a9c-9cbc5b26e064@oss.qualcomm.com/
