Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699BE3451A7
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796811; cv=none; b=d37Jp9fdaU8Jac8f7y/TpkXvpg4YbGpSxUlDU5/wPwwxAICo8/5hNBtkN3hSO20F6dMRmDfODa/hzFuMd+W2B4p6kbNynEw+m6ExBphTeXePFv0LtTIN7/075N8OvD7egDZOp06NmkIYvlf3OrMhpdhHI/uHZzmzMEv0bJ49NDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796811; c=relaxed/simple;
	bh=hTZYyqvqtGqppwXg4HP3xZpz+TZopttkYVxm+x/q8Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3XqYLlqcEpqkHO7QzNfSGuxkAM8t4HJx71DuxQbXcOzNYNnaAVpXh+zcm7Ax+zX8CH+PJT+CZypnkiwPPSBzGcwjMOM2L3Ejc/P965Vg2swAS5pqu535MMYhecrVSh9ImBvA/aPBCrpEbG39QBHNo28FKV4sZhN8rzjoJlhN2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHwwspWc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHwwspWc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bcc9fdc959cso1852761566b.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779796805; x=1780401605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CoKLuje7HUGv4pGCvIBQiUOeF+gz3p4jM4FxO+bIdX0=;
        b=pHwwspWcu5HViVH9PrTg3VZGKAXTnNGteSs54531z1yqAvoQ9iBT7CEw4t9D0baKUH
         byMt2zeqQnIntjhhwu20JIzFZbDq9LEAweNjSM/QJ+ooJMiyVZM+4a1VFYcCW3lUrfkm
         e+pPq1JQ46/j0lw0YAKPCxdvoLZFK2ixC8DBCGhSSXq5YXwYfElqzUSc/uNEZQpzVYeQ
         wpTxmiHgcLyVfyrHBh4ID7utw8G10oFWuFzl3TYMXdPnb8nSgtmebQ+/E1R9DXQ+hpO8
         JiaYJ2R/MmMxrJlu5caCZgP1L7gh2ei9wZmnkuPZZMArcD2gYwFM+3qbAj6//UKppe7/
         Askg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796805; x=1780401605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoKLuje7HUGv4pGCvIBQiUOeF+gz3p4jM4FxO+bIdX0=;
        b=n9dV4b91NaahjarWUUSBdW0/VW/WZJCoOUEkc/L6yTR7XTc/1yaHU6Ik5cdlxzatqe
         4ittV11GFK3BW/Jq6SZQRsSj04K68LU70FRLYkIlASFRh+Kr2YtEIqD1YWT7Q844X0up
         BHL90mFFT80ec0uGACRDtulnNFrIemQrjpxu8qANDSeLpFdAemuVU+/CmtfbFe2m7xlX
         yt7kz3SQGsX/uTKdjv/+/GyCfquMsS2B3Y4GeafPijxV6thtuO65ItA0ak0UvSe5Rnfv
         IeMuIQ2s3gO4Y7XxCI5w8+Y4G5aNso8sqmFGl7J3OjuqEzWSGfBfKhA1M6TVir8TAFF6
         h0aQ==
X-Forwarded-Encrypted: i=1; AFNElJ88028pbxO1PMCDzr5xb/i+72Ok6RVDZTbW0OHBmm5YrseV/MpCtS5z8h5dNti0Xx3ibvCWf3UeXUEH@vger.kernel.org
X-Gm-Message-State: AOJu0YyDC02OBMe9Euf4BmpU1NDpZC2iWyHhzfDggEPQLS4qWGAXdri8
	CDquRiDSYGk0309SvlePwgtQWC0pHGMnzkwlpDNSdJNvVjlA7NfAF9wc9vtYP527gAY=
X-Gm-Gg: Acq92OFVUxdgc5u3jWoS4SJ3sPSsV2Rl+JilD/hVnWppwkac/hrPSgFv10Mp/PLjenF
	p5GuMwRGo2I2kbcJpvxaWHEacBCZK/9nv+/VqcRf9Y2w6RM8PVMLUcuRI9AGZEeMUtkaOp9Syi1
	qaBAcEerjBpBqf47xB52yskkBK+Km2/N93GQCZj3lUD5T1iW9tnB0pjuSEEH5cXoeDDqfzS57Hw
	E/4+kQne7oZnV1vOuE39zU1mQrgjTrs6gi4pcOFITDnL9DeZSDlPk9FJpAmfie5LSZxCMJVlhdr
	FroxsBndfT3VYb1rkXFRYbcFcOYL2iysvDYemfn+xfsz1SXtsM0Yiz5OoskULXwqMxG/RHS7//4
	8Cfw/p4ydSzrtDxXeTPI6l1/MyY274movogXr8T9PReG85peb+YxC2VquCOlqI5STLV0RrFsS/I
	2saOziLcoXU3oCF9wanzfFQB1ETxvt
X-Received: by 2002:a17:907:a80c:b0:bd5:ec9:e063 with SMTP id a640c23a62f3a-bdd267cae6cmr1071905766b.49.1779796804514;
        Tue, 26 May 2026 05:00:04 -0700 (PDT)
Received: from linaro.org ([77.64.147.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc61de4c4sm497740166b.42.2026.05.26.05.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:00:04 -0700 (PDT)
Date: Tue, 26 May 2026 13:59:59 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
Message-ID: <ahWLPy8vg_neYgrX@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>

On Tue, May 26, 2026 at 04:24:36PM +0530, Maulik Shah wrote:
> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
> 
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
> 
> +------------------------------------------------------------------------+
> | SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  |
> |----------------------------------------------------------- ------------|
> | Version         |        v2.7      |       v3.0        |       v3.2    |
> |------------------------------------------------------------------------|
> | Pass through    |        Yes       |       Yes         |       Yes     |
> |------------------------------------------------------------------------|
> | Secondary       |        No        |       Yes         |       Yes     |
> +------------------------------------------------------------------------+
> 
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC, PDC only does
> inversion when needed for falling edge to rising edge or level low to level
> high, as the GIC do not support falling edge/level low interrupts.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs defaulted to pass through mode with the exception of some x1e.
> 
> x1e PDC may be set to secondary controller mode for builds on CRD boards
> whereas it may be set to pass through mode for IoT-EVK boards. The mode
> configuration is done in firmware and initially shipped windows firmware
> did not have SCM interface to read or modify the PDC configuration.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> As the deepest idle state as the PDC can now wake up SoC from GPIOs and
> revert commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
> parent for now").
> 
> The series has been tested on x1e80100 CRD with both old and new firmware
> and also on kaanapali.
> 

Tested how?

I recommend testing with the tlmm-test module Bjorn added, in all
supported configurations, to make sure you don't introduce regressions
for one of them. It would be also good to provide the test results here
in the cover letter.

Thanks,
Stephan
