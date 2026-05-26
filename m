Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE043F8EA1
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798921; cv=none; b=jwR78MXMqvwwpuhnbmOK17MIqRIgRTqaraVKdDBquwv0koUBCOabhpzfVLwrSOjtENzjaq9ucBRlUPpTbKzMfyKt0GIkK6KnXruFHF9p4gQek/TfWO2Cd9o8fe/6xEoZkJB/C/xapMxwSeWmcIIyMPyDl74hqvr4mLY/O/5Iffs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798921; c=relaxed/simple;
	bh=uPfbrIiekRdi5c+dg2yX1VDpWIrwfNRjnUuAs2MeJ/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2m6YM3Ps8K18VpQfb1sPGCdDIlgI+EvT/sZ6shqZvoEwNXS/Rh2uitkmHK/cAknuEgHzBvqKoyXdaOXo8KYIxI/mctN2yqVdLoQ6nLuUizJ47L1zvNFFFIUnU+OiWCGr4UZpa98HQnFV3jB7mzvUChZ58gNpvSn4nxovCIufPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbARjkY+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbARjkY+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-459bf19e87bso6211691f8f.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779798919; x=1780403719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+FnVwdbtAOn6T98aiA6Qvgl3nhPcMwGorw0+JjGTmQs=;
        b=vbARjkY+VkxTDWDTZz9suVzzwNiP1Z4bwHHksjhXpz0hry5MDWniviPT/x3MJeVYD+
         9doeTZosUr95wAp070Cr7lqFoe7WRcbAFjtz/B+wKXtPyVcOw/oQXJ5JimrP5DuAn05W
         0Nom8u4esgTR7AYjYRExXMV0VpEDTiUZM+oCxbskqUpI5svEDXQbyQtcLZStSdLWIKK4
         BhFRwPsDNnjZ5tQcYZ+WeUIlC47B97XBY9Sn2r6aAnZ/3X7m3wlLV3NsXhswrdOz8+kq
         vUUIovd80OnOesopANQhwjP/G2LNN7K/BnQsSYaCveDC4NTPW+s24HUnq+lyQAdwIvHT
         TDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798919; x=1780403719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FnVwdbtAOn6T98aiA6Qvgl3nhPcMwGorw0+JjGTmQs=;
        b=a525YXPa11/yA/bbcLZzhIi2bdNibdKQ6PU0FMGgqLSyn4jpkAgOpCT48vLi7wMlKz
         vJpNzsk3+auETQFkPZ+gQ0gtCVSWKtPvUdrVpGb/2MhH9zZhA0yt6jeDAdZYeQIkzGR4
         TK5lhEnkUGuQu+qLC49rLKIZn0h12OnRFtPBM57bOicoSdFnMBykNDQ7fXWtq1lubyOy
         Z+OGabt5KH+Q2yS2r5kLiB0QKB70CW0St2p7TNOENblgzNPupwS/pIkZmVmRamSqmsA7
         L/1FfCC+QHC9y2qEGmokcvfRYaZGvr8i9K38PDXqSXFzavieYIefv6OEzqlI5lrGgfdc
         5Jqg==
X-Forwarded-Encrypted: i=1; AFNElJ+9bBc6btcunO8s/yWNAvriCnCUyg64lq3zLEYzqTOAnGcKbyBbVx+oIL0yJuXJmOOKFUJuTpv5bUs2@vger.kernel.org
X-Gm-Message-State: AOJu0YzdPgZYU9xiNLNGPuWD5ECMHB7y46DORl1ZHYZvyrJUlBgpCimB
	bWI2f+az5UcOX4lpVPaPMk2fiPE00His60z5SlWQ+pUkl80o0e1QoEowyVbmT8vvsXM=
X-Gm-Gg: Acq92OE324XtFwuHslLlWLndysqFy5cZlDLhPJWObiKo76AFFT+2rlUZiO+cYWM53xM
	gJZSHtem13hbOrLEWbaP5W59jtgku0Rttr/9xjwUCZ3nttK8t0YJ58xHzXn7lIHrI1AHiaMQ30Z
	qULcClQvyJZidAmxvGP+JvW9jz4ftfcVKTwEUzNc/Py+k+QGEvpHNv5PkByT1VshRnB5VOaPJfB
	xOUHCj8ToAZAN4f9yXWyW/CR2twKbZ9MpWk81Lmk2Z45sAV/8PTb81cpRKrb6xeyF9P4lMMSyyz
	2AuEuprvszZQy2MxZSeV96QRwYXG+rP88SFSIZM492F3GRiA6Nlu0mwh6dAHV85Qc5lYoP+qNeF
	3DMOIFE0bR0y0FoEuYNFX6R1n3qADYK5UFhs4zRyjGiameoaGSCSkJPtF/Qh0Y0V/dwbSXtbE72
	y8n1MDg4z1dkbUWb5nwEg2fS/gkzU9
X-Received: by 2002:a05:6000:25e3:b0:45e:739c:f187 with SMTP id ffacd0b85a97d-45eb38c5329mr29111131f8f.22.1779798918558;
        Tue, 26 May 2026 05:35:18 -0700 (PDT)
Received: from linaro.org ([77.64.147.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6bc5479sm37517812f8f.0.2026.05.26.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:35:18 -0700 (PDT)
Date: Tue, 26 May 2026 14:34:46 +0200
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
Subject: Re: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
Message-ID: <ahWTZj727RCNZPR9@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>

On Tue, May 26, 2026 at 04:24:39PM +0530, Maulik Shah wrote:
> pdc->enable_intr() function already points to respective version
> specific enable function. pdc_enable_intr() now only kept as wrapper.
> Remove the wrapper and invoke pdc->enable_intr() from caller.
> 
> Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
> however its only required for pdc_enable_intr_bank() which uses
> a shared bank across all interrupts. pdc_enable_intr_cfg() do not
> required locking as IRQ_CFG registers are one per interrupt. Move
> locking accordingly.

Well, pdc_enable_intr_cfg() is still a read-modify-write. If two CPUs
read IRQ_i_CFG at the same time and modify different bits (e.g. enable
and type bits) then write back the modified register one of the
modifications will get lost. Can we be sure that this won't happen?

Perhaps we can since PDC has IRQCHIP_SET_TYPE_MASKED, but personally
I would keep the lock there to be sure, especially with the new GPIO
operations you add that also read-modify-write the same register..

Thanks,
Stephan
