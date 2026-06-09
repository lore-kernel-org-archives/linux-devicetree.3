Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663A31715A
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996091; cv=none; b=buMPpoO6TRbAL++w0jPqqw97TD07/SP8z8AYQcS9fU8gI4zTFTzXS2Kj411+/K9VDhnP+Wldju2j0lq7sV10aVlCjbXC2vF7Ebz2cUEnhWbRfwZfZ73b+2ELLKGt9feRVvHKR30uEBXqwIyWMLiEniQc32tJynGweeOFuWLCVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996091; c=relaxed/simple;
	bh=onUk0eC+bj5IO02NaGoMzSwQ82L62PRWwZ9SDyCVvHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pL13gGTCcy4j2AMW+6bUIqkmAQek/ggPnS0hZKX+DzHoRMeujM+jQs9pjAFvPv4KrzwFZ4Si6SkFLn6jk4SOPWGvqqdMnEgg39j8k5PWqzy/EQaMOvcfGnqAUorjTpWHDCwdM6iCZ5JzEnUKHzcbDOckrrwCFkljfbMfesoC+qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CTTT9bOV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CTTT9bOV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600ddc4017so3724575f8f.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780996089; x=1781600889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcWe6FBXHKu/SjAvczkdQWOlNf7E5opqauX17gbFy9w=;
        b=CTTT9bOVDlOGfuyPdLAfq4WX5VpSeBwytP6Akmzrf0TPDS1UMFzXnt08zMo/b9p6aF
         rhY7GEvUmay9ysAsZR0Pl7gru200x123bbmrACMU21zJKXKSv7/SYgzLgmvcZ0OasojC
         s9hKr5MgNkPS/e+gki1h2miIsfS9XdaJ0GWjBEfM0UEeCcVkseYspK/d5KNPC8vBpwb1
         5oWTDSa9mGHW0dwUukPeEQbMXSeVku0fv1p5yfyh1zYudXeiY6dAK5QGzuGoSeiHFBaw
         +mVlS/8SLLHxNjIcq0N+NRjiNQJ81lsI/bCQB2BX5lYJ4ZHSNukoHxmeGaOR42aiQi6u
         8BuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996089; x=1781600889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcWe6FBXHKu/SjAvczkdQWOlNf7E5opqauX17gbFy9w=;
        b=Q4oycbqUypai4AnboU7l8ElVrPqq1xJ0+3WBFyA8UxtvkU3xhJkE94VRWfmvR8yqOf
         FREpUGAA2q4ucpXxE28/9kd5W5zli2L8SbeURGzOSIa5fcIsJRCDC5TQM73GLTOfP5hm
         YeAGCBL0n+S66Yw4zidHgzY3Q/G0SLL3etytML9p4HVytNOm4M9su8o482E427bR6P+i
         ahVGnWDRrtWQxDZxLRp71WhzQtP9821rxIt1GCtmPAFAMzTueaLmV/uxX+oc1lkCpgLl
         hT/Z3AT6HZmnUX9mmvh93vzupURwXfUDz38R5hdaOUa6e5o3iHFYD5Ei6OOzCzIwUyHW
         kHTg==
X-Forwarded-Encrypted: i=1; AFNElJ8kXdROdRu8toNOmniQw398BpR6C/gfgbCz2kreFjiCNqa1phgl07iJdc0Ev4VLoO8mcQZGZa+RyL1Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxXxqmvPtBaELSTiegiCrboqaOdgqgRJmHKt2f6+4iFkrI+caFF
	ObTq+ybi3s0ViievISfPoWUrLOTE2Xx/aR6TeAoNsoC1SglWuCXZNnSXzO0zzmrsopo=
X-Gm-Gg: Acq92OH/JDxEHFcKjNNztNwWyDtMkiJ3TSGXGTL2DwpjNzbJLmrloeA8my9xU8q7AnA
	6XClDAohgaE0yzCLFgJ+NFKX3Bif/4mlzknBjUPwtiJl9klUgeabv7eNXRyAynt3aiX0tYhLikm
	oQ7stkDA3OdDyj3WY/cMaS02CkpGI4lPSp3DHKjYCdRHrE+dJZJ2XEln0YP/JhEy3PWdNZTDwNb
	6JUTzGD+SfUqV5+ogXMKQZMwd8Ta/ZVrxUeYWAZqcF/J/IHbUJlNfGeQY6gL2Ou7BgbCPq7eJYC
	v6hDHJ/NjRXMiUqJQu7ac2bwPa1ymMbgT9Y6zdhvOtru8170n/cLSEmCO0POM+fc44ZEqg4HrPT
	ov4S3jDR13jOFfPhnaZCEVMqp9TS/vFG3RqY1IA99BJR1I27AoE6y9DDkpYR3O7etCk1nsasCpg
	c086GLMYA0eaw1PS1oI/WiJQWdUPzwg+3yPfd74wIX5DnCGA==
X-Received: by 2002:adf:e30e:0:b0:460:1233:ecf2 with SMTP id ffacd0b85a97d-46030609798mr22478117f8f.30.1780996088589;
        Tue, 09 Jun 2026 02:08:08 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dce6sm53232795f8f.30.2026.06.09.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:08:08 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:08:03 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <aifX80IHM8TLQiV7@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> > On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> >> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >>>>> On MDM9607, there is only a single controllable clock for the NAND
> >>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >>>>> clock ("aon") that is required by the dt-bindings. This is not really
> >>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
> >>>>> clock entry in the dt-bindings.
> >>>>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>
> >>> What is the problem in giving twice the same clock? If this is what is
> >>> done in the hardware routing, I do not see the reason for more
> >>> complexity in the binding?
> >>>
> >>
> >> I had that in my first draft for this series, but this would be wrong
> >> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> >> this platform at all. I'm not sure about MDM9607 in particular (maybe
> >> someone from Qualcomm can confirm), but a similar platform I was looking
> >> into at some point actually had *3* separate clocks for QPIC in the
> >> hardware and none of them were called "aon" ...
> > 
> > gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> > gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> > from GPLLs)
> > gcc_qpic_system_clk (32 KHz)
> > 
> > No clock containing the substring 'aon' in its name on this platform
> 
> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
> The NAND documentation says
> 
> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
> 

Thanks for looking this up.

IMO, if we want to describe the actual hardware routing, we should
describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
MDM9607).

The resulting diff would be basically the same as this patch just
inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
The complexity of the binding would be the same, so is it worth
reworking this patch? At the end, there is just one clock we can toggle
through the firmware here and I doubt anyone uses this SoC without the
RPM firmware.

Thanks,
Stephan
